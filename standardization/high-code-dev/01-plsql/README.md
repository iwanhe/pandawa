# 01 — Standar PL/SQL & Oracle APEX

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `PLS` (PL/SQL dan SQL), `APX` (Oracle APEX dan APEXlang) |
| Status | **Draft** |
| Versi | 0.2.0 |
| File aturan | [`Standar_PLSQL_APEX.xlsx`](Standar_PLSQL_APEX.xlsx) — sumber utama |
| Pembaruan terakhir | 2026-11-01 |

## Ringkasan

Standar penulisan PL/SQL dan SQL untuk objek custom Oracle EBS dan aplikasi Oracle APEX, serta standar komponen APEX dan APEXlang. Disusun dari Oracle Dev Standards v1.1 dan Naming Convention di repo `pandawa`, kebijakan QA APEX PANDAWA, aturan APEXlang di `oracle-db-skills`, dan panduan Oracle untuk extension EBS 12.2.

| Jumlah aturan | WAJIB | DILARANG | SEBAIKNYA | Dicek alat |
|:-:|:-:|:-:|:-:|:-:|
| 121 | 66 | 13 | 42 | 12 |

## Berlaku untuk

| Kelompok aturan | Mandiri | Oracle EBS | SAP |
|---|:-:|:-:|:-:|
| PLS-1xx s.d. PLS-8xx, APX-xxx | K | W | — |
| PLS-9xx (khusus Oracle EBS) | — | W | — |

`W` = wajib · `K` = kondisional (bila aplikasi mandiri memakai Oracle Database / APEX) · `—` = tidak berlaku

## Keputusan Saat Menggabungkan Sumber

Sumber-sumber standar ini tidak selalu sejalan. Keputusan berikut sudah diambil di standar ini dan dapat ditinjau ulang:

| Topik | Perbedaan di sumber | Keputusan |
|---|---|---|
| Nama objek | Insum: `employee_api`, `_seq`, `_idx`, trigger `employee_br_iud`. Naming Convention: `XTD_`/`APX_` + `_PKG`, `_S`, `_U1`/`_N1`, `_TRG` | Naming Convention (PLS-101 s.d. PLS-104) |
| Prefix parameter | `p_`/`in_`, `x_`/`out_`/`io_` | Hanya `p_` (IN) dan `x_` (OUT, IN OUT), seragam dengan API EBS (PLS-202) |
| Indentasi | Teks aturan v1.1: 3 spasi; contoh kodenya 4 spasi | 3 spasi (PLS-302) |
| Huruf dan koma | Contoh skill QA APEX: huruf besar, koma di belakang | Huruf kecil dan koma di depan berlaku untuk semua SQL, termasuk view APEX (PLS-301, PLS-304) |
| Hint optimizer | APEXlang: tanpa hint. QA APEX: `/*+ MATERIALIZE */` wajib di dynamic view | Hint dilarang kecuali MATERIALIZE pada dynamic view (PLS-506, APX-204) |
| SQL inline di region | APEXlang: pindahkan bila > 4000 karakter. QA APEX: semua query lewat view | > 4000 karakter WAJIB dipindah (APX-203); selebihnya SEBAIKNYA lewat view (APX-202) |
| Bentuk nama tabel | Insum: tunggal. Contoh Naming Convention: jamak | Tunggal untuk tabel baru; tabel lama tidak di-rename (PLS-105) |

## Hal yang Masih Perlu Diputuskan

1. **Prefix objek custom EBS** (PLS-101): standar ini memakai `XTD_` karena custom application XTD sudah terdaftar. Sumber lain menyebut `XX{ORG}_` dan `XX`/`YY`/`ZZ`.
2. **Static ID komponen APEX** (APX-104): `REGION_`/`BUTTON_` (QA APEX) atau kebab-case huruf kecil (APEXlang).
3. **Identity column di database EBS** (PLS-107): perlu diuji bersama `AD_ZD_TABLE.UPGRADE` sebelum menggantikan sequence `_S`.
4. **Tenggat perbaikan temuan SERT Medium** (APX-602): 30 hari atau 7 hari.
5. **Penegakan otomatis.** Hanya 12 dari 121 aturan yang dicek alat. Banyak aturan PLS bernomor Insum (G-xxxx, lihat kolom Catatan di Excel) yang dapat dicek otomatis oleh Trivadis PL/SQL Cop atau SonarQube. Keduanya disebut di Oracle Dev Standards §10 dan dapat dievaluasi sebagai langkah berikutnya.

