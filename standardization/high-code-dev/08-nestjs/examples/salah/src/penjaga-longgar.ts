// CONTOH SALAH (NST-602): verifikasi token bisa dimatikan lewat konfigurasi.
// Pola ini ditemukan di spike: bila AUTH_ISSUER kosong, semua permintaan lolos.
import { Injectable } from '@nestjs/common';
import type { CanActivate, ExecutionContext } from '@nestjs/common';

@Injectable()
export class PenjagaLonggar implements CanActivate {
  canActivate(ctx: ExecutionContext): boolean {
    if (!process.env.AUTH_ISSUER) {
      // SALAH NST-602, NST-702
      return true;
    }
    const req = ctx.switchToHttp().getRequest();
    return Boolean(req.headers.authorization); // SALAH NST-601: hanya cek ada header, tanda tangan tidak diverifikasi
  }
}
