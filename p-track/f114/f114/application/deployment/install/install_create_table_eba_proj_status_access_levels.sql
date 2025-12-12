prompt --application/deployment/install/install_create_table_eba_proj_status_access_levels
begin
--   Manifest
--     INSTALL: INSTALL-create table eba_proj_status_access_levels
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
 p_id=>wwv_flow_imp.id(6060578010660719760)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'create table eba_proj_status_access_levels'
,p_sequence=>70
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_access_levels (',
'    id number not null enable, ',
'    access_level varchar2(30) not null enable, ',
'    row_version number, ',
'    constraint eba_proj_stat_acc_lvl_ck check (access_level in (',
'        ''Super Admin'',',
'        ''Administrator'',',
'        ''Contributor'',',
'        ''Reader'',',
'        ''Pending Approval'',',
'        ''No Access'')) enable,',
'    constraint eba_proj_stat_access_levels_pk primary key (id) enable',
');',
'insert into eba_proj_status_access_levels ( id, access_level )',
'    values ( -99, ''No Access'' );',
'insert into eba_proj_status_access_levels ( id, access_level )',
'    values ( 0, ''Pending Approval'' );',
'insert into eba_proj_status_access_levels ( id, access_level )',
'    values ( 1, ''Reader'' );',
'insert into eba_proj_status_access_levels ( id, access_level )',
'    values ( 2, ''Contributor'' );',
'insert into eba_proj_status_access_levels ( id, access_level )',
'    values ( 3, ''Administrator'' );',
'insert into eba_proj_status_access_levels ( id, access_level )',
'    values ( 4, ''Super Admin'' );',
'',
'commit;',
'',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
