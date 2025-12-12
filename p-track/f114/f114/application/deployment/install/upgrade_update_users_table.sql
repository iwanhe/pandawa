prompt --application/deployment/install/upgrade_update_users_table
begin
--   Manifest
--     INSTALL: UPGRADE-Update Users Table
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
 p_id=>wwv_flow_imp.id(2661817043989910510)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Update Users Table'
,p_sequence=>1220
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_STATUS_USERS''',
'    and column_name = ''HIPPA_CERT_DATE'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status_users add (',
'    country_id      number        references eba_proj_countries on delete set null,',
'    region_id       number        references eba_proj_regions   on delete set null,',
'    home_timezone   varchar2(50),',
'    team_groups     varchar2(255),',
'    skillsets       varchar2(255),',
'    bg_checks       varchar2(255),',
'    hippa_cert_date timestamp with local time zone',
');'))
);
wwv_flow_imp.component_end;
end;
/
