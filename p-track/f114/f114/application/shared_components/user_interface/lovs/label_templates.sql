prompt --application/shared_components/user_interface/lovs/label_templates
begin
--   Manifest
--     LABEL_TEMPLATES
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
 p_id=>wwv_flow_imp.id(6143618810878059772)
,p_lov_name=>'LABEL_TEMPLATES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select template_name || '' ('' || decode(theme_number, 50, ''Mobile Theme'', 42, ''Desktop Theme'') || '')''  dv,',
'    label_template_id rv',
'from apex_application_temp_label',
'where application_id = :APP_ID',
'and theme_number in (select u.theme_number',
'                     from apex_application_themes t, apex_appl_user_interfaces u',
'                     where t.ui_type_id = u.ui_type_id',
'                     and t.application_id = u.application_id',
'                     and t.application_id = :APP_ID',
'                     and u.ui_type_name = ''DESKTOP'')',
'order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366591415
);
wwv_flow_imp.component_end;
end;
/
