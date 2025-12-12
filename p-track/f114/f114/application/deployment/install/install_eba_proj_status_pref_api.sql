prompt --application/deployment/install/install_eba_proj_status_pref_api
begin
--   Manifest
--     INSTALL: INSTALL-eba_proj_status_pref_api
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
 p_id=>wwv_flow_imp.id(8916884930304219631)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'eba_proj_status_pref_api'
,p_sequence=>490
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE PACKAGE "EBA_PROJ_STATUS_PREF_API" ',
'as',
'function get_email return varchar2;',
'end eba_proj_status_pref_api;',
'/',
'',
'',
'CREATE OR REPLACE PACKAGE BODY "EBA_PROJ_STATUS_PREF_API" ',
'as',
'function get_email return varchar2',
'is',
'    l_return varchar2(4000) := null;',
'begin',
'    for c1 in (select preference_value from eba_proj_preferences where preference_name = ''EMAIL'') loop',
'        l_return := c1.preference_value;',
'    end loop;',
'    return l_return;',
'end get_email;',
'end eba_proj_status_pref_api;',
'/',
'',
''))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(6856065776127602920)
,p_script_id=>wwv_flow_imp.id(8916884930304219631)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_PROJ_STATUS_PREF_API'
);
wwv_flow_imp.component_end;
end;
/