## Cara Memakai

1. Tetapkan profil aplikasi. PLS-9xx hanya berlaku untuk objek di database Oracle EBS.
2. Tulis kode mengikuti aturan; lihat contoh di [`examples/benar`](examples/benar/).
3. Sebelum pull request: kompilasi dengan `PLSQL_WARNINGS='ENABLE:ALL'`, jalankan APEX Advisor, tinjau Embedded Code Report, dan (sebelum UAT) jalankan APEX SERT.
4. Reviewer memakai [`checklist-review.md`](checklist-review.md) dan merujuk ID aturan di komentar.
5. Penyimpangan dari aturan WAJIB/DILARANG memakai [waiver](../waiver/).

## Daftar Aturan

Ringkasan dari [`Standar_PLSQL_APEX.xlsx`](Standar_PLSQL_APEX.xlsx). Alasan, contoh benar/salah, dan catatan lengkap ada di file Excel.

### PLS-1xx — Penamaan objek (12 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `PLS-101` | WAJIB | Objek custom Oracle EBS dinamai XTD_<APP>_<NAMA>[_SUFFIX]; <APP> adalah short name modul EBS (AP, GL, INV, ...). Objek khusus satu entitas memakai XTD_<ENTITAS>_ (mis. XTD_NTI_). | review |
| `PLS-102` | WAJIB | Objek database untuk aplikasi APEX dinamai APX_<KODEAPP>_<NAMA>[_SUFFIX]; <KODEAPP> adalah kode aplikasi APEX (PRISM, SIPP, ...). | review |
| `PLS-103` | WAJIB | Suffix objek: _V view, _MV materialized view, _S sequence, _PKG package, _FNC function, _PRC procedure, _TRG trigger, _VS value set, _LK lookup, _GTT global temporary table, _OT object type. | review |
| `PLS-104` | WAJIB | Constraint dinamai <TABEL>_PK, <TABEL>_<TABEL_RUJUKAN>_FK[n], <TABEL>_<PERAN>_UK[n]. Index unik <TABEL>_U<n>, non-unik <TABEL>_N<n>; index constraint mengikuti nama constraint. | review |
| `PLS-105` | SEBAIKNYA | Nama tabel baru memakai bentuk tunggal, bermakna, tanpa singkatan kecuali yang tercatat di glosarium, dalam satu bahasa yang konsisten per aplikasi. | review |
| `PLS-106` | SEBAIKNYA | Kolom surrogate key dinamai <ENTITAS>_ID agar join dapat memakai USING. | review |
| `PLS-107` | SEBAIKNYA | Primary key tabel baru memakai identity column. Sequence _S hanya bila identity tidak dapat dipakai. | review |
| `PLS-108` | SEBAIKNYA | Procedure dinamai kata kerja + kata benda; function dinamai sesuai hasil yang dikembalikan. | review |
| `PLS-109` | WAJIB | Objek backup dinamai <NAMA_OBJEK>_BKP<yymmdd>. | review |
| `PLS-110` | WAJIB | Setiap tabel dan kolom diberi comment di data dictionary. | review |
| `PLS-111` | DILARANG | Nama objek tidak memakai reserved word Oracle dan tidak diawali angka. | review |
| `PLS-112` | SEBAIKNYA | Trigger tidak dipakai untuk logika bisnis. Bila tak terhindarkan, gunakan compound trigger. | review |

