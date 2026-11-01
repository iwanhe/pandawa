# 02 — Standar JavaScript & TypeScript

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `JS`, `TS` |
| Status | **Draft** |
| Versi | 0.2.0 |
| File aturan | [`Standar_JavaScript_TypeScript.xlsx`](Standar_JavaScript_TypeScript.xlsx) — sumber utama |
| Konfigurasi | [`eslint.config.js`](eslint.config.js), [`tsconfig.json`](tsconfig.json), [`.prettierrc.json`](.prettierrc.json), [`npmrc.template`](npmrc.template) (salin sebagai `.npmrc`) |
| Pembaruan terakhir | 2026-11-01 |

## Ringkasan

Fondasi bahasa untuk semua kode JavaScript dan TypeScript. Standar ReactJS (03), Next.js (04), dan NestJS (08) hanya menambah aturan di atas standar ini.

| Jumlah aturan | WAJIB | DILARANG | SEBAIKNYA | BOLEH | Ditegakkan alat |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 93 | 39 | 8 | 45 | 1 | 62 (67%) |

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| W | K | W |

`W` = wajib · `K` = kondisional (bila memakai JS/TS, mis. Oracle JET atau static file APEX) · `—` = tidak berlaku

## Cara Memakai

1. Salin `eslint.config.js`, `tsconfig.json`, dan `.prettierrc.json` ke root proyek, lalu salin `npmrc.template` menjadi `.npmrc`. Pasang dev dependency sesuai [`package.json`](package.json).
2. Jalankan sebelum membuka pull request:
   ```bash
   npm ci && npm run typecheck && npm run lint && npm run format:check
   ```
3. Pasang perintah yang sama di CI; temuan memblokir merge (TS-102).
4. Aturan yang tidak dapat dicek alat diperiksa dengan [`checklist-review.md`](checklist-review.md).
5. Pengecualian rule ditulis `// eslint-disable-next-line <rule> -- <alasan>`. Penyimpangan dari aturan WAJIB/DILARANG memakai [waiver](../waiver/).

## Keputusan Saat Menggabungkan Sumber

| Topik | Perbedaan di sumber | Keputusan |
|---|---|---|
| Bentuk fungsi bernama | Airbnb: named function expression. MDN, Google: function declaration | Function declaration (JS-201) |
| Export | Airbnb: default export untuk satu ekspor. Google: named export | Named export; default hanya bila framework mensyaratkan (JS-702) |
| Akronim | Airbnb: `userID` atau `userid`. Google: `userId` | Akronim sebagai kata (JS-107) |
| Kesetaraan | Airbnb, Google, MDN: `===`. Kwan: kewajiban `===` berlebihan | `===` wajib (JS-609) |
| Loop | Airbnb: hindari `for...of`. MDN: `for...of` dianjurkan | `for...of` dan method array; `for...in` dilarang (JS-311) |
| Lebar baris | Airbnb: 100. Google: 80 | 100, ditegakkan Prettier (JS-601) |
| Koma | Gaya PL/SQL PANDAWA: koma di depan. Airbnb: koma di belakang + trailing comma | Ikuti ekosistem JS: trailing comma (JS-601) |
| TypeScript | ezbackend (era TS 1.0): `any` pada callback, ghost module | Tidak diadopsi; diganti aturan typescript-eslint modern (TS-201, TS-504) |

## Daftar Aturan

Ringkasan dari [`Standar_JavaScript_TypeScript.xlsx`](Standar_JavaScript_TypeScript.xlsx). Alasan, contoh benar/salah, dan catatan lengkap ada di file Excel.

