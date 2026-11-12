import 'reflect-metadata';

import { ConsoleLogger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';

import { AppModule } from './app.module.js';
import { aturAplikasi } from './aplikasi.js';
import type { Konfigurasi } from './konfigurasi/konfigurasi.js';

// NST-801: log JSON satu baris per entri.
const app = await NestFactory.create(AppModule, { logger: new ConsoleLogger({ json: true }) });
aturAplikasi(app);
await app.listen(
  app.get<ConfigService<Konfigurasi, true>>(ConfigService).get('PORT', { infer: true }),
);
