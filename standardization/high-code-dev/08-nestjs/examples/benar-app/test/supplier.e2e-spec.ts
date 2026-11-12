// NST-902: uji e2e terhadap PostgreSQL sungguhan, termasuk keamanan, validasi, dan idempotensi.
import type { Server } from 'node:http';

import type { INestApplication } from '@nestjs/common';
import { Test } from '@nestjs/testing';
import { DataSource } from 'typeorm';
import { createLocalJWKSet, exportJWK, generateKeyPair, SignJWT } from 'jose';
import request from 'supertest';
import { afterAll, beforeAll, describe, expect, it } from 'vitest';

import { aturAplikasi } from '../src/aplikasi.js';
import { KUNCI_JWKS } from '../src/keamanan/keamanan.js';

const ISSUER = 'https://idp.contoh.id/realms/pandawa';
const AUDIENCE = 'supplier-api';

process.env.AUTH_ISSUER = ISSUER;
process.env.AUTH_AUDIENCE = AUDIENCE;
process.env.AUTH_JWKS_URL = `${ISSUER}/protocol/openid-connect/certs`;
process.env.DATABASE_URL ??= 'postgres://postgres@localhost:5432/standar_nestjs';

let app: INestApplication<Server>;
let tokenPengelola: string;
let tokenPembaca: string;

const { AppModule } = await import('../src/app.module.js');

async function buatToken(
  privateKey: Parameters<SignJWT['sign']>[0],
  peran: string[],
): Promise<string> {
  return new SignJWT({ realm_access: { roles: peran } })
    .setProtectedHeader({ alg: 'RS256', kid: 'uji' })
    .setSubject('pengguna-uji')
    .setIssuer(ISSUER)
    .setAudience(AUDIENCE)
    .setExpirationTime('5m')
    .sign(privateKey);
}

function http() {
  return request(app.getHttpServer());
}

const supplierValid = {
  kode: 'SUP-001',
  nama: 'PT Sumber Makmur',
  kota: 'Kudus',
  batasKredit: '1250000.50',
};

beforeAll(async () => {
  const { publicKey, privateKey } = await generateKeyPair('RS256');
  const jwk = { ...(await exportJWK(publicKey)), kid: 'uji', alg: 'RS256' };
  tokenPengelola = await buatToken(privateKey, ['pengelola-supplier']);
  tokenPembaca = await buatToken(privateKey, ['pembaca']);

  const modul = await Test.createTestingModule({ imports: [AppModule] })
    .overrideProvider(KUNCI_JWKS)
    .useValue(createLocalJWKSet({ keys: [jwk] }))
    .compile();
  app = aturAplikasi(modul.createNestApplication<INestApplication<Server>>());
  await app.init();
  await app.get(DataSource).query('truncate supplier, outbox, idempotensi restart identity');
});

afterAll(async () => {
  await app.close();
});

describe('Supplier API', () => {
  it('health check dapat diakses tanpa token', async () => {
    await http().get('/api/sehat/hidup').expect(200, { status: 'ok' });
    await http().get('/api/sehat/siap').expect(200);
  });

  it('menolak permintaan tanpa token dengan model error standar', async () => {
    const res = await http().get('/api/v1/supplier').expect(401);
    expect(res.body).toMatchObject({ success: false, errors: [{ code: 'AUTH-0401' }] });
    expect(res.body.correlationId).toBe(res.headers['x-correlation-id']);
  });

  it('menolak pengguna tanpa peran pengelola', async () => {
    await http()
      .post('/api/v1/supplier')
      .auth(tokenPembaca, { type: 'bearer' })
      .set('Idempotency-Key', 'kunci-uji-0001')
      .send(supplierValid)
      .expect(403);
  });

  it('menolak isian tidak valid dan field tak dikenal', async () => {
    const res = await http()
      .post('/api/v1/supplier')
      .auth(tokenPengelola, { type: 'bearer' })
      .set('Idempotency-Key', 'kunci-uji-0002')
      .send({ ...supplierValid, batasKredit: 1250000.5, nomorRekening: '123' })
      .expect(400);
    expect(res.body.errors[0].code).toBe('VAL-0400');

    await http()
      .post('/api/v1/supplier')
      .auth(tokenPengelola, { type: 'bearer' })
      .send(supplierValid)
      .expect(400);
  });

  it('menyimpan supplier, menulis outbox, dan mengulang respons untuk kunci yang sama', async () => {
    const pertama = await http()
      .post('/api/v1/supplier')
      .auth(tokenPengelola, { type: 'bearer' })
      .set('Idempotency-Key', 'kunci-uji-0003')
      .send(supplierValid)
      .expect(201);
    expect(pertama.body).toMatchObject({ kode: 'SUP-001', batasKredit: '1250000.50' });

    const ulang = await http()
      .post('/api/v1/supplier')
      .auth(tokenPengelola, { type: 'bearer' })
      .set('Idempotency-Key', 'kunci-uji-0003')
      .send(supplierValid)
      .expect(201);
    expect(ulang.body).toEqual(pertama.body);

    const [{ jumlah }] = await app
      .get(DataSource)
      .query<[{ jumlah: number }]>('select count(*)::int as jumlah from outbox');
    expect(jumlah).toBe(1);
  });

  it('menolak kunci yang sama dengan isi berbeda, dan kode duplikat', async () => {
    const beda = await http()
      .post('/api/v1/supplier')
      .auth(tokenPengelola, { type: 'bearer' })
      .set('Idempotency-Key', 'kunci-uji-0003')
      .send({ ...supplierValid, nama: 'PT Lain' })
      .expect(422);
    expect(beda.body.errors[0].code).toBe('IDM-0422');

    const duplikat = await http()
      .post('/api/v1/supplier')
      .auth(tokenPengelola, { type: 'bearer' })
      .set('Idempotency-Key', 'kunci-uji-0004')
      .send(supplierValid)
      .expect(409);
    expect(duplikat.body.errors[0].code).toBe('SUP-0409');
  });

  it('membatasi ukuran halaman dan mengembalikan 404 bila supplier tidak ada', async () => {
    await http()
      .get('/api/v1/supplier?ukuran=500')
      .auth(tokenPembaca, { type: 'bearer' })
      .expect(400);
    const daftar = await http()
      .get('/api/v1/supplier?ukuran=10')
      .auth(tokenPembaca, { type: 'bearer' })
      .expect(200);
    expect(daftar.body).toMatchObject({ halaman: 1, ukuran: 10, total: 1 });

    const kosong = await http()
      .get('/api/v1/supplier/999')
      .auth(tokenPembaca, { type: 'bearer' })
      .expect(404);
    expect(kosong.body.errors[0].code).toBe('SUP-0404');
  });
});