### PLS-2xx — Variabel dan tipe (13 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `PLS-201` | WAJIB | Prefix identifier: g_ global, l_ lokal, k_ konstanta, r_ record, t_ collection, o_ object, e_ exception. Cursor berakhiran _cur. Tipe berakhiran _type (r_<nama>_type, t_<nama>_type). | review |
| `PLS-202` | WAJIB | Parameter IN berprefix p_; parameter OUT dan IN OUT berprefix x_. Parameter cursor berprefix p_. | review |
| `PLS-203` | WAJIB | Variabel yang mengacu kolom atau baris tabel dideklarasikan dengan %TYPE / %ROWTYPE. | review |
| `PLS-204` | SEBAIKNYA | Tipe bersama didefinisikan di satu package tipe per aplikasi. | review |
| `PLS-205` | SEBAIKNYA | Variabel tidak diinisialisasi dengan NULL. | review |
| `PLS-206` | WAJIB | Pemeriksaan NULL memakai IS [NOT] NULL. | review |
| `PLS-207` | SEBAIKNYA | Fungsi tidak dipanggil di bagian deklarasi; inisialisasi dilakukan di badan program agar error dapat ditangani. | review |
| `PLS-208` | SEBAIKNYA | Aritmetika bilangan bulat memakai PLS_INTEGER (atau SIMPLE_INTEGER bila tidak pernah NULL). | review |
| `PLS-209` | SEBAIKNYA | Tipe CHAR tidak dipakai; VARCHAR2 memakai char semantics. | review |
| `PLS-210` | SEBAIKNYA | Nilai literal yang bermakna bisnis didefinisikan sebagai konstanta. | review |
| `PLS-211` | WAJIB | Tidak ada variabel yang tidak terpakai dan tidak ada dead code. | review |
| `PLS-212` | DILARANG | ROWID tidak disimpan di tabel; referensi baris memakai primary key. | review |
| `PLS-213` | DILARANG | Nominal uang dan kuantitas memakai NUMBER. BINARY_FLOAT / BINARY_DOUBLE tidak dipakai untuk nominal. | review |

### PLS-3xx — Format dan dokumentasi (9 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `PLS-301` | WAJIB | Seluruh kode (keyword, nama objek, variabel) ditulis huruf kecil. | review |
| `PLS-302` | WAJIB | Indentasi 3 spasi, tanpa tab. | review |
| `PLS-303` | SEBAIKNYA | Satu perintah per baris; loop, else, elsif, end if, dan when di baris baru. | review |
| `PLS-304` | WAJIB | Koma ditulis di depan elemen daftar (kolom, parameter). | review |
| `PLS-305` | SEBAIKNYA | Keyword SQL rata kanan dalam satu perintah; parameter, operator, dan nilai disejajarkan. | review |
| `PLS-306` | SEBAIKNYA | Pemanggilan subprogram dengan lebih dari satu parameter memakai named notation. | review |
| `PLS-307` | WAJIB | Setiap subprogram publik di package spec diberi komentar JavaDoc (deskripsi, @param, @return, @throws, @example bila perlu). | review |
| `PLS-308` | WAJIB | Setiap file script diawali header: nama script, author, tanggal, tujuan, nomor tiket/CR, dependency. | review |
| `PLS-309` | SEBAIKNYA | Sub-blok dan loop diberi label; label penutup sama dengan label pembuka. | review |

### PLS-4xx — Package, versi, deployment (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `PLS-401` | SEBAIKNYA | Logika ditempatkan di package. Procedure/function berdiri sendiri hanya bila ada alasan. | review |
| `PLS-402` | WAJIB | Setiap package punya function package_version yang mengembalikan versi XX.YY.ZZ dan memuat riwayat versi di komentarnya. | review |
| `PLS-403` | WAJIB | Kenaikan versi: XX bila perubahan besar lintas package; YY bila spec berubah; ZZ bila hanya body berubah. Pekerjaan belum selesai ditandai WIP. | review |
| `PLS-404` | WAJIB | Script deploy idempotent (create or replace atau dicek dulu) dan disertai script rollback. | review |
| `PLS-405` | SEBAIKNYA | File sumber disimpan per objek di repo (.pks spec, .pkb body), mengikuti struktur folder ADT. | review |
| `PLS-406` | WAJIB | Kode sensitif keamanan memakai definer rights; package utilitas memakai invoker rights. Grant hanya hak minimum yang dibutuhkan. | review |

