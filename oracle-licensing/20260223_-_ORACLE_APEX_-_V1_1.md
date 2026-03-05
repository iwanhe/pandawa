# ORACLE APEX — NO COST FEATURE

*pada Oracle Database Free (23c/23ai) & Oracle Database XE (21c)*

**Versi APEX 24.2** | Oracle E-Business Suite (EBS) 12.2 | February 2026 | Created by: Iwan Herdian

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

## 2. Oracle Database Free (23c/23ai) vs Enterprise — APEX Tersedia di Keduanya

Oracle Database Free merupakan penerus langsung Oracle Database XE, dengan kebijakan lisensi yang sama yaitu ***free use* tanpa biaya untuk penggunaan production** ([sumber](https://blogs.oracle.com/database/apex-ords-futc)). Perbandingan kedua edisi ini penting untuk memahami bahwa APEX tersedia di keduanya tanpa biaya tambahan, dengan perbedaan hanya pada resource teknis database yang menjalankannya.

**Sumber:** [Oracle APEX Getting Started](https://apex.oracle.com/en/learn/getting-started/)

Oracle Technology Network (OTN) License Agreement mengizinkan penggunaan Oracle Database Free untuk ***'internal business operations'***, yang mencakup penggunaan ***non-revenue generating*** seperti internal tools, dashboard operasional, atau form proses internal. Dengan demikian, pada skenario penggunaan tersebut, tidak diperlukan lisensi database tambahan di luar edisi Free/XE.

Namun untuk kepastian hukum pada implementasi yang lebih kompleks, organisasi disarankan mengkonfirmasi interpretasi ini langsung dengan Oracle atau mengacu pada Oracle License Management Services (LMS). (**Sumber:** [Oracle Distribution License](https://www.oracle.com/downloads/licenses/distribution-license.html))

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

**Tambahan informasi dari analisis perbandingan dari NCS London:**

a. Oracle 23ai Free membatasi resource pada 2 CPU, 2 GB RAM, dan 12 GB user data storage. Meski tampak terbatas, pengujian internal menunjukkan DB Free masih dapat menangani beban kerja yang signifikan dalam batasan resource tersebut, menjadikannya layak untuk skenario penggunaan internal dengan skala moderat.

b. Baik Oracle 23ai Free maupun Enterprise Edition menyertakan kemampuan AI Vector Search, Machine Learning, Spatial, dan Graph tanpa biaya tambahan. Fitur-fitur ini dapat digunakan untuk pengembangan dan pengujian analytics bahkan dalam batasan edisi Free.

c. Artinya, Oracle Database Free bukan sekadar versi "terpotong" — fitur-fitur utama termasuk APEX tetap tersedia penuh, hanya dibatasi dari sisi kapasitas resource teknis, bukan dari sisi lisensi fitur.

---

## 3. Oracle APEX sebagai Platform Resmi Ekstensi Oracle EBS

Bagi organisasi yang saat ini sudah menggunakan Oracle E-Business Suite (EBS), adopsi Oracle APEX bukan sekadar diperbolehkan secara lisensi — Oracle sendiri secara resmi menetapkan APEX sebagai platform utama (preferred platform) untuk pengembangan ekstensi EBS.

> ***"Oracle APEX has become the preferred platform for implementing Oracle E-Business Suite (EBS) extensions."***
>
> — Santiago Bastidas, Product Management Director, Oracle (November 21, 2024)

### Kemampuan Integrasi APEX dengan EBS 12.2

| **Kapabilitas Integrasi** | **Deskripsi** |
|---|---|
| EBS Online Patching Support | Skema APEX diaktifkan untuk mendukung EBS 12.2 Online Patching tanpa downtime |
| Embed APEX di EBS | Ekstensi APEX dapat di-embed langsung ke dalam interface EBS |
| Launch dari Forms Navigator | Fungsi APEX dapat diluncurkan langsung dari Forms Navigator EBS |
| Koordinasi Manajemen Sesi | Sesi antara APEX dan EBS terkoordinasi secara seamless |
| Single Sign-On | Autentikasi terintegrasi antara EBS dan APEX |
| Prerequisites | EBS 12.2.7+, Oracle Database 19c+, APEX 24.1+ *(Konteks disesuaikan dengan Oracle EBS yang digunakan di organisasi dan sudah digunakan, lisensi terpisah untuk product Oracle EBS tetap diperlukan)* |

### Arsitektur Deployment APEX dalam konteks EBS

Terdapat dua pendekatan deployment yang perlu dibedakan:

1. **Skenario A** — APEX di database terpisah (DB Free/XE): APEX di-install pada instance Oracle Database Free atau XE yang berdiri sendiri dan terpisah dari database EBS.

   > Integrasi dengan EBS dilakukan melalui REST API atau koneksi database link. Pada skenario ini, APEX berjalan sepenuhnya no-cost.

2. **Skenario B** — APEX di database EBS yang sama (DB 19c+): APEX di-install langsung pada database yang sama dengan EBS (19c+).

   > Pada skenario ini, lisensi database sudah mencakup APEX tanpa biaya tambahan karena APEX adalah fitur bawaan Oracle Database, namun biaya lisensi database 19c tetap berlaku.

Dalam kedua skenario, APEX sendiri tidak memerlukan biaya lisensi tambahan di luar lisensi database yang sudah ada.

**Sumber:**
- [Oracle EBS Tech Blog — Enhanced Integration with EBS 12.2 and APEX](https://blogs.oracle.com/ebstech/enhanced-integration-with-ebs-122-and-apex-now-available)
- [Oracle APEX EBS Extension Technical Paper (PDF)](https://www.oracle.com/a/otn/docs/apex_ebs_extension_technical_paper.pdf)

---

## 4. Pembuktian Teknis via Query Database

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
-- (tidak memerlukan lisensi option terpisah seperti Partitioning, RAC, dll)
SELECT NAME, DETECTED_USAGES
FROM DBA_FEATURE_USAGE_STATISTICS
WHERE NAME LIKE '%Application Express%';

-- Catatan: APEX tidak termasuk dalam Oracle Database Options
-- yang memerlukan biaya lisensi tambahan.
```

Kemunculan APEX dalam `DBA_FEATURE_USAGE_STATISTICS` dengan `DETECTED_USAGES > 0` semata-mata menunjukkan bahwa fitur tersebut aktif digunakan — bukan indikasi kewajiban lisensi tambahan. Kewajiban lisensi tambahan **hanya berlaku** untuk fitur yang secara eksplisit tercantum sebagai **'extra cost option'** dalam Oracle Database Licensing Information, dan APEX tidak termasuk dalam daftar tersebut.

APEX tidak tercantum sebagai ***"extra cost option"*** dalam Licensing Information Oracle ([lihat Table 1-15](https://docs.oracle.com/en/database/oracle/oracle-database/26/dblic/Licensing-Information.html)), sehingga tidak memerlukan lisensi terpisah.

### Query 4: Cek Versi Oracle Database (Free/XE/Enterprise)

```sql
-- Konfirmasi versi database yang sedang berjalan
SELECT BANNER, BANNER_FULL
FROM V$VERSION;

-- Untuk DB Free/23ai output akan menampilkan:
-- Oracle Database 23ai Free Release 23.0.0.0.0

-- Untuk DB XE/21c output akan menampilkan:
-- Oracle Database 21c Express Edition Release 21.0.0.0.0
```

---

## 5. Jawaban Oracle Support

**SR: 4-0002135490**

*(Lihat screenshot jawaban Oracle Support dalam dokumen asli)*

---

## 6. Ringkasan Pembuktian No-Cost Feature

| **Aspek Pembuktian** | **Fakta** | **Sumber** |
|---|---|---|
| Lisensi APEX 24.2 | No commercial software — tidak ada biaya lisensi | [Oracle Docs AELIM 24.2 (PDF)](https://docs.oracle.com/en/database/oracle/apex/24.2/aelim/oracle-apex-licensing-information-user-manual.pdf) |
| Oracle DB Free (23c/23ai) | APEX termasuk penuh, gratis untuk produksi | [NCS London Analysis](https://www.ncs-london.com/blog/oracle-23ai-free-vs-enterprise-which-version-is-right-for-your-business/) |
| Oracle DB XE (21c) | APEX termasuk penuh, gratis untuk produksi | [Oracle Official](https://www.oracle.com/database/technologies/appdev/xe.html) |
| Biaya per User | Tidak ada (unlimited users) | [Oracle APEX Licensing (PDF)](https://docs.oracle.com/en/database/oracle/apex/24.2/aelim/oracle-apex-licensing-information-user-manual.pdf) |
| Biaya per Aplikasi | Tidak ada (unlimited apps) | [Oracle APEX Licensing (PDF)](https://docs.oracle.com/en/database/oracle/apex/24.2/aelim/oracle-apex-licensing-information-user-manual.pdf) |
| Kompatibilitas EBS 12.2 | Resmi didukung & preferred platform ekstensi | [Oracle EBS Tech Blog (PDF)](https://www.oracle.com/a/otn/docs/apex_ebs_extension_technical_paper.pdf) |
| ORDS (Web Server APEX) | No-cost, termasuk dalam lisensi database | [Oracle DB Free](https://www.oracle.com/database/free/) |
| Batasan pada Free/XE | Hanya resource teknis (CPU/RAM/Storage) | [NCS London Analysis](https://www.ncs-london.com/blog/oracle-23ai-free-vs-enterprise-which-version-is-right-for-your-business/) |
| Batasan use-case DB Free/XE | Internal business operations; bukan SaaS/revenue-generating langsung | [Oracle OTN License Agreement](https://www.oracle.com/downloads/licenses/distribution-license.html) |

---

> **Oracle APEX 24.2 adalah no-cost feature yang sah dan resmi — tidak ada biaya lisensi APEX, tidak ada biaya per-user, dan tidak ada biaya per-aplikasi, pada seluruh edisi Oracle Database termasuk Free dan XE.**
>
> **Bagi organisasi yang sudah menggunakan Oracle E-Business Suite (EBS), APEX adalah platform yang secara resmi direkomendasikan Oracle untuk pengembangan ekstensi EBS.**
>
> **Penggunaan APEX di atas Oracle Database Free atau XE sesuai dengan ketentuan Oracle OTN License Agreement untuk keperluan internal business operations, sementara pada database EBS yang berlisensi penuh, APEX tetap tidak memerlukan biaya lisensi tambahan apapun.**
>
> **Dengan demikian, dalam kedua skenario deployment, APEX memberikan nilai strategis tanpa pengeluaran lisensi tambahan untuk platform APEX itu sendiri.**
