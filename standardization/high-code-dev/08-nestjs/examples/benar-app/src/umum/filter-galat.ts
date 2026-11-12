// NST-501, NST-502: satu model error untuk semua respons gagal.
// Detail teknis hanya ditulis ke log, tidak dikirim ke klien.
import { Catch, HttpException, HttpStatus, Logger } from '@nestjs/common';
import type { ArgumentsHost, ExceptionFilter } from '@nestjs/common';
import type { Response } from 'express';

import { correlationIdSekarang } from './konteks-permintaan.js';
import { GalatDomain } from './galat-domain.js';

export interface ResponsGalat {
  readonly success: false;
  readonly correlationId: string;
  readonly errors: readonly { readonly code: string; readonly message: string }[];
}

const KODE_HTTP: Partial<Record<number, string>> = {
  [HttpStatus.BAD_REQUEST]: 'VAL-0400',
  [HttpStatus.UNAUTHORIZED]: 'AUTH-0401',
  [HttpStatus.FORBIDDEN]: 'AUTH-0403',
  [HttpStatus.NOT_FOUND]: 'HTTP-0404',
  [HttpStatus.TOO_MANY_REQUESTS]: 'HTTP-0429',
};

function pesanHttp(galat: HttpException): string {
  const isi = galat.getResponse();
  if (typeof isi === 'object' && 'message' in isi) {
    const { message } = isi;
    return Array.isArray(message) ? message.join('; ') : String(message);
  }
  return galat.message;
}

@Catch()
export class FilterGalat implements ExceptionFilter {
  private readonly logger = new Logger(FilterGalat.name);

  catch(galat: unknown, host: ArgumentsHost): void {
    const res = host.switchToHttp().getResponse<Response>();
    const correlationId = correlationIdSekarang();
    let status: number = HttpStatus.INTERNAL_SERVER_ERROR;
    let error = { code: 'SYS-0500', message: 'Terjadi kesalahan teknis.' };

    if (galat instanceof GalatDomain) {
      status = galat.status;
      error = { code: galat.kode, message: galat.message };
    } else if (galat instanceof HttpException) {
      status = galat.getStatus();
      error = { code: KODE_HTTP[status] ?? `HTTP-${String(status)}`, message: pesanHttp(galat) };
    } else {
      this.logger.error({ message: 'galat tidak tertangani', correlationId, galat });
    }

    const body: ResponsGalat = { success: false, correlationId, errors: [error] };
    res.status(status).json(body);
  }
}
