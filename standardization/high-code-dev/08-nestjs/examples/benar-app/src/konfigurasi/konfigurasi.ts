// NST-701, NST-602, NST-606: konfigurasi divalidasi saat start; aplikasi gagal start bila
// tidak valid. Konfigurasi IdP wajib, sehingga verifikasi token tidak dapat dimatikan.
import { z } from 'zod';

export const skemaKonfigurasi = z.object({
  NODE_ENV: z.enum(['development', 'test', 'production']).default('development'),
  PORT: z.coerce.number().int().min(1).max(65_535).default(3000),
  DATABASE_URL: z.url({ protocol: /^postgres(ql)?$/ }),
  AUTH_ISSUER: z.url(),
  AUTH_AUDIENCE: z.string().min(1),
  AUTH_JWKS_URL: z.url(),
  CORS_ORIGINS: z
    .string()
    .default('')
    .transform((nilai) => nilai.split(',').filter((asal) => asal !== '')),
});

export type Konfigurasi = z.infer<typeof skemaKonfigurasi>;

export function validasiKonfigurasi(env: Record<string, unknown>): Konfigurasi {
  const hasil = skemaKonfigurasi.safeParse(env);
  if (!hasil.success) {
    throw new Error(`Konfigurasi tidak valid: ${z.prettifyError(hasil.error)}`);
  }
  return hasil.data;
}
