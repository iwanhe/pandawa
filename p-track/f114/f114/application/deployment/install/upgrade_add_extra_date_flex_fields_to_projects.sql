prompt --application/deployment/install/upgrade_add_extra_date_flex_fields_to_projects
begin
--   Manifest
--     INSTALL: UPGRADE-add extra date flex fields to projects
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
 p_id=>wwv_flow_imp.id(4004115435588963875)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'add extra date flex fields to projects'
,p_sequence=>770
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from user_tab_cols',
' where table_name = ''EBA_PROJ_STATUS$''',
'   and column_name = ''PROJECT_FLEX_D12'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status$ add (',
'    project_flex_d05          timestamp with local time zone,',
'    project_flex_d06          timestamp with local time zone,',
'    project_flex_d07          timestamp with local time zone,',
'    project_flex_d08          timestamp with local time zone,',
'    project_flex_d09          timestamp with local time zone,',
'    project_flex_d10          timestamp with local time zone,',
'    project_flex_d11          timestamp with local time zone,',
'    project_flex_d12          timestamp with local time zone',
');',
'/'))
);
wwv_flow_imp.component_end;
end;
/
