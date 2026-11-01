'use server';

// NXT-401, NXT-402, NXT-403, NXT-404, NXT-306: Server Action diperlakukan sebagai endpoint publik:
// cek sesi, validasi input, kembalikan data minimal, lalu perbarui cache.
import { updateTag } from 'next/cache';
import { z } from 'zod';

import { penggunaSaatIni } from '@/lib/auth';

import { simpanSupplier } from './supplier-dal';
import { supplierBaruSchema } from './supplier-schema';

export interface HasilSimpan {
  readonly status: 'awal' | 'sukses' | 'gagal';
  readonly pesan: string;
  readonly galatField?: Partial<Record<'namaSupplier' | 'kota', string[]>>;
}

export async function tambahSupplier(
  _sebelum: HasilSimpan,
  formData: FormData,
): Promise<HasilSimpan> {
  const pengguna = await penggunaSaatIni();
  if (pengguna === null) {
    return { status: 'gagal', pesan: 'Sesi berakhir. Silakan login ulang.' };
  }

  const hasil = supplierBaruSchema.safeParse({
    namaSupplier: formData.get('namaSupplier'),
    kota: formData.get('kota'),
  });
  if (!hasil.success) {
    return {
      status: 'gagal',
      pesan: 'Periksa kembali isian.',
      galatField: z.flattenError(hasil.error).fieldErrors,
    };
  }

  const supplier = await simpanSupplier(hasil.data);
  updateTag('suppliers');
  return { status: 'sukses', pesan: `Supplier ${supplier.namaSupplier} tersimpan.` };
}
