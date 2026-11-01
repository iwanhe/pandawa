# Modul 07 — Loading, Error, dan Not Found

**Durasi:** ± 2 jam · **Prasyarat:** Modul 06

## Tujuan
- Menampilkan status memuat dengan `loading.tsx` dan `<Suspense>`.
- Menangani error per segmen dengan `error.tsx` dan untuk seluruh aplikasi dengan `global-error.tsx`.
- Menampilkan 404 dengan `notFound()` dan `not-found.tsx`.

## Konsep
- `loading.tsx` otomatis membungkus `page.tsx` di segmen yang sama dengan `<Suspense>`.
- `error.tsx` harus Client Component (`'use client'`). Ia menerima `error` dan `reset`. Catat `error` ke sistem log, tetapi **jangan tampilkan** `error.message` ke pengguna.
- `global-error.tsx` menangani error di root layout; ia harus memuat `<html>` dan `<body>` sendiri.
- `notFound()` menghentikan render dan menampilkan `not-found.tsx` terdekat dengan status 404.

## Contoh
```tsx
'use client';

import { useEffect } from 'react';

export default function GalatSupplier({
  error,
  reset,
}: {
  readonly error: Error & { digest?: string };
  readonly reset: () => void;
}) {
  useEffect(() => {
    console.error(error); // kirim ke sistem log
  }, [error]);

  return (
    <div role="alert">
      <p>Data supplier gagal dimuat.</p>
      <button type="button" onClick={reset}>Coba lagi</button>
    </div>
  );
}
```

## Latihan
1. Lempar error sengaja dari `daftarSupplier()` dan amati `error.tsx` bekerja. Klik "Coba lagi".
2. Hapus `error.tsx` di segmen supplier dan ulangi. Error ditangani di mana sekarang?
3. Buat `not-found.tsx` khusus segmen `/supplier` dengan tautan kembali ke daftar.

## Cek pemahaman
- Mengapa `error.tsx` harus Client Component?
- Apa gunanya `error.digest`?

## Kaitan standar
NXT-103, NXT-307, NXT-501, NXT-502, RCT-902, RCT-904
