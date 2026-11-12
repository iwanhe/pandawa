// CONTOH SALAH: jangan ditiru. Setiap pelanggaran diberi ID aturannya.
import {
  Body,
  Controller,
  forwardRef,
  Get,
  Inject,
  Injectable,
  Post,
  Query,
  Scope,
} from '@nestjs/common';
import { DataSource } from 'typeorm';

import { PenjagaLonggar } from './index.js'; // SALAH NST-105: impor lewat barrel

@Injectable({ scope: Scope.REQUEST }) // SALAH NST-203: request scope tanpa alasan
export class SupplierService {
  constructor(@Inject(forwardRef(() => DataSource)) private readonly db: DataSource) {} // SALAH NST-105

  async cari(nama: string): Promise<any> {
    // SALAH TS-201: any
    // SALAH NST-402: SQL disusun dengan menyambung string input pengguna
    return this.db.query(`select * from supplier where nama like '%${nama}%'`);
  }
}

@Controller('supplier') // SALAH NST-306: tanpa versi API
export class SupplierController {
  constructor(
    private readonly db: DataSource,
    private readonly service: SupplierService,
  ) {}

  @Get()
  async daftar(@Query('nama') nama: string, @Query('limit') limit: string): Promise<any> {
    console.log('cari supplier', nama); // SALAH NST-801: console.log, bukan Logger JSON
    if (nama) {
      return this.service.cari(nama);
    }
    // SALAH NST-304: ukuran halaman tidak dibatasi
    return this.db.query('select * from supplier limit ' + limit);
  }

  @Post()
  async tambah(@Body() body: any): Promise<any> {
    // SALAH NST-201, NST-301: logika bisnis dan validasi manual di controller, body tanpa skema
    if (!body.kode) {
      return { error: 'kode wajib' }; // SALAH NST-501: status 200 untuk error, format tidak standar
    }
    try {
      // SALAH NST-403: uang disimpan sebagai number
      body.batasKredit = parseFloat(body.batasKredit);
      // SALAH NST-302: entity dikembalikan langsung ke klien
      return await this.db.getRepository('supplier').save(body);
    } catch (e) {
      return { error: String(e) }; // SALAH NST-502: pesan teknis database bocor ke klien
    }
  }
}

export { PenjagaLonggar };
