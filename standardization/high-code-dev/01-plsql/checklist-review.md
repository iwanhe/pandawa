# Checklist Review — PL/SQL & Oracle APEX

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** dirujuk ke ID aturan di komentar review.

## Prasyarat (dilampirkan di PR)

| Periksa | Hasil |
|---|---|
| Objek terkompilasi tanpa error dengan `PLSQL_WARNINGS='ENABLE:ALL'`; warning ditinjau | |
| Objek di database EBS: ADZDDBCC dan GSCC tanpa pelanggaran (PLS-906) | |
| APEX Advisor dijalankan, temuan ditindaklanjuti (APX-601) | |
| Embedded Code Report ditinjau; kode inline baru beralasan (APX-210) | |
| Sebelum UAT/go-live: APEX SERT tanpa temuan High/Critical (APX-602) | |
| Unit test utPLSQL untuk package yang diubah lulus, bila ada (APX-603) | |

## Aturan yang Diperiksa Manual

Daftar ini memuat aturan yang paling sering dilanggar. Daftar lengkap ada di `Standar_PLSQL_APEX.xlsx`.

### Penamaan dan format

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `PLS-101` | WAJIB | Objek custom Oracle EBS dinamai XTD_<APP>_<NAMA>[_SUFFIX]; <APP> adalah short name modul EBS (AP, GL, INV, ...). Objek khusus satu entitas memakai XTD_<ENTITAS>_ (mis. XTD_NTI_). | |
| `PLS-102` | WAJIB | Objek database untuk aplikasi APEX dinamai APX_<KODEAPP>_<NAMA>[_SUFFIX]; <KODEAPP> adalah kode aplikasi APEX (PRISM, SIPP, ...). | |
| `PLS-103` | WAJIB | Suffix objek: _V view, _MV materialized view, _S sequence, _PKG package, _FNC function, _PRC procedure, _TRG trigger, _VS value set, _LK lookup, _GTT global temporary table, _OT object type. | |
| `PLS-104` | WAJIB | Constraint dinamai <TABEL>_PK, <TABEL>_<TABEL_RUJUKAN>_FK[n], <TABEL>_<PERAN>_UK[n]. Index unik <TABEL>_U<n>, non-unik <TABEL>_N<n>; index constraint mengikuti nama constraint. | |
| `PLS-201` | WAJIB | Prefix identifier: g_ global, l_ lokal, k_ konstanta, r_ record, t_ collection, o_ object, e_ exception. Cursor berakhiran _cur. Tipe berakhiran _type (r_<nama>_type, t_<nama>_type). | |
| `PLS-202` | WAJIB | Parameter IN berprefix p_; parameter OUT dan IN OUT berprefix x_. Parameter cursor berprefix p_. | |
| `PLS-203` | WAJIB | Variabel yang mengacu kolom atau baris tabel dideklarasikan dengan %TYPE / %ROWTYPE. | |
| `PLS-301` | WAJIB | Seluruh kode (keyword, nama objek, variabel) ditulis huruf kecil. | |
| `PLS-302` | WAJIB | Indentasi 3 spasi, tanpa tab. | |
| `PLS-304` | WAJIB | Koma ditulis di depan elemen daftar (kolom, parameter). | |

### Dokumentasi dan versi

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `PLS-307` | WAJIB | Setiap subprogram publik di package spec diberi komentar JavaDoc (deskripsi, @param, @return, @throws, @example bila perlu). | |
| `PLS-308` | WAJIB | Setiap file script diawali header: nama script, author, tanggal, tujuan, nomor tiket/CR, dependency. | |
| `PLS-402` | WAJIB | Setiap package punya function package_version yang mengembalikan versi XX.YY.ZZ dan memuat riwayat versi di komentarnya. | |
| `PLS-403` | WAJIB | Kenaikan versi: XX bila perubahan besar lintas package; YY bila spec berubah; ZZ bila hanya body berubah. Pekerjaan belum selesai ditandai WIP. | |
| `PLS-404` | WAJIB | Script deploy idempotent (create or replace atau dicek dulu) dan disertai script rollback. | |

