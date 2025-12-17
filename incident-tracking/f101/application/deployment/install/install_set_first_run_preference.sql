prompt --application/deployment/install/install_set_first_run_preference
begin
--   Manifest
--     INSTALL: INSTALL-Set First Run Preference
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
 p_id=>wwv_flow_imp.id(1081711820061695645)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Set First Run Preference'
,p_sequence=>410
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_intrack_fw.set_preference_value( p_preference_name => ''FIRST_RUN'', p_preference_value => ''YES'' );',
'end;'))
);
wwv_flow_imp.component_end;
end;
/
