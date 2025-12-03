# XX_AP_PAY_SINGLE_INVOICE_PKG - Documentation

## Overview

Package ini merupakan custom Oracle EBS Accounts Payable package yang digunakan untuk melakukan pembayaran invoice secara individual (single invoice payment). Package ini merupakan customization dari standard Oracle AP package.

---

## Package Specification (`.pks`)

### Package Name
`XX_AP_PAY_SINGLE_INVOICE_PKG`

### Authorization
`AUTHID CURRENT_USER`

### Main Procedure

#### `AP_Pay_Invoice_In_Full`

Procedure ini digunakan untuk membayar invoice secara penuh dengan berbagai parameter pembayaran.

**Parameters:**

| Parameter | Type | Mode | Default | Description |
|-----------|------|------|---------|-------------|
| `p_api_version` | NUMBER | IN | - | Versi API yang digunakan |
| `p_init_msg_list` | VARCHAR2 | IN | - | Flag untuk inisialisasi message list |
| `p_invoice_id` | NUMBER | IN | - | ID Invoice yang akan dibayar |
| `p_payment_type_flag` | VARCHAR2 | IN | - | Tipe pembayaran (Q=Quick, M=Manual, R=Refund) |
| `p_internal_bank_acct_id` | NUMBER | IN | - | ID Bank Account internal |
| `p_payment_method_code` | VARCHAR2 | IN | - | Kode metode pembayaran |
| `p_payment_profile_id` | NUMBER | IN | - | ID Payment Profile |
| `p_payment_document_id` | NUMBER | IN | - | ID Payment Document |
| `p_take_discount` | VARCHAR2 | IN | 'Y' | Flag untuk mengambil diskon |
| `p_check_date` | DATE | IN | - | Tanggal pembayaran |
| `p_doc_category_code` | VARCHAR2 | IN | - | Kode kategori dokumen |
| `p_exchange_rate_type` | VARCHAR2 | IN | - | Tipe exchange rate |
| `p_exchange_rate` | NUMBER | IN | - | Nilai exchange rate |
| `p_exchange_date` | DATE | IN | - | Tanggal exchange rate |
| `x_return_status` | VARCHAR2 | OUT | - | Status return (S=Success, E=Error) |
| `x_msg_count` | NUMBER | OUT | - | Jumlah pesan error |
| `x_msg_data` | VARCHAR2 | OUT | - | Data pesan error |
| `x_errorIds` | trxnErrorIdsTab | OUT | - | Table of error IDs dari IBY |

---

## Package Body (`.pkb`)

### Global Constants

```sql
G_PKG_NAME              := 'AP_PAY_SINGLE_INVOICE_PKG'
G_MSG_UERROR            := FND_MSG_PUB.G_MSG_LVL_UNEXP_ERROR
G_MSG_ERROR             := FND_MSG_PUB.G_MSG_LVL_ERROR
G_MSG_SUCCESS           := FND_MSG_PUB.G_MSG_LVL_SUCCESS
G_LINES_PER_FETCH       := 1000
G_CURRENT_RUNTIME_LEVEL := 1
```

### Internal Procedures

#### `print_debuginfo`

Procedure untuk logging dan debugging.

**Parameters:**
- `p_module` - Nama module
- `p_debug_text` - Text debug
- `p_debug_level` - Level debug

---

## Process Flow

### 1. **Validasi API Version**
   - Memeriksa kompatibilitas API version

### 2. **Retrieve Invoice Information**
   - Query dari `ap_invoices_ready_to_pay_v`
   - Validasi invoice dapat dibayar
   - Mengambil informasi: vendor, site, currency, payment method, org

### 3. **System Parameters Validation**
   - Mengambil parameter dari `ap_system_parameters_all`
   - Memeriksa base currency, exchange rate settings
   - Validasi GL period

### 4. **Bank Account Validation**
   - Validasi internal bank account dari `ce_bank_accounts`
   - Memeriksa account masih aktif dan enabled untuk AP

### 5. **Exchange Rate Handling**
   - Jika currency berbeda dari base currency:
     - Validasi exchange rate type
     - Calculate exchange rate jika bukan USER type
     - Validasi mandatory exchange rate

### 6. **Payment Batch Check**
   - Memastikan invoice tidak sedang diproses di batch payment
   - Query ke `ap_selected_invoices_all`

### 7. **Supplier/Site Validation**
   - Memeriksa `hold_all_payments_flag`
   - Validasi pay site aktif
   - Mengambil address information dari `hz_locations`

