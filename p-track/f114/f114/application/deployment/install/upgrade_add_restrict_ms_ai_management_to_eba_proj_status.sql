prompt --application/deployment/install/upgrade_add_restrict_ms_ai_management_to_eba_proj_status
begin
--   Manifest
--     INSTALL: UPGRADE-Add restrict_ms_ai_management to eba_proj_status$
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(16868189868235817523)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Add restrict_ms_ai_management to eba_proj_status$'
,p_sequence=>60
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_STATUS$''',
'    and column_name = ''RESTRICT_MS_AI_MANAGEMENT'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status$',
'add ( restrict_ms_ai_management varchar2(1) );'))
);
wwv_flow_imp.component_end;
end;
/
