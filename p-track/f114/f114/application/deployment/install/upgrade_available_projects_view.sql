prompt --application/deployment/install/upgrade_available_projects_view
begin
--   Manifest
--     INSTALL: UPGRADE-Available Projects View
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
 p_id=>wwv_flow_imp.id(5903467684866666160)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Available Projects View'
,p_sequence=>230
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_views',
'where view_name = ''EBA_PROJ_STATUS_AVAILABLE_V'''))
,p_script_clob=>'drop view eba_proj_status_available_v;'
);
wwv_flow_imp.component_end;
end;
/
