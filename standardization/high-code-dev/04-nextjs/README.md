# 04 — Standar Next.js

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `NXT` |
| Status | **Direncanakan** |
| Versi | 0.1.0 (kerangka) |
| File aturan | `Standar_NextJS.xlsx` (belum dibuat) |
| Pembaruan terakhir | 2026-11-01 |

## Ringkasan

Best practice Next.js (App Router) ditambah modul belajar untuk developer junior. Prasyarat: standar 02 dan 03.

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| K | K | K |

`W` = wajib · `K` = kondisional (bila teknologi ini dipakai) · `—` = tidak berlaku

## Ruang Lingkup

- Struktur proyek App Router
- Server Components dan Client Components
- Data fetching, caching, dan revalidation
- Routing, layout, loading, dan error UI
- Server Actions, Route Handlers, dan keamanan
- Performa, konfigurasi, dan deployment
- Modul belajar bertahap untuk developer junior (folder `learning/`)

## Rencana Kategori Aturan

Nomor aturan dikelompokkan per ratusan. Daftar ini rencana awal dan dapat berubah saat penyusunan.

| Rentang ID | Kategori |
|---|---|
| `NXT-1xx` | Struktur proyek dan App Router |
| `NXT-2xx` | Server vs Client Components |
| `NXT-3xx` | Data fetching dan caching |
| `NXT-4xx` | Routing, layout, loading, error |
| `NXT-5xx` | Server Actions, Route Handlers, dan keamanan |
| `NXT-6xx` | Performa (Image, Font, bundle, streaming) |
| `NXT-7xx` | Konfigurasi, environment variable, deployment |
| `NXT-8xx` | Testing |

## Referensi Dasar

- Dokumentasi resmi — nextjs.org/docs
- Dokumentasi di repo — github.com/vercel/next.js (folder `docs`)

## Penegakan

| Jenis | Alat / cara |
|---|---|
| Lint | ESLint + eslint-config-next |
| Test | Vitest, React Testing Library, Playwright |
| Keamanan | npm audit, OSV-Scanner |

## Modul Belajar Developer Junior (rencana)

Disimpan di `learning/`, satu file per modul, masing-masing dengan latihan.

| Modul | Topik |
|---|---|
| 01 | Dasar React dan TypeScript yang dibutuhkan |
| 02 | Membuat proyek dan struktur App Router |
| 03 | Halaman, layout, dan navigasi |
| 04 | Server Components vs Client Components |
| 05 | Mengambil data dan caching |
| 06 | Form dan Server Actions |
| 07 | Loading, error, dan not-found |
| 08 | Autentikasi dan otorisasi |
| 09 | Optimasi gambar, font, dan performa |
| 10 | Testing dan deployment |

## Hal yang Masih Perlu Diputuskan

1. Kapan memakai Next.js dan kapan cukup React SPA (Vite).
2. Target hosting (container sendiri atau platform terkelola).

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| `Standar_NextJS.xlsx` | Daftar aturan lengkap; dibuat dari [template aturan](../templates/Template_Aturan_Standar.xlsx) |
| [`checklist-review.md`](checklist-review.md) | Checklist review pull request |
| [`examples/`](examples/) | Contoh kode benar dan salah per ID aturan |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