### JS-1xx — Deklarasi dan penamaan (10 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JS-101` | WAJIB | Gunakan const secara default dan let bila nilainya diubah. var tidak dipakai. | no-var, prefer-const |
| `JS-102` | SEBAIKNYA | Satu deklarasi untuk satu variabel; tanpa assignment berantai. | one-var, no-multi-assign |
| `JS-103` | SEBAIKNYA | Variabel dideklarasikan sedekat mungkin dengan pemakaiannya dan sebelum dipakai. | @typescript-eslint/no-use-before-define |
| `JS-104` | WAJIB | camelCase untuk variabel, fungsi, dan instance; PascalCase untuk class, type, interface, enum, dan komponen. | @typescript-eslint/naming-convention |
| `JS-105` | BOLEH | UPPER_SNAKE_CASE hanya untuk konstanta modul yang benar-benar tetap (primitif atau objek beku). Konstanta lokal tetap camelCase. | @typescript-eslint/naming-convention |
| `JS-106` | SEBAIKNYA | Nama deskriptif, dapat diucapkan, dan dapat dicari. Tanpa nama satu huruf (kecuali indeks loop pendek), tanpa singkatan tidak umum, tanpa tipe di nama (supplierList, arrSupplier). | review |
| `JS-107` | SEBAIKNYA | Akronim diperlakukan sebagai kata dalam camelCase/PascalCase (userId, parseHtml, XmlParser). | review |
| `JS-108` | SEBAIKNYA | Underscore di awal atau akhir nama tidak dipakai untuk menandai privat; gunakan #field (JS) atau private (TS). Parameter yang sengaja tidak dipakai boleh berprefix _. | review |
| `JS-109` | SEBAIKNYA | Nama boolean berawalan is, has, can, atau should. | review |
| `JS-110` | SEBAIKNYA | Nama properti tidak mengulang konteks objeknya. | review |

### JS-2xx — Fungsi (11 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JS-201` | SEBAIKNYA | Fungsi bernama ditulis sebagai function declaration; callback anonim memakai arrow function. | prefer-arrow-callback (bagian callback) |
| `JS-202` | SEBAIKNYA | Satu fungsi melakukan satu hal, pada satu tingkat abstraksi, dengan nama yang menjelaskan apa yang dilakukan. | review |
| `JS-203` | SEBAIKNYA | Maksimal tiga parameter. Lebih dari itu, gunakan satu objek parameter dengan destructuring. | @typescript-eslint/max-params (3) |
| `JS-204` | WAJIB | Parameter tidak di-reassign dan propertinya tidak diubah. | no-param-reassign (props) |
| `JS-205` | WAJIB | Nilai default memakai sintaks default parameter, diletakkan di akhir, dan tanpa efek samping. | @typescript-eslint/default-param-last |
| `JS-206` | WAJIB | Gunakan rest parameter (...args), bukan arguments; gunakan spread, bukan apply. | prefer-rest-params, prefer-spread |
| `JS-207` | SEBAIKNYA | Flag boolean tidak dipakai untuk memilih perilaku fungsi; pecah menjadi dua fungsi. | review |
| `JS-208` | SEBAIKNYA | Fungsi tidak mengubah state global atau objek masukan; kembalikan nilai baru. | review |
| `JS-209` | DILARANG | Fungsi tidak dideklarasikan di dalam blok non-fungsi (if, while). | no-inner-declarations |
| `JS-210` | SEBAIKNYA | Arrow function dengan satu ekspresi memakai implicit return. | arrow-body-style |
| `JS-211` | WAJIB | Callback method array (map, filter, reduce, find, ...) selalu mengembalikan nilai. | array-callback-return |

