# 08 — Standar NestJS

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `NST` |
| Status | **Draft** |
| Versi | 0.2.0 |
| Versi yang diacu | NestJS 12.4, Node.js 24 LTS, TypeScript 6.0, TypeORM 1.1, PostgreSQL 16, Zod 4 |
| Prasyarat | [02 — JavaScript & TypeScript](../02-javascript-typescript/) (semua aturannya tetap berlaku) |
| File aturan | [`Standar_NestJS.xlsx`](Standar_NestJS.xlsx) — sumber utama |
| Konfigurasi | [`eslint.config.js`](eslint.config.js) + [`eslint.base.js`](eslint.base.js), [`examples/benar-app/tsconfig.json`](examples/benar-app/tsconfig.json), [`examples/benar-app/vitest.config.ts`](examples/benar-app/vitest.config.ts), [`examples/benar-app/Dockerfile`](examples/benar-app/Dockerfile), [`npmrc.template`](npmrc.template) |
| Pembaruan terakhir | 2026-11-12 |

## Ringkasan

Standar backend NestJS untuk Tim PANDAWA, dengan aplikasi contoh (API supplier) yang lulus `tsc`, ESLint, dan 16 test termasuk e2e terhadap PostgreSQL sungguhan.

| Jumlah aturan | WAJIB | DILARANG | SEBAIKNYA | BOLEH | Ditegakkan alat |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 57 | 44 | 8 | 3 | 2 | 22 (39%) |

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| K | K | K |

`K` = kondisional: berlaku bila backend aplikasi memakai NestJS. Pilihan NestJS atau Spring Boot ditetapkan per aplikasi lewat ADR. Aturan outbox (NST-406) berlaku bila aplikasi mengirim data ke ERP atau sistem lain.

## Keputusan Utama

| Topik | Pilihan standar | Alternatif yang diizinkan |
|---|---|---|
| Validasi input | `StandardSchemaValidationPipe` global + skema Zod (`@Body({ schema })`) | class-validator + `ValidationPipe` untuk proyek yang sudah memakainya (NST-305) |
| ORM dan migrasi | TypeORM, `synchronize: false`, migrasi Flyway (K-02) | ORM lain lewat ADR (NST-408) |
| Autentikasi | Guard global, verifikasi token OIDC dengan `jose` + JWKS | — (tidak bisa dimatikan, NST-602) |
| Idempotensi dan outbox | Tabel PostgreSQL sendiri (lihat contoh) | `@nestjs/idempotency`, `@nestjs/outbox` (pra-1.0) dengan versi dikunci + ADR (NST-409) |
| Linter | ESLint + typescript-eslint dengan konfigurasi ini | oxlint bawaan scaffold hanya sebagai tambahan (NST-903) |
| Test | Vitest 5 + supertest; e2e terhadap PostgreSQL | Jest bila sudah dipakai (butuh Node 24.9+ dengan Nest 12) |
| Log | `ConsoleLogger({ json: true })` + correlationId | pino |

## Cara Memakai

1. Buat proyek dengan Nest CLI 12 (Node 24), lalu hapus paket dan script scaffold yang tidak dipakai (NST-907).
2. Salin `eslint.config.js`, `eslint.base.js`, `.prettierrc.json`, `.prettierignore`, dan `npmrc.template` (sebagai `.npmrc`). Ambil `tsconfig.json`, `vitest.config.ts`, `Dockerfile`, dan `env.contoh` dari [`examples/benar-app`](examples/benar-app/).
3. Ikuti pola di contoh: [`app.module.ts`](examples/benar-app/src/app.module.ts) (guard, filter, pipe global), [`aplikasi.ts`](examples/benar-app/src/aplikasi.ts) (header keamanan, CORS, versi, shutdown), dan module [`supplier`](examples/benar-app/src/supplier/).
4. Jalankan sebelum membuka pull request:
   ```bash
   npm ci && npm run typecheck && npm run lint && npm run format && npm test && npm run test:e2e
   ```
5. Aturan yang tidak dapat dicek alat diperiksa dengan [`checklist-review.md`](checklist-review.md).

