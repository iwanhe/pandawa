prompt --application/deployment/install/upgrade_add_owner_role_id_to_milestones
begin
--   Manifest
--     INSTALL: UPGRADE-Add owner_role_id to Milestones
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
 p_id=>wwv_flow_imp.id(15229714255374474940)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Add owner_role_id to Milestones'
,p_sequence=>550
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_STATUS_MS$''',
'    and column_name = ''OWNER_ROLE_ID'''))
,p_script_clob=>'alter table EBA_PROJ_STATUS_MS$ add owner_role_id number;'
);
wwv_flow_imp.component_end;
end;
/
