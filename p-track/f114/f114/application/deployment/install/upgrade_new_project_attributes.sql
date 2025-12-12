prompt --application/deployment/install/upgrade_new_project_attributes
begin
--   Manifest
--     INSTALL: UPGRADE-new project attributes
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
 p_id=>wwv_flow_imp.id(2650844555348102538)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'new project attributes'
,p_sequence=>70
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_STATUS$''',
'    and column_name = ''HEADLINE'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status$  add  headline                  varchar2(4000);',
'alter table eba_proj_status$  add  requesting_team           varchar2(255);',
'alter table eba_proj_status$  add  impacted_environment      varchar2(255);'))
);
wwv_flow_imp.component_end;
end;
/
