prompt --application/deployment/install/upgrade_recreate_user_ref_uq_idx
begin
--   Manifest
--     INSTALL: UPGRADE-recreate user ref uq idx
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
 p_id=>wwv_flow_imp.id(3481425226592108270)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'recreate user ref uq idx'
,p_sequence=>1230
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'drop index EBA_PROJ_USER_REF_U1',
'/',
'',
'create UNIQUE INDEX EBA_PROJ_USER_REF_U1 ON EBA_PROJ_USER_REF (USER_ID, PROJECT_ID, ROLE_ID)',
'/'))
);
wwv_flow_imp.component_end;
end;
/
