# Checklist Review — NestJS

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** wajib dirujuk ke ID aturan di komentar review.

> Checklist awal. Item akan dipetakan ke ID aturan `NST` setelah file aturan selesai disusun.

| # | Item | Hasil |
|---|---|---|
| 1 | Satu modul per domain; tidak ada import silang yang melanggar batas modul | |
| 2 | Controller tipis; logika bisnis di service | |
| 3 | DTO divalidasi dengan ValidationPipe (whitelist, forbidNonWhitelisted) | |
| 4 | Nominal keuangan tidak memakai `number`; NUMERIC dibaca sebagai string/desimal | |
| 5 | Perubahan skema lewat migrasi terversi | |
| 6 | Error dipetakan lewat exception filter ke model error standar | |
| 7 | Guard memverifikasi token di setiap endpoint yang dilindungi | |
| 8 | Konfigurasi divalidasi saat start; tidak ada secret di repo | |
| 9 | Log JSON dengan ID korelasi; health check tersedia | |
| 10 | Test unit dan e2e lulus | |
| 11 | Lockfile di-commit; `npm ci`; pemindaian dependency dan image bersih | |
