// NST-405: Idempotency-Key wajib untuk POST yang membuat data.
// @Headers() tidak menerima skema/pipe, jadi header dibaca lewat decorator parameter khusus.
import { BadRequestException, createParamDecorator } from '@nestjs/common';
import type { ExecutionContext } from '@nestjs/common';
import type { Request } from 'express';
import { z } from 'zod';

const skemaKunciIdempotensi = z.string().regex(/^[\w-]{8,100}$/);

export const KunciIdempotensi = createParamDecorator(
  (_data: unknown, ctx: ExecutionContext): string => {
    const nilai = ctx.switchToHttp().getRequest<Request>().header('idempotency-key');
    const hasil = skemaKunciIdempotensi.safeParse(nilai);
    if (!hasil.success) {
      throw new BadRequestException(
        'Header Idempotency-Key wajib diisi (8-100 karakter huruf, angka, _ atau -)',
      );
    }
    return hasil.data;
  },
);
