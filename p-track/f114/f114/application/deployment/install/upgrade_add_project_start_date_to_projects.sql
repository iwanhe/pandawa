prompt --application/deployment/install/upgrade_add_project_start_date_to_projects
begin
--   Manifest
--     INSTALL: UPGRADE-add project start date to projects
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
 p_id=>wwv_flow_imp.id(4343580451379436570)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'add project start date to projects'
,p_sequence=>50
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_STATUS$''',
'    and column_name = ''PROJECT_START_DATE'''))
,p_script_clob=>'alter table eba_proj_status$ add project_start_date timestamp(6) with local time zone;'
);
wwv_flow_imp.component_end;
end;
/
