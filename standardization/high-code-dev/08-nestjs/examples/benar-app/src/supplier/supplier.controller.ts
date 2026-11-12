// NST-201, NST-301, NST-303, NST-306, NST-307: controller tipis, input divalidasi skema,
// versi di path, status HTTP eksplisit.
import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  ParseIntPipe,
  Post,
  Query,
} from '@nestjs/common';

import { Peran } from '../keamanan/keamanan.js';
import { KunciIdempotensi } from '../umum/kunci-idempotensi.js';
import { SupplierService } from './supplier.service.js';
import { skemaDaftarSupplier, skemaSupplierBaru } from './supplier.schema.js';
import type {
  HalamanDto,
  QueryDaftarSupplier,
  SupplierBaru,
  SupplierDto,
} from './supplier.schema.js';

@Controller({ path: 'supplier', version: '1' })
export class SupplierController {
  constructor(private readonly service: SupplierService) {}

  @Get()
  daftar(
    @Query({ schema: skemaDaftarSupplier }) query: QueryDaftarSupplier,
  ): Promise<HalamanDto<SupplierDto>> {
    return this.service.daftar(query);
  }

  @Get(':supplierId')
  byId(@Param('supplierId', ParseIntPipe) supplierId: number): Promise<SupplierDto> {
    return this.service.byId(supplierId);
  }

  @Post()
  @HttpCode(HttpStatus.CREATED)
  @Peran(['pengelola-supplier'])
  tambah(
    @Body({ schema: skemaSupplierBaru }) data: SupplierBaru,
    @KunciIdempotensi() kunci: string,
  ): Promise<SupplierDto> {
    return this.service.tambah(data, kunci);
  }
}
