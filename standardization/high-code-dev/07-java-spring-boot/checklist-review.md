# Checklist Review — Java Spring Boot

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** wajib dirujuk ke ID aturan di komentar review.

> Checklist awal. Item akan dipetakan ke ID aturan `JSB` setelah file aturan selesai disusun.

| # | Item | Hasil |
|---|---|---|
| 1 | Package diorganisasi per domain, bukan per layer teknis saja | |
| 2 | Controller tipis; logika bisnis di service | |
| 3 | Entity tidak diekspos langsung sebagai respons API; pakai DTO | |
| 4 | Nominal keuangan memakai BigDecimal | |
| 5 | Batas transaksi (`@Transactional`) jelas dan di layer service | |
| 6 | Perubahan skema lewat Flyway | |
| 7 | Input divalidasi (Bean Validation); error mengikuti model error standar | |
| 8 | Endpoint dilindungi; token diverifikasi dan tidak bisa dimatikan lewat konfigurasi | |
| 9 | Tidak ada secret di `application.yml` yang di-commit | |
| 10 | Log JSON dengan ID korelasi; health check tersedia | |
| 11 | Test unit dan integrasi (Testcontainers) lulus | |
| 12 | Pemindaian dependency dan image tanpa temuan kritis/tinggi | |
