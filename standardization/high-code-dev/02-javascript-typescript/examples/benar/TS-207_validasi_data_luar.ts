// TS-207, JS-803, TS-201: data dari luar bertipe unknown dan diperiksa sebelum dipakai.

export interface Vendor {
  readonly vendorId: number;
  readonly vendorName: string;
}

function isRecord(nilai: unknown): nilai is Record<string, unknown> {
  return typeof nilai === 'object' && nilai !== null;
}

export function parseVendor(nilai: unknown): Vendor {
  if (!isRecord(nilai)) {
    throw new TypeError('vendor harus berupa objek');
  }
  const { vendorId, vendorName } = nilai;
  if (typeof vendorId !== 'number' || typeof vendorName !== 'string') {
    throw new TypeError('vendorId atau vendorName tidak valid');
  }
  return { vendorId, vendorName };
}
