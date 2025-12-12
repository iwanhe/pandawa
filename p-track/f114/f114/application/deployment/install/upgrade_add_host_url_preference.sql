prompt --application/deployment/install/upgrade_add_host_url_preference
begin
--   Manifest
--     INSTALL: UPGRADE-Add HOST_URL Preference
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
 p_id=>wwv_flow_imp.id(17506940939257702401)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Add HOST_URL Preference'
,p_sequence=>1090
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXPRESSION'
,p_condition=>'eba_proj_fw.get_preference_value(''HOST_URL'') = ''Preference does not exist'''
,p_condition2=>'PLSQL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_proj_fw.set_preference_value(',
'        p_preference_name => ''HOST_URL'',',
'        p_preference_value => nvl( wwv_flow_utilities.host_url(''SCRIPT''),',
'                                   nvl( wwv_flow_utilities.get_protocol(), ''http'' )',
'                                       ||''://''|| owa_util.get_cgi_env( ''HTTP_HOST'' )',
'                                       || owa_util.get_cgi_env( ''SCRIPT_NAME'' ) )',
'    );',
'    commit;',
'end;'))
);
wwv_flow_imp.component_end;
end;
/