### JS-3xx — Objek, array, string (12 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JS-301` | WAJIB | Objek dan array dibuat dengan literal, bukan konstruktor. | no-object-constructor, @typescript-eslint/no-array-constructor |
| `JS-302` | SEBAIKNYA | Gunakan shorthand method dan shorthand property. | object-shorthand |
| `JS-303` | SEBAIKNYA | Salin dan gabung objek atau array dengan spread, bukan Object.assign ke objek yang sudah ada. | prefer-object-spread |
| `JS-304` | WAJIB | Gunakan Object.hasOwn; method Object.prototype tidak dipanggil langsung dari objek. | no-prototype-builtins, prefer-object-has-own |
| `JS-305` | SEBAIKNYA | Gunakan destructuring untuk memakai beberapa properti. Banyak nilai kembalian dikembalikan sebagai objek, bukan array. | review |
| `JS-306` | SEBAIKNYA | Gunakan dot notation untuk properti tetap; bracket notation hanya untuk properti dinamis. | @typescript-eslint/dot-notation |
| `JS-307` | WAJIB | Gunakan template literal untuk menyusun string; string biasa bila tanpa substitusi. | prefer-template |
| `JS-308` | WAJIB | Konversi tipe eksplisit dengan Number(), String(), Boolean(). parseInt selalu dengan radix. Gunakan Number.isNaN dan Number.isFinite. | radix, no-restricted-globals |
| `JS-309` | DILARANG | Wrapper object primitif (new String, new Number, new Boolean) tidak dipakai. | no-new-wrappers |
| `JS-310` | DILARANG | Built-in object dan prototype-nya tidak dimodifikasi. | no-extend-native |
| `JS-311` | WAJIB | Iterasi koleksi memakai for...of atau method array; for...in tidak dipakai. | no-restricted-syntax (ForInStatement), @typescript-eslint/no-for-in-array |
| `JS-312` | SEBAIKNYA | Referensi this tidak disimpan ke variabel (const self = this); gunakan arrow function. | @typescript-eslint/no-this-alias |

### JS-4xx — Asynchronous (4 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JS-401` | SEBAIKNYA | Gunakan async/await, bukan callback bersarang atau rantai then panjang. | review |
| `JS-402` | WAJIB | Setiap Promise di-await, dikembalikan, atau ditangani; tidak ada promise yang dibiarkan. | @typescript-eslint/no-floating-promises, @typescript-eslint/no-misused-promises |
| `JS-403` | SEBAIKNYA | Operasi asinkron yang tidak saling bergantung dijalankan paralel dengan Promise.all / Promise.allSettled. | no-await-in-loop |
| `JS-404` | WAJIB | await hanya dipakai pada nilai yang berupa Promise/thenable. | @typescript-eslint/await-thenable |

### JS-5xx — Error dan logging (5 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JS-501` | WAJIB | Yang di-throw atau dipakai untuk reject selalu objek Error (atau turunannya). | @typescript-eslint/only-throw-error, @typescript-eslint/prefer-promise-reject-errors |
| `JS-502` | WAJIB | Blok catch tidak kosong: tangani, catat dengan konteks, atau lempar ulang. Bila sengaja diabaikan, tulis komentar alasannya. | no-empty |
| `JS-503` | SEBAIKNYA | Error yang dilempar ulang dengan konteks membawa error asal lewat opsi cause. | preserve-caught-error |
| `JS-504` | SEBAIKNYA | Setiap error ditangani satu kali: dibungkus lalu diteruskan, ATAU dicatat lalu ditangani; tidak dicatat lalu dilempar ulang di setiap lapisan. | review |
| `JS-505` | WAJIB | console.log tidak tertinggal di kode produksi; pencatatan memakai logger aplikasi. console.warn/error hanya untuk kasus yang memang perlu. | no-console |

