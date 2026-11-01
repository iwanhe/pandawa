# 02 — Standar JavaScript & TypeScript

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `JS`, `TS` |
| Status | **Direncanakan** |
| Versi | 0.1.0 (kerangka) |
| File aturan | `Standar_JavaScript_TypeScript.xlsx` (belum dibuat) |
| Pembaruan terakhir | 2026-11-01 |

## Ringkasan

Fondasi bahasa untuk semua kode JavaScript dan TypeScript, dipakai oleh standar ReactJS, Next.js, dan NestJS. Standar framework hanya menambah aturan di atas standar ini.

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| W | K | W |

`W` = wajib · `K` = kondisional (bila teknologi ini dipakai) · `—` = tidak berlaku

## Ruang Lingkup

- Deklarasi, penamaan, dan gaya kode JavaScript modern
- Fungsi, objek, array, dan clean code
- Asynchronous code dan error handling
- Jebakan umum bahasa (coercion, `this`, perbandingan)
- Konfigurasi TypeScript dan pemakaian tipe
- Keamanan kode dan supply chain npm

## Rencana Kategori Aturan

Nomor aturan dikelompokkan per ratusan. Daftar ini rencana awal dan dapat berubah saat penyusunan.

| Rentang ID | Kategori |
|---|---|
| `JS-1xx` | Deklarasi dan penamaan (const/let, camelCase, PascalCase) |
| `JS-2xx` | Fungsi dan clean code |
| `JS-3xx` | Objek, array, destructuring, spread |
| `JS-4xx` | Async (async/await, Promise, tidak ada floating promise) |
| `JS-5xx` | Error handling |
| `JS-6xx` | Modul dan struktur file |
| `JS-7xx` | Jebakan bahasa (===, coercion, this, hoisting) |
| `JS-8xx` | Keamanan (eval, input, nominal uang, supply chain npm) |
| `TS-1xx` | Konfigurasi `tsconfig` (strict) |
| `TS-2xx` | Tipe dasar, `any` vs `unknown`, type vs interface |
| `TS-3xx` | Generics dan utility types |
| `TS-4xx` | Union, enum, dan narrowing |
| `TS-5xx` | Null safety |

## Referensi Dasar

- Airbnb JavaScript Style Guide — github.com/airbnb/javascript
- Google JavaScript Style Guide — google.github.io/styleguide/jsguide.html
- MDN — Guidelines for writing JavaScript code examples
- W3C — JavaScript best practices
- clean-code-javascript — github.com/ryanmcdermott/clean-code-javascript
- JavaScript The Right Way — jstherightway.org
- es6-cheatsheet — github.com/DrkSephy/es6-cheatsheet
- Steve Kwan — JavaScript gotchas dan best practices
- adamlu — JavaScript style guide
- TypeScript best practices — github.com/ezbackend/TypeScript-best-practices

## Penegakan

| Jenis | Alat / cara |
|---|---|
| Lint | ESLint + typescript-eslint |
| Format | Prettier |
| Type check | `tsc --noEmit` dengan `strict: true` |
| Test | Vitest / Jest |
| Keamanan | npm audit, OSV-Scanner |

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| `Standar_JavaScript_TypeScript.xlsx` | Daftar aturan lengkap; dibuat dari [template aturan](../templates/Template_Aturan_Standar.xlsx) |
| [`checklist-review.md`](checklist-review.md) | Checklist review pull request |
| [`examples/`](examples/) | Contoh kode benar dan salah per ID aturan |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
