prompt --application/deployment/install/install_set_default_app_name
begin
--   Manifest
--     INSTALL: INSTALL-Set Default App Name
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
 p_id=>wwv_flow_imp.id(4064249414158011935)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Set Default App Name'
,p_sequence=>950
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_title varchar2(255);',
'begin',
'    l_title := eba_proj_fw.get_preference_value(''APPLICATION_TITLE'');',
'    if l_title = ''Preference does not exist'' or l_title is null then',
'        eba_proj_fw.set_preference_value(''APPLICATION_TITLE'',''P-Track'');',
'    end if;',
'end;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
