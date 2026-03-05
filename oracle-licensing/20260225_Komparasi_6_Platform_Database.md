# KOMPARASI PLATFORM DATABASE
## Oracle Database vs Microsoft SQL Server

*6 Edisi | Lisensi | Fitur | Biaya | Storage Management*

> **February 2026** | Kurs USD/IDR Rp 16.300 | Server 2-socket / 32-core

---

## 1. Overview 6 Platform Database

Dokumen ini membandingkan enam platform database yang umum digunakan oleh organisasi, mencakup tiga edisi Oracle Database dan tiga edisi Microsoft SQL Server. Perbandingan mencakup dimensi lisensi, biaya total kepemilikan, batasan teknis, fitur enterprise, dan posisi strategis masing-masing platform.

| Platform | Edisi | Biaya Lisensi | Storage Limit | APEX | Segmen |
|---|---|---|---|---|---|
| **Oracle Database** | Free / XE | $0 | 12 GB total | ✓ Gratis | Dev / Internal |
| **Oracle Database** | SE2 | $17,500/skt | Tidak ada batas | ✓ Gratis | SMB |
| **Oracle Database** | Enterprise | $47,500/proc | Tidak ada batas | ✓ Gratis | Mission-critical |
| **SQL Server** | Express | $0 | 10 GB/database | ✗ | Dev / Desktop |
| **SQL Server** | Standard | $3,945/2core | Tidak ada batas | ✗ | SMB |
| **SQL Server** | Enterprise | $15,123/2core | Tidak ada batas | ✗ | Mission-critical |

> *Sumber: Oracle Price List 2024, Microsoft SQL Server 2022 Official Pricing, Oracle Technology Network License Agreement*

---

## 2. Detail Model & Biaya Lisensi

### 2.1 Oracle Database — Model Lisensi

| Edisi | Model | Harga per Unit | Minimum per Server |
|---|---|---|---|
| **Free / XE** | — | $0 | $0 (tidak ada min.) |
| **SE2** | Per Socket | $17,500 / socket | $3,500 (10 NUP) |
| **SE2** | Named User Plus | $350 / NUP | Min. 10 NUP / server |
| **Enterprise** | Per Processor | $47,500 / processor | $23,750 (25 NUP × 1 proc) |
| **Enterprise** | Named User Plus | $950 / NUP | Min. 25 NUP / processor |

> *SE2 dibatasi maksimum 2 socket per server dan 16 thread total sejak Oracle 19c*

### 2.2 Microsoft SQL Server — Model Lisensi

| Edisi | Model | Harga per Unit | Minimum per Server |
|---|---|---|---|
| **Express** | — | $0 | $0 |
| **Standard** | Per Core (2-core pack) | $3,945 / 2-core | $989 (4 core min.) |
| **Standard** | Server + CAL | $1,418 / server | + $230 / CAL per user |
| **Enterprise** | Per Core (2-core pack) | $15,123 / 2-core | $60,492 (8 core min.) |

> *Enterprise hanya tersedia model Per Core — tidak ada opsi Server+CAL*  
> *Kenaikan harga 10% SQL Server diberlakukan Microsoft sejak Januari 2023*

---

## 3. Estimasi Biaya dalam Rupiah

Skenario: server fisik 2-socket, 16-core per socket (32-core total). Kurs USD/IDR Rp 16.300. Biaya Oracle EE tanpa opsi tambahan.

| Komponen | Oracle Free/XE | Oracle SE2 | Oracle EE | SQL Express | SQL Standard | SQL Enterprise |
|---|---|---|---|---|---|---|
| **Lisensi Awal** | Rp 0 | Rp 571 juta | Rp 12,4 miliar | Rp 0 | Rp 771 juta | Rp 3,9 miliar |
| **Support Tahun 1** | Rp 0 | Rp 126 juta | Rp 2,7 miliar | Rp 0 | Rp 193 juta | Rp 987 juta |
| **Total Tahun 1** | Rp 0 | Rp 697 juta | Rp 15,1 miliar | Rp 0 | Rp 964 juta | Rp 4,9 miliar |
| **Total 3 Tahun** | Rp 0 | Rp 949 juta | Rp 20,6 miliar | Rp 0 | Rp 1,35 miliar | Rp 6,9 miliar |

---

## 4. Perbandingan Dua Platform Gratis

