# Modul 06 — Form dan Server Actions

**Durasi:** ± 3 jam · **Prasyarat:** Modul 05

## Tujuan
- Menangani form dengan Server Action dan `useActionState`.
- Mengamankan Server Action: sesi, otorisasi, validasi, nilai kembalian.
- Memperbarui cache setelah menyimpan.

## Konsep
Server Action adalah fungsi di file `'use server'` yang dapat dipanggil dari form. **Anggap Server Action sebagai endpoint publik**: siapa pun dapat memanggilnya lewat POST. Karena itu setiap action wajib:
1. memeriksa sesi dan hak akses **sendiri** (bukan mengandalkan page atau proxy);
2. memvalidasi input dengan skema (Zod);
3. mengembalikan data minimal tanpa pesan error mentah;
4. memperbarui cache dengan `updateTag`.

## Contoh
```ts
'use server';

import { updateTag } from 'next/cache';
import { z } from 'zod';

export async function tambahSupplier(_sebelum: HasilSimpan, formData: FormData): Promise<HasilSimpan> {
  const pengguna = await penggunaSaatIni();
  if (pengguna === null) {
    return { status: 'gagal', pesan: 'Sesi berakhir. Silakan login ulang.' };
  }
  const hasil = supplierBaruSchema.safeParse({
    namaSupplier: formData.get('namaSupplier'),
    kota: formData.get('kota'),
  });
  if (!hasil.success) {
    return { status: 'gagal', pesan: 'Periksa kembali isian.', galatField: z.flattenError(hasil.error).fieldErrors };
  }
  await simpanSupplier(hasil.data);
  updateTag('suppliers');
  return { status: 'sukses', pesan: 'Supplier tersimpan.' };
}
```

```tsx
'use client';

const [hasil, aksi, isPending] = useActionState(tambahSupplier, { status: 'awal', pesan: '' });
return <form action={aksi}>…<button disabled={isPending}>Simpan</button></form>;
```

## Latihan
1. Tambahkan field `email` dengan validasi `z.email()`. Tampilkan pesan error per field.
2. Hapus pemeriksaan sesi dari action, lalu panggil action itu dari halaman tanpa cookie sesi. Apa yang terjadi? Kembalikan pemeriksaannya.
3. Ganti `updateTag` dengan tidak memanggil apa pun. Perhatikan daftar supplier tidak berubah setelah menyimpan.

## Cek pemahaman
- Mengapa pemeriksaan login di `page.tsx` tidak cukup untuk melindungi Server Action?
- Apa beda `updateTag` dan `revalidateTag(tag, 'max')`?

## Kaitan standar
NXT-306, NXT-401, NXT-402, NXT-403, NXT-404, RCT-407