### PLS-5xx — SQL (12 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `PLS-501` | WAJIB | INSERT selalu menyebut kolom target. | review |
| `PLS-502` | WAJIB | Setiap tabel dalam query diberi alias, dan kolom dirujuk lewat alias. | review |
| `PLS-503` | WAJIB | Join memakai sintaks ANSI. NATURAL JOIN tidak dipakai. | review |
| `PLS-504` | WAJIB | ORDER BY memakai nama kolom, bukan nomor posisi. | review |
| `PLS-505` | SEBAIKNYA | Hindari SELECT *; sebut kolom yang dibutuhkan. | review |
| `PLS-506` | SEBAIKNYA | Hint optimizer tidak dipakai, kecuali /*+ MATERIALIZE */ pada pola dynamic view APEX (APX-204) dan hint lain yang alasannya didokumentasikan di komentar. | review |
| `PLS-507` | SEBAIKNYA | Gunakan CASE, bukan DECODE atau rangkaian ELSIF panjang. | review |
| `PLS-508` | SEBAIKNYA | Gunakan COALESCE, bukan NVL, bila argumen kedua berupa pemanggilan fungsi. | review |
| `PLS-509` | SEBAIKNYA | Kolom virtual dibuat INVISIBLE. | review |
| `PLS-510` | DILARANG | Kolom LOB tidak dipakai sebagai kunci perbandingan (WHERE, GROUP BY, ORDER BY, DISTINCT, join). | review |
| `PLS-511` | SEBAIKNYA | Filter opsional ditulis null-safe: (:p_status is null or t.status = :p_status). | review |
| `PLS-512` | SEBAIKNYA | Setiap foreign key diberi index. Kolom FK NOT NULL kecuali relasinya memang opsional. | review |

### PLS-6xx — Kontrol alur dan performa (5 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `PLS-601` | WAJIB | Cursor yang dibuka eksplisit selalu ditutup, termasuk di blok exception. | review |
| `PLS-602` | SEBAIKNYA | Gunakan cursor FOR loop untuk iterasi sederhana, numeric FOR untuk koleksi padat, %NOTFOUND (bukan NOT %FOUND), dan EXIT WHEN (bukan IF ... EXIT). | review |
| `PLS-603` | DILARANG | GOTO tidak dipakai. | review |
| `PLS-604` | WAJIB | Pemrosesan lebih dari 4 baris memakai satu perintah SQL set-based, atau BULK COLLECT (dengan LIMIT untuk volume besar) dan FORALL. | review |
| `PLS-605` | SEBAIKNYA | Fungsi pembaca data referensi yang jarang berubah boleh memakai RESULT_CACHE; fungsi murni ditandai DETERMINISTIC. | review |

### PLS-7xx — Exception dan logging (5 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `PLS-701` | WAJIB | Logging memakai Logger (OraOpenSource) dengan scope <package>.<subprogram>. | review |
| `PLS-702` | DILARANG | WHEN OTHERS selalu mencatat error lalu raise ulang, atau mengembalikan status error yang terdokumentasi di kontrak. WHEN OTHERS THEN NULL tidak dipakai. | review |
| `PLS-703` | SEBAIKNYA | Exception ditangani berdasarkan nama (named exception), bukan dengan memeriksa SQLCODE. | review |
| `PLS-704` | WAJIB | Nomor dan pesan error aplikasi didefinisikan sebagai konstanta di package; raise_application_error tidak memakai angka langsung. | review |
| `PLS-705` | WAJIB | Pesan error untuk pengguna tidak memuat SQLERRM mentah atau struktur tabel; detail teknis hanya dicatat di log. | review |