### 8. **Payment Profile Validation**
   - Validasi payment profile dari `iby_payment_profiles`
   - Memeriksa processing type (PRINTED/ELECTRONIC)
   - Validasi payment document jika diperlukan

### 9. **Payment Document Validation**
   - Validasi payment document tidak terkunci oleh batch
   - Mengambil next check number
   - Call `IBY_DISBURSE_UI_API_PUB_PKG.Validate_Paper_Doc_Number`

### 10. **Payment Method Validation**
   - Query dari `iby_payment_methods_vl`
   - Memeriksa bills payable support
   - Calculate maturity date jika bills payable

### 11. **Document Sequencing**
   - **Profile Option**: `UNIQUE:SEQ_NUMBERS` (P=Partial, A=Always)
   - Validasi document category code
   - Generate sequence number menggunakan `fnd_seqnum` package
   - **Custom Code Addition** (by Anıl Altunkan):
     ```sql
     -- Set check number to -1 if:
     -- 1. No next check number
     -- 2. Sequence profile is 'P' (Partial)
     -- 3. No document category provided
     if l_next_check_number is null 
        and l_seq_num_profile in ('P') 
        and p_doc_category_code is null then
       l_next_check_number := -1;
     end if;
     ```

### 12. **Lock Invoice**
   - Lock invoice row menggunakan `AP_INVOICES_PKG.LOCK_ROW`

### 13. **Calculate Payment Amount**
   - Call `AP_PAY_IN_FULL_PKG.AP_Get_Check_Amount`
   - Calculate base amount jika multi-currency
   - Apply discount jika `p_take_discount = 'Y'`

### 14. **Generate Check ID**
   - Get dari sequence `ap_checks_s.nextval`
   - Generate checkrun name untuk Quick Check

### 15. **Insert Check Record**
   - Call `AP_CHECKS_PKG.Insert_Row`
   - Insert ke `ap_checks_all` dengan semua informasi payment
   - Status: NEGOTIABLE atau ISSUED (untuk bills payable)

### 16. **Insert Payment History**
   - Call `AP_RECONCILIATION_PKG.insert_payment_history`
   - Transaction type: 'PAYMENT CREATED' atau 'REFUND RECORDED'
   - Generate accounting event ID

### 17. **Create Payment Schedules**
   - Call `AP_PAY_IN_FULL_PKG.AP_Create_Payments`
   - Create payment schedules
   - Apply withholding distributions
   - Create interest invoices jika applicable

### 18. **Submit to IBY (Internet Banking)**
   - Call `IBY_DISBURSE_SINGLE_PMT_PKG.submit_single_payment`
   - Hanya untuk Quick (Q) dan Manual (M) payments
   - Parameter key:
     - `p_is_manual_payment_flag`: 'N' untuk Quick, 'Y' untuk Manual
     - `p_override_pmt_complete_pt`: 'Y'
     - `p_calling_app_payreq_cd`: Checkrun name
   - **Bug Fix 5982788**: Update checkrun_name sebelum submit
     - Quick: Menggunakan checkrun_name yang sudah di-generate
     - Manual: Set checkrun_name = check_id

### 19. **Update Check with Payment ID**
   - Update `ap_checks_all` dengan `payment_id` dari IBY
   - Update check_number jika berbeda (dari paper_doc_num atau pmt_ref_num)

---

## Custom Code Modifications

### 1. Check Number Handling (by Anıl Altunkan)

**Location**: Line ~1150 in package body

**Purpose**: Handle scenario saat tidak ada check number yang di-generate tetapi sequence numbering profile adalah 'Partial' dan tidak ada document category yang diberikan.

**Code**:
```sql
--start of the custom code Anıl Altunkan
if l_next_check_number is null 
   and l_seq_num_profile in ('P') 
   and p_doc_category_code is null then
  l_next_check_number := -1;
end if;
--end of the custom code Anıl Altunkan
```

**Impact**:
- Mencegah error saat insert ke `ap_checks_all` dengan check_number NULL
- Menggunakan -1 sebagai placeholder untuk check number
- Hanya berlaku untuk Partial sequence numbering tanpa document category

---

## Key Tables Used

### Input/Validation Tables
- `ap_invoices_ready_to_pay_v` - Invoice yang siap dibayar
- `ap_invoices_all` - Master invoice data
- `ap_system_parameters_all` - System parameters
- `ap_suppliers` - Supplier master
- `ap_supplier_sites_all` - Supplier site data
- `hz_locations` - Address information
- `hz_parties` - Party information
- `ce_bank_accounts` - Bank account data
- `ce_bank_acct_uses_all` - Bank account usage
- `ce_payment_documents` - Payment documents
- `iby_payment_profiles` - Payment profiles
- `iby_payment_methods_vl` - Payment methods
- `ap_selected_invoices_all` - Selected invoices (batch check)
- `gl_period_statuses` - GL periods

