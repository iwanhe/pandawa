# Modul 10 — Testing dan Deployment

**Durasi:** ± 3 jam · **Prasyarat:** Modul 09

## Tujuan
- Menulis unit test untuk Client Component dan fungsi.
- Menyiapkan uji end-to-end untuk alur penting.
- Membangun image container dengan `output: 'standalone'`.

## Konsep
- **Unit test** (Vitest + React Testing Library) untuk Client Component, skema Zod, dan fungsi murni. Uji dari sudut pengguna: `getByRole`, `userEvent`.
- **Async Server Component** belum didukung Vitest; ujinya lewat **E2E** dengan Playwright terhadap hasil `next build` + `next start`.
- **CI** menjalankan berurutan: `npm ci`, `typecheck`, `lint`, test, `next build`. Semua wajib lulus sebelum merge.
- **Deployment self-hosted:** `output: 'standalone'` menghasilkan folder `.next/standalone` yang dapat dijalankan tanpa `node_modules` lengkap. Jalankan container sebagai user non-root dan set `NEXT_TELEMETRY_DISABLED=1`.

## Contoh
```ts
// supplier-schema.test.ts
import { describe, expect, it } from 'vitest';

import { supplierBaruSchema } from './supplier-schema';

describe('supplierBaruSchema', () => {
  it('menolak nama yang terlalu pendek', () => {
    const hasil = supplierBaruSchema.safeParse({ namaSupplier: 'AB', kota: 'Kudus' });
    expect(hasil.success).toBe(false);
  });
});
```

```dockerfile
FROM node:22-slim AS runner
WORKDIR /app
ENV NODE_ENV=production NEXT_TELEMETRY_DISABLED=1
COPY .next/standalone ./
COPY .next/static ./.next/static
COPY public ./public
USER node
EXPOSE 3000
CMD ["node", "server.js"]
```

## Latihan
1. Tulis test untuk `supplierBaruSchema` yang mencakup kasus valid dan dua kasus tidak valid.
2. Tulis satu test Playwright: buka `/supplier`, isi form, simpan, dan pastikan pesan sukses muncul.
3. Bangun image di atas dan jalankan `docker run -p 3000:3000`. Buka aplikasi di browser.

## Cek pemahaman
- Mengapa halaman async diuji lewat E2E, bukan unit test?
- Apa isi folder `.next/standalone` dan mengapa image jadi lebih kecil?

## Kaitan standar
NXT-702, NXT-703, NXT-705, NXT-801, NXT-802, RCT-901
