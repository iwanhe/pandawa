# Modul 01 — Dasar React dan TypeScript yang Dibutuhkan

**Durasi:** ± 3 jam · **Prasyarat:** JavaScript dasar

## Tujuan
Setelah modul ini Anda dapat:
- membuat komponen fungsi dengan props bertipe;
- memakai `useState` dan event handler;
- merender list dengan `key` yang benar.

## Konsep
- **Komponen** adalah fungsi yang mengembalikan JSX. Namanya PascalCase (`SupplierCard`), karena JSX menganggap nama huruf kecil sebagai tag HTML.
- **Props** adalah masukan komponen, bersifat read-only. Tipenya ditulis dengan `interface`.
- **State** adalah data milik komponen yang memicu render ulang saat berubah. Jangan diubah langsung; selalu buat nilai baru.
- **key** pada list harus ID yang stabil, bukan index.

## Contoh
```tsx
interface SupplierCardProps {
  readonly nama: string;
  readonly kota: string;
}

export function SupplierCard({ nama, kota }: SupplierCardProps) {
  return (
    <article>
      <h2>{nama}</h2>
      <p>{kota}</p>
    </article>
  );
}
```

```tsx
'use client';

import { useState } from 'react';

export function Penghitung() {
  const [jumlah, setJumlah] = useState(0);
  return (
    <button type="button" onClick={() => setJumlah((n) => n + 1)}>
      Diklik {jumlah} kali
    </button>
  );
}
```

## Latihan
1. Buat komponen `DaftarSupplier` yang menerima `suppliers: readonly { supplierId: number; nama: string }[]` dan menampilkannya sebagai `<ul>`. Gunakan `supplierId` sebagai `key`.
2. Tambahkan pesan "Belum ada supplier." bila daftar kosong. Pastikan Anda **tidak** menulis `{suppliers.length && ...}`.
3. Jalankan `npm run lint` dan perbaiki semua temuan.

## Cek pemahaman
- Mengapa `key={index}` bermasalah saat list diurutkan ulang?
- Apa yang salah dengan `items.push(x); setItems(items);`?

## Kaitan standar
RCT-103, RCT-202, RCT-206, RCT-307, RCT-408, JS-104
