# Dokumentasi Oracle Bank Account Management APIs

## Daftar Isi
1. [Query Bank Account Level](#1-query-bank-account-level)
2. [Assign Bank Account to Supplier Site](#2-assign-bank-account-to-supplier-site)
3. [Assign Pay Groups to Supplier Site](#3-assign-pay-groups-to-supplier-site)
4. [Create Bank Account](#4-create-bank-account)
5. [Create Bank Branch](#5-create-bank-branch)

---

## 1. Query Bank Account Level

### Deskripsi
Query ini digunakan untuk menampilkan informasi bank account yang terdaftar di berbagai level dalam sistem Oracle EBS:
- Bank Account pada level Supplier Site
- Bank Account pada level Supplier
- Bank Account pada level Address + Operating Unit
- Bank Account pada level Address

### SQL Script

```sql
SELECT 'Bank Account At Supplier Site Level' Bank_Account_Level
  , sup.segment1
  , sup.vendor_name
  , epa.org_id
  , ss.vendor_site_code
  , NULL Party_Site_Code
  , eba.bank_account_num
  , piu.order_of_preference priority
  , eba.ext_bank_account_id
 FROM ap_suppliers sup
  , ap_supplier_sites_all ss
  , iby_external_payees_all epa
  , iby_pmt_instr_uses_all piu
  , iby_ext_bank_accounts eba
WHERE sup.vendor_id = ss.vendor_id
  AND ss.vendor_site_id = epa.supplier_site_id
  AND epa.ext_payee_id = piu.ext_pmt_party_id
  AND piu.instrument_id = eba.ext_bank_account_id

UNION

SELECT 'Bank Account at Supplier Level'
  , sup.segment1
  , sup.vendor_name
  , epa.org_id
  , NULL
  , NULL
  , eba.bank_account_num
  , piu.order_of_preference priority
  , eba.ext_bank_account_id
 FROM ap_suppliers sup
  , iby_external_payees_all epa
  , iby_pmt_instr_uses_all piu
  , iby_ext_bank_accounts eba
WHERE sup.party_id = epa.payee_party_id
  AND epa.ext_payee_id = piu.ext_pmt_party_id
  AND piu.instrument_id = eba.ext_bank_account_id
  AND supplier_site_id IS NULL
  AND party_site_id IS NULL

UNION

SELECT 'Bank Account at Address + Operating Unit Level'
  , sup.segment1
  , sup.vendor_name
  , epa.org_id
  , NULL
  , psite.party_site_name
  , eba.bank_account_num
  , piu.order_of_preference priority
  , eba.ext_bank_account_id
 FROM ap_suppliers sup
  , hz_party_sites psite
  , iby_external_payees_all epa
  , iby_pmt_instr_uses_all piu
  , iby_ext_bank_accounts eba
WHERE sup.party_id = psite.party_id
  AND psite.party_site_id = epa.party_site_id
  AND epa.ext_payee_id = piu.ext_pmt_party_id
  AND piu.instrument_id = eba.ext_bank_account_id
  AND supplier_site_id IS NULL
  AND epa.org_id IS NOT NULL

UNION

SELECT 'Bank Account at Address Level'
  , sup.segment1
  , sup.vendor_name
  , epa.org_id
  , NULL
  , psite.party_site_name
  , eba.bank_account_num
  , piu.order_of_preference priority
  , eba.ext_bank_account_id
 FROM ap_suppliers sup
  , hz_party_sites psite
  , iby_external_payees_all epa
  , iby_pmt_instr_uses_all piu
  , iby_ext_bank_accounts eba
WHERE sup.party_id = psite.party_id
  AND psite.party_site_id = epa.party_site_id
  AND epa.ext_payee_id = piu.ext_pmt_party_id
  AND piu.instrument_id = eba.ext_bank_account_id
  AND supplier_site_id IS NULL
  AND epa.org_id IS NULL
ORDER BY bank_account_num;
```

### Output Columns
- **Bank_Account_Level**: Level dari bank account
- **segment1**: Kode supplier
- **vendor_name**: Nama supplier
- **org_id**: Operating unit ID
- **vendor_site_code**: Kode site supplier
- **Party_Site_Code**: Kode party site
- **bank_account_num**: Nomor rekening bank
- **priority**: Urutan prioritas penggunaan
- **ext_bank_account_id**: ID eksternal bank account

### Tabel yang Digunakan
- `ap_suppliers`: Master data supplier
- `ap_supplier_sites_all`: Site supplier
- `iby_external_payees_all`: Data payee eksternal
- `iby_pmt_instr_uses_all`: Penggunaan instrumen pembayaran
- `iby_ext_bank_accounts`: Data bank account eksternal
- `hz_party_sites`: Data party site

---

## 2. Assign Bank Account to Supplier Site

### Deskripsi
Script PL/SQL ini digunakan untuk melakukan assignment bank account ke supplier site menggunakan API `IBY_DISBURSEMENT_SETUP_PUB.SET_PAYEE_INSTR_ASSIGNMENT`.

### PL/SQL Script

```sql
DECLARE
   l_rec_pmt_int_asig    iby_fndcpt_setup_pub.pmtinstrassignment_rec_type := NULL;
   l_rec_payeecontext    iby_disbursement_setup_pub.payeecontext_rec_type := NULL;
   l_num_party_id        NUMBER;
   l_num_vendor_id       NUMBER;
   l_num_assign_id       NUMBER;
   l_num_acct_id         NUMBER;
   l_num_branch_id       NUMBER;
   l_chr_return_status   VARCHAR2 (200)                                   := NULL;
   l_num_msg_count       NUMBER                                           := 0;
   l_chr_msg_data        VARCHAR2 (200)                                   := NULL;
   l_rec_response        iby_fndcpt_common_pub.result_rec_type            := NULL;
   l_msg                 VARCHAR2 (2000);
BEGIN
   DBMS_OUTPUT.put_line ('program start');
   
   -- Set payment instrument assignment attributes
   l_rec_pmt_int_asig.priority := 1;
   l_rec_pmt_int_asig.start_date := SYSDATE;
   l_rec_pmt_int_asig.instrument.instrument_type := 'BANKACCOUNT';
   l_rec_pmt_int_asig.instrument.instrument_id := 13996; -- EXT_BANK_ACCOUNT_ID
   
   -- Set payee context
   l_rec_payeecontext.party_id := 5509; -- ap_suppliers.party_id
   l_rec_payeecontext.payment_function := 'PAYABLES_DISB';
   l_rec_payeecontext.org_type := 'OPERATING_UNIT';
   l_rec_payeecontext.org_id := 81;
   l_rec_payeecontext.party_site_id := 5289; -- ap_supplier_sites_all.party_site_id
   l_rec_payeecontext.supplier_site_id := 269; -- ap_supplier_sites_all.vendor_site_id
   
   DBMS_OUTPUT.put_line ('api start');
   
   -- Call API to set payee instrument assignment
   iby_disbursement_setup_pub.set_payee_instr_assignment (
      p_api_version             => 1,
      p_init_msg_list           => fnd_api.g_true,
      p_commit                  => fnd_api.g_true,
      x_return_status           => l_chr_return_status,
      x_msg_count               => l_num_msg_count,
      x_msg_data                => l_chr_msg_data,
      p_payee                   => l_rec_payeecontext,
      p_assignment_attribs      => l_rec_pmt_int_asig,
      x_assign_id               => l_num_assign_id,
      x_response                => l_rec_response
   );
   
   COMMIT;
   
   -- Display results
   DBMS_OUTPUT.put_line ('l_chr_return_status: ' || l_chr_return_status);
   DBMS_OUTPUT.put_line ('l_num_msg_count: ' || l_num_msg_count);
   DBMS_OUTPUT.put_line ('l_chr_msg_data: ' || l_chr_msg_data);
   DBMS_OUTPUT.put_line ('l_num_assign_id: ' || l_num_assign_id);
   
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.put_line ('main exception.');
END;
```

### Parameter yang Perlu Diisi

#### l_rec_pmt_int_asig (Payment Instrument Assignment)
- **priority**: Prioritas assignment (biasanya 1)
- **start_date**: Tanggal mulai berlaku
- **instrument_type**: Tipe instrumen (BANKACCOUNT)
- **instrument_id**: ID bank account (dari `iby_ext_bank_accounts_v.EXT_BANK_ACCOUNT_ID`)

#### l_rec_payeecontext (Payee Context)
- **party_id**: Party ID dari supplier (`ap_suppliers.party_id`)
- **payment_function**: Function pembayaran (PAYABLES_DISB)
- **org_type**: Tipe organisasi (OPERATING_UNIT)
- **org_id**: Operating Unit ID
- **party_site_id**: Party Site ID (`ap_supplier_sites_all.party_site_id`)
- **supplier_site_id**: Vendor Site ID (`ap_supplier_sites_all.vendor_site_id`)

### Return Values
- **l_chr_return_status**: Status hasil eksekusi (S = Success)
- **l_num_msg_count**: Jumlah message
- **l_chr_msg_data**: Data message error (jika ada)
- **l_num_assign_id**: Assignment ID yang dibuat

---

## 3. Assign Pay Groups to Supplier Site

### Deskripsi
Script PL/SQL ini digunakan untuk melakukan assignment pay group ke supplier site menggunakan API `AP_VENDOR_PUB_PKG.UPDATE_VENDOR_SITE_PUBLIC`.

### PL/SQL Script

```sql
DECLARE
   l_msg_data                VARCHAR2 (20000);
   l_return_status           VARCHAR2 (100);
   l_msg_count               NUMBER;
   l_vendor_site_rec         apps.ap_vendor_pub_pkg.r_vendor_site_rec_type;
   l_location_id             NUMBER;
   l_object_version_number   NUMBER;
   l_message_int             NUMBER;
   l_vendor_site_id          NUMBER;
   p_api_version             NUMBER;
   p_init_msg_list           VARCHAR2 (200);
   p_commit                  VARCHAR2 (200);
   p_validation_level        NUMBER;
   x_return_status           VARCHAR2 (200);
   x_msg_count               NUMBER;
   x_msg_data                VARCHAR2 (200);
   lr_vendor_rec             apps.ap_vendor_pub_pkg.r_vendor_rec_type;
   lr_existing_vendor_rec    ap_suppliers%ROWTYPE;
   l_msg                     VARCHAR2 (200);
   p_vendor_id               NUMBER;
BEGIN
   -- Initialize apps context
   fnd_global.apps_initialize (1479, 20707, 201); -- user_id, resp_id, resp_appl_id
   
   -- Loop through supplier sites
   FOR j IN (SELECT vendor_id,
                    vendor_site_id,
                    org_id
               FROM ap_supplier_sites_all
              WHERE 1 = 1
                AND org_id = 81
                AND vendor_site_id = 226)
   LOOP
      -- Set multi-org context
      mo_global.set_policy_context ('S', 81); -- Org_ID
      mo_global.init ('SQLAP');
      fnd_client_info.set_org_context (81); -- Org_ID
      
      -- Reset variables
      l_return_status := NULL;
      l_msg_count := NULL;
      l_msg_data := NULL;
      l_vendor_site_rec := NULL;
      
      -- Set vendor site record
      l_vendor_site_id := j.vendor_site_id;
      l_vendor_site_rec.vendor_site_id := l_vendor_site_id;
      l_vendor_site_rec.pay_group_lookup_code := 'MDR_H2H'; -- Pay Group Code
      
      -- Call API to update vendor site
      ap_vendor_pub_pkg.update_vendor_site_public (
         p_api_version        => 1,
         x_return_status      => l_return_status,
         x_msg_count          => l_msg_count,
         x_msg_data           => l_msg_data,
         p_vendor_site_rec    => l_vendor_site_rec,
         p_vendor_site_id     => l_vendor_site_id
      );
      
      DBMS_OUTPUT.put_line ('hasil.vendor_site_id: ' || l_vendor_site_id);
      DBMS_OUTPUT.put_line ('hasil.status: ' || l_return_status);
      
      -- Handle error messages
      IF (l_return_status <> 'S') THEN
         IF l_msg_count >= 1 THEN
            FOR v_index IN 1 .. l_msg_count LOOP
               fnd_msg_pub.get (
                  p_msg_index       => v_index,
                  p_encoded         => 'F',
                  p_data            => l_msg_data,
                  p_msg_index_out   => l_message_int
               );
               l_msg_data := 'UPDATE_VENDOR_SITE ' || SUBSTR (l_msg_data, 1, 3900);
               DBMS_OUTPUT.put_line ('l_msg_data - ' || l_msg_data);
            END LOOP;
         END IF;
      ELSE
         DBMS_OUTPUT.put_line ('The API call ended with SUCCESS status');
         COMMIT;
      END IF;
      
      COMMIT;
   END LOOP;
END;
```

### Parameter yang Perlu Diisi

#### Inisialisasi Apps Context
```sql
fnd_global.apps_initialize (user_id, resp_id, resp_appl_id);
```
- **user_id**: User ID dari `fnd_user`
- **resp_id**: Responsibility ID dari `fnd_responsibility`
- **resp_appl_id**: Application ID

#### Multi-Org Context
```sql
mo_global.set_policy_context ('S', org_id);
```
- **org_id**: Operating Unit ID

#### Vendor Site Record
- **vendor_site_id**: ID dari supplier site yang akan diupdate
- **pay_group_lookup_code**: Kode pay group yang akan di-assign

### Query untuk Mencari User dan Responsibility

```sql
-- Find User ID
SELECT *
FROM fnd_user
WHERE user_name = 'NTI'; -- Returns user_id: 1479

-- Find Responsibility ID
SELECT *
FROM fnd_responsibility
WHERE responsibility_key LIKE 'PURCHASING%'; -- Returns resp_id: 20707
```

---

## 4. Create Bank Account

### Deskripsi
Script PL/SQL ini digunakan untuk membuat bank account baru untuk supplier menggunakan API `IBY_EXT_BANKACCT_PUB.CREATE_EXT_BANK_ACCT`.

### PL/SQL Script

```sql
SET serveroutput on;

DECLARE
   l_extbank_rec           iby_ext_bankacct_pub.extbankacct_rec_type;
   l_resp                  iby_fndcpt_common_pub.result_rec_type;
   l_joint_acct_owner_id   NUMBER;
   l_msg_data              VARCHAR2 (1000);
   l_msg_count             NUMBER;
   l_assign_id             NUMBER;
   l_return_status         VARCHAR2 (100);
   l_return_status1        VARCHAR2 (100);
   l_bank_account_id       NUMBER;
   l_party_id              NUMBER;
   l_api_version           NUMBER := 1;
   l_init_msg_list         VARCHAR2 (30) DEFAULT fnd_api.g_false;
   l_commit                VARCHAR2 (30) DEFAULT fnd_api.g_true;
   l_rec                   iby_ext_bankacct_pub.extbankacct_rec_type;
BEGIN
   -- Initialize message pub API
   fnd_msg_pub.initialize;
   
   -- Set bank account details
   l_rec.bank_account_num := '1380088866665'; -- Nomor Rekening
   l_rec.currency := 'IDR'; -- Mata Uang
   l_rec.alternate_acct_name := 'KLATEN'; -- Nama Alternatif (Cabang)
   
   -- Get bank and branch ID
   SELECT bank_party_id,
          branch_party_id
     INTO l_rec.bank_id,
          l_rec.branch_id
     FROM ce_bank_branches_v
    WHERE UPPER (bank_name) = UPPER ('MANDIRI')
      AND UPPER (bank_branch_name) = UPPER ('SUPPLIER');
   
   -- Get supplier party ID
   SELECT party_id
     INTO l_rec.acct_owner_party_id
     FROM ap_suppliers
    WHERE UPPER (vendor_name) = UPPER ('LOEMBOENG KAOS');
   
   -- Set additional details
   l_rec.country_code := 'ID'; -- Kode Negara
   l_rec.bank_account_name := 'UMI RETNOWATI ARWANTO'; -- Nama Pemilik Rekening
   
   -- Call API to create bank account
   iby_ext_bankacct_pub.create_ext_bank_acct (
      p_api_version            => l_api_version,
      p_init_msg_list          => l_init_msg_list,
      p_ext_bank_acct_rec      => l_rec,
      p_association_level      => 'S', -- S = Supplier Level
      p_supplier_site_id       => NULL,
      p_party_site_id          => NULL,
      p_org_id                 => NULL,
      p_org_type               => NULL,
      x_acct_id                => l_bank_account_id,
      x_return_status          => l_return_status,
      x_msg_count              => l_msg_count,
      x_msg_data               => l_msg_data,
      x_response               => l_resp
   );
   
   -- Display results
   DBMS_OUTPUT.put_line ('Bank Account ID: ' || l_bank_account_id);
   DBMS_OUTPUT.put_line ('Return Status: ' || l_return_status);
   
   -- Display error messages if any
   IF l_msg_count > 1 THEN
      FOR i IN 1 .. l_msg_count LOOP
         DBMS_OUTPUT.put_line (i || '. ' || 
            SUBSTR (fnd_msg_pub.get (p_encoded => fnd_api.g_false), 1, 255));
      END LOOP;
   END IF;
   
   -- Commit if successful
   IF (l_return_status = 'S') THEN
      COMMIT;
   END IF;
END;
```

### Parameter yang Perlu Diisi

#### Bank Account Record (l_rec)
- **bank_account_num**: Nomor rekening bank (wajib)
- **currency**: Kode mata uang (contoh: IDR, USD)
- **alternate_acct_name**: Nama alternatif rekening (biasanya diisi dengan nama cabang)
- **bank_id**: Bank Party ID (didapat dari query `ce_bank_branches_v`)
- **branch_id**: Branch Party ID (didapat dari query `ce_bank_branches_v`)
- **acct_owner_party_id**: Party ID dari supplier (didapat dari `ap_suppliers`)
- **country_code**: Kode negara (contoh: ID untuk Indonesia)
- **bank_account_name**: Nama pemilik rekening

#### Association Level
- **p_association_level**: Level asosiasi bank account
  - 'S' = Supplier Level
  - 'SS' = Supplier Site Level
  - 'A' = Address Level

### Query untuk Mendapatkan Bank dan Branch ID

```sql
-- Get Bank and Branch Party ID
SELECT bank_party_id,
       branch_party_id,
       bank_name,
       bank_branch_name
  FROM ce_bank_branches_v
 WHERE UPPER (bank_name) = UPPER ('MANDIRI')
   AND UPPER (bank_branch_name) = UPPER ('SUPPLIER');
```

### Query untuk Mendapatkan Supplier Party ID

```sql
-- Get Supplier Party ID
SELECT party_id,
       vendor_name,
       segment1
  FROM ap_suppliers
 WHERE UPPER (vendor_name) = UPPER ('LOEMBOENG KAOS');
```

### Return Values
- **x_acct_id**: Bank Account ID yang dibuat
- **x_return_status**: Status hasil eksekusi (S = Success)
- **x_msg_count**: Jumlah message error
- **x_msg_data**: Data message error

---

## 5. Create Bank Branch

### Deskripsi
Script PL/SQL ini digunakan untuk membuat bank branch baru menggunakan API `CE_BANK_PUB.CREATE_BANK_BRANCH`.

### PL/SQL Script

```sql
SET serveroutput on;

DECLARE
   l_api_version        NUMBER          := 1;
   l_init_msg_list      VARCHAR2 (30)   DEFAULT fnd_api.g_false;
   l_validation_level   NUMBER          DEFAULT fnd_api.g_valid_level_full;
   l_msg_data           VARCHAR2 (1000);
   l_msg_count          NUMBER;
   l_return_status      VARCHAR2 (100);
   l_branch_id          NUMBER;
   l_party_id           NUMBER;
   l_bank_id            NUMBER;
BEGIN
   -- Initialize message pub API
   fnd_msg_pub.initialize;
   
   -- Get Bank Party ID
   SELECT bank_party_id
     INTO l_bank_id
     FROM ce_banks_v
    WHERE UPPER (bank_name) = UPPER ('BNI');
   
   -- Call API to create bank branch
   ce_bank_pub.create_bank_branch (
      p_init_msg_list              => l_init_msg_list,
      p_bank_id                    => l_bank_id,
      p_branch_name                => 'SUPPLIER',
      p_branch_number              => NULL,
      p_branch_type                => NULL,
      p_alternate_branch_name      => NULL,
      p_description                => 'H2H_API',
      p_bic                        => NULL,
      p_eft_number                 => NULL,
      p_rfc_identifier             => NULL,
      p_attribute_category         => NULL,
      p_attribute1                 => NULL,
      p_attribute2                 => NULL,
      p_attribute3                 => NULL,
      p_attribute4                 => NULL,
      p_attribute5                 => NULL,
      p_attribute6                 => NULL,
      p_attribute7                 => NULL,
      p_attribute8                 => NULL,
      p_attribute9                 => NULL,
      p_attribute10                => NULL,
      p_attribute11                => NULL,
      p_attribute12                => NULL,
      p_attribute13                => NULL,
      p_attribute14                => NULL,
      p_attribute15                => NULL,
      p_attribute16                => NULL,
      p_attribute17                => NULL,
      p_attribute18                => NULL,
      p_attribute19                => NULL,
      p_attribute20                => NULL,
      p_attribute21                => NULL,
      p_attribute22                => NULL,
      p_attribute23                => NULL,
      p_attribute24                => NULL,
      x_branch_id                  => l_branch_id,
      x_return_status              => l_return_status,
      x_msg_count                  => l_msg_count,
      x_msg_data                   => l_msg_data
   );
   
   -- Display results
   DBMS_OUTPUT.put_line ('Branch ID: ' || l_branch_id);
   DBMS_OUTPUT.put_line ('Return Status: ' || l_return_status);
   DBMS_OUTPUT.put_line ('Message Data: ' || l_msg_data);
   
   -- Display error messages if any
   IF l_msg_count > 1 THEN
      FOR i IN 1 .. l_msg_count LOOP
         DBMS_OUTPUT.put_line (i || '. ' || 
            SUBSTR (fnd_msg_pub.get (p_encoded => fnd_api.g_false), 1, 255));
      END LOOP;
   END IF;
   
   -- Commit if successful
   IF (l_return_status = 'S') THEN
      COMMIT;
   END IF;
END;
```

### Parameter yang Perlu Diisi

#### Mandatory Parameters
- **p_bank_id**: Bank Party ID (didapat dari `ce_banks_v`)
- **p_branch_name**: Nama cabang bank (wajib)

#### Optional Parameters
- **p_branch_number**: Nomor cabang
- **p_branch_type**: Tipe cabang
- **p_alternate_branch_name**: Nama alternatif cabang
- **p_description**: Deskripsi cabang
- **p_bic**: Bank Identifier Code (SWIFT code)
- **p_eft_number**: Electronic Funds Transfer number
- **p_rfc_identifier**: RFC Identifier
- **p_attribute_category**: Kategori flexfield
- **p_attribute1** sampai **p_attribute24**: Descriptive flexfield attributes

### Query untuk Mendapatkan Bank ID

```sql
-- Get Bank Party ID
SELECT bank_party_id,
       bank_name,
       bank_number
  FROM ce_banks_v
 WHERE UPPER (bank_name) = UPPER ('BNI');
```

### Return Values
- **x_branch_id**: Branch ID yang dibuat
- **x_return_status**: Status hasil eksekusi (S = Success)
- **x_msg_count**: Jumlah message error
- **x_msg_data**: Data message error

---

## Catatan Penting

### Return Status
Semua API Oracle EBS menggunakan standar return status:
- **S**: Success - API berhasil dijalankan
- **E**: Error - Ada error dalam eksekusi
- **U**: Unexpected Error - Error yang tidak terduga

### Error Handling
Untuk mendapatkan detail error message:

```sql
IF l_msg_count > 0 THEN
   FOR i IN 1 .. l_msg_count LOOP
      DBMS_OUTPUT.put_line (
         fnd_msg_pub.get (
            p_msg_index => i,
            p_encoded   => fnd_api.g_false
         )
      );
   END LOOP;
END IF;
```

### Multi-Org Context
Untuk script yang menggunakan multi-org, pastikan untuk set context dengan benar:

```sql
mo_global.set_policy_context ('S', org_id);
mo_global.init ('SQLAP');
fnd_client_info.set_org_context (org_id);
```

### Commit
- Gunakan `p_commit => fnd_api.g_true` untuk auto commit
- Atau lakukan manual commit setelah cek return status = 'S'

---

## Referensi Tabel Utama

### Accounts Payable Tables
- `ap_suppliers`: Master data supplier
- `ap_supplier_sites_all`: Site supplier dengan multi-org
- `ap_supplier_sites`: Site supplier (single org view)

### Bank Tables
- `ce_banks_v`: View master bank
- `ce_bank_branches_v`: View bank branch
- `iby_ext_bank_accounts`: External bank accounts
- `iby_ext_bank_accounts_v`: View external bank accounts

### Payment Tables
- `iby_external_payees_all`: External payees
- `iby_pmt_instr_uses_all`: Payment instrument usage
- `iby_fndcpt_all_pmt_instrs_v`: View semua payment instruments

### Party Tables
- `hz_party_sites`: Party site information
- `hz_parties`: Master party data

---

## Tips dan Best Practices

1. **Selalu gunakan DBMS_OUTPUT.put_line** untuk debugging
2. **Set serveroutput ON** sebelum menjalankan script
3. **Backup data** sebelum melakukan mass update
4. **Test di environment development** terlebih dahulu
5. **Pastikan user memiliki privilege** yang cukup untuk menjalankan API
6. **Gunakan exception handling** untuk menangkap error
7. **Log semua perubahan** untuk audit trail
8. **Validasi data input** sebelum memanggil API

---

**Dokumen ini dibuat untuk keperluan dokumentasi Oracle EBS Bank Account Management APIs**

*Last Updated: 2024*