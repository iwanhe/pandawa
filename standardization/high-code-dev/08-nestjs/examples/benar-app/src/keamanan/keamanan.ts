// NST-601, NST-602, NST-603: guard global memverifikasi token OIDC dari IdP.
// Tidak ada saklar untuk mematikannya; endpoint publik harus ditandai @Publik().
import { ForbiddenException, Inject, Injectable, UnauthorizedException } from '@nestjs/common';
import type { CanActivate, ExecutionContext } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Reflector } from '@nestjs/core';
import type { Request } from 'express';
import { createRemoteJWKSet, jwtVerify } from 'jose';
import type { JWTPayload, JWTVerifyGetKey } from 'jose';

import type { Konfigurasi } from '../konfigurasi/konfigurasi.js';

/** Endpoint yang boleh dipanggil tanpa token, mis. health check. */
export const Publik = Reflector.createDecorator<boolean>({ transform: () => true });
/** Peran yang wajib dimiliki pemanggil (salah satu). */
export const Peran = Reflector.createDecorator<string[]>();

export const KUNCI_JWKS = Symbol('KUNCI_JWKS');

export const penyediaKunciJwks = {
  provide: KUNCI_JWKS,
  inject: [ConfigService],
  useFactory: (config: ConfigService<Konfigurasi, true>): JWTVerifyGetKey =>
    createRemoteJWKSet(new URL(config.get('AUTH_JWKS_URL', { infer: true }))),
};

export interface Pengguna {
  readonly userId: string;
  readonly peran: readonly string[];
}

export type PermintaanTerautentikasi = Request & { pengguna?: Pengguna };

@Injectable()
export class PenjagaToken implements CanActivate {
  constructor(
    private readonly reflector: Reflector,
    private readonly config: ConfigService<Konfigurasi, true>,
    @Inject(KUNCI_JWKS) private readonly kunci: JWTVerifyGetKey,
  ) {}

  async canActivate(ctx: ExecutionContext): Promise<boolean> {
    const sasaran = [ctx.getHandler(), ctx.getClass()];
    if (this.reflector.getAllAndOverride(Publik, sasaran)) {
      return true;
    }

    const req = ctx.switchToHttp().getRequest<PermintaanTerautentikasi>();
    const [jenis, token] = (req.header('authorization') ?? '').split(' ');
    if (jenis !== 'Bearer' || token === undefined || token === '') {
      throw new UnauthorizedException('Token wajib disertakan');
    }

    let klaim: JWTPayload;
    try {
      ({ payload: klaim } = await jwtVerify(token, this.kunci, {
        issuer: this.config.get('AUTH_ISSUER', { infer: true }),
        audience: this.config.get('AUTH_AUDIENCE', { infer: true }),
        algorithms: ['RS256'],
      }));
    } catch {
      throw new UnauthorizedException('Token tidak sah');
    }

    const akses = klaim.realm_access as { roles?: unknown } | undefined;
    const peran = Array.isArray(akses?.roles)
      ? akses.roles.filter((p) => typeof p === 'string')
      : [];
    req.pengguna = { userId: klaim.sub ?? '', peran };

    // Bernilai undefined saat runtime bila handler tidak memakai @Peran.
    const perlu = this.reflector.getAllAndOverride<string[] | undefined>(Peran.KEY, sasaran);
    if (perlu !== undefined && !perlu.some((p) => peran.includes(p))) {
      throw new ForbiddenException(`Perlu peran: ${perlu.join(', ')}`);
    }
    return true;
  }
}
