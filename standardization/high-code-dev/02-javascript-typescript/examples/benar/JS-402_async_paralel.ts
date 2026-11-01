// JS-401, JS-402, JS-403, JS-501, JS-503: async/await, promise selalu ditangani,
// operasi independen paralel, error berupa Error dengan cause.

export interface Supplier {
  readonly kodeSupplier: string;
  readonly namaSupplier: string;
}

export type AmbilSupplier = (kode: string) => Promise<Supplier>;

export async function ambilBanyakSupplier(
  ambil: AmbilSupplier,
  daftarKode: readonly string[],
): Promise<Supplier[]> {
  try {
    return await Promise.all(daftarKode.map((kode) => ambil(kode)));
  } catch (error) {
    throw new Error(`ambil supplier ${daftarKode.join(',')}`, { cause: error });
  }
}
