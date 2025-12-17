prompt --application/deployment/install/upgrade_remove_help_table
begin
--   Manifest
--     INSTALL: UPGRADE-Remove Help Table
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(1457215546386960062)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Remove Help Table'
,p_sequence=>50
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select table_name',
'from user_tables',
'where table_name = ''EBA_INTRACK_HELP_PAGE'''))
,p_script_clob=>'drop table eba_intrack_help_page;'
);
wwv_flow_imp.component_end;
end;
/
