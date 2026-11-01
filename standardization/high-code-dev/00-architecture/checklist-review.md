# Checklist Review — Arsitektur High-Code

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** wajib dirujuk ke ID aturan di komentar review.

> Checklist awal. Item akan dipetakan ke ID aturan `ARC` setelah file aturan selesai disusun.

| # | Item | Hasil |
|---|---|---|
| 1 | Profil aplikasi ditetapkan (Mandiri / Oracle EBS / SAP) | |
| 2 | Setiap slot di tujuh lapisan terisi, atau ditandai tidak dipakai dengan alasan | |
| 3 | Setiap data punya system of record yang jelas | |
| 4 | Integrasi ERP hanya lewat jalur resmi (public API / released API), tanpa DML langsung | |
| 5 | Asumsi beban tertulis beserta sumber angkanya (contoh, asumsi, atau hasil ukur) | |
| 6 | Kalkulasi sizing lulus validasi dan menyisakan cadangan kapasitas | |
| 7 | Setiap komponen punya pemilik operasional dan upstream-nya masih aktif dirawat | |
| 8 | Secret disimpan di secret store, bukan di konfigurasi atau repo | |
| 9 | Logging, monitoring, dan alert dirancang | |
| 10 | Backup dan restore dirancang, termasuk jadwal uji restore | |
| 11 | Penyimpangan dari katalog dicatat sebagai ADR | |
