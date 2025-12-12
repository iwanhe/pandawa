prompt --application/shared_components/user_interface/lovs/p142_flex_data_types
begin
--   Manifest
--     P142_FLEX_DATA_TYPES
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
 p_id=>wwv_flow_imp.id(6143620889553059777)
,p_lov_name=>'P142_FLEX_DATA_TYPES'
,p_lov_query=>'.'||wwv_flow_imp.id(6143620889553059777)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591788
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143621511679059777)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Date Picker'
,p_lov_return_value=>'DATE'
,p_lov_disp_cond_type=>'EXPRESSION'
,p_lov_disp_cond=>':P142_FLEXIBLE_COLUMN like ''%FLEX_D%'''
,p_lov_disp_cond2=>'PLSQL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143621206645059777)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Number Field'
,p_lov_return_value=>'NUMBER'
,p_lov_disp_cond_type=>'EXPRESSION'
,p_lov_disp_cond=>':P142_FLEXIBLE_COLUMN like ''%FLEX_N%'''
,p_lov_disp_cond2=>'PLSQL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143622111824059778)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Select List'
,p_lov_return_value=>'SELECT_LIST'
,p_lov_disp_cond_type=>'EXPRESSION'
,p_lov_disp_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P142_FLEXIBLE_COLUMN not like ''%FLEX_CLOB''',
'    and :P142_FLEXIBLE_COLUMN not like ''%FLEX_D%'''))
,p_lov_disp_cond2=>'PLSQL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143621783531059777)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Text Field'
,p_lov_return_value=>'TEXT'
,p_lov_disp_cond_type=>'EXPRESSION'
,p_lov_disp_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P142_FLEXIBLE_COLUMN not like ''%FLEX_N%''',
'    and :P142_FLEXIBLE_COLUMN not like ''%FLEX_D%''',
'    and :P142_FLEXIBLE_COLUMN not like ''%FLEX_CLOB'''))
,p_lov_disp_cond2=>'PLSQL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143622407616059778)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Text Area'
,p_lov_return_value=>'TEXTAREA'
,p_lov_disp_cond_type=>'EXPRESSION'
,p_lov_disp_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P142_FLEXIBLE_COLUMN not like ''%FLEX_N%''',
'    and :P142_FLEXIBLE_COLUMN not like ''%FLEX_D%'''))
,p_lov_disp_cond2=>'PLSQL'
);
wwv_flow_imp.component_end;
end;
/