| Aspek | Oracle DB Free / XE | SQL Server Express 2022 |
|---|---|---|
| **Batas Storage** | 12 GB (agregat semua schema) | 10 GB per database |
| **Workaround Storage** | Tidak dapat di-bypass | Bisa multi-database (workaround) |
| **Batas RAM** | 2 GB per instance | 1 GB per instance |
| **Batas CPU** | 2 threads | 1 processor / 4 core |
| **Scheduler / Job** | ✓ DBMS_Scheduler (built-in) | ✗ Harus Windows Task Scheduler |
| **Low-Code Platform** | ✓ Oracle APEX (full featured) | ✗ Tidak ada |
| **Kompatibilitas EBS** | ✓ Officially supported Oracle | ✗ Tidak relevan |
| **Upgrade Path** | Oracle SE2 → Oracle EE | SQL Standard → SQL Enterprise |
| **Annual Support** | $0 (Community) | $0 (Community) |
| **Cocok Untuk** | Internal tools, PoC, EBS extensions | Dev, desktop apps, small projects |

---

## 5. Tabel Komparasi Lengkap 6 Platform

| Parameter | Oracle DB Free/XE | Oracle DB SE2 | Oracle DB Enterprise | SQL Server Express | SQL Server Standard | SQL Server Enterprise |
|---|---|---|---|---|---|---|
| **Biaya Lisensi** | $0 | $17,500/socket | $47,500/processor | $0 | $3,945/2-core | $15,123/2-core |
| **Biaya Per User** | $0 (unlimited) | $350/NUP | $950/NUP | $0 (unlimited) | $230/CAL | $0 (per core) |
| **Min. Biaya/Server** | $0 | $3,500 | $23,750 | $0 | $989 | $60,492 |
| **Biaya 2-socket/32-core** | $0 | $35,000 | $760,000 | $0 | $47,340 | $241,968 |
| **Annual Support/SA** | $0 | ~22%/thn | ~22%/thn | $0 | ~25%/thn | ~25%/thn |
| **Total 3 Tahun** | $0 | ~$58,100 | ~$1,261,600 | $0 | ~$82,845 | ~$422,976 |
| **Batas Storage** | 12 GB total | Tidak ada batas | Tidak ada batas | 10 GB/database | Tidak ada batas | Tidak ada batas |
| **Batas RAM** | 2 GB | Tidak ada batas | Tidak ada batas | 1 GB/instance | 128 GB buffer | Tidak ada batas |
| **Batas CPU** | 2 threads | 2 socket/16 thread | Tidak ada batas | 1 proc/4 core | 24 core/4 socket | Tidak ada batas |
| **Oracle APEX** | ✓ Gratis | ✓ Gratis | ✓ Gratis | ✗ Tidak ada | ✗ Tidak ada | ✗ Tidak ada |
| **Oracle ORDS** | ✓ Gratis | ✓ Gratis | ✓ Gratis | ✗ Tidak ada | ✗ Tidak ada | ✗ Tidak ada |
| **SQL Agent/Scheduler** | ✓ DBMS_Scheduler | ✓ DBMS_Scheduler | ✓ DBMS_Scheduler | ✗ Tidak ada | ✓ SQL Agent | ✓ SQL Agent |
| **HA / Replication** | ✗ | ✗ (sejak 19c) | ✓ (opsi berbayar) | ✗ | Basic AG | ✓ Advanced AG |
| **Partitioning** | ✗ | ✗ | ✓ (opsi +$11.5K/proc) | ✗ | ✗ | ✓ Built-in |
| **In-Memory OLTP** | ✗ | ✗ | ✓ | ✗ (terbatas) | ✗ | ✓ Built-in |
| **Advanced Security** | ✗ | ✗ | ✓ (opsi berbayar) | ✗ Terbatas | ✗ Terbatas | ✓ Built-in |
| **Low-Code Platform** | ✓ APEX | ✓ APEX | ✓ APEX | ✗ | ✗ | ✗ |
| **Support Resmi** | Community only | 22%/tahun | 22%/tahun | Community only | 25%/tahun | 25%/tahun |
| **Cocok Untuk** | Dev/Internal tools | SMB / Departemen | Mission-critical | Dev/Desktop apps | SMB / Departemen | Mission-critical |

> *Sumber: Oracle Global Price List 2024 | Microsoft SQL Server 2022 Pricing | Oracle OTN License Agreement*  
> *SQL Server Express 2025: batas storage dinaikkan menjadi 50 GB/database*

---

## 6. Manajemen Storage Oracle DB Free/XE

Oracle DB Free dan XE membatasi total user data storage sebesar **12 GB** secara agregat.

