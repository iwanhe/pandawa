# Naming Convention untuk Oracle EBS dan Oracle APEX

## 1. Oracle E-Business Suite (EBS)

### 1.1 Aplikasi dan Struktur Folder

| Object Type | Internal Naming Format | User Naming Format | Remarks |
|-------------|------------------------|-------------------|---------|
| Custom Application | XTD | Extended Application | - Folder name in APPL_TOP: XTD<br>- Base Path: XTD_TOP<br>- Report(.rdf) Path: $XTD_TOP/12.0.0/reports/US<br>- Form(.fmx) Path: $XTD_TOP/12.0.0/forms/US |

### 1.2 EBS Forms dan UI Components

| Object Type | Internal Naming Format | User Naming Format | Remarks |
|-------------|------------------------|-------------------|---------|
| Form | XTD_AAA_CCCC | XTD_AAA_CCCC | - XTD: default client's name<br>- AAA: application short name (GL, AP, dll)<br>- CCCC: specific name<br>**Example:** XTD_AP_SUPPLIER_SITES |
| Form Function | XTD_AAA_CCCC | XTD_AAA_CCCC | - XTD: default client's name<br>- AAA: application short name<br>- CCCC: specific name<br>**Example:** XTD_AP_SUPPLIER_SITES |
| Menu | XTD_AAA_CCCC | AAA CCCC | - XTD: default client's name<br>- AAA: application short name<br>- CCCC: specific name<br>**Example:** XTD_AP_SUPPLIER_SITES → XTD Supplier Site Register |
| Responsibility | XTD_NTI_AAA_CCCC | NTI - CCCC | - XTD: default client's name (Global)<br>- XTD_NTI: client's name (Specific)<br>- AAA: application short name<br>- CCCC: specific name<br>**Example:** XTD_NTI_AP_SUPER_USER → NTI - Payables Super User |
| Personalizations | XTD - CCCC | - | - XTD: default client's name<br>- CCCC: specific name<br>**Example:** XTD - Hide Button Submit |

### 1.3 EBS Concurrent Programs

| Object Type | Internal Naming Format | User Naming Format | Remarks |
|-------------|------------------------|-------------------|---------|
| Executable | XTD_AAA_CCCC | XTD_AAA_CCCC_EX | - XTD: default client's name<br>- AAA: application short name<br>- CCCC: specific name<br>**Example:** XTD_AP_LIST_SUPPLIER_SITES |
| Concurrent Program (Report) | XTD_AAA_CCCC | XXX - CCCC | - XXX: specific calling code for report/client's name<br>- AAA: application short name<br>- CCCC: specific name<br>**Example:** XTD_INV_SJ_ROKOK → 044 - Surat Jalan Rokok |
| Concurrent Program (Program) | XTD_AAA_CCCC | XTD - CCCC | **Example:** XTD_INV_RUN_PENJUALAN → XTD - Run Penjualan |
| Report Tableau | XTD_INV_PENJUALAN_TBL | - | - |

### 1.4 EBS Database Objects - Schema

| Object Type | Schema | Remarks |
|-------------|--------|---------|
| Schema | XTD | - For internal EBS custom objects<br>- main_tspace=APPS_TS_TX_DATA<br>- index_tspace=APPS_TS_TX_IDX<br>- temp_tspace=TEMP |
| Schema | EXT | - For dblink integration custom objects |

### 1.5 EBS Database Objects - Tables dan Views

| Object Type | Naming Format | Remarks |
|-------------|---------------|---------|
| Table | XTD_AAA_CCCC | - XTD: default client's name<br>- AAA: application short name<br>- CCCC: specific name<br>**Example:** XTD_AP_SUPPLIER_SITES |
| View | XTD_AAA_CCCC_V | - V: default suffix for view<br>**Example:** XTD_AP_SUPPLIER_SITES_V |
| Materialized View | XTD_AAA_CCCC_MV | - MV: default suffix for materialized view<br>**Example:** XTD_AP_SUPPLIER_SITES_MV |

### 1.6 EBS Database Objects - PL/SQL Objects