### PLS-8xx — Keamanan (5 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `PLS-801` | WAJIB | SQL dinamis memakai bind variable (EXECUTE IMMEDIATE ... USING). Nilai input tidak digabung ke string SQL. | review |
| `PLS-802` | WAJIB | Identifier dinamis (nama tabel, kolom, schema) divalidasi dengan DBMS_ASSERT sebelum disusun ke SQL. | review |
| `PLS-803` | SEBAIKNYA | Teks SQL dinamis disusun di variabel sebelum dieksekusi. | review |
| `PLS-804` | DILARANG | Password, token, nomor kartu, dan data pribadi tidak ditulis ke log. | review |
| `PLS-805` | DILARANG | Kredensial tidak disimpan di kode, substitution string, atau tabel tanpa enkripsi. Gunakan Oracle Wallet atau APEX Web Credentials. | review |

### PLS-9xx — Oracle EBS (8 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `PLS-901` | DILARANG | Transaksi ke EBS hanya lewat public API atau open interface Oracle yang dibungkus package custom. DML langsung ke tabel standar EBS tidak dipakai. | review |
| `PLS-902` | DILARANG | Objek standar Oracle (package, view, form, report, workflow) tidak dimodifikasi. | review |
| `PLS-903` | WAJIB | Kode yang memanggil API EBS men-set konteks dengan fnd_global.apps_initialize dan MOAC (mo_global); user, responsibility, dan org dibaca dari konfigurasi, memakai user integrasi khusus. | review |
| `PLS-904` | WAJIB | Query data multi-org menghormati model keamanan EBS (MOAC / org_id) dan hak pengguna. | review |
| `PLS-905` | WAJIB | Schema custom di database EBS teregistrasi dan ber-EBR. Tabel custom dibuat lewat AD_ZD_TABLE.UPGRADE dan diakses lewat editioning view. Perubahan objek dilakukan di dalam online patching cycle. | review |
| `PLS-906` | WAJIB | Objek custom di database EBS lulus pemeriksaan online patching (ADZDDBCC dan GSCC) tanpa pelanggaran sebelum dirilis. | ADZDDBCC, GSCC |
| `PLS-907` | DILARANG | Workspace APEX tidak memakai APPS sebagai parsing schema. Data EBS dibaca lewat view di APPS yang di-grant ke schema custom berhak minimum. | review |
| `PLS-908` | WAJIB | Concurrent program memakai parameter errbuf/retcode dan melaporkan status SUCCESS, WARNING, atau ERROR; nama parameter huruf besar. | review |

### APX-1xx — Penamaan komponen APEX (7 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `APX-101` | WAJIB | Page item dinamai P<halaman>_<NAMA_KOLOM> sesuai kolom sumbernya; application item G_<NAMA>. | review |
| `APX-102` | WAJIB | Nama process berprefix tujuan: INIT_ (persiapan), SET_ (komputasi), RUN_ / CALL_ (aksi), SAVE_ (simpan), AJAX_ (callback), GET_ / CHECK_ (pemeriksaan). | review |
| `APX-103` | WAJIB | Validation dinamai sesuai yang divalidasi; dynamic action dinamai pemicu + aksi; branch dan computation bernama jelas. Nama bawaan (New_1, Branch 1) tidak dipakai. | review |
| `APX-104` | SEBAIKNYA | Static ID region dan button yang dirujuk JavaScript atau dynamic action berprefix REGION_ / BUTTON_. | review |
| `APX-105` | WAJIB | Objek pendukung APEX: view umum APX_<APP>_<DESK>_V, view per halaman APX_<APP>_P<hal>_<DESK>_V, view LOV APX_<APP>_<DESK>_LOV_V, package per halaman APX_<APP>_P<hal>_PKG. | review |
| `APX-106` | SEBAIKNYA | Nomor halaman mengikuti rentang: 1–99 sistem, 100–199 dashboard, 200–299 master data, 300–399 transaksi, 400–499 laporan, 500–599 admin, 900–999 utilitas. | review |
| `APX-107` | WAJIB | Setiap halaman punya page alias (kebab-case, menggambarkan isi) dan page group. | APEX Advisor |

