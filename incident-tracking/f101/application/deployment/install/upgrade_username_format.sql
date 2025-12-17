prompt --application/deployment/install/upgrade_username_format
begin
--   Manifest
--     INSTALL: UPGRADE-Username Format
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
 p_id=>wwv_flow_imp.id(1436193750844361046)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Username Format'
,p_sequence=>40
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    insert into eba_intrack_preferences (id,preference_name,preference_value,preference_description) values (10,''USERNAME_FORMAT'',''EMAIL'',''Defines the format of the ACL usernames EMAIL or STRING'');',
'exception when others then null;',
'end;',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
