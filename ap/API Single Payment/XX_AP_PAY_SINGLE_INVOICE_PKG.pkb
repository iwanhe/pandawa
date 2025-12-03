CREATE OR REPLACE PACKAGE BODY APPS.XX_AP_PAY_SINGLE_INVOICE_PKG AS
/* $Header: appayinb.pls 120.14.12010000.3 2014/07/01 12:35:32 kbharath ship $ */

--
-- Declare global variables
--
G_PKG_NAME CONSTANT VARCHAR2(30) := 'AP_PAY_SINGLE_INVOICE_PKG';
G_MSG_UERROR        CONSTANT NUMBER := FND_MSG_PUB.G_MSG_LVL_UNEXP_ERROR;
G_MSG_ERROR         CONSTANT NUMBER := FND_MSG_PUB.G_MSG_LVL_ERROR;
G_MSG_SUCCESS       CONSTANT NUMBER := FND_MSG_PUB.G_MSG_LVL_SUCCESS;
G_MSG_HIGH          CONSTANT NUMBER := FND_MSG_PUB.G_MSG_LVL_DEBUG_HIGH;
G_MSG_MEDIUM        CONSTANT NUMBER := FND_MSG_PUB.G_MSG_LVL_DEBUG_MEDIUM;
G_MSG_LOW           CONSTANT NUMBER := FND_MSG_PUB.G_MSG_LVL_DEBUG_LOW;
G_LINES_PER_FETCH   CONSTANT NUMBER := 1000;

G_CURRENT_RUNTIME_LEVEL CONSTANT NUMBER := 1; --FND_LOG.G_CURRENT_RUNTIME_LEVEL;
G_LEVEL_UNEXPECTED      CONSTANT NUMBER := FND_LOG.LEVEL_UNEXPECTED;
G_LEVEL_ERROR           CONSTANT NUMBER := FND_LOG.LEVEL_ERROR;
G_LEVEL_EXCEPTION       CONSTANT NUMBER := FND_LOG.LEVEL_EXCEPTION;
G_LEVEL_EVENT           CONSTANT NUMBER := FND_LOG.LEVEL_EVENT;
G_LEVEL_PROCEDURE       CONSTANT NUMBER := 2;--FND_LOG.LEVEL_PROCEDURE;
G_LEVEL_STATEMENT       CONSTANT NUMBER := FND_LOG.LEVEL_STATEMENT;
G_MODULE_NAME           CONSTANT VARCHAR2(100) := 'AP.PLSQL.AP_PAY_SINGLE_INVOICE_PKG';

