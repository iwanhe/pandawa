select xsr.application_name "Application"
         ,xsr.segment_rule_code "Rule Code"
         ,xsr.name "Rule Name"
         ,xsr.description
         ,xsr.segment_rule_type_dsp "Owner"
         ,xsr.enabled_flag "Enabled"
         ,xsr.transaction_coa_name "Transaction"
         ,xsr.accounting_coa_name "Accounting"
         ,xsd.user_sequence "Priority"
         ,decode (xsd.value_type_code,
                        'S', 'Source',
                        'L', 'Constant') "Value Type"
         ,xsf1.name "Value"
         ,xsd.input_source_code "Input Source"
         ,xsd.value_segment_rule_code "Segment"
         ,xac.user_sequence "Seq"
         ,xac.bracket_left_code "("
         ,xsf2.name "Source"
         ,flvv.meaning "Operator"
         ,xac.value_source_type_code "Value Type"
         ,xac.independent_value_constant "Independent Value"
         ,xac.value_constant "Value"
         ,xac.value_flexfield_segment_code "Segment"
         ,xac.bracket_right_code ")"
         ,decode (xac.logical_operator_code,
                        'A', 'AND',
                        'O', 'OR') "And/Or"
from xla_seg_rules_fvl xsr
       ,xla_seg_rule_details xsd
       ,xla_sources_fvl xsf1
       ,xla_sources_fvl xsf2
       ,xla_conditions xac
       ,fnd_lookup_values_vl flvv
where 1=1
    and xsr.segment_rule_code = xsd.segment_rule_code (+)
    and xsd.value_source_code = xsf1.source_code (+)
    and xsd.segment_rule_detail_id = xac.segment_rule_detail_id
    and xac.source_code = xsf2.source_code
    and xac.line_operator_code = flvv.lookup_code
    and flvv.lookup_type = 'XLA_LINE_OPERATOR_TYPE'
    and xsr.segment_rule_type_dsp = 'User'
--    and xsr.application_id = 555
--    and xsr.name = 'NTI Allocation'
    order by xsd.user_sequence, xac.user_sequence