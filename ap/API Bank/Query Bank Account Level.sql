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


HZ_CONTACT_POINT_V2PUB.update_email_contact_point