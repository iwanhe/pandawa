# Checklist Review — Next.js

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** wajib dirujuk ke ID aturan di komentar review.

> Checklist awal. Item akan dipetakan ke ID aturan `NXT` setelah file aturan selesai disusun.

| # | Item | Hasil |
|---|---|---|
| 1 | Komponen default Server Component; `'use client'` hanya bila perlu interaktivitas | |
| 2 | Data sensitif dan secret tidak pernah sampai ke Client Component | |
| 3 | Hanya variabel `NEXT_PUBLIC_*` yang boleh terekspos ke browser | |
| 4 | Server Action dan Route Handler memvalidasi input dan memeriksa otorisasi | |
| 5 | Strategi caching dan revalidation dinyatakan eksplisit | |
| 6 | `loading` dan `error` disediakan untuk route penting | |
| 7 | Gambar memakai `next/image`, font memakai `next/font` | |
| 8 | ESLint (eslint-config-next) dan build lulus | |
