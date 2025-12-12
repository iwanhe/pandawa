prompt --application/deployment/install/install_error_messages
begin
--   Manifest
--     INSTALL: INSTALL-Error Messages
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
 p_id=>wwv_flow_imp.id(7864225996244801449)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Error Messages'
,p_sequence=>430
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into eba_proj_error_lookup (constraint_name, message,language_code)',
'values (''EBA_PROJ_STATUS_PROJECT_UNQ'',''Project name already in use.'',''EN'');'))
);
wwv_flow_imp.component_end;
end;
/
