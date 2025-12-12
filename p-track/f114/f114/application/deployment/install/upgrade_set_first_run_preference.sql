prompt --application/deployment/install/upgrade_set_first_run_preference
begin
--   Manifest
--     INSTALL: UPGRADE-Set First Run Preference
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
 p_id=>wwv_flow_imp.id(1226265476470225315)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Set First Run Preference'
,p_sequence=>1190
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_proj_preferences',
' where preference_name = ''FIRST_RUN'';'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_proj_fw.set_preference_value( p_preference_name => ''FIRST_RUN'', p_preference_value => ''NO'' );',
'end;'))
);
wwv_flow_imp.component_end;
end;
/
