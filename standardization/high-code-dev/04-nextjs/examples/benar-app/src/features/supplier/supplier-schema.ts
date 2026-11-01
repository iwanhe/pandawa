// NXT-403: skema validasi dipakai di server untuk semua input.
import { z } from 'zod';

export const supplierBaruSchema = z.object({
  namaSupplier: z.string().trim().min(3, 'Nama minimal 3 karakter').max(100),
  kota: z.string().trim().min(2, 'Kota wajib diisi').max(60),
});

export type SupplierBaru = z.infer<typeof supplierBaruSchema>;