### JS-6xx — Format, alur kontrol, komentar (12 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JS-601` | WAJIB | Format kode diserahkan ke Prettier dengan konfigurasi standar: indentasi 2 spasi, petik tunggal, titik koma, trailing comma, lebar 100, LF. | Prettier (.prettierrc.json) |
| `JS-602` | WAJIB | Blok if, for, while selalu memakai kurung kurawal. | curly |
| `JS-603` | SEBAIKNYA | Tidak ada else setelah if yang selalu return. | no-else-return |
| `JS-604` | WAJIB | Ternary tidak bersarang dan tidak dipakai bila tidak perlu. | no-nested-ternary, no-unneeded-ternary |
| `JS-605` | SEBAIKNYA | Operator berbeda yang dicampur dalam satu ekspresi diberi tanda kurung. | review |
| `JS-606` | WAJIB | switch selalu punya default di posisi terakhir; case dengan deklarasi dibungkus kurung kurawal; fall-through diberi komentar. | default-case, default-case-last, no-case-declarations, no-fallthrough |
| `JS-607` | SEBAIKNYA | Kondisi kompleks dibungkus fungsi bernama; hindari kondisi negatif ganda. | review |
| `JS-608` | SEBAIKNYA | Kedalaman blok maksimal 3; bagian yang lebih dalam dipindah ke fungsi bernama. | max-depth (3) |
| `JS-609` | WAJIB | Perbandingan memakai === dan !==. | eqeqeq |
| `JS-610` | WAJIB | Tidak ada variabel, import, atau parameter yang tidak dipakai, kode mati, atau kode yang dikomentari. | @typescript-eslint/no-unused-vars, tsconfig noUnusedLocals dan allowUnreachableCode: false |
| `JS-611` | SEBAIKNYA | Komentar menjelaskan alasan atau logika bisnis, bukan mengulang kode. Tanpa komentar jurnal; TODO/FIXME memakai format // TODO: <tiket> <isi>. | review |
| `JS-612` | SEBAIKNYA | Fungsi, class, dan type yang diekspor diberi komentar JSDoc/TSDoc. | review |

### JS-7xx — Modul (7 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JS-701` | WAJIB | Gunakan ES modules (import/export); require dan module.exports tidak dipakai di kode baru. | @typescript-eslint/no-require-imports |
| `JS-702` | WAJIB | Gunakan named export. Default export hanya bila disyaratkan framework (mis. page Next.js) dan pengecualiannya dicatat di konfigurasi lint. | no-restricted-exports |
| `JS-703` | WAJIB | Satu modul diimpor di satu pernyataan import. | no-duplicate-imports |
| `JS-704` | SEBAIKNYA | Semua import di bagian atas file, sebelum pernyataan lain. | review |
| `JS-705` | WAJIB | Binding yang dapat diubah (export let) tidak diekspor. | review |
| `JS-706` | WAJIB | Tidak ada dependensi sirkular antar modul. | review |
| `JS-707` | WAJIB | Tidak ada variabel atau fungsi global; seluruh kode berada di dalam modul. | review |

### JS-8xx — Keamanan dan data (8 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JS-801` | DILARANG | eval, new Function, dan setTimeout/setInterval dengan string tidak dipakai. | no-eval, no-new-func, @typescript-eslint/no-implied-eval |
| `JS-802` | DILARANG | Nominal uang tidak dihitung dengan tipe number; gunakan pustaka desimal (decimal.js) dan kirim nominal sebagai string desimal. | review |
| `JS-803` | WAJIB | Data dari luar (input pengguna, API, URL, storage) diperiksa tipe dan nilainya sebelum dipakai; validasi diulang di server. | review |
| `JS-804` | DILARANG | HTML tidak disisipkan dari data tak tepercaya (innerHTML, outerHTML, document.write); gunakan textContent atau sanitasi. | no-restricted-properties |
| `JS-805` | DILARANG | Secret dan token tidak ditulis di kode atau bundle frontend; hanya konfigurasi publik yang masuk bundle. | Gitleaks |
| `JS-806` | WAJIB | package-lock.json di-commit; CI memakai npm ci; .npmrc memakai ignore-scripts=true dan save-exact=true; dependency baru direview; npm audit / OSV-Scanner tanpa temuan High/Critical. | npm audit, OSV-Scanner |
| `JS-807` | WAJIB | Waktu dipertukarkan sebagai string ISO 8601 dengan zona waktu (toISOString), bukan format lokal. | review |
| `JS-808` | SEBAIKNYA | Hanya fitur ECMAScript yang sudah stabil dan didukung runtime target; proposal TC39 di bawah stage 4 tidak dipakai. | review |

