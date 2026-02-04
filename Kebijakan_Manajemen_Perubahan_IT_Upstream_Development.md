# KEBIJAKAN MANAJEMEN PERUBAHAN

**Departemen IT Upstream Development**

---

| | |
|---|---|
| **Judul Dokumen:** | Kebijakan Manajemen Perubahan |
| **Departemen:** | IT Upstream Development (Tim PANDAWA) |
| **Versi:** | 1.0 |
| **Tanggal Efektif:** | 04 Februari 2026 |
| **Tanggal Review:** | Tahunan |
| **Pemilik:** | IT Development Manager |

---

## Daftar Isi

1. [TUJUAN DAN RUANG LINGKUP](#1-tujuan-dan-ruang-lingkup)
2. [DEFINISI](#2-definisi)
3. [PERAN DAN TANGGUNG JAWAB](#3-peran-dan-tanggung-jawab)
4. [KATEGORI PERUBAHAN](#4-kategori-perubahan)
5. [PROSES PERMINTAAN PERUBAHAN](#5-proses-permintaan-perubahan)
6. [ALUR PERSETUJUAN PERUBAHAN](#6-alur-persetujuan-perubahan)
7. [PANDUAN IMPLEMENTASI](#7-panduan-implementasi)
8. [PROSEDUR ROLLBACK](#8-prosedur-rollback)
9. [KEBUTUHAN DOKUMENTASI](#9-kebutuhan-dokumentasi)
10. [REFERENSI](#10-referensi)
11. [RIWAYAT REVISI](#11-riwayat-revisi)
12. [LAMPIRAN](#lampiran)

---

## 1. TUJUAN DAN RUANG LINGKUP

### 1.1 Tujuan

Kebijakan Manajemen Perubahan ini menetapkan pendekatan standar untuk mengelola perubahan pada aplikasi Oracle E-Business Suite (EBS) dan Oracle Application Express (APEX) di dalam Departemen IT Upstream Development. Kebijakan ini memastikan bahwa semua perubahan:

- Dievaluasi dengan tepat untuk dampak bisnis dan kelayakan teknis
- Disetujui oleh pemangku kepentingan yang sesuai
- Diimplementasikan mengikuti standar development yang telah ditetapkan
- Diuji secara menyeluruh sebelum deployment
- Didokumentasikan dan dikomunikasikan kepada pihak yang terkait
- Dapat dikembalikan melalui prosedur rollback yang telah didefinisikan

### 1.2 Ruang Lingkup

Kebijakan ini berlaku untuk semua perubahan yang mempengaruhi:

- Kustomisasi dan ekstensi Oracle E-Business Suite (EBS)
- Aplikasi dan komponen Oracle APEX
- Objek database (tabel, view, package, procedure, function)
- Concurrent program dan report
- Form, workflow, dan logika bisnis
- Titik integrasi dan interface
- Konfigurasi dan setup aplikasi

### 1.3 Pengecualian

Yang dikecualikan dari kebijakan ini:

- Aplikasi patch standar (diatur oleh kebijakan patch management terpisah)
- Perbaikan keamanan darurat (dipercepat melalui prosedur terpisah)
- Perubahan infrastruktur (dikelola oleh Tim Infrastruktur)
- Perbaikan data yang tidak memerlukan perubahan kode

---

## 2. DEFINISI

**Perubahan (Change)**: Setiap penambahan, modifikasi, atau penghapusan fungsionalitas aplikasi, objek database, atau konfigurasi yang dapat mempengaruhi lingkungan production.

**Permintaan Perubahan (Change Request/CR)**: Proposal formal untuk mengimplementasikan perubahan, didokumentasikan mengikuti template yang ditentukan dalam kebijakan ini.

**Perubahan Darurat (Emergency Change)**: Perubahan yang harus diimplementasikan dengan segera untuk menyelesaikan masalah production kritis atau kerentanan keamanan.

**Perubahan Standar (Standard Change)**: Perubahan yang telah disetujui sebelumnya, berisiko rendah, yang mengikuti prosedur terdokumentasi (misalnya modifikasi akses user, update konfigurasi rutin).

**Perubahan Normal (Normal Change)**: Perubahan yang memerlukan evaluasi, persetujuan, dan pengujian sebelum implementasi.

**Perubahan Mayor (Major Change)**: Perubahan yang berdampak signifikan pada proses bisnis, mempengaruhi beberapa modul, atau memerlukan upaya development substansial.

**Rollback**: Proses mengembalikan perubahan untuk mengembalikan kondisi kerja sebelumnya.

**Lingkungan Production**: Sistem aktif dimana end-user melakukan transaksi bisnis aktual.

**Lingkungan Development**: Lingkungan terisolasi dimana developer membangun dan menguji perubahan.

**Lingkungan UAT**: Lingkungan User Acceptance Testing dimana business user memvalidasi perubahan sebelum deployment production.

---

## 3. PERAN DAN TANGGUNG JAWAB

### 3.1 Pemohon Perubahan (Change Requestor)

- Mengajukan permintaan perubahan dengan justifikasi bisnis yang lengkap
- Berpartisipasi dalam analisis requirements dan desain solusi
- Mereview dan menyetujui solusi yang diusulkan
- Memvalidasi perubahan selama UAT
- Menandatangani perubahan yang telah selesai

### 3.2 Business Process Owner (BPO) / Key User

- Mereview permintaan perubahan untuk dampak bisnis
- Memberikan masukan tentang business requirements
- Menyetujui atau menolak permintaan perubahan
- Mengkoordinasikan aktivitas UAT
- Memastikan pelatihan end-user dilakukan

### 3.3 System Analyst

- Menganalisis permintaan perubahan untuk kelayakan teknis
- Mengembangkan spesifikasi teknis (MD050)
- Mengkoordinasikan antara tim bisnis dan development
- Mereview skenario dan hasil testing
- Memastikan kepatuhan terhadap standar development

### 3.4 Developer

- Mengimplementasikan perubahan sesuai spesifikasi
- Mengikuti standar coding dan konvensi penamaan
- Melakukan unit testing
- Mendokumentasikan perubahan kode dan riwayat versi
- Memberikan dukungan teknis selama deployment

### 3.5 Project Manager (PMO)

- Mengelola pipeline dan prioritas permintaan perubahan
- Mengkoordinasikan sumber daya dan timeline
- Memonitor progress implementasi perubahan
- Mengeskalasi masalah ke steering committee
- Melaporkan metrik dan KPI perubahan

### 3.6 Quality Assurance (QA)

- Mereview skenario test dan test case
- Melakukan testing independen bila diperlukan
- Memvalidasi kepatuhan terhadap standar
- Menandatangani penyelesaian testing

### 3.7 Steering Committee

- Menyetujui perubahan mayor dan alokasi budget
- Menyelesaikan konflik dan masalah yang dieskalasi
- Mereview metrik change management
- Mengotorisasi perubahan darurat

### 3.8 Tim Infrastruktur

- Menyediakan dukungan lingkungan
- Membantu deployment
- Mengelola backup dan recovery
- Memonitor performa sistem

---

## 4. KATEGORI PERUBAHAN

Semua perubahan diklasifikasikan ke dalam salah satu kategori berikut berdasarkan risiko, kompleksitas, dan dampak bisnis:

### 4.1 Perubahan Darurat (Emergency Change)

| Aspek | Deskripsi |
|---|---|
| **Definisi** | Masalah kritis yang memerlukan penyelesaian segera untuk mencegah atau menyelesaikan production outage, kehilangan data, atau pelanggaran keamanan |
| **Persetujuan** | IT Development Manager + Business Process Owner (dapat diperoleh secara verbal dengan konfirmasi tertulis dalam 24 jam) |
| **Testing** | Testing minimal di development; deployment segera ke production dengan monitoring ketat |
| **Dokumentasi** | Dokumentasi sederhana; dokumentasi lengkap diselesaikan dalam 48 jam pasca-implementasi |
| **Contoh** | • Kerentanan keamanan kritis<br>• Production outage yang mempengaruhi operasi bisnis<br>• Korupsi data yang memerlukan perbaikan segera |

### 4.2 Perubahan Standar (Standard Change)

| Aspek | Deskripsi |
|---|---|
| **Definisi** | Perubahan yang telah disetujui sebelumnya, berisiko rendah, rutin yang mengikuti prosedur terdokumentasi |
| **Persetujuan** | Pra-otorisasi; memerlukan notifikasi ke BPO |
| **Testing** | Mengikuti prosedur test standar; UAT opsional |
| **Dokumentasi** | Update dokumentasi prosedur yang ada |
| **Contoh** | • Modifikasi akses user<br>• Update value set<br>• Perubahan parameter report<br>• Update konfigurasi standar |

### 4.3 Perubahan Normal (Normal Change)

| Aspek | Deskripsi |
|---|---|
| **Definisi** | Perubahan dengan kompleksitas menengah dengan dampak bisnis moderat |
| **Persetujuan** | BPO + System Analyst + Project Manager |
| **Testing** | Testing development + UAT diperlukan |
| **Dokumentasi** | Dokumentasi lengkap sesuai template (BP070, MD050, TE040) |
| **Contoh** | • Development report baru<br>• Kustomisasi form<br>• Logika validasi baru<br>• Modifikasi workflow<br>• Enhancement interface |

### 4.4 Perubahan Mayor (Major Change)

| Aspek | Deskripsi |
|---|---|
| **Definisi** | Perubahan dengan kompleksitas tinggi dengan dampak bisnis signifikan, mempengaruhi beberapa modul atau memerlukan upaya development substansial |
| **Persetujuan** | Steering Committee + semua BPO terkait |
| **Testing** | Testing komprehensif (Development + System Test + UAT + Performance Testing) |
| **Dokumentasi** | Dokumentasi proyek lengkap sesuai Apps Implementation Methodology |
| **Contoh** | • Implementasi modul baru<br>• Redesain proses mayor<br>• Integrasi dengan sistem eksternal<br>• Program konversi<br>• Perubahan yang mempengaruhi beberapa unit bisnis |

---

## 5. PROSES PERMINTAAN PERUBAHAN

### 5.1 Inisiasi Permintaan Perubahan

Semua permintaan perubahan harus diinisiasi melalui form Change Request formal yang berisi:

- ID Permintaan Perubahan (diberikan oleh PMO)
- Informasi pemohon (nama, departemen, kontak)
- Tanggal pengajuan
- Justifikasi bisnis dan manfaat yang diharapkan
- Deskripsi perubahan yang diusulkan
- Modul/aplikasi yang terpengaruh
- Timeline yang diharapkan
- Prioritas (Kritis / Tinggi / Menengah / Rendah)
- Tiket terkait atau permintaan perubahan sebelumnya
- Estimasi effort (akan dilengkapi oleh Analyst)

### 5.2 Evaluasi Permintaan Perubahan

Setelah diterima, System Analyst akan:

- Mereview permintaan perubahan untuk kelengkapan
- Mengklasifikasikan kategori perubahan
- Menilai kelayakan teknis
- Mengestimasi upaya development dan sumber daya yang diperlukan
- Mengidentifikasi potensi risiko dan dependensi
- Merekomendasikan pendekatan (kustomisasi vs konfigurasi vs workaround)
- Memberikan timeline preliminer
- Menyerahkan evaluasi ke Project Manager untuk prioritisasi

### 5.3 Prioritisasi

Project Manager, dalam konsultasi dengan BPO dan Steering Committee, akan memprioritaskan perubahan berdasarkan:

- Kritikalitas dan dampak bisnis
- Persyaratan regulasi atau compliance
- Ketersediaan sumber daya
- Dependensi teknis
- Keselarasan strategis
- Analisis risiko vs manfaat

### 5.4 Status Permintaan Perubahan

Permintaan perubahan berkembang melalui status berikut:

- **Submitted**: Pengajuan awal, menunggu evaluasi
- **Under Evaluation**: Sedang dianalisis oleh System Analyst
- **Pending Approval**: Menunggu persetujuan dari otoritas yang sesuai
- **Approved**: Disetujui dan dijadwalkan untuk development
- **In Development**: Sedang dikembangkan oleh tim development
- **In Testing**: Sedang menjalani UAT atau system testing
- **Ready for Deployment**: Lulus semua test, siap untuk production
- **Deployed**: Berhasil dideploy ke production
- **Rejected**: Ditolak dengan alasan terdokumentasi
- **Cancelled**: Dibatalkan oleh pemohon
- **On Hold**: Ditangguhkan sementara dengan alasan

---

## 6. ALUR PERSETUJUAN PERUBAHAN

### 6.1 Persetujuan Perubahan Darurat

1. Masalah diidentifikasi oleh anggota tim atau user
2. IT Development Manager diberitahu segera
3. Manager menilai severity dan mengotorisasi perubahan darurat
4. Persetujuan verbal diperoleh dari BPO (didokumentasikan dalam 24 jam)
5. Developer mengimplementasikan perbaikan dengan testing minimal
6. Perubahan dideploy ke production dengan monitoring ketat
7. Post-implementation review dilakukan dalam 48 jam
8. Dokumentasi lengkap diselesaikan dan diarsipkan

### 6.2 Persetujuan Perubahan Standar

1. Pemohon mengajukan permintaan perubahan ke PMO
2. PMO memvalidasi permintaan mengikuti prosedur standar
3. Notifikasi dikirim ke BPO (tidak memerlukan persetujuan eksplisit)
4. Developer mengimplementasikan mengikuti prosedur standar
5. Perubahan ditest di lingkungan development
6. Dideploy ke production selama maintenance window
7. Notifikasi dikirim ke user yang terpengaruh

### 6.3 Persetujuan Perubahan Normal

1. Pemohon mengajukan permintaan perubahan ke PMO
2. System Analyst mengevaluasi dan mengklasifikasikan perubahan
3. Analyst mengembangkan Business Requirement Document (BP070)
4. BPO mereview dan menyetujui Business Blueprint
5. Analyst mengembangkan Proposed Solution (BP080)
6. BPO dan stakeholder terkait mereview dan sign-off
7. Technical Specification dibuat (MD050)
8. Project Manager menyetujui untuk development
9. Development berlanjut mengikuti implementation methodology
10. UAT dilakukan dan ditandatangani oleh BPO
11. Deployment production dijadwalkan dan dikomunikasikan

### 6.4 Persetujuan Perubahan Mayor

1. Pemohon mengajukan proposal proyek formal
2. Project Manager mempresentasikan ke Steering Committee
3. Committee menyetujui scope, budget, dan timeline
4. Project Charter dibuat (jika diperlukan)
5. Apps Implementation Methodology lengkap diikuti
6. Regular steering committee review dijadwalkan
7. Multiple approval gate sepanjang project lifecycle
8. Sign-off final dari semua stakeholder sebelum go-live

### 6.5 Kebutuhan Sign-Off

Sign-off berikut diperlukan pada milestone kunci:

| Milestone | Sign-Off yang Diperlukan | Dokumen |
|---|---|---|
| Business Requirements | BPO + Key Users | BP070 - Business Blueprint |
| Proposed Solution | BPO + System Analyst | BP080 - Proposed Solution |
| Technical Specification | System Analyst + Developer | MD050 - Technical Spec |
| Penyelesaian UAT | BPO + Key Users | TE040 - Test Scenario (ditandatangani) |
| Production Deployment | BPO + IT Manager | Deployment Checklist |

---

## 7. PANDUAN IMPLEMENTASI

### 7.1 Kepatuhan Standar Development

Semua pekerjaan development harus mematuhi dokumen Standar Development Oracle, termasuk:

- Konvensi penamaan untuk semua objek database
- Kebutuhan coding style dan formatting
- Standar commenting dan dokumentasi
- Praktik error handling dan logging
- Panduan optimisasi performa
- Best practice keamanan

**Referensi:** Standar Development Oracle v1.0 (oracle-dev-standards.md)

### 7.2 Version Control

Semua PL/SQL package harus menyertakan fungsi `package_version`:

```sql
function package_version return varchar2;
```

Format penomoran versi: **XX.YY.ZZ**

- **XX (Major)**: Dinaikkan untuk perubahan multi-package atau fungsionalitas mayor
- **YY (Minor)**: Dinaikkan untuk perubahan package specification
- **ZZ (Patch)**: Dinaikkan untuk perubahan package body saja

### 7.3 Kebutuhan Testing

#### 7.3.1 Unit Testing (Developer)

- Test semua code path dan logic branch baru
- Verifikasi error handling bekerja dengan benar
- Test dengan data valid dan invalid
- Dokumentasikan hasil test
- Perbaiki semua defect yang teridentifikasi sebelum promosi

#### 7.3.2 System Testing (Analyst)

- Eksekusi test scenario dari dokumen TE040
- Verifikasi integrasi dengan modul terkait
- Test eksekusi concurrent program
- Validasi output report
- Konfirmasi performa memenuhi requirements

#### 7.3.3 User Acceptance Testing (UAT)

- BPO dan Key Users mengeksekusi skenario bisnis
- Validasi terhadap business requirements
- Test dengan volume data realistis
- Verifikasi prosedur user dan dokumentasi
- Sign-off diperlukan sebelum deployment production

### 7.4 Jalur Promosi Environment

Perubahan harus dipromosikan melalui environment dalam urutan berikut:

**Development** → Initial development dan unit testing

**UAT/Test** → System testing dan user acceptance testing

**Production** → Lingkungan aktif (deployment final)

> **⚠️ KRITIS:** Tidak ada perubahan yang boleh dilakukan langsung di lingkungan Production kecuali untuk perubahan darurat dengan otorisasi yang tepat.

### 7.5 Jadwal Deployment

Window deployment standar:

- **Perubahan Normal**: Akhir pekan atau di luar jam kerja (memerlukan pemberitahuan sebelumnya)
- **Perubahan Standar**: Kapan saja (dampak bisnis minimal)
- **Perubahan Darurat**: Segera (dengan otorisasi yang tepat)
- **Perubahan Mayor**: Dikoordinasikan dengan kalender bisnis (hindari akhir bulan)

### 7.6 Kebutuhan Komunikasi

- Notifikasi deployment dikirim 48 jam sebelumnya (perubahan normal)
- Komunikasi mencakup: scope, timing, expected downtime, rollback plan
- Notifikasi pasca-deployment mengkonfirmasi keberhasilan atau masalah
- Komunikasi perubahan darurat dalam 4 jam setelah implementasi
- Update status perubahan rutin dalam progress meeting

---

## 8. PROSEDUR ROLLBACK

### 8.1 Perencanaan Rollback

Setiap perubahan harus menyertakan rencana rollback yang mendokumentasikan:

- Kriteria keputusan rollback (kondisi apa yang memicu rollback)
- Langkah-langkah prosedur rollback
- File backup dan script yang diperlukan
- Estimasi waktu rollback
- Langkah verifikasi untuk konfirmasi rollback berhasil
- Rencana komunikasi untuk skenario rollback

### 8.2 Backup Pra-Deployment

Sebelum deployment production, hal berikut harus di-backup:

- Database export dari tabel yang terpengaruh (jika ada perubahan data)
- Versi saat ini dari semua objek PL/SQL yang dimodifikasi
- Screenshot atau export konfigurasi
- Complete application export (untuk perubahan APEX)
- Dokumentasi kondisi saat ini

**Format penamaan file backup:** `NAMA_OBJEK_BKPyymmdd`

### 8.3 Eksekusi Rollback

Otoritas rollback:

- **Perubahan Standar/Normal**: IT Development Manager atau System Analyst
- **Perubahan Mayor**: Persetujuan Steering Committee diperlukan
- **Perubahan Darurat**: IT Development Manager (segera)

### 8.4 Aktivitas Pasca-Rollback

- Verifikasi fungsionalitas sistem dipulihkan
- Notifikasi semua stakeholder tentang rollback
- Dokumentasikan alasan rollback
- Lakukan root cause analysis
- Update permintaan perubahan dengan lessons learned
- Revisi rencana implementasi sebelum percobaan ulang

---

## 9. KEBUTUHAN DOKUMENTASI

### 9.1 Dokumen Wajib Berdasarkan Kategori Perubahan

| Dokumen | Darurat | Standar | Normal | Mayor |
|---|---|---|---|---|
| Form Change Request | Sederhana | Ya | Ya | Ya |
| Business Blueprint (BP070) | Tidak | Tidak | Ya | Ya |
| Proposed Solution (BP080) | Tidak | Tidak | Ya | Ya |
| Technical Spec (MD050) | Pasca-impl | Jika custom | Ya | Ya |
| Test Scenario (TE040) | Tidak | Opsional | Ya | Ya |
| User Guide (DO070/DO080) | Pasca-impl | Update existing | Ya | Ya |
| Deployment Checklist | Ya | Ya | Ya | Ya |
| Rollback Plan | Ya | Ya | Ya | Ya |

### 9.2 Standar Dokumentasi Kode

Semua kode PL/SQL harus menyertakan:

- Header comment bergaya JavaDoc yang menjelaskan tujuan, parameter, dan return
- Inline comment untuk logika yang kompleks
- Riwayat versi dalam fungsi `package_version`
- Informasi author dan tanggal
- Referensi ke ID permintaan perubahan terkait
- Contoh penggunaan jika diperlukan

### 9.3 Repositori Dokumen

Semua dokumentasi proyek harus disimpan dalam repositori terpusat:

```
/Projects/[Nama Proyek]/Requirements/
/Projects/[Nama Proyek]/Design/
/Projects/[Nama Proyek]/Testing/
/Projects/[Nama Proyek]/Deployment/
/Projects/[Nama Proyek]/Training/
```

### 9.4 Retensi Dokumen

Dokumen harus disimpan sesuai jadwal berikut:

- **Dokumen Proyek Aktif**: 5 tahun setelah penyelesaian proyek
- **Catatan Change Request**: 3 tahun setelah implementasi
- **Spesifikasi Teknis**: Permanen (atau sampai sistem pensiun)
- **Hasil Test**: 2 tahun setelah implementasi
- **Catatan Deployment**: 3 tahun setelah deployment

---

## 10. REFERENSI

Kebijakan ini mereferensikan dan melengkapi dokumen-dokumen berikut:

**Standar Development Oracle v1.0**
- Lokasi: oracle-dev-standards.md

**Metodologi Implementasi Aplikasi**
- Lokasi: apps-implementation-methodology.md

**Konvensi Penamaan Oracle EBS dan APEX**
- Lokasi: naming-convention-oracle.md

**ITIL Change Management Framework**
- Lokasi: Framework standar industri

**Kebijakan Keamanan IT Perusahaan**
- Lokasi: Dokumen kebijakan korporat

### 10.1 Template Terkait

- BP070 - Business Requirements Analysis / Business Blueprint
- BP080 - Proposed Solution Development
- MD050 - Customization Technical Specification
- TE040 - Test Scenario Document
- DO070/DO080 - User Procedure Documentation
- PM010 - Go-Live Transition Strategy
- PM040 - Go-Live Checklist

---

## 11. RIWAYAT REVISI

| Versi | Tanggal | Penulis | Perubahan |
|---|---|---|---|
| 1.0 | 2026-02-04 | IT Development Manager | Rilis awal Kebijakan Manajemen Perubahan |

---

## LAMPIRAN

### LAMPIRAN A: TEMPLATE FORMULIR PERMINTAAN PERUBAHAN

Informasi berikut harus disertakan dalam semua permintaan perubahan:

| Field | Nilai |
|---|---|
| **ID CR:** | [Auto-assigned oleh PMO] |
| **Tanggal Pengajuan:** | |
| **Nama Pemohon:** | |
| **Departemen:** | |
| **Info Kontak:** | |
| **Judul Perubahan:** | |
| **Kategori Perubahan:** | ☐ Darurat  ☐ Standar  ☐ Normal  ☐ Mayor |
| **Prioritas:** | ☐ Kritis  ☐ Tinggi  ☐ Menengah  ☐ Rendah |
| **Justifikasi Bisnis:** | |
| **Deskripsi Detail:** | |
| **Modul yang Terpengaruh:** | |
| **Manfaat yang Diharapkan:** | |
| **Timeline yang Diusulkan:** | |
| **Tiket Terkait:** | |
| **Persetujuan yang Diperlukan:** | BPO: ________  Analyst: ________  Manager: ________ |

---

### LAMPIRAN B: TEMPLATE CHECKLIST DEPLOYMENT

#### Pra-Deployment

- [ ] Permintaan perubahan disetujui oleh semua otoritas yang diperlukan
- [ ] Semua testing selesai dan ditandatangani
- [ ] Notifikasi deployment dikirim ke user (48 jam sebelumnya)
- [ ] Backup objek production saat ini selesai
- [ ] Rencana rollback didokumentasikan dan direview
- [ ] Script deployment ditest di lingkungan UAT
- [ ] Tim infrastruktur diberitahu

#### Deployment

- [ ] Backup lingkungan production diverifikasi
- [ ] Semua user logout dari modul yang terpengaruh
- [ ] Script deployment dieksekusi dalam urutan yang benar
- [ ] Tidak ada error selama deployment
- [ ] Kompilasi objek berhasil
- [ ] Perubahan database diverifikasi

#### Pasca-Deployment

- [ ] Smoke testing selesai dengan sukses
- [ ] Akses user diverifikasi
- [ ] Transaksi kunci ditest
- [ ] Report divalidasi
- [ ] Performa dapat diterima
- [ ] Notifikasi deployment dikirim ke user
- [ ] Dokumentasi diupdate
- [ ] Permintaan perubahan ditutup

---

**Dokumen ini adalah properti Departemen IT Upstream Development dan bersifat rahasia. Distribusi harus mendapat persetujuan dari IT Development Manager.**
