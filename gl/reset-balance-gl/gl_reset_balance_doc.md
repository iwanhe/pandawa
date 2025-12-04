# Dokumentasi Reset Balance GL di Oracle EBS

## Daftar Isi
1. [Ringkasan](#ringkasan)
2. [Prasyarat](#prasyarat)
3. [Identifikasi Ledger](#identifikasi-ledger)
4. [Prosedur Reset Balance](#prosedur-reset-balance)
5. [Verifikasi](#verifikasi)
6. [Catatan Penting](#catatan-penting)

---

## Ringkasan

Dokumen ini menjelaskan prosedur untuk mereset balance General Ledger (GL) di Oracle E-Business Suite (EBS). Proses ini melibatkan penghapusan balance periode tertentu dan mengubah status journal entries kembali ke Unposted.

**⚠️ PERINGATAN**: Proses ini akan mengubah data finansial yang sudah diposting. Pastikan Anda memiliki backup dan approval yang diperlukan sebelum menjalankan script ini.

---

## Prasyarat

### Persiapan Sebelum Eksekusi
1. **Backup Database**: Pastikan backup database sudah dilakukan
2. **Approval**: Dapatkan approval dari management dan finance team
3. **Test Environment**: Uji script di test environment terlebih dahulu
4. **User Privileges**: Pastikan memiliki privilege yang cukup untuk melakukan UPDATE dan DELETE
5. **Downtime**: Koordinasikan dengan user untuk menghindari transaksi selama proses reset

### Informasi yang Dibutuhkan
- Ledger ID yang akan direset
- Period name yang akan direset
- Chart of Accounts ID

---

## Identifikasi Ledger

### Daftar Ledger
Gunakan query berikut untuk melihat daftar ledger yang tersedia:

```sql
SELECT ledger_id, name, short_name, chart_of_accounts_id
FROM gl_ledgers
ORDER BY 1 ASC;
```

### Klasifikasi Ledger

**Ledger yang Tidak Perlu Dibersihin:**
- NCT (2029)
- ATI (2027)
- NSTI (2031)
- DNN (2041)
- VC (2021)

**Ledger yang Perlu Dibersihin:**
- NTI (2024) - Ledger ID: 2024, COA: 50389
- NNA (2037) - Ledger ID: 2037, COA: 50396
- KDK (2035) - Ledger ID: 2035, COA: 50394 (Close Period Saja)
- GLT (2033) - Ledger ID: 2033, COA: 50392 (Close Period Saja)
- MNM (2023) - Ledger ID: 2023, COA: 50391

---

## Prosedur Reset Balance

Berikut adalah langkah-langkah detail untuk melakukan reset balance GL. Contoh ini menggunakan **NNA_LEDGER (2037)** untuk periode 2024.

### Langkah 1: Verifikasi Data Awal

```sql
-- Cek jumlah record yang akan diproses
SELECT COUNT(*) 
FROM GL_BALANCES
WHERE period_name IN (
    'JAN-24', 'FEB-24', 'MAR-24', 'APR-24',
    'MAY-24', 'JUN-24', 'JUL-24', 'AUG-24',
    'SEP-24', 'OCT-24', 'NOV-24', 'DEC-24'
)
AND ledger_id = 2037;
```

### Langkah 2: Backup Tabel GL_BALANCES

```sql
-- Buat backup table
CREATE TABLE gl_balances_2037_bkp AS
SELECT * 
FROM GL_BALANCES
WHERE ledger_id = 2037;

-- Verifikasi backup
SELECT COUNT(*) 
FROM gl_balances_2037_bkp;
```

### Langkah 3: Delete GL_BALANCES

```sql
-- Hapus balance untuk periode yang akan direset
DELETE FROM GL_BALANCES
WHERE period_name IN (
    'JAN-24', 'FEB-24', 'MAR-24', 'APR-24',
    'MAY-24', 'JUN-24', 'JUL-24', 'AUG-24',
    'SEP-24', 'OCT-24', 'NOV-24', 'DEC-24'
)
AND ledger_id = 2037
AND actual_flag = 'A';

COMMIT;
```

### Langkah 4: Update GL_PERIOD_STATUSES

```sql
-- Cek status periode saat ini
SELECT * 
FROM GL_PERIOD_STATUSES
WHERE set_of_books_id = 2037
AND closing_status = 'O';

-- Update status periode menjadi Future ('F')
UPDATE gl_period_statuses
SET closing_status = 'F'
WHERE set_of_books_id = 2037
AND application_id = 101
AND period_name IN (
    'JAN-24', 'FEB-24', 'MAR-24', 'APR-24',
    'MAY-24', 'JUN-24', 'JUL-24', 'AUG-24',
    'SEP-24', 'OCT-24', 'NOV-24', 'DEC-24'
);

COMMIT;
```

**Keterangan Closing Status:**
- `O` = Open
- `C` = Closed
- `F` = Future
- `P` = Permanently Closed
- `N` = Never Opened

### Langkah 5: Update GL_JE_BATCHES

```sql
-- Cek status batch sebelum update
SELECT default_period_name, status, status_verified, COUNT(*) 
FROM GL_JE_BATCHES
WHERE default_period_name IN (
    'JAN-24', 'FEB-24', 'MAR-24', 'APR-24',
    'MAY-24', 'JUN-24', 'JUL-24', 'AUG-24',
    'SEP-24', 'OCT-24', 'NOV-24', 'DEC-24'
)
AND actual_flag = 'A'
AND chart_of_accounts_id = '50396'
GROUP BY default_period_name, status, status_verified;

-- Update batch status menjadi Unposted
UPDATE gl_je_batches
SET status = 'U',
    status_verified = 'N',
    posted_date = NULL,
    posting_run_id = NULL,
    request_id = NULL,
    budgetary_control_status = 'N',
    posted_by = NULL
WHERE default_period_name IN (
    'JAN-24', 'FEB-24', 'MAR-24', 'APR-24',
    'MAY-24', 'JUN-24', 'JUL-24', 'AUG-24',
    'SEP-24', 'OCT-24', 'NOV-24', 'DEC-24'
)
AND actual_flag = 'A'
AND chart_of_accounts_id = '50396'
AND status = 'P';

COMMIT;
```

**Keterangan Batch Status:**
- `P` = Posted
- `U` = Unposted
- `S` = Selected for Posting

### Langkah 6: Update GL_JE_HEADERS

```sql
-- Cek status header sebelum update
SELECT period_name, status, ledger_id, COUNT(*) 
FROM GL_JE_HEADERS 
WHERE period_name IN (
    'JAN-24', 'FEB-24', 'MAR-24', 'APR-24',
    'MAY-24', 'JUN-24', 'JUL-24', 'AUG-24',
    'SEP-24', 'OCT-24', 'NOV-24', 'DEC-24'
)
AND actual_flag = 'A'
AND ledger_id = 2037
GROUP BY period_name, status, ledger_id;

-- Update header status menjadi Unposted
UPDATE gl_je_headers
SET status = 'U',
    posted_date = NULL
WHERE period_name IN (
    'JAN-24', 'FEB-24', 'MAR-24', 'APR-24',
    'MAY-24', 'JUN-24', 'JUL-24', 'AUG-24',
    'SEP-24', 'OCT-24', 'NOV-24', 'DEC-24'
)
AND actual_flag = 'A'
AND ledger_id = '2037'
AND status = 'P';

COMMIT;
```

### Langkah 7: Update GL_JE_LINES

```sql
-- Cek status lines sebelum update
SELECT period_name, status, COUNT(*) 
FROM GL_JE_LINES 
WHERE period_name IN (
    'JAN-24', 'FEB-24', 'MAR-24', 'APR-24',
    'MAY-24', 'JUN-24', 'JUL-24', 'AUG-24',
    'SEP-24', 'OCT-24', 'NOV-24', 'DEC-24'
)
AND ledger_id = 2037
AND je_header_id IN (
    SELECT je_header_id 
    FROM gl_je_headers
    WHERE period_name IN (
        'JAN-24', 'FEB-24', 'MAR-24', 'APR-24',
        'MAY-24', 'JUN-24', 'JUL-24', 'AUG-24',
        'SEP-24', 'OCT-24', 'NOV-24', 'DEC-24'
    )
    AND actual_flag = 'A'
)
GROUP BY period_name, status;

-- Update lines status menjadi Unposted
UPDATE gl_je_lines
SET status = 'U'
WHERE period_name IN (
    'JAN-24', 'FEB-24', 'MAR-24', 'APR-24',
    'MAY-24', 'JUN-24', 'JUL-24', 'AUG-24',
    'SEP-24', 'OCT-24', 'NOV-24', 'DEC-24'
)
AND ledger_id = '2037'
AND status = 'P'
AND je_header_id IN (
    SELECT je_header_id
    FROM gl_je_headers
    WHERE period_name IN (
        'JAN-24', 'FEB-24', 'MAR-24', 'APR-24',
        'MAY-24', 'JUN-24', 'JUL-24', 'AUG-24',
        'SEP-24', 'OCT-24', 'NOV-24', 'DEC-24'
    )
    AND actual_flag = 'A'
    AND ledger_id = '2037'
);

COMMIT;
```

### Langkah 8: Update Latest Opened Period

```sql
-- Cek periode terakhir yang dibuka
SELECT latest_opened_period_name 
FROM GL_SETS_OF_BOOKS
WHERE set_of_books_id = 2037;

-- Update ke periode sebelumnya (misal: ADJ-AUD-23)
UPDATE GL_SETS_OF_BOOKS 
SET latest_opened_period_name = 'DEC-23' -- atau periode terakhir sebelum reset
WHERE set_of_books_id = 2037;

COMMIT;
```

---

## Verifikasi

Setelah proses reset selesai, lakukan verifikasi berikut:

### 1. Verifikasi GL_BALANCES
```sql
-- Pastikan tidak ada balance untuk periode yang direset
SELECT COUNT(*) 
FROM GL_BALANCES
WHERE period_name IN (
    'JAN-24', 'FEB-24', 'MAR-24', 'APR-24',
    'MAY-24', 'JUN-24', 'JUL-24', 'AUG-24',
    'SEP-24', 'OCT-24', 'NOV-24', 'DEC-24'
)
AND ledger_id = 2037;
-- Result harus 0
```

### 2. Verifikasi Journal Status
```sql
-- Cek status journal batches
SELECT default_period_name, status, COUNT(*) 
FROM GL_JE_BATCHES
WHERE chart_of_accounts_id = '50396'
AND status = 'U'
GROUP BY default_period_name, status;

-- Cek status journal headers
SELECT period_name, status, COUNT(*) 
FROM GL_JE_HEADERS
WHERE ledger_id = 2037
AND status = 'U'
GROUP BY period_name, status;
```

### 3. Verifikasi Period Status
```sql
SELECT period_name, closing_status, start_date, end_date
FROM GL_PERIOD_STATUSES
WHERE set_of_books_id = 2037
AND application_id = 101
ORDER BY start_date;
```

### 4. Verifikasi Latest Opened Period
```sql
SELECT latest_opened_period_name, name
FROM GL_SETS_OF_BOOKS
WHERE set_of_books_id = 2037;
```

---

## Catatan Penting

### Best Practices
1. **Backup**: Selalu buat backup sebelum menjalankan script
2. **Test Environment**: Jalankan di test environment terlebih dahulu
3. **Dokumentasi**: Catat semua perubahan yang dilakukan
4. **Timing**: Lakukan pada saat tidak ada user yang aktif
5. **Rollback Plan**: Siapkan rollback plan jika terjadi masalah

### Parameter yang Perlu Disesuaikan
Untuk setiap ledger, sesuaikan parameter berikut:
- `ledger_id` - ID dari ledger yang akan direset
- `set_of_books_id` - Set of Books ID (biasanya sama dengan ledger_id)
- `chart_of_accounts_id` - Chart of Accounts ID
- `period_name` - Periode yang akan direset
- `latest_opened_period_name` - Periode terakhir yang valid

### Tabel yang Terlibat
1. **GL_BALANCES** - Menyimpan balance untuk setiap periode
2. **GL_PERIOD_STATUSES** - Status pembukaan/penutupan periode
3. **GL_JE_BATCHES** - Header batch journal entry
4. **GL_JE_HEADERS** - Header individual journal entry
5. **GL_JE_LINES** - Detail lines journal entry
6. **GL_SETS_OF_BOOKS** - Master ledger/set of books

### Troubleshooting

**Problem: Error saat delete GL_BALANCES**
- Solution: Cek foreign key constraints, pastikan tidak ada proses yang sedang berjalan

**Problem: Update tidak berhasil karena constraint**
- Solution: Cek dependent records di tabel lain

**Problem: Periode tidak bisa dibuka setelah reset**
- Solution: Verifikasi GL_PERIOD_STATUSES dan pastikan latest_opened_period_name sudah benar

---

## Template Script untuk Ledger Lain

Untuk ledger lain, gunakan template berikut dengan mengganti parameter yang sesuai:

```sql
-- ================================
-- TEMPLATE RESET BALANCE GL
-- ================================
-- Ledger: [NAMA_LEDGER]
-- Ledger ID: [LEDGER_ID]
-- COA ID: [COA_ID]
-- Periode: [LIST_PERIODE]
-- ================================

-- 1. BACKUP
CREATE TABLE gl_balances_[LEDGER_ID]_bkp AS
SELECT * FROM GL_BALANCES WHERE ledger_id = [LEDGER_ID];

-- 2. DELETE BALANCES
DELETE FROM GL_BALANCES
WHERE period_name IN ([LIST_PERIODE])
AND ledger_id = [LEDGER_ID]
AND actual_flag = 'A';
COMMIT;

-- 3. UPDATE PERIOD STATUS
UPDATE gl_period_statuses
SET closing_status = 'F'
WHERE set_of_books_id = [LEDGER_ID]
AND application_id = 101
AND period_name IN ([LIST_PERIODE]);
COMMIT;

-- 4. UPDATE BATCHES
UPDATE gl_je_batches
SET status = 'U',
    status_verified = 'N',
    posted_date = NULL,
    posting_run_id = NULL,
    request_id = NULL,
    budgetary_control_status = 'N',
    posted_by = NULL
WHERE default_period_name IN ([LIST_PERIODE])
AND actual_flag = 'A'
AND chart_of_accounts_id = '[COA_ID]'
AND status = 'P';
COMMIT;

-- 5. UPDATE HEADERS
UPDATE gl_je_headers
SET status = 'U',
    posted_date = NULL
WHERE period_name IN ([LIST_PERIODE])
AND actual_flag = 'A'
AND ledger_id = '[LEDGER_ID]'
AND status = 'P';
COMMIT;

-- 6. UPDATE LINES
UPDATE gl_je_lines
SET status = 'U'
WHERE period_name IN ([LIST_PERIODE])
AND ledger_id = '[LEDGER_ID]'
AND status = 'P'
AND je_header_id IN (
    SELECT je_header_id
    FROM gl_je_headers
    WHERE period_name IN ([LIST_PERIODE])
    AND actual_flag = 'A'
    AND ledger_id = '[LEDGER_ID]'
);
COMMIT;

-- 7. UPDATE LATEST OPENED PERIOD
UPDATE GL_SETS_OF_BOOKS 
SET latest_opened_period_name = '[PERIODE_SEBELUMNYA]'
WHERE set_of_books_id = [LEDGER_ID];
COMMIT;
```

---

## Referensi

**Tabel Oracle GL yang Terlibat:**
- GL_BALANCES
- GL_PERIOD_STATUSES
- GL_JE_BATCHES
- GL_JE_HEADERS
- GL_JE_LINES
- GL_SETS_OF_BOOKS
- GL_LEDGERS

**Status Codes:**
- Journal Status: P (Posted), U (Unposted), S (Selected)
- Period Status: O (Open), C (Closed), F (Future), P (Permanently Closed), N (Never Opened)

---

**Dokumen ini dibuat berdasarkan script reset balance GL untuk Oracle E-Business Suite.**

**Last Updated:** December 2024

**Version:** 1.0