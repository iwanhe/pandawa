# 03 — Standar ReactJS

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `RCT` |
| Status | **Direncanakan** |
| Versi | 0.1.0 (kerangka) |
| File aturan | `Standar_ReactJS.xlsx` (belum dibuat) |
| Pembaruan terakhir | 2026-11-01 |

## Ringkasan

Standar membangun UI dengan React + TypeScript. Prasyarat: standar 02 JavaScript & TypeScript.

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| W | K | K |

`W` = wajib · `K` = kondisional (bila teknologi ini dipakai) · `—` = tidak berlaku

## Ruang Lingkup

- Struktur folder dan penamaan komponen
- Komponen fungsi dan props
- Aturan hooks dan state
- Pola lanjutan komponen yang dapat dipakai ulang
- Performa, aksesibilitas, keamanan, dan testing

## Rencana Kategori Aturan

Nomor aturan dikelompokkan per ratusan. Daftar ini rencana awal dan dapat berubah saat penyusunan.

| Rentang ID | Kategori |
|---|---|
| `RCT-1xx` | Struktur folder dan penamaan (PascalCase, satu folder per fitur) |
| `RCT-2xx` | Komponen dan props |
| `RCT-3xx` | Aturan hooks dan custom hooks |
| `RCT-4xx` | State management dan data fetching |
| `RCT-5xx` | Pola lanjutan (compound components, control props, state reducer, prop getters) |
| `RCT-6xx` | Performa (key, memoization, lazy loading) |
| `RCT-7xx` | Aksesibilitas |
| `RCT-8xx` | Keamanan (XSS, penyimpanan token, OIDC + PKCE) |
| `RCT-9xx` | Testing (Vitest, React Testing Library) |

## Referensi Dasar

- reactjs-interview-questions — github.com/sudheerj/reactjs-interview-questions
- advanced-react-patterns-v2 — github.com/kentcdodds/advanced-react-patterns-v2
- Dokumentasi resmi React — react.dev (acuan versi)

## Penegakan

| Jenis | Alat / cara |
|---|---|
| Lint | ESLint + eslint-plugin-react + eslint-plugin-react-hooks + jsx-a11y |
| Test | Vitest + React Testing Library; Playwright untuk E2E |
| Keamanan | npm audit, OSV-Scanner |

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| `Standar_ReactJS.xlsx` | Daftar aturan lengkap; dibuat dari [template aturan](../templates/Template_Aturan_Standar.xlsx) |
| [`checklist-review.md`](checklist-review.md) | Checklist review pull request |
| [`examples/`](examples/) | Contoh kode benar dan salah per ID aturan |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