## Hal Khusus NestJS 12

| Perubahan | Dampak pada standar |
|---|---|
| Paket inti hanya ESM | `"type": "module"`, `nodenext`, impor relatif dengan `.js` (NST-101) |
| Validasi bawaan Standard Schema | Skema Zod langsung di `@Body`, `@Query`, `@Param` (NST-301). `@Headers()` belum menerima skema, jadi header divalidasi lewat decorator parameter khusus |
| `app.useSecurityHeaders()` dan `app.enableCsrfProtection()` | Header keamanan tanpa paket helmet terpisah (NST-604) |
| `Reflector.createDecorator` | Decorator `@Publik()` dan `@Peran()` bertipe, tanpa `SetMetadata` + string key |
| Scaffold memakai oxlint dan Vitest | ESLint standar tetap wajib (NST-903). Vitest 5 membaca `emitDecoratorMetadata` dari tsconfig, sehingga plugin SWC tidak diperlukan (diuji) |
| API lama `@nestjs/terminus` dihapus | Endpoint health sederhana (NST-803) |

## Pelajaran dari Spike

Aturan berikut lahir dari temuan [spike NestJS vs Spring Boot](https://github.com/iwanhe/spike-nest-vs-spring):

| Temuan | Aturan |
|---|---|
| Verifikasi token mati bila `AUTH_ISSUER` kosong | NST-602 (konfigurasi IdP wajib; aplikasi gagal start) |
| Base image Debian 12 membawa 4 kerentanan kritis | NST-904 (base image dikunci, Trivy sebagai gate) |
| exceljs tidak dirilis sejak Oktober 2023 | NST-906 (catat rencana pengganti) |
| `@nestjs/mau` dan script deploy bawaan tidak dipakai | NST-907 (hapus sebelum PR pertama) |

## Hal yang Masih Perlu Diputuskan

1. Kriteria memilih NestJS atau Spring Boot per aplikasi (hasil spike dan kompetensi tim).
2. IdP dan format klaim peran. Contoh membaca `realm_access.roles` (format Keycloak); sesuaikan bila IdP berbeda.
3. Mekanisme pengirim outbox (job terjadwal di aplikasi, pekerja terpisah, atau paket `@nestjs/outbox`).
4. Lapis rate limiting: Kong saja atau juga `@nestjs/throttler` (NST-605).

## Daftar Aturan

Ringkasan dari [`Standar_NestJS.xlsx`](Standar_NestJS.xlsx). Alasan, contoh benar/salah, dan catatan lengkap ada di file Excel.

### NST-1xx — Struktur dan modul (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NST-101` | WAJIB | Proyek baru memakai NestJS 12 sebagai ESM di Node.js 24 LTS: package.json "type": "module", tsconfig module/moduleResolution nodenext, dan impor relatif ditulis dengan ekstensi .js. | tsc (module nodenext) |
| `NST-102` | WAJIB | Satu module per domain bisnis di src/<domain>/ berisi module, controller, service, repository, schema, dan entity domain itu. Kode lintas domain di src/umum, konfigurasi di src/konfigurasi. | review |
| `NST-103` | WAJIB | Module hanya mengekspor provider yang dipakai module lain (biasanya service). Repository, entity, dan provider internal tidak diekspor. | review |
| `NST-104` | WAJIB | Nama file kebab-case dengan sufiks peran (.module.ts, .controller.ts, .service.ts, .repository.ts, .schema.ts, .entity.ts, .guard.ts, .filter.ts); nama kelas PascalCase dengan sufiks yang sama. | review |
| `NST-105` | DILARANG | DILARANG dependensi melingkar antarmodul, forwardRef, dan barrel file (index.ts yang mengekspor ulang). Impor langsung dari file sumbernya. | no-restricted-syntax (forwardRef), no-restricted-imports (index) |
| `NST-106` | DILARANG | @Global() dan isGlobal hanya untuk module infrastruktur (konfigurasi, logger). Module fitur selalu diimpor eksplisit. | review |

### NST-2xx — Provider dan dependency injection (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NST-201` | WAJIB | Controller tipis: menerima input yang sudah divalidasi, memanggil satu method service, dan mengembalikan DTO. Logika bisnis, transaksi, dan akses data tidak ada di controller. | review |
| `NST-202` | WAJIB | Dependensi diterima lewat constructor dengan private readonly. DILARANG membuat service atau repository dengan new, atau memakai ModuleRef.get untuk dependensi biasa. | review |
| `NST-203` | SEBAIKNYA | Provider memakai scope default (singleton). Scope REQUEST atau TRANSIENT hanya dengan alasan tertulis di PR. Data per permintaan (correlationId, pengguna) dibawa lewat AsyncLocalStorage atau objek request. | review |
| `NST-204` | WAJIB | Nilai yang bukan kelas (klien eksternal, kunci JWKS, opsi) diinjeksi lewat token Symbol yang diekspor, bukan string literal. | review |
| `NST-205` | WAJIB | Akses database ada di kelas repository terpisah. Service tidak menyusun SQL dan tidak memegang DataSource untuk query. | review |
| `NST-206` | WAJIB | Klien sistem eksternal (ERP, S3, REST pihak lain) dibungkus sebagai provider dengan timeout eksplisit, sehingga dapat diganti di test lewat overrideProvider. | review |

### NST-3xx — Controller, DTO, validasi (8 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NST-301` | WAJIB | Semua input HTTP (body, query, param) divalidasi skema di batas aplikasi: StandardSchemaValidationPipe global + skema Zod lewat @Body({ schema }), @Query({ schema }). Objek memakai z.strictObject sehingga field tak dikenal ditolak. | uji e2e (400 untuk isian salah dan field tak dikenal) |
| `NST-302` | WAJIB | Respons memakai tipe DTO eksplisit. Entity ORM tidak pernah dikembalikan langsung ke klien. | review |
| `NST-303` | WAJIB | Parameter path numerik dikonversi dengan ParseIntPipe (atau skema). Nilai tidak valid menghasilkan 400. | review |
| `NST-304` | WAJIB | Endpoint daftar selalu dipaginasi; ukuran halaman dibatasi di skema (maksimal 100) dan respons memuat total. | review |
| `NST-305` | BOLEH | class-validator + ValidationPipe (whitelist, forbidNonWhitelisted, transform) boleh dipakai pada proyek yang sudah memakainya. Satu proyek memakai satu pendekatan validasi. | review |
| `NST-306` | WAJIB | Versi API ada di URI (/api/v1/...) lewat enableVersioning({ type: VersioningType.URI }). Endpoint health memakai VERSION_NEUTRAL. | review |
| `NST-307` | WAJIB | Kode status HTTP sesuai semantik: 201 untuk pembuatan (@HttpCode eksplisit), 200 baca/ubah, 204 tanpa isi, 400 validasi, 401, 403, 404, 409 konflik, 422 aturan bisnis. | uji e2e (status setiap skenario) |
| `NST-308` | SEBAIKNYA | Kontrak API didokumentasikan sebagai OpenAPI (dari @nestjs/swagger atau berkas openapi.yaml) dan disimpan di repo. | review |

### NST-4xx — Persistensi dan integrasi (10 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NST-401` | WAJIB | Skema database dikelola migrasi Flyway (db/migrasi/V<n>__<deskripsi>.sql) di repo. TypeORM synchronize: false dan migrationsRun tidak dipakai. | review |
| `NST-402` | WAJIB | SQL selalu berparameter ($1, $2 atau parameter query builder). DILARANG menyusun SQL dari penyambungan string atau template literal berisi nilai. | no-restricted-syntax (query/where/having/orderBy dengan template berisi nilai atau +) |
| `NST-403` | WAJIB | Kolom NUMERIC (uang, kuantitas) dipetakan ke string di entity dan DTO. Perhitungan memakai decimal.js atau dilakukan di database. DILARANG number atau parseFloat untuk nilai uang. | review |
| `NST-404` | WAJIB | Penulisan yang menyentuh lebih dari satu tabel berjalan dalam satu transaksi (DataSource.transaction), dan EntityManager transaksi diteruskan ke repository. | review |
| `NST-405` | WAJIB | POST yang membuat data atau memicu proses ke ERP wajib menerima header Idempotency-Key. Kunci dan sidik isi disimpan; permintaan ulang dengan isi sama mendapat respons tersimpan, isi berbeda mendapat 422. | uji e2e (ulang, isi beda, tanpa header) |
| `NST-406` | WAJIB | Pesan ke sistem lain (ERP, antrean) ditulis ke tabel outbox dalam transaksi yang sama dengan data bisnis, lalu dikirim proses terpisah. DILARANG memanggil sistem lain di dalam transaksi database. | review |
| `NST-407` | WAJIB | Kunci idempotensi dan status outbox disimpan di PostgreSQL, bukan di memori proses atau cache lokal. | review |
| `NST-408` | WAJIB | Satu ORM per proyek: TypeORM dengan versi dikunci. ORM lain (Prisma, MikroORM, Drizzle) hanya lewat ADR. | review |
| `NST-409` | BOLEH | Paket resmi NestJS yang masih pra-1.0 (@nestjs/outbox, @nestjs/idempotency, @nestjs/resilience, @nestjs/locks) boleh dipakai dengan versi dikunci tepat dan ADR. Implementasi tabel sendiri seperti contoh tetap sah. | review |
| `NST-410` | DILARANG | DILARANG query di dalam perulangan (N+1). Ambil data terkait dengan join, IN, atau relasi yang dimuat dalam satu query. | no-await-in-loop (JS-403), sebagian |

### NST-5xx — Error (4 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NST-501` | WAJIB | Semua respons gagal memakai satu model: { success: false, correlationId, errors: [{ code, message }] }, dibentuk oleh exception filter global (APP_FILTER). | uji e2e dan uji unit filter |
| `NST-502` | DILARANG | DILARANG mengirim detail teknis (stack trace, pesan database, nama tabel, SQL) ke klien. Detail hanya ditulis ke log bersama correlationId. | uji unit filter (pesan teknis tidak muncul di respons) |
| `NST-503` | WAJIB | Error bisnis memakai kelas error domain dengan kode terdaftar (mis. SUP-0409) dan status HTTP-nya, terpisah dari error teknis (5xx). | review |
| `NST-504` | WAJIB | Error yang tidak tertangani dicatat dengan logger.error beserta correlationId. DILARANG menelan error dengan catch kosong. | no-empty (JS-502) |

### NST-6xx — Keamanan (8 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NST-601` | WAJIB | Guard global (APP_GUARD) memverifikasi token OIDC: tanda tangan lewat JWKS, issuer, audience, masa berlaku, dan algoritma yang ditetapkan. Endpoint publik ditandai eksplisit dengan decorator @Publik(). | uji e2e (401 tanpa token) |
| `NST-602` | DILARANG | DILARANG verifikasi token dapat dimatikan lewat konfigurasi, flag, atau variabel lingkungan. Konfigurasi IdP wajib ada; aplikasi gagal start bila kosong. | uji unit konfigurasi; no-restricted-properties (process.env) |
| `NST-603` | WAJIB | Otorisasi berbasis peran ditetapkan per handler (@Peran) dan diuji (403) di e2e. Pemeriksaan kepemilikan data (pengguna hanya mengakses datanya) dilakukan di service. | uji e2e (403 untuk peran salah) |
| `NST-604` | WAJIB | Header keamanan diaktifkan dengan app.useSecurityHeaders() dan CORS memakai daftar origin dari konfigurasi. DILARANG origin '*' atau true untuk API yang menerima kredensial. | review |
| `NST-605` | WAJIB | Rate limiting diterapkan minimal di satu lapis: Kong (K-03) atau @nestjs/throttler (ttl dalam milidetik). Di belakang proxy atau Cloudflare, trust proxy diatur agar IP klien benar. | review |
| `NST-606` | WAJIB | Rahasia (password database, client secret) hanya dari variabel lingkungan atau secret store. Tidak di repo, tidak di log. .env masuk .gitignore; env.contoh berisi nama variabel tanpa nilai asli. | review |
| `NST-607` | WAJIB | Upload file: batas ukuran (limits.fileSize), daftar tipe yang diizinkan diperiksa dari isi file (magic bytes), dan file disimpan di S3 (K-01), bukan di disk container. | review |
| `NST-608` | WAJIB | Bila aplikasi terpaksa menyimpan password lokal (tanpa IdP), password di-hash dengan scrypt (node:crypto) atau argon2id. DILARANG plaintext, MD5, atau SHA tanpa salt. | review |

### NST-7xx — Konfigurasi (3 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NST-701` | WAJIB | Konfigurasi dibaca lewat @nestjs/config dengan fungsi validate berbasis skema Zod; aplikasi gagal start bila konfigurasi tidak valid. Semua variabel didokumentasikan di env.contoh. | uji unit konfigurasi |
| `NST-702` | DILARANG | DILARANG membaca process.env di luar modul konfigurasi. Kode lain memakai ConfigService<Konfigurasi, true> dengan { infer: true }. | no-restricted-properties (process.env) |
| `NST-703` | DILARANG | Perbedaan DEV, UAT, dan PROD hanya lewat nilai konfigurasi. DILARANG percabangan logika bisnis berdasarkan NODE_ENV. | review |

### NST-8xx — Observability dan operasional (5 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NST-801` | WAJIB | Log berformat JSON (ConsoleLogger({ json: true }) atau pino) lewat Logger NestJS; setiap permintaan membawa correlationId (header X-Correlation-Id). DILARANG console.*. | no-console |
| `NST-802` | DILARANG | DILARANG mencatat token, password, header Authorization, atau isi payload lengkap yang berisi data pribadi ke log. | review |
| `NST-803` | WAJIB | Endpoint /api/sehat/hidup (tanpa dependensi) dan /api/sehat/siap (memeriksa database) tersedia, publik, dan tanpa versi. | uji e2e |
| `NST-804` | SEBAIKNYA | Tracing dan metrik memakai OpenTelemetry (instrumentasi http dan pg) dan dikirim ke kolektor. | review |
| `NST-805` | WAJIB | enableShutdownHooks aktif sehingga saat SIGTERM aplikasi berhenti menerima permintaan, menyelesaikan yang berjalan, dan menutup pool database. | review |

### NST-9xx — Testing, build, rantai pasok (7 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NST-901` | WAJIB | Logika service diuji unit dengan Vitest dan Test.createTestingModule, dependensi diganti provider palsu (useValue). | vitest (CI) |
| `NST-902` | WAJIB | Uji e2e (supertest) berjalan terhadap PostgreSQL sungguhan dan minimal mencakup: tanpa token (401), peran salah (403), isian salah (400), alur sukses, idempotensi, dan satu error bisnis. | vitest + supertest (CI, service PostgreSQL) |
| `NST-903` | WAJIB | CI menjalankan tsc --noEmit, ESLint dengan konfigurasi standar ini (--max-warnings 0), dan Prettier --check. oxlint boleh dipakai sebagai pemeriksaan cepat tambahan, tidak menggantikan ESLint. | tsc, ESLint, Prettier |
| `NST-904` | WAJIB | Image container multi-stage, berjalan sebagai user non-root, base image dikunci dengan tag dan digest, dan dipindai Trivy. Build gagal bila ada temuan CRITICAL/HIGH yang sudah ada perbaikannya. | Trivy (CI) |
| `NST-905` | WAJIB | Versi dependency tepat (save-exact), package-lock.json di-commit, instalasi dengan npm ci dan ignore-scripts. Gate CI: npm audit --omit=dev --audit-level=high. overrides hanya sementara, dengan catatan alasan dan tanggal tinjau. | npm audit (CI) |
| `NST-906` | WAJIB | Library yang tidak dirawat (tanpa rilis lebih dari 12 bulan, mis. exceljs) dicatat bersama rencana penggantinya sebelum dipakai di produksi. | review |
| `NST-907` | WAJIB | Paket dan script bawaan scaffold yang tidak dipakai (mis. @nestjs/mau, script deploy bawaan) dihapus sebelum PR pertama. | review |

## Bukti Penegakan

Diuji pada 12 November 2026 dengan NestJS 12.4.2, TypeORM 1.1.2, Zod 4.6.7, jose 6.2.17, TypeScript 6.0.3, ESLint 10.14.0, typescript-eslint 8.72.1, Vitest 5.1.0, dan PostgreSQL 16, di Node 24.22.3 dan 22.23.4:

- [`examples/benar-app`](examples/benar-app/) adalah API supplier lengkap: guard OIDC global, `@Publik`/`@Peran`, validasi Zod, model error standar dengan correlationId, transaksi + outbox + Idempotency-Key, health check, log JSON.
  - `tsc` lulus; ESLint **0 temuan** (`--max-warnings 0`); Prettier lulus.
  - **16 test lulus**: 9 unit (konfigurasi, service dengan repository palsu, exception filter) dan 7 e2e terhadap PostgreSQL 16 setelah migrasi `V1__supplier.sql` dijalankan: health tanpa token, 401, 403, 400 (isian salah, field tak dikenal, tanpa Idempotency-Key), 201 + outbox + respons ulang, 422 untuk kunci dengan isi berbeda, 409 kode duplikat, batas ukuran halaman, dan 404.
  - Hasil build (`dist/main.js`) dijalankan langsung: log keluar dalam format JSON, header `Content-Security-Policy` dan `X-Correlation-Id` terpasang, dan aplikasi menolak start bila konfigurasi IdP kosong.
  - Saat uji, ESLint menemukan method repository dengan 4 parameter (JS-203) dan pemeriksaan kondisi yang tidak perlu; keduanya sudah diperbaiki di contoh.
- [`examples/salah`](examples/salah/): ESLint menemukan 19 pelanggaran, antara lain `forwardRef` dan impor barrel (NST-105), SQL dari template literal dan penyambungan string (NST-402), `process.env` di guard (NST-702), `console.log` (NST-801), dan `any` (TS-201).
- **Tidak tertangkap alat:** scope REQUEST tanpa alasan (NST-203), controller tanpa versi (NST-306), entity dikembalikan langsung (NST-302), uang sebagai `number` (NST-403), error dengan status 200 dan pesan teknis bocor (NST-501, NST-502), guard yang hanya mengecek keberadaan header (NST-601). Aturan ini wajib diperiksa saat review.
- `Dockerfile` contoh **belum dibangun** di lingkungan uji (akses ke registry container diblokir). Bangun dan pindai dengan Trivy saat pertama kali dipakai di CI.
- `npm audit`: 0 kerentanan. Satu advisori tingkat sedang pada `minimatch` (dipakai ESLint dan typescript-eslint, hanya dev) ditutup sementara dengan `overrides` ke 11.0.8; tinjau ulang saat ESLint/typescript-eslint merilis perbaikan (NST-905).

## Referensi

- Dokumentasi resmi NestJS — https://docs.nestjs.com
- Repo NestJS — https://github.com/nestjs/nest
- Spike NestJS vs Spring Boot — https://github.com/iwanhe/spike-nest-vs-spring

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| [`Standar_NestJS.xlsx`](Standar_NestJS.xlsx) | Daftar aturan lengkap (sumber utama) |
| [`eslint.config.js`](eslint.config.js), [`eslint.base.js`](eslint.base.js) | ESLint: standar 02 + penyesuaian NestJS |
| [`.prettierrc.json`](.prettierrc.json), [`npmrc.template`](npmrc.template), [`.gitignore`](.gitignore) | Format, npm, dan Git |
| [`package.json`](package.json), `package-lock.json` | Versi yang diuji dan script |
| [`checklist-review.md`](checklist-review.md) | Checklist review |
| [`examples/benar-app/`](examples/benar-app/) | API contoh yang lulus semua pemeriksaan |
| [`examples/salah/`](examples/salah/) | Contoh pelanggaran |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
