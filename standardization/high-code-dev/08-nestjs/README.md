# 08 — Standar NestJS

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `NST` |
| Status | **Evaluasi** |
| Versi | 0.1.0 (kerangka) |
| File aturan | `Standar_NestJS.xlsx` (belum dibuat) |
| Pembaruan terakhir | 2026-11-01 |

## Ringkasan

Standar backend NestJS (TypeScript) di atas PostgreSQL. NestJS adalah salah satu dari dua kandidat backend; pilihan per aplikasi ditetapkan setelah spike NestJS vs Spring Boot selesai. Prasyarat: standar 02.

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| K | K | K |

`W` = wajib · `K` = kondisional (bila teknologi ini dipakai) · `—` = tidak berlaku

## Ruang Lingkup

- Struktur modul dan dependency injection
- Controller, DTO, dan validasi
- Persistence PostgreSQL, migrasi skema, transaksi
- Error handling dan model error
- Keamanan (guard, verifikasi token OIDC)
- Konfigurasi dan secret
- Observability
- Testing
- Build, image container, dan supply chain npm

## Rencana Kategori Aturan

Nomor aturan dikelompokkan per ratusan. Daftar ini rencana awal dan dapat berubah saat penyusunan.

| Rentang ID | Kategori |
|---|---|
| `NST-1xx` | Struktur modul per domain |
| `NST-2xx` | Provider dan dependency injection |
| `NST-3xx` | Controller, DTO, pipe, validasi |
| `NST-4xx` | Persistence, migrasi, transaksi, desimal sebagai string |
| `NST-5xx` | Exception filter dan model error |
| `NST-6xx` | Keamanan: guard, verifikasi token Keycloak |
| `NST-7xx` | Konfigurasi dan secret |
| `NST-8xx` | Observability: log JSON, ID korelasi, health check |
| `NST-9xx` | Testing, build, image container, supply chain npm |

## Referensi Dasar

- Dokumentasi resmi NestJS — docs.nestjs.com
- Hasil spike NestJS vs Spring Boot — github.com/iwanhe/spike-nest-vs-spring

## Penegakan

| Jenis | Alat / cara |
|---|---|
| Lint/format | ESLint + typescript-eslint, Prettier |
| Test | Jest / Vitest, Supertest |
| Keamanan | npm audit, OSV-Scanner, Trivy |

## Pelajaran dari Spike (versi yang diuji: NestJS 12.1, TypeORM 1.1, Node.js 24, PostgreSQL 18)

- Pustaka tanpa rilis lebih dari 12–18 bulan wajib punya rencana pengganti (contoh: exceljs, rilis stabil terakhir Oktober 2023, membawa ±175 paket dan satu kerentanan lewat `uuid`).
- Paket yang tidak dipakai dibuang dari kerangka proyek (contoh: `@nestjs/mau`).
- Image dasar menentukan sebagian besar temuan OS; image dasar wajib ditetapkan dan dipindai.
- Build wajib gagal bila ada temuan kritis/tinggi yang sudah punya perbaikan; pengecualian dicatat dengan alasan dan tanggal kedaluwarsa.
- Pemeriksaan token tidak boleh bisa dimatikan lewat konfigurasi.

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| `Standar_NestJS.xlsx` | Daftar aturan lengkap; dibuat dari [template aturan](../templates/Template_Aturan_Standar.xlsx) |
| [`checklist-review.md`](checklist-review.md) | Checklist review pull request |
| [`examples/`](examples/) | Contoh kode benar dan salah per ID aturan |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
