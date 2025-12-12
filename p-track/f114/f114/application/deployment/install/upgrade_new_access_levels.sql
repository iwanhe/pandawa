prompt --application/deployment/install/upgrade_new_access_levels
begin
--   Manifest
--     INSTALL: UPGRADE-New Access Levels
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
 p_id=>wwv_flow_imp.id(11806609752684900339)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'New Access Levels'
,p_sequence=>420
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status_access_levels',
'where id = 0'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status_access_levels',
'    drop constraint eba_proj_stat_acc_lvl_ck;',
'',
'alter table eba_proj_status_access_levels',
'    add constraint eba_proj_stat_acc_lvl_ck check (access_level in (',
'        ''Super Admin'',',
'        ''Administrator'',',
'        ''Contributor'',',
'        ''Reader'',',
'        ''Pending Approval'',',
'        ''No Access'')) enable;',
'',
'insert into eba_proj_status_access_levels ( id, access_level )',
'    values ( -99, ''No Access'' );',
'insert into eba_proj_status_access_levels ( id, access_level )',
'    values ( 0, ''Pending Approval'' );',
'insert into eba_proj_status_access_levels ( id, access_level )',
'    values ( 4, ''Super Admin'' );'))
);
wwv_flow_imp.component_end;
end;
/
