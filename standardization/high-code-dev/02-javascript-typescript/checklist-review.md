# Checklist Review — JavaScript & TypeScript

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** dirujuk ke ID aturan di komentar review.

## Prasyarat (otomatis, harus hijau sebelum review)

| Periksa | Hasil |
|---|---|
| `npm run typecheck` lulus dengan `tsconfig.json` standar (TS-101, TS-102) | |
| `npm run lint` dengan `eslint.config.js` standar: 0 temuan (TS-102) | |
| `npm run format:check` lulus (JS-601) | |
| Test lulus di CI (JS-902) | |
| `npm audit` / OSV-Scanner tanpa High/Critical; lockfile ikut di-commit (JS-806) | |
| Setiap `eslint-disable` menyebut rule dan alasan | |

## Aturan yang Diperiksa Manual

### Penamaan dan struktur

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JS-106` | SEBAIKNYA | Nama deskriptif, dapat diucapkan, dan dapat dicari. Tanpa nama satu huruf (kecuali indeks loop pendek), tanpa singkatan tidak umum, tanpa tipe di nama (supplierList, arrSupplier). | |
| `JS-107` | SEBAIKNYA | Akronim diperlakukan sebagai kata dalam camelCase/PascalCase (userId, parseHtml, XmlParser). | |
| `JS-108` | SEBAIKNYA | Underscore di awal atau akhir nama tidak dipakai untuk menandai privat; gunakan #field (JS) atau private (TS). Parameter yang sengaja tidak dipakai boleh berprefix _. | |
| `JS-109` | SEBAIKNYA | Nama boolean berawalan is, has, can, atau should. | |
| `JS-202` | SEBAIKNYA | Satu fungsi melakukan satu hal, pada satu tingkat abstraksi, dengan nama yang menjelaskan apa yang dilakukan. | |
| `JS-207` | SEBAIKNYA | Flag boolean tidak dipakai untuk memilih perilaku fungsi; pecah menjadi dua fungsi. | |
| `JS-208` | SEBAIKNYA | Fungsi tidak mengubah state global atau objek masukan; kembalikan nilai baru. | |
| `JS-305` | SEBAIKNYA | Gunakan destructuring untuk memakai beberapa properti. Banyak nilai kembalian dikembalikan sebagai objek, bukan array. | |

### Async dan error

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JS-401` | SEBAIKNYA | Gunakan async/await, bukan callback bersarang atau rantai then panjang. | |
| `JS-504` | SEBAIKNYA | Setiap error ditangani satu kali: dibungkus lalu diteruskan, ATAU dicatat lalu ditangani; tidak dicatat lalu dilempar ulang di setiap lapisan. | |

### Alur kontrol dan komentar

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JS-605` | SEBAIKNYA | Operator berbeda yang dicampur dalam satu ekspresi diberi tanda kurung. | |
| `JS-607` | SEBAIKNYA | Kondisi kompleks dibungkus fungsi bernama; hindari kondisi negatif ganda. | |
| `JS-611` | SEBAIKNYA | Komentar menjelaskan alasan atau logika bisnis, bukan mengulang kode. Tanpa komentar jurnal; TODO/FIXME memakai format // TODO: <tiket> <isi>. | |
| `JS-612` | SEBAIKNYA | Fungsi, class, dan type yang diekspor diberi komentar JSDoc/TSDoc. | |

### Modul

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JS-704` | SEBAIKNYA | Semua import di bagian atas file, sebelum pernyataan lain. | |
| `JS-705` | WAJIB | Binding yang dapat diubah (export let) tidak diekspor. | |
| `JS-706` | WAJIB | Tidak ada dependensi sirkular antar modul. | |
| `JS-707` | WAJIB | Tidak ada variabel atau fungsi global; seluruh kode berada di dalam modul. | |

### Keamanan dan data

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JS-802` | DILARANG | Nominal uang tidak dihitung dengan tipe number; gunakan pustaka desimal (decimal.js) dan kirim nominal sebagai string desimal. | |
| `JS-803` | WAJIB | Data dari luar (input pengguna, API, URL, storage) diperiksa tipe dan nilainya sebelum dipakai; validasi diulang di server. | |
| `JS-807` | WAJIB | Waktu dipertukarkan sebagai string ISO 8601 dengan zona waktu (toISOString), bukan format lokal. | |
| `JS-808` | SEBAIKNYA | Hanya fitur ECMAScript yang sudah stabil dan didukung runtime target; proposal TC39 di bawah stage 4 tidak dipakai. | |

### TypeScript

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `TS-104` | SEBAIKNYA | Kode baru ditulis dalam TypeScript (.ts / .tsx); JavaScript hanya untuk file konfigurasi alat. | |
| `TS-207` | WAJIB | Data dari luar (API, JSON.parse, storage) bertipe unknown dan divalidasi saat runtime (type guard atau skema seperti Zod) sebelum dipakai sebagai tipe domain. | |
| `TS-208` | SEBAIKNYA | Tipe bersama satu domain didefinisikan di satu tempat; tidak ada definisi tipe yang sama di beberapa file. | |
| `TS-301` | SEBAIKNYA | Turunan tipe memakai utility types (Partial, Pick, Omit, Readonly, Record), bukan menyalin bentuk tipe. | |
| `TS-302` | SEBAIKNYA | Data yang tidak boleh diubah ditandai readonly, ReadonlyArray, atau as const. | |
| `TS-403` | SEBAIKNYA | State dengan bentuk berbeda dimodelkan sebagai discriminated union. | |
| `TS-502` | SEBAIKNYA | Parameter callback tidak ditandai opsional bila pemanggil selalu mengirimnya. | |

### Testing

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JS-901` | SEBAIKNYA | Satu test menguji satu konsep; nama test menjelaskan perilaku yang diharapkan. | |
