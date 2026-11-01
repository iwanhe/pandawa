# Checklist Review — JavaScript & TypeScript

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** wajib dirujuk ke ID aturan di komentar review.

> Checklist awal. Item akan dipetakan ke ID aturan `JS`, `TS` setelah file aturan selesai disusun.

| # | Item | Hasil |
|---|---|---|
| 1 | `tsconfig` memakai `strict: true` | |
| 2 | Tidak ada `any` tanpa komentar alasan; pakai `unknown` lalu narrowing | |
| 3 | `const` sebagai default; `var` tidak dipakai | |
| 4 | Perbandingan memakai `===` / `!==` | |
| 5 | Tidak ada promise yang tidak di-await atau tidak ditangani | |
| 6 | Error ditangani dan tidak ditelan diam-diam | |
| 7 | Tidak ada `eval` / `new Function` | |
| 8 | Nominal keuangan tidak diproses dengan tipe `number` | |
| 9 | Tidak ada `console.log` sisa debug | |
| 10 | Lockfile di-commit; CI memakai `npm ci` | |
| 11 | Dependency baru sudah direview (aktif dirawat, lisensi, install script) | |
| 12 | ESLint, Prettier, dan type check lulus | |
