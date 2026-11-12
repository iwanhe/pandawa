// NST-301, NST-302, NST-305: skema Zod untuk semua input; daftar dipaginasi dengan batas.
import { z } from 'zod';

export const skemaSupplierBaru = z.strictObject({
  kode: z
    .string()
    .trim()
    .regex(/^[A-Z0-9-]{3,20}$/, 'Kode 3–20 karakter huruf besar, angka, atau -'),
  nama: z.string().trim().min(3).max(100),
  kota: z.string().trim().min(2).max(60),
  batasKredit: z
    .string()
    .regex(
      /^\d{1,16}(\.\d{1,2})?$/,
      'Nominal desimal sebagai string, maks. 2 angka di belakang koma',
    ),
});
export type SupplierBaru = z.infer<typeof skemaSupplierBaru>;

export const skemaDaftarSupplier = z.object({
  halaman: z.coerce.number().int().min(1).default(1),
  ukuran: z.coerce.number().int().min(1).max(100).default(20),
});
export type QueryDaftarSupplier = z.infer<typeof skemaDaftarSupplier>;

export interface SupplierDto {
  readonly supplierId: number;
  readonly kode: string;
  readonly nama: string;
  readonly kota: string;
  readonly batasKredit: string;
}

export interface HalamanDto<T> {
  readonly data: readonly T[];
  readonly halaman: number;
  readonly ukuran: number;
  readonly total: number;
}