### Output Tables
- `ap_checks_all` - Payment/check header
- `ap_invoice_payments_all` - Invoice payment schedules
- `ap_payment_history_all` - Payment history/accounting
- `iby_payments_all` - IBY payment data (via API)

---

## Error Handling

### Standard Error Messages

| Message Name | Description |
|--------------|-------------|
| `AP_PERIOD_NOT_OPEN` | GL Period tidak open untuk tanggal payment |
| `AP_CE_INVALID_BANK_ACCT` | Bank account tidak valid |
| `AP_NO_USER_XRATE` | Exchange rate diperlukan untuk USER type |
| `AP_NO_XRATE` | Exchange rate tidak ditemukan (mandatory) |
| `AP_INVOICE_CANNOT_BE_PAID` | Invoice tidak dapat dibayar |
| `AP_MISMATCHED_PMT_SCHEDS` | Payment schedule memiliki metode berbeda |
| `AP_INV_PAY_FAIL_SEL_BY_BATCH` | Invoice sedang diproses di batch |
| `AP_NO_VENDOR_SITE` | Vendor site tidak ditemukan/tidak aktif |
| `AP_IBY_INVALID_PAYMENT_PROF` | Payment profile tidak valid |
| `AP_CE_PAYMENT_DOC_NEEDED` | Payment document diperlukan |
| `AP_PAY_DOCUMENT_ALREADY_IN_USE` | Payment document sudah digunakan |
| `AP_PAY_NO_VENDOR` | Vendor tidak ditemukan |
| `AP_IBY_INVALID_PAYMENT_METHOD` | Payment method tidak valid |
| `AP_SEQ_NO_DOC_CAT` | Document category tidak valid |
| `AP_SEQ_DOC_CAT_NO_FOUND` | Document category tidak ditemukan |
| `AP_SEQ_DOC_NO_REQ` | Document sequence tidak diperlukan |
| `AP_SEQ_CREATE_ERROR` | Error generate sequence number |

### Exception Handling
- `NO_DATA_FOUND` - Data tidak ditemukan
- `TOO_MANY_ROWS` - Multiple rows ditemukan (payment schedule mismatch)
- `OTHERS` - Unexpected errors

---

## Dependencies

### Oracle Standard Packages
- `FND_API` - API framework
- `FND_MSG_PUB` - Message handling
- `FND_LOG` - Logging
- `FND_FILE` - File output
- `FND_GLOBAL` - Global variables
- `FND_PROFILE` - Profile options
- `FND_MESSAGE` - Message dictionary
- `FND_SEQNUM` - Document sequencing

### AP Packages
- `AP_INVOICES_PKG` - Invoice operations
- `AP_CHECKS_PKG` - Check operations
- `AP_PAY_IN_FULL_PKG` - Payment in full logic
- `AP_RECONCILIATION_PKG` - Payment history/reconciliation
- `AP_UTILITIES_PKG` - Utility functions

### CE/IBY Packages
- `CE_BANK_AND_ACCOUNT_VALIDATION` - Bank validation
- `IBY_DISBURSE_SINGLE_PMT_PKG` - Single payment disbursement
- `IBY_DISBURSE_UI_API_PUB_PKG` - Payment UI APIs

### GL Packages
- `GL_CURRENCY_API` - Currency conversion

---

## Usage Example

```sql
DECLARE
  l_return_status  VARCHAR2(1);
  l_msg_count      NUMBER;
  l_msg_data       VARCHAR2(4000);
  l_error_ids      IBY_DISBURSE_SINGLE_PMT_PKG.trxnErrorIdsTab;
BEGIN
  XX_AP_PAY_SINGLE_INVOICE_PKG.AP_Pay_Invoice_In_Full(
    p_api_version           => 1.0,
    p_init_msg_list         => FND_API.G_TRUE,
    p_invoice_id            => 123456,
    p_payment_type_flag     => 'Q',  -- Quick Payment
    p_internal_bank_acct_id => 789,
    p_payment_method_code   => 'CHECK',
    p_payment_profile_id    => 456,
    p_payment_document_id   => 111,
    p_take_discount         => 'Y',
    p_check_date            => SYSDATE,
    p_doc_category_code     => 'AP_PAYMENT',
    p_exchange_rate_type    => 'Corporate',
    p_exchange_rate         => NULL,
    p_exchange_date         => SYSDATE,
    x_return_status         => l_return_status,
    x_msg_count             => l_msg_count,
    x_msg_data              => l_msg_data,
    x_errorIds              => l_error_ids
  );
  
  IF l_return_status = FND_API.G_RET_STS_SUCCESS THEN
    DBMS_OUTPUT.PUT_LINE('Payment created successfully');
    COMMIT;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Error: ' || l_msg_data);
    ROLLBACK;
  END IF;
END;
```

