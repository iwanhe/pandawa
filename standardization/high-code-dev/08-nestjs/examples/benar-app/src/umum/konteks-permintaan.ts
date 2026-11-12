// NST-801: ID korelasi mengikuti satu permintaan dari awal sampai akhir.
import { AsyncLocalStorage } from 'node:async_hooks';
import { randomUUID } from 'node:crypto';

import type { NextFunction, Request, Response } from 'express';

const penyimpanan = new AsyncLocalStorage<{ correlationId: string }>();

export function correlationIdSekarang(): string {
  return penyimpanan.getStore()?.correlationId ?? 'tanpa-konteks';
}

const POLA_ID = /^[\w-]{8,100}$/;

export function pasangCorrelationId(req: Request, res: Response, next: NextFunction): void {
  const kiriman = req.header('x-correlation-id');
  const correlationId = kiriman !== undefined && POLA_ID.test(kiriman) ? kiriman : randomUUID();
  res.setHeader('X-Correlation-Id', correlationId);
  penyimpanan.run({ correlationId }, next);
}
