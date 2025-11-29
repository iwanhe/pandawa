/* Formatted on 2023/11/01 11:23 (Formatter Plus v4.8.8) */
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
   l_api_version           NUMBER                                    := 1;
   l_init_msg_list         VARCHAR2 (30)                             DEFAULT fnd_api.g_false;
   l_commit                VARCHAR2 (30)                             DEFAULT fnd_api.g_true;
   l_rec                   iby_ext_bankacct_pub.extbankacct_rec_type;                                                                                                                       /*l_assign
                                                                                                                                           IBY_FNDCPT_SETUP_PUB.PmtInstrAssignment_rec_type;
                                                                                                                                           l_payment_function CONSTANT VARCHAR2(30) := 'PAYABLES_DISB';
                                                                                                                                           l_instrument_type CONSTANT VARCHAR2(30) := 'BANKACCOUNT';
                                                                                                                                           l_association_level VARCHAR2(2) ;*/
BEGIN
   --Intializing the Message Pub API.
   fnd_msg_pub.initialize;
   l_rec.bank_account_num := '1380088866665'; --looping dynamic
   l_rec.currency:='IDR'; --bisa fixed parameter
   l_rec.alternate_acct_name:='KLATEN'; --looping dynamic, alternate name diisi cabang, personalization alternate name di detail jadi cabang
--   l_rec.iban :='H2H'; --kode penanda untuk history update


   SELECT bank_party_id,
          branch_party_id
     INTO l_rec.bank_id,
          l_rec.branch_id
     FROM ce_bank_branches_v
    WHERE UPPER (bank_name) = UPPER ('MANDIRI') --looping dynamic
      AND UPPER (bank_branch_name) = UPPER ('SUPPLIER'); --looping dynamic

   SELECT party_id
     INTO l_rec.acct_owner_party_id
     FROM ap_suppliers
    WHERE UPPER (vendor_name) = UPPER ('LOEMBOENG KAOS'); --looping dynamic                                                                                                                             -- party_id = 609792

   l_rec.country_code := 'ID'; --fixed parameter
   l_rec.bank_account_name := 'UMI RETNOWATI ARWANTO'; --looping dynamic
   iby_ext_bankacct_pub.create_ext_bank_acct (p_api_version            => l_api_version,
                                              p_init_msg_list          => l_init_msg_list,
                                              p_ext_bank_acct_rec      => l_rec,
                                              p_association_level      => 'S',
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
   DBMS_OUTPUT.put_line (l_bank_account_id);
   DBMS_OUTPUT.put_line (l_return_status);

   IF l_msg_count > 1
   THEN
      FOR i IN 1 .. l_msg_count
      LOOP
         DBMS_OUTPUT.put_line (i || '. ' || SUBSTR (fnd_msg_pub.get (p_encoded      => fnd_api.g_false), 1, 255));
      END LOOP;
   END IF;

   IF (l_return_status = 'S')
   THEN
      COMMIT;
   END IF;
END;