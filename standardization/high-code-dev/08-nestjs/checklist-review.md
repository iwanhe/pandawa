# Checklist Review — NestJS

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** dirujuk ke ID aturan di komentar review.

## Prasyarat (otomatis, harus hijau sebelum review)

| Periksa | Hasil |
|---|---|
| `npm run typecheck` lulus | |
| `npm run lint` (`--max-warnings 0`) dan `npm run format` lulus | |
| `npm test` dan `npm run test:e2e` lulus (e2e mencakup 401, 403, 400, sukses, idempotensi, error bisnis) | |
| `npm audit --omit=dev --audit-level=high` dan pemindaian Trivy image lulus | |
| Checklist standar 02 (JS/TS) juga sudah diperiksa | |

## Aturan yang Diperiksa Manual

### Struktur dan DI

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NST-102` | WAJIB | Satu module per domain bisnis di src/<domain>/ berisi module, controller, service, repository, schema, dan entity domain itu. Kode lintas domain di src/umum, konfigurasi di src/konfigurasi. | |
| `NST-103` | WAJIB | Module hanya mengekspor provider yang dipakai module lain (biasanya service). Repository, entity, dan provider internal tidak diekspor. | |
| `NST-104` | WAJIB | Nama file kebab-case dengan sufiks peran (.module.ts, .controller.ts, .service.ts, .repository.ts, .schema.ts, .entity.ts, .guard.ts, .filter.ts); nama kelas PascalCase dengan sufiks yang sama. | |
| `NST-106` | DILARANG | @Global() dan isGlobal hanya untuk module infrastruktur (konfigurasi, logger). Module fitur selalu diimpor eksplisit. | |
| `NST-201` | WAJIB | Controller tipis: menerima input yang sudah divalidasi, memanggil satu method service, dan mengembalikan DTO. Logika bisnis, transaksi, dan akses data tidak ada di controller. | |
| `NST-202` | WAJIB | Dependensi diterima lewat constructor dengan private readonly. DILARANG membuat service atau repository dengan new, atau memakai ModuleRef.get untuk dependensi biasa. | |
| `NST-203` | SEBAIKNYA | Provider memakai scope default (singleton). Scope REQUEST atau TRANSIENT hanya dengan alasan tertulis di PR. Data per permintaan (correlationId, pengguna) dibawa lewat AsyncLocalStorage atau objek request. | |
| `NST-204` | WAJIB | Nilai yang bukan kelas (klien eksternal, kunci JWKS, opsi) diinjeksi lewat token Symbol yang diekspor, bukan string literal. | |
| `NST-205` | WAJIB | Akses database ada di kelas repository terpisah. Service tidak menyusun SQL dan tidak memegang DataSource untuk query. | |
| `NST-206` | WAJIB | Klien sistem eksternal (ERP, S3, REST pihak lain) dibungkus sebagai provider dengan timeout eksplisit, sehingga dapat diganti di test lewat overrideProvider. | |

### API dan validasi

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NST-302` | WAJIB | Respons memakai tipe DTO eksplisit. Entity ORM tidak pernah dikembalikan langsung ke klien. | |
| `NST-303` | WAJIB | Parameter path numerik dikonversi dengan ParseIntPipe (atau skema). Nilai tidak valid menghasilkan 400. | |
| `NST-304` | WAJIB | Endpoint daftar selalu dipaginasi; ukuran halaman dibatasi di skema (maksimal 100) dan respons memuat total. | |
| `NST-305` | BOLEH | class-validator + ValidationPipe (whitelist, forbidNonWhitelisted, transform) boleh dipakai pada proyek yang sudah memakainya. Satu proyek memakai satu pendekatan validasi. | |
| `NST-306` | WAJIB | Versi API ada di URI (/api/v1/...) lewat enableVersioning({ type: VersioningType.URI }). Endpoint health memakai VERSION_NEUTRAL. | |
| `NST-308` | SEBAIKNYA | Kontrak API didokumentasikan sebagai OpenAPI (dari @nestjs/swagger atau berkas openapi.yaml) dan disimpan di repo. | |

