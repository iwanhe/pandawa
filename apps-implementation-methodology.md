# Application Implementation Methodology

**Application Development Upstream – IT Dept**  
By: PANDAWA team (Professional ApplicatioN Development team for Advancing Web Applications)

---

## Table of Contents
1. [Project Deliverable Process Overview](#project-deliverable-process-overview)
2. [Project Initiation](#project-initiation)
3. [Business Requirement](#business-requirement)
4. [Team Training & Solution Design](#team-training--solution-design)
5. [Solution Development](#solution-development)
6. [Security Vulnerability Assessment](#security-vulnerability-assessment)
7. [Data Conversion](#data-conversion)
8. [Solution Deployment](#solution-deployment)
9. [Go-Live Preparation and Execution](#go-live-preparation-and-execution)
10. [Technical Support & Infrastructure](#technical-support--infrastructure)
11. [Project Team Structure](#project-team-structure)
12. [Project Control](#project-control)

---

## Project Deliverable Process Overview

### Main Phases

The application development methodology consists of the following main phases:

1. **Project Initiation**
   - Project Plan & Organization Set Up
   - Project Environment Setup

2. **Business Requirement**
   - Business Requirement Analysis
   - Business Blueprint Development
   - Confirmation and Sign Off

3. **Team Training & Solution Design**
   - Key User Training
   - Proposed Solution Development
   - Proposed Solution Confirmation and Sign Off

4. **Solution Development**
   - Define Customized Specification
   - Customized Development
   - Prototyping
   - Prototyping Confirmation and Sign Off

5. **Security Vulnerability Assessment** ⭐ **NEW**
   - Security Scanning dengan APEX-specific Tools
   - Vulnerability Remediation
   - Security Gate Decision

6. **Solution Deployment**
   - Production System Configuration
   - Conduct System Test
   - User Procedure Document

7. **Go-Live Preparation & Execution**
   - End-User Training
   - User Acceptance Test
   - Go-Live and Support

### Supporting Activities

Throughout the project:
- **Data Conversion**
- **Change Management**
- **Technical Support & Infrastructure**
- **Project Management Officer**
- **Security Monitoring** ⭐ **NEW**

---

## Project Initiation

Inisiasi dan perencanaan merupakan langkah pertama dalam proses implementasi. Selama inisiasi proyek, sasaran, struktur team, dan jadwal proyek dikonfirmasikan kepada semua pihak yang akan terlibat melalui kick off meeting. Project Initiation akan dipool dahulu di PMO.

### 1. Project Plan and Organization Set Up

Pada langkah ini, sasaran, struktur team, dan jadwal proyek ditetapkan dan disetujui oleh Steering Committee. Anggota tim proyek akan terdiri dari kombinasi antara wakil-wakil dari user department, PMO, Tim PANDAWA dan Infrastruktur.

#### Aktivitas:
- Konfirmasi dan menetapkan sasaran dan jangka waktu proyek
- Konfirmasi dan menetapkan Struktur Organisasi Proyek
- Konfirmasi dan menetapkan Jadwal Proyek termasuk menentukan titik-titik paling penting dalam pelaksanaan proyek
- Menetapkan jadwal pertemuan rutin tim proyek dan pertemuan dengan Steering Committee

#### Deliverables:
- **Project Charter** (jikalau diperlukan secara formal)
- **Pernyataan Bersama** tentang tata cara dan batasan dalam proyek, jadwal dan rangkaian/urutan kegiatan, tugas dan tanggung jawab anggota tim, dan dokumen-dokumen yang akan dipakai dalam manajemen proyek
- **Tim Proyek**: Penetapan susunan tim proyek dengan nama masing-masing personel yang akan mengisi setiap posisi dalam tim
- **Jadwal Proyek**: Skema pengerjaan proyek yang berisi jadwal kerja, durasi, urutan pekerjaan, penanggung jawab, dan syarat-syarat penyelesaian setiap tahap dalam proyek

### 2. Project Environment Setup

Sebelum proyek dimulai, adalah sangat penting Infrastruktur telah disiapkan. Ini termasuk instalasi perangkat keras dan jaringan, ruangan kerja selama proyek, dan aplikasi yang diperlukan.

#### Kegiatan:
- Instalasi hardware termasuk server, jaringan, dan workstation
- Setup ruang kerja proyek
- Instalasi aplikasi yang akan diimplementasikan dan aplikasi pendukung lainnya
- Check sizing dari hardware yang akan digunakan

#### Deliverables:
- Hardware terinstalasi (server, jaringan dan Network)
- Ruang kerja proyek siap dipakai, memiliki akses ke jaringan internal maupun internet
- Software terinstalasi. Basic testing telah dilakukan untuk memastikan aplikasi terinstal dengan baik dan benar

### 3. Vendor Selection ⭐ **NEW**

Apabila proyek melibatkan pengadaan vendor eksternal (implementor, konsultan, penyedia layanan), maka proses Vendor Selection wajib dijalankan pada fase Project Initiation sebelum development dimulai. Proses ini mengacu pada **SOP Vendor Selection & Pitching (POL-PRO-01)**.

#### 3.1 Kriteria Minimum Vendor

Vendor yang diajukan wajib memenuhi seluruh kriteria minimum berikut sebelum dapat diundang dalam proses pitching:

**Teknis:**
- Memiliki pengalaman implementasi Oracle EBS dan/atau Oracle APEX minimal 2 proyek yang dapat diverifikasi
- Tim teknis memiliki sertifikasi Oracle yang relevan (Oracle Certified Professional / Oracle APEX Developer)
- Memiliki metodologi pengembangan yang terdokumentasi dan kompatibel dengan Apps Implementation Methodology Tim PANDAWA
- Mampu menyediakan referensi proyek serupa (scope, platform, industri)

**Compliance:**
- Memiliki dokumen legalitas lengkap: Akta Pendirian, NIB, NPWP, SPPKP
- Menandatangani Pakta Integritas sebelum mengikuti proses pitching
- Tidak masuk dalam daftar vendor bermasalah atau blacklist perusahaan
- Bersedia mengikuti standar keamanan aplikasi Tim PANDAWA (Application Security Policy v1.0) termasuk APEX-SERT gate

**Financial:**
- Laporan keuangan 2 tahun terakhir menunjukkan kondisi solvent (tidak dalam kondisi pailit atau restrukturisasi utang)
- Untuk kontrak > Rp 300 juta: wajib menyertakan laporan keuangan yang telah diaudit
- Memiliki kemampuan cash flow untuk mendukung project tanpa pembayaran di muka penuh

**Timeline:**
- Menyatakan komitmen tertulis terhadap jadwal proyek yang disepakati
- Memiliki kapasitas tim yang cukup dan tidak terbebani oleh proyek paralel yang dapat mengganggu deliverable
- Bersedia menerapkan milestone-based payment yang dikaitkan dengan deliverable terverifikasi

#### 3.2 Metode Pemilihan Vendor

Metode pemilihan ditentukan berdasarkan nilai kontrak sesuai SOP POL-PRO-01:

| **Nilai Kontrak** | **Metode** | **Jumlah Vendor Minimum** | **Komite yang Terlibat** |
|---|---|---|---|
| < Rp 25 juta | Penunjukan Langsung | 1 | Procurement |
| Rp 25 juta – < Rp 100 juta | 2 Vendor Pembanding | 2 | Procurement + BPO |
| Rp 100 juta – < Rp 300 juta | Pitching / Tender | 3 | Procurement + BPO + SME |
| ≥ Rp 300 juta | Pitching / Tender | 3 | Procurement + BPO + SME + Finance (+ Legal untuk verifikasi) |

SLA proses pitching maksimal **30 hari kalender** sejak informasi project diterima Procurement.

#### 3.3 RACI Matrix Vendor Selection — Template Wajib

Template RACI berikut **wajib diisi dan ditandatangani** pada fase Project Initiation sebelum proses vendor selection dimulai. Kolom nama diisi sesuai personel aktual proyek.

*Keterangan: R = Responsible | A = Accountable | C = Consulted | I = Informed*

| **Aktivitas** | **IT Dev Manager** | **PMO** | **System Analyst** | **Procurement** | **BPO** | **Finance** | **Legal** |
|---|---|---|---|---|---|---|---|
| Definisi kebutuhan teknis vendor | A | I | R | C | C | I | I |
| Sourcing & kurasi vendor | I | C | C | R | C | I | I |
| Verifikasi legalitas vendor | I | I | I | C | I | I | R |
| Penilaian teknis & kompetensi | A | I | R | C | R | I | I |
| Penilaian finansial vendor | I | C | I | C | I | R | I |
| Presentasi / pitching vendor | C | I | R | R | R | C | I |
| Keputusan pemenang pitching | A | C | C | R | R | C | I |
| Negosiasi kontrak & komersial | I | C | C | R | C | R | C |
| Penandatanganan kontrak | A | I | I | R | I | C | R |
| Onboarding & kickoff vendor | R | R | R | I | C | I | I |

**Sign-Off RACI:**

| **Peran** | **Nama** | **Tanda Tangan** | **Tanggal** |
|---|---|---|---|
| IT Development Manager | | | |
| PMO | | | |
| BPO | | | |
| Procurement | | | |

#### 3.4 Vendor Risk Assessment Checklist

Checklist ini diisi oleh **System Analyst** dan **Procurement** untuk setiap vendor yang lolos tahap kurasi, sebelum diundang pitching. Temuan risiko HIGH wajib dieskalasi ke IT Development Manager.

**A. Risiko Teknis**
- [ ] Vendor memiliki pengalaman terverifikasi dengan Oracle EBS R12.2 dan/atau Oracle APEX 24.x
- [ ] Tim teknis vendor memadai (jumlah, sertifikasi, availability) untuk scope proyek ini
- [ ] Vendor tidak memiliki track record kegagalan delivery pada proyek Oracle sebelumnya
- [ ] Vendor memahami dan bersedia mengikuti standar coding Tim PANDAWA (oracle-dev-standards.md)
- [ ] Vendor memiliki mekanisme quality assurance dan code review internal

**B. Risiko Compliance & Legalitas**
- [ ] Dokumen legalitas vendor lengkap dan masih berlaku (NIB, NPWP, SPPKP, Akta)
- [ ] Vendor tidak masuk daftar hitam atau sedang dalam sengketa hukum yang material
- [ ] Pakta Integritas sudah ditandatangani oleh perwakilan authorized vendor
- [ ] Vendor bersedia menandatangani NDA (Non-Disclosure Agreement) sebelum menerima dokumen teknis
- [ ] Tidak ada konflik kepentingan antara vendor dengan anggota tim proyek

**C. Risiko Financial**
- [ ] Kondisi keuangan vendor stabil (tidak ada indikasi kebangkrutan atau restrukturisasi utang)
- [ ] Vendor memiliki kapasitas untuk mendanai operasional proyek sebelum milestone payment diterima
- [ ] Struktur pembayaran berbasis milestone deliverable (bukan upfront penuh) dapat diterima vendor
- [ ] Untuk kontrak > Rp 300 juta: laporan keuangan audit tersedia dan sudah direview Finance

**D. Risiko Delivery & Timeline**
- [ ] Vendor mengkonfirmasi tidak ada proyek paralel yang berpotensi mengurangi kapasitas tim untuk proyek ini
- [ ] Vendor menyetujui jadwal milestone yang realistis dan telah direview bersama System Analyst
- [ ] Vendor memiliki rencana kontingensi jika terjadi keterlambatan (backup resources)
- [ ] Mekanisme penalti keterlambatan disepakati dan tercantum dalam draft kontrak

**E. Risiko Keamanan**
- [ ] Vendor memahami kewajiban mengikuti security gate APEX-SERT sebelum deployment
- [ ] Vendor bersedia mematuhi Application Security Policy v1.0 Tim PANDAWA
- [ ] Akses vendor ke environment Development terbatas dan dimonitor
- [ ] Vendor memiliki kebijakan pengelolaan data sensitif yang memadai

**Penilaian Risiko Keseluruhan:**

| **Dimensi Risiko** | **Level (Low / Medium / High)** | **Catatan** |
|---|---|---|
| Teknis | | |
| Compliance & Legalitas | | |
| Financial | | |
| Delivery & Timeline | | |
| Keamanan | | |
| **Rekomendasi** | **[ ] Lanjutkan ke Pitching &nbsp;&nbsp; [ ] Perlu Klarifikasi &nbsp;&nbsp; [ ] Tidak Direkomendasikan** | |

**Diisi oleh:**

| **Peran** | **Nama** | **Tanggal** |
|---|---|---|
| System Analyst | | |
| Procurement | | |

---

## Business Requirement

Pada tahap ini, Analis akan melakukan diskusi dengan key user untuk mempelajari kondisi operasional saat ini, apa yang ingin diperbaiki, dan apa yang diharapkan dapat dihasilkan oleh sistem baru. Tujuan dari tahap ini adalah terbentuknya Business Blueprint yaitu business process yang lebih baik yang menjadi tujuan implementasi sistem baru.

Pada tahap ini sebaiknya pembahasan dilakukan tanpa dibatasi oleh kemampuan dari sistem yang akan diimplementasikan sehingga key user bisa dengan leluasa membuat daftar keinginan (Wish List), dan menyusun skala prioritas dari wish list tersebut.

### 1. Business Requirements Analysis (Doc BP070)

Bagian ini adalah diskusi antara analis dan key user mengenai kondisi operasional saat ini, apa yang ingin diperbaiki, dan apa yang diharapkan dapat dihasilkan oleh sistem baru.

#### Topik yang dibahas:
- Struktur organisasi yang sekarang, deskripsi pekerjaan dari masing-masing unit
- Sistem dan prosedur operasional yang diterapkan sekarang untuk mencari keterbatasannya dan kemungkinan perbaikan
- Form dan laporan yang sekarang dipakai dan yang diharapkan dari sistem baru
- Analis dan key user akan bersama-sama merumuskan perbaikan-perbaikan dan peningkatan kemampuan operasional maupun analisa yang ingin dicapai melalui implementasi sistem yang baru

### 2. Business Blueprint Development (Doc BP070)

#### Deliverable:
**Business Blueprint Document**
- Hasil analisa kondisi sistem dan prosedur yang sekarang
- Deskripsi mengenai dimana perbaikan akan dilakukan
- Seperti apa sistem dan prosedur yang diharapkan

### 3. Confirmation and Sign Off

Dokumen Blueprint yang dihasilkan harus dipresentasikan kepada manajemen dan steering komitee untuk mendapatkan persetujuan. Setelah konfirmasi dan persetujuan didapatkan dari manajemen, tim development/analis dan key user akan membuat Confirmation and Sign Off letter dan ditanda-tangani bersama.

---

## Team Training & Solution Design

Dalam proyek implementasi, alih pengetahuan adalah sangat penting untuk dilakukan sejak dini. Proses alih pengetahuan akan dimulai pada tahap ini dengan memberikan training pada key user. Setelah diberi pengetahuan mengenai aplikasi yang akan diimplementasikan, key user bersama tim development/analis akan bersama-sama melakukan pemetaan Business Process yang sudah dirumuskan dalam dokumen Blueprint.

**Tujuan utama**: Merancang sistem seperti yang diharapkan dalam Blueprint dengan memasukan faktor kemampuan sistem, kustomisasi, waktu, dan budget.

### 1. Team Training

Training mengenai aplikasi yang akan diimplementasikan akan dilakukan kepada key user dengan metode **Train-the-Trainer**. Pada tahap selanjutnya dari proyek implementasi, key user harus dapat memberi training kepada end user dan menjadi internal support setelah proyek implementasi selesai.

### 2. Proposed Solution Development (BP080, BR010)

Setelah memahami dengan baik aplikasi yang akan diimplementasikan, key user bersama dengan team development/analis akan memetakan Business Process yang sudah dirumuskan dalam dokumen Blueprint kedalam aplikasi.

Pada tahap ini biasanya akan ditemukan gap antara sistem dengan Blueprint. Team development/analis dan key user akan merumuskan bagaimana cara menjembatani gap tersebut dengan pertimbangan teknis, waktu, dan budget.

Daftar kustomisasi form dan laporan, work around, dan proses yang harus dikompromikan akan didokumentasikan sebagai dasar untuk tahap selanjutnya.

#### Deliverable:
**Proposed Solution Document**
- Serangkaian business process baru yang telah dipetakan kedalam aplikasi
- Penjelasan bagaimana aplikasi akan digunakan
- Daftar kustomisasi

### 3. Proposed Solution Confirmation and Sign-Off

Dokumen Proposed Solution akan dipresentasikan kepada manajemen dan steering komitee untuk mendapatkan persetujuan. Setelah konfirmasi dan persetujuan didapatkan dari manajemen, team development/analis dan key user akan membuat Confirmation and Sign Off letter dan ditanda-tangani bersama.

**Penting**: Karena dokumen ini menjadi acuan pekerjaan yang sangat krusial, maka setiap perubahan yang terjadi atas Proposed Solution selanjutnya harus melalui prosedur **Change Request**.

---

## Solution Development

Bagian ini tim development akan merinci spesifikasi dari kustomisasi yang diperlukan dan mulai melakukan pengembangan kustomisasi yang diperlukan. Bersamaan dengan itu tim proyek juga mengkonfigurasi aplikasi sesuai dengan Proposed Solution di server Development.

### 1. Define Customization Specification

Apabila kustomisasi diperlukan, tim development akan membuat spesifikasi teknis dari kustomisasi form page maupun laporan. Spesifikasi ini akan menjadi acuan bagi developer untuk membuat kustomisasi.

#### Deliverable:
**Dokumen Customization Technical Specification (MD050)**
- Penjelasan teknis mengenai desain kustomisasi termasuk:
  - Screen layout
  - Format laporan
  - Struktur database
  - Process flow

### 2. Customization Development (MD060, MD070)

Pada tahap ini kustomisasi dikerjakan oleh developer berdasarkan Dokumen Customization Technical Specification.

#### Deliverable:
- Kustomisasi form dan/atau laporan

### 3. Prototyping

Selama proses prototyping, tim development akan mengkonfigurasi aplikasi sesuai dengan Proposed Solution. Konsultan dan key user juga akan membuat Test Scenario sebagai acuan menguji kesiapan sistem sebelum Go-Live.

#### Deliverable:
- **Sistem Prototype**
- **Dokumen Test Scenario (TE040)**

### 4. Prototype Confirmation and Sign-Off

Tim development/analis dan key user akan melakukan test terhadap sistem prototype di server Development menggunakan Test Scenario. Setiap skenario yang lulus test akan mendapat paraf dari analis dan key user.

---

## Security Vulnerability Assessment

**MANDATORY CHECKPOINT** - Tahap security scanning ini dilakukan setelah Solution Development selesai dan sebelum deployment ke Production. Tujuannya untuk memastikan aplikasi bebas dari vulnerability yang dapat membahayakan sistem dan data.

### 1. Security Scanning Tools

Untuk Oracle APEX dan Oracle EBS, gunakan tools khusus berikut:

#### **APEX Sert (APEX Security Evaluation & Recommendation Tool)**
- Tool utama untuk comprehensive security assessment
- Melakukan automated scanning terhadap APEX applications
- Mengidentifikasi common vulnerabilities dan security issues
- Memberikan rekomendasi remediasi yang actionable

**Key Checks:**
- Session state protection
- Authorization schemes
- Authentication mechanisms
- Page/item/process security
- SQL injection vulnerabilities
- XSS protection

#### **APEX Visualizer**
- Visual analysis untuk architecture dan security flow
- Identifikasi unprotected pages/items
- Mapping authorization scheme coverage
- Deteksi security gaps dalam application structure

**Use Cases:**
- Visualisasi authorization coverage
- Identifikasi pages tanpa proper authorization
- Analisis authentication flows
- Deteksi orphaned components

#### **APEX Advisor**
- Best practices validation
- Security rules compliance checking
- Static code analysis untuk PL/SQL
- Configuration security assessment

**Security Rules:**
- Password items session state
- Hidden items protection
- Dynamic SQL validation
- Authorization completeness
- Debug mode configuration

### 2. Security Scanning Workflow

```
┌─────────────────────────────────────────────────────┐
│ SECURITY CHECKPOINT WORKFLOW                        │
└─────────────────────────────────────────────────────┘

STEP 1: Preparation (Development Environment)
├─ Install/configure security tools
├─ Define security baseline policies
└─ Train security officer on tools

STEP 2: Automated Scanning
├─ Run APEX Sert → Comprehensive security scan
├─ Run APEX Advisor → Best practices check
└─ Generate consolidated report

STEP 3: Manual Review
├─ Use APEX Visualizer → Architecture analysis
├─ Review findings dengan development team
└─ Prioritize issues (Critical → High → Medium)

STEP 4: Remediation
├─ Fix Critical & High issues (MANDATORY)
├─ Document Medium issues dengan mitigation plan
└─ Update code & re-scan untuk verification

STEP 5: Security Gate Decision
├─ Review semua findings
├─ Check against security criteria
├─ IF PASS → Approve untuk Deployment
└─ IF FAIL → Return to Development
```

### 3. Security Gate Criteria

**PASS Criteria (Boleh lanjut ke Deployment):**
- ✅ **ZERO Critical vulnerabilities**
- ✅ **ZERO High vulnerabilities**
- ✅ Medium vulnerabilities ≤ 5 (dengan mitigation plan)
- ✅ Security checklist signed off
- ✅ Security scan report approved

**FAIL Criteria (Kembali ke Development):**
- ❌ Ada Critical vulnerability
- ❌ Ada High vulnerability
- ❌ Medium vulnerabilities > 5
- ❌ Security best practices tidak diikuti

### 4. Vulnerability Severity Classification

| Severity | SLA Fix | Contoh |
|----------|---------|--------|
| **CRITICAL** | 24 jam | Page tanpa authorization, SQL injection |
| **HIGH** | 3 hari | Weak session management, unprotected processes |
| **MEDIUM** | 7 hari | Items tanpa session state protection |
| **LOW** | 14 hari | Missing labels, unused items |

### 5. Security Deliverables

**Document Code: SV010 - Security Vulnerability Assessment Report**

Struktur report:
```
1. Executive Summary
   - Overall Security Score: __/100
   - Critical: __ | High: __ | Medium: __ | Low: __

2. APEX Sert Findings
   - Session Security
   - Authorization Coverage
   - Input Validation
   
3. APEX Advisor Results
   - Best Practice Compliance: ___%
   - Security Rule Violations: __

4. APEX Visualizer Analysis
   - Authorization Coverage: ___%
   - Unprotected Pages: __
   - Architecture Diagram

5. Remediation Plan
   [Table: Priority | Issue | Owner | Deadline | Status]

6. Security Gate Decision
   [ ] APPROVED - Proceed to Deployment
   [ ] REJECTED - Return to Development

Signatures:
- Security Officer: __________ Date: ______
- Project Manager: __________ Date: ______
- Development Lead: _________ Date: ______
```

### 6. Security Checklist

**Pre-Deployment Security Checklist (Doc SC020)**

**A. Application Security**
- [ ] No SQL injection vulnerabilities
- [ ] All pages have authorization schemes
- [ ] Session state protection enabled
- [ ] CSRF protection active
- [ ] Input validation implemented
- [ ] Error handling tidak expose sensitive info

**B. Authentication & Authorization**
- [ ] Strong authentication mechanism
- [ ] Proper role-based access control
- [ ] Session timeout configured
- [ ] Failed login attempts logged

**C. Data Security**
- [ ] Sensitive data encrypted
- [ ] No passwords in session state
- [ ] Audit trail enabled
- [ ] Database privileges minimized

**D. Configuration**
- [ ] Debug mode disabled
- [ ] Production-ready settings
- [ ] Secure connection (HTTPS)
- [ ] Proper error pages

### 7. Continuous Security Monitoring

**Post-Production Security Activities:**

**Monthly:**
- APEX Sert security scan
- APEX Advisor compliance check
- Review audit logs

**Quarterly:**
- Full security assessment
- Architecture review dengan APEX Visualizer
- Update security policies

**Annually:**
- External security audit
- Penetration testing
- Security training refresh

### 8. Roles & Responsibilities

| Role | Responsibility |
|------|----------------|
| **Security Officer** | - Conduct security scans<br>- Review reports<br>- Approve/reject security gate<br>- Monitor post-production |
| **Development Team** | - Fix vulnerabilities<br>- Implement secure coding<br>- Provide remediation evidence<br>- Resubmit for rescan |
| **Project Manager** | - Ensure security gate in timeline<br>- Track remediation progress<br>- Escalate critical issues<br>- Report to Steering Committee |

### 9. Security Training Requirements

**Mandatory Training:**
- **Developers**: APEX security best practices, OWASP Top 10
- **Security Officer**: Security tools usage, vulnerability assessment
- **Key Users**: Security awareness, data protection

---

## Data Conversion

Konversi seluruh master data dari sistem yang lama harus sudah direncanakan dan dilakukan sejak awal.

### Kegiatan:
- Perencanaan dan pembuatan template untuk master data misalnya:
  - Data pelanggan
  - Supplier
  - Item
  - Struktur akun
  - Bank
  - Opening balance
  - Dan lain-lain
- Pemetaan data dari sistem lama ke format sistem baru
- Pada pelaksanaan konversi master data harus menunjuk PIC atau Koordinator yang bertanggung jawab atas proses tersebut

---

## Solution Deployment

Pada dasarnya tahap ini mengerjakan implementasi sistem baru ke server Production. Setelah sistem prototype selesai test, **PASSED security gate**, dan mendapat konfirmasi dari tim proyek, semua hasil konfigurasi dan kustomisasi akan di-copy dari server Development ke server Production.

### 1. Production System Configuration

Team Development akan memindahkan sistem Prototype ke server Production dengan cara cloning server Development ataupun dengan cara reconfigure. Setelah itu, master data yang telah diselesai dikonversikan akan di-upload ke sistem ini. Tim Development akan melakukan backup sebelum sistem ini ditest.

### 2. Conduct System Test

Team Development/Analyst dan key user bersama-sama melakukan test terhadap sistem yang baru menggunakan beberapa skenario yang telah dibuat. Tujuannya untuk memastikan apakah sistem yang baru di server Production sudah berfungsi sama dengan sistem di server Development. Selesai test, sistem akan di-restore ke posisi dimana belum ada data transaksi yang masuk.

### 3. User Procedure Documentation (DO070, DO080)

Key user pada tahap ini akan membuat panduan pengerjaan bagi end user. Panduan ini dibuat sesuai dengan alur business process yang sudah dirancang khusus untuk perusahaannya. Dokumen ini akan digunakan sebagai materi pelatihan untuk end user.

### 4. Post-Deployment Checklist — SLA Readiness ⭐ **NEW**

Sebelum go-live dikonfirmasikan, tim wajib memverifikasi kesiapan layanan dukungan pasca-deployment. Checklist ini melengkapi Deployment Checklist di CICD_Deployment_Standard_PANDAWA.

**Post-Deployment — SLA & Support Readiness:**
- [ ] Kanal pelaporan tiket (email / sistem tiket / WhatsApp group) sudah aktif dan dapat diakses end user
- [ ] PIC support (nama dan kontak) sudah dikonfirmasi dan tersedia
- [ ] Klasifikasi tiket P1/P2/P3 beserta SLA sudah dikomunikasikan kepada BPO dan end user
- [ ] Template notifikasi go-live (termasuk informasi SLA) sudah siap dikirim
- [ ] Jadwal on-call selama periode dukungan intensif 30 hari pertama sudah disepakati tim
- [ ] Sistem monitoring/alerting untuk deteksi awal insiden P1 sudah aktif
- [ ] Prosedur eskalasi tiket (P1 → IT Dev Manager, P2 → System Analyst) sudah disosialisasikan ke tim support
- [ ] User guide (DO070/DO080) sudah dapat diakses oleh seluruh end user

---

## Go-Live Preparation and Execution

Tahap paling penting dalam mencapai Go-live. Persiapan harus meliputi kesiapan user data dan sistem. Biasanya dipilih dilakukan pada awal bulan agar beginning balance dari bulan sebelumnya dapat di-upload lebih dulu (jikalau ada transaksi).

**Template**: Untuk strategi transisi serta Go Live check list bisa menggunakan template PM010 dan PM040

### 1. End User Training

Sesuai dengan konsep Train the Trainer, maka training kepada end user akan dilakukan oleh key user. Ini dilakukan untuk menjamin bahwa Key user memahami sistem yang baru, sanggup mengalihkan pengetahuannya dan sanggup memberikan support untuk masa yang akan datang.

### 2. User Acceptance Test (UAT)

Pada tahap ini end user akan memasukan data transaksi kedalam sistem yang baru, kemudian memeriksa hasilnya. Hasil akan dibandingkan dengan sistem yang lama sebagai untuk membuktikan bahwa sistem yang baru sudah berjalan semestinya. Setelah sistem yang baru dinyatakan sesuai dengan harapan, maka sistem yang lama akan dimatikan dan user akan sepenuhnya menggunakan sistem yang baru.

### 3. Go Live & Support

Pada tahap terakhir ini, tim proyek akan meng-upload beginning balance kedalam sistem dan end user akan segera mulai menggunakan sistem yang baru.

Setelah sistem berjalan, adalah penting untuk menjaga kelancaran operasional. Pada tahap ini akan dilakukan kegiatan pengawasan dan dukungan terhadap user dalam menggunakan sistem yang baru.

#### Kegiatan:
- Memonitor jalannya sistem
- Melatih tim support internal / MIS dalam memberikan support atau troubleshoot
- Transisi dukungan dari Team Development kepada tim support MIS
- **Continuous security monitoring** (lihat section Security Vulnerability Assessment)

#### Post-Go-Live SLA ⭐ **NEW**

Seluruh permintaan support dan laporan insiden pasca go-live dikelola menggunakan klasifikasi tiket berikut. SLA berlaku mulai dari **waktu tiket dibuat** di sistem tracking.

**Klasifikasi Tiket (Ticket Classification):**

| **Prioritas** | **Definisi / Dampak Bisnis** | **Contoh** | **Response Time** | **Resolution Time** |
|---|---|---|---|---|
| **P1 — Critical** | Sistem/modul utama tidak dapat digunakan; proses bisnis kritikal terhenti; potensi kehilangan data | Aplikasi APEX tidak bisa diakses sama sekali; concurrent program utama error di production; data corruption | < 1 jam | < 1 hari kerja |
| **P2 — High** | Fungsi penting terganggu namun ada workaround; dampak ke sebagian besar user | Report utama tidak bisa di-generate; proses approval stuck; performa sangat lambat (> 5x normal) | < 4 jam | < 1 hari kerja |
| **P3 — Minor** | Fungsi minor terganggu; dampak terbatas; workaround mudah dilakukan | Label/tampilan salah; field opsional tidak ter-save; laporan minor tidak sesuai format | < 4 jam | < 2 hari kerja |

**Ketentuan Tambahan SLA:**
- Response time dihitung dalam **jam kerja** (08.00–17.00 WIB, Senin–Jumat, kecuali hari libur nasional).
- Untuk P1 yang terjadi di luar jam kerja, response time dimulai pada **awal jam kerja berikutnya**, kecuali ada on-call arrangement yang disepakati.
- Jika resolution time tidak dapat dipenuhi, Developer wajib memberikan **update progress setiap 4 jam** kepada user/BPO yang melaporkan.
- Tiket yang melampaui resolution time SLA otomatis dieskalasi ke IT Development Manager.

**Eskalasi Tiket:**

| **Kondisi** | **Eskalasi Kepada** |
|---|---|
| P1 tidak ter-respond dalam 1 jam | IT Development Manager (langsung via phone) |
| P1 tidak ter-resolve dalam 1 hari kerja | IT Development Manager + BPO + Steering Committee |
| P2 tidak ter-resolve dalam 1 hari kerja | IT Development Manager |
| P3 tidak ter-resolve dalam 2 hari kerja | System Analyst |

**Periode Dukungan Intensif:**
Selama **30 hari pertama pasca go-live**, Tim PANDAWA memberikan dukungan intensif dengan prioritas lebih tinggi. Pada periode ini, seluruh tiket P2 diperlakukan setara P1 dari sisi response time.

---

**KOMUNIKASI GO-LIVE — TEMPLATE NOTIFIKASI** ⭐ **UPDATED**

Template berikut wajib dikirimkan kepada seluruh end user dan stakeholder terkait pada hari H go-live:

```
Subject: [GO-LIVE] {Nama Aplikasi} — Sistem Aktif per {Tanggal}

Kepada Yth. Pengguna {Nama Aplikasi},

Dengan hormat,

Kami informasikan bahwa {Nama Aplikasi} telah resmi go-live
dan dapat digunakan mulai {Tanggal} pukul {HH:MM} WIB.

URL Aplikasi  : {URL}
User Guide    : {Link dokumen DO070/DO080}
CR Referensi  : CR-{ID}

─────────────────────────────────────────
LAYANAN DUKUNGAN & SLA
─────────────────────────────────────────
Untuk pertanyaan atau laporan gangguan,
hubungi tim support dengan informasi berikut:

  Kanal     : {Email / Sistem Tiket / WhatsApp Group}
  PIC       : {Nama} ({No. HP/Ext})

Klasifikasi & SLA dukungan:

  P1 — Critical  : Response < 1 jam  | Resolve < 1 hari kerja
  P2 — High      : Response < 4 jam  | Resolve < 1 hari kerja
  P3 — Minor     : Response < 4 jam  | Resolve < 2 hari kerja

Periode dukungan intensif berlaku selama 30 hari pertama
(s.d. {Tanggal + 30 hari}).

Saat melaporkan gangguan, mohon sertakan:
  • Deskripsi masalah dan langkah yang dilakukan
  • Screenshot error (jika ada)
  • Nama user dan waktu kejadian

─────────────────────────────────────────

Terima kasih atas kepercayaan dan kerja sama Anda.

Hormat kami,
Tim PANDAWA — IT Upstream Development
```

---

## Technical Support & Infrastructure

Bagian ini adalah kegiatan yang berlangsung terus menerus sepanjang proyek berlangsung untuk menjamin kebutuhan teknis implementasi dapat disediakan.

### Aktivitas:
- Set-up routine daily back-up
- Set-up sistem untuk training, system test and Live
- Membantu penyelesaian kendala teknis yang dihadapi (jaringan, workstation, server, dll)
- **Install dan maintain security scanning tools**
- **Setup security monitoring infrastructure**

---

## Project Team Structure

### 1. Steering Committee

Terdiri atas manajemen dimana Steering Committee adalah pengambil keputusan dan pembuat kebijakan yang berkenaan dengan proyek dan perubahan-perubahan yang terjadi dalam operasional dan peraturan internal perusahaan/departemen. Steering Committee akan menghadiri pertemuan secara berkala untuk mendapatkan laporan perkembangan proyek dari Project Manager.

### 2. Project Manager

Mereka akan memastikan proyek berjalan sesuai rencana, dalam batasan yang sudah disepakati, tepat waktu dan budget. Project Manager harus menjamin semua pihak terkait serta key user telah bekerja maksimal.

#### Tanggung jawab:
- Memecahkan masalah yang timbul selama proyek
- Memberikan laporan perkembangan proyek kepada Steering Committee
- **Ensure security gate compliance**

### 3. Application Development Upstream Team (PANDAWA)

Merupakan tim kunci yang akan bekerja dengan key user untuk menentukan prioritas dari kebutuhan business process memetakannya kedalam sistem. System Analyst akan membuat spesifikasi teknis untuk front end ataupun back end developer sebagai dasar pembuatan kustomisasi form dan laporan.

#### Tanggung jawab:
- Membantu key user menyiapkan business process yang baru
- Memberikan training kepada key user
- Melakukan konfigurasi dan test terhadap sistem
- **Implement secure coding practices**
- **Fix security vulnerabilities**

### 4. BPO / Key Users / End Users

Untuk menjadi BPO / key users seseorang harus memiliki pemahaman mendalam tentang proses bisnis yang sekarang dan yang diinginkan dengan adanya sistem baru.

#### Tanggung jawab Key Users:
- Menentukan kebutuhan proses bisnis bersama team development/analis
- Pemetaan solusi
- Menyusun perubahan yang diperlukan dalam kebijakan dan operasional
- Mengumpulkan dan mengkonversikan data
- Melakukan validasi terhadap sistem
- Membuat hak akses untuk end user
- Memberikan training pada end user
- Membuat dokumen end user guide
- Mendukung pelaksanaan Go-Live

### 5. Infrastructure Team

Akan bertanggung-jawab melakukan instalasi OS, mendukung anggota tim development dalam kaitannya dengan kebutuhan hardware & infrastruktur serta jaringan/network.

#### Tanggung jawab:
- Install dan maintain hardware
- Setup network infrastructure
- **Install dan maintain security tools**
- **Configure security monitoring**

### 6. Support Team

Merupakan team support yang nantinya akan membantu setelah system yang dibangun sudah berjalan di level production/operasional.

#### Tanggung jawab:
- User support dan troubleshooting
- **Monitor security alerts**
- **Report security incidents**

### 7. Security Officer ⭐ **NEW ROLE**

Bertanggung jawab atas seluruh aspek security dalam project lifecycle.

#### Tanggung jawab:
- Conduct security scans (APEX Sert, APEX Advisor, APEX Visualizer)
- Review security vulnerability reports
- Approve/reject security gate
- Define dan enforce security policies
- Train team on security best practices
- Monitor production security
- Manage security incidents

---

## Project Control

### Meeting Schedule:
- **Progress Meeting**: Weekly / Bi-Weekly
- **Quality Assurance Meeting**: Every Month
- **Steering Committee Meeting**: Every Month
- **Security Review Meeting**: Before each Deployment ⭐ **NEW**
- **Ad-Hoc Meeting**: Case by Case Basis

### Communication & Documentation:
- Centralized Project Documentations Pool
- Email
- **Security Reports Repository** ⭐ **NEW**

### Escalation Conditions ⭐ **NEW**

Eskalasi ke Steering Committee **wajib dilakukan** apabila salah satu dari kondisi berikut terpenuhi:

| **Kondisi Eskalasi** | **Threshold** | **Tindakan Wajib** |
|---|---|---|
| Schedule Slip | > 20% dari total durasi proyek (misal: proyek 10 sprint, maka slip > 2 sprint) | Eskalasi ke Steering Committee dalam 1 hari kerja |
| Budget Overrun | > 15% dari total anggaran proyek yang disetujui | Eskalasi ke IT Development Manager + Finance dalam 1 hari kerja; ke Steering Committee dalam 3 hari kerja |
| Sprint Miss Berturut-turut | 3 sprint berturut-turut tidak mencapai target deliverable | Eskalasi ke Steering Committee; review ulang scope dan resources |
| Vendor Performance | Vendor gagal memenuhi 2 milestone berturut-turut atau evaluasi QCDSM < C | Eskalasi ke Procurement + IT Development Manager; pertimbangkan penggantian vendor |
| Security Gate Gagal | Gagal APEX-SERT gate lebih dari 2 kali iterasi pada fase yang sama | Eskalasi ke IT Development Manager; review ulang vendor capability |
| Critical Issue Unresolved | Issue P1/P2 tidak terselesaikan dalam SLA yang ditetapkan | Eskalasi langsung ke IT Development Manager dan BPO |

> **Catatan**: Threshold di atas dihitung kumulatif dari baseline jadwal/anggaran yang disepakati di Project Charter. Setiap kondisi eskalasi harus dicatat dalam sistem tiket dan Progress Meeting MOM.

### Escalation Matrix ⭐ **NEW**

| **Level Eskalasi** | **Siapa yang Mengekskalasi** | **Kepada Siapa** | **Dalam Waktu** | **Media** |
|---|---|---|---|---|
| **Level 1** | Developer / QA | System Analyst + PMO | Segera (dalam hari yang sama) | Tiket / Chat |
| **Level 2** | System Analyst / PMO | IT Development Manager | 1 hari kerja | Email + Tiket |
| **Level 3** | IT Development Manager | Steering Committee | 3 hari kerja | Email formal + laporan tertulis |
| **Level 3 — Budget** | PMO + IT Development Manager | Steering Committee + Finance Director | 3 hari kerja | Email formal + dokumen revisi anggaran |
| **Emergency** | Siapapun | IT Development Manager (langsung) | Segera (< 1 jam) | Phone / chat langsung |

### Progress Meeting Template ⭐ **NEW**

Setiap sesi Progress Meeting (Weekly / Bi-Weekly) wajib menggunakan agenda standar berikut. MOM ditulis oleh PMO dan didistribusikan paling lambat **1 hari kerja** setelah meeting.

---

**PROGRESS MEETING — AGENDA TEMPLATE**

```
Proyek     : ___________________________
Tanggal    : ___________________________
Fasilitator: ___________________________ (PMO)
Peserta    : ___________________________
```

**1. Status Milestone (10 menit)**
- Review pencapaian milestone sejak meeting terakhir
- Persentase completion vs. baseline jadwal
- Flag: apakah schedule slip > 20%? (Ya / Tidak) → jika Ya, eskalasi wajib

**2. Status Budget (5 menit)**
- Realisasi pengeluaran vs. anggaran
- Flag: apakah overrun > 15%? (Ya / Tidak) → jika Ya, eskalasi wajib

**3. Sprint Review (10 menit)**
- Sprint yang berjalan: target vs. aktual
- Jumlah sprint miss berturut-turut saat ini: ___ (eskalasi jika ≥ 3)

**4. Issues & Risiko (10 menit)**
- Issues baru yang muncul sejak meeting terakhir
- Issues yang sedang dalam proses penyelesaian (owner + target tanggal)
- Update risiko dari Risk Register

**5. Security & Quality Gate (5 menit)**
- Status APEX-SERT scan (jika ada iterasi berjalan)
- Open items dari QA review terakhir

**6. Vendor Performance (5 menit — jika ada vendor eksternal)**
- Update deliverable vendor
- Flag: milestone vendor gagal? Perlu eskalasi ke Procurement?

**7. Action Items (5 menit)**
- Konfirmasi action items dari meeting sebelumnya (selesai / belum)
- Tetapkan action items baru: aktivitas, owner, due date

**8. Next Steps**
- Rencana untuk periode hingga meeting berikutnya

---

*Template ini wajib digunakan untuk setiap Progress Meeting. PMO menyimpan seluruh MOM di: `/Projects/[Nama Proyek]/Progress_Meetings/`*

---

## Document Reference Codes

### Business & Requirements
- **BP070**: Business Requirements Analysis / Business Blueprint Document
- **BP080**: Proposed Solution Development
- **BR010**: Business Requirements

### Development
- **MD050**: Customization Technical Specification
- **MD060**: Customization Development
- **MD070**: Customization Development

### Testing & Deployment
- **TE040**: Test Scenario Document
- **DO070**: User Procedure Documentation
- **DO080**: User Procedure Documentation

### Go-Live
- **PM010**: Go-Live Transition Strategy Template
- **PM040**: Go-Live Checklist Template

### Security ⭐ **NEW**
- **SV010**: Security Vulnerability Assessment Report
- **SC020**: Security Checklist
- **SR030**: Security Remediation Plan
- **SP040**: Security Policy Document
- **SA050**: Security Audit Log

---

## Updated Project Flow with Security Gate

```
┌──────────────────────────────────────────────────────┐
│ PROJECT METHODOLOGY WITH SECURITY GATE               │
├──────────────────────────────────────────────────────┤
│                                                      │
│ 1. Project Initiation                                │
│ 2. Business Requirement                              │
│ 3. Team Training & Solution Design                   │
│ 4. Solution Development                              │
│    ↓                                                 │
│    ┌──────────────────────────────────────┐          │
│    │ 🔒 SECURITY GATE CHECKPOINT          │          │
│    ├──────────────────────────────────────┤          │
│    │ • APEX Sert Scan                     │          │
│    │ • APEX Advisor Check                 │          │
│    │ • APEX Visualizer Review             │          │
│    │ • Vulnerability Remediation          │          │
│    │ • Security Approval                  │          │
│    └──────────────────┬───────────────────┘          │
│                       │                              │
│           ┌───────────┴───────────┐                  │
│           │                       │                  │
│        PASS ✅                  FAIL ❌              │
│           │                       │                  │
│           ↓                       ↓                  │
│ 5. Solution Deployment    Return to Development      │
│ 6. User Acceptance Test                              │
│ 7. Go-Live & Support                                 │
│    └─> Continuous Security Monitoring                │
│                                                      │
└──────────────────────────────────────────────────────┘
```

---

**Document prepared by PANDAWA Team**  
*Professional ApplicatioN Development team for Advancing Web Applications*

**Last Updated**: March 2026  
**Version**: 2.1 (Added Vendor Selection, Escalation Matrix, Progress Meeting Template, Post-Go-Live SLA)
