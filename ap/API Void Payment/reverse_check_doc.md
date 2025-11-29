# Oracle AP Reverse Check Script - Dokumentasi

## Deskripsi
Script PL/SQL ini digunakan untuk melakukan pembatalan (void) terhadap payment check dalam Oracle E-Business Suite Accounts Payable (AP) module. Script ini menggunakan API standar Oracle `AP_VOID_PKG.Ap_Reverse_Check` untuk memproses pembatalan check.

## Prerequisites
- Akses ke database Oracle E-Business Suite
- User dengan privilege yang sesuai untuk melakukan void check
- Responsibility yang memiliki akses ke AP module
- Check ID yang valid dan ingin dibatalkan

## Parameter Input
Script ini memerlukan input dari user saat dijalankan:

| Parameter | Deskripsi | Contoh |
|-----------|-----------|---------|
| `check_id` | ID dari check yang akan dibatalkan | 12345 |
| `user_name` | Username Oracle yang akan digunakan | OPERATIONS |
| `responsibility_name` | Nama responsibility AP | Payables Manager |

## Cara Penggunaan

### 1. Persiapan
Pastikan Anda memiliki informasi berikut:
- Check ID yang akan dibatalkan
- Username yang valid di sistem
- Responsibility name yang sesuai

### 2. Menjalankan Script
```sql
-- Login ke SQLPlus atau SQL Developer
sqlplus username/password@database

-- Jalankan script
@reverse_check.sql

-- Masukkan parameter saat diminta:
-- Enter value for check_id: [masukkan check_id]
-- Enter value for user_name: [masukkan user_name]
-- Enter value for responsibility_name: [masukkan responsibility_name]
```

## Alur Kerja Script

### 1. Validasi Data
- Mengambil `org_id` dari check
- Mendapatkan `period_name` yang aktif saat ini
- Validasi user dan responsibility

### 2. Inisialisasi Context
- Menginisialisasi FND_GLOBAL dengan user dan responsibility
- Set multi-org context dengan `MO_GLOBAL.set_policy_context`

### 3. Analisis Payment History
Script menganalisis transaksi berikut dari `ap_payment_history_all`:
- **PAYMENT CLEARING**: Jumlah transaksi clearing
- **PAYMENT UNCLEARING**: Jumlah transaksi unclearing
- **PAYMENT MATURITY**: Jumlah transaksi maturity
- **PAYMENT MATURITY REVERSED**: Jumlah transaksi maturity reversed

### 4. Pengecekan Kondisi
Script akan memproses reverse check jika salah satu kondisi terpenuhi:
- Clear count <= Unclear count, ATAU
- Payment type adalah Netting Payment (`payment_type_flag = 'N'`)

Jika kondisi tidak terpenuhi, script akan menampilkan pesan:
```
Unclear the check and then run the void_check script again
```

### 5. Eksekusi Reverse Check
Jika kondisi terpenuhi, script memanggil `AP_VOID_PKG.Ap_Reverse_Check` dengan parameter:
- Replace Flag: 'N' (tidak akan membuat replacement check)
- Reversal Date: Tanggal sistem saat ini
- Reversal Period: Period yang sedang aktif

### 6. Update Status
Jika API berhasil (`return_status = 'S'`), script akan:
- Update `status_lookup_code` menjadi 'VOIDED'
- Set `void_date` dengan tanggal sistem
- Commit perubahan

## Output

### Success
```
The check has been voided successfully
```

### Failed - Perlu Unclearing
```
Unclear the check and then run the void_check script again
```

### Failed - API Error
```
call to AP_VOID_PKG.Ap_Reverse_Check API was not succeeded
```

### Exception
```
Encountered an Exception [error_message] while performing [debug_info]
```

## Variabel Penting

### Input Parameters
- `l_check_id`: ID check yang akan dibatalkan
- `l_user_id`: User ID dari FND_USER
- `l_resp_id`: Responsibility ID
- `l_org_id`: Operating Unit ID
- `l_period_name`: GL Period yang aktif

### Counters
- `l_clear_count`: Jumlah payment clearing
- `l_unclear_count`: Jumlah payment unclearing
- `l_mat_count`: Jumlah payment maturity
- `l_mat_rev_count`: Jumlah payment maturity reversed

### API Output
- `l_return_status`: Status return dari API ('S' = Success)
- `l_msg_count`: Jumlah pesan error
- `l_msg_data`: Data pesan error
- `l_num_cancelled`: Jumlah invoice yang dibatalkan
- `l_num_not_cancelled`: Jumlah invoice yang tidak dibatalkan

## Catatan Penting

