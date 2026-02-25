# Pandawa

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Language: PLSQL](https://img.shields.io/badge/Language-PLSQL-orange.svg)]()

## Deskripsi Singkat

Pandawa adalah kumpulan skrip PL/SQL/Oracle yang dirancang untuk membantu membangun, mengelola, dan menguji logika database Oracle. Repository ini menyediakan berbagai solusi, tools, dan standar pengembangan untuk Oracle Database dan Oracle E-Business Suite (EBS).

## Fitur Utama

* Kumpulan paket, prosedur, dan fungsi PL/SQL yang terorganisir
* Skrip instalasi dan migrasi basis data (deploy scripts)
* Solusi untuk berbagai modul Oracle EBS (AP, AR, FA, GL, INV, OM, OPM, PO)
* Struktur yang memudahkan pengujian dan otomasi
* Dokumentasi standar pengembangan dan naming convention
* Lisensi MIT — bebas digunakan dan dimodifikasi

## Bahasa Pemrograman

* **PLSQL** (85.8%) - PL/SQL untuk Oracle Database
* **JavaScript** (6.9%) - Untuk keperluan web dan UI
* **HTML** (2.5%) - Markup untuk dokumentasi dan interface
* **PLpgSQL** (2.1%) - PostgreSQL procedural language
* **Java** (2.0%) - Untuk integrasi dan tools
* **Awk** (0.5%) - Text processing scripts
* **CSS** (0.2%) - Styling untuk web interface

## Direktori Tambahan

* incident-tracking
* oracle-licensing
* sla

## Prasyarat

* Oracle Database (versi 11g ke atas)
* Client SQL seperti SQL*Plus, SQLcl, atau tool GUI (SQL Developer, DBeaver, dll.)
* (Opsional) Docker jika ingin menjalankan Oracle Database dalam container
* (Opsional) utPLSQL untuk menjalankan unit test PL/SQL
* (Opsional) Oracle E-Business Suite untuk module-specific scripts

## Struktur Direktori dan File

Berikut adalah struktur lengkap repository ini beserta deskripsi setiap folder dan file:

### File Utama

```
├── .gitignore                              # File yang diabaikan oleh Git
├── LICENSE                                 # Lisensi MIT
├── README.md                              # Dokumentasi utama (file ini)
├── apps-implementation-methodology.md      # Metodologi implementasi aplikasi
├── naming-convention-oracle.md            # Konvensi penamaan Oracle
└── oracle-dev-standards.md                # Standar pengembangan Oracle
```

### Direktori Modul Oracle EBS

#### **ap/** - Accounts Payable
Modul untuk mengelola hutang dan pembayaran supplier.

#### **apex-sert/** - Oracle APEX Certification
Berisi materi dan file terkait tool apex-sert.

#### **apextoebs/** - APEX to EBS Integration
Solusi integrasi antara Oracle APEX dan Oracle E-Business Suite.

#### **ebtax/** - E-Business Tax
Modul untuk pengelolaan pajak dalam Oracle EBS.

#### **fa/** - Fixed Assets
Modul untuk mengelola aset tetap perusahaan.
```
fa/
├── scripts/
├── packages/
└── reports/
```

#### **frappe/** - Frappe Framework
```
frappe/
└── Dokumentasi Instalasi Frappe/
    └── Installation guides dan dokumentasi framework Frappe
```

#### **frits/** - FRITS Module
```
frits/
└── f216180/
    └── Kode dan script khusus untuk modul FRITS
```

#### **gl/** - General Ledger
Modul pembukuan umum dan laporan keuangan.
```
gl/
└── reset-balance-gl/
    └── Script untuk reset saldo GL
```

#### **glt/** - GLT
Tools tambahan GLT.

#### **inv/** - Inventory
Modul manajemen inventory dan stok barang.
```
inv/
└── inv-onhand-query/
    └── Query untuk melihat stok on-hand
```

#### **meta/** - Meta
```
meta/
└── po/
    └── Metadata untuk modul Purchase Order
```

#### **nsti/** - NSTI Module
```
nsti/
└── ar/
    └── case-so-retur/
        └── Kasus penanganan retur Sales Order
```

#### **om30/** - Dokumentasi AIM
AIM Oracle versi 3.0.

#### **opc/** - Oracle Project Costing
```
opc/
└── work-confirmation/
    └── Script untuk konfirmasi pekerjaan
```

#### **opm/** - Oracle Process Manufacturing
Modul untuk industri manufaktur proses.

#### **po/** - Purchase Order
Modul untuk mengelola purchase order dan procurement.

### Direktori Tambahan

#### **dnn/** - DNN
```
dnn/
└── [DNN]_Application_Setup/
    └── Setup dan konfigurasi aplikasi DNN
```

#### **oracons/** - Oracle Consol
File Oracons.

#### **p-track/** - Project Tracking
Tools untuk tracking dan monitoring project.

#### **pandawa.wiki/** - Wiki Documentation
Submodule atau link ke wiki documentation.

#### **standardization/** - Standards
Dokumen standarisasi dan guidelines.

#### **sysadmin/** - System Administration
Script dan tools untuk system administrator.

#### **training/** - Training Materials
Materi training dan pembelajaran Oracle.

## Instalasi / Quickstart

### 1. Clone Repository

```bash
git clone https://github.com/iwanhe/pandawa.git
cd pandawa
```

### 2. Siapkan Koneksi ke Oracle Database

**Menggunakan SQLcl:**
```bash
sql /nolog
SQL> connect user/password@//host:port/service_name
```

**Menggunakan SQL*Plus:**
```bash
sqlplus user/password@//host:port/service_name
```

### 3. Jalankan Skrip Instalasi

Pilih modul yang ingin Anda install dan jalankan script yang sesuai:

```sql
-- Contoh instalasi modul GL
@gl/install_gl_packages.sql

-- Contoh instalasi modul AP
@ap/install_ap_packages.sql
```

### 4. Menjalankan Test (Opsional)

Jika menggunakan utPLSQL:

```sql
-- Jalankan test suite
@tests/run_all_utplsql.sql
```

## Tips Pengembangan

* **Format Kode**: Gunakan format kode yang konsisten untuk PL/SQL (indentasi, penamaan)
* **Naming Convention**: Ikuti panduan di `naming-convention-oracle.md`
* **Development Standards**: Patuhi standar di `oracle-dev-standards.md`
* **Migrasi Database**: Simpan perubahan skema sebagai skrip migrasi baru
* **Testing**: Pastikan setiap perubahan logika database memiliki test yang relevan
* **Dokumentasi**: Update dokumentasi setiap kali menambahkan fitur baru

## Contoh Penggunaan

### Memanggil Prosedur

```sql
BEGIN
  schema_name.proc_name(
    p_param1 => 'value',
    p_param2 => 123
  );
END;
/
```

### Menjalankan Fungsi

```sql
SELECT schema_name.func_name('value') FROM DUAL;
```

### Query Inventory On-Hand

```sql
-- Menggunakan script dari inv/inv-onhand-query/
@inv/inv-onhand-query/get_onhand_quantity.sql
```

## Kontribusi

Terima kasih atas minat untuk berkontribusi! Berikut langkah-langkahnya:

1. **Fork** repository ini
2. **Buat cabang fitur**: `git checkout -b feat/awesome-feature`
3. **Tambahkan kode** dan dokumentasi, sertakan skrip migrasi bila perlu
4. **Tambahkan atau perbarui test**
5. **Commit perubahan**: `git commit -m 'Add awesome feature'`
6. **Push ke branch**: `git push origin feat/awesome-feature`
7. **Buat Pull Request** dari fork Anda ke repository ini

Silakan sertakan:
- Deskripsi lengkap perubahan
- Langkah reproduksi jika ada bug fix
- Catatan migrasi database jika diperlukan
- Screenshot jika ada perubahan UI

## Kode Etik

Harap patuhi standar kontributor yang sopan dan profesional saat membuat issue atau PR:
- Gunakan bahasa yang jelas dan sopan
- Sertakan contoh bila memungkinkan
- Hormati pendapat dan kontribusi orang lain
- Fokus pada solusi, bukan masalah pribadi

## Isu dan Pelaporan Bug

Buat **issue baru** pada tab "Issues" di GitHub dan sertakan:

- **Langkah reproduksi** yang detail
- **Versi Oracle / client** yang digunakan
- **Log error** atau stack trace jika ada
- **Skrip contoh** yang menyebabkan masalah
- **Expected behavior** vs **actual behavior**

## Roadmap

Rencana pengembangan ke depan:

- [ ] Menambahkan CI/CD untuk menjalankan utPLSQL tests otomatis
- [ ] Menyediakan containerized dev environment (Docker)
- [ ] Dokumentasi API PL/SQL yang lebih lengkap (reference per package/function)
- [ ] Menambahkan lebih banyak module-specific documentation
- [ ] Membuat wiki lengkap untuk setiap modul
- [ ] Performance tuning guidelines
- [ ] Security best practices documentation

## Kontak

* **Pemilik / Maintainer**: [iwanhe](https://github.com/iwanhe)
* **Repository**: https://github.com/iwanhe/pandawa
* Untuk pertanyaan atau permintaan fitur, silakan [buka issue](https://github.com/iwanhe/pandawa/issues)

## Lisensi

Repository ini dilisensikan di bawah [MIT License](LICENSE). Anda bebas untuk menggunakan, memodifikasi, dan mendistribusikan kode ini dengan tetap mencantumkan attribution yang sesuai.

## Acknowledgments

Terima kasih kepada semua kontributor yang telah membantu mengembangkan project ini.

---

**Catatan:** Struktur dan konten dalam repository ini terus berkembang. Dokumentasi ini akan diperbarui seiring dengan penambahan fitur dan modul baru.