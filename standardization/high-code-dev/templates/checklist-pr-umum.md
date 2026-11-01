# Checklist PR Umum

Berlaku untuk semua pull request, apa pun teknologinya. Lengkapi dengan `checklist-review.md` dari standar yang relevan.

| # | Item | Hasil |
|---|---|---|
| 1 | Nomor task / CR dan ringkasan perubahan tercantum di PR | |
| 2 | Profil aplikasi dan standar yang berlaku diketahui | |
| 3 | Pipeline CI (format, lint, test, scan) lulus | |
| 4 | Tidak ada password, token, atau kunci di kode, konfigurasi, atau riwayat commit | |
| 5 | Tidak ada akses atau DML langsung ke database ERP | |
| 6 | Otorisasi dan kalkulasi bisnis diputuskan di server | |
| 7 | Query database berparameter | |
| 8 | Nominal keuangan memakai tipe desimal eksak | |
| 9 | Error tidak ditelan diam-diam dan tercatat di log tanpa data rahasia | |
| 10 | Dependency baru sudah direview; temuan High/Critical nol | |
| 11 | Test untuk perubahan tersedia dan lulus | |
| 12 | Script deploy dan rollback tersedia (bila ada perubahan database) | |
| 13 | Dokumentasi terkait diperbarui | |
| 14 | Penyimpangan dari standar punya ADR atau waiver | |
