# Cek Kapasitas Oracle Database 23ai Free

Tool sederhana untuk memantau pemakaian storage Oracle Database 23ai Free (atau XE) supaya tidak keburu melewati batas dan database masuk ke mode *read-only* (`ORA-12954`).

Dibuat berdasarkan saran monitoring pada dokumen internal PANDAWA:
[20260225_Komparasi_6_Platform_Database.md](https://github.com/iwanhe/pandawa/blob/main/oracle-licensing/20260225_Komparasi_6_Platform_Database.md)

## Batas edisi Free yang dipantau

| Resource | Batas |
|---|---|
| Storage user data (agregat semua schema) | **12 GB** |
| Memory per instance | 2 GB |
| CPU | 2 threads |

Storage adalah yang paling sering "mepet" duluan dibanding CPU/memory, jadi tool ini fokus memantau storage dengan 4 level status:

| Status | Range pemakaian | Artinya |
|---|---|---|
| NORMAL | 0 – 8 GB | Aman |
| CAUTION | 8 – 9.6 GB | Mulai pantau aktif |
| WARNING | 9.6 – 11 GB | Perlu cleanup/archive |
| CRITICAL | 11 – 12 GB | Tindakan segera |
| (read-only) | > 12 GB | Database menolak semua write (`ORA-12954`) |

## Isi paket

1. **`01_cek_kapasitas_manual.sql`** — Jalankan kapan saja, tanpa setup apa pun. Menampilkan: ringkasan total + status, breakdown per tablespace, breakdown per schema (top 20), dan top 15 object terbesar.

2. **`02_setup_monitoring_otomatis.sql`** — Setup sekali jalan. Membuat:
   - Tabel `STORAGE_ALERT_LOG` — histori hasil cek (untuk lihat tren dari waktu ke waktu)
   - View `V_STORAGE_MONITOR` — snapshot kapasitas + status saat ini
   - Package `PKG_STORAGE_MONITOR` — logic cek, catat ke log, dan tampilkan
   - Job scheduler `JOB_STORAGE_CAPACITY_CHECK` — jalan otomatis **tiap hari jam 07:00** (waktu server DB) dan mencatat hasilnya

   Script ini aman dijalankan berulang kali — histori lama di `STORAGE_ALERT_LOG` tidak akan terhapus.

## Cara pakai

Jalankan lewat SQLcl (atau SQL*Plus), login dengan user yang punya akses ke `DBA_SEGMENTS`/`DBA_USERS` dan privilege `CREATE TABLE/VIEW/PROCEDURE/JOB` (user `ADMIN` bawaan 23ai Free biasanya sudah cukup):

```bash
# Cek manual kapan saja
sql ADMIN/password@localhost:1521/FREEPDB1 @01_cek_kapasitas_manual.sql

# Setup monitoring otomatis (sekali saja)
sql ADMIN/password@localhost:1521/FREEPDB1 @02_setup_monitoring_otomatis.sql
```

Setelah setup, cek kapan saja dari dalam database dengan:

```sql
EXEC pkg_storage_monitor.check_capacity;      -- cek + catat sekarang
EXEC pkg_storage_monitor.show_history(10);    -- lihat 10 histori terakhir
SELECT * FROM v_storage_monitor;              -- snapshot saat ini
SELECT pkg_storage_monitor.get_latest_status FROM dual;  -- status terakhir saja
```

## Catatan

- Schema bawaan Oracle (`SYS`, `SYSTEM`, `APEX_xxxxxx`, `MDSYS`, `XDB`, `WMSYS`, dll) dikecualikan dari perhitungan secara **dinamis** lewat `DBA_USERS.ORACLE_MAINTAINED = 'N'`, bukan daftar nama hardcode — jadi tetap akurat walau versi APEX atau skema internal berubah di rilis 23ai berikutnya.
- Job scheduler jalan menurut **timezone server database**, bukan timezone client. Kalau server belum di-set ke WIB, sesuaikan `BYHOUR` di `02_setup_monitoring_otomatis.sql` bagian STEP 4.
- Kalau pemakaian sudah masuk WARNING/CRITICAL, langkah lanjutan yang disarankan di dokumen sumber: archive data lama, pindahkan LOB besar ke object storage eksternal, atau upgrade ke Oracle SE2 kalau pemakaian sudah konsisten mendekati 10 GB.
- Kalau `02_setup_monitoring_otomatis.sql` gagal di STEP 4 dengan error privilege (`ORA-27486` atau sejenis), minta DBA/SYS memberi grant `CREATE JOB` ke user yang dipakai.
