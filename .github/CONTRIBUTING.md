# Panduan Kontribusi

> 🇬🇧 *In short:* open an issue first, branch from `main`, follow the naming & coding standards, prefix commits with the task ID, export changes with ADT, and open a pull request using the template. Never commit credentials.

Terima kasih sudah mau berkontribusi ke PANDAWA! Dengan berpartisipasi, Anda setuju mengikuti [Kode Etik](https://github.com/iwanhe/pandawa/blob/main/.github/CODE_OF_CONDUCT.md).

## Sebelum mulai

1. **Cari atau buka issue** dulu — gunakan template *Bug report* atau *Feature request*. Untuk celah keamanan, ikuti [SECURITY.md](https://github.com/iwanhe/pandawa/blob/main/.github/SECURITY.md).
2. Baca standar yang berlaku:
   - [Oracle Dev Standards v1.1](https://github.com/iwanhe/pandawa/blob/main/oracle-dev-standards-v1.1.md)
   - [Naming Convention](https://github.com/iwanhe/pandawa/blob/main/naming-convention-oracle.md) — prefix `XTD_` (EBS) dan `APX_` (APEX)
   - [Kebijakan Manajemen Perubahan](https://github.com/iwanhe/pandawa/blob/main/Kebijakan_Manajemen_Perubahan_IT_Upstream_Development.md)
3. Siapkan tools: Git, SQLcl, Python 3.10+, dan [ADT](https://github.com/jkvetina/ADT). Lihat [Quick Start](https://github.com/iwanhe/pandawa/wiki/Quick-Start).

## Alur kerja

1. **Branch** dari `main`: `feature/<TASK_ID>-<deskripsi-singkat>` atau `fix/<TASK_ID>-<deskripsi>`.
2. **Develop di DEV** (database + APEX Builder), bukan di UAT/Production.
3. **Export** perubahan:
   ```bash
   adt export_db -recent 7
   adt export_apex -app <APP_ID> -only -split -readable -recent 0
   ```
4. **Commit** dengan prefix task ID:
   ```
   FRITS-123: tambah validasi tanggal request
   ```
5. **Buat patch**: `adt patch -target UAT -patch <TASK_ID> -create`.
6. **Pull request** ke `main` — isi template PR selengkapnya, termasuk langkah test dan rollback.
7. Setelah review: Pre-UAT Quality Gate (QG010) → UAT & sign-off BPO → Change Request approved → deploy Production.

Detail alur: [Deployment & CI/CD](https://github.com/iwanhe/pandawa/wiki/Deployment-CICD).

## Standar kode (ringkas)

- Lowercase, indentasi 3 spasi, koma di depan, anchored declaration (`%type`, `%rowtype`).
- Variabel: `l_` local · `g_` global · `k_` constant · `p_` IN · `x_` OUT · `r_` record · `t_` collection · `e_` exception.
- Setiap package punya function `package_version`.
- Header komentar di setiap file: author, tanggal, ringkasan perubahan.
- Script DDL dan DML dipisah, idempotent bila memungkinkan, dan **selalu ada rollback**.
- Aplikasi APEX lolos scan **APEX SERT** sebelum UAT.

## Dokumentasi

- Folder baru wajib punya `README.md`.
- Perubahan struktur repo → update `README.md` utama dan wiki.
- Aplikasi APEX baru untuk gallery → tambahkan ke `custom_apps.json` (otomatis tampil di [situs](https://iwanhe.github.io/pandawa/)).

## Yang tidak boleh di-commit

❌ Password, wallet, token, `connections.yaml` berisi kredensial, file `.env`
❌ Data produksi atau data pribadi
❌ Nama host/IP server internal dan dump database

Jika terlanjur ter-commit, segera hubungi maintainer dan ganti (rotate) kredensial tersebut.

## Pertanyaan

Buka [GitHub Issue](https://github.com/iwanhe/pandawa/issues) atau lihat [FAQ](https://github.com/iwanhe/pandawa/wiki/FAQ).
