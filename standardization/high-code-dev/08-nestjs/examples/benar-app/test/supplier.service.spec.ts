// NST-901: uji unit service lewat Test.createTestingModule dengan repository palsu.
import { Test } from '@nestjs/testing';
import type { EntityManager } from 'typeorm';
import { beforeEach, describe, expect, it, vi } from 'vitest';

import { GalatDomain } from '../src/umum/galat-domain.js';
import { SupplierRepository } from '../src/supplier/supplier.repository.js';
import { SupplierService } from '../src/supplier/supplier.service.js';
import type { SupplierEntity } from '../src/supplier/supplier.entity.js';

// Objek kosong: repository palsu tidak memakai manager, cukup diteruskan apa adanya.
const manager = Object.create(null) as EntityManager;
const data = {
  kode: 'SUP-001',
  nama: 'PT Sumber Makmur',
  kota: 'Kudus',
  batasKredit: '1250000.50',
};

function repoPalsu() {
  return {
    transaksi: vi.fn((kerja: (m: EntityManager) => Promise<unknown>) => kerja(manager)),
    daftar: vi.fn(),
    byId: vi.fn(),
    kodeSudahAda: vi.fn().mockResolvedValue(false),
    simpan: vi.fn().mockResolvedValue({
      supplierId: '7',
      ...data,
      dibuatPada: new Date(),
    } satisfies SupplierEntity),
    tambahOutbox: vi.fn(),
    klaimIdempotensi: vi.fn().mockResolvedValue(null),
    selesaikanIdempotensi: vi.fn(),
  };
}

describe('SupplierService', () => {
  let service: SupplierService;
  let repo: ReturnType<typeof repoPalsu>;

  beforeEach(async () => {
    repo = repoPalsu();
    const modul = await Test.createTestingModule({
      providers: [SupplierService, { provide: SupplierRepository, useValue: repo }],
    }).compile();
    service = modul.get(SupplierService);
  });

  it('menyimpan supplier baru dan menulis outbox di transaksi yang sama', async () => {
    const hasil = await service.tambah(data, 'kunci-uji-0001');
    expect(hasil).toEqual({ supplierId: 7, ...data });
    expect(repo.tambahOutbox).toHaveBeenCalledWith(manager, {
      jenis: 'supplier.dibuat',
      kunciAgregat: '7',
      muatan: hasil,
    });
    expect(repo.selesaikanIdempotensi).toHaveBeenCalledWith(manager, 'kunci-uji-0001', {
      statusHttp: 201,
      respons: hasil,
    });
  });

  it('menolak kode duplikat dengan GalatDomain, bukan error teknis', async () => {
    repo.kodeSudahAda.mockResolvedValue(true);
    await expect(service.tambah(data, 'kunci-uji-0002')).rejects.toMatchObject({
      kode: 'SUP-0409',
      status: 409,
    });
    expect(repo.simpan).not.toHaveBeenCalled();
  });

  it('mengulang respons tersimpan bila kunci dan isi sama', async () => {
    const tersimpan = await service.tambah(data, 'kunci-uji-0003');
    const sidik = (repo.klaimIdempotensi.mock.calls[0] as [EntityManager, string, string])[2];
    repo.klaimIdempotensi.mockResolvedValue({ sidik, statusHttp: 201, respons: tersimpan });
    repo.simpan.mockClear();

    await expect(service.tambah(data, 'kunci-uji-0003')).resolves.toEqual(tersimpan);
    expect(repo.simpan).not.toHaveBeenCalled();
  });

  it('melempar SUPPLIER_TIDAK_ADA bila id tidak ditemukan', async () => {
    repo.byId.mockResolvedValue(null);
    await expect(service.byId(99)).rejects.toBeInstanceOf(GalatDomain);
  });
});
