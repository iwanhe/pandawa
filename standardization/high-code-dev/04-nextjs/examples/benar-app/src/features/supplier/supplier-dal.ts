// NXT-202, NXT-203, NXT-303, NXT-304: Data Access Layer khusus server.
// Hanya modul ini yang mengakses sumber data; hasilnya DTO yang aman dikirim ke klien.
import 'server-only';

import { cacheLife, cacheTag } from 'next/cache';

import type { SupplierBaru } from './supplier-schema';

// Simulasi tabel database (di proyek nyata: query berparameter ke PostgreSQL/ORDS).
interface SupplierRow {
  supplierId: number;
  namaSupplier: string;
  kota: string;
  nomorRekening: string; // data rahasia: tidak boleh sampai ke klien
}

const tabelSupplier: SupplierRow[] = [
  { supplierId: 1, namaSupplier: 'PT Sumber Makmur', kota: 'Kudus', nomorRekening: 'x' },
  { supplierId: 2, namaSupplier: 'CV Tembakau Jaya', kota: 'Temanggung', nomorRekening: 'y' },
];

export interface SupplierDto {
  readonly supplierId: number;
  readonly namaSupplier: string;
  readonly kota: string;
}

function keDto({ supplierId, namaSupplier, kota }: SupplierRow): SupplierDto {
  return { supplierId, namaSupplier, kota };
}

export async function daftarSupplier(): Promise<SupplierDto[]> {
  'use cache';
  cacheLife('hours');
  cacheTag('suppliers');
  await Promise.resolve();
  return tabelSupplier.map(keDto);
}

export async function supplierById(supplierId: number): Promise<SupplierDto | null> {
  'use cache';
  cacheLife('hours');
  cacheTag('suppliers', `supplier-${String(supplierId)}`);
  await Promise.resolve();
  const row = tabelSupplier.find((s) => s.supplierId === supplierId);
  return row === undefined ? null : keDto(row);
}

export async function simpanSupplier(data: SupplierBaru): Promise<SupplierDto> {
  await Promise.resolve();
  const row: SupplierRow = { supplierId: tabelSupplier.length + 1, ...data, nomorRekening: '' };
  tabelSupplier.push(row);
  return keDto(row);
}
