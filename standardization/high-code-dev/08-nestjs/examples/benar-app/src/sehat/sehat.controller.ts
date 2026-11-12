// NST-803: liveness dan readiness, tanpa token dan tanpa versi.
import {
  Controller,
  Get,
  HttpCode,
  ServiceUnavailableException,
  VERSION_NEUTRAL,
} from '@nestjs/common';
import { InjectDataSource } from '@nestjs/typeorm';
import { DataSource } from 'typeorm';

import { Publik } from '../keamanan/keamanan.js';

@Controller({ path: 'sehat', version: VERSION_NEUTRAL })
@Publik()
export class SehatController {
  constructor(@InjectDataSource() private readonly dataSource: DataSource) {}

  @Get('hidup')
  @HttpCode(200)
  hidup(): { status: 'ok' } {
    return { status: 'ok' };
  }

  @Get('siap')
  async siap(): Promise<{ status: 'ok' }> {
    try {
      await this.dataSource.query('select 1');
    } catch (galat) {
      throw new ServiceUnavailableException('Database tidak dapat dijangkau', { cause: galat });
    }
    return { status: 'ok' };
  }
}
