# Contoh Kode — ReactJS

Setiap file diawali ID aturan utama yang dicontohkan. Komentar di baris pertama menyebut aturan lain yang ikut ditunjukkan (benar) atau dilanggar (salah).

```
examples/
├── benar/   tsc lulus, ESLint 0 temuan, test lulus
│   ├── RCT-101_SupplierTable.tsx          (+ RCT-101_SupplierTable.test.tsx)
│   ├── RCT-304_useDebouncedValue.ts
│   ├── RCT-403_usePengajuanReducer.ts
│   ├── RCT-501_Toggle.tsx                 compound components + controlled props
│   └── RCT-602_LazyLaporan.tsx
└── salah/   sengaja melanggar
    ├── RCT-301_komponen_bermasalah.tsx
    └── RCT-303_effect_keliru.tsx
```

## Menjalankan

Dari folder `03-reactjs`:

```bash
npm ci
npm run typecheck
npm run lint:benar     # harus 0 temuan
npm run lint:salah     # harus menampilkan pelanggaran
npm test
```