---

## Payment Type Flags

| Flag | Description | Manual Flag | Checkrun Name |
|------|-------------|-------------|---------------|
| `Q` | Quick Payment | N | QUICKCHECK ID + check_id |
| `M` | Manual Payment | Y | check_id |
| `R` | Refund Payment | - | Varies |

---

## Important Notes

### 1. Document Sequencing
- Profile `UNIQUE:SEQ_NUMBERS` menentukan behavior:
  - `A` (Always) - Sequence wajib
  - `P` (Partial) - Sequence optional
  - Empty - No sequencing
- Document category bisa di-override jika `pay_doc_override = 'Y'`

### 2. Multi-Currency
- Exchange rate wajib jika currency ≠ base currency
- User exchange rate wajib diisi manual
- System akan calculate exchange rate untuk type lain

### 3. Bills Payable
- Payment method dengan `support_bills_payable_flag = 'Y'`
- Status check: 'ISSUED' (bukan 'NEGOTIABLE')
- Maturity date = check_date + offset_days

### 4. IBY Integration
- Payment ID di-generate oleh IBY
- Check number bisa berubah setelah IBY processing
- Manual payment flag berbeda untuk Quick vs Manual

### 5. Bug Fixes
- **Bug 5982788**: Checkrun name handling untuk IBY submission
- **Bug 12971160**: Bank account ID vs bank_acct_use_id
- **Bug 19047932**: Accounting event ID retrieval

---

## Technical Specifications

### Version Information
- Header Version: `120.6 2006/02/23`
- Body Version: `120.14.12010000.3 2014/07/01`

### Performance Considerations
- Single invoice payment (not batch)
- Locks invoice row during processing
- Synchronous IBY submission
- Commits handled by calling program

### Security
- `AUTHID CURRENT_USER` - Uses invoker rights
- User ID tracked in audit columns
- Organization-level security via `org_id`

---

## Troubleshooting Guide

### Common Issues

#### 1. ORA-03120 Error (Integer Overflow)
**Possible Causes:**
- Large numeric values exceeding data type capacity
- Client/server version mismatch
- Character set conversion issues

**Solution:**
- Check numeric column values
- Verify Oracle client/server compatibility
- Review data in `ap_checks_all` for overflow

#### 2. Payment Not Created
**Check:**
- Invoice status in `ap_invoices_ready_to_pay_v`
- GL period open status
- Bank account enabled for AP
- Payment holds
- Selected invoices in batch

#### 3. Check Number Issues
**Scenarios:**
- `l_next_check_number IS NULL` → Custom code sets to -1
- Payment document locked → NO_DATA_FOUND exception
- IBY returns different number → Updated after creation

#### 4. Exchange Rate Errors
**Validate:**
- Exchange rate type exists
- Rate exists for currency pair and date
- User rate provided if type = 'User'
- Mandatory flag setting

---

## Change History

| Date | Bug/Change | Description |
|------|------------|-------------|
| 2006/02/23 | Version 120.6 | Initial specification |
| 2014/07/01 | Version 120.14 | Current body version |
| Unknown | Bug 2842080 | Original bug fix |
| Unknown | Bug 3343314 | Payment history fix |
| Unknown | Bug 5007576 | Doc sequencing rewrite |
| Unknown | Bug 5982788 | Checkrun name handling |
| Unknown | Bug 12971160 | Bank account ID fix |
| Unknown | Bug 19047932 | Accounting event ID fix |
| Unknown | Custom | Check number -1 logic (Anıl Altunkan) |

---

## Contact & Support

For issues or questions regarding this custom package:
- Review standard Oracle AP documentation
- Check MOS (My Oracle Support) for related patches
- Consult with Oracle EBS functional team for business logic
- Contact technical team for customization questions

---

**Document Version**: 1.0  
**Last Updated**: December 2024  
**Author**: System Documentation  
**Classification**: Technical Documentation