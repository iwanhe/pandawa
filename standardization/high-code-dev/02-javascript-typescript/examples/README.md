# Contoh Kode — JavaScript & TypeScript

Setiap file diawali ID aturan utama yang dicontohkan. Komentar di baris pertama menyebut aturan lain yang ikut ditunjukkan (benar) atau dilanggar (salah).

```
examples/
├── benar/   tsc lulus, ESLint 0 temuan
│   ├── JS-203_objek_parameter.ts
│   ├── JS-402_async_paralel.ts
│   ├── JS-802_nominal_desimal.ts
│   ├── TS-207_validasi_data_luar.ts
│   └── TS-402_union_exhaustive.ts
└── salah/   sengaja melanggar; ESLint harus menemukan pelanggaran
    ├── JS-101_gaya_lama.ts
    ├── JS-402_promise_diabaikan.ts
    ├── JS-702_default_export.ts
    └── JS-804_innerhtml_eval.ts
```

## Menjalankan

Dari folder `02-javascript-typescript`:

```bash
npm ci
npm run typecheck          # tsc lulus untuk benar dan salah (pelanggaran ada di level lint)
npm run lint:benar         # harus 0 temuan
npm run lint:salah         # harus menampilkan pelanggaran
npm run format:check
```

Folder ini juga berfungsi sebagai uji regresi: bila `eslint.config.js` diubah, jalankan kedua perintah lint dan pastikan hasilnya tetap sama.