### JS-9xx — Testing (2 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JS-901` | SEBAIKNYA | Satu test menguji satu konsep; nama test menjelaskan perilaku yang diharapkan. | review |
| `JS-902` | WAJIB | Unit test dijalankan di CI dan wajib lulus sebelum merge. | Vitest / Jest |

### TS-1xx — Konfigurasi (4 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `TS-101` | WAJIB | tsconfig memakai strict: true beserta noUncheckedIndexedAccess, noImplicitOverride, noImplicitReturns, dan noFallthroughCasesInSwitch. Proyek tidak melonggarkan opsi ini. | tsc (tsconfig.json standar) |
| `TS-102` | WAJIB | Type check (tsc --noEmit) dan ESLint dengan typescript-eslint strict-type-checked wajib lulus di CI. | tsc, typescript-eslint |
| `TS-103` | WAJIB | @ts-ignore dan @ts-nocheck tidak dipakai; @ts-expect-error hanya dengan penjelasan. | @typescript-eslint/ban-ts-comment |
| `TS-104` | SEBAIKNYA | Kode baru ditulis dalam TypeScript (.ts / .tsx); JavaScript hanya untuk file konfigurasi alat. | review |

### TS-2xx — Tipe (8 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `TS-201` | DILARANG | any tidak dipakai; gunakan unknown lalu narrowing, atau tipe yang spesifik. | @typescript-eslint/no-explicit-any, no-unsafe-* |
| `TS-202` | SEBAIKNYA | Type assertion (as) dan non-null assertion (!) dihindari; gunakan type guard. Literal objek tidak di-assert. | @typescript-eslint/no-non-null-assertion, consistent-type-assertions |
| `TS-203` | SEBAIKNYA | Fungsi yang diekspor menuliskan tipe parameter dan tipe kembaliannya. | @typescript-eslint/explicit-module-boundary-types |
| `TS-204` | SEBAIKNYA | Bentuk objek didefinisikan dengan interface; type dipakai untuk union, alias, dan tipe turunan. | @typescript-eslint/consistent-type-definitions (interface) |
| `TS-205` | SEBAIKNYA | Impor yang hanya berupa tipe memakai import type. | @typescript-eslint/consistent-type-imports |
| `TS-206` | WAJIB | Tipe primitif ditulis huruf kecil (string, number, boolean); String, Number, Object, Function, dan {} tidak dipakai sebagai tipe. | @typescript-eslint/no-wrapper-object-types, no-unsafe-function-type, no-empty-object-type |
| `TS-207` | WAJIB | Data dari luar (API, JSON.parse, storage) bertipe unknown dan divalidasi saat runtime (type guard atau skema seperti Zod) sebelum dipakai sebagai tipe domain. | review |
| `TS-208` | SEBAIKNYA | Tipe bersama satu domain didefinisikan di satu tempat; tidak ada definisi tipe yang sama di beberapa file. | review |

### TS-3xx — Generics dan utility types (3 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `TS-301` | SEBAIKNYA | Turunan tipe memakai utility types (Partial, Pick, Omit, Readonly, Record), bukan menyalin bentuk tipe. | review |
| `TS-302` | SEBAIKNYA | Data yang tidak boleh diubah ditandai readonly, ReadonlyArray, atau as const. | review |
| `TS-303` | SEBAIKNYA | Parameter generic hanya dipakai bila menghubungkan beberapa posisi tipe; generic yang dipakai sekali tidak dibuat. | @typescript-eslint/no-unnecessary-type-parameters |

### TS-4xx — Union, enum, narrowing (3 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `TS-401` | SEBAIKNYA | Himpunan nilai tetap memakai union literal atau objek as const. enum hanya bila dibutuhkan, tanpa enum campuran string-angka. | @typescript-eslint/no-mixed-enums (sebagian) |
| `TS-402` | WAJIB | switch atas union diperiksa lengkap (exhaustive), dengan cabang default bertipe never. | @typescript-eslint/switch-exhaustiveness-check |
| `TS-403` | SEBAIKNYA | State dengan bentuk berbeda dimodelkan sebagai discriminated union. | review |

