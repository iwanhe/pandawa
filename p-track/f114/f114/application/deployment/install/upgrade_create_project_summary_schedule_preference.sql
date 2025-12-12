prompt --application/deployment/install/upgrade_create_project_summary_schedule_preference
begin
--   Manifest
--     INSTALL: UPGRADE-create PROJECT_SUMMARY_SCHEDULE preference
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
 p_id=>wwv_flow_imp.id(16028479139086886512)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'create PROJECT_SUMMARY_SCHEDULE preference'
,p_sequence=>880
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from EBA_PROJ_PREFERENCES',
' where preference_name = ''PROJECT_SUMMARY_SCHEDULE'''))
,p_script_clob=>'insert into EBA_PROJ_PREFERENCES (preference_name, preference_value) values (''PROJECT_SUMMARY_SCHEDULE'', ''QUARTERLY'');'
);
wwv_flow_imp.component_end;
end;
/
