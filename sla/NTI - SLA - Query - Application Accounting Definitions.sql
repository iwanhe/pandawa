select fat.application_name "Application"
        ,xamf.name "Method Name"
        ,xprf.product_rule_code "Definition Code"
        ,xprf.name "Definition Name"
        ,xprf.description
        ,xprf.compile_status_dsp "Compilation Status"
        ,xprf.product_rule_type_dsp "Owner"
        ,xprf.product_rule_version "Version"
        ,xprf.transaction_coa_name "Transaction"
        ,xprf.accounting_coa_name "Accounting"
        ,xpah.event_class_name "Event Class"
        ,xpah.event_type_name "Event Type"
        ,xpah.validation_status_dsp "Validation Status"
        ,xpah.accounting_required_flag "Create Accounting"
        ,xpah.locking_status_flag "Locked"
        ,xald.line_definition_name "Journal Line Definition Name"
        ,xald.line_definition_owner "Owner"
        ,xald.line_definition_desc "Description"
from xla_product_rules_fvl xprf
       ,fnd_application_tl fat
       ,xla_prod_acct_headers_fvl xpah
       ,xla_aad_line_defn_assgns_f_v  xald
       ,xla_acctg_method_rules_fvl xamrf
       ,xla_acctg_methods_fvl xamf
where 1=1
    and xprf.application_id = fat.application_id
    and xprf.product_rule_code = xpah.product_rule_code
    and xpah.event_type_code = xald.event_type_code
    and xald.product_rule_code = xprf.product_rule_code
    and xprf.product_rule_code = xamrf.product_rule_code
    and xamrf.accounting_method_code = xamf.accounting_method_code
    and xamf.accounting_method_type_dsp = 'User'
    and xprf.compile_status_dsp = 'Valid'
--    and fat.application_name = 'Payables'
    and xpah.validation_status_dsp = 'Valid'
    order by xamf.name
                ,fat.application_name
                ,xpah.event_class_name
                ,xald.line_definition_name