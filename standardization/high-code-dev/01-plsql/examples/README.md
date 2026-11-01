# Contoh Kode — PL/SQL & Oracle APEX

Setiap file diawali ID aturan utama yang dicontohkan. Komentar di awal file menyebut aturan lain yang ikut ditunjukkan (benar) atau dilanggar (salah).

```
examples/
├── benar/
│   ├── PLS-402_apx_prism_vendor_pkg.pks / .pkb   package lengkap: penamaan, versi, JavaDoc, Logger, exception
│   ├── PLS-604_bulk_collect_forall.sql
│   ├── PLS-801_sql_dinamis_bind.sql
│   ├── PLS-903_konteks_ebs.sql
│   ├── APX-204_dynamic_view.sql
│   └── APX-404_lov_view.sql
└── salah/
    ├── PLS-302_format_tidak_standar.sql
    ├── PLS-702_when_others_null.sql
    ├── PLS-801_sql_dinamis_konkatenasi.sql
    ├── PLS-901_dml_langsung_tabel_ebs.sql
    ├── APX-204_dynamic_view_tanpa_materialize.sql
    └── APX-301_substitution_di_sql.sql
```

## Status verifikasi

- Contoh **belum dikompilasi di database Oracle**. Yang sudah diperiksa: format contoh `benar` (huruf kecil, indentasi 3 spasi, tanpa tab, koma di depan) dan sintaks SQL kedua view dengan parser.
- Contoh merujuk tabel ilustrasi (`apx_prism_vendor`, `apx_prism_status_ref`, `xtd_fnd_api_context`) dan Logger. Untuk mengompilasi, buat tabel tersebut di schema DEV atau sesuaikan nama tabelnya.
- `PLS-903_konteks_ebs.sql` hanya dapat dikompilasi di database Oracle EBS.

## Aturan menulis contoh

- Contoh sesingkat mungkin, hanya cukup untuk menunjukkan aturannya.
- Tidak berisi data, nama server, atau kredensial asli.
- Komentar di contoh `salah` menyebut aturan yang dilanggar.
