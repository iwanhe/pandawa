# Dokumentasi Solving Case SO Return NSTI

## Overview
Dokumentasi ini menjelaskan langkah-langkah penyelesaian masalah SO (Sales Order) Return yang stuck di interface AR (Accounts Receivable).

---

## Langkah 1: Cek Setup dan Data Acuan

### Verifikasi Data
1. Cek setup dan data acuan seperti `customer_trx_type_id` dari data yang berhasil
2. Pastikan Type invoice AR menggunakan **Inv Tembakau Lokal**
3. Return harus mendapat type **CM Credit Memo**
4. Verifikasi di table `ra_interface_lines_all` hanya tinggal transaksi yang stuck saja

### Query Verifikasi
```sql
-- Cek data di interface lines
SELECT *
FROM ra_interface_lines_all
WHERE sales_order = '2519300002';

-- Cek customer trx type
SELECT *
FROM ra_cust_trx_types_all
WHERE name LIKE '%Tembakau%';
```

---

## Langkah 2: Reinvoicing Close SO Line

### Tujuan
Melakukan reinvoicing dari transaksi yang berhasil agar bisa masuk ke interface kembali.

### Backup Tables
```sql
-- Backup ra_interface_lines_all
CREATE TABLE ra_interface_lines_all_bkp AS
SELECT *
FROM ra_interface_lines_all
WHERE sales_order = '2519300002';

-- Backup ra_interface_salescredits_all
CREATE TABLE ra_interface_salescredits_all_bkp AS
SELECT *
FROM ra_interface_salescredits_all
WHERE interface_line_attribute6 IN (
    SELECT interface_line_attribute6
    FROM ra_interface_lines_all
    WHERE sales_order = '2519300002'
);
```

### Script Reinvoicing

