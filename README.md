# Pandawa 🏛️

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Language: Python](https://img.shields.io/badge/Python-78.2%25-3776AB.svg?logo=python&logoColor=white)](.)
[![Language: PLSQL](https://img.shields.io/badge/PL%2FSQL-17.7%25-F80000.svg?logo=oracle&logoColor=white)](.)
[![Oracle APEX](https://img.shields.io/badge/Oracle%20APEX-24.x-F80000.svg?logo=oracle&logoColor=white)](.)
[![Oracle EBS](https://img.shields.io/badge/Oracle%20EBS-R12.2-F80000.svg?logo=oracle&logoColor=white)](.)
[![ADT](https://img.shields.io/badge/ADT-Enabled-green.svg)](.)

> **IT Upstream Development — Tim PANDAWA**  
> KCSI (Karya Cipta Solusi Internasional) · Nojorono Group · Kudus, Jawa Tengah

Repository pusat Tim PANDAWA untuk kode sumber, tools, standar pengembangan, CI/CD pipeline, dan materi referensi seluruh project Oracle EBS & Oracle APEX di lingkungan Nojorono Group.

---

## 📑 Daftar Isi

- [Deskripsi](#-deskripsi)
- [Bahasa Pemrograman](#-bahasa-pemrograman)
- [Prasyarat](#-prasyarat)
- [Struktur Direktori](#-struktur-direktori)
- [Quickstart](#-quickstart)
- [Coding Standards](#-coding-standards)
- [Deployment Workflow](#-deployment-workflow)
- [Roadmap](#-roadmap)
- [Tim](#-tim)
- [Lisensi](#-lisensi)

---

## 📖 Deskripsi

Pandawa adalah monorepo Tim PANDAWA yang mencakup:

- **Oracle EBS Customizations** — Package, prosedur, fungsi, dan report untuk modul AP, AR, FA, GL, INV, OM, OPM, PO, OPC, dan E-Business Tax
- **Oracle APEX Applications** — Source code, export script, dan tooling untuk aplikasi APEX internal (FRITS, SIPP, dll.)
- **CI/CD Automation** — Pipeline deployment berbasis ADT (APEX Deployment Tool) untuk environment Dev → UAT → Production
- **Subsidiary Modules** — Kode spesifik untuk subsidiary Nojorono Group: GLT (PT Graha Lumbung Terpadu — tembakau) dan KDK (PT Karunia Daun Kencana — cengkih)
- **Claude AI Skills Library** — Koleksi skill files untuk AI-assisted development (ADT, APEX, Oracle, deployment standards)
- **Standardisasi & Governance** — Standar pengembangan, naming convention, change management policy, dan SLA

---

## 🧑‍💻 Bahasa Pemrograman

| Bahasa | Porsi | Kegunaan |
|--------|-------|----------|
| Python | 78.2% | ADT scripts, automation tools, Claude AI skills |
| PL/SQL | 17.7% | Oracle DB packages, prosedur, fungsi, trigger |
| JavaScript | 2.1% | APEX dynamic actions, integrasi web |
| HTML | 0.5% | APEX templates, UI components |
| PLpgSQL | 0.4% | PostgreSQL compatibility scripts |
| Java | 0.4% | Integration utilities |
| Lainnya | 0.7% | Shell, Awk, CSS |

---

## ⚙️ Prasyarat

| Tool | Versi | Keterangan |
|------|-------|-----------|
| Oracle Database | 19c+ | Target database utama |
| Oracle EBS | R12.2 | Untuk EBS customizations |
| Oracle APEX | 24.1 / 24.2 | Runtime aplikasi APEX |
| ORDS | 23.4+ | Oracle REST Data Services |
| SQLcl | 24.x | CLI untuk Oracle, digunakan ADT |
| Python | 3.10+ | Runtime ADT & automation scripts |
| ADT | Latest | [APEX Deployment Tool](https://github.com/jkvetina/ADT) — tool utama CI/CD |
| PowerShell | 5.1+ | Deployment scripts (Windows) |
| Git | 2.x | Version control |
| Oracle Instant Client | 21c+ | Driver koneksi Oracle untuk Python |

---

## 📂 Struktur Direktori

### 📄 File Root

| File | Deskripsi |
|------|-----------|
| `README.md` | Dokumentasi utama (file ini) |
| `oracle-dev-standards.md` | Standar pengembangan Oracle — versi awal |
| `oracle-dev-standards-v1.1.md` | **Standar pengembangan Oracle — versi terkini (gunakan ini)** |
| `naming-convention-oracle.md` | Konvensi penamaan: prefix `XTD_` (EBS), `APX_` (APEX), dll. |
| `apps-implementation-methodology.md` | Metodologi implementasi aplikasi AIM 3.0 |
| `Kebijakan_Manajemen_Perubahan_IT_Upstream_Development.md` | Change Management Policy — wajib dibaca semua developer |
| `custom_apps.json` | Registry custom applications Nojorono Group |
| `update-apex-component-modifier.ps1` | Script PowerShell untuk update APEX Component Modifier |
| `oracons` | File konfigurasi koneksi Oracle |
| `.gitignore` | Git exclusion rules (wallet files, credentials, dll.) |

---

### 🏢 Modul Oracle EBS

| Direktori | Modul | Deskripsi |
|-----------|-------|-----------|
| `ap/` | Accounts Payable | Manajemen hutang & pembayaran supplier |
| `ebtax/` | E-Business Tax | Pengelolaan pajak Oracle EBS |
| `fa/` | Fixed Assets | Manajemen aset tetap perusahaan |
| `gl/reset-balance-gl/` | General Ledger | Pembukuan umum & script reset saldo GL |
| `inv/inv-onhand-query/` | Inventory | Query stok on-hand inventory |
| `nsti/ar/case-so-retur/` | NSTI AR | Penanganan kasus retur Sales Order |
| `om30/` | AIM Documentation | Template dokumen AIM Oracle versi 3.0 |
| `opc/work-confirmation/` | Project Costing | Script konfirmasi pekerjaan |
| `opm/` | Process Manufacturing | Modul manufaktur proses |
| `po/` | Purchase Order | Procurement & pengelolaan purchase order |
| `meta/po/` | Metadata PO | Metadata pendukung modul Purchase Order |
| `oracle-ebs-nti/` | NTI EBS | Customisasi Oracle EBS untuk PT NTI |

---

### 🌿 Subsidiary Modules

| Direktori | Entitas | Komoditi | Deskripsi |
|-----------|---------|----------|-----------|
| `glt/` | PT Graha Lumbung Terpadu | Tembakau | Warehouse management & receiving module |

> **KDK** (PT Karunia Daun Kencana — cengkih) dikelola di repository terpisah menggunakan schema `KDK` di Oracle ADB.

---

### 🏗️ Oracle APEX

| Direktori | App ID | Deskripsi |
|-----------|--------|-----------|
| `apex-sert/` | — | APEX SERT security scanning, hasil evaluasi & remediation |
| `apextoebs/` | — | Integrasi Oracle APEX → Oracle EBS via PL/SQL API |
| `frits/f216180/` | 216180 | FRITS — Form Request IT System (schema `WKSP_NTIAPPS`) |

---

### 🔧 DevOps & Infrastructure

| Direktori | Deskripsi |
|-----------|-----------|
| `ci-cd-oracle-apex-ebs/` | Pipeline CI/CD untuk Oracle APEX & EBS menggunakan ADT |
| `skills/` | Claude AI skills library — context files untuk AI-assisted development |
| `sysadmin/` | Script & tools untuk system administration (server, ORDS, Nginx) |

---

### 📐 Standardization & Governance

| Direktori | Deskripsi |
|-----------|-----------|
| `standardization/` | Dokumen standarisasi & technical guidelines |
| `oracle-licensing/` | Dokumentasi & audit lisensi Oracle |
| `incident-tracking/` | Template & tools tracking insiden IT |
| `sla/` | Service Level Agreement documents |
| `p-track/` | Project tracking & monitoring tools |

---

### 📚 Knowledge & Training

| Direktori | Deskripsi |
|-----------|-----------|
| `training/` | Materi training Oracle EBS & Oracle APEX untuk tim |
| `dnn/[DNN]_Application_Setup/` | Setup & konfigurasi DNN application |
| `frappe/Dokumentasi Instalasi Frappe/` | Dokumentasi instalasi Frappe framework |
| `pandawa.wiki` | Link ke GitHub Wiki repository |

---

## 🚀 Quickstart

### 1. Clone Repository

```bash
git clone https://github.com/iwanhe/pandawa.git
cd pandawa
```

### 2. Koneksi ke Oracle Database

**SQLcl (recommended):**
```bash
sql user/password@//host:port/service_name
```

**SQL*Plus:**
```bash
sqlplus user/password@//host:port/service_name
```

**SQLcl dengan Oracle Wallet (OCI/ADB):**
```bash
sql /nolog
SQL> set cloudconfig /path/to/wallet.zip
SQL> connect user/password@service_name_high
```

### 3. Menjalankan Script PL/SQL

```sql
-- Contoh: jalankan script dari modul GL
@gl/reset-balance-gl/reset_balance.sql

-- Contoh: compile package dari modul AP
@ap/packages/xtd_ap_utils_pkg.pks
@ap/packages/xtd_ap_utils_pkg.pkb
```

### 4. Deploy dengan ADT

```bash
# Install ADT (jika belum)
pip install adt

# Export APEX application
adt export_apex --app-id 216180

# Export database objects
adt export_db --schema WKSP_NTIAPPS

# Create deployment patch
adt patch --env UAT

# Deploy ke environment target
adt deploy --env PROD
```

Lihat `ci-cd-oracle-apex-ebs/` untuk konfigurasi pipeline lengkap.

---

## 📏 Coding Standards

Seluruh pengembangan **wajib** mengikuti dokumen standar berikut:

### Naming Convention (ringkasan)

| Konteks | Prefix/Suffix | Contoh |
|---------|--------------|--------|
| EBS Objects | `XTD_` | `XTD_AP_UTILS_PKG` |
| APEX Objects | `APX_` | `APX_FRITS_PKG` |
| Package | `_PKG` | `XTD_GL_REPORT_PKG` |
| Procedure | `_PRC` | `XTD_AP_POST_PRC` |
| Function | `_FNC` | `XTD_INV_CALC_FNC` |
| View | `_V` | `XTD_PO_HEADERS_V` |
| Trigger | `_TRG` | `XTD_AP_INVOICE_TRG` |

### Konvensi Variabel PL/SQL

| Prefix | Tipe | Contoh |
|--------|------|--------|
| `l_` | Local variable | `l_vendor_name` |
| `g_` | Global variable | `g_org_id` |
| `k_` | Constant | `k_max_lines` |
| `p_` | IN parameter | `p_invoice_id` |
| `x_` | OUT parameter | `x_return_status` |
| `r_` | Record type | `r_invoice` |
| `t_` | Table/collection | `t_line_ids` |
| `e_` | Exception | `e_invalid_amount` |

### Style

- **Indentasi**: 3 spasi
- **SQL keywords**: lowercase (`select`, `from`, `where`)
- **Koma**: di depan kolom (`,  col_name`)
- **Anchored declarations**: `l_name employee.name%TYPE`

📄 Detail lengkap: [`oracle-dev-standards-v1.1.md`](oracle-dev-standards-v1.1.md)

---

## 🔄 Deployment Workflow

```
Feature Branch → Dev → UAT → main (Production)
```

### Kategori Perubahan

| Kategori | Waktu Proses | Approval |
|----------|-------------|---------|
| Emergency Change | < 4 jam | Manager IT + BPO |
| Standard Change | 1–3 hari | Analyst + PMO |
| Normal Change | 5–10 hari | BPO + PMO |
| Major Change | > 10 hari | Steering Committee |

📄 Detail lengkap: [`Kebijakan_Manajemen_Perubahan_IT_Upstream_Development.md`](Kebijakan_Manajemen_Perubahan_IT_Upstream_Development.md)

### Checklist Deployment

- [ ] Code review selesai
- [ ] Script sudah ditest di Dev
- [ ] UAT sign-off dari BPO
- [ ] Rollback script tersedia
- [ ] Change Request (CR) approved
- [ ] Deployment dilakukan di luar jam operasional (jika production)

---

## 🗺️ Roadmap

- [x] CI/CD pipeline setup (`ci-cd-oracle-apex-ebs/`)
- [x] Claude AI Skills library (`skills/`)
- [x] Change Management Policy
- [x] Oracle Dev Standards v1.1
- [x] APEX SERT security scanning setup
- [ ] utPLSQL automated test suite per modul
- [ ] Docker containerized dev environment
- [ ] API documentation otomatis per package/function
- [ ] Wiki lengkap per modul EBS
- [ ] Security hardening checklist per APEX app
- [ ] Performance tuning guidelines

---

## 👥 Tim

**IT Upstream Development — Tim PANDAWA**

| | |
|---|---|
| **Organisasi** | KCSI — Karya Cipta Solusi Internasional |
| **Induk** | Nojorono Group |
| **Lokasi** | Kudus, Jawa Tengah |
| **Stack Utama** | Oracle EBS R12.2 · Oracle APEX 24.x · ORDS · ADT · Python |
| **Repository** | https://github.com/iwanhe/pandawa |

Pertanyaan, laporan bug, atau permintaan fitur → [buka GitHub Issue](https://github.com/iwanhe/pandawa/issues)

---

## 📄 Lisensi

Repository ini dilisensikan di bawah [MIT License](LICENSE).  
Bebas digunakan, dimodifikasi, dan didistribusikan dengan tetap mencantumkan attribution yang sesuai.

---

> **Catatan:** Repository ini terus berkembang seiring dengan penambahan modul dan fitur baru.  
> Dokumentasi diperbarui secara berkala mengikuti kondisi aktual repository.  
> Terakhir diperbarui: Mei 2025
