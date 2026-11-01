# Modul 03 — Halaman, Layout, dan Navigasi

**Durasi:** ± 2 jam · **Prasyarat:** Modul 02

## Tujuan
- Membuat layout bersama dan halaman.
- Membaca parameter route dinamis dengan benar.
- Bernavigasi dengan `<Link>`.

## Konsep
- `layout.tsx` membungkus semua halaman di bawahnya dan **tidak** dirender ulang saat berpindah halaman.
- `page.tsx` adalah isi halaman. Hanya file konvensi seperti ini yang boleh memakai `export default`.
- Di Next.js 16, `params` dan `searchParams` adalah **Promise** sehingga harus di-`await`.
- `<Link>` melakukan prefetch dan navigasi tanpa memuat ulang halaman. Jangan memakai `<a>` untuk link internal.

## Contoh
```tsx
// src/app/supplier/[supplierId]/page.tsx
import { notFound } from 'next/navigation';

import { supplierById } from '@/features/supplier/supplier-dal';

interface Props {
  readonly params: Promise<{ supplierId: string }>;
}

export default async function DetailSupplier({ params }: Props) {
  const { supplierId } = await params;
  const id = Number.parseInt(supplierId, 10);
  if (!Number.isInteger(id) || id <= 0) {
    notFound();
  }
  const supplier = await supplierById(id);
  if (supplier === null) {
    notFound();
  }
  return <h1>{supplier.namaSupplier}</h1>;
}
```

```tsx
import Link from 'next/link';

<Link href={`/supplier/${String(s.supplierId)}`}>{s.namaSupplier}</Link>
```

## Latihan
1. Buat `src/app/supplier/layout.tsx` berisi judul "Modul Supplier" dan menu navigasi ke `/supplier`.
2. Ubah link detail supplier memakai `<Link>`. Coba tulis `<a href="/supplier/1">` dan lihat temuan ESLint-nya.
3. Buka `/supplier/abc` dan pastikan halaman 404 yang tampil.

## Cek pemahaman
- Mengapa `params.supplierId` tanpa `await` salah di Next.js 16?
- Kapan memakai `notFound()` dibanding mengembalikan `null`?

## Kaitan standar
NXT-104, NXT-105, NXT-502, NXT-504
