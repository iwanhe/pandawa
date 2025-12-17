select xsf.application_name "Application"
         ,xsf.source_code "Custom Source Code"
         ,xsf.name "Custom Source Name"
         ,xsf.description
         ,xsf.plsql_function_name "PL/SQL Function Name"
         ,xsf.enabled_flag "Enabled"
         ,flvv1.meaning "Data Type"
         ,xsf.segment_name "Segment"
         ,xsf.flexfield_application_name "Lookup Application"
         ,xsf.id_flex_name "Value Set"
         ,xsf.key_flexfield_flag "Accounting Flexfield"
         ,xsf.lookup_type_meaning "Lookup Type"
         ,xsp.user_sequence "Seq"
         ,flvv2.meaning "Type"
         ,xsf1.name
         ,xsf1.description
from xla_sources_fvl xsf
       ,xla_source_params xsp
       ,xla_sources_fvl xsf1
       ,fnd_lookup_values_vl flvv1
       ,fnd_lookup_values_vl flvv2
where 1=1
    and xsf.source_code = xsp.source_code
    and xsp.ref_source_code = xsf1.source_code
    and xsf.datatype_code = flvv1.lookup_code (+)
    and xsp.ref_source_type_code = flvv2.lookup_code (+)
    and flvv1.lookup_type(+) = 'XLA_DATA_TYPE'
    and flvv2.lookup_type(+) = 'XLA_CONDITION_VALUE_TYPE'