### SQL dan performa

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `PLS-501` | WAJIB | INSERT selalu menyebut kolom target. | |
| `PLS-502` | WAJIB | Setiap tabel dalam query diberi alias, dan kolom dirujuk lewat alias. | |
| `PLS-503` | WAJIB | Join memakai sintaks ANSI. NATURAL JOIN tidak dipakai. | |
| `PLS-504` | WAJIB | ORDER BY memakai nama kolom, bukan nomor posisi. | |
| `PLS-510` | DILARANG | Kolom LOB tidak dipakai sebagai kunci perbandingan (WHERE, GROUP BY, ORDER BY, DISTINCT, join). | |
| `PLS-601` | WAJIB | Cursor yang dibuka eksplisit selalu ditutup, termasuk di blok exception. | |
| `PLS-604` | WAJIB | Pemrosesan lebih dari 4 baris memakai satu perintah SQL set-based, atau BULK COLLECT (dengan LIMIT untuk volume besar) dan FORALL. | |

### Exception dan logging

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `PLS-701` | WAJIB | Logging memakai Logger (OraOpenSource) dengan scope <package>.<subprogram>. | |
| `PLS-702` | DILARANG | WHEN OTHERS selalu mencatat error lalu raise ulang, atau mengembalikan status error yang terdokumentasi di kontrak. WHEN OTHERS THEN NULL tidak dipakai. | |
| `PLS-704` | WAJIB | Nomor dan pesan error aplikasi didefinisikan sebagai konstanta di package; raise_application_error tidak memakai angka langsung. | |
| `PLS-705` | WAJIB | Pesan error untuk pengguna tidak memuat SQLERRM mentah atau struktur tabel; detail teknis hanya dicatat di log. | |

### Keamanan

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `PLS-406` | WAJIB | Kode sensitif keamanan memakai definer rights; package utilitas memakai invoker rights. Grant hanya hak minimum yang dibutuhkan. | |
| `PLS-801` | WAJIB | SQL dinamis memakai bind variable (EXECUTE IMMEDIATE ... USING). Nilai input tidak digabung ke string SQL. | |
| `PLS-802` | WAJIB | Identifier dinamis (nama tabel, kolom, schema) divalidasi dengan DBMS_ASSERT sebelum disusun ke SQL. | |
| `PLS-804` | DILARANG | Password, token, nomor kartu, dan data pribadi tidak ditulis ke log. | |
| `PLS-805` | DILARANG | Kredensial tidak disimpan di kode, substitution string, atau tabel tanpa enkripsi. Gunakan Oracle Wallet atau APEX Web Credentials. | |

### Oracle EBS (bila objek di database EBS)

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `PLS-901` | DILARANG | Transaksi ke EBS hanya lewat public API atau open interface Oracle yang dibungkus package custom. DML langsung ke tabel standar EBS tidak dipakai. | |
| `PLS-902` | DILARANG | Objek standar Oracle (package, view, form, report, workflow) tidak dimodifikasi. | |
| `PLS-903` | WAJIB | Kode yang memanggil API EBS men-set konteks dengan fnd_global.apps_initialize dan MOAC (mo_global); user, responsibility, dan org dibaca dari konfigurasi, memakai user integrasi khusus. | |
| `PLS-904` | WAJIB | Query data multi-org menghormati model keamanan EBS (MOAC / org_id) dan hak pengguna. | |
| `PLS-905` | WAJIB | Schema custom di database EBS teregistrasi dan ber-EBR. Tabel custom dibuat lewat AD_ZD_TABLE.UPGRADE dan diakses lewat editioning view. Perubahan objek dilakukan di dalam online patching cycle. | |
| `PLS-907` | DILARANG | Workspace APEX tidak memakai APPS sebagai parsing schema. Data EBS dibaca lewat view di APPS yang di-grant ke schema custom berhak minimum. | |
| `PLS-908` | WAJIB | Concurrent program memakai parameter errbuf/retcode dan melaporkan status SUCCESS, WARNING, atau ERROR; nama parameter huruf besar. | |

