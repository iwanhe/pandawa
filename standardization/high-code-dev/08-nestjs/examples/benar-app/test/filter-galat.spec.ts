// NST-501, NST-502: model error standar, tanpa detail teknis ke klien.
import { Logger, NotFoundException } from '@nestjs/common';
import type { ArgumentsHost } from '@nestjs/common';
import { describe, expect, it, vi } from 'vitest';

import { FilterGalat } from '../src/umum/filter-galat.js';
import { GalatDomain } from '../src/umum/galat-domain.js';

function hostPalsu() {
  const res = { status: vi.fn().mockReturnThis(), json: vi.fn() };
  const host = {
    switchToHttp: () => ({ getResponse: () => res, getRequest: () => ({}) }),
  } as unknown as ArgumentsHost;
  return { res, host };
}

describe('FilterGalat', () => {
  const filter = new FilterGalat();

  it('memetakan GalatDomain ke status dan kodenya', () => {
    const { res, host } = hostPalsu();
    filter.catch(new GalatDomain('SUPPLIER_DUPLIKAT', 'Kode sudah terdaftar'), host);
    expect(res.status).toHaveBeenCalledWith(409);
    expect(res.json).toHaveBeenCalledWith(
      expect.objectContaining({
        success: false,
        errors: [{ code: 'SUP-0409', message: 'Kode sudah terdaftar' }],
      }),
    );
  });

  it('memetakan HttpException bawaan Nest', () => {
    const { res, host } = hostPalsu();
    filter.catch(new NotFoundException(), host);
    expect(res.status).toHaveBeenCalledWith(404);
  });

  it('menyembunyikan pesan error teknis di balik SYS-0500', () => {
    const { res, host } = hostPalsu();
    Logger.overrideLogger(false);
    filter.catch(new Error('relation "supplier" does not exist'), host);
    expect(res.status).toHaveBeenCalledWith(500);
    const body = res.json.mock.calls[0]?.[0] as { errors: { code: string; message: string }[] };
    expect(body.errors[0]?.code).toBe('SYS-0500');
    expect(JSON.stringify(body)).not.toContain('does not exist');
  });
});
