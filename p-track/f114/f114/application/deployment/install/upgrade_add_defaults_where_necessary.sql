prompt --application/deployment/install/upgrade_add_defaults_where_necessary
begin
--   Manifest
--     INSTALL: UPGRADE-Add defaults where necessary
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
 p_id=>wwv_flow_imp.id(2576392663353418400)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Add defaults where necessary'
,p_sequence=>1060
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status_updates$',
'modify gold_yn default ''N''',
'/',
'',
'alter table eba_proj_status_links$',
'modify gold_yn default ''N''',
'/',
'',
'alter table eba_proj_status_files$',
'modify gold_yn default ''N''',
'/',
'',
'alter table eba_proj_status_updates$',
'modify gold_yn default ''N''',
'/',
'',
'alter table eba_proj_template_ai',
'modify inc_in_status_eml_yn default ''Y''',
'/',
'',
'alter table eba_proj_status_ais$',
'modify inc_in_status_eml_yn default ''Y''',
'/'))
);
wwv_flow_imp.component_end;
end;
/