### APX-2xx — Pemisahan logika (MVC) (10 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `APX-201` | WAJIB | Logika bisnis ada di package, bukan di process, validation, computation, atau dynamic action halaman. Process hanya memanggil package (Invoke API atau blok tipis). | review |
| `APX-202` | SEBAIKNYA | Query region diambil dari view. SQL inline hanya untuk query sederhana tanpa logika bisnis. | review |
| `APX-203` | WAJIB | SQL atau PL/SQL inline di komponen halaman yang lebih dari 4000 karakter dipindah ke view atau package. | review |
| `APX-204` | WAJIB | Dynamic view yang membaca session state memakai pola WITH x AS (select /*+ MATERIALIZE */ apex_util.get_session_state(...) from dual). Hint MATERIALIZE wajib. | review |
| `APX-205` | DILARANG | Kode yang dipanggil APEX tidak menjalankan COMMIT atau ROLLBACK; transaksi dikelola APEX. | review |
| `APX-206` | DILARANG | Server-side condition, function body condition, dan region dynamic content tidak melakukan DML. | review |
| `APX-207` | SEBAIKNYA | Validasi memakai tipe deklaratif lebih dulu (not null, regex, exists). PL/SQL hanya bila tidak dapat dinyatakan deklaratif, dan memanggil package function. | review |
| `APX-208` | SEBAIKNYA | Satu region form memakai satu Automatic Row Processing; tidak diduplikasi per tombol. | review |
| `APX-209` | WAJIB | Pada halaman modal atau drawer, process Close Dialog adalah process submit terakhir. | review |
| `APX-210` | WAJIB | Embedded Code Report ditinjau setiap rilis; kode inline baru harus punya alasan. | review |

### APX-3xx — SQL di APEX (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `APX-301` | WAJIB | Nilai item dibaca dengan bind variable (:P10_ITEM) di SQL dan PL/SQL. Substitution &P10_ITEM. tidak dipakai di SQL. | APEX SERT |
| `APX-302` | WAJIB | Report, Interactive Report, dan Interactive Grid punya pagination dan batas jumlah baris; query tanpa batas tidak dipakai. | review |
| `APX-303` | SEBAIKNYA | SQL region mengembalikan data mentah; tampilan diatur lewat pengaturan kolom deklaratif, bukan HTML di SQL. | review |
| `APX-304` | WAJIB | Output report dan grid tetap di-escape. Kolom HTML hanya lewat format kolom yang sudah direview dan memakai substitution ter-escape (&COL!HTML.). | APEX SERT |
| `APX-305` | WAJIB | Ekspor CSV, Excel, dan PDF dibatasi authorization scheme. | review |
| `APX-306` | SEBAIKNYA | Link navigasi memakai target halaman deklaratif atau apex_page.get_url, bukan string f?p= yang dirakit manual. | review |

### APX-4xx — Shared components dan keamanan (11 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `APX-401` | WAJIB | Setiap halaman memakai autentikasi dan authorization scheme. Halaman publik selain login wajib disertai alasan tertulis. | APEX Advisor, APEX SERT |
| `APX-402` | WAJIB | Authorization scheme berbasis package function, bukan perbandingan application item. Server-side condition tidak dipakai sebagai pengganti otorisasi. | review |
| `APX-403` | WAJIB | Session State Protection aktif. Item hidden yang memegang data milik server dilindungi checksum. | APEX SERT |
| `APX-404` | WAJIB | LOV didefinisikan di Shared Components dengan view pendukung (_LOV_V), tidak inline di item. | review |
| `APX-405` | WAJIB | JavaScript dan CSS disimpan di static application/workspace files; dynamic action memanggil fungsi dari file. Aset dari URL eksternal hanya bila diizinkan Content Security Policy. | review |
| `APX-406` | WAJIB | Aplikasi memakai error handling function; pesan error Oracle mentah tidak tampil ke pengguna. | review |
| `APX-407` | SEBAIKNYA | Friendly URL dan deep linking aktif. | review |
| `APX-408` | SEBAIKNYA | Global page (Page 0) hanya berisi elemen yang benar-benar tampil di semua halaman. | review |
| `APX-409` | SEBAIKNYA | Teks untuk pengguna yang dipakai berulang dikelola di Text Messages atau substitution string; tidak di-hardcode di banyak tempat. | review |
| `APX-410` | WAJIB | Akses ke REST API memakai Web Credentials dan HTTPS; Valid for URLs dibatasi. | review |
| `APX-411` | SEBAIKNYA | Setiap item punya label yang dapat diakses, dan semua interaksi dapat dioperasikan dengan keyboard. | review |

