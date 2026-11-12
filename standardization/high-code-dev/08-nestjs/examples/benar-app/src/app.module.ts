// NST-601, NST-701, NST-501, NST-301: konfigurasi tervalidasi, guard, filter, dan pipe global.
import { Module, StandardSchemaValidationPipe } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { APP_FILTER, APP_GUARD, APP_PIPE } from '@nestjs/core';
import { TypeOrmModule } from '@nestjs/typeorm';

import { PenjagaToken, penyediaKunciJwks } from './keamanan/keamanan.js';
import { validasiKonfigurasi } from './konfigurasi/konfigurasi.js';
import type { Konfigurasi } from './konfigurasi/konfigurasi.js';
import { SehatController } from './sehat/sehat.controller.js';
import { SupplierModule } from './supplier/supplier.module.js';
import { FilterGalat } from './umum/filter-galat.js';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true, validate: validasiKonfigurasi }),
    TypeOrmModule.forRootAsync({
      inject: [ConfigService],
      useFactory: (config: ConfigService<Konfigurasi, true>) => ({
        type: 'postgres',
        url: config.get('DATABASE_URL', { infer: true }),
        autoLoadEntities: true,
        synchronize: false, // skema dikelola migrasi (NST-401)
      }),
    }),
    SupplierModule,
  ],
  controllers: [SehatController],
  providers: [
    penyediaKunciJwks,
    { provide: APP_GUARD, useClass: PenjagaToken },
    { provide: APP_FILTER, useClass: FilterGalat },
    { provide: APP_PIPE, useValue: new StandardSchemaValidationPipe() },
  ],
})
export class AppModule {}
