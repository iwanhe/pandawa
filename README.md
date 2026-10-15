# Pandawa 🏛️

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![PL/SQL](https://img.shields.io/badge/PL%2FSQL-Oracle-F80000.svg?logo=oracle&logoColor=white)](.)
[![Python](https://img.shields.io/badge/Python-3.10+-3776AB.svg?logo=python&logoColor=white)](.)
[![Oracle APEX](https://img.shields.io/badge/Oracle%20APEX-24.1%20%7C%2024.2-F80000.svg?logo=oracle&logoColor=white)](.)
[![Oracle EBS](https://img.shields.io/badge/Oracle%20EBS-R12.2-F80000.svg?logo=oracle&logoColor=white)](.)
[![ORDS](https://img.shields.io/badge/ORDS-REST-F80000.svg?logo=oracle&logoColor=white)](.)
[![ADT](https://img.shields.io/badge/ADT-Enabled-green.svg)](https://github.com/jkvetina/ADT)
[![Claude Skills](https://img.shields.io/badge/Claude%20Skills-Library-D97757.svg)](skills/)

> **IT Upstream Development — Tim PANDAWA**
> KCSI (Karya Cipta Solusi Internasional) · Nojorono Group · Kudus, Jawa Tengah

Repository pusat Tim PANDAWA untuk kode sumber, aplikasi APEX siap-install, tools, standar pengembangan, CI/CD pipeline, AI skills library, dan materi referensi seluruh project Oracle EBS & Oracle APEX di lingkungan Nojorono Group.

---

## 📑 Daftar Isi

- [Deskripsi](#-deskripsi)
- [Yang Baru](#-yang-baru)
- [Bahasa Pemrograman](#-bahasa-pemrograman)
- [Prasyarat](#️-prasyarat)
- [Struktur Direktori](#-struktur-direktori)
- [Aplikasi APEX Siap-Install](#-aplikasi-apex-siap-install)
- [Claude AI Skills Library](#-claude-ai-skills-library)
- [Quickstart](#-quickstart)
- [Coding Standards](#-coding-standards)
- [Deployment Workflow](#-deployment-workflow)
- [Roadmap](#️-roadmap)
- [Tim](#-tim)
- [Lisensi](#-lisensi)

---

## 📖 Deskripsi

Pandawa adalah monorepo Tim PANDAWA yang mencakup:

- **Oracle EBS Customizations & API** — Script, package, dan dokumentasi untuk modul AP, FA, GL, INV, OPM, PO, OPC, SLA, dan E-Business Tax
- **Oracle APEX Applications** — Export aplikasi APEX internal (FRITS, P-Track/PERMADI, Incident Tracking) yang bisa di-install langsung, termasuk via *Custom App Gallery*
- **Full-stack Apps** — KCSI Access Vault Portal (React + Vite di Netlify, backend Oracle ORDS/PL/SQL)
- **CI/CD Automation** — Standar deployment berbasis ADT (APEX Deployment Tool) & FNDLOAD untuk Dev → UAT → Production
- **Subsidiary Modules** — Kode & dokumentasi spesifik subsidiary Nojorono Group (NTI, NSTI, GLT, DNN)
- **Claude AI Skills Library** — Skill bundle untuk AI-assisted development (ADT, APEX, SQLcl, Oracle DB, standar PANDAWA) plus koleksi skill engineering/bisnis
- **Standardisasi & Governance** — Standar pengembangan, naming convention, metodologi implementasi, change management policy, quality gate, dan analisis lisensi Oracle

---

## 🆕 Yang Baru

| Tanggal | Perubahan |
|---------|-----------|
| Sep 2026 | **KCSI Access Vault Portal** — portal internal rekap data akses/koneksi (`KCSI_Access_Vault_Portal_Code/`) |
| Agu 2026 | **Oracle 23ai Free Capacity Check** — monitoring storage agar tidak mentok batas 12 GB (`oracle-licensing/oracle23ai-capacity-check/`) |
| Agu 2026 | **APEXlang skill** `apexlang-2026.08.01.zip` (`skills/`) |
| Jul 2026 | **OutSystems Log tool** — aplikasi APEX f105 (`meta/outsystem_log.zip`) |
| Jun 2026 | Update dokumentasi lisensi Oracle (`oracle-licensing/`) |
| Mei 2026 | Skill `impeccable`, koleksi skill engineering/C-level/marketing/product/PM/RA-QM, Oracle Dev Standards v1.1 |
| Feb–Apr 2026 | Analisis lisensi Oracle APEX (v1.1–v1.3), komparasi 6 platform database, standar CI/CD, metodologi implementasi v2.1, dokumentasi EBS NTI |

---

## 🧑‍💻 Bahasa Pemrograman

| Bahasa | Kegunaan |
|--------|----------|
| PL/SQL & SQL | EBS API scripts, package, APEX application export, ORDS REST setup |
| Python | Tools pada skill library, automation scripts |
| JavaScript / JSX | Frontend React (Access Vault Portal), APEX dynamic actions |
| Java / JSP | Integrasi & SSO APEX ↔ EBS (`apextoebs/`) |
| HTML / CSS | APEX templates, UI components |
| PowerShell / Shell | Script deployment & setup (Windows) |

> Persentase komposisi bahasa terkini bisa dilihat di panel **Languages** pada halaman GitHub repository.

---

## ⚙️ Prasyarat

| Tool | Versi | Keterangan |
|------|-------|-----------|
| Oracle Database | 19c+ / 23ai | Target database utama |
| Oracle EBS | R12.2 | Untuk EBS customizations |
| Oracle APEX | 24.1 / 24.2 | Runtime aplikasi APEX (FRITS: 24.1, P-Track & Incident Tracking: 24.2) |
| ORDS | 23.4+ | Oracle REST Data Services |
| SQLcl | 24.x+ | CLI untuk Oracle, digunakan ADT & SQLcl MCP |
| Python | 3.10+ | Runtime ADT & automation scripts |
| ADT | Latest | [APEX Deployment Tool](https://github.com/jkvetina/ADT) — tool utama CI/CD |
| Node.js | 18+ | Build frontend Access Vault Portal (Vite) |
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
| `apps-implementation-methodology.md` | Metodologi implementasi aplikasi (berbasis Oracle AIM 3.0) |
| `Kebijakan_Manajemen_Perubahan_IT_Upstream_Development.md` | Change Management Policy — wajib dibaca semua developer |
| `custom_apps.json` | Registry *Custom App Gallery* APEX (P-Track & Incident Tracking) |
| `update-apex-component-modifier.ps1` | Script PowerShell untuk update skill APEX Component Modifier |
| `.gitignore` | Git exclusion rules |

---

### 🏢 Modul Oracle EBS

| Direktori | Modul | Isi |
|-----------|-------|-----|
| `ap/API Bank/` | Accounts Payable | Create Bank / Branch / Bank Account, assign ke Supplier Site & Pay Group |
| `ap/API Single Payment/` | Accounts Payable | Package `XX_AP_PAY_SINGLE_INVOICE_PKG` + dokumentasi |
| `ap/API Void Payment/` | Accounts Payable | Reverse/void check + dokumentasi |
| `ebtax/` | E-Business Tax | Setup tambahan EB-Tax NTI |
| `fa/` | Fixed Assets | API Create Accounting, Retirement, Calculate Gain/Loss, Mass Copy, Delete Asset, Explore Fiscal |
| `gl/reset-balance-gl/` | General Ledger | Script reset saldo GL + dokumentasi |
| `inv/inv-onhand-query/` | Inventory | Query on-hand per lot |
| `opc/work-confirmation/` | Project Costing | Cancel Work Confirmation dengan backup table |
| `opm/opm-costing/` | Process Manufacturing | Materi OPM costing & period end |
| `opm/opm-pd/` | Process Manufacturing | Create batch / recipe testing scripts |
| `po/autocreate po/` | Purchase Order | Troubleshooting DFF PR → PO autocreate |
| `po/reset/` | Purchase Order | Reset requisition & PO approval |
| `sla/` | Subledger Accounting | Query setup SLA NTI (ADR, AAD, JLD, JED, SLAM, custom source) |
| `om30/` | AIM Templates | Template dokumen Oracle AIM 3.0 (`AIM30/`) & PJM 2.6.1 (`PJM261/`) |

---

### 🌿 Subsidiary Modules

| Direktori | Entitas | Isi |
|-----------|---------|-----|
| `oracle-ebs-nti/` | PT NTI | 12 ringkasan dokumentasi EBS NTI: BP080 integrasi OPC/ITP/MPM/RRJ, training AP/INV/PO/OPC, project OPM restructure & relabelling |
| `nsti/ar/case-so-retur/` | PT NSTI | Penanganan kasus retur Sales Order & reinvoicing |
| `glt/` | PT Graha Lumbung Terpadu (tembakau) | Panduan APEX Mail Package untuk GLT App |
| `dnn/[DNN]_Application_Setup/` | DNN | Dokumen setup aplikasi AP, AR, CE, GL, PO, FA |
| `meta/po/` | META | Query penerimaan & ship confirm, solusi approve PO tanpa workflow |

> **KDK** (PT Karunia Daun Kencana — cengkih) dikelola di repository terpisah menggunakan schema `KDK` di Oracle ADB.

---

### 🏗️ Oracle APEX & Aplikasi

| Direktori | App | Deskripsi |
|-----------|-----|-----------|
| `frits/f216180/` | 216180 | **FRITS** — Form Request IT System (schema `WKSP_NTIAPPS`, APEX 24.1) |
| `p-track/` | 114 | **P-Track / PERMADI** — Project tracking & monitoring (APEX 24.2) |
| `incident-tracking/` | 101 | **Incident Tracking** — manajemen & tracking insiden IT (APEX 24.2) |
| `meta/outsystem_log.zip` | 105 | OutSystems Log — aplikasi APEX untuk log viewer |
| `KCSI_Access_Vault_Portal_Code/` | — | **Access Vault Portal** — React + Vite (Netlify) dengan backend ORDS + OAuth2 & enkripsi AES-256 (schema `APX`) |
| `apextoebs/` | — | Integrasi & SSO Oracle APEX ↔ Oracle EBS (JSP gateway `XXAPEXGWY.jsp`, Java `XXApexExternalAppManager`) |
| `apex-sert/` | — | APEX SERT 5.1 user guide & ringkasan security scanning |

---

### 🔧 DevOps & Infrastructure

| Direktori | Deskripsi |
|-----------|-----------|
| `ci-cd-oracle-apex-ebs/` | Standar CI/CD deployment Oracle APEX & EBS (ADT) dan panduan FNDLOAD R12.2 |
| `sysadmin/` | EBS Audit Scripts (audit setting, session, responsibility, PAT) & query password EBS |
| `skills/` | Claude AI skills library — lihat [bagian khusus](#-claude-ai-skills-library) |

---

### 📐 Standardization & Governance

| Direktori | Deskripsi |
|-----------|-----------|
| `standardization/` | Technical paper APEX-EBS Extension v4.3, Apps Implementation Methodology, Insum PL/SQL Guidelines, NTI Naming Conventions v3.3 |
| `standardization/2026/` | Dokumen 2026: BT010 Budget Tracking Dashboard, KPI Improvement Analysis, OW010 OWASP Compliance Checklist, PG010 Post Go-Live Review, QG010 Pre-UAT Quality Gate |
| `standardization/whitepaper/` | Whitepaper Omdia low/no/pro-code app dev platforms |
| `oracle-licensing/` | Analisis lisensi Oracle APEX (v1.1–v1.3), komparasi 6 platform database, materi licensing Oracle, SR Oracle Support |
| `oracle-licensing/oracle23ai-capacity-check/` | Script cek kapasitas manual & setup monitoring otomatis Oracle 23ai Free / XE |

---

### 📚 Knowledge & Training

| Direktori | Deskripsi |
|-----------|-----------|
| `training/Integration PO Distributor - SO Prinsipal/` | Materi integrasi PO Distributor ↔ SO Prinsipal, MD050 OM Ship Confirm v1.2, EUT script |
| `training/SQL Practice - Hands On/` | Materi & soal latihan SQL beserta ERD |
| `frappe/Dokumentasi Instalasi Frappe/` | Dokumentasi instalasi Frappe framework |
| [Wiki](https://github.com/iwanhe/pandawa/wiki) | GitHub Wiki repository |

---

## 📦 Aplikasi APEX Siap-Install

Aplikasi berikut tersedia dalam bentuk export `.sql` / `.zip` dan terdaftar di [`custom_apps.json`](custom_apps.json) sehingga bisa dipasang lewat **Custom App Gallery** APEX:

| App | Internal Name | Source | Zip |
|-----|---------------|--------|-----|
| P-Track (PERMADI) | `P_TRACK` | [`p-track/f114.sql`](p-track/f114.sql) | [`p-track/f114.zip`](p-track/f114.zip) |
| Incident Tracking | `INCIDENT_TRACK` | [`incident-tracking/f101.sql`](incident-tracking/f101.sql) | [`incident-tracking/f101.zip`](incident-tracking/f101.zip) |

Cara pakai: di APEX Workspace → **App Gallery** → tambahkan URL raw berikut sebagai custom gallery:

```
https://raw.githubusercontent.com/iwanhe/pandawa/main/custom_apps.json
```

Atau install manual via SQLcl: `@p-track/f114.sql` dari workspace target.

---

## 🤖 Claude AI Skills Library

Folder `skills/` berisi skill bundle untuk AI-assisted development dengan Claude.

### Skill PANDAWA & Oracle

| File / Folder | Fungsi |
|---------------|--------|
| `adt.skill`, `adt-setup.skill` | Operasional & instalasi ADT (export, patch, deploy, recompile) |
| `apex.skill`, `apex/` | Export/patch/import komponen APEX via SQLcl |
| `apex-component-modifier/`, `apex-component-modifier.zip` | Modifikasi komponen APEX (global/app patterns, evals, tools) |
| `apex-qa-pandawa.skill` | Standar QA APEX PANDAWA (MVC, naming `APX_`, page design) |
| `apex-rest-pandawa.skill` | Standar REST/ORDS PANDAWA |
| `apex-sert.skill` | APEX SERT security evaluation & remediation |
| `apexlang-*.zip` | Skill APEXlang (terbaru: `apexlang-2026.08.01.zip`) |
| `redwood-apex.skill` | Oracle Redwood Design System untuk APEX |
| `oracle-dev-standards.skill` | Standar development Oracle EBS & APEX PANDAWA |
| `upstream-change-management.skill` | Change Management Policy IT Upstream Development |
| `sqlcl.skill`, `sqlcl/` | SQLcl & SQLcl MCP |
| `oracle-db/`, `oracle-db-skills.skill` | 117 referensi Oracle Database (SQL, PL/SQL, tuning, security, ORDS, migrasi) |
| `impeccable-skill.zip` | Skill desain UI *impeccable* |

### Koleksi Skill Umum

| Folder | Isi |
|--------|-----|
| `engineering/` | 25 skill advanced engineering (agent design, RAG, MCP server, CI/CD, database design, observability) |
| `engineering-team/` | 23 skill engineering (architecture, frontend, backend, QA, DevOps, security, AI/ML, data) |
| `c-level-advisor/` | 10 advisor C-level (CEO, CTO, CFO, CISO, dll.) + board meeting |
| `product-team/` | 10 skill product (RICE, agile PO, OKR, UX research) |
| `project-management/` | 6 skill PM (senior PM, scrum master, Jira, Confluence) |
| `marketing-skill/` | 42 skill marketing (content, SEO, CRO, growth) |
| `ra-qm-team/` | 12 skill regulatory & QM (ISO 13485, ISO 27001, GDPR) |
| `finance/`, `business-growth/` | Analisis finansial & business growth |

> Folder `_backup_*` berisi snapshot skill lama sebelum update.

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

**SQLcl dengan Oracle Wallet (OCI/ADB):**
```bash
sql /nolog
SQL> set cloudconfig /path/to/wallet.zip
SQL> connect user/password@service_name_high
```

### 3. Menjalankan Script PL/SQL

```sql
-- Contoh: compile package AP Single Payment
@"ap/API Single Payment/XX_AP_PAY_SINGLE_INVOICE_PKG.pks"
@"ap/API Single Payment/XX_AP_PAY_SINGLE_INVOICE_PKG.pkb"

-- Contoh: cek kapasitas Oracle 23ai Free
@oracle-licensing/oracle23ai-capacity-check/oracle23ai-capacity-check/01_cek_kapasitas_manual.sql
```

### 4. Deploy dengan ADT

Instalasi ADT: lihat [jkvetina/ADT](https://github.com/jkvetina/ADT) atau skill `adt-setup.skill`.

```bash
# Export database objects yang berubah 7 hari terakhir
adt export_db -recent 7

# Export APEX application (split & readable)
adt export_apex -app 216180 -split -readable

# Preview, buat, dan deploy patch ke UAT
adt patch -target UAT -patch TASK_ID
adt patch -target UAT -patch TASK_ID -create -deploy
```

Lihat [`ci-cd-oracle-apex-ebs/cicd_deployment_standard.md`](ci-cd-oracle-apex-ebs/cicd_deployment_standard.md) untuk standar pipeline lengkap.

### 5. Access Vault Portal (development)

```bash
# Backend: jalankan berurutan di schema APX
#   backend/01_schema.sql → 05_seed_lookup_data.sql
cd KCSI_Access_Vault_Portal_Code/frontend
npm install
npm run dev
```

Detail: [`KCSI_Access_Vault_Portal_Code/README.md`](KCSI_Access_Vault_Portal_Code/README.md)

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

📄 Detail lengkap: [`oracle-dev-standards-v1.1.md`](oracle-dev-standards-v1.1.md) · [`naming-convention-oracle.md`](naming-convention-oracle.md)

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
- [ ] Lolos Pre-UAT Quality Gate ([QG010](standardization/2026/QG010-Pre-UAT-Quality-Gate-Checklist_.md))
- [ ] UAT sign-off dari BPO
- [ ] Rollback script tersedia
- [ ] Change Request (CR) approved
- [ ] Deployment dilakukan di luar jam operasional (jika production)
- [ ] Post Go-Live Review ([PG010](standardization/2026/PG010-Post-GoLive-Review-Feedback.md))

---

## 🗺️ Roadmap

- [x] CI/CD deployment standard (`ci-cd-oracle-apex-ebs/`)
- [x] Claude AI Skills library (`skills/`)
- [x] Change Management Policy
- [x] Oracle Dev Standards v1.1
- [x] APEX SERT security scanning setup
- [x] Analisis lisensi Oracle APEX & komparasi platform database
- [x] Custom App Gallery (`custom_apps.json`) untuk P-Track & Incident Tracking
- [x] Quality gate & OWASP compliance checklist (`standardization/2026/`)
- [x] Oracle 23ai Free capacity monitoring
- [x] KCSI Access Vault Portal
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
| **Stack Utama** | Oracle EBS R12.2 · Oracle APEX 24.x · ORDS · PL/SQL · ADT · SQLcl · Python |
| **Repository** | https://github.com/iwanhe/pandawa |

Pertanyaan, laporan bug, atau permintaan fitur → [buka GitHub Issue](https://github.com/iwanhe/pandawa/issues)

---

## 📄 Lisensi

Repository ini dilisensikan di bawah [MIT License](LICENSE).
Bebas digunakan, dimodifikasi, dan didistribusikan dengan tetap mencantumkan attribution yang sesuai.

> Skill pihak ketiga di folder `skills/` (mis. `oracle-db/`, koleksi engineering/marketing/dll.) mengikuti lisensi masing-masing sumbernya.

---

> **Catatan:** Repository ini terus berkembang seiring dengan penambahan modul dan fitur baru.
> Dokumentasi diperbarui secara berkala mengikuti kondisi aktual repository.
> Terakhir diperbarui: Oktober 2026 (sinkron dengan commit `68a2b3b`)