```sql
--start here

DECLARE
 
  l_return_status_cls VARCHAR2(30);
  l_return_status_inv VARCHAR2(30);
  l_result VARCHAR2(30);
  l_msg_count NUMBER;
  l_msg_data VARCHAR2(256);
  l_count NUMBER:= 0;
  l_file_name VARCHAR2(250);
  l_child_count NUMBER := 0;
  l_count_sc NUMBER := 0;
  l_count_il NUMBER := 0;
 
  CURSOR LINES_TO_CLOSE IS
    SELECT t1.line_id, 
           t2.order_number, 
           t2.SOURCE_DOCUMENT_TYPE_ID,
           t1.header_id,
           t1.org_id
    FROM oe_order_lines_all t1,
         oe_order_headers_all t2,
         mtl_system_items_b itm
    WHERE t1.flow_status_code = 'CLOSED'
      AND t1.open_flag = 'N'
      AND t1.line_category_code IN ('ORDER', 'RETURN')
      AND t1.invoice_interface_status_code IS NOT NULL
      AND t2.header_id = t1.header_id
      AND t1.item_type_Code != 'INCLUDED'
      AND NVL(t2.SOURCE_DOCUMENT_TYPE_ID, 0) != 10
      AND t1.inventory_item_id = itm.inventory_item_id
      AND t1.ship_from_org_id = itm.organization_id
      AND NVL(itm.INVOICEABLE_ITEM_FLAG, 'N') = 'Y'
      AND NVL(itm.INVOICE_ENABLED_FLAG, 'N') = 'Y'
      AND t2.order_number = '2519300002' -- SO Return yang bermasalah
      AND NOT EXISTS (
          SELECT 1
          FROM ra_customer_trx_lines_all t10
          WHERE t10.interface_line_attribute6 = TO_CHAR(t1.line_id)
            AND t10.sales_order = t2.order_number
            AND t10.sales_order_line IS NOT NULL
      )
      AND NOT EXISTS (
          SELECT 1
          FROM ra_interface_lines_all t11
          WHERE t11.interface_line_attribute6 = TO_CHAR(t1.line_id)
            AND t11.sales_order = t2.order_number
            AND t11.sales_order_line IS NOT NULL
      );
 
  WRONG_ROWS_UPDATED EXCEPTION;
 
BEGIN
 
  -- Set up debugging
  Oe_debug_pub.debug_ON;
  Oe_debug_pub.initialize;
  Oe_debug_pub.setdebuglevel(5);
 
  l_file_name := Oe_debug_pub.set_debug_mode('FILE');
 
  Dbms_Output.put_line('Debug log is located at: ' || 
                       Oe_debug_pub.g_dir || '/' || 
                       Oe_debug_pub.g_file);
 
  FOR x IN LINES_TO_CLOSE LOOP
 
    Oe_debug_pub.ADD('==================================================');
    Oe_debug_pub.ADD('Selected Line ID : ' || x.line_id || 
                     ', Header ID : ' || x.header_id || 
                     ', Order# ' || x.order_number);
    Oe_debug_pub.ADD('==================================================');
 
    -- Reset invoiced quantity and open flag
    UPDATE oe_order_lines_all
    SET invoiced_quantity = NULL,
        open_flag = 'Y',
        INVOICE_INTERFACE_STATUS_CODE = NULL,
        LAST_UPDATE_DATE = SYSDATE
    WHERE line_id = x.line_id;
 
    IF SQL%ROWCOUNT > 1 THEN
      Oe_debug_pub.ADD('Error occurred More than one rows');
      RAISE WRONG_ROWS_UPDATED;
    END IF;
 
    -- Set the org context
    MO_GLOBAL.SET_POLICY_CONTEXT('S', x.org_id);
 
    -- Delete existing interface lines
    BEGIN
      SELECT count(*)
      INTO l_count_il
      FROM RA_INTERFACE_LINES_ALL
      WHERE interface_line_attribute6 = x.line_id;
 
      IF l_count_il > 0 THEN
        DELETE FROM RA_INTERFACE_LINES_ALL
        WHERE interface_line_attribute6 = x.line_id
          AND interface_line_context = 'ORDER ENTRY';
      END IF;
 
      l_count_il := 0;
    EXCEPTION
      WHEN OTHERS THEN
        oe_debug_pub.add('No Interface Lines to delete!');
        l_count_il := 0;
    END;
 
    -- Delete existing sales credits
    BEGIN
      SELECT count(*)
      INTO l_count_sc
      FROM RA_INTERFACE_SALESCREDITS_ALL
      WHERE interface_line_attribute6 = x.line_id;
 
      IF l_count_sc > 0 THEN
        DELETE FROM RA_INTERFACE_SALESCREDITS_ALL
        WHERE interface_line_attribute6 = x.line_id
          AND interface_line_context = 'ORDER ENTRY';
      END IF;
 
      l_count_sc := 0;
    EXCEPTION
      WHEN OTHERS THEN
        oe_debug_pub.add('No Sales Credits to delete!');
        l_count_sc := 0;
    END;
 
    -- Invoice the Line
    Oe_debug_pub.ADD('Invoicing the Line...');
 
    Oe_invoice_pub.Interface_Line(x.line_id,
                                  'OEOL',
                                  l_result,
                                  l_return_status_inv);
 
    -- Close the Line if interface was successful
    IF l_return_status_inv = 'S' THEN
      Oe_debug_pub.ADD('Complete.');
      Oe_debug_pub.ADD('Setting Line status to closed...');
 
      UPDATE oe_order_lines_all
      SET flow_status_code = 'CLOSED',
          open_flag = 'N',
          LAST_UPDATE_DATE = SYSDATE
      WHERE line_id = x.line_id;
 
      IF SQL%ROWCOUNT > 1 THEN
        Oe_debug_pub.ADD('Error occurred More than one rows 2nd update');
        RAISE WRONG_ROWS_UPDATED;
      END IF;
 
    ELSE
      Dbms_Output.put_line('Error occurred: Invoice');
      Oe_debug_pub.ADD('Invoicing failed.');
      ROLLBACK;
      EXIT;
    END IF;
 
    l_count := l_count + 1;
 
  END LOOP;
 
  IF l_count = 0 THEN
    Oe_debug_pub.ADD('No line to fix.');
    Dbms_Output.put_line('No line to fix.');
  ELSE
    Oe_debug_pub.ADD(l_count || ' lines updated.');
    Dbms_Output.put_line(l_count || ' lines updated.');
  END IF;
 
  Oe_debug_pub.debug_OFF;
 
EXCEPTION
  WHEN OTHERS THEN
    Dbms_Output.put_line('Error occurred: ' || SQLERRM);
    Oe_debug_pub.ADD('Error occurred: ' || SQLERRM);
    ROLLBACK;
END;
/

PROMPT
PROMPT ===========================================================
PROMPT You must enter COMMIT to Save changes or ROLLBACK to Revert
PROMPT ===========================================================

--end here
```

