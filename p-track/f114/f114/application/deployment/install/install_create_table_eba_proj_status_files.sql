prompt --application/deployment/install/install_create_table_eba_proj_status_files
begin
--   Manifest
--     INSTALL: INSTALL-create table eba_proj_status_files
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
 p_id=>wwv_flow_imp.id(6060584894131771780)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'create table eba_proj_status_files'
,p_sequence=>300
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_files$ (',
'    id                      number primary key,',
'    row_version_number      number,',
'    project_id              number references EBA_proj_status$(id) on delete cascade,',
'    --',
'    filename                varchar2(4000),',
'    file_mimetype           varchar2(512),',
'    file_charset            varchar2(512),',
'    file_blob               blob,',
'    file_comments           varchar2(4000),',
'    tags                    varchar2(4000),',
'    gold_yn                 varchar2(1)     default ''N'',',
'    --',
'    associated_milestone    number,',
'    associated_action_item  number,',
'    --',
'    created                 timestamp(6) with local time zone,',
'    created_by              varchar2(255),',
'    updated                 timestamp(6) with local time zone,',
'    updated_by              varchar2(255)',
'    )',
'/',
'',
'create index eba_proj_status_files_i1 on eba_proj_status_files$ (project_id);',
'create index eba_proj_status_files_i2 on eba_proj_status_files$(created);',
'',
'create or replace view eba_proj_status_files as',
'select id, ',
'    row_version_number, ',
'    project_id, ',
'    filename, ',
'    file_mimetype, ',
'    file_charset, ',
'    file_blob, ',
'    file_comments, ',
'    tags,',
'    gold_yn,',
'    associated_milestone, ',
'    associated_action_item, ',
'    created, ',
'    created_by, ',
'    updated, ',
'    updated_by ',
'from eba_proj_status_files$ f',
'where exists ( select null from eba_proj_status ps where ps.id = f.project_id );'))
);
wwv_flow_imp.component_end;
end;
/
