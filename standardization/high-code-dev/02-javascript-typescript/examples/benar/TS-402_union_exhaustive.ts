// TS-401, TS-402, TS-403: union literal, discriminated union, switch exhaustive.

export type StatusDokumen = 'draft' | 'diajukan' | 'disetujui' | 'ditolak';

export type HasilKirim =
  | { readonly status: 'sukses'; readonly nomorDokumen: string }
  | { readonly status: 'gagal'; readonly kodeError: string; readonly pesan: string };

export function labelStatus(status: StatusDokumen): string {
  switch (status) {
    case 'draft':
      return 'Draf';
    case 'diajukan':
      return 'Menunggu persetujuan';
    case 'disetujui':
      return 'Disetujui';
    case 'ditolak':
      return 'Ditolak';
    default: {
      const tidakMungkin: never = status;
      return tidakMungkin;
    }
  }
}

export function ringkasHasil(hasil: HasilKirim): string {
  return hasil.status === 'sukses'
    ? `Terkirim: ${hasil.nomorDokumen}`
    : `Gagal ${hasil.kodeError}: ${hasil.pesan}`;
}