### Hapus Data Hasil Reinvoicing
Setelah backup, hapus data yang berasal dari hasil reinvoicing agar tidak bentrok dengan datafix selanjutnya.

```sql
-- Hapus data reinvoicing dari interface
DELETE FROM ra_interface_lines_all
WHERE sales_order = '2519300002'
  AND created_by = [USER_ID_REINVOICING];

DELETE FROM ra_interface_salescredits_all
WHERE interface_line_attribute6 IN (
    SELECT interface_line_attribute6
    FROM ra_interface_lines_all_bkp
);
```

---

## Langkah 3: Cek dan Bandingkan Data

### Query Perbandingan Data
```sql
-- Cek data yang stuck di interface
SELECT interface_line_id,
       interface_line_context,
       interface_line_attribute6,
       sales_order,
       cust_trx_type_id,
       reference_line_id,
       line_type,
       description
FROM ra_interface_lines_all
WHERE sales_order = '2519300002';

-- Bandingkan dengan data yang berhasil
SELECT interface_line_id,
       interface_line_context,
       interface_line_attribute6,
       sales_order,
       cust_trx_type_id,
       reference_line_id,
       line_type,
       description
FROM ra_interface_lines_all
WHERE sales_order = '2512100104' -- SO yang berhasil
  AND line_type = 'LINE';
```

### Poin Perbandingan
- **CUST_TRX_TYPE_ID**: Harus sesuai dengan type CM Credit Memo (value = 2)
- **REFERENCE_LINE_ID**: Harus merujuk ke line original invoice yang di-return
- **LINE_TYPE**: Harus 'LINE' untuk item lines
- **INTERFACE_LINE_CONTEXT**: Harus 'ORDER ENTRY'

---

## Langkah 4: Datafix

### Query untuk Mendapatkan Reference Line ID

```sql
-- Cari header_id dari original invoice
SELECT customer_trx_id,
       trx_number,
       interface_header_attribute1
FROM ra_customer_trx_all
WHERE interface_header_attribute1 = '2512100104'; -- SO original

-- Cari line_id untuk reference
SELECT customer_trx_line_id,
       customer_trx_id,
       line_number,
       inventory_item_id,
       quantity_invoiced
FROM ra_customer_trx_lines_all
WHERE customer_trx_id = '348122' -- dari query sebelumnya
  AND line_type = 'LINE';
```

### Update CUST_TRX_TYPE_ID dan REFERENCE_LINE_ID

```sql
-- Update cust_trx_type_id menjadi 2 (CM Credit Memo)
UPDATE ra_interface_lines_all
SET cust_trx_type_id = 2,
    last_update_date = SYSDATE
WHERE sales_order = '2519300002'
  AND interface_line_context = 'ORDER ENTRY'
  AND line_type = 'LINE';

-- Update reference_line_id
UPDATE ra_interface_lines_all ril
SET reference_line_id = (
    SELECT rctl.customer_trx_line_id
    FROM ra_customer_trx_lines_all rctl
    WHERE rctl.customer_trx_id = 348122
      AND rctl.inventory_item_id = ril.inventory_item_id
      AND rctl.line_type = 'LINE'
      AND ROWNUM = 1
),
    last_update_date = SYSDATE
WHERE sales_order = '2519300002'
  AND interface_line_context = 'ORDER ENTRY'
  AND line_type = 'LINE';

COMMIT;
```

### Verifikasi Datafix
```sql
-- Verifikasi hasil update
SELECT interface_line_id,
       sales_order,
       cust_trx_type_id,
       reference_line_id,
       inventory_item_id,
       line_type
FROM ra_interface_lines_all
WHERE sales_order = '2519300002'
  AND interface_line_context = 'ORDER ENTRY';
```

---

## Langkah 5: Jalankan Autoinvoice Import Program

### Navigasi
1. Login ke Oracle EBS
2. Pilih Responsibility: **Receivables**
3. Navigation: **Interface > AutoInvoice**