### APX-5xx — APEXlang (7 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `APX-501` | WAJIB | Sintaks dan properti APEXlang mengikuti grammar dan metadata compiler versi APEX yang dipakai (26.1 / 26.2); properti tidak dikarang. | Compiler APEXlang (SQLcl) |
| `APX-502` | WAJIB | File .apx disimpan dengan line ending LF. | Validator APEXlang, .gitattributes |
| `APX-503` | WAJIB | Objek dan kolom database yang dirujuk artefak APEX dibuktikan ada (data dictionary) sebelum artefak dibuat. | review |
| `APX-504` | WAJIB | Artefak APEXlang divalidasi compiler lokal, lalu divalidasi di database DEV, sebelum dinyatakan selesai. | Compiler APEXlang, SQLcl |
| `APX-505` | WAJIB | Hanya artefak runtime yang dideklarasikan manifest yang masuk ke aplikasi; dokumentasi dan contoh template tidak ikut. | review |
| `APX-506` | SEBAIKNYA | Page process yang memanggil package memakai Invoke API dengan parameter bernama. Execute Code hanya untuk pembungkus tipis tanpa logika bisnis. | review |
| `APX-507` | SEBAIKNYA | Tata letak memakai template, template option, dan slot bawaan. CSS class tidak dikarang untuk memperbaiki struktur. | review |

### APX-6xx — Kualitas dan rilis (5 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `APX-601` | WAJIB | APEX Advisor dijalankan sebelum rilis dan temuannya ditindaklanjuti. | APEX Advisor |
| `APX-602` | WAJIB | APEX SERT dijalankan sebelum UAT dan go-live; temuan High/Critical wajib nol. | APEX SERT |
| `APX-603` | SEBAIKNYA | Package logika bisnis punya unit test utPLSQL. | utPLSQL |
| `APX-604` | WAJIB | Export APEX disimpan di repo dalam bentuk split dan readable (atau APEXlang), diambil lewat ADT. | review |
| `APX-605` | WAJIB | Produksi memakai APEX runtime-only; perubahan masuk lewat patch, bukan diedit di Builder produksi. | review |

## Referensi

- Standarisasi Development Oracle APEX dan Oracle EBS v1.1 — `oracle-dev-standards-v1.1.md`, https://github.com/iwanhe/pandawa (berbasis Insum PL/SQL & SQL Coding Guidelines v1.1)
- Naming Convention untuk Oracle EBS dan Oracle APEX — `naming-convention-oracle.md`, https://github.com/iwanhe/pandawa
- oracle-db-skills, folder `apex` (APEXlang 26.1) — https://github.com/iwanhe/oracle-db-skills (lisensi UPL 1.0)
- Standar QA Oracle APEX Tim PANDAWA (skill `apex-qa-pandawa`)
- *Extending Oracle E-Business Suite Release 12.2 using Oracle APEX*, Oracle Technical Paper v4.3 (Mei 2023)

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| [`Standar_PLSQL_APEX.xlsx`](Standar_PLSQL_APEX.xlsx) | Daftar aturan lengkap (sumber utama) |
| [`checklist-review.md`](checklist-review.md) | Checklist review pull request |
| [`examples/`](examples/) | Contoh kode benar dan salah |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
