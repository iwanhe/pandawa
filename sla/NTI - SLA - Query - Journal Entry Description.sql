select xdf.application_name "Application"
         ,xdf.description_code "Journal Description Code"
         ,xdf.name "Journal Description Name"
         ,xdf.transaction_coa_id "Transaction Chart of Accounts"
         ,xdf.description
         ,xdf.description_type_code_dsp "Owner"
         ,xdf.enabled_flag "Enabled"
         ,xdp.user_sequence "Priority"
         ,xdd.user_sequence "Seq"
         ,flvv1.meaning
         ,xdd.literal "Constant"
         ,xdd.source_name "Source"
         ,xdd.flexfield_segment_code "Segment"
         ,xdd.display_description_flag "Display Account Description"
from xla_descriptions_fvl xdf
       ,xla_desc_priorities xdp
       ,xla_descript_details_fvl xdd
       ,fnd_lookup_values_vl flvv1
where 1=1
    and xdf.description_code = xdp.description_code
    and xdp.description_prio_id = xdd.description_prio_id
    and xdd.value_type_code = flvv1.lookup_code (+)
    and flvv1.lookup_type (+) = 'XLA_DESCRIPT_VALUE_TYPE'
    and xdf.description_type_code_dsp = 'User'
order by xdf.application_name
             ,xdf.name
             ,xdp.user_sequence
             ,xdd.user_sequence
