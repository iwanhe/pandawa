# Checklist Review — CI/CD Oracle APEX

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** wajib dirujuk ke ID aturan di komentar review.

> Checklist awal. Item akan dipetakan ke ID aturan `CIA` setelah file aturan selesai disusun.

| # | Item | Hasil |
|---|---|---|
| 1 | PR mencantumkan nomor task / CR | |
| 2 | Patch dibuat dengan ADT dan berisi script deploy serta rollback | |
| 3 | Validasi PR lulus tanpa akses secret | |
| 4 | Gitleaks bersih | |
| 5 | Log ADT diperiksa untuk `[ERROR]`, bukan hanya exit code | |
| 6 | Password tersamarkan di log yang diunggah | |
| 7 | Backup APEX diambil sebelum deploy | |
| 8 | Deploy UAT berhasil dan bukti `evidence-UAT-<task>` tersimpan | |
| 9 | PROD: dari `main`, ada nomor CR dan bukti SERT/Advisor | |
| 10 | Objek di database EBS mematuhi online patching (EBR) | |
| 11 | GitHub Action baru dikunci ke commit SHA | |