### Parameter Program
- **Batch Source**: ORDER ENTRY
- **Transaction Date From**: [tanggal transaksi]
- **Transaction Date To**: [tanggal transaksi]
- **Sales Order**: 2519300002
- **Default Date**: [tanggal saat ini]
- **Grouping Rule**: Default

### Submit Program
1. Klik tombol **Submit**
2. Tunggu hingga program selesai
3. Cek output dan log file
4. Verifikasi hasilnya

### Query Verifikasi Hasil
```sql
-- Cek apakah sudah masuk ke ra_customer_trx_all
SELECT customer_trx_id,
       trx_number,
       trx_date,
       interface_header_attribute1,
       complete_flag
FROM ra_customer_trx_all
WHERE interface_header_attribute1 = '2519300002';

-- Cek lines
SELECT rctl.customer_trx_line_id,
       rctl.customer_trx_id,
       rctl.line_number,
       rctl.inventory_item_id,
       rctl.quantity_invoiced,
       rctl.sales_order,
       rctl.sales_order_line
FROM ra_customer_trx_lines_all rctl
WHERE rctl.sales_order = '2519300002';

-- Cek apakah masih ada di interface (seharusnya sudah kosong)
SELECT COUNT(*)
FROM ra_interface_lines_all
WHERE sales_order = '2519300002';
```

---

## Langkah 6: Drop Table Backup

**PENTING**: Langkah ini dilakukan setelah konfirmasi bahwa proses sudah berhasil dan data sudah benar.

```sql
-- Drop backup tables (lakukan setelah verifikasi lengkap)
DROP TABLE ra_interface_lines_all_bkp;
DROP TABLE ra_interface_salescredits_all_bkp;
```

### Query untuk Cek Backup
```sql
-- Cek backup sebelum drop
SELECT COUNT(*) FROM ra_interface_lines_all_bkp;
SELECT COUNT(*) FROM ra_interface_salescredits_all_bkp;

-- List all backup tables
SELECT table_name
FROM user_tables
WHERE table_name LIKE '%_BKP%'
ORDER BY table_name;
```

---

## Troubleshooting

### Error: Interface Line Not Created
**Solusi**: 
- Cek apakah line masih dalam status CLOSED di `oe_order_lines_all`
- Pastikan `invoice_interface_status_code` IS NULL
- Verifikasi `open_flag = 'Y'`

### Error: Wrong Customer Transaction Type
**Solusi**:
- Pastikan `cust_trx_type_id = 2` untuk Credit Memo
- Cek setup di `ra_cust_trx_types_all`

### Error: Missing Reference Line
**Solusi**:
- Verifikasi original invoice sudah ada di `ra_customer_trx_lines_all`
- Update `reference_line_id` dengan benar

### AutoInvoice Import Failed
**Solusi**:
- Cek log file program
- Verifikasi semua mandatory field sudah terisi
- Pastikan tidak ada duplicate di interface

---

## Catatan Penting

1. **Selalu backup data** sebelum melakukan datafix
2. **Test di environment development** terlebih dahulu
3. **Dokumentasikan setiap perubahan** yang dilakukan
4. **Koordinasi dengan team** sebelum eksekusi di production
5. **Verifikasi hasil** setelah setiap step
6. **Jangan drop backup** sebelum konfirmasi lengkap

---

## Referensi Tables

### Main Tables
- `oe_order_lines_all` - Order Management Lines
- `oe_order_headers_all` - Order Management Headers
- `ra_interface_lines_all` - AR Interface Lines
- `ra_interface_salescredits_all` - AR Interface Sales Credits
- `ra_customer_trx_all` - AR Customer Transactions
- `ra_customer_trx_lines_all` - AR Customer Transaction Lines
- `ra_cust_trx_types_all` - AR Transaction Types

### Important Columns
- `line_id` - Unique identifier untuk order line
- `header_id` - Unique identifier untuk order header
- `customer_trx_id` - Unique identifier untuk AR transaction
- `cust_trx_type_id` - Transaction type (2 = Credit Memo)
- `reference_line_id` - Link ke original invoice line
- `interface_line_attribute6` - Link antara interface dan order line

---

## Contact & Support

Untuk pertanyaan lebih lanjut mengenai kasus ini, hubungi:
- **Team**: Oracle EBS Support NSTI
- **Date**: 26 Juni 2025

---

*Dokumentasi ini dibuat berdasarkan actual case SO Return 2519300002*