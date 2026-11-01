# Modul 05 — Mengambil Data dan Caching

**Durasi:** ± 3 jam · **Prasyarat:** Modul 04

## Tujuan
- Mengambil data di Server Component lewat Data Access Layer (DAL).
- Mengatur cache dengan `'use cache'`, `cacheLife`, dan `cacheTag`.
- Membungkus data per-request dengan `<Suspense>`.

## Konsep
- **DAL** adalah satu modul server-only per fitur yang menjadi satu-satunya jalan ke data. Pemeriksaan hak akses dan penyaringan DTO dilakukan di sini.
- Dengan **Cache Components** aktif, data **tidak di-cache** kecuali Anda menuliskannya:
  - `'use cache'` di awal fungsi;
  - `cacheLife('hours')` menentukan umur cache (pasangkan selalu);
  - `cacheTag('suppliers')` memberi label agar cache dapat diperbarui setelah mutasi.
- Komponen yang membaca `cookies()`, `headers()`, `searchParams`, atau `connection()` hanya diketahui saat request. Bungkus dengan `<Suspense>` agar bagian lain halaman tetap dapat diprerender.
- Request yang tidak saling bergantung dijalankan paralel dengan `Promise.all`.

## Contoh
```ts
import 'server-only';

import { cacheLife, cacheTag } from 'next/cache';

export async function daftarSupplier(): Promise<SupplierDto[]> {
  'use cache';
  cacheLife('hours');
  cacheTag('suppliers');
  const rows = await db.query('select ... from supplier'); // query berparameter
  return rows.map(keDto);
}
```

```tsx
<Suspense fallback={<p role="status">Memuat supplier…</p>}>
  <SupplierList />
</Suspense>
```

## Latihan
1. Hapus `cacheLife('hours')` lalu jalankan build. Bandingkan kolom Revalidate/Expire di keluaran build.
2. Buat fungsi `ringkasanDashboard()` yang memanggil tiga fungsi DAL. Tulis versi berurutan dan versi `Promise.all`, lalu ukur waktunya.
3. Buat komponen yang membaca `cookies()` tanpa `<Suspense>` dan jalankan build. Baca pesan errornya, lalu perbaiki.

## Cek pemahaman
- Apa beda data yang di-cache dan data yang di-stream?
- Mengapa `cacheLife` sebaiknya ditulis di fungsi yang sama dengan `'use cache'`?

## Kaitan standar
NXT-301, NXT-302, NXT-303, NXT-304, NXT-305, NXT-307