### TS-5xx — Null safety dan deklarasi (4 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `TS-501` | SEBAIKNYA | Gunakan optional chaining (?.) dan nullish coalescing (??), bukan rantai && atau \|\| untuk nilai default. | @typescript-eslint/prefer-optional-chain, prefer-nullish-coalescing |
| `TS-502` | SEBAIKNYA | Parameter callback tidak ditandai opsional bila pemanggil selalu mengirimnya. | review |
| `TS-503` | SEBAIKNYA | Overload diurutkan dari yang paling spesifik ke paling umum; bila overload hanya beda tipe satu parameter, gunakan union. | @typescript-eslint/unified-signatures |
| `TS-504` | WAJIB | namespace dan declare module global tidak dipakai di kode aplikasi; gunakan ES module. | @typescript-eslint/no-namespace |

## Bukti Penegakan

Konfigurasi diuji pada 1 November 2026 dengan ESLint 10.14.0, typescript-eslint 8.72.1, TypeScript 6.0.3, Prettier 3.9.10, dan Node.js 22:

- [`examples/benar`](examples/benar/): `tsc` lulus, ESLint **0 temuan**, Prettier rapi.
- [`examples/salah`](examples/salah/): ESLint menemukan 39 pelanggaran, mencakup JS-101, JS-102, JS-103, JS-204, JS-306, JS-307, JS-308, JS-311, JS-402, JS-403, JS-501, JS-502, JS-505, JS-602, JS-604, JS-609, JS-610, JS-702, JS-801, JS-804, TS-103, TS-201, TS-202, dan TS-203.
- `eslint-config-prettier` mematikan `curly`; konfigurasi mengaktifkannya kembali di bagian akhir (JS-602).
- `npm audit` pada dependency runtime: 0 kerentanan. Pada dev dependency ada 12 temuan **moderate** (minimatch, lewat ESLint); tidak ada High/Critical.

## Referensi

- Airbnb JavaScript Style Guide — https://github.com/airbnb/javascript
- Google JavaScript Style Guide — https://google.github.io/styleguide/jsguide.html
- MDN, Guidelines for writing JavaScript code examples — https://developer.mozilla.org/en-US/docs/MDN/Writing_guidelines/Code_style_guide/JavaScript
- W3C Wiki, JavaScript best practices — https://www.w3.org/wiki/JavaScript_best_practices
- clean-code-javascript — https://github.com/ryanmcdermott/clean-code-javascript
- JavaScript The Right Way — https://jstherightway.org
- es6-cheatsheet — https://github.com/DrkSephy/es6-cheatsheet
- Steve Kwan, JavaScript gotchas dan best practices — https://github.com/stevekwan/best-practices
- adamlu, JavaScript style guide — https://github.com/adamlu/javascript-style-guide
- ezbackend, TypeScript best practices — https://github.com/ezbackend/TypeScript-best-practices
- typescript-eslint — https://typescript-eslint.io

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| [`Standar_JavaScript_TypeScript.xlsx`](Standar_JavaScript_TypeScript.xlsx) | Daftar aturan lengkap (sumber utama) |
| [`eslint.config.js`](eslint.config.js) | Konfigurasi ESLint standar (flat config) |
| [`tsconfig.json`](tsconfig.json) | Konfigurasi TypeScript standar |
| [`.prettierrc.json`](.prettierrc.json) | Konfigurasi format |
| [`npmrc.template`](npmrc.template) | Kontrol supply chain npm; salin sebagai `.npmrc` |
| [`package.json`](package.json), `package-lock.json` | Versi alat yang diuji |
| [`checklist-review.md`](checklist-review.md) | Checklist review untuk aturan yang tidak dapat dicek alat |
| [`examples/`](examples/) | Contoh kode benar dan salah |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