### APEX: penamaan dan struktur

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `APX-101` | WAJIB | Page item dinamai P<halaman>_<NAMA_KOLOM> sesuai kolom sumbernya; application item G_<NAMA>. | |
| `APX-102` | WAJIB | Nama process berprefix tujuan: INIT_ (persiapan), SET_ (komputasi), RUN_ / CALL_ (aksi), SAVE_ (simpan), AJAX_ (callback), GET_ / CHECK_ (pemeriksaan). | |
| `APX-103` | WAJIB | Validation dinamai sesuai yang divalidasi; dynamic action dinamai pemicu + aksi; branch dan computation bernama jelas. Nama bawaan (New_1, Branch 1) tidak dipakai. | |
| `APX-105` | WAJIB | Objek pendukung APEX: view umum APX_<APP>_<DESK>_V, view per halaman APX_<APP>_P<hal>_<DESK>_V, view LOV APX_<APP>_<DESK>_LOV_V, package per halaman APX_<APP>_P<hal>_PKG. | |
| `APX-107` | WAJIB | Setiap halaman punya page alias (kebab-case, menggambarkan isi) dan page group. | |

### APEX: pemisahan logika

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `APX-201` | WAJIB | Logika bisnis ada di package, bukan di process, validation, computation, atau dynamic action halaman. Process hanya memanggil package (Invoke API atau blok tipis). | |
| `APX-203` | WAJIB | SQL atau PL/SQL inline di komponen halaman yang lebih dari 4000 karakter dipindah ke view atau package. | |
| `APX-204` | WAJIB | Dynamic view yang membaca session state memakai pola WITH x AS (select /*+ MATERIALIZE */ apex_util.get_session_state(...) from dual). Hint MATERIALIZE wajib. | |
| `APX-205` | DILARANG | Kode yang dipanggil APEX tidak menjalankan COMMIT atau ROLLBACK; transaksi dikelola APEX. | |
| `APX-206` | DILARANG | Server-side condition, function body condition, dan region dynamic content tidak melakukan DML. | |
| `APX-209` | WAJIB | Pada halaman modal atau drawer, process Close Dialog adalah process submit terakhir. | |

### APEX: SQL dan keamanan

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `APX-302` | WAJIB | Report, Interactive Report, dan Interactive Grid punya pagination dan batas jumlah baris; query tanpa batas tidak dipakai. | |
| `APX-305` | WAJIB | Ekspor CSV, Excel, dan PDF dibatasi authorization scheme. | |
| `APX-402` | WAJIB | Authorization scheme berbasis package function, bukan perbandingan application item. Server-side condition tidak dipakai sebagai pengganti otorisasi. | |
| `APX-404` | WAJIB | LOV didefinisikan di Shared Components dengan view pendukung (_LOV_V), tidak inline di item. | |
| `APX-405` | WAJIB | JavaScript dan CSS disimpan di static application/workspace files; dynamic action memanggil fungsi dari file. Aset dari URL eksternal hanya bila diizinkan Content Security Policy. | |
| `APX-406` | WAJIB | Aplikasi memakai error handling function; pesan error Oracle mentah tidak tampil ke pengguna. | |
| `APX-410` | WAJIB | Akses ke REST API memakai Web Credentials dan HTTPS; Valid for URLs dibatasi. | |

### APEXlang (bila memakai APEXlang)

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `APX-503` | WAJIB | Objek dan kolom database yang dirujuk artefak APEX dibuktikan ada (data dictionary) sebelum artefak dibuat. | |
| `APX-505` | WAJIB | Hanya artefak runtime yang dideklarasikan manifest yang masuk ke aplikasi; dokumentasi dan contoh template tidak ikut. | |

### Rilis

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `APX-604` | WAJIB | Export APEX disimpan di repo dalam bentuk split dan readable (atau APEXlang), diambil lewat ADT. | |
| `APX-605` | WAJIB | Produksi memakai APEX runtime-only; perubahan masuk lewat patch, bukan diedit di Builder produksi. | |
