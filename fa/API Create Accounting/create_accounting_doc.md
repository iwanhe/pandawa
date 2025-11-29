# Dokumentasi Script Create Accounting for Assets

## Deskripsi
Script PL/SQL ini digunakan untuk menjalankan program **Create Accounting** pada modul Oracle Fixed Assets (OFA) dalam Oracle E-Business Suite. Program ini akan membuat jurnal akuntansi untuk transaksi aset tetap.

## Informasi Script
- **Formatted on**: 08/09/2025 14:42:57
- **Application**: Oracle Fixed Assets (OFA)
- **Program**: FAACCPB (Create Accounting)

## Parameter dan Konfigurasi

### Inisialisasi Aplikasi
```sql
Fnd_Global.apps_initialize (1479, 50911, 140);
```
- **User ID**: 1479
- **Responsibility ID**: 50911
- **Application ID**: 140 (Fixed Assets)

### Parameter Submit Request

| Parameter | Nilai | Deskripsi |
|-----------|-------|-----------|
| Application | `OFA` | Oracle Fixed Assets |
| Program | `FAACCPB` | Create Accounting Program |
| Description | `Create Accounting for Assets` | Deskripsi request |
| Start Time | `SYSDATE` | Waktu eksekusi langsung |
| Sub Request | `FALSE` | Bukan sub request |

### Parameter Program

| No | Parameter | Nilai | Deskripsi |
|----|-----------|-------|-----------|
| 1 | Book Name | `NTI KUDUS FKL` | Nama buku aset |
| 2 | Request ID | `140` | ID Request |
| 3 | Application ID | `140` | Fixed Assets Application |
| 4 | Include Subledger | `Y` | Include subledger |
| 5 | Period Name | `2022` | Periode akuntansi |
| 6 | Reserved | `''` | Parameter kosong |
| 7 | Date | `SYSDATE (YYYY/MM/DD HH24:MI:SS)` | Tanggal proses |
| 8-22 | Various Flags | `Y/N/F/D` | Berbagai opsi pemrosesan |

## Logika Proses

### Flow Eksekusi
1. **Inisialisasi Environment**
   - Set user, responsibility, dan application context
   
2. **Submit Request**
   - Submit concurrent request untuk Create Accounting
   - Menerima request ID sebagai return value

3. **Validasi**
   - Jika `l_request_id = 0`: Request gagal
   - Jika berhasil: Menampilkan request ID

4. **Commit/Rollback**
   - Success: `COMMIT` transaksi
   - Error: `ROLLBACK` transaksi

## Output

### Sukses
```
Create Accounting request submitted with ID: [request_id]
```

### Gagal
```
Error submitting Create Accounting request.
```

### Exception
```
An error occurred: [error_message]
```

## Cara Penggunaan

### Prasyarat
1. User harus memiliki akses ke Oracle Fixed Assets
2. Responsibility yang sesuai sudah di-assign
3. Book "NTI KUDUS FKL" harus sudah exist di sistem
4. Periode 2022 harus sudah dibuka

### Langkah Eksekusi

1. **Via SQL*Plus atau SQL Developer**
   ```sql
   @Create_Accounting_Assets.sql
   ```

2. **Via SQLcl**
   ```bash
   sql username/password@database
   @Create_Accounting_Assets.sql
   ```

3. **Monitoring Request**
   - Login ke Oracle EBS
   - Navigate ke: **System Administrator > Concurrent > Requests**
   - Cari request ID yang muncul di output

## Parameter yang Dapat Disesuaikan

### Parameter Wajib Diubah Sesuai Environment
```sql
Fnd_Global.apps_initialize (
    [USER_ID],           -- Sesuaikan dengan user ID
    [RESP_ID],           -- Sesuaikan dengan responsibility ID
    [APPL_ID]            -- Biasanya 140 untuk Fixed Assets
);
```

### Parameter Book dan Periode
```sql
'NTI KUDUS FKL',  -- Ganti dengan nama book yang sesuai
140,              -- Organization ID
140,              -- Book Type Code
'Y',              -- Include Subledger
2022,             -- Ganti dengan periode yang diinginkan
```

## Troubleshooting

### Request ID = 0
**Penyebab:**
- Parameter tidak valid
- User tidak memiliki privilege
- Concurrent manager tidak berjalan

**Solusi:**
- Validasi semua parameter
- Check user responsibility
- Pastikan concurrent manager aktif

### Error SQLERRM
**Penyebab Umum:**
- Invalid book name
- Periode belum dibuka
- Privilege issue

**Solusi:**
- Validasi book name di system
- Check periode status
- Verify user grants

## Best Practices

1. **Testing**
   - Test di environment development terlebih dahulu
   - Validasi hasil sebelum run di production

2. **Logging**
   - Enable DBMS_OUTPUT untuk monitoring
   - Simpan request ID untuk tracking

3. **Backup**
   - Backup data sebelum eksekusi di production
   - Dokumentasikan parameter yang digunakan

4. **Monitoring**
   - Monitor concurrent request hingga complete
   - Review log file jika ada error
   - Validasi jurnal yang terbentuk

## Catatan Penting

⚠️ **Warning:**
- Script ini akan membuat jurnal akuntansi permanen
- Pastikan periode dan book sudah benar
- Request tidak dapat di-cancel setelah di-submit
- Selalu test di non-production environment terlebih dahulu

## Script Lengkap

```sql
/* Formatted on 08/09/2025 14:42:57 (QP5 v5.362) */
DECLARE
    l_request_id   NUMBER;
BEGIN
    Fnd_Global.apps_initialize (1479, 50911, 140);
    
    l_request_id :=
        FND_REQUEST.SUBMIT_REQUEST (
            'OFA',                                      -- Application short name for Oracle Fixed Assets
            'FAACCPB',                                  -- Short name for Create Accounting program
            'Create Accounting for Assets',            -- Description
            SYSDATE,                                    -- Start time
            FALSE,                                      -- Sub Request
            'NTI KUDUS FKL',                           -- Book Name
            140,                                        -- Request ID
            140,                                        -- Application ID
            'Y',                                        -- Include Subledger
            2022,                                       -- Period Name
            '',                                         -- Reserved
            TO_CHAR (SYSDATE, 'YYYY/MM/DD HH24:MI:SS'), -- Date
            'Y',                                        -- Parameter 12
            'Y',                                        -- Parameter 13
            'F',                                        -- Parameter 14
            'Y',                                        -- Parameter 15
            'N',                                        -- Parameter 16
            'D',                                        -- Parameter 17
            'Y',                                        -- Parameter 18
            'Y',                                        -- Parameter 19
            'N',                                        -- Parameter 20
            '',                                         -- Parameter 21
            '',                                         -- Parameter 22
            'N',                                        -- Parameter 23
            '',                                         -- Parameter 24
            ''                                          -- Parameter 25
        );

    IF l_request_id = 0
    THEN
        DBMS_OUTPUT.PUT_LINE ('Error submitting Create Accounting request.');
    ELSE
        DBMS_OUTPUT.PUT_LINE (
            'Create Accounting request submitted with ID: ' || l_request_id);
    END IF;
    
    COMMIT;                 
EXCEPTION
    WHEN OTHERS
    THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE ('An error occurred: ' || SQLERRM);
END;
/
```

## Referensi
- Oracle Fixed Assets User Guide
- Oracle E-Business Suite Developer's Guide
- Oracle Concurrent Processing Guide

---

**Version**: 1.0  
**Last Updated**: 08/09/2025  
**Maintained by**: EBS Development Team