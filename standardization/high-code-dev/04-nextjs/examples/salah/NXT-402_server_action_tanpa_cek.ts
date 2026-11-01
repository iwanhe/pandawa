'use server';

// MELANGGAR: NXT-402 (tanpa cek sesi/otorisasi), NXT-403 (input tidak divalidasi),
// NXT-404 (mengembalikan objek internal dan pesan error mentah),
// NXT-306 (cache tidak diperbarui), JS-503 (error dibungkus tanpa cause).
interface SupplierRow {
  supplierId: number;
  namaSupplier: string;
  nomorRekening: string;
}

const tabel: SupplierRow[] = [];

export async function tambahSupplier(formData: FormData): Promise<SupplierRow | string> {
  try {
    const row = {
      supplierId: tabel.length + 1,
      namaSupplier: formData.get('namaSupplier') as string,
      nomorRekening: formData.get('rekening') as string,
    };
    tabel.push(row);
    await Promise.resolve();
    return row;
  } catch (error) {
    if (error instanceof Error) {
      return error.message;
    }
    throw new Error('gagal');
  }
}
