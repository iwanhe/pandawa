# Template Aturan

Semua aturan di setiap standar ditulis di file Excel dengan kolom berikut. Gunakan [`Template_Aturan_Standar.xlsx`](Template_Aturan_Standar.xlsx).

| Kolom | Wajib | Isi |
|---|:-:|---|
| ID | Ya | Prefix standar + nomor tiga digit, mis. `PLS-301`. Ratusan menunjukkan kategori. |
| Kategori | Ya | Sesuai rentang di README standar |
| Aturan | Ya | Satu kalimat yang dapat diperiksa benar/salahnya |
| Level | Ya | WAJIB / DILARANG / SEBAIKNYA / BOLEH |
| Mandiri, Oracle EBS, SAP | Ya | Berlaku untuk profil mana: W / K / — |
| Alasan | Ya | Mengapa aturan ini ada |
| Contoh benar | Disarankan | Potongan kode singkat |
| Contoh salah | Disarankan | Potongan kode singkat |
| Penegakan | Ya | Otomatis / Review manual |
| Alat | Bila otomatis | Nama alat dan rule, mis. `ESLint: eqeqeq` |
| Referensi | Ya | Sumber asal aturan |
| Status | Ya | Draft / Review / Resmi / Dicabut |
| Sejak versi | Ya | Versi standar saat aturan pertama kali berlaku |

## Contoh

| Kolom | Isi |
|---|---|
| ID | `PLS-301` |
| Kategori | Format kode |
| Aturan | Indentasi memakai 3 spasi, tanpa tab. |
| Level | WAJIB |
| Mandiri / Oracle EBS / SAP | K / W / — |
| Alasan | Format seragam memudahkan review dan diff. |
| Contoh benar | `begin` ↵ `   l_total := 0;` |
| Contoh salah | `begin` ↵ `\tl_total := 0;` |
| Penegakan | Review manual |
| Alat | — |
| Referensi | oracle-dev-standards-v1.1.md |
| Status | Draft |
| Sejak versi | 0.1.0 |

## Cara menulis aturan yang baik

- Satu aturan, satu hal. Pecah aturan yang memakai kata "dan" untuk dua tindakan berbeda.
- Dapat diperiksa: reviewer bisa menjawab "dipatuhi" atau "tidak" tanpa debat.
- Utamakan aturan yang bisa ditegakkan alat otomatis.
- Alasan menjelaskan risiko yang dicegah, bukan mengulang aturan.
