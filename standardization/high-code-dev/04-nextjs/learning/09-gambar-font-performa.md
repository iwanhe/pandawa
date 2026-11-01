# Modul 09 — Gambar, Font, dan Performa

**Durasi:** ± 2 jam · **Prasyarat:** Modul 08

## Tujuan
- Mengoptimalkan gambar dan font.
- Menjaga ukuran JavaScript tetap kecil.
- Membaca hasil build dan Lighthouse.

## Konsep
- `next/image` mengubah ukuran dan format gambar otomatis serta mencegah layout shift. Selalu isi `alt` dan ukuran (`width`/`height` atau `fill`).
- `next/font` meng-host font bersama aset aplikasi. Bila server build tidak punya akses internet, gunakan `next/font/local` dengan file font di repo.
- Setiap `'use client'` menambah JavaScript. Pustaka berat (grafik, editor) dimuat dengan `next/dynamic` hanya saat dibutuhkan.
- Jalankan `next build` lalu `next start`, kemudian ukur dengan Lighthouse di jendela incognito.

## Contoh
```tsx
import Image from 'next/image';
import localFont from 'next/font/local';

const inter = localFont({ src: './fonts/Inter-Variable.woff2', display: 'swap' });

<Image src="/logo-pandawa.png" alt="Logo PANDAWA" width={120} height={40} />
```

```tsx
'use client';

import dynamic from 'next/dynamic';

const GrafikPenjualan = dynamic(() =>
  import('./GrafikPenjualan').then((m) => m.GrafikPenjualan),
);
```

## Latihan
1. Ganti satu `<img>` menjadi `<Image>`. Bandingkan ukuran file gambar di tab Network.
2. Pasang font lokal di `layout.tsx` dan periksa tidak ada request ke domain font luar.
3. Jalankan Lighthouse untuk `/supplier` dan catat skor Performance serta LCP.

## Cek pemahaman
- Mengapa `<Image>` mencegah layout shift?
- Kapan `next/dynamic` bermanfaat?

## Kaitan standar
NXT-601, NXT-602, NXT-603, NXT-604, NXT-605
