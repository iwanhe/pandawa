# Changelog — Standar NestJS

Format mengikuti [Keep a Changelog](https://keepachangelog.com/id-ID/1.1.0/). Versi mengikuti aturan di [README utama](../README.md#11-siklus-hidup-dan-versi).

## [Belum dirilis]

## [0.2.0] - 2026-11-12

### Ditambahkan
- `Standar_NestJS.xlsx` dengan 57 aturan (NST-1xx s.d. NST-9xx) untuk NestJS 12.
- Konfigurasi `eslint.config.js` (standar 02 + aturan NestJS: forwardRef, barrel, SQL berparameter, process.env, console).
- API contoh `examples/benar-app` (guard OIDC, validasi Zod, model error, transaksi + outbox + Idempotency-Key, health, log JSON, Dockerfile) dengan 16 test termasuk e2e terhadap PostgreSQL.
- Contoh salah `examples/salah` yang memuat pelanggaran temuan spike.
- Checklist review dipetakan ke ID aturan.

### Diubah
- Status dari Evaluasi menjadi Draft.

## [0.1.0] - 2026-11-01

### Ditambahkan
- Kerangka folder: README, checklist review, folder contoh, dan changelog.
