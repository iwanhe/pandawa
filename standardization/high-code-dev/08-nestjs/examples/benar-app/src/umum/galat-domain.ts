// NST-501, NST-503: error bisnis memakai kode terdaftar dan dipisah dari error teknis.
import { HttpStatus } from '@nestjs/common';

export const KODE_GALAT = {
  SUPPLIER_TIDAK_ADA: { kode: 'SUP-0404', status: HttpStatus.NOT_FOUND },
  SUPPLIER_DUPLIKAT: { kode: 'SUP-0409', status: HttpStatus.CONFLICT },
  IDEMPOTENSI_BEDA_ISI: { kode: 'IDM-0422', status: HttpStatus.UNPROCESSABLE_ENTITY },
  IDEMPOTENSI_DIPROSES: { kode: 'IDM-0409', status: HttpStatus.CONFLICT },
} as const;

export type NamaKodeGalat = keyof typeof KODE_GALAT;

export class GalatDomain extends Error {
  readonly kode: string;
  readonly status: HttpStatus;

  constructor(nama: NamaKodeGalat, pesan: string) {
    super(pesan);
    this.name = 'GalatDomain';
    this.kode = KODE_GALAT[nama].kode;
    this.status = KODE_GALAT[nama].status;
  }
}
