# Contoh Kode — NestJS

```
examples/
├── benar-app/                    API supplier NestJS 12; tsc, ESLint, dan 16 test lulus
│   ├── db/migrasi/V1__supplier.sql   tabel supplier, outbox, idempotensi (format Flyway)
│   ├── src/
│   │   ├── main.ts                   bootstrap, log JSON
│   │   ├── aplikasi.ts               header keamanan, CORS, prefix /api, versi URI, shutdown hook
│   │   ├── app.module.ts             konfigurasi tervalidasi, TypeORM, guard/filter/pipe global
│   │   ├── konfigurasi/              skema Zod untuk variabel lingkungan
│   │   ├── keamanan/                 guard OIDC (jose + JWKS), @Publik, @Peran
│   │   ├── umum/                     model error, GalatDomain, correlationId, decorator Idempotency-Key
│   │   ├── sehat/                    /api/sehat/hidup dan /api/sehat/siap
│   │   └── supplier/                 module, controller, service, repository, schema, entity
│   ├── test/                         unit (*.spec.ts) dan e2e (*.e2e-spec.ts)
│   ├── Dockerfile, .dockerignore     image multi-stage non-root
│   └── env.contoh                   daftar variabel lingkungan
└── salah/
    └── src/                          controller gemuk, SQL dari string, guard yang bisa dimatikan, barrel, forwardRef
```

## Menjalankan

Dari folder `08-nestjs` (Node 24, npm):

```bash
cp npmrc.template .npmrc
npm ci
npm run typecheck
npm run lint          # harus 0 temuan
npm run lint:salah    # harus menampilkan pelanggaran
npm test              # uji unit, tanpa database
```

Uji e2e butuh PostgreSQL 16 kosong dengan migrasi dijalankan:

```bash
createdb standar_nestjs
psql -d standar_nestjs -f examples/benar-app/db/migrasi/V1__supplier.sql
DATABASE_URL=postgres://postgres@localhost:5432/standar_nestjs npm run test:e2e
```

Test e2e membuat pasangan kunci RSA sendiri dan mengganti provider `KUNCI_JWKS`, sehingga tidak butuh IdP sungguhan.

Menjalankan aplikasi: isi variabel di `env.contoh` (IdP sungguhan), lalu `npm run build` dan `node examples/benar-app/dist/main.js`.