### ⚠️ Peringatan
1. **Backup Data**: Selalu backup data sebelum menjalankan script void
2. **Test Environment**: Test script di test environment terlebih dahulu
3. **Period Status**: Pastikan GL period dalam status OPEN
4. **Check Status**: Verifikasi status check sebelum void
5. **Authorization**: Pastikan memiliki authority untuk void check

### 📋 Best Practices
1. Verifikasi check details sebelum void:
   ```sql
   SELECT check_id, check_number, check_date, status_lookup_code, amount
   FROM ap_checks_all
   WHERE check_id = &check_id;
   ```

2. Cek payment history:
   ```sql
   SELECT transaction_type, COUNT(*)
   FROM ap_payment_history_all
   WHERE check_id = &check_id
   GROUP BY transaction_type;
   ```

3. Review invoice yang terkait:
   ```sql
   SELECT invoice_num, invoice_amount
   FROM ap_invoices_all ai,
        ap_invoice_payments_all aip
   WHERE ai.invoice_id = aip.invoice_id
   AND aip.check_id = &check_id;
   ```

## Troubleshooting

### Problem: Script gagal dengan error "Period not found"
**Solution**: Pastikan ada GL period yang OPEN untuk tanggal saat ini

### Problem: "Unclear the check" message
**Solution**: 
1. Check payment history untuk clear/unclear count
2. Lakukan unclearing jika diperlukan
3. Jalankan ulang script

### Problem: "API was not succeeded"
**Solution**:
1. Check `l_msg_data` untuk detail error
2. Verifikasi user dan responsibility memiliki akses yang cukup
3. Pastikan check tidak dalam status yang tidak bisa di-void

### Problem: "User not found" atau "Responsibility not found"
**Solution**:
1. Verifikasi username dengan query:
   ```sql
   SELECT user_name, user_id FROM fnd_user WHERE user_name = '&user_name';
   ```
2. Verifikasi responsibility:
   ```sql
   SELECT responsibility_name, responsibility_id 
   FROM fnd_responsibility_tl 
   WHERE application_id = 200 
   AND responsibility_name LIKE '%Payable%';
   ```

## Script SQL

