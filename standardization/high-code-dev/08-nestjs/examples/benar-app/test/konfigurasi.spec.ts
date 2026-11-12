// NST-602, NST-701: konfigurasi tanpa IdP ditolak saat start.
import { describe, expect, it } from 'vitest';

import { validasiKonfigurasi } from '../src/konfigurasi/konfigurasi.js';

const lengkap = {
  DATABASE_URL: 'postgres://app:rahasia@localhost:5432/app',
  AUTH_ISSUER: 'https://idp.contoh.id/realms/pandawa',
  AUTH_AUDIENCE: 'supplier-api',
  AUTH_JWKS_URL: 'https://idp.contoh.id/realms/pandawa/protocol/openid-connect/certs',
};

describe('validasiKonfigurasi', () => {
  it('menerima konfigurasi lengkap dan mengisi nilai default', () => {
    const hasil = validasiKonfigurasi(lengkap);
    expect(hasil.PORT).toBe(3000);
    expect(hasil.CORS_ORIGINS).toEqual([]);
  });

  it('menolak start bila AUTH_ISSUER tidak ada (verifikasi token tidak bisa dimatikan)', () => {
    expect(() => validasiKonfigurasi({ ...lengkap, AUTH_ISSUER: undefined })).toThrow(
      /AUTH_ISSUER/,
    );
    expect(() => validasiKonfigurasi({ ...lengkap, AUTH_ISSUER: '' })).toThrow(/AUTH_ISSUER/);
  });
});
