prompt --application/deployment/install/upgrade_add_flex_columns_to_projects
begin
--   Manifest
--     INSTALL: UPGRADE-Add Flex columns to Projects
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
 p_id=>wwv_flow_imp.id(6135116784792222519)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Add Flex columns to Projects'
,p_sequence=>760
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_STATUS$''',
'    and column_name = ''PROJECT_FLEX_01'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status$',
'    add (',
'        project_flex_01   varchar2(4000),',
'        project_flex_02   varchar2(4000),',
'        project_flex_03   varchar2(4000),',
'        project_flex_04   varchar2(4000),',
'        project_flex_05   varchar2(4000),',
'        project_flex_06   varchar2(4000),',
'        project_flex_07   varchar2(4000),',
'        project_flex_08   varchar2(4000),',
'        project_flex_n01  number,',
'        project_flex_n02  number,',
'        project_flex_n03  number,',
'        project_flex_n04  number,',
'        project_flex_d01  timestamp with local time zone,',
'        project_flex_d02  timestamp with local time zone,',
'        project_flex_d03  timestamp with local time zone,',
'        project_flex_d04  timestamp with local time zone,',
'        project_flex_clob clob',
'    );',
'',
'alter table eba_proj_status_ais$',
'    add (',
'        action_flex_01   varchar2(4000),',
'        action_flex_02   varchar2(4000),',
'        action_flex_03   varchar2(4000),',
'        action_flex_04   varchar2(4000),',
'        action_flex_05   varchar2(4000),',
'        action_flex_06   varchar2(4000),',
'        action_flex_07   varchar2(4000),',
'        action_flex_08   varchar2(4000),',
'        action_flex_n01  number,',
'        action_flex_n02  number,',
'        action_flex_n03  number,',
'        action_flex_n04  number,',
'        action_flex_d01  timestamp with local time zone,',
'        action_flex_d02  timestamp with local time zone,',
'        action_flex_d03  timestamp with local time zone,',
'        action_flex_d04  timestamp with local time zone,',
'        action_flex_clob clob',
'    );',
'',
'alter table eba_proj_status_ms$',
'    add (',
'        milestone_flex_01   varchar2(4000),',
'        milestone_flex_02   varchar2(4000),',
'        milestone_flex_03   varchar2(4000),',
'        milestone_flex_04   varchar2(4000),',
'        milestone_flex_05   varchar2(4000),',
'        milestone_flex_06   varchar2(4000),',
'        milestone_flex_07   varchar2(4000),',
'        milestone_flex_08   varchar2(4000),',
'        milestone_flex_n01  number,',
'        milestone_flex_n02  number,',
'        milestone_flex_n03  number,',
'        milestone_flex_n04  number,',
'        milestone_flex_d01  timestamp with local time zone,',
'        milestone_flex_d02  timestamp with local time zone,',
'        milestone_flex_d03  timestamp with local time zone,',
'        milestone_flex_d04  timestamp with local time zone,',
'        milestone_flex_clob clob',
'    );',
''))
);
wwv_flow_imp.component_end;
end;
/
