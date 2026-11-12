// NST-205, NST-402, NST-404, NST-406, NST-407: akses data terpisah dari logika bisnis.
// Semua query berparameter; operasi tulis berjalan di EntityManager transaksi pemanggil.
import { Injectable } from '@nestjs/common';
import { InjectDataSource } from '@nestjs/typeorm';
import { DataSource } from 'typeorm';
import type { EntityManager } from 'typeorm';

import { SupplierEntity } from './supplier.entity.js';
import type { SupplierBaru } from './supplier.schema.js';

export interface CatatanIdempotensi {
  readonly sidik: string;
  readonly statusHttp: number | null;
  readonly respons: unknown;
}

export interface PesanOutbox {
  readonly jenis: string;
  readonly kunciAgregat: string;
  readonly muatan: unknown;
}

export interface HasilIdempotensi {
  readonly statusHttp: number;
  readonly respons: unknown;
}

@Injectable()
export class SupplierRepository {
  constructor(@InjectDataSource() private readonly dataSource: DataSource) {}

  transaksi<T>(kerja: (manager: EntityManager) => Promise<T>): Promise<T> {
    return this.dataSource.transaction(kerja);
  }

  async daftar(halaman: number, ukuran: number): Promise<[SupplierEntity[], number]> {
    return this.dataSource.getRepository(SupplierEntity).findAndCount({
      order: { supplierId: 'ASC' },
      skip: (halaman - 1) * ukuran,
      take: ukuran,
    });
  }

  async byId(supplierId: number): Promise<SupplierEntity | null> {
    return this.dataSource
      .getRepository(SupplierEntity)
      .findOneBy({ supplierId: String(supplierId) });
  }

  async kodeSudahAda(manager: EntityManager, kode: string): Promise<boolean> {
    return manager.getRepository(SupplierEntity).existsBy({ kode });
  }

  async simpan(manager: EntityManager, data: SupplierBaru): Promise<SupplierEntity> {
    const repo = manager.getRepository(SupplierEntity);
    return repo.save(repo.create(data));
  }

  async tambahOutbox(manager: EntityManager, pesan: PesanOutbox): Promise<void> {
    await manager.query('insert into outbox (jenis, kunci_agregat, muatan) values ($1, $2, $3)', [
      pesan.jenis,
      pesan.kunciAgregat,
      JSON.stringify(pesan.muatan),
    ]);
  }

  /** Mengklaim kunci idempotensi. Mengembalikan null bila kunci baru; selain itu catatan lama. */
  async klaimIdempotensi(
    manager: EntityManager,
    kunci: string,
    sidik: string,
  ): Promise<CatatanIdempotensi | null> {
    const baru: unknown[] = await manager.query(
      'insert into idempotensi (kunci, sidik) values ($1, $2) on conflict (kunci) do nothing returning kunci',
      [kunci, sidik],
    );
    if (baru.length > 0) {
      return null;
    }
    const lama: { sidik: string; status_http: number | null; respons: unknown }[] =
      await manager.query('select sidik, status_http, respons from idempotensi where kunci = $1', [
        kunci,
      ]);
    const [catatan] = lama;
    if (catatan === undefined) {
      throw new Error(`Catatan idempotensi ${kunci} hilang`);
    }
    return { sidik: catatan.sidik, statusHttp: catatan.status_http, respons: catatan.respons };
  }

  async selesaikanIdempotensi(
    manager: EntityManager,
    kunci: string,
    hasil: HasilIdempotensi,
  ): Promise<void> {
    await manager.query('update idempotensi set status_http = $2, respons = $3 where kunci = $1', [
      kunci,
      hasil.statusHttp,
      JSON.stringify(hasil.respons),
    ]);
  }
}
