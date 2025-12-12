prompt --application/deployment/install/upgrade_set_default_workdays
begin
--   Manifest
--     INSTALL: UPGRADE-Set Default Workdays
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
 p_id=>wwv_flow_imp.id(13454039990343470908)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Set Default Workdays'
,p_sequence=>470
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_preferences',
'where preference_name = ''WORKDAYS'';',
''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into eba_proj_preferences ( preference_name, preference_value )',
'    values ( ''WORKDAYS'', ''2:3:4:5:6'' );'))
);
wwv_flow_imp.component_end;
end;
/
