select xamf.accounting_method_code "Method Code"
        ,xamf.name "Method Name"
        ,xamf.description 
        ,xamf.accounting_method_type_dsp "Owner"
        ,xamf.enabled_flag "Enabled"
        ,xamf.transaction_coa_name "Transaction"
        ,xamf.accounting_coa_name "Accounting"
        ,xamrf.application_name "Application"
        ,xamrf.product_rule_name "Name"
        ,xamrf.product_rule_type_dsp "Onwers"
        ,xamrf.start_date_active "Start Date"
        ,xamrf.end_date_active "End Date"
from  xla_acctg_methods_fvl xamf
        ,xla_acctg_method_rules_fvl xamrf
where 1=1
    and xamf.accounting_method_code = xamrf.accounting_method_code
    and xamf.accounting_method_type_dsp = 'User'
order by 1, 8