```sql
SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE

   l_org_id                     NUMBER;
   l_user_id                    NUMBER;
   l_resp_id                    NUMBER;
   l_check_id                   NUMBER := &check_id;
   l_period_name                VARCHAR2(100);
   l_num_cancelled              NUMBER;
   l_num_not_cancelled          NUMBER;
   l_clear_count                NUMBER;
   l_unclear_count              NUMBER;
   l_mat_count                  NUMBER;
   l_mat_rev_count              NUMBER;
   l_return_status              VARCHAR2(1000);
   l_msg_count                  NUMBER;
   l_msg_data                   VARCHAR2(4000);
   l_debug_info                 VARCHAR2(4000);
   l_netting_type               VARCHAR2 (25);

BEGIN

    l_debug_info := 'fetching the org_id';
    SELECT org_id
    INTO l_org_id
    FROM ap_checks_all
    WHERE check_id = l_check_id;

    l_debug_info := 'fetching the period name';
    SELECT DISTINCT glps.period_name
    INTO l_period_name
    FROM gl_period_statuses glps,
       ap_system_parameters_all asp,
       ap_checks_all ac
    WHERE glps.application_id = 200
    AND nvl(glps.adjustment_period_flag, 'N') = 'N'
    AND trunc(sysdate) BETWEEN glps.start_date AND glps.end_date
    AND glps.set_of_books_id = asp.set_of_books_id
    AND asp.org_id = ac.org_id
    AND ac.check_id = l_check_id
    AND rownum < 2;

    l_debug_info := 'Getting the user_id';
    SELECT user_id
    INTO l_user_id
    FROM fnd_user
    WHERE user_name = '&user_name'
    AND rownum < 2;

    l_debug_info := 'Getting the responsibility_id';
    SELECT responsibility_id
    INTO l_resp_id
    FROM fnd_responsibility_tl
    WHERE application_id = 200
    AND responsibility_name = '&responsibility_name'
    AND language = userenv('LANG')
    AND rownum < 2;

    l_debug_info := 'before calling the fnd global';
    FND_GLOBAL.APPS_INITIALIZE(l_user_id, l_resp_id, 200);

    l_debug_info := 'Setting the org context';
    MO_GLOBAL.set_policy_context('S', l_org_id);

    l_debug_info := 'Getting the counts of the transaction types';
    SELECT nvl(SUM(decode(transaction_type,'PAYMENT CLEARING',1,0)), 0),
       nvl(SUM(decode(transaction_type,'PAYMENT UNCLEARING',1,0)), 0),
       nvl(SUM(decode(transaction_type,'PAYMENT MATURITY',1,0)), 0),
       nvl(SUM(decode(transaction_type,'PAYMENT MATURITY REVERSED',1,0)), 0)
    INTO l_clear_count,
       l_unclear_count,
       l_mat_count,
       l_mat_rev_count
    FROM ap_payment_history_all
    WHERE check_id = l_check_id;
	
	SELECT  payment_type_flag
    INTO    l_netting_type
    FROM    ap_checks_all
    WHERE   check_id = l_check_id;
	
	
    l_debug_info := 'Evaluating the counts before calling reverse check / calling reverse check directly if it is netting payment';
    IF (l_clear_count <= l_unclear_count or l_netting_type = 'N') THEN

      l_debug_info := 'calling the reverse check';
      AP_VOID_PKG.Ap_Reverse_Check(
          P_Check_Id                    =>  l_check_id,                                 --IN         NUMBER,
          P_Replace_Flag                =>  'N',                                        --IN         VARCHAR2,
          P_Reversal_Date               =>  trunc(sysdate),                             --IN         DATE,
          P_Reversal_Period_Name        =>  l_period_name,                              --IN         VARCHAR2,
          P_Checkrun_Name               =>  NULL,                                       --IN         VARCHAR2,
          P_Invoice_Action              =>  NULL,                                       --IN         VARCHAR2,
          P_Hold_Code                   =>  NULL,                                       --IN         VARCHAR2,
          P_Hold_Reason                 =>  NULL,                                       --IN         VARCHAR2,
          P_Sys_Auto_Calc_Int_Flag      =>  NULL,                                       --IN         VARCHAR2,
          P_Vendor_Auto_Calc_Int_Flag   =>  NULL,                                       --IN         VARCHAR2,
          P_Last_Updated_By             =>  -8647964,                                   --IN         NUMBER,
          P_Last_Update_Login           =>  -8647964,                                   --IN         NUMBER,
          P_Num_Cancelled               =>  l_num_cancelled,                            --OUT NOCOPY NUMBER,
          P_Num_Not_Cancelled           =>  l_num_not_cancelled,                        --OUT NOCOPY NUMBER,
          P_Calling_Module              =>  'backend cancel script',                    --IN         VARCHAR2 Default 'SQLAP',
          P_Calling_Sequence            =>  'backend cancel script',                    --IN         VARCHAR2,
          X_return_status               =>  l_return_status,                            --OUT NOCOPY VARCHAR2,
          X_msg_count                   =>  l_msg_count,                                --OUT NOCOPY NUMBER,
          X_msg_data                    =>  l_msg_data);                                --OUT NOCOPY VARCHAR2)

    ELSE

      DBMS_OUTPUT.put_line('Unclear the check and then run the void_check script again');

    END IF;
	
	l_debug_info := 'Before setting the status';
  
  If (nvl(l_return_status,'N') = 'S') Then
    UPDATE ap_checks_all
    SET status_lookup_code = 'VOIDED',
        void_date = trunc(sysdate)       
    WHERE check_id = l_check_id
     and   status_lookup_code <> 'VOIDED';
	 
	 l_debug_info := 'The check has been voided successfully';
  Else
      DBMS_OUTPUT.put_line('call to AP_VOID_PKG.Ap_Reverse_Check API was not succeeded');
   end if;  

    l_debug_info := 'before the commit';
    COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Encountered an Exception '||SQLERRM||' while performing '||l_debug_info);

END;
/
```

## Query Bantuan

### Cek Status Check
```sql
SELECT 
    check_id,
    check_number,
    check_date,
    status_lookup_code,
    amount,
    vendor_name,
    payment_type_flag
FROM ap_checks_all ac,
     po_vendors pv
WHERE ac.vendor_id = pv.vendor_id
AND check_id = &check_id;
```

### Cek Payment History
```sql
SELECT 
    transaction_type,
    accounting_date,
    created_by,
    creation_date
FROM ap_payment_history_all
WHERE check_id = &check_id
ORDER BY creation_date DESC;
```

### Cek Active GL Period
```sql
SELECT 
    period_name,
    start_date,
    end_date,
    closing_status
FROM gl_period_statuses
WHERE application_id = 200
AND adjustment_period_flag = 'N'
AND TRUNC(SYSDATE) BETWEEN start_date AND end_date;
```

## Referensi
- Oracle E-Business Suite Payables API Documentation
- Oracle Metalink Note: Voiding Payments in Oracle Payables
- Module: Oracle Accounts Payable (AP)
- Application ID: 200

## Version History
| Version | Date | Description |
|---------|------|-------------|
| 1.0 | - | Initial script |

## Support
Untuk pertanyaan atau issue terkait script ini, hubungi Oracle EBS Support atau DBA team Anda.

---
**Disclaimer**: Script ini harus ditest terlebih dahulu di test environment sebelum digunakan di production. Pastikan Anda memiliki backup yang adequate sebelum menjalankan script ini.