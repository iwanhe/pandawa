/* Formatted on 2023/10/31 22:55 (Formatter Plus v4.8.8) */
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
   l_rec_pmt_int_asig.priority := 1;
   l_rec_pmt_int_asig.start_date := SYSDATE;
   l_rec_pmt_int_asig.instrument.instrument_type := 'BANKACCOUNT';
   l_rec_pmt_int_asig.instrument.instrument_id := 13996; --iby_ext_bank_accounts_v.EXT_BANK_ACCOUNT_ID
   l_rec_payeecontext.party_id := 5509; --l_num_party_id; --ap_suppliers.party_id
   l_rec_payeecontext.payment_function := 'PAYABLES_DISB';
   l_rec_payeecontext.org_type := 'OPERATING_UNIT';
   l_rec_payeecontext.org_id := 81;
   l_rec_payeecontext.party_site_id := 5289; --ap_supplier_sites_all.party_site_id
   l_rec_payeecontext.supplier_site_id := 269; --ap_supplier_sites_all.vendor_site_id
   /*l_rec_payeecontext.org_type := NULL;--'OPERATING_UNIT';
   l_rec_payeecontext.org_id := NULL;--142;--82;
   l_rec_payeecontext.party_site_id := NULL;--10576832;--site_rec.party_site_id;
   l_rec_payeecontext.supplier_site_id := NULL;--1857039;--site_rec.vendor_site_id;  */
   DBMS_OUTPUT.put_line ('api start');
   iby_disbursement_setup_pub.set_payee_instr_assignment (p_api_version             => 1,
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
   DBMS_OUTPUT.put_line ('l_chr_return_status' || l_chr_return_status);
   DBMS_OUTPUT.put_line ('l_num_msg_count.' || l_num_msg_count);
   DBMS_OUTPUT.put_line ('l_chr_msg_data.' || l_chr_msg_data);
   DBMS_OUTPUT.put_line ('l_num_assign_id' || l_num_assign_id);
EXCEPTION
   WHEN OTHERS
   THEN
      DBMS_OUTPUT.put_line ('main exception.');
END;