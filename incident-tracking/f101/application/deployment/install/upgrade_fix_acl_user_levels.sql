prompt --application/deployment/install/upgrade_fix_acl_user_levels
begin
--   Manifest
--     INSTALL: UPGRADE-Fix ACL user levels
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
 p_id=>wwv_flow_imp.id(1345491567197000134)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Fix ACL user levels'
,p_sequence=>30
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update eba_intrack_access_levels',
'set id = 1',
'where access_level = ''Reader''',
'    and id = 3;',
'',
'update eba_intrack_access_levels',
'set id = 3',
'where access_level = ''Administrator''',
'    and id = 1;',
'',
'commit;',
''))
);
wwv_flow_imp.component_end;
end;
/
