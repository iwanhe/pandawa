# Contoh Kode — React Native

Contoh **benar** adalah seluruh isi [`../template`](../template/), yang lulus typecheck, lint, test, dan bundle.

Contoh **salah** di folder ini diadaptasi dari kode boilerplate sumber ([`mobile-boilerplate-reactnative`](https://github.com/dimaswahyu-official/mobile-boilerplate-reactnative), commit `583dfbb`). Nama file diawali ID aturan utama yang dilanggar; komentar di baris pertama menyebut file asal dan aturan lain yang ikut dilanggar.

```
examples/
├── lint-salah.sh                           menjalankan ESLint template terhadap contoh salah
└── salah/
    ├── RN-203_touchable_dan_teks_mentah.tsx
    ├── RN-301_inline_style_warna_literal.tsx
    ├── RN-402_navigator_tanpa_tipe.tsx
    ├── RN-503_service_menampilkan_ui.ts
    └── RN-801_token_di_asyncstorage.ts
```

## Menjalankan

```bash
cd ../template && npm ci && cd ../examples
bash lint-salah.sh     # harus menampilkan pelanggaran (hasil uji 5 Nov 2026: 30)
```

Skrip menyalin contoh ke `template/.lint-salah/` agar memakai `node_modules` dan konfigurasi template, lalu menghapusnya lagi.

RN-503 (service menampilkan Toast) tidak tertangkap alat dan diperiksa saat review.
