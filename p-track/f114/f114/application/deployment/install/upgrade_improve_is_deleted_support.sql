prompt --application/deployment/install/upgrade_improve_is_deleted_support
begin
--   Manifest
--     INSTALL: UPGRADE-Improve is_deleted support
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
 p_id=>wwv_flow_imp.id(20405226838198012715)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Improve is_deleted support'
,p_sequence=>30
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_STATUS$''',
'    and column_name = ''DELETED_BY'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status$',
'add ( deleted_by varchar2(255),',
'    deleted_on timestamp with local time zone );',
'/',
'',
'alter table eba_proj_status_ais$',
'add ( is_deleted_yn varchar2(1) default ''N'' not null',
'        constraint eba_proj_status_ais_ck_del',
'            check ( is_deleted_yn in (''Y'',''N'') ),',
'    deleted_by varchar2(255),',
'    deleted_on timestamp with local time zone );',
'/',
'',
'alter table eba_proj_status_ms$',
'add ( is_deleted_yn varchar2(1) default ''N'' not null',
'        constraint eba_proj_status_ms_ck_del',
'            check ( is_deleted_yn in (''Y'',''N'') ),',
'    deleted_by varchar2(255),',
'    deleted_on timestamp with local time zone );',
'/'))
);
wwv_flow_imp.component_end;
end;
/