### Persistensi dan integrasi

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NST-401` | WAJIB | Skema database dikelola migrasi Flyway (db/migrasi/V<n>__<deskripsi>.sql) di repo. TypeORM synchronize: false dan migrationsRun tidak dipakai. | |
| `NST-402` | WAJIB | SQL selalu berparameter ($1, $2 atau parameter query builder). DILARANG menyusun SQL dari penyambungan string atau template literal berisi nilai. | |
| `NST-403` | WAJIB | Kolom NUMERIC (uang, kuantitas) dipetakan ke string di entity dan DTO. Perhitungan memakai decimal.js atau dilakukan di database. DILARANG number atau parseFloat untuk nilai uang. | |
| `NST-404` | WAJIB | Penulisan yang menyentuh lebih dari satu tabel berjalan dalam satu transaksi (DataSource.transaction), dan EntityManager transaksi diteruskan ke repository. | |
| `NST-406` | WAJIB | Pesan ke sistem lain (ERP, antrean) ditulis ke tabel outbox dalam transaksi yang sama dengan data bisnis, lalu dikirim proses terpisah. DILARANG memanggil sistem lain di dalam transaksi database. | |
| `NST-407` | WAJIB | Kunci idempotensi dan status outbox disimpan di PostgreSQL, bukan di memori proses atau cache lokal. | |
| `NST-408` | WAJIB | Satu ORM per proyek: TypeORM dengan versi dikunci. ORM lain (Prisma, MikroORM, Drizzle) hanya lewat ADR. | |
| `NST-409` | BOLEH | Paket resmi NestJS yang masih pra-1.0 (@nestjs/outbox, @nestjs/idempotency, @nestjs/resilience, @nestjs/locks) boleh dipakai dengan versi dikunci tepat dan ADR. Implementasi tabel sendiri seperti contoh tetap sah. | |
| `NST-410` | DILARANG | DILARANG query di dalam perulangan (N+1). Ambil data terkait dengan join, IN, atau relasi yang dimuat dalam satu query. | |

### Error

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NST-503` | WAJIB | Error bisnis memakai kelas error domain dengan kode terdaftar (mis. SUP-0409) dan status HTTP-nya, terpisah dari error teknis (5xx). | |

### Keamanan dan konfigurasi

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NST-604` | WAJIB | Header keamanan diaktifkan dengan app.useSecurityHeaders() dan CORS memakai daftar origin dari konfigurasi. DILARANG origin '*' atau true untuk API yang menerima kredensial. | |
| `NST-605` | WAJIB | Rate limiting diterapkan minimal di satu lapis: Kong (K-03) atau @nestjs/throttler (ttl dalam milidetik). Di belakang proxy atau Cloudflare, trust proxy diatur agar IP klien benar. | |
| `NST-606` | WAJIB | Rahasia (password database, client secret) hanya dari variabel lingkungan atau secret store. Tidak di repo, tidak di log. .env masuk .gitignore; env.contoh berisi nama variabel tanpa nilai asli. | |
| `NST-607` | WAJIB | Upload file: batas ukuran (limits.fileSize), daftar tipe yang diizinkan diperiksa dari isi file (magic bytes), dan file disimpan di S3 (K-01), bukan di disk container. | |
| `NST-608` | WAJIB | Bila aplikasi terpaksa menyimpan password lokal (tanpa IdP), password di-hash dengan scrypt (node:crypto) atau argon2id. DILARANG plaintext, MD5, atau SHA tanpa salt. | |
| `NST-703` | DILARANG | Perbedaan DEV, UAT, dan PROD hanya lewat nilai konfigurasi. DILARANG percabangan logika bisnis berdasarkan NODE_ENV. | |

### Operasional

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NST-802` | DILARANG | DILARANG mencatat token, password, header Authorization, atau isi payload lengkap yang berisi data pribadi ke log. | |
| `NST-804` | SEBAIKNYA | Tracing dan metrik memakai OpenTelemetry (instrumentasi http dan pg) dan dikirim ke kolektor. | |
| `NST-805` | WAJIB | enableShutdownHooks aktif sehingga saat SIGTERM aplikasi berhenti menerima permintaan, menyelesaikan yang berjalan, dan menutup pool database. | |

### Build dan dependency

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NST-906` | WAJIB | Library yang tidak dirawat (tanpa rilis lebih dari 12 bulan, mis. exceljs) dicatat bersama rencana penggantinya sebelum dipakai di produksi. | |
| `NST-907` | WAJIB | Paket dan script bawaan scaffold yang tidak dipakai (mis. @nestjs/mau, script deploy bawaan) dihapus sebelum PR pertama. | |
