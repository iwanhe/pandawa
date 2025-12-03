CREATE OR REPLACE PACKAGE APPS.XX_AP_PAY_SINGLE_INVOICE_PKG AUTHID CURRENT_USER AS
/* $Header: appayins.pls 120.6 2006/02/23 02:33:14 bghose noship $ */


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
                                 IBY_DISBURSE_SINGLE_PMT_PKG.trxnErrorIdsTab
    );

END XX_AP_PAY_SINGLE_INVOICE_PKG;
/
