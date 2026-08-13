/*
================================================================================
  01_cek_kapasitas_manual.sql

  TUJUAN
  ------
  Cek cepat pemakaian storage Oracle Database 23ai Free (atau XE) supaya
  tidak keburu melewati batas 12 GB "user data" dan database masuk ke mode
  read-only (ORA-12954).

  Referensi konsep & threshold:
  https://github.com/iwanhe/pandawa/blob/main/oracle-licensing/20260225_Komparasi_6_Platform_Database.md

  CARA PAKAI
  ----------
  Jalankan lewat SQLcl / SQL*Plus dengan user yang punya akses ke DBA_SEGMENTS
  dan DBA_USERS (biasanya ADMIN atau SYS/SYSTEM di 23ai Free):

      sql ADMIN/password@localhost:1521/FREEPDB1 @01_cek_kapasitas_manual.sql

  Tidak perlu setup apa pun sebelumnya -- script ini murni query, tidak
  membuat objek apa pun di database. Untuk versi yang mencatat histori &
  bisa dijadwalkan otomatis, lihat 02_setup_monitoring_otomatis.sql.

  CATATAN LIMIT
  -------------
  Batas resmi Oracle Database Free (23ai Free / XE):
    - Storage user data : 12 GB (agregat semua schema, PDB "FREEPDB1")
    - Memory            : 2 GB per instance
    - CPU               : 2 threads
  Storage adalah batas yang paling sering "mepet" duluan sebelum CPU/memory,
  makanya tool ini fokus ke situ.
================================================================================
*/

SET PAGESIZE 100
SET LINESIZE 160
SET FEEDBACK OFF
SET VERIFY OFF
COLUMN owner            FORMAT A25
COLUMN tablespace_name  FORMAT A25
COLUMN status           FORMAT A45
COLUMN size_gb           FORMAT 999,990.000
COLUMN size_mb           FORMAT 999,990.0
COLUMN used_gb           FORMAT 990.000
COLUMN free_gb           FORMAT 990.000
COLUMN pct_used          FORMAT 990.0

PROMPT
PROMPT ================================================================
PROMPT  RINGKASAN KAPASITAS ORACLE 23AI FREE (LIMIT: 12 GB)
PROMPT ================================================================

-- 1) RINGKASAN TOTAL + STATUS
--    Schema Oracle bawaan (SYS, SYSTEM, APEX_xxxxxx, MDSYS, XDB, dst)
--    dikecualikan secara DINAMIS lewat DBA_USERS.ORACLE_MAINTAINED,
--    jadi tetap akurat walau versi APEX/skema internal berubah.
SELECT
    ROUND(SUM(s.bytes) / 1024 / 1024 / 1024, 3)                       AS used_gb,
    ROUND(12 - SUM(s.bytes) / 1024 / 1024 / 1024, 3)                  AS free_gb,
    ROUND(SUM(s.bytes) / 1024 / 1024 / 1024 / 12 * 100, 1)            AS pct_used,
    CASE
        WHEN SUM(s.bytes) / 1024 / 1024 / 1024 >= 11   THEN 'CRITICAL - segera bersihkan / archive!'
        WHEN SUM(s.bytes) / 1024 / 1024 / 1024 >= 9.6  THEN 'WARNING  - perlu tindakan cleanup'
        WHEN SUM(s.bytes) / 1024 / 1024 / 1024 >= 8    THEN 'CAUTION  - mulai pantau aktif'
        ELSE 'NORMAL'
    END                                                                AS status
FROM dba_segments s
JOIN dba_users u ON u.username = s.owner
WHERE u.oracle_maintained = 'N';

PROMPT
PROMPT ================================================================
PROMPT  BREAKDOWN PER TABLESPACE
PROMPT ================================================================

-- 2) BREAKDOWN PER TABLESPACE (semua tablespace, termasuk system,
--    supaya kelihatan kalau ada yang tidak wajar besar)
SELECT
    tablespace_name,
    ROUND(SUM(bytes) / 1024 / 1024 / 1024, 3) AS size_gb,
    ROUND(SUM(bytes) / 1024 / 1024, 1)        AS size_mb
FROM dba_segments
GROUP BY tablespace_name
ORDER BY size_gb DESC;

PROMPT
PROMPT ================================================================
PROMPT  BREAKDOWN PER SCHEMA (TOP 20, schema user saja)
PROMPT ================================================================

-- 3) BREAKDOWN PER SCHEMA -- siapa "pemakan" storage terbesar
SELECT *
FROM (
    SELECT
        s.owner,
        ROUND(SUM(s.bytes) / 1024 / 1024 / 1024, 4) AS size_gb,
        ROUND(SUM(s.bytes) / 1024 / 1024, 2)        AS size_mb,
        COUNT(*)                                     AS segment_count
    FROM dba_segments s
    JOIN dba_users u ON u.username = s.owner
    WHERE u.oracle_maintained = 'N'
    GROUP BY s.owner
    ORDER BY size_gb DESC
)
WHERE ROWNUM <= 20;

PROMPT
PROMPT ================================================================
PROMPT  TOP 15 OBJECT/SEGMENT TERBESAR (buat drill-down cepat)
PROMPT ================================================================

-- 4) TOP OBJECT TERBESAR -- berguna kalau satu tabel/index mendadak besar
SELECT *
FROM (
    SELECT
        s.owner,
        s.segment_name,
        s.segment_type,
        ROUND(s.bytes / 1024 / 1024, 1) AS size_mb
    FROM dba_segments s
    JOIN dba_users u ON u.username = s.owner
    WHERE u.oracle_maintained = 'N'
    ORDER BY s.bytes DESC
)
WHERE ROWNUM <= 15;

SET FEEDBACK ON
PROMPT
PROMPT Selesai. Jalankan script ini rutin (mis. mingguan), atau pakai
PROMPT 02_setup_monitoring_otomatis.sql supaya dicek & dicatat otomatis
PROMPT setiap hari oleh database sendiri.
PROMPT
