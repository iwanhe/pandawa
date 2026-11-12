// Pengaturan aplikasi dipakai bersama oleh main.ts dan test e2e.
// NST-306, NST-604, NST-801, NST-805.
import { VersioningType } from '@nestjs/common';
import type { INestApplication } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

import type { Konfigurasi } from './konfigurasi/konfigurasi.js';
import { pasangCorrelationId } from './umum/konteks-permintaan.js';

export function aturAplikasi<T extends INestApplication>(app: T): T {
  const config = app.get<ConfigService<Konfigurasi, true>>(ConfigService);
  app.use(pasangCorrelationId);
  app.useSecurityHeaders();
  app.enableCors({ origin: config.get('CORS_ORIGINS', { infer: true }) });
  app.setGlobalPrefix('api');
  app.enableVersioning({ type: VersioningType.URI });
  app.enableShutdownHooks();
  return app;
}
