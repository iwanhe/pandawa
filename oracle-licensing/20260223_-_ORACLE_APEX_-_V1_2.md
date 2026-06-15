# ORACLE APEX — NO COST FEATURE

*pada Oracle Database Free (23c/23ai) & Oracle Database XE (21c)*

**Versi APEX 24.2** | Oracle E-Business Suite (EBS) 12.2 | February 2026 | Created by: Iwan Herdian

> **Audiens Dokumen:** Dokumen ini ditujukan untuk **manajemen non-teknis, tim legal/compliance, dan IT leadership** di lingkungan Nojorono Group / KCSI yang memerlukan pemahaman menyeluruh tentang posisi lisensi Oracle APEX sebelum membuat keputusan adopsi atau deployment.

> **⚠️ Disclaimer Penting:** Dokumen ini merupakan analisa teknis berdasarkan dokumentasi publik Oracle. Untuk kepastian hukum — terutama pada implementasi yang menyentuh proses bisnis berskala besar — organisasi **wajib mendapatkan konfirmasi tertulis dari Oracle** melalui Oracle License Management Services (LMS) atau Oracle Sales Representative, dengan menyertakan deskripsi use case spesifik organisasi.

---

## Daftar Isi

1. [Tidak Ada Commercial Software dalam Oracle APEX 24.2](#1-tidak-ada-commercial-software-dalam-oracle-apex-242)
2. [Oracle Database Free vs Enterprise — APEX Tersedia di Keduanya](#2-oracle-database-free-vs-enterprise--apex-tersedia-di-keduanya)
3. [Batasan "Internal Business Operations" — Apa yang Perlu Diperhatikan](#3-batasan-internal-business-operations--apa-yang-perlu-diperhatikan)
4. [Oracle APEX sebagai Platform Resmi Ekstensi Oracle EBS](#4-oracle-apex-sebagai-platform-resmi-ekstensi-oracle-ebs)
5. [Pembuktian Teknis via Query Database](#5-pembuktian-teknis-via-query-database)
6. [Jawaban Oracle Support](#6-jawaban-oracle-support)
7. [Kapan Harus Upgrade dari DB Free ke Enterprise?](#7-kapan-harus-upgrade-dari-db-free-ke-enterprise)
8. [Opsi Deployment Tambahan — OCI Always Free](#8-opsi-deployment-tambahan--oci-always-free)
9. [Ringkasan Pembuktian No-Cost Feature](#9-ringkasan-pembuktian-no-cost-feature)

---

## 1. Tidak Ada Commercial Software dalam Oracle APEX 24.2

Pembuktian paling langsung dan otoritatif bahwa Oracle APEX adalah no-cost feature berasal dari dokumentasi resmi **Oracle APEX 24.2 Licensing Information User Manual**, yang secara eksplisit menyatakan:

> ***"There is no commercial software included in Oracle APEX 24.2."***

Pernyataan ini secara spesifik merujuk pada komponen third-party yang digunakan dalam membangun APEX 24.2, sebagaimana tercantum dalam halaman *Licensing Information for Third-Party Components.* Adapun status APEX sebagai *no-cost feature* dari Oracle Database dikonfirmasi secara terpisah melalui halaman resmi Oracle APEX *(oracle.com/tools/apex)* yang menyatakan bahwa APEX tersedia tanpa biaya tambahan pada semua edisi Oracle Database.

**Sumber:**
- [Oracle APEX 24.2 Licensing Information User Manual (HTML)](https://docs.oracle.com/en/database/oracle/apex/24.2/aelim/third-party.html)
- [Oracle APEX 24.2 Licensing Information User Manual (PDF)](https://docs.oracle.com/en/database/oracle/apex/24.2/aelim/oracle-apex-licensing-information-user-manual.pdf)
- [Oracle APEX Official Page](https://www.oracle.com/tools/apex/)

---

## 2. Oracle Database Free vs Enterprise — APEX Tersedia di Keduanya

Oracle Database Free merupakan penerus langsung Oracle Database XE, dengan kebijakan lisensi yang sama yaitu ***free use* tanpa biaya untuk penggunaan production** ([sumber](https://blogs.oracle.com/database/apex-ords-futc)). Perbandingan kedua edisi ini penting untuk memahami bahwa APEX tersedia di keduanya tanpa biaya tambahan, dengan perbedaan hanya pada resource teknis database yang menjalankannya.

**Sumber:** [Oracle APEX Getting Started](https://apex.oracle.com/en/learn/getting-started/)

### Perbandingan Oracle Database Free, XE, dan Enterprise

| **Batasan / Fitur** | **Oracle DB XE (21c)** | **Oracle DB Free (23c/23ai)** | **Oracle DB Enterprise** |
|---|---|---|---|
| CPU (Foreground) | 2 threads | 2 threads | Tidak terbatas |
| RAM (SGA + PGA) | 2 GB | 2 GB | Tidak terbatas |
| User Data Storage | 12 GB | 12 GB | Tidak terbatas |
| Pluggable Database (PDB) | 3 PDB | 3 PDB | Tidak terbatas |
| Oracle APEX | ✓ Termasuk, Gratis | ✓ Termasuk, Gratis | ✓ Termasuk, Gratis |
| Oracle ORDS | ✓ Gratis | ✓ Gratis | ✓ Gratis |
| AI Vector Search | ✓ Gratis | ✓ Gratis | ✓ Gratis |
| Machine Learning | ✓ Gratis | ✓ Gratis | ✓ Gratis |
| Real Application Clusters (RAC) | ✗ Tidak tersedia | ✗ Tidak tersedia | ✓ Tersedia (berbayar) |
| Active Data Guard | ✗ Tidak tersedia | ✗ Tidak tersedia | ✓ Tersedia (berbayar) |
| Oracle Support Resmi | ✗ Community only | ✗ Community only | ✓ Full Support |
| Penggunaan Produksi | ✓ Diperbolehkan | ✓ Diperbolehkan | ✓ Diperbolehkan |
| Biaya Lisensi Database | Gratis | Gratis | ~£47,500 per prosesor |

> **Catatan penting:** Batasan pada Oracle DB Free dan XE bersifat teknis (resource infrastruktur), **bukan batasan lisensi APEX**. Seluruh fungsionalitas APEX tetap tersedia penuh pada kedua edisi tersebut.

**Sumber:**
- [Oracle DB XE](https://www.oracle.com/database/technologies/appdev/xe.html)
- [Oracle DB Free](https://www.oracle.com/database/free/)
- [NCS London — Oracle 23ai Free vs Enterprise](https://www.ncs-london.com/blog/oracle-23ai-free-vs-enterprise-which-version-is-right-for-your-business/)

---

## 3. Batasan "Internal Business Operations" — Apa yang Perlu Diperhatikan

> ⚠️ **Ini adalah bagian paling kritis dari dokumen ini dari perspektif compliance.**

Oracle Technology Network (OTN) License Agreement mengizinkan penggunaan Oracle Database Free untuk ***'internal business operations'***, yang mencakup penggunaan ***non-revenue generating*** seperti internal tools, dashboard operasional, atau form proses internal. **Namun frasa "internal business operations" tidak didefinisikan secara eksplisit oleh Oracle.**

### Interpretasi yang Aman vs Berisiko

| **Skenario** | **Status** | **Keterangan** |
|---|---|---|
| Internal dashboard operasional | ✅ Aman | Non-revenue generating, internal users |
| Form proses approval internal | ✅ Aman | Tidak ada transaksi langsung ke pelanggan eksternal |
| Sistem procurement internal (opkoper/petani) | ⚠️ Perlu konfirmasi | Menyentuh rantai nilai bisnis — disarankan konfirmasi ke Oracle LMS |
| Sistem yang diakses oleh pelanggan/mitra eksternal | ❌ Berisiko | Kemungkinan bukan "internal business operations" |
| SaaS / revenue-generating langsung | ❌ Tidak diizinkan | Di luar scope OTN License |

### Rekomendasi Tindakan

Untuk use case yang berada di zona abu-abu (sistem yang memengaruhi proses bisnis inti), organisasi disarankan untuk:

1. **Mendokumentasikan use case secara spesifik** — deskripsi sistem, jumlah user, jenis transaksi
2. **Mengirimkan pertanyaan tertulis ke Oracle** melalui Oracle LMS atau Oracle Sales Representative
3. **Menyimpan jawaban Oracle secara tertulis** sebagai bukti compliance

Lihat Section 6 untuk bukti Oracle Support yang telah diperoleh.

**Sumber:** [Oracle Distribution License](https://www.oracle.com/downloads/licenses/distribution-license.html)

---

## 4. Oracle APEX sebagai Platform Resmi Ekstensi Oracle EBS

> **Catatan penting:** Lisensi Oracle E-Business Suite (EBS) adalah terpisah dan tetap diperlukan secara independen. Adopsi APEX untuk ekstensi EBS **tidak mengurangi atau menggantikan kewajiban lisensi EBS yang sudah ada.** Bagian ini hanya membahas posisi APEX dalam ekosistem EBS dari perspektif lisensi platform APEX itu sendiri.

Bagi organisasi yang saat ini sudah menggunakan Oracle EBS, adopsi Oracle APEX bukan sekadar diperbolehkan secara lisensi — Oracle sendiri secara resmi menetapkan APEX sebagai platform utama (preferred platform) untuk pengembangan ekstensi EBS.

> ***"Oracle APEX has become the preferred platform for implementing Oracle E-Business Suite (EBS) extensions."***
>
> — Santiago Bastidas, Product Management Director, Oracle (November 21, 2024)

*Catatan: Pernyataan di atas adalah posisi product management Oracle, bukan legal licensing statement. Konfirmasi lisensi formal tetap harus melalui Oracle LMS.*

### Kemampuan Integrasi APEX dengan EBS 12.2

| **Kapabilitas Integrasi** | **Deskripsi** |
|---|---|
| EBS Online Patching Support | Skema APEX diaktifkan untuk mendukung EBS 12.2 Online Patching tanpa downtime |
| Embed APEX di EBS | Ekstensi APEX dapat di-embed langsung ke dalam interface EBS |
| Launch dari Forms Navigator | Fungsi APEX dapat diluncurkan langsung dari Forms Navigator EBS |
| Koordinasi Manajemen Sesi | Sesi antara APEX dan EBS terkoordinasi secara seamless |
| Single Sign-On | Autentikasi terintegrasi antara EBS dan APEX |
| Prerequisites | EBS 12.2.7+, Oracle Database 19c+, APEX 24.1+ |

### Arsitektur Deployment APEX dalam Konteks EBS

Terdapat dua pendekatan deployment yang perlu dibedakan:

**Skenario A — APEX di database terpisah (DB Free/XE):**
APEX di-install pada instance Oracle Database Free atau XE yang berdiri sendiri dan terpisah dari database EBS. Integrasi dengan EBS dilakukan melalui REST API atau koneksi database link. Pada skenario ini, APEX berjalan sepenuhnya no-cost.

**Skenario B — APEX di database EBS yang sama (DB 19c+):**
APEX di-install langsung pada database yang sama dengan EBS (19c+). Pada skenario ini, lisensi database sudah mencakup APEX tanpa biaya tambahan karena APEX adalah fitur bawaan Oracle Database, namun biaya lisensi database 19c Enterprise tetap berlaku.

Dalam kedua skenario, APEX sendiri tidak memerlukan biaya lisensi tambahan di luar lisensi database yang sudah ada.

**Sumber:**
- [Oracle EBS Tech Blog — Enhanced Integration with EBS 12.2 and APEX](https://blogs.oracle.com/ebstech/enhanced-integration-with-ebs-122-and-apex-now-available)
- [Oracle APEX EBS Extension Technical Paper (PDF)](https://www.oracle.com/a/otn/docs/apex_ebs_extension_technical_paper.pdf)

---

## 5. Pembuktian Teknis via Query Database

Selain bukti lisensi dan dokumentasi resmi, pembuktian dapat dilakukan langsung melalui query pada database. APEX yang terdaftar dalam `DBA_REGISTRY` mengkonfirmasi bahwa APEX adalah komponen bawaan database, bukan produk terinstall terpisah yang memerlukan lisensi tambahan.

### Query 1: Verifikasi APEX sebagai Komponen Bawaan Database

```sql
-- Cek APEX terdaftar sebagai komponen database bawaan
SELECT COMP_NAME, VERSION, STATUS
FROM DBA_REGISTRY
WHERE COMP_NAME LIKE '%APEX%';

-- Output yang diharapkan:
-- COMP_NAME        VERSION       STATUS
-- Oracle APEX      24.2.x.x      VALID
```

### Query 2: Cek Versi dan Build Date APEX

```sql
-- Cek versi APEX yang aktif beserta tanggal build
SELECT VERSION_NO, BUILD_DATE
FROM APEX_RELEASE;

-- Output yang diharapkan:
-- VERSION_NO    BUILD_DATE
-- 24.2.x.x      DD-MON-YYYY
```

### Query 3: Konfirmasi APEX Bukan Lisensi Option Berbayar

```sql
-- Cek APEX tidak muncul sebagai Database Option berbayar
SELECT NAME, DETECTED_USAGES
FROM DBA_FEATURE_USAGE_STATISTICS
WHERE NAME LIKE '%Application Express%';
```

Kemunculan APEX dalam `DBA_FEATURE_USAGE_STATISTICS` dengan `DETECTED_USAGES > 0` semata-mata menunjukkan bahwa fitur tersebut aktif digunakan — bukan indikasi kewajiban lisensi tambahan. Kewajiban lisensi tambahan **hanya berlaku** untuk fitur yang secara eksplisit tercantum sebagai **'extra cost option'** dalam Oracle Database Licensing Information, dan APEX tidak termasuk dalam daftar tersebut.

APEX tidak tercantum sebagai ***"extra cost option"*** dalam Licensing Information Oracle ([lihat Table 1-15](https://docs.oracle.com/en/database/oracle/oracle-database/26/dblic/Licensing-Information.html)).

### Query 4: Cek Versi Oracle Database (Free/XE/Enterprise)

```sql
-- Konfirmasi versi database yang sedang berjalan
SELECT BANNER, BANNER_FULL
FROM V$VERSION;
```

---

## 6. Jawaban Oracle Support

**SR: 4-0002135490**

Oracle Support telah memberikan konfirmasi tertulis melalui Service Request di atas mengenai status APEX sebagai no-cost feature pada Oracle Database Free/XE untuk keperluan internal business operations.

> ⚠️ **[ACTION REQUIRED — Pemilik Dokumen]:** Lampirkan screenshot atau teks lengkap jawaban Oracle Support SR 4-0002135490 pada bagian ini sebelum dokumen ini didistribusikan ke manajemen atau tim legal. Tanpa bukti konkret dari Oracle Support, bagian ini tidak dapat digunakan sebagai dasar keputusan compliance.

Jawaban Oracle Support merupakan **bukti terkuat** dalam dokumen ini karena merupakan pernyataan resmi Oracle yang spesifik untuk konteks organisasi, bukan interpretasi atas dokumentasi publik.

---

## 7. Kapan Harus Upgrade dari DB Free ke Enterprise?

> **Ini adalah keputusan strategis yang perlu dibuat secara sadar — bukan sekadar keputusan teknis.**

Oracle Database Free memberikan nilai yang sangat signifikan untuk workload internal skala moderat. Namun ada threshold konkret di mana upgrade ke Enterprise menjadi justifikasi yang tepat.

### Threshold Upgrade — Decision Matrix

| **Dimensi** | **Tetap di DB Free** | **Pertimbangkan Enterprise** | **Wajib Enterprise** |
|---|---|---|---|
| **Concurrent Users** | < 50 user aktif | 50–200 user aktif | > 200 user aktif atau SLA ketat |
| **Data Volume** | < 8 GB user data | 8–10 GB | Mendekati 12 GB ceiling |
| **Memory (SGA+PGA)** | Workload stabil < 1.5 GB | Sering mendekati 2 GB | ORA-04031 terjadi berulang¹ |
| **Availability** | Downtime acceptable | RTO < 4 jam | RTO < 1 jam / zero downtime |
| **Disaster Recovery** | Backup manual cukup | — | Active Data Guard diperlukan |
| **Oracle Support** | Community support cukup | — | Patch security kritis diperlukan |
| **Skala Organisasi** | Pilot / subsidiary kecil | Subsidiary menengah | Group-wide / multi-entity |

> ¹ *ORA-04031 (shared pool exhaustion) pernah terjadi pada instance Oracle DB Free 23ai dengan workload APEX aktif. Ini adalah sinyal konkret bahwa batasan 2 GB RAM sudah tidak memadai untuk workload tersebut.*

### Estimasi Biaya Upgrade

| **Opsi** | **Estimasi Biaya** | **Keterangan** |
|---|---|---|
| Oracle DB Enterprise (on-premise) | ~£47,500/prosesor/tahun | Full Enterprise features |
| Oracle DB Standard Edition 2 | ~£17,500/prosesor/tahun | Tanpa RAC, lebih terjangkau |
| Oracle Cloud (OCI DBCS/ADB) | Variabel — PAYG | Lihat Section 8 |
| Tetap di DB Free | Rp 0 | Dengan batasan resource & support |

### Rekomendasi untuk KCSI / Nojorono Group

Berdasarkan karakteristik workload saat ini:

- **Sistem dengan < 50 concurrent users, data < 8 GB, tanpa SLA ketat** → DB Free tetap appropriate
- **Sistem yang sudah pernah mengalami ORA-04031 atau mendekati batas memory** → Evaluasi upgrade segera
- **Sistem yang akan digunakan group-wide (multi-subsidiary)** → Rencanakan Enterprise dari awal

---

## 8. Opsi Deployment Tambahan — OCI Always Free

Selain deployment on-premise menggunakan Oracle Database Free, tersedia opsi **Oracle Cloud Infrastructure (OCI) Always Free tier** yang menyediakan:

| **Komponen** | **OCI Always Free** |
|---|---|
| Autonomous Database | 2 database, 20 GB storage each |
| Oracle APEX | ✓ Termasuk penuh |
| ORDS | ✓ Termasuk |
| Compute | 2x AMD VM (1 OCPU, 1 GB RAM) atau ARM VM |
| Biaya | Rp 0 (selamanya, bukan trial) |

**Kelebihan OCI Always Free dibanding DB Free on-premise:**
- Managed service — tidak perlu maintenance OS/database
- High availability built-in
- Tersedia Oracle Support untuk infrastruktur cloud
- Cocok untuk workload dengan volume data kecil namun memerlukan reliabilitas tinggi

**Batasan:**
- Tetap ada batasan resource (20 GB storage per database)
- Memerlukan koneksi internet dari end-user
- Data residency di OCI region (pertimbangkan regulasi data jika relevan)

**Sumber:** [OCI Always Free](https://www.oracle.com/cloud/free/)

---

## 9. Ringkasan Pembuktian No-Cost Feature

| **Aspek Pembuktian** | **Fakta** | **Sumber** |
|---|---|---|
| Lisensi APEX 24.2 | No commercial software — tidak ada biaya lisensi | [Oracle Docs AELIM 24.2 (PDF)](https://docs.oracle.com/en/database/oracle/apex/24.2/aelim/oracle-apex-licensing-information-user-manual.pdf) |
| Oracle DB Free (23c/23ai) | APEX termasuk penuh, gratis untuk produksi | [NCS London Analysis](https://www.ncs-london.com/blog/oracle-23ai-free-vs-enterprise-which-version-is-right-for-your-business/) |
| Oracle DB XE (21c) | APEX termasuk penuh, gratis untuk produksi | [Oracle Official](https://www.oracle.com/database/technologies/appdev/xe.html) |
| Biaya per User | Tidak ada (unlimited users) | [Oracle APEX Licensing (PDF)](https://docs.oracle.com/en/database/oracle/apex/24.2/aelim/oracle-apex-licensing-information-user-manual.pdf) |
| Biaya per Aplikasi | Tidak ada (unlimited apps) | [Oracle APEX Licensing (PDF)](https://docs.oracle.com/en/database/oracle/apex/24.2/aelim/oracle-apex-licensing-information-user-manual.pdf) |
| Kompatibilitas EBS 12.2 | Resmi didukung & preferred platform ekstensi | [Oracle EBS Tech Blog (PDF)](https://www.oracle.com/a/otn/docs/apex_ebs_extension_technical_paper.pdf) |
| ORDS (Web Server APEX) | No-cost, termasuk dalam lisensi database | [Oracle DB Free](https://www.oracle.com/database/free/) |
| Batasan pada Free/XE | Hanya resource teknis (CPU/RAM/Storage), bukan fitur | [NCS London Analysis](https://www.ncs-london.com/blog/oracle-23ai-free-vs-enterprise-which-version-is-right-for-your-business/) |
| Batasan use-case DB Free/XE | Internal business operations; bukan SaaS/revenue-generating langsung | [Oracle OTN License Agreement](https://www.oracle.com/downloads/licenses/distribution-license.html) |
| Oracle Support Confirmation | SR 4-0002135490 *(lampiran diperlukan — lihat Section 6)* | Oracle Support |

---

## Kesimpulan Eksekutif

> **Oracle APEX 24.2 adalah no-cost feature yang sah dan resmi — tidak ada biaya lisensi APEX, tidak ada biaya per-user, dan tidak ada biaya per-aplikasi, pada seluruh edisi Oracle Database termasuk Free dan XE.**
>
> **Bagi organisasi yang sudah menggunakan Oracle EBS, APEX adalah platform yang secara resmi direkomendasikan Oracle untuk pengembangan ekstensi EBS — dengan tetap mempertahankan kewajiban lisensi EBS yang sudah ada.**
>
> **Penggunaan APEX di atas Oracle Database Free atau XE sesuai dengan ketentuan Oracle OTN License Agreement untuk keperluan internal business operations. Untuk use case yang menyentuh proses bisnis inti atau berada di zona abu-abu, konfirmasi tertulis dari Oracle LMS sangat disarankan.**
>
> **Ketika workload berkembang melampaui threshold resource DB Free (RAM, storage, availability), upgrade ke Enterprise atau migrasi ke OCI adalah langkah berikutnya yang perlu direncanakan secara proaktif.**

---

*Dokumen ini dibuat untuk keperluan internal KCSI / Tim PANDAWA. Versi: 1.2 | Last Updated: February 2026*
*Perbaikan v1.2: Penambahan audiens dokumen, disclaimer compliance, klarifikasi "internal business operations", decision framework upgrade, opsi OCI Always Free, dan penegasan status SR Oracle Support.*
