prompt --application/deployment/install/install_create_table_eba_proj_status_updates
begin
--   Manifest
--     INSTALL: INSTALL-create table eba_proj_status_updates
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
 p_id=>wwv_flow_imp.id(6060583607028756559)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'create table eba_proj_status_updates'
,p_sequence=>210
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_updates$ (',
'    id                      number primary key,',
'    row_version_number      number,',
'    row_key                 varchar2(30),',
'    project_id              number references EBA_proj_status$(id) on delete cascade,',
'    status_update           clob,',
'    formatted_update        clob,',
'    update_date             timestamp(6) with local time zone,',
'    update_owner            varchar2(255),',
'    upper_update_owner      varchar2(255),',
'    include_on_status_rpt   varchar2(1),',
'    classification_id       number,',
'    update_type             number references eba_proj_status_update_types(id),',
'    tags                    varchar2(4000),',
'    gold_yn                 varchar2(1) default ''N'',',
'    --',
'    created                timestamp(6) with local time zone,',
'    created_by             varchar2(255),',
'    updated                timestamp(6) with local time zone,',
'    updated_by             varchar2(255)',
'    )',
'/',
'',
'create index eba_proj_status_upd_i1 on eba_proj_status_updates$(project_id);',
'create index eba_proj_status_upd_i2 on eba_proj_status_updates$(update_type);',
'create index eba_proj_status_upd_i3 on eba_proj_status_updates$(created);',
'create index EBA_PROJ_STATUS_UPDATES_i4  on EBA_PROJ_STATUS_UPDATES$(updated,id);',
'create index eba_proj_status_updates_uuo on eba_proj_status_updates$(upper_update_owner);',
'',
'create or replace view eba_proj_status_updates as',
'select id, ',
'    row_version_number, ',
'    row_key, ',
'    project_id, ',
'    status_update,',
'    formatted_update,',
'    update_date, ',
'    update_owner,',
'    upper_update_owner,',
'    include_on_status_rpt, ',
'    classification_id, ',
'    update_type, ',
'    tags,',
'    gold_yn,',
'    created, ',
'    created_by, ',
'    updated, ',
'    updated_by',
'from eba_proj_status_updates$ u',
'where exists ( select null from eba_proj_status ps where ps.id = u.project_id );'))
);
wwv_flow_imp.component_end;
end;
/