| Object Type | Naming Format | Remarks |
|-------------|---------------|---------|
| Sequence | XTD_AAA_CCCC_S | - S: default suffix for sequence<br>**Example:** XTD_AP_SUPPLIER_SITES_S |
| Package | XTD_AAA_CCCC_PKG | - PKG: default suffix for package<br>**Example:** XTD_AP_SUPPLIER_SITES_PKG |
| Function | XTD_AAA_CCCC_FNC | - FNC: default suffix for function<br>**Example:** XTD_AP_SUPPLIER_SITES_FNC |
| Procedure | XTD_AAA_CCCC_PRC | - PRC: default suffix for procedure<br>**Example:** XTD_AP_SUPPLIER_SITES_PRC |
| Trigger | XTD_AAA_CCCC_TRG | - TRG: default suffix for trigger<br>**Example:** XTD_AP_SUPPLIER_SITES_TRG |

### 1.7 EBS Database Objects - Indexes dan Lookup

| Object Type | Naming Format | Remarks |
|-------------|---------------|---------|
| Index | XTD_AAA_CCCC_[Un\|Nn] | - Un: suffix for unique index (n=1,2,3,...)<br>- Nn: suffix for non-unique index (n=1,2,3,...)<br>**Example:** XTD_AP_SUPPLIER_SITES_U1, XTD_AP_SUPPLIER_SITES_N1 |
| Value Set | XTD_AAA_CCCC_VS | - XTD: default client's name (Global)<br>- XTD_NTI: client's name (Specific)<br>- VS: default suffix for value set<br>**Example:** XTD_AP_SUPPLIER_SITES_VS, XTD_NTI_GL_ACCOUNT_VS |
| Lookup | XTD_AAA_CCCC_LK | - LK: default suffix for lookup<br>**Example:** XTD_AP_SUPPLIER_SITES_LK, XTD_NTI_GL_ACCOUNT_LK |

### 1.8 EBS Backup Objects

| Object Type | Naming Format | Remarks |
|-------------|---------------|---------|
| Backup | OLD_OBJECT_NAME_BKPyymmdd | - OLD_OBJECT_NAME: object name that want to backup<br>- BKP: default suffix for backup<br>- yymmdd: format date of the backup<br>**Example:** XTD_AP_SUPPLIER_TRG_BKP221201 |

---

## 2. Oracle APEX

### 2.1 APEX Schema

| Object Type | Schema | Remarks |
|-------------|--------|---------|
| Schema | APX | - For APEX custom external APPS objects<br>- main_tspace=APPS_TS_TX_DATA<br>- index_tspace=APPS_TS_TX_IDX<br>- temp_tspace=TEMP |

### 2.2 APEX Database Objects - Tables dan Views

| Object Type | Naming Format | Remarks |
|-------------|---------------|---------|
| Table | APX_AAAA_CCCC | - APX: default name<br>- AAAA: code for APEX APPS Name<br>- CCCC: specific name<br>**Example:** APX_PRISM_VENDORS_LIST |
| View | APX_AAAA_CCCC_V | - V: default suffix for view<br>**Example:** APX_PRISM_VENDORS_LIST_V |
| Materialized View | APX_AAAA_CCCC_MV | - MV: default suffix for materialized view<br>**Example:** APX_PRISM_VENDORS_LIST_MV |

### 2.3 APEX Database Objects - PL/SQL Objects

| Object Type | Naming Format | Remarks |
|-------------|---------------|---------|
| Sequence | APX_AAAA_CCCC_S | - S: default suffix for sequence<br>**Example:** APX_PRISM_VENDORS_LIST_S |
| Package | APX_AAAA_CCCC_PKG | - PKG: default suffix for package<br>**Example:** APX_PRISM_VENDORS_LIST_PKG |
| Function | APX_AAAA_CCCC_FNC | - FNC: default suffix for function<br>**Example:** APX_PRISM_VENDORS_LIST_FNC |
| Procedure | APX_AAAA_CCCC_PRC | - PRC: default suffix for procedure<br>**Example:** APX_PRISM_VENDORS_LIST_PRC |
| Trigger | APX_AAAA_CCCC_TRG | - TRG: default suffix for trigger<br>**Example:** APX_PRISM_VENDORS_LIST_TRG |

### 2.4 APEX Database Objects - Indexes dan Lookup

