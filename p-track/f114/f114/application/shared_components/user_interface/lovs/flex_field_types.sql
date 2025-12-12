prompt --application/shared_components/user_interface/lovs/flex_field_types
begin
--   Manifest
--     FLEX_FIELD_TYPES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(6143662001429091899)
,p_lov_name=>'FLEX_FIELD_TYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Date Picker'' dv, ''DATE'' rv',
'from dual',
'where -- Only date columns',
'    instr(:P144_FLEX_COLUMN,''FLEX_D'') > 0',
'union all',
'select ''Large Text Input Field (Text Area)'' dv, ''TEXTAREA'' rv',
'from dual',
'where -- CLOB and varchar2 columns',
'    instr(:P144_FLEX_COLUMN,''FLEX_CLOB'') > 0',
'    or instr(:P144_FLEX_COLUMN,''FLEX_0'') > 0',
'union all',
'select ''Number Field'' dv, ''NUMBER'' rv',
'from dual',
'where -- Only number columns',
'    instr(:P144_FLEX_COLUMN,''FLEX_N'') > 0',
'union all',
'select ''Select List'' dv, ''SELECT_LIST'' rv',
'from dual',
'where -- Only number and varchar2 columns',
'    instr(:P144_FLEX_COLUMN,''FLEX_0'') > 0',
'    or instr(:P144_FLEX_COLUMN,''FLEX_N'') > 0',
'union all',
'select ''Text Field'' dv, ''TEXT'' rv',
'from dual',
'where -- Only varchar2 columns',
'    instr(:P144_FLEX_COLUMN,''FLEX_0'') > 0'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366591366
);
wwv_flow_imp.component_end;
end;
/
