# Checklist Review — ReactJS

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** wajib dirujuk ke ID aturan di komentar review.

> Checklist awal. Item akan dipetakan ke ID aturan `RCT` setelah file aturan selesai disusun.

| # | Item | Hasil |
|---|---|---|
| 1 | Komponen PascalCase, satu komponen utama per file | |
| 2 | Hanya function component | |
| 3 | Aturan hooks dipatuhi (lint react-hooks lulus) | |
| 4 | `key` pada list memakai ID stabil, bukan index | |
| 5 | State diletakkan sedekat mungkin dengan pemakainya | |
| 6 | Tidak ada kalkulasi bisnis atau keputusan otorisasi di komponen | |
| 7 | Tidak ada `dangerouslySetInnerHTML` tanpa sanitasi dan alasan | |
| 8 | Token tidak disimpan di localStorage | |
| 9 | Elemen interaktif dapat diakses keyboard dan punya label | |
| 10 | Test untuk perilaku penting tersedia dan lulus | |
