# Pandawa

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Language: PLSQL](https://img.shields.io/badge/Language-PLSQL-orange.svg)]

Deskripsi singkat:
Pandawa adalah kumpulan skrip PL/SQL/Oracle yang dirancang untuk membantu membangun, mengelola, dan menguji logika database. README ini memberikan panduan cepat untuk menyiapkan lingkungan, menjalankan skrip, dan berkontribusi.

Fitur utama
- Kumpulan paket, prosedur, dan fungsi PL/SQL yang terorganisir
- Skrip instalasi dan migrasi basis data (deploy scripts)
- Struktur yang memudahkan pengujian dan otomasi
- Lisensi MIT — bebas digunakan dan dimodifikasi

Bahasa
- PLSQL (PL/SQL untuk Oracle Database)

Prasyarat
- Oracle Database (versi sesuai kebutuhan proyek)
- Client SQL seperti SQL*Plus, SQLcl, atau tool GUI (SQL Developer, DBeaver, dll.)
- (Opsional) Docker jika ingin menjalankan Oracle Database dalam container
- (Opsional) utPLSQL untuk menjalankan unit test PL/SQL

Struktur repositori (contoh)
- /src         - skrip sumber PL/SQL (package, procedure, function)
- /migrations  - skrip migrasi/instalasi versi
- /tests       - skrip test (utPLSQL atau framework test lainnya)
- /docs        - dokumentasi tambahan
- /tools       - skrip bantu (deploy, format, dll.)

Instalasi / Quickstart
1. Clone repositori
   git clone https://github.com/iwanhe/pandawa.git

2. Siapkan koneksi ke Oracle Database (contoh menggunakan SQLcl atau SQL*Plus)
   - SQLcl:
     sql / as sysdba
     atau
     sql user/password@//host:port/service_name

   - SQL*Plus:
     sqlplus user/password@//host:port/service_name

3. Jalankan skrip instalasi/migrasi
   - Jalankan skrip utama instalasi (sesuaikan nama file yang ada pada folder migrations):
     @migrations/001_create_schema.sql
   - Atau jalankan seluruh skrip di folder src:
     -- contoh menggunakan SQL*Plus:
     @src/install_all.sql

4. Menjalankan test (opsional)
   - Instal dan jalankan utPLSQL jika tersedia:
     - Pasang utPLSQL di database.
     - Jalankan test suite:
       @tests/run_all_utplsql.sql

Tips pengembangan
- Gunakan format kode konsisten untuk PL/SQL (indentasi, penamaan)
- Simpan perubahan skema sebagai skrip migrasi baru di folder migrations
- Pastikan setiap perubahan logika database memiliki test yang relevan

Contoh penggunaan
- Memanggil prosedur:
  BEGIN
    schema_name.proc_name(p_param1 => 'value', p_param2 => 123);
  END;
  /

- Menjalankan fungsi:
  SELECT schema_name.func_name('value') FROM DUAL;

Kontribusi
Terima kasih atas minat berkontribusi! Berikut cara berkontribusi:
1. Fork repositori ini
2. Buat cabang fitur: git checkout -b feat/awesome-feature
3. Tambahkan kode dan dokumentasi, sertakan skrip migrasi bila perlu
4. Tambahkan atau perbarui test
5. Buat Pull Request dari fork Anda ke repositori ini

Silakan sertakan deskripsi perubahan, langkah reproduksi, serta catatan migrasi jika ada.

Kode Etik
Harap patuhi standar kontributor yang sopan dan profesional saat membuat issue atau PR. Gunakan bahasa yang jelas dan sertakan contoh bila memungkinkan.

Isu dan Pelaporan Bug
- Buat issue baru pada tab "Issues" di GitHub dan sertakan:
  - Langkah untuk mereproduksi
  - Versi Oracle / client yang digunakan
  - Log error atau stack trace jika ada
  - Skrip atau payload contoh yang menyebabkan masalah

Roadmap (ide)
- Menambahkan CI untuk menjalankan utPLSQL tests otomatis
- Menyediakan containerized dev environment (Docker)
- Dokumentasi API PL/SQL yang lebih lengkap (reference per package/function)

License
Proyek ini dilisensikan di bawah MIT License — lihat file LICENSE untuk detail.

Kontak
- Pemilik / Maintainer: iwanhe (https://github.com/iwanhe)
- Untuk pertanyaan atau permintaan fitur, buka issue di repositori.

Catatan akhir
README ini dibuat sebagai template awal berdasarkan struktur umum proyek PL/SQL. Silakan beri tahu bagian mana yang ingin Anda tambahkan atau sesuaikan (mis. contoh skrip, instruksi deploy, atau policy kontribusi). Saya bisa memperbarui README dan/atau langsung commit ke repositori jika Anda mengizinkan.