// NST-201, NST-304, NST-404, NST-406, NST-407: logika bisnis di service.
// Satu transaksi: kunci idempotensi, data supplier, dan pesan outbox.
import { createHash } from 'node:crypto';

import { HttpStatus, Injectable } from '@nestjs/common';

import { GalatDomain } from '../umum/galat-domain.js';
import { SupplierRepository } from './supplier.repository.js';
import type { SupplierEntity } from './supplier.entity.js';
import type {
  HalamanDto,
  QueryDaftarSupplier,
  SupplierBaru,
  SupplierDto,
} from './supplier.schema.js';

function keDto(entity: SupplierEntity): SupplierDto {
  return {
    supplierId: Number(entity.supplierId),
    kode: entity.kode,
    nama: entity.nama,
    kota: entity.kota,
    batasKredit: entity.batasKredit,
  };
}

function sidikDari(data: SupplierBaru): string {
  return createHash('sha256').update(JSON.stringify(data)).digest('hex');
}

@Injectable()
export class SupplierService {
  constructor(private readonly repo: SupplierRepository) {}

  async daftar({ halaman, ukuran }: QueryDaftarSupplier): Promise<HalamanDto<SupplierDto>> {
    const [baris, total] = await this.repo.daftar(halaman, ukuran);
    return { data: baris.map(keDto), halaman, ukuran, total };
  }

  async byId(supplierId: number): Promise<SupplierDto> {
    const entity = await this.repo.byId(supplierId);
    if (entity === null) {
      throw new GalatDomain('SUPPLIER_TIDAK_ADA', `Supplier ${String(supplierId)} tidak ditemukan`);
    }
    return keDto(entity);
  }

  async tambah(data: SupplierBaru, kunciIdempotensi: string): Promise<SupplierDto> {
    const sidik = sidikDari(data);
    return this.repo.transaksi(async (manager) => {
      const lama = await this.repo.klaimIdempotensi(manager, kunciIdempotensi, sidik);
      if (lama !== null) {
        if (lama.sidik !== sidik) {
          throw new GalatDomain(
            'IDEMPOTENSI_BEDA_ISI',
            'Idempotency-Key sudah dipakai untuk isi yang berbeda',
          );
        }
        if (lama.statusHttp === null) {
          throw new GalatDomain(
            'IDEMPOTENSI_DIPROSES',
            'Permintaan dengan kunci ini masih diproses',
          );
        }
        return lama.respons as SupplierDto;
      }

      if (await this.repo.kodeSudahAda(manager, data.kode)) {
        throw new GalatDomain('SUPPLIER_DUPLIKAT', `Kode supplier ${data.kode} sudah terdaftar`);
      }

      const dto = keDto(await this.repo.simpan(manager, data));
      await this.repo.tambahOutbox(manager, {
        jenis: 'supplier.dibuat',
        kunciAgregat: String(dto.supplierId),
        muatan: dto,
      });
      await this.repo.selesaikanIdempotensi(manager, kunciIdempotensi, {
        statusHttp: HttpStatus.CREATED,
        respons: dto,
      });
      return dto;
    });
  }
}
