prompt --application/deployment/install/install_create_table_eba_proj_status_rpt_proj_upd
begin
--   Manifest
--     INSTALL: INSTALL-create table eba_proj_status_rpt_proj_upd 
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
 p_id=>wwv_flow_imp.id(6060589099110782614)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'create table eba_proj_status_rpt_proj_upd '
,p_sequence=>320
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_rpt_proj_upd$ (',
'    id                      number primary key,',
'    row_version_number      number,',
'    update_id               number ,',
'    report_id               number references eba_proj_status_reports$(id) on delete cascade,',
'    project_id              number not null,',
'    --',
'    created                timestamp(6) with local time zone,',
'    created_by             varchar2(255),',
'    updated                timestamp(6) with local time zone,',
'    updated_by             varchar2(255)',
'    )',
'/',
'',
'create index eba_proj_stat_rpt_proj_upd_i1 on eba_proj_status_rpt_proj_upd$ (report_id);',
'create index eba_proj_stat_rpt_proj_upd_i2 on eba_proj_status_rpt_proj_upd$ (project_id);',
'create index eba_proj_stat_rpt_proj_upd_i3 on eba_proj_status_rpt_proj_upd$ (update_id);',
'',
'create or replace view eba_proj_status_rpt_proj_upd as',
'select id, ',
'    row_version_number, ',
'    update_id, ',
'    report_id, ',
'    project_id, ',
'    created, ',
'    created_by, ',
'    updated, ',
'    updated_by ',
'from eba_proj_status_rpt_proj_upd$ u',
'where exists ( select null from eba_proj_status ps where ps.id = u.project_id );'))
);
wwv_flow_imp.component_end;
end;
/
