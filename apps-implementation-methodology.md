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
6. [Data Conversion](#data-conversion)
7. [Solution Deployment](#solution-deployment)
8. [Go-Live Preparation and Execution](#go-live-preparation-and-execution)
9. [Technical Support & Infrastructure](#technical-support--infrastructure)
10. [Project Team Structure](#project-team-structure)
11. [Project Control](#project-control)

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

5. **Solution Deployment**
   - Production System Configuration
   - Conduct System Test
   - User Procedure Document

6. **Go-Live Preparation & Execution**
   - End-User Training
   - User Acceptance Test
   - Go-Live and Support

### Supporting Activities

Throughout the project:
- **Data Conversion**
- **Change Management**
- **Technical Support & Infrastructure**
- **Project Management Officer**

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

Pada dasarnya tahap ini mengerjakan implementasi sistem baru ke server Production. Setelah sistem prototype selesai test dan mendapat konfirmasi dari tim proyek, semua hasil konfigurasi dan kustomisasi akan di-copy dari server Development ke server Production.

### 1. Production System Configuration

Team Development akan memindahkan sistem Prototype ke server Development dengan cara cloning server Development ataupun dengan cara reconfigure. Setelah itu, master data yang telah diselesai dikonversikan akan di-upload ke sistem ini. Tim Development akan melakukan backup sebelum sistem ini ditest.

### 2. Conduct System Test

Team Development/Analyst dan key user bersama-sama melakukan test terhadap sistem yang baru menggunakan beberapa skenario yang telah dibuat. Tujuannya untuk memastikan apakah sistem yang baru di server Production sudah berfungsi sama dengan sistem di server Development. Selesai test, sistem akan di-restore ke posisi dimana belum ada data transaksi yang masuk.

### 3. User Procedure Documentation (DO070, DO080)

Key user pada tahap ini akan membuat panduan pengerjaan bagi end user. Panduan ini dibuat sesuai dengan alur business process yang sudah dirancang khusus untuk perusahaannya. Dokumen ini akan digunakan sebagai materi pelatihan untuk end user.

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

---

## Technical Support & Infrastructure

Bagian ini adalah kegiatan yang berlangsung terus menerus sepanjang proyek berlangsung untuk menjamin kebutuhan teknis implementasi dapat disediakan.

### Aktivitas:
- Set-up routine daily back-up
- Set-up sistem untuk training, system test and Live
- Membantu penyelesaian kendala teknis yang dihadapi (jaringan, workstation, server, dll)

---

## Project Team Structure

### 1. Steering Committee

Terdiri atas manajemen dimana Steering Committee adalah pengambil keputusan dan pembuat kebijakan yang berkenaan dengan proyek dan perubahan-perubahan yang terjadi dalam operasional dan peraturan internal perusahaan/departemen. Steering Committee akan menghadiri pertemuan secara berkala untuk mendapatkan laporan perkembangan proyek dari Project Manager.

### 2. Project Manager

Mereka akan memastikan proyek berjalan sesuai rencana, dalam batasan yang sudah disepakati, tepat waktu dan budget. Project Manager harus menjamin semua pihak terkait serta key user telah bekerja maksimal.

#### Tanggung jawab:
- Memecahkan masalah yang timbul selama proyek
- Memberikan laporan perkembangan proyek kepada Steering Committee

### 3. Application Development Upstream Team (PANDAWA)

Merupakan tim kunci yang akan bekerja dengan key user untuk menentukan prioritas dari kebutuhan business process memetakannya kedalam sistem. System Analyst akan membuat spesifikasi teknis untuk front end ataupun back end developer sebagai dasar pembuatan kustomisasi form dan laporan.

#### Tanggung jawab:
- Membantu key user menyiapkan business process yang baru
- Memberikan training kepada key user
- Melakukan konfigurasi dan test terhadap sistem

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

### 6. Support Team

Merupakan team support yang nantinya akan membantu setelah system yang dibangun sudah berjalan di level production/operasional.

---

## Project Control

### Meeting Schedule:
- **Progress Meeting**: Weekly / Bi-Weekly
- **Quality Assurance Meeting**: Every Month
- **Steering Committee Meeting**: Every Month
- **Ad-Hoc Meeting**: Case by Case Basis

### Communication & Documentation:
- Centralized Project Documentations Pool
- Email

---

## Document Reference Codes

- **BP070**: Business Requirements Analysis / Business Blueprint Document
- **BP080**: Proposed Solution Development
- **BR010**: Business Requirements
- **MD050**: Customization Technical Specification
- **MD060**: Customization Development
- **MD070**: Customization Development
- **TE040**: Test Scenario Document
- **DO070**: User Procedure Documentation
- **DO080**: User Procedure Documentation
- **PM010**: Go-Live Transition Strategy Template
- **PM040**: Go-Live Checklist Template

---

**Document prepared by PANDAWA Team**  
*Professional ApplicatioN Development team for Advancing Web Applications*