### 6.1 Dampak Bertahap Saat Storage Mendekati / Melebihi 12 GB

| Fase | Ukuran Data | Status | Dampak |
|---|---|---|---|
| **Normal** | 0 – 8 GB | ✅ Aman | Operasional berjalan normal tanpa gangguan |
| **Perhatian** | 8 – 9.6 GB | 🟡 Monitor aktif | Mulai review data yang dapat diarsipkan |
| **Warning** | 9.6 – 11 GB | 🟠 Waspada | Aktif lakukan cleanup, notifikasi DBA/admin |
| **Critical** | 11 – 12 GB | 🔴 Kritis | Segera purge data atau evaluasi upgrade database |
| **Batas Keras** | > 12 GB | ⛔ READ ONLY | Database masuk mode read-only. INSERT/UPDATE ditolak dengan ORA-12954 |

### 6.2 Query Monitoring Storage

**Query 1 — Cek Total Storage Terpakai vs Sisa**

```sql
SELECT ROUND(SUM(bytes)/1024/1024/1024, 3) AS used_gb,
       12 - ROUND(SUM(bytes)/1024/1024/1024, 3) AS remaining_gb,
       ROUND(SUM(bytes)/1024/1024/1024 / 12 * 100, 2) AS pct_used
FROM DBA_SEGMENTS
WHERE owner NOT IN (
  'SYS','SYSTEM','DBSNMP','APPQOSSYS',
  'APEX_240200','APEX_PUBLIC_USER','MDSYS','XDB','WMSYS'
);
```

**Query 2 — Breakdown per Tablespace**

```sql
SELECT tablespace_name,
       ROUND(SUM(bytes)/1024/1024/1024, 3) AS size_gb,
       ROUND(SUM(bytes)/1024/1024, 1) AS size_mb
FROM DBA_SEGMENTS
GROUP BY tablespace_name
ORDER BY size_gb DESC;
```

**Query 3 — Breakdown per Schema / Owner**

```sql
SELECT owner,
       ROUND(SUM(bytes)/1024/1024/1024, 4) AS size_gb,
       ROUND(SUM(bytes)/1024/1024, 2) AS size_mb,
       COUNT(*) AS segment_count
FROM DBA_SEGMENTS
WHERE owner NOT IN (
  'SYS','SYSTEM','DBSNMP','APEX_240200',
  'APEX_PUBLIC_USER','MDSYS','XDB','WMSYS'
)
GROUP BY owner
ORDER BY size_gb DESC;
```

**Query 4 — View Monitoring dengan Status Otomatis**

```sql
CREATE OR REPLACE VIEW V_STORAGE_MONITOR AS
SELECT
  ROUND(SUM(bytes)/1024/1024/1024, 3) AS used_gb,
  ROUND(12 - SUM(bytes)/1024/1024/1024, 3) AS free_gb,
  ROUND(SUM(bytes)/1024/1024/1024/12*100, 1) AS pct_used,
  CASE
    WHEN SUM(bytes)/1024/1024/1024 >= 11  THEN 'CRITICAL - Segera tindak!'
    WHEN SUM(bytes)/1024/1024/1024 >= 9.6 THEN 'WARNING - Perlu perhatian'
    WHEN SUM(bytes)/1024/1024/1024 >= 8   THEN 'CAUTION - Monitor aktif'
    ELSE 'NORMAL'
  END AS status
FROM DBA_SEGMENTS
WHERE owner NOT IN (
  'SYS','SYSTEM','DBSNMP','MDSYS','XDB',
  'APEX_240200','APEX_PUBLIC_USER','WMSYS'
);
```

### 6.3 Automated Job Monitoring Harian

**Step 1 — Tabel Log Alert**

```sql
CREATE TABLE storage_alert_log (
  log_id     NUMBER GENERATED ALWAYS AS IDENTITY,
  check_date DATE          NOT NULL,
  used_gb    NUMBER(10,3)  NOT NULL,
  free_gb    NUMBER(10,3)  NOT NULL,
  pct_used   NUMBER(5,1)   NOT NULL,
  status     VARCHAR2(20)  NOT NULL,
  CONSTRAINT pk_sal PRIMARY KEY (log_id)
);
```

**Step 2 — Scheduled Job (setiap hari jam 07.00)**