--      l_debug_info := '120- l_return_code: '||l_return_code;
--      print_debuginfo(l_module_name, l_debug_info,G_LEVEL_PROCEDURE);

  PROCEDURE print_debuginfo
    (p_module IN VARCHAR2,
     p_debug_text IN VARCHAR2,
     p_debug_level IN NUMBER)
  IS

  BEGIN

    --
    -- Writing debug text to the pl/sql debug file.
    --
    
   -- DBMS_OUTPUT.put_line(p_module || p_debug_text);
    IF (p_debug_level >= G_CURRENT_RUNTIME_LEVEL) THEN
      fnd_log.string(p_debug_level,
                     p_module,
                     substr(RPAD(p_module,55)||' : '||
                     p_debug_text,0,150));
    else
      fnd_log.string(p_debug_level,
                     p_module,
                     substr(RPAD(p_module,55)||' : '||
                     p_debug_text,0,450));
    
    
    END IF;

    -- if in a concurrent request, also add to the CP log
    IF fnd_global.CONC_REQUEST_ID <> -1 THEN
      FND_FILE.put_line(FND_FILE.LOG,
                        substr(RPAD(p_module,55)||' : '||
                       p_debug_text,0,150));
    
    else
    DBMS_OUTPUT.PUT_LINE(substr(RPAD(p_module,55)||' : '||p_debug_text,0,450));
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      NULL;
  END print_debuginfo;

  -- Bug 2842080

  PROCEDURE AP_Pay_Invoice_In_Full
    (p_api_version               IN  NUMBER,
     p_init_msg_list             IN  VARCHAR2,
     p_invoice_id                IN  NUMBER,
     p_payment_type_flag         IN  VARCHAR2,
     p_internal_bank_acct_id     IN  NUMBER,
     p_payment_method_code       IN  VARCHAR2,
     p_payment_profile_id        IN  NUMBER,
     p_payment_document_id       IN  NUMBER,
     p_take_discount             IN  VARCHAR2 DEFAULT 'Y',
     p_check_date                IN  DATE,
     p_doc_category_code         IN  VARCHAR2,
     p_exchange_rate_type        IN  VARCHAR2,
     p_exchange_rate             IN  NUMBER,
     p_exchange_date             IN  DATE,
     x_return_status             OUT  NOCOPY VARCHAR2,
     x_msg_count                 OUT  NOCOPY NUMBER,
     x_msg_data                  OUT  NOCOPY VARCHAR2,
     x_errorIds                  OUT  NOCOPY
                                 IBY_DISBURSE_SINGLE_PMT_PKG.trxnErrorIdsTab)
  IS

    l_amount                   NUMBER;
    l_base_amount              NUMBER;
    l_num_invs_sel_for_pmt     NUMBER;
    l_return_code              NUMBER;
    l_application_id           NUMBER;

    l_name                     VARCHAR2(80);
    l_dummy_rowid              VARCHAR2(18);
    l_seq_num_profile          VARCHAR2(80);

    l_hold_all_payments_flag   ap_suppliers.hold_all_payments_flag%TYPE;
    l_active_pay_sites         ap_supplier_sites_all.pay_site_flag%TYPE;
    l_accounting_event_id      NUMBER(38);
    l_quick_check_id           AP_CHECKS.checkrun_name%type;
    l_next_check_number        AP_CHECKS.check_number%type;
    l_check_number             AP_CHECKS.check_number%type;
    l_period_name              GL_PERIOD_STATUSES.period_name%TYPE;
    
    l_debug_info               VARCHAR2(100);
    l_curr_calling_sequence    VARCHAR2(2000);


    l_doc_category_code varchar2(30);
    l_seqval number;
    l_dbseqid number;
    l_docseq_id     number;
    l_docseq_type varchar(1);
    l_docseq_name varchar2(30);
    l_db_seq_name varchar2(30);
    l_seq_ass_id number;
    l_prd_tab_name    varchar2(30);
    l_aud_tab_name    varchar2(30);
    l_msg_flag varchar(1);
    l_valid_sequence_exists varchar2(30);




    l_payment_type_flag         ap_checks.payment_type_flag%TYPE; -- Bug3343314
    l_creation_date             ap_checks.creation_date%TYPE; -- Bug3343314
    l_created_by                ap_checks.created_by%TYPE; -- Bug3343314
    l_last_update_date          ap_checks.last_update_date%TYPE; -- Bug3343314
    l_last_updated_by           ap_checks.last_updated_by%TYPE; -- Bug3343314
    l_last_update_login         ap_checks.last_update_login%TYPE; -- Bug3343314
    l_org_id                    NUMBER;
    l_bank_account_id           ce_bank_acct_uses_all.bank_acct_use_id%TYPE;
    l_bank_account_name         ce_bank_accounts.bank_account_name%TYPE;
    l_processing_type           iby_payment_profiles.processing_type%TYPE;
    l_print_instr_immed_flag    iby_payment_profiles.print_instruction_immed_flag%TYPE;
    l_default_printer           iby_payment_profiles.default_printer%TYPE; 
    l_payment_document_id       ce_payment_documents.payment_document_id %TYPE;
    l_bills_payable             iby_payment_methods_vl.support_bills_payable_flag%TYPE;
    l_maturity_date_offset_days iby_payment_methods_vl.maturity_date_offset_days%TYPE;
    l_maturity_date             ap_checks.future_pay_due_date%TYPE; 
    l_vendor_type_lookup_code   ap_suppliers.vendor_type_lookup_code%TYPE;

    l_return_status  VARCHAR2(100);
    l_return_message VARCHAR2(3000);
    l_msg_count      NUMBER; 
    l_msg_data       VARCHAR2(3000); 
    l_temp_status    VARCHAR2(1);

    l_is_duplicate   BOOLEAN := TRUE;
    l_module_name    VARCHAR2(200) := G_PKG_NAME ||
                                       '.ap_pay_invoice_in_full';

    l_api_version    CONSTANT NUMBER       := 1.0;
    l_api_name       CONSTANT VARCHAR2(30) := 'ap_pay_invoice_in_full';

    l_errbuf         VARCHAR2(5000);
    l_retcode        VARCHAR2(2000);

    l_transaction_type AP_PAYMENT_HISTORY_ALL.TRANSACTION_TYPE%TYPE; 

    TYPE r_ap_system_param_info IS RECORD
    (
     Auto_Calc_Int_Flag  AP_SYSTEM_PARAMETERS_ALL.Auto_Calculate_Interest_Flag%TYPE
    ,Base_Currency_Code  AP_SYSTEM_PARAMETERS_ALL.Base_Currency_Code%TYPE
    ,Pay_Doc_Override AP_SYSTEM_PARAMETERS_ALL.Pay_Doc_Category_Override%TYPE
    ,Make_Rate_Mandatory_Flag AP_SYSTEM_PARAMETERS_ALL.Make_Rate_Mandatory_Flag%TYPE
    ,Set_Of_Books_id AP_SYSTEM_PARAMETERS_ALL.Set_Of_Books_id%TYPE
    ,Default_Exchange_Rate_Type AP_SYSTEM_PARAMETERS_ALL.Default_Exchange_Rate_Type%TYPE
    ,Multi_Currency_Flag AP_SYSTEM_PARAMETERS_ALL.Multi_Currency_Flag%TYPE
    ,Xrate_type AP_SYSTEM_PARAMETERS_ALL.default_exchange_rate_type%TYPE
    );

    TYPE r_check_info  IS RECORD
    (
     Xrate                  AP_CHECKS_ALL.exchange_rate%TYPE
    ,Xrate_date             AP_CHECKS_ALL.exchange_date%TYPE
    ,Xrate_type             AP_CHECKS_ALL.exchange_rate_type%TYPE
    ,Check_id               AP_CHECKS_ALL.check_id%TYPE
    ,Checkrun_Name          AP_CHECKS_ALL.checkrun_name%TYPE
    ,Internal_Bank_Acct_Id  CE_BANK_ACCT_USES_ALL.bank_acct_use_id%TYPE
    ,Bank_Account_Name      CE_BANK_ACCOUNTS.bank_account_name%TYPE
    ,Bank_Account_Num       CE_BANK_ACCOUNTS.bank_account_num%TYPE
    ,Bank_Account_Type      CE_BANK_ACCOUNTS.account_classification%TYPE
    ,Bank_Num               CE_BANK_BRANCHES_V.branch_number%TYPE 
    ,Legal_Entity_Id        CE_BANK_ACCOUNTS.account_owner_org_id%TYPE
    ,Status_Lookup_Code     AP_CHECKS_ALL.status_lookup_code%TYPE
    );

    TYPE r_ap_ven_sites_info IS RECORD
    (
     Address_Line1         HZ_LOCATIONS.Address1%TYPE
    ,Address_Line2         HZ_LOCATIONS.Address2%TYPE
    ,Address_Line3         HZ_LOCATIONS.Address3%TYPE
    ,City                  HZ_LOCATIONS.City%TYPE
    ,country               HZ_LOCATIONS.Country%TYPE
    ,Vendor_site_code      AP_SUPPLIER_SITES_ALL.Vendor_Site_Code%TYPE
    ,Zip                   HZ_LOCATIONS.Postal_Code%TYPE
    ,Province              HZ_LOCATIONS.Province%TYPE
    ,State                 HZ_LOCATIONS.State%TYPE
    ,Address_Line4         HZ_LOCATIONS.Address4%TYPE
    ,County                HZ_LOCATIONS.Country%TYPE
    ,Address_Style         HZ_LOCATIONS.Address_Style%TYPE
    ,Vendor_Id             AP_SUPPLIERS.Vendor_ID%TYPE
    ,Vendor_Site_Id        AP_SUPPLIER_SITES_ALL.Vendor_Site_ID%TYPE
    ,Pay_Site_Flag         AP_SUPPLIER_SITES_ALL.Pay_Site_Flag%TYPE
    ,Primary_Pay_Site      AP_SUPPLIER_SITES_ALL.Primary_Pay_Site_Flag%TYPE
    );

    TYPE r_vendor_info IS RECORD
    (
     Auto_calc_int_flag     AP_SUPPLIERS.Auto_calculate_interest_flag%TYPE
    ,Vendor_name            AP_SUPPLIERS.Vendor_name%TYPE
    );
  

    TYPE r_apinv_info IS RECORD
    (
     Vendor_id              AP_INVOICES_ALL.vendor_id%TYPE
    ,Vendor_Site_id         AP_INVOICES_ALL.vendor_site_id%TYPE
    ,Party_Id               AP_INVOICES_ALL.party_id%TYPE
    ,Party_Site_Id          AP_INVOICES_ALL.party_site_id%TYPE
    ,External_Bank_Account_Id AP_PAYMENT_SCHEDULES_ALL.external_bank_account_id%TYPE
    ,Pmt_Currency_code      AP_INVOICES_ALL.payment_currency_code%TYPE
    ,Payment_Method         AP_INVOICES_ALL.Payment_Method_Code%TYPE
    ,Inv_Currency_code      AP_INVOICES_ALL.invoice_currency_code%TYPE
    ,Org_id                 AP_INVOICES_ALL.org_id%TYPE
    ,Payment_Function       AP_INVOICES_ALL.payment_function%TYPE
    ,Pay_Proc_Trxn_Type_Code AP_INVOICES_ALL.pay_proc_trxn_type_code%TYPE
    );
 
    l_vendor_rec             r_vendor_info;
    l_inv_rec                r_apinv_info;
    l_apvs_rec               r_ap_ven_sites_info;
    l_check_rec              r_check_info;
    l_asp_rec                r_ap_system_param_info;
 
    l_manual_payment_flag  VARCHAR2(1);
    l_num_printed_docs     NUMBER;    
    l_paper_doc_num        IBY_PAYMENTS_ALL.paper_document_number%TYPE;
    l_pmt_ref_num          IBY_PAYMENTS_ALL.payment_reference_number%TYPE;
    l_errorIds             IBY_DISBURSE_SINGLE_PMT_PKG.trxnErrorIdsTab;
    l_msg_index_out        NUMBER;
    l_payment_id           NUMBER;
    l_error_msg            VARCHAR2(2000);

  BEGIN
    
    print_debuginfo(l_module_name, 'ENTER',
                    G_LEVEL_PROCEDURE);
    print_debuginfo(l_module_name, 'p_invoice_id : ' || p_invoice_id, 
                    G_LEVEL_PROCEDURE);
    print_debuginfo(l_module_name, 'p_payment_type_flag: '||p_payment_type_flag,
                    G_LEVEL_PROCEDURE);
    print_debuginfo(l_module_name, 'p_internal_bank_acct_id: '||p_internal_bank_acct_id,
                    G_LEVEL_PROCEDURE);
    print_debuginfo(l_module_name, 'p_payment_method: '||p_payment_method_code,
                    G_LEVEL_PROCEDURE); 
    print_debuginfo(l_module_name, 'p_payment_profile_id: '||p_payment_profile_id,
                    G_LEVEL_PROCEDURE);
    print_debuginfo(l_module_name, 'p_payment_document_id: '||p_payment_document_id,
                    G_LEVEL_PROCEDURE);
    print_debuginfo(l_module_name, 'p_take_discount: '||p_take_discount,
                    G_LEVEL_PROCEDURE); 
    print_debuginfo(l_module_name, 'p_doc_category_code: '||p_doc_category_code,
                    G_LEVEL_PROCEDURE);
    print_debuginfo(l_module_name, 'p_exchange_rate_type: '||p_exchange_rate_type,
                    G_LEVEL_PROCEDURE);
    print_debuginfo(l_module_name, 'p_exchange_rate: '||to_char(p_exchange_rate),
                    G_LEVEL_PROCEDURE);
    print_debuginfo(l_module_name, 'p_exchange_date: '||p_exchange_date,
                    G_LEVEL_PROCEDURE);

    /* standard call to check for api compatibility */
    IF NOT FND_API.Compatible_API_Call(
                l_api_version,
                p_api_version,
                l_api_name,
                G_PKG_NAME) THEN

         x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

         RAISE FND_API.G_EXC_UNEXPECTED_ERROR;

    END IF;

    /* initialize message list if p_init_msg_list is set to TRUE. */
    IF FND_API.to_Boolean(p_init_msg_list) THEN
      FND_MSG_PUB.initialize;
    END IF;

    /* initialize API return status to success */
    x_return_status := FND_API.G_RET_STS_SUCCESS;
    l_temp_status   := 'S'; 

    l_debug_info := 'Get invoice_info';
    print_debuginfo(l_module_name, l_debug_info,
                    G_LEVEL_PROCEDURE);

    BEGIN


      -- All we want to make sure here is that can we pay the invoice
      -- that has been passed in (invoice_id)
      l_debug_info := 'Select the Invoice if it can be paid ';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);

      SELECT   apiv.vendor_id,
               apiv.vendor_site_id,
               apiv.party_id,
               apiv.party_site_id,
               apiv.external_bank_account_id,
               ai.payment_currency_code,
               ai.invoice_currency_code,
               ai.payment_method_code,
               ai.org_id,
               NVL(ai.payment_function, 'PAYABLES_DISB'),
               NVL(ai.pay_proc_trxn_type_code, 'PAYABLES_DOC')
      INTO     l_inv_rec.vendor_id,
               l_inv_rec.vendor_site_id,
               l_inv_rec.party_id,
               l_inv_rec.party_site_id,
               l_inv_rec.external_bank_account_id,
               l_inv_rec.pmt_currency_code,
               l_inv_rec.inv_currency_code,
               l_inv_rec.payment_method,
               l_inv_rec.org_id,
               l_inv_rec.payment_function,
               l_inv_rec.pay_proc_trxn_type_code
      FROM     ap_invoices_ready_to_pay_v apiv,
               ap_invoices_all ai
      WHERE    apiv.invoice_id = ai.invoice_id
      AND      apiv.invoice_id = p_invoice_id
      AND      apiv.payment_method_code = NVL(p_payment_method_code,
                                              apiv.payment_method_code)
      GROUP BY apiv.vendor_id,
               apiv.vendor_site_id,
               apiv.party_id,
               apiv.party_site_id,
               apiv.external_bank_account_id, 
               ai.payment_currency_code,
               ai.invoice_currency_code,
               ai.payment_method_code,
               ai.org_id, 
               ai.payment_function,
               ai.pay_proc_trxn_type_code;
      
      l_debug_info := 'Get system parameter info ';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);

      l_debug_info := 'Select System Option based on Invoice Org Id ';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);

      SELECT nvl(asp.auto_calculate_interest_flag,'N'),
           asp.base_currency_code, 
           nvl(asp.pay_doc_category_override, 'N'),
           nvl(make_rate_mandatory_flag,'N'),
           set_of_books_id,
           nvl(default_exchange_rate_type, 'User'),
           nvl(multi_currency_flag,'N')
      INTO l_asp_rec.auto_calc_int_flag,
           l_asp_rec.base_currency_code,
           l_asp_rec.pay_doc_override,
           l_asp_rec.make_rate_mandatory_flag,
           l_asp_rec.set_of_books_id, 
           l_asp_rec.xrate_type,
           l_asp_rec.multi_currency_flag
      FROM ap_system_parameters_all asp
      WHERE org_id = l_inv_rec.org_id;

      -- In the Payment work bench user has the option to to change the
      -- payment date, so here we check to see if what they have passed
      -- or the current date is within an open period.

      l_debug_info := 'Get open period name ';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);
      l_period_name := ap_utilities_pkg.get_current_gl_date(p_check_date,
                                                            l_inv_rec.org_id);

      IF l_period_name IS NULL THEN

      -- We call the ap debug pkg to get the message onto the stack. We pass
      -- in a TRUE value for the P_called_Online parameter (the last param)
      -- because we don't want the ap debug pkg to get it off the stack at
      -- the same time.

        x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

        FND_MESSAGE.SET_NAME('SQLAP', 'AP_PERIOD_NOT_OPEN');
        FND_MSG_PUB.ADD;

        FND_MSG_PUB.COUNT_AND_GET(
          p_count => x_msg_count,
          p_data  => x_msg_data
          );

        print_debuginfo(l_module_name, 'EXIT',
                        G_LEVEL_PROCEDURE);
        l_temp_status := 'E';

    END IF;    

    l_debug_info := 'Checking For Valid Internal Bank Account';
    print_debuginfo(l_module_name, l_debug_info,
                    G_LEVEL_PROCEDURE);
   
    BEGIN

       SELECT BA.account_owner_org_id legal_entity_id,
              BA.bank_account_name,
              BA.bank_account_num,
              BA.account_classification,
              CBB.branch_number
       INTO   l_check_rec.legal_entity_id,
              l_check_rec.bank_account_name,
              l_check_rec.bank_account_num,
              l_check_rec.bank_account_type,
              l_check_rec.bank_num 
       FROM CE_BANK_ACCOUNTS BA,
            CE_BANK_BRANCHES_V CBB,
            CE_BANK_ACCT_USES_OU_V CBAU
       WHERE CBAU.BANK_ACCOUNT_ID = BA.BANK_ACCOUNT_ID
       AND CBB.branch_party_id = BA.bank_branch_id
       AND  SYSDATE < NVL(BA.END_DATE,SYSDATE+1)
       AND  BA.ACCOUNT_CLASSIFICATION    = 'INTERNAL'
       AND  CBAU.ap_use_enable_flag = 'Y'
       AND  CBAU.org_id = l_inv_rec.org_id
       AND  CBAU.bank_account_id = p_internal_bank_acct_id; /* Added for bug#12971160 */
       /*AND  CBAU.bank_acct_use_id = p_internal_bank_acct_id; Commented for bug#12971160 */
 
    EXCEPTION
      WHEN NO_DATA_FOUND THEN

        x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

        FND_MESSAGE.SET_NAME('SQLAP', 'AP_CE_INVALID_BANK_ACCT');
        FND_MSG_PUB.ADD;

        FND_MSG_PUB.COUNT_AND_GET(
            p_count => x_msg_count,
            p_data  => x_msg_data
            );

        print_debuginfo(l_module_name, 'EXIT',
                        G_LEVEL_PROCEDURE);
        l_temp_status := 'E';

    END;
 
    l_debug_info := 'Checking Exchange Rate related info';
    print_debuginfo(l_module_name, l_debug_info,
                    G_LEVEL_PROCEDURE);

    IF (l_inv_rec.pmt_currency_code <> l_asp_rec.base_currency_code) THEN

      l_check_rec.xrate_type := nvl(P_Exchange_Rate_Type,
                                      l_asp_rec.xrate_type);

      IF (l_check_rec.xrate_type = 'User' ) THEN

        IF (P_exchange_rate is NULL) THEN

            -- State that we need to to have an exchange rate if the
            -- type is USER this is irrespective of the value of the
            -- make_rate_mandatory_flag on AP_SYSTEM_PARAMETERS

           x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

           FND_MESSAGE.SET_NAME('SQLAP', 'AP_NO_USER_XRATE');
           FND_MSG_PUB.ADD;

           FND_MSG_PUB.COUNT_AND_GET(
              p_count => x_msg_count,
              p_data  => x_msg_data
              );

           print_debuginfo(l_module_name, 'EXIT',
                           G_LEVEL_PROCEDURE);
           l_temp_status := 'E';

         ELSE

           l_check_rec.xrate := P_Exchange_Rate;

         END IF;

       ELSE -- exchange rate is other than USER

          -- --------------------------------------------------------
          -- To calculate the exchange_rate we need to see what the
          -- the value of the system parameter make_rate_mandatory_flag
          -- --------------------------------------------------------

          l_check_rec.xrate_date := nvl(trunc(P_exchange_date),trunc(sysdate));
          l_check_rec.xrate := ap_utilities_pkg.get_exchange_rate(
                                    l_inv_rec.pmt_currency_code,
                                    l_asp_rec.base_currency_code,
                                    l_check_rec.xrate_type,
                                    l_check_rec.xrate_date,
                                    'APAYFULB');

          IF (l_check_rec.xrate is NULL
              AND l_asp_rec.make_rate_mandatory_flag = 'Y') THEN
         
             x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

             FND_MESSAGE.SET_NAME('SQLAP', 'AP_NO_XRATE');
             FND_MSG_PUB.ADD;

             FND_MSG_PUB.COUNT_AND_GET(
               p_count => x_msg_count,
               p_data  => x_msg_data
               );

             print_debuginfo(l_module_name, 'EXIT',
                             G_LEVEL_PROCEDURE);
             l_temp_status := 'E';
 
          END IF; -- mandatory_flag = Y

        END IF; -- Exchange Rate = USER

      END IF; -- currency_code <> base_currency_code

      EXCEPTION

        WHEN NO_DATA_FOUND THEN

          x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

          FND_MESSAGE.SET_NAME('SQLAP', 'AP_INVOICE_CANNOT_BE_PAID');
          FND_MSG_PUB.ADD;

          FND_MSG_PUB.COUNT_AND_GET(
            p_count => x_msg_count,
            p_data  => x_msg_data
            );

          print_debuginfo(l_module_name, 'EXIT',
                          G_LEVEL_PROCEDURE);
          l_temp_status := 'E';

        WHEN TOO_MANY_ROWS THEN

          -- This means that the payment schedules for the one invoice may
          -- have different payment methods. If that is the case, we cannot
          -- handle in one payment.

          x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

          FND_MESSAGE.SET_NAME('SQLAP', 'AP_MISMATCHED_PMT_SCHEDS');
          FND_MSG_PUB.ADD;

          FND_MSG_PUB.COUNT_AND_GET(
            p_count => x_msg_count,
            p_data  => x_msg_data
            );

          print_debuginfo(l_module_name, 'EXIT',
                          G_LEVEL_PROCEDURE);
          l_temp_status := 'E';
 
      END;


      l_debug_info := 'Check if the Invoice is being paid by a payment batch';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);

      SELECT count(*)
      INTO l_num_invs_sel_for_pmt
      FROM ap_selected_invoices_all
      WHERE invoice_id = P_invoice_id;

      IF (l_num_invs_sel_for_pmt > 0) THEN

        x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

        FND_MESSAGE.SET_NAME('SQLAP', 'AP_INV_PAY_FAIL_SEL_BY_BATCH');
        FND_MSG_PUB.ADD;

        FND_MSG_PUB.COUNT_AND_GET(
          p_count => x_msg_count,
          p_data  => x_msg_data
        );

        print_debuginfo(l_module_name, 'EXIT',
                        G_LEVEL_PROCEDURE);
        l_temp_status := 'E';

      END IF;

      /*
      || ==============================================================
      ||  Verify if we should pay invoices for this supplier
      || -------------------------------------------------------------
      || We want to verify that if Oracle Payables should place all
      || payments for this supplier on HOLD also, verify that the
      || vendor site that we have selected in step 1 is Pay Site
      || which is also active
      || ==============================================================
      */

      l_debug_info := 'Verrify Supplier Site Address related info';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);

      BEGIN

        SELECT nvl(asup.hold_all_payments_flag,'N'),
               nvl(assp.pay_site_flag, 'N'),
               asup.vendor_type_lookup_code
        INTO   l_hold_all_payments_flag,
               l_active_pay_sites,
               l_vendor_type_lookup_code
        FROM   ap_suppliers asup,
               ap_supplier_sites_all assp
        WHERE  asup.vendor_id = l_inv_rec.vendor_id
        AND    asup.vendor_id = assp.vendor_id
        AND    assp.vendor_site_id = l_inv_rec.vendor_site_id;


        IF (l_hold_all_payments_flag = 'Y' or l_active_pay_sites = 'N') THEN

           RAISE NO_DATA_FOUND;

        ELSE

          IF l_vendor_type_lookup_code <> 'EMPLOYEE' THEN 

            SELECT hzl.Address1,
                 hzl.Address2,
                 hzl.Address3,
                 hzl.City,
                 hzl.Country,
                 hzl.Postal_Code,
                 hzl.Province,
                 hzl.State,
                 hzl.Address4,
                 hzl.County,
                 hzl.Address_Style,
                 asus.Vendor_Id,
                 asus.Vendor_Site_Id,
                 asus.Vendor_site_code,
                 nvl(asus.Pay_Site_Flag,'N'),
                 nvl(asus.Primary_Pay_Site_Flag,'N')
            INTO   l_apvs_rec.Address_Line1,
                 l_apvs_rec.Address_Line2,
                 l_apvs_rec.Address_Line3,
                 l_apvs_rec.City,
                 l_apvs_rec.Country,
                 l_apvs_rec.Zip,
                 l_apvs_rec.Province,
                 l_apvs_rec.State,
                 l_apvs_rec.Address_Line4,
                 l_apvs_rec.County,
                 l_apvs_rec.Address_Style,
                 l_apvs_rec.Vendor_Id,
                 l_apvs_rec.Vendor_Site_Id,
                 l_apvs_rec.Vendor_site_code,
                 l_apvs_rec.Pay_Site_Flag,
                 l_apvs_rec.Primary_Pay_Site
            FROM   ap_supplier_sites_all asus,
                 hz_locations hzl
            WHERE  asus.vendor_site_id = l_inv_rec.vendor_site_id
            AND    asus.location_id = hzl.location_id
            AND nvl(trunc(asus.inactive_date),sysdate+1) > trunc(sysdate);


            IF l_apvs_rec.Pay_Site_Flag = 'N' THEN

              BEGIN

               -- We want to search if there is a Primary Pay Site for
               -- for this Vendor

                 SELECT hzl.Address1,
                        hzl.Address2,
                        hzl.Address3,
                        hzl.City,
                        hzl.Country,
                        hzl.Postal_Code,
                        hzl.Province,
                        hzl.State,
                        hzl.Address4,
                        hzl.County,
                        hzl.Address_Style,
                        asus.Vendor_Id,
                        asus.Vendor_Site_Id,
                        asus.Vendor_Site_Code,
                        nvl(asus.Pay_Site_Flag,'N'),
                        nvl(asus.Primary_Pay_Site_Flag,'N')
                 INTO   l_apvs_rec.Address_Line1,
                        l_apvs_rec.Address_Line2,
                        l_apvs_rec.Address_Line3,
                        l_apvs_rec.City,
                        l_apvs_rec.Country,
                        l_apvs_rec.Zip,
                        l_apvs_rec.Province,
                        l_apvs_rec.State,
                        l_apvs_rec.Address_Line4,
                        l_apvs_rec.County,
                        l_apvs_rec.Address_Style,
                        l_apvs_rec.Vendor_Id,
                        l_apvs_rec.Vendor_Site_Id,
                        l_apvs_rec.Vendor_site_code,
                        l_apvs_rec.Pay_Site_Flag,
                        l_apvs_rec.Primary_Pay_Site
                 FROM   ap_supplier_sites_all asus,
                        hz_locations hzl
                 WHERE  asus.vendor_site_id = l_inv_rec.vendor_site_id
                 AND    asus.location_id = hzl.location_id
                 AND    nvl(trunc(asus.inactive_date),sysdate+1)
                        > trunc(sysdate)
                 AND    nvl(asus.primary_pay_site_flag,'N') = 'Y';


               EXCEPTION

                 WHEN NO_DATA_FOUND THEN

                 BEGIN

                   SELECT hzl.Address1,
                          hzl.Address2,
                          hzl.Address3,
                          hzl.City,
                          hzl.Country,
                          hzl.Postal_Code,
                          hzl.Province,
                          hzl.State,
                          hzl.Address4,
                          hzl.County,
                          hzl.Address_Style,
                          asus.Vendor_Id,
                          asus.Vendor_Site_Id,
                          asus.Vendor_site_code,
                          nvl(asus.Pay_Site_Flag,'N'),
                          nvl(asus.Primary_Pay_Site_Flag,'N')
                   INTO   l_apvs_rec.Address_Line1,
                          l_apvs_rec.Address_Line2,
                          l_apvs_rec.Address_Line3,
                          l_apvs_rec.City,
                          l_apvs_rec.Country,
                          l_apvs_rec.Zip,
                          l_apvs_rec.Province,
                          l_apvs_rec.State,
                          l_apvs_rec.Address_Line4,
                          l_apvs_rec.County,
                          l_apvs_rec.Address_Style,
                          l_apvs_rec.Vendor_Id,
                          l_apvs_rec.Vendor_Site_Id,
                          l_apvs_rec.Vendor_site_code,
                          l_apvs_rec.Pay_Site_Flag,
                          l_apvs_rec.Primary_Pay_Site
                   FROM   ap_supplier_sites_all asus,
                          hz_locations hzl
                   WHERE  asus.vendor_site_id = l_inv_rec.vendor_site_id
                   AND    asus.location_id = hzl.location_id
                   AND    nvl(trunc(asus.inactive_date),sysdate+1)
                          > trunc(sysdate)
                   AND    nvl(asus.pay_site_flag,'N') = 'Y'
                   AND    rownum = 1;

                  -- We want to find ANY Pay Site for this Vendor

                 EXCEPTION

                   WHEN NO_DATA_FOUND THEN

                   NULL; -- Can't have no data found here as there
                         -- has to be another pay site (verify)

                 END;

               END;

            END IF; -- l_apvs_rec.Pay_Site_Flag = 'N'

          END IF;  -- l_vendor_type_lookup_code 

        END IF;

      EXCEPTION

        WHEN NO_DATA_FOUND Then

          -- The Vendor Site that was on the invoice does not exist or
          -- we cannot pay invoices for this vendor or the vendor has no
          -- active pay sites

          x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

          FND_MESSAGE.SET_NAME('SQLAP', 'AP_NO_VENDOR_SITE');
          FND_MSG_PUB.ADD;

          FND_MSG_PUB.COUNT_AND_GET(
            p_count => x_msg_count,
            p_data  => x_msg_data
            );

          print_debuginfo(l_module_name, 'EXIT',
                          G_LEVEL_PROCEDURE);
          l_temp_status := 'E';

      END;

      -- At this stage the we are assuming that the Vendor Site is a
      -- pay site and is active


      -- Verify if Processing Type of  Payment Process Profile provided
      -- is 'PRINTED', then Payment Document Id needs to be provided
     
      l_debug_info := 'Deriving Proceeing Type for Payment Process Profile';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);
      
 
      BEGIN

        SELECT processing_type,
               print_instruction_immed_flag,
               default_printer
        INTO   l_processing_type,
               l_print_instr_immed_flag,
               l_default_printer
        FROM   IBY_PAYMENT_PROFILES
        WHERE  payment_profile_id = p_payment_profile_id;

      EXCEPTION
        WHEN NO_DATA_FOUND THEN
       
          x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

          FND_MESSAGE.SET_NAME('SQLAP', 'AP_IBY_INVALID_PAYMENT_PROF');
          FND_MSG_PUB.ADD;

          FND_MSG_PUB.COUNT_AND_GET(
            p_count => x_msg_count,
            p_data  => x_msg_data
            );

          print_debuginfo(l_module_name, 'EXIT',
                          G_LEVEL_PROCEDURE); 
          l_temp_status := 'E';

      END;
   
      -- Verify payment document is needed or not  
      IF l_processing_type = 'PRINTED' THEN
        IF p_payment_document_id IS NULL THEN

          x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

          FND_MESSAGE.SET_NAME('SQLAP', 'AP_CE_PAYMENT_DOC_NEEDED');
          FND_MSG_PUB.ADD;

          FND_MSG_PUB.COUNT_AND_GET(
            p_count => x_msg_count,
            p_data  => x_msg_data
            );

          print_debuginfo(l_module_name, 'EXIT',
                          G_LEVEL_PROCEDURE);
          l_temp_status := 'E';
 
        END IF;
      END IF;

      -- Verify whether payment_document_id provided is locked by
      -- batch and also valid for the internal bank account that 
      -- is provided

      l_debug_info := 'Check If  Payment Document Id is Valid and Get the next check';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);
     
      IF p_payment_document_id IS NOT  NULL THEN  
        BEGIN

          SELECT payment_document_id
          INTO   l_payment_document_id
          FROM   CE_PAYMENT_DOCUMENTS
          WHERE  payment_document_id = p_payment_document_id
          AND    internal_bank_account_id = p_internal_bank_acct_id
          AND    payment_instruction_id IS NULL;

          IBY_DISBURSE_UI_API_PUB_PKG.Validate_Paper_Doc_Number
            (p_api_version    => 1.0, 
             p_init_msg_list  => p_init_msg_list, 
             p_payment_doc_id => p_payment_document_id, 
             x_paper_doc_num  => l_next_check_number, 
             x_return_status  => l_return_status,
             x_msg_count      => x_msg_count, 
             x_msg_data       => x_msg_data,
             show_warn_msgs_flag => 'T'); 

          IF l_return_status <> FND_API.G_RET_STS_SUCCESS THEN
          
            x_return_status := FND_API.G_RET_STS_UNEXP_ERROR; 
            print_debuginfo(l_module_name, 'EXIT',
                            G_LEVEL_PROCEDURE);
            l_temp_status := 'E';

          END IF;
 
        EXCEPTION

          WHEN NO_DATA_FOUND THEN
            x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

            FND_MESSAGE.SET_NAME('SQLAP', 'AP_PAY_DOCUMENT_ALREADY_IN_USE');
            FND_MSG_PUB.ADD;

            FND_MSG_PUB.COUNT_AND_GET(
              p_count => x_msg_count,
              p_data  => x_msg_data
              );

            print_debuginfo(l_module_name, 'EXIT',
                            G_LEVEL_PROCEDURE);
            l_temp_status := 'E';

          END;
        END IF;
             

      /*
      || =======================================================
      || Need to get the party name from hz_parties as it
      || it is needed for the insert into ap_checks
      || =======================================================
      */

      l_debug_info := 'Get Supplier Party Name';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);

      BEGIN

        SELECT asup.auto_calculate_interest_flag,
               hp.party_name
        INTO   l_vendor_rec.Auto_calc_int_flag,
               l_vendor_rec.Vendor_name
        FROM   ap_suppliers asup,
               hz_parties   hp 
        WHERE  asup.vendor_id = l_inv_rec.vendor_id
        AND    asup.party_id = hp.party_id;

      EXCEPTION

        WHEN NO_DATA_FOUND THEN

          x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

          FND_MESSAGE.SET_NAME('SQLAP', 'AP_PAY_NO_VENDOR');
          FND_MSG_PUB.ADD;

          FND_MSG_PUB.COUNT_AND_GET(
            p_count => x_msg_count,
            p_data  => x_msg_data
            );

          print_debuginfo(l_module_name, 'EXIT',
                          G_LEVEL_PROCEDURE);
          l_temp_status := 'E';

      END;

      /*
      || ==============================================================
      ||  - Lock Invoices
      || --------------------------------------------------------------
      || Payment workbench actually calls the following code to
      || AP_PAY_IN_FULL_PKG.AP_LOCK_INVOICES
      ||
      || However all this code does is that it locks all the invoices
      || that are passed in via the p_invoice_id_list parameter.
      || It also will return the payment_method_code for each
      || payment_num on the list p_payment_num_list.
      ||
      || It will also return the following bits of information needed
      || to insert a row in the table AP_CHECKS_ALL
      ||
      || Currency_code,
      || Payment_method,
      || Vendor_id,     <-- Already have this information
      || Vendor_site_id <-- Alreadt have this information
      ||
      || For this requirement, we will always have a single invoice
      || and a single payment so all we really need to do is to lock
      || the invoice row
      ||
      || Any additional bits of information we need, we can select
      || outside in this procedure.
      || ==============================================================
      */
      
      l_debug_info := 'Lock The Invoice';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);

      AP_INVOICES_PKG.LOCK_ROW(p_invoice_id,
                               l_curr_calling_sequence);

      /*
      || ==============================================================
      || -- - Get the the follwoing for the document :-
      ||          o Status_Lookup_Code
      ||          o Payment_Type_Flag
      || --------------------------------------------------------------
      */

      -- Derive check_status based on payment method
      l_debug_info := 'Is Payment Method Bills Payable enabled ';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);
 
      BEGIN
   
        SELECT support_bills_payable_flag,
               maturity_date_offset_days
        INTO   l_bills_payable,
               l_maturity_date_offset_days
        FROM   IBY_PAYMENT_METHODS_VL
        WHERE  payment_method_code = l_inv_rec.payment_method;
     
               
        IF l_bills_payable = 'Y' THEN
          l_check_rec.status_lookup_code := 'ISSUED';
          l_maturity_date := NVL(trunc(p_check_date),trunc(sysdate))
                             + NVL(l_maturity_date_offset_days, 0);
        ELSE
          l_check_rec.status_lookup_code := 'NEGOTIABLE';
        END IF;

      EXCEPTION
        WHEN NO_DATA_FOUND THEN

          x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

          FND_MESSAGE.SET_NAME('SQLAP', 'AP_IBY_INVALID_PAYMENT_METHOD');
          FND_MSG_PUB.ADD;

          FND_MSG_PUB.COUNT_AND_GET(
            p_count => x_msg_count,
            p_data  => x_msg_data
            );

          print_debuginfo(l_module_name, 'EXIT',
                          G_LEVEL_PROCEDURE);
          l_temp_status := 'E';

      END;
  
      -- ---------------------------------------------------------------
      -- Note:  We will only populate the Checkrun_ID for Automatic
      --        Payments i.e. Payments in a Batch for Quick and Manual
      --        Payments this value will be Null.
      -- ---------------------------------------------------------------
      -- ---------------------------------------------------------------
      -- Step 1 : Sequential Numbering Logic
      -- ---------------------------------------------------------------

      FND_PROFILE.GET('UNIQUE:SEQ_NUMBERS',l_seq_num_profile);

      --5007576, re-wrote the doc sequencing section below

      l_doc_category_code := p_doc_category_code;

      if l_seq_num_profile in ('P','A') then
      
        if l_doc_category_code is not null then
          
          begin
            SELECT 'row exists'
            INTO   l_valid_sequence_exists
            FROM   fnd_doc_sequence_categories
            WHERE  code = l_doc_category_code
            AND    table_name IN ('AP_CHECKS','AP_CHECKS_ALL');
          exception
            when no_data_found then 
            
              x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;
              FND_MESSAGE.SET_NAME('SQLAP', 'AP_SEQ_NO_DOC_CAT');
              FND_MSG_PUB.ADD;
              FND_MSG_PUB.COUNT_AND_GET(p_count => x_msg_count,
                                        p_data  => x_msg_data);
              print_debuginfo(l_module_name, 'EXIT',FND_LOG.G_CURRENT_RUNTIME_LEVEL);
              l_temp_status := 'E';
              return;
          end;
          
        else
      
      
      
          CE_BANK_AND_ACCOUNT_VALIDATION.get_pay_doc_cat(p_payment_document_id,
                                                         p_payment_method_code,
                                                         p_internal_bank_acct_id,
                                                         l_doc_category_code); 


      l_debug_info := '80- l_doc_category_code: '||l_doc_category_code;
      print_debuginfo(l_module_name, l_debug_info,G_LEVEL_PROCEDURE);                                                           
        end if;






                                                               
        if l_doc_category_code = '-1' and l_seq_num_profile = 'A'  then
        
          x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;
          FND_MESSAGE.SET_NAME('SQLAP', 'AP_SEQ_DOC_CAT_NO_FOUND');
          FND_MSG_PUB.ADD;
          FND_MSG_PUB.COUNT_AND_GET(p_count => x_msg_count,
                                    p_data  => x_msg_data);
          print_debuginfo(l_module_name, 'EXIT',FND_LOG.G_CURRENT_RUNTIME_LEVEL);
          l_temp_status := 'E';
          return;
          
        end if;
          
          
        if l_doc_category_code <> '-1' and
           l_asp_rec.pay_doc_override <> 'Y' and
           l_doc_category_code <> p_doc_category_code then

          x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;
          FND_MESSAGE.SET_NAME('SQLAP', 'AP_SEQ_DOC_NO_REQ');
          FND_MSG_PUB.ADD;
          FND_MSG_PUB.COUNT_AND_GET(p_count => x_msg_count,
                                    p_data  => x_msg_data);
          print_debuginfo(l_module_name, 'EXIT',FND_LOG.G_CURRENT_RUNTIME_LEVEL);
          l_temp_status := 'E';
          return;
          
        end if;
        

      l_debug_info := '90- l_doc_category_code: '||l_doc_category_code;
      print_debuginfo(l_module_name, l_debug_info,G_LEVEL_PROCEDURE);  


      l_debug_info := '91- l_seq_num_profile: '||l_seq_num_profile;
      print_debuginfo(l_module_name, l_debug_info,G_LEVEL_PROCEDURE);       
        
      
      
      if l_doc_category_code <> '-1' then


      l_debug_info := '92- l_doc_category_code <> -1';
      print_debuginfo(l_module_name, l_debug_info,G_LEVEL_PROCEDURE);          
          l_return_code := fnd_seqnum.get_seq_info(
                             app_id          => 200,
                             cat_code        => l_doc_category_code,
                             sob_id            => l_asp_rec.set_of_books_id,
                             met_code        => 'A',
                             trx_date        => nvl(trunc(p_check_date), trunc(sysdate)),
                             docseq_id        => l_docseq_id,
                             docseq_type    => l_docseq_type,
                             docseq_name    => l_docseq_name,
                             db_seq_name    => l_db_seq_name,
                             seq_ass_id        => l_seq_ass_id,
                             prd_tab_name    => l_prd_tab_name,
                             aud_tab_name    => l_aud_tab_name,
                             msg_flag        => l_msg_flag);
        
      
            l_debug_info := '93- l_return_code: '||l_docseq_type;
      print_debuginfo(l_module_name, l_debug_info,G_LEVEL_PROCEDURE);  
        
        
        --reject if invalid and seq numbering is always used
          if (l_return_code <> 0 or l_docseq_type = 'M') and l_seq_num_profile = 'A' then

            x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;
            FND_MESSAGE.SET_NAME('SQLAP', 'AP_SEQ_CREATE_ERROR');
            FND_MSG_PUB.ADD;
            FND_MSG_PUB.COUNT_AND_GET(p_count => x_msg_count,
                                      p_data  => x_msg_data);
            print_debuginfo(l_module_name, 'EXIT',FND_LOG.G_CURRENT_RUNTIME_LEVEL);
            l_temp_status := 'E';
            return;
            
          elsif l_return_code = 0 and l_docseq_type = 'A' then

            --get seq value
            l_return_code := FND_SEQNUM.GET_SEQ_VAL(
                             200,
                             l_doc_category_code,
                             l_asp_rec.set_of_books_id,
                             'A',
                             nvl(trunc(p_check_date), trunc(sysdate)),
                             l_seqval,
                             l_dbseqid,
                             'N',
                             'N');
                             
             if l_return_code <> 0 and l_seq_num_profile = 'A' then

               x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;
               FND_MESSAGE.SET_NAME('SQLAP', 'AP_SEQ_CREATE_ERROR');
               FND_MSG_PUB.ADD;
               FND_MSG_PUB.COUNT_AND_GET(p_count => x_msg_count,
                                         p_data  => x_msg_data);
               print_debuginfo(l_module_name, 'EXIT',FND_LOG.G_CURRENT_RUNTIME_LEVEL);
               l_temp_status := 'E';
               return;
               
             end if;
        
          end if;
        
        end if; --l_doc_category_code is not null then
        
      end if; --l_seq_num_profile in ('P','A')

      l_debug_info := '100- l_return_code: '||l_return_code;
      print_debuginfo(l_module_name, l_debug_info,G_LEVEL_PROCEDURE);   

      -- We call Get_Single_Payment_Amount to get the amount for the payment
      -- net of the available discount. We pass in NULL for the payment num
      -- parameter because we want the entire invoice (all pmt scheds)
      -- to be paid

      l_debug_info := 'Getting the Check Amount';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);

      l_amount :=  AP_PAY_IN_FULL_PKG.AP_Get_Check_Amount(
                             to_char(p_invoice_id),
                             NULL,
                             p_payment_type_flag,
                             sysdate,
                             l_inv_rec.Pmt_Currency_code,
                             p_take_discount,
                             l_asp_rec.Auto_Calc_Int_Flag,
                             l_vendor_rec.auto_calc_int_flag,
                             'APAYFULB');


      l_debug_info := '110- l_amount: '||l_amount;
      print_debuginfo(l_module_name, l_debug_info,G_LEVEL_PROCEDURE);                             

      IF ( l_inv_rec.Pmt_Currency_code <> l_asp_rec.base_currency_code ) THEN

        IF ( l_check_rec.xrate_type = 'User' ) THEN

          l_base_amount := ap_utilities_pkg.ap_round_currency(
                                     (l_amount*l_check_rec.xrate),
                                      l_asp_rec.base_currency_code);

        ELSE -- exchange rate is other than USER

          l_base_amount := gl_currency_api.convert_amount(
                                           l_inv_rec.pmt_currency_code,
                                           l_asp_rec.base_currency_code,
                                           l_check_rec.xrate_date,
                                           l_check_rec.xrate_type,
                                           l_amount);

        END IF;

      END IF;

      -- Only when we are sure we want to insert should we select the
      -- check_id

      /*
      || ==============================================================
      || Step ?: Get Check_ID for creaation of record in the table
      ||         AP_CHECKS
      || --------------------------------------------------------------
      */

      -- First select the value for the CHECK_ID before insert

      SELECT ap_checks_s.nextval
      INTO   l_check_rec.check_id
      FROM   sys.dual;

      l_debug_info := 'Get Quick Check Id';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);


  
      --start of the custom code Anıl Altunkan
      if l_next_check_number is null and l_seq_num_profile in ('P') and p_doc_category_code is null then
		l_next_check_number := -1;
      end if;
      --end of the custom code Anıl Altunkan
      
                      

      IF (P_payment_type_flag = 'Q') THEN

        SELECT alc1.displayed_field
        INTO   l_quick_check_id
        FROM   ap_lookup_codes alc1
        WHERE  alc1.lookup_type = 'NLS TRANSLATION'
        AND    alc1.lookup_code = 'QUICKCHECK ID';

        l_check_rec.checkrun_name :=
                    substrb(l_quick_check_id, 1,
                            30 - nvl(lengthb(to_char(l_check_rec.check_id)), 0))
                            ||to_char(l_check_rec.check_id);
      END IF;

      l_debug_info := '120- l_check_rec.checkrun_name: '||l_check_rec.checkrun_name;
      print_debuginfo(l_module_name, l_debug_info,G_LEVEL_PROCEDURE);

      /*
      || ==============================================================
      || Step ? - Create Check (record in the table AP_CHECKS
      || --------------------------------------------------------------
      */

      l_debug_info := 'Calling Ap_Check_Pkg.Insert_Row';
      print_debuginfo(l_module_name, l_debug_info,
                   G_LEVEL_PROCEDURE);
      
      AP_CHECKS_PKG.Insert_Row(
        X_Rowid                        => l_dummy_rowid,
        X_Amount                       => l_amount,
        X_Ce_Bank_Acct_Use_Id          => p_internal_bank_acct_id, 
        X_Bank_Account_Name            => l_check_rec.bank_account_name,
        X_Check_Date                   => nvl(trunc(p_check_date),
                                              trunc(sysdate)),
        X_Check_Id                     => l_check_rec.check_id,
        X_Check_Number                 => l_next_check_number,
        X_Currency_Code                => l_inv_rec.Pmt_Currency_code,
        X_Last_Updated_By              => FND_GLOBAL.USER_ID,
        X_Last_Update_Date             => SYSDATE,
        X_Payment_Type_Flag            => p_payment_type_flag,
        X_Address_Line1                => l_apvs_rec.Address_Line1,
        X_Address_Line2                => l_apvs_rec.Address_Line2,
        X_Address_Line3                => l_apvs_rec.Address_Line3,
        X_Checkrun_Name                => l_check_rec.Checkrun_Name,
        X_Check_Format_Id              => NULL,
        X_Check_Stock_Id               => NULL,
        X_City                         => l_apvs_rec.City,
        X_Country                      => l_apvs_rec.Country,
        X_Created_By                   => FND_GLOBAL.USER_ID,
        X_Creation_Date                => SYSDATE,
        X_Last_Update_Login            => FND_GLOBAL.USER_ID,
        X_Status_Lookup_Code           => l_check_rec.status_lookup_code,
        X_Vendor_Name                  => l_vendor_rec.vendor_name,
        X_Vendor_Site_Code             => l_apvs_rec.vendor_site_code,
        X_External_Bank_Account_Id     => l_inv_rec.external_bank_account_id,
        X_Zip                          => l_apvs_rec.Zip,
        X_Bank_Account_Num             => NULL,  -- For Electronic Pmts
        X_Bank_Account_Type            => NULL,  -- For Electronic Pmts
        X_Bank_Num                     => NULL,  -- For Electronic Pmts
        X_Check_Voucher_Num            => NULL,
        X_Cleared_Amount               => NULL,
        X_Cleared_Date                 => NULL,
        X_Doc_Category_Code            => l_Doc_Category_Code,
        X_Doc_Sequence_Id              => l_dbseqid, -- Seq Num
        X_Doc_Sequence_Value           => l_seqval, -- Seq Num
        X_Province                     => l_apvs_rec.Province, -- PO_VENDORS
        X_Released_Date                => NULL,
        X_Released_By                  => NULL,
        X_State                        => l_apvs_rec.State,
        X_Stopped_Date                 => NULL,
        X_Stopped_By                   => NULL,
        X_Void_Date                    => NULL,
        X_Attribute1                   => NULL,
        X_Attribute10                  => NULL,
        X_Attribute11                  => NULL,
        X_Attribute12                  => NULL,
        X_Attribute13                  => NULL,
        X_Attribute14                  => NULL,
        X_Attribute15                  => NULL,
        X_Attribute2                   => NULL,
        X_Attribute3                   => NULL,
        X_Attribute4                   => NULL,
        X_Attribute5                   => NULL,
        X_Attribute6                   => NULL,
        X_Attribute7                   => NULL,
        X_Attribute8                   => NULL,
        X_Attribute9                   => NULL,
        X_Attribute_Category           => NULL,
        X_Future_Pay_Due_Date          => l_maturity_date,
        X_Treasury_Pay_Date            => NULL,
        X_Treasury_Pay_Number          => NULL,
        X_Withholding_Status_Lkup_Code => NULL,
        X_Reconciliation_Batch_Id      => NULL,
        X_Cleared_Base_Amount          => NULL,
        X_Cleared_Exchange_Rate        => NULL,
        X_Cleared_Exchange_Date        => NULL,
        X_Cleared_Exchange_Rate_Type   => NULL,
        X_Address_Line4                => l_apvs_rec.Address_Line4,
        X_County                       => l_apvs_rec.County,
        X_Address_Style                => l_apvs_rec.Address_Style,
        X_Org_id                       => l_inv_rec.org_id, 
        X_Vendor_Id                    => l_inv_rec.vendor_id,
        X_Vendor_Site_Id               => l_apvs_rec.Vendor_Site_Id,
        X_Exchange_Rate                => l_check_rec.xrate,
        X_Exchange_Date                => l_check_rec.xrate_date,
        X_Exchange_Rate_Type           => l_check_rec.xrate_type,
        X_Base_Amount                  => l_base_amount,
        X_Checkrun_Id                  => NULL,
        X_Calling_Sequence             => 'APAYFULB.PLS',
        X_Global_Attribute_Category    => NULL,
        X_Global_Attribute1            => NULL,
        X_Global_Attribute2            => NULL,
        X_Global_Attribute3            => NULL,
        X_Global_Attribute4            => NULL,
        X_Global_Attribute5            => NULL,
        X_Global_Attribute6            => NULL,
        X_Global_Attribute7            => NULL,
        X_Global_Attribute8            => NULL,
        X_Global_Attribute9            => NULL,
        X_Global_Attribute10           => NULL,
        X_Global_Attribute11           => NULL,
        X_Global_Attribute12           => NULL,
        X_Global_Attribute13           => NULL,
        X_Global_Attribute14           => NULL,
        X_Global_Attribute15           => NULL,
        X_Global_Attribute16           => NULL,
        X_Global_Attribute17           => NULL,
        X_Global_Attribute18           => NULL,
        X_Global_Attribute19           => NULL,
        X_Global_Attribute20           => NULL,
        X_transfer_priority            => NULL,
        X_maturity_exchange_rate_type  => NULL,
        X_maturity_exchange_date       => NULL,
        X_maturity_exchange_rate       => NULL,
        X_description                  => NULL,
        X_anticipated_value_date       => NULL,
        X_actual_value_date            => NULL,
        X_payment_profile_id           => p_payment_profile_id,
        X_bank_charge_bearer           => NULL,
        X_settlement_priority          => NULL,
        X_payment_method_code          => l_inv_rec.payment_method, 
        X_payment_document_id          => p_payment_document_id,
        X_party_id                     => l_inv_rec.party_id,
        X_party_site_id                => l_inv_rec.party_site_id,
        X_legal_entity_id              => l_check_rec.legal_entity_id,
        X_payment_id                   => NULL);


      l_debug_info := 'Calling Ap_Reconciliation_Pkg.Insert_Payment_History';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);
      IF ( p_payment_type_flag = 'R' ) THEN
       l_transaction_type := 'REFUND RECORDED';
      ELSE
       l_transaction_type := 'PAYMENT CREATED';
      END IF;

      l_debug_info := 'transaction type = ' || l_transaction_type;
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);
      
      -- Bug3343314
      AP_RECONCILIATION_PKG.insert_payment_history
     (
      x_check_id                => l_check_rec.check_id,
      x_transaction_type        => l_transaction_type, 
      x_accounting_date         =>  nvl(trunc(p_check_date),
                                              trunc(sysdate)),
      x_trx_bank_amount         => NULL,
      x_errors_bank_amount      => NULL,
      x_charges_bank_amount     => NULL,
      x_bank_currency_code      => NULL,
      x_bank_to_base_xrate_type => NULL,
      x_bank_to_base_xrate_date => NULL,
      x_bank_to_base_xrate      => NULL,
      x_trx_pmt_amount          => l_amount,
      x_errors_pmt_amount       => NULL,
      x_charges_pmt_amount      => NULL,
      x_pmt_currency_code       => l_inv_rec.pmt_currency_code,
      x_pmt_to_base_xrate_type  => l_check_rec.xrate_type,
      x_pmt_to_base_xrate_date  => l_check_rec.xrate_date,
      x_pmt_to_base_xrate       => l_check_rec.xrate,
      x_trx_base_amount         => l_base_amount,
      x_errors_base_amount      => NULL,
      x_charges_base_amount     => NULL,
      x_matched_flag            => NULL,
      x_rev_pmt_hist_id         => NULL,
      x_org_id                  => l_inv_rec.org_id,
      x_creation_date           => SYSDATE,
      x_created_by              => FND_GLOBAL.User_Id,
      x_last_update_date        => SYSDATE,
      x_last_updated_by         => FND_GLOBAL.User_Id, 
      x_last_update_login       => FND_GLOBAL.User_Id, 
      x_program_update_date     => NULL,
      x_program_application_id  => NULL,
      x_program_id              => NULL,
      x_request_id              => NULL,
      x_calling_sequence        => l_curr_calling_sequence,
      x_accounting_event_id     => l_accounting_event_id
      );

      -- l_accounting_event_id is IN parameter and is populated with
      -- NULL in AIP. to Avoid this getting accounting_event_id from APH
      -- Bug 19047932

       l_debug_info := 'Getting accounting_event_id value for AIP';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);

       select accounting_event_id into l_accounting_event_id
          from ap_payment_history_all
              where check_id = l_check_rec.check_id
              and transaction_type = l_transaction_type;
      

      -- Any witholding distributions or Interest Invoices are created
      -- in the call to Create_Single_Payments.

      l_debug_info := 'Calling Ap_Pay_In_Full_Pkg.Create_Payments';
      print_debuginfo(l_module_name, l_debug_info,
                      G_LEVEL_PROCEDURE);



      AP_PAY_IN_FULL_PKG.AP_Create_Payments(
                          to_char(p_invoice_id),
                          NULL,
                          l_check_rec.check_id,
                          p_payment_type_flag,
                          l_inv_rec.Payment_Method,
                          p_internal_bank_acct_id,
                          null, -- bank_account_num
                          null, -- bank_account_type,
                          null, -- bank_num,
                          nvl(trunc(p_check_date), trunc(sysdate)),
                          l_period_name,
                          l_inv_rec.Pmt_currency_code,
                          l_asp_rec.base_currency_code,
                          l_check_rec.Checkrun_Name,
                          l_seqval,
                          l_dbseqid,
                          l_check_rec.xrate,
                          l_check_rec.xrate_type,
                          l_check_rec.xrate_date,
                          p_take_discount, -- Pay In Full Take Discount
                          l_asp_rec.auto_calc_int_flag,
                          l_vendor_rec.auto_calc_int_flag,
                          l_asp_rec.set_of_books_id,
                          null, -- future_pay_code_combination_id
                          FND_GLOBAL.USER_ID,
                          FND_GLOBAL.USER_ID,
                          'APXPAWKB',
                          l_seq_num_profile,
                          l_accounting_Event_id,
                          l_inv_rec.org_id);


     l_debug_info := 'Calling IBY Single Payment API';
     print_debuginfo(l_module_name, l_debug_info,
                    G_LEVEL_PROCEDURE);
    
     IF  l_temp_status <> 'E' THEN

       IF p_payment_type_flag IN ('Q', 'M') THEN

         IF p_payment_type_flag = 'Q' THEN
           l_manual_payment_flag := 'N';

   --bug  5982788

             select  checkrun_name  into   l_check_rec.Checkrun_name
             from ap_checks_all
             where check_id = l_check_rec.check_id ; 

 
         ELSIF p_payment_type_flag = 'M' THEN 
           
             l_manual_payment_flag := 'Y';
     --bug 5982788
             update  ap_checks_all
             set   checkrun_name  =  l_check_rec.check_id 
             where  check_id = l_check_rec.check_id ; 


             select  checkrun_name  into   l_check_rec.Checkrun_name
             from ap_checks_all
             where check_id = l_check_rec.check_id ;
          
           
         END IF;


       --Bug 5982788 
 
         IBY_DISBURSE_SINGLE_PMT_PKG.submit_single_payment(
         p_api_version                =>    1.0,
         p_init_msg_list              =>    p_init_msg_list,
         p_calling_app_id             =>    200,
         p_calling_app_payreq_cd      =>    l_check_rec.Checkrun_Name,
         p_is_manual_payment_flag     =>    l_manual_payment_flag,
         p_payment_function           =>    l_inv_rec.payment_function,
         p_internal_bank_account_id   =>    p_internal_bank_acct_id,
         p_pay_process_profile_id     =>    p_payment_profile_id,
         p_payment_method_cd          =>    l_inv_rec.payment_method,
         p_legal_entity_id            =>    l_check_rec.legal_entity_id,
         p_organization_id            =>    l_inv_rec.org_id,
         p_organization_type          =>    'OPERATING_UNIT',
         p_payment_date               =>     nvl(trunc(p_check_date),
                                              trunc(sysdate)),
         p_payment_amount             =>    l_amount,
         p_payment_currency           =>    l_inv_rec.pmt_currency_code,
         p_payee_party_id             =>    l_inv_rec.party_id,
         p_payee_party_site_id        =>    l_inv_rec.party_site_id,
         p_supplier_site_id           =>    l_inv_rec.vendor_site_id,
         p_payee_bank_account_id      =>    l_inv_rec.external_bank_account_id,
         p_override_pmt_complete_pt   =>    'Y', 
         p_bill_payable_flag          =>    NVL(l_bills_payable, 'N'),
         p_anticipated_value_date     =>    NULL,
         p_maturity_date              =>    l_maturity_date,
         p_payment_document_id        =>    p_payment_document_id,
         p_paper_document_number      =>    l_next_check_number,
         p_printer_name               =>    l_default_printer, 
         p_print_immediate_flag       =>    l_print_instr_immed_flag,
         p_transmit_immediate_flag    =>    Null,
         p_payee_address_line1        =>    l_apvs_rec.address_line1,
         p_payee_address_line2        =>    l_apvs_rec.address_line2,
         p_payee_address_line3        =>    l_apvs_rec.address_line3,
         p_payee_address_line4        =>    l_apvs_rec.address_line4,
         p_payee_address_city         =>    l_apvs_rec.city,
         p_payee_address_county       =>    l_apvs_rec.county,
         p_payee_address_state        =>    l_apvs_rec.state,
         p_payee_address_zip          =>    l_apvs_rec.zip,
         p_payee_address_country      =>    l_apvs_rec.country,
         p_attribute_category         =>    Null,
         p_attribute1                 =>    Null,
         p_attribute2                 =>    Null,
         p_attribute3                 =>    Null,
         p_attribute4                 =>    Null,
         p_attribute5                 =>    Null,
         p_attribute6                 =>    Null,
         p_attribute7                 =>    Null,
         p_attribute8                 =>    Null,
         p_attribute9                 =>    Null,
         p_attribute10                =>    Null,
         p_attribute11                =>    Null,
         p_attribute12                =>    Null,
         p_attribute13                =>    Null,
         p_attribute14                =>    Null,
         p_attribute15                =>    Null,
         x_num_printed_docs           =>    l_num_printed_docs,
         x_payment_id                 =>    l_payment_id,
         x_paper_doc_num              =>    l_paper_doc_num,
         x_pmt_ref_num                =>    l_pmt_ref_num,
         x_return_status              =>    l_return_status,
         x_error_ids_tab              =>    x_errorIds,
         x_msg_count                  =>    x_msg_count,
         x_msg_data                   =>    x_msg_data
         );

         IF (l_return_status =  FND_API.G_RET_STS_SUCCESS) THEN 
      
           UPDATE AP_CHECKS_ALL
           SET    payment_id  = l_payment_id
           WHERE check_id = l_check_rec.check_id;
    
     
           IF p_payment_type_flag  <> 'M'  THEN
             IF l_paper_doc_num IS NOT NULL THEN
               l_check_number := l_paper_doc_num;
             ELSE
               l_check_number := l_pmt_ref_num;
             END IF;

             IF l_next_check_number <> l_check_number THEN
               UPDATE AP_CHECKS_ALL
               SET   check_number = l_check_number
               WHERE check_id = l_check_rec.check_id; 
             END IF;
           END IF;

           x_return_status := l_return_status;
 
         ELSE

           x_return_status := l_return_status;

         END IF; 

       END IF;   -- p_payment_type_flag

   
    ELSE
          
        x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;

    END IF;   -- l_temp_status

  EXCEPTION

    WHEN OTHERS THEN
      print_debuginfo(l_module_name, 'Exception occured when '
             || 'Payable single payment API fialed. Single payment creation will '
             || 'be aborted and no records will be committed for '
             || 'the invoice_id: '
             || p_invoice_id, G_LEVEL_PROCEDURE 
            );
      print_debuginfo(l_module_name, 'SQLCODE: ' || SQLCODE,
                         G_LEVEL_PROCEDURE);
      print_debuginfo(l_module_name, 'SQLERRM: ' || SQLERRM,
                         G_LEVEL_PROCEDURE);

      x_return_status := FND_API.G_RET_STS_UNEXP_ERROR;
      print_debuginfo(l_module_name, 'EXIT',
                         G_LEVEL_PROCEDURE);

      RETURN;
END AP_Pay_Invoice_In_Full;


END XX_AP_PAY_SINGLE_INVOICE_PKG;
/
