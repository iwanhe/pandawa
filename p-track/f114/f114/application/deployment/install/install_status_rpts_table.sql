prompt --application/deployment/install/install_status_rpts_table
begin
--   Manifest
--     INSTALL: INSTALL-Status_rpts table
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
 p_id=>wwv_flow_imp.id(6061405712852142474)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Status_rpts table'
,p_sequence=>420
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_rpts$ (',
'    id                      number primary key,',
'    row_version_number      number,',
'    row_key                 varchar2(30),',
'    project_id              number references eba_proj_status$(id) on delete cascade not null,',
'    status_title            varchar2(255)  not null,',
'    status_update           clob,',
'    update_date             timestamp(6) with local time zone not null,',
'    update_owner            varchar2(255)  not null,',
'    viewable_by             varchar2(255)  not null,',
'    editable_by             varchar2(255)  not null,',
'    --',
'    created                 timestamp(6) with local time zone,',
'    created_by              varchar2(255),',
'    updated                 timestamp(6) with local time zone,',
'    updated_by              varchar2(255)',
'    )',
'/',
'',
'create index eba_proj_status_rpts_i1 on eba_proj_status_rpts$(project_id);',
'create index eba_proj_status_rpts_i2 on eba_proj_status_rpts$(update_owner);',
'create index eba_proj_status_rpts_i3 on eba_proj_status_rpts$(created);',
'',
'create or replace view eba_proj_status_rpts as',
'select id, ',
'    row_version_number, ',
'    row_key, ',
'    project_id, ',
'    status_title, ',
'    status_update, ',
'    update_date, ',
'    update_owner, ',
'    viewable_by, ',
'    editable_by, ',
'    created, ',
'    created_by, ',
'    updated, ',
'    updated_by ',
'from eba_proj_status_rpts$ r',
'where exists ( select null from eba_proj_status ps where ps.id = r.project_id );'))
);
wwv_flow_imp.component_end;
end;
/
