select xldf.application_name "Application"
         ,xamf.name "Method Name"
         ,xldf.event_class_name "Event Class"
         ,xldf.line_definition_code "Definition Code"
         ,xldf.line_definition_name "Definition Name"
         ,xldf.description
         ,xldf.enabled_flag "Enabled"
         ,xldf.budgetary_control_flag "Budgetary Control"
         ,xldf.transaction_coa_name "Transaction"
         ,xldf.accounting_coa_name "Accounting"
         ,xldj.accounting_line_name "Journal Line Type"
         ,xldj.accounting_line_owner "JLT Owner"
         ,xldj.inherit_desc_flag "Inherit Description"
         ,xldj.description_name "Line Description"
         ,xldj.description_owner "Desc Owner"
         ,xldj.active_flag "Active"
         ,xlda.flexfield_segment_name "Segment"
         ,xlda.inherit_adr_flag "Inherit"
         ,xlda.segment_rule_name "Rule Name"
         ,xlda.segment_rule_owner "Rule Owner"
         ,xlda.segment_rule_desc "Rule Description"
from xla_line_definitions_f_v xldf
       ,xla_line_defn_jlt_assgns_f_v xldj
       ,xla_line_defn_adr_assgns_f_v xlda
       ,xla_aad_line_defn_assgns_f_v  xald
       ,xla_prod_acct_headers_fvl xpah
       ,xla_product_rules_fvl xprf
       ,xla_acctg_methods_fvl xamf
       ,xla_acctg_method_rules_fvl xamrf
where 1=1
    and xldf.event_type_code = xldj.event_type_code
    and xldj.line_definition_code = xlda.line_definition_code (+)
    and xldj.accounting_line_code = xlda.accounting_line_code (+)
    and xldf.event_type_code = xald.event_type_code
    and xldf.line_definition_code = xald.line_definition_code
    and xprf.product_rule_code = xpah.product_rule_code
    and xpah.event_type_code = xald.event_type_code
    and xald.product_rule_code = xprf.product_rule_code
    and xprf.product_rule_code = xamrf.product_rule_code
    and xamrf.accounting_method_code = xamf.accounting_method_code
    and xamf.accounting_method_type_dsp = 'User'
    and xprf.compile_status_dsp = 'Valid'
    and xpah.validation_status_dsp = 'Valid'
--    and xldf.application_name = 'Payables'
order by xamf.name
             ,xldf.application_name
             ,xldf.event_class_name
             ,xldf.line_definition_name
             ,xldj.accounting_line_name