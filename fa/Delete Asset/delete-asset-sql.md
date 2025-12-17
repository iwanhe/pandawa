# How To Delete Asset using SQL Script

**Created by:** Iwan Herdian  
**Modified:** Fri, 24 Feb, 2023 at 8:09 AM  
**Release:** 10.4 or later

## Overview

This document contains the SQL script to delete all data for one asset in all the books within Oracle Fixed Assets (FA).

## Important Warnings ⚠️

**CAUTION:** Before running this script, please understand the following:

1. **This is an IRREVERSIBLE procedure** - Once executed and committed, the data cannot be recovered
2. **GL Manual Adjustments Required** - If the asset has been posted to General Ledger, manual adjustments in GL are needed to maintain data integrity
3. **Permanent Audit Trail Loss** - The audit trail for this asset will be PERMANENTLY lost. The reports produced prior to running this script should not be used anymore
4. **AP Link Loss** - If the asset was created from Account Payables via Mass Additions, the link between the asset and the invoice in AP will be LOST
5. **Rollback Option** - You may do ROLLBACK if you feel that something was not done correctly. You may also use Control-C anytime to interrupt the script

## How to Run

To run from command line:

```bash
sqlplus fa/ @del_asset
```

Then enter the asset number when prompted.

## SQL Script

```sql
REM 
REM  Name : del_asset.sql 
REM  Release : 10.4 or later 
  
REM  This script deletes all data for one asset in all the books. 
REM  To run from command line, do:  
REM   sqlplus fa/ @del_asset 
REM  and enter the asset number. 
 
REM  CAUTION : 
REM  1) This is an IRREVERSIBLE procedure. 
REM  2) If the asset has been posted to General Ledger, manual adjustments in   
REM     GL are needed to maintain data integrity. 
REM  3) The audit trail for this asset will be PERMANENTLY lost.  The reports 
REM     produced prior to running this script should not be used anymore. 
REM  4) If the asset was created from Account Payables via Mass Additions, the  
REM     link between the asset and the invoice in AP will be LOST. 
REM  5) You may do ROLLBACK if you feel that something was not done correctly.  
REM 
 
PROMPT CAUTION : 
PROMPT 1) This is an IRREVERSIBLE procedure. 
PROMPT 2) If the asset has been posted to General Ledger, manual adjustments in 
PROMPT    GL are needed to maintain data integrity. 
PROMPT 3) The audit trail for this asset will be PERMANENTLY lost.  The reports 
PROMPT    produced prior to running this script should not be used anymore. 
PROMPT 4) If the asset was created from Account Payables via Mass Additions, the 
PROMPT    link between the asset and the invoice in AP will be LOST. 
PROMPT 5) You may do ROLLBACK if you feel that something was not done correctly. 
PROMPT    You may also use Control-C anytime to interrupt the script. 
 
SELECT ASSET_ID FROM FA_ADDITIONS_B 
WHERE ASSET_NUMBER = '&ASSET_NUMBER'; 
 
DELETE FROM FA_INVOICE_TRANSACTIONS 
WHERE INVOICE_TRANSACTION_ID IN ( SELECT INVOICE_TRANSACTION_ID_IN 
                                    FROM FA_ASSET_INVOICES 
                                   WHERE ASSET_ID = &&ASSET_ID ) 
  OR INVOICE_TRANSACTION_ID IN ( SELECT INVOICE_TRANSACTION_ID_OUT 
                                   FROM FA_ASSET_INVOICES 
                                  WHERE ASSET_ID = &&ASSET_ID ); 
 
DELETE FROM FA_TRANSFER_DETAILS 
WHERE DISTRIBUTION_ID IN ( SELECT FDH.DISTRIBUTION_ID 
                             FROM FA_DISTRIBUTION_HISTORY FDH 
                            WHERE ASSET_ID = &&ASSET_ID ); 
 
DELETE FROM FA_ACE_BOOKS WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_ADDITIONS_B WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_ADJUSTMENTS WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_ASSET_HISTORY WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_ASSET_INVOICES WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_BALANCES_REPORT WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_BOOKS WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_CAPITAL_BUDGET WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_DEFERRED_DEPRN WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_DEPRN_DETAIL WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_DEPRN_SUMMARY WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_DISTRIBUTION_HISTORY WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_MASS_REVALUATION_RULES WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_PERIODIC_PRODUCTION WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_RESERVE_LEDGER WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_RETIREMENTS WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_TRANSACTION_HEADERS WHERE ASSET_ID = &&ASSET_ID; 

DELETE FROM FA_BOOKS_SUMMARY WHERE ASSET_ID = &&ASSET_ID;

-- Multi-Currency (MC) Tables

DELETE FROM FA_MC_ADJUSTMENTS WHERE ASSET_ID = &&ASSET_ID; 
  
DELETE FROM FA_MC_ASSET_INVOICES WHERE ASSET_ID = &&ASSET_ID; 
  
DELETE FROM FA_MC_BOOKS WHERE ASSET_ID = &&ASSET_ID; 
  
DELETE FROM FA_MC_DEPRN_DETAIL WHERE ASSET_ID = &&ASSET_ID; 
 
DELETE FROM FA_MC_DEPRN_SUMMARY WHERE ASSET_ID = &&ASSET_ID; 
    
DELETE FROM FA_MC_BOOKS_SUMMARY WHERE ASSET_ID = &&ASSET_ID;
 
DELETE FROM FA_MC_RETIREMENTS WHERE ASSET_ID = &&ASSET_ID; 

undef asset_id
```

## Tables Affected

This script will delete records from the following tables:

### Core FA Tables
- FA_ADDITIONS_B
- FA_ADJUSTMENTS
- FA_ASSET_HISTORY
- FA_ASSET_INVOICES
- FA_BALANCES_REPORT
- FA_BOOKS
- FA_BOOKS_SUMMARY
- FA_CAPITAL_BUDGET
- FA_DEFERRED_DEPRN
- FA_DEPRN_DETAIL
- FA_DEPRN_SUMMARY
- FA_DISTRIBUTION_HISTORY
- FA_INVOICE_TRANSACTIONS
- FA_MASS_REVALUATION_RULES
- FA_PERIODIC_PRODUCTION
- FA_RESERVE_LEDGER
- FA_RETIREMENTS
- FA_TRANSACTION_HEADERS
- FA_TRANSFER_DETAILS
- FA_ACE_BOOKS

### Multi-Currency (MC) Tables
- FA_MC_ADJUSTMENTS
- FA_MC_ASSET_INVOICES
- FA_MC_BOOKS
- FA_MC_BOOKS_SUMMARY
- FA_MC_DEPRN_DETAIL
- FA_MC_DEPRN_SUMMARY
- FA_MC_RETIREMENTS

## Source

Original documentation: [Oracle FA Documentation](https://sites.google.com/site/jazzurhytm/documentation/fixed-asset/howtodeleteassetinoraclefa)

---

**Document Source:** https://iwanherdian.freshdesk.com/support/solutions/articles/151000046575-how-to-delete-asset-using-sql-script