| Object Type | Naming Format | Remarks |
|-------------|---------------|---------|
| Index | APX_AAAA_CCCC_[Un\|Nn] | - Un: suffix for unique index (n=1,2,3,...)<br>- Nn: suffix for non-unique index (n=1,2,3,...)<br>**Example:** APX_PRISM_VENDOR_LIST_U1, APX_PRISM_VENDOR_LIST_N1 |
| Value Set | APX_AAAA_CCCC_VS | - VS: default suffix for value set<br>**Example:** APX_PRISM_VENDOR_LIST_VS, APX_PRISM_VENDOR_LOCATION_VS |
| Lookup | APX_AAAA_CCCC_LK | - LK: default suffix for lookup<br>**Example:** APX_PRISM_VENDOR_LIST_LK, APX_PRISM_VENDOR_LOCATION_LK |

### 2.5 APEX Backup Objects

| Object Type | Naming Format | Remarks |
|-------------|---------------|---------|
| Backup | OLD_OBJECT_NAME_BKPyymmdd | - OLD_OBJECT_NAME: object name that want to backup<br>- BKP: default suffix for backup<br>- yymmdd: format date of the backup<br>**Example:** APX_PRISM_VENDOR_LIST_TRG_BKP221201 |

---

## 3. Catatan Penting

### Prefix/Awalan:
- **Oracle EBS**: Menggunakan **XTD** sebagai default client's name (dapat disesuaikan dengan nama client spesifik seperti XTD_NTI)
- **Oracle APEX**: Menggunakan **APX** sebagai default prefix

### Kode Aplikasi (AAA/AAAA):
- **EBS**: Menggunakan standard application short name (GL untuk General Ledger, AP untuk Payables, dll)
- **APEX**: Menggunakan code untuk APEX APPS Name (misalnya PRISM)

### Suffix Standard:
- View: **_V**
- Materialized View: **_MV**
- Sequence: **_S**
- Package: **_PKG**
- Function: **_FNC**
- Procedure: **_PRC**
- Trigger: **_TRG**
- Index Unique: **_U**[n]
- Index Non-unique: **_N**[n]
- Value Set: **_VS**
- Lookup: **_LK**
- Backup: **_BKP**[yymmdd]

### Tablespace Configuration:
- **Main Tablespace**: APPS_TS_TX_DATA
- **Index Tablespace**: APPS_TS_TX_IDX
- **Temporary Tablespace**: TEMP

---

## 4. Quick Reference Guide

### Contoh Penamaan EBS:
```
Table:              XTD_AP_SUPPLIERS
View:               XTD_AP_SUPPLIERS_V
Materialized View:  XTD_AP_SUPPLIERS_MV
Sequence:           XTD_AP_SUPPLIERS_S
Package:            XTD_AP_SUPPLIERS_PKG
Function:           XTD_AP_SUPPLIERS_FNC
Procedure:          XTD_AP_SUPPLIERS_PRC
Trigger:            XTD_AP_SUPPLIERS_TRG
Index (Unique):     XTD_AP_SUPPLIERS_U1
Index (Non-unique): XTD_AP_SUPPLIERS_N1
Value Set:          XTD_AP_SUPPLIERS_VS
Lookup:             XTD_AP_SUPPLIERS_LK
Backup:             XTD_AP_SUPPLIERS_TRG_BKP241126
```

### Contoh Penamaan APEX:
```
Table:              APX_PRISM_CUSTOMERS
View:               APX_PRISM_CUSTOMERS_V
Materialized View:  APX_PRISM_CUSTOMERS_MV
Sequence:           APX_PRISM_CUSTOMERS_S
Package:            APX_PRISM_CUSTOMERS_PKG
Function:           APX_PRISM_CUSTOMERS_FNC
Procedure:          APX_PRISM_CUSTOMERS_PRC
Trigger:            APX_PRISM_CUSTOMERS_TRG
Index (Unique):     APX_PRISM_CUSTOMERS_U1
Index (Non-unique): APX_PRISM_CUSTOMERS_N1
Value Set:          APX_PRISM_CUSTOMERS_VS
Lookup:             APX_PRISM_CUSTOMERS_LK
Backup:             APX_PRISM_CUSTOMERS_TRG_BKP241126
```

---

**Document Version:** 1.0  
**Last Updated:** November 2024  
**Prepared for:** Oracle EBS and APEX Development Team