```sql
BEGIN
  DBMS_SCHEDULER.CREATE_JOB(
    job_name        => 'JOB_CHECK_STORAGE',
    job_type        => 'PLSQL_BLOCK',
    job_action      => '
      DECLARE
        v_used NUMBER; v_free NUMBER; v_pct NUMBER; v_stat VARCHAR2(20);
      BEGIN
        SELECT ROUND(SUM(bytes)/1024/1024/1024,3),
               ROUND(12-SUM(bytes)/1024/1024/1024,3),
               ROUND(SUM(bytes)/1024/1024/1024/12*100,1)
          INTO v_used, v_free, v_pct
          FROM DBA_SEGMENTS
         WHERE owner NOT IN (''SYS'',''SYSTEM'',''DBSNMP'',
                              ''APEX_240200'',''MDSYS'',''XDB'');
        v_stat := CASE WHEN v_used>=11  THEN ''CRITICAL''
                       WHEN v_used>=9.6 THEN ''WARNING''
                       WHEN v_used>=8   THEN ''CAUTION'' ELSE ''NORMAL'' END;
        IF v_used >= 8 THEN
          INSERT INTO storage_alert_log(check_date,used_gb,free_gb,pct_used,status)
          VALUES(SYSDATE, v_used, v_free, v_pct, v_stat);
          COMMIT;
        END IF;
      END;',
    start_date      => TRUNC(SYSDATE+1) + 7/24,
    repeat_interval => 'FREQ=DAILY;BYHOUR=7;BYMINUTE=0',
    enabled         => TRUE,
    comments        => 'Daily storage monitoring - Oracle DB Free 12GB limit'
  );
END;
/
```

### 6.4 Strategi Pengelolaan Data Jangka Panjang

| Strategi | Penjelasan |
|---|---|
| **Data Archiving** | Pindahkan data lama (>2 tahun) ke tabel arsip atau flat file secara berkala |
| **LOB Management** | Jangan simpan file besar (PDF, gambar) di database — simpan path-nya saja |
| **Index Cleanup** | Audit dan drop index yang tidak digunakan via DBA_INDEXES |
| **Purge Log APEX** | Jadwalkan purge rutin dengan `APEX_UTIL.PURGE_ACTIVITY_LOG` |
| **Compress Old Data** | Gunakan `COMPRESS FOR OLTP` pada tabel historis yang jarang diakses |
| **Upgrade ke SE2** | Jika data konsisten mendekati 10 GB, pertimbangkan upgrade ke Oracle SE2 |

---

## 7. Kesimpulan & Rekomendasi Strategis

| Platform | Kondisi Ideal | Catatan Penting |
|---|---|---|
| **Oracle DB Free/XE + APEX** | Internal tools, EBS extensions, PoC dengan data <12 GB | APEX & ORDS gratis; batasan resource, bukan fitur APEX |
| **SQL Server Express** | Dev/desktop apps, prototyping, aplikasi standalone kecil | Tidak ada APEX; SQL Agent tidak tersedia; batas 10 GB/db |
| **Oracle SE2 + APEX** | SMB/departemen dengan data >12 GB dalam ekosistem Oracle | Upgrade alami dari Free/XE; APEX tetap gratis; ~$35K/server |
| **SQL Server Standard** | SMB tanpa Oracle EBS, multi-platform | ~$7.9K/server; tidak ada APEX; CAL per user bertumbuh |
| **Oracle EE + APEX** | Mission-critical, RAC, Partitioning, Security lanjutan | APEX gratis; opsi tambahan bisa 2x biaya DB utama |
| **SQL Server Enterprise** | Mission-critical dengan HA & analitik built-in | Fitur enterprise lengkap tanpa opsi terpisah; ~$242K/server |

---

> ### 💡 KESIMPULAN UTAMA
>
> Di antara enam platform yang dibandingkan, **Oracle DB Free/XE** adalah satu-satunya database gratis yang menyertakan platform low-code (APEX), job scheduler (DBMS_Scheduler), dan ekosistem Oracle yang kompatibel penuh dengan EBS — keunggulan yang tidak dimiliki SQL Server Express.
>
> Ketika data tumbuh melampaui 12 GB, upgrade path ke **Oracle SE2** mempertahankan seluruh investasi APEX tanpa migrasi platform, dengan biaya **~Rp 571 juta** dibandingkan SQL Server Standard **~Rp 771 juta** namun dengan nilai APEX yang tidak dimiliki SQL Server.
>
> Bagi organisasi yang sudah menggunakan Oracle EBS, **Oracle DB Free/XE + APEX** adalah titik awal paling cost-effective yang tersedia.

---

*Sumber: Oracle Global Price List 2024 | Microsoft SQL Server 2022 Pricing | Oracle OTN License Agreement*
