prompt --application/deployment/install/install_create_table_eba_proj_status_ms
begin
--   Manifest
--     INSTALL: INSTALL-create table eba_proj_status_ms$
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
 p_id=>wwv_flow_imp.id(6060584688243770054)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'create table eba_proj_status_ms$'
,p_sequence=>290
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_ms$ (',
'    id                      number primary key,',
'    --',
'    is_deleted_yn varchar2(1) default ''N'' not null',
'        constraint eba_proj_status_ms_ck_del',
'            check ( is_deleted_yn in (''Y'',''N'') ),',
'    deleted_by varchar2(255),',
'    deleted_on timestamp with local time zone,',
'    --',
'    template_id             number,',
'    row_version_number      number,',
'    row_key                 varchar2(30),',
'    project_id              number references EBA_proj_status$(id) on delete cascade,',
'    milestone_name          varchar2(255),',
'    milestone_description   varchar2(4000),',
'    milestone_date          timestamp(6) with local time zone not null,',
'    MILESTONE_START_DATE    timestamp(6) with local time zone,',
'    original_due_date       timestamp(6) with local time zone,',
'    completed_date          timestamp(6) with local time zone,',
'    completed_by            varchar2(255),',
'    milestone_status        varchar2(30),',
'    milestone_owner         varchar2(255),',
'    owner_role_id           number,',
'    is_major_yn             varchar2(1),',
'    tags                    varchar2(4000),',
'    --',
'    milestone_flex_01   varchar2(4000),',
'    milestone_flex_02   varchar2(4000),',
'    milestone_flex_03   varchar2(4000),',
'    milestone_flex_04   varchar2(4000),',
'    milestone_flex_05   varchar2(4000),',
'    milestone_flex_06   varchar2(4000),',
'    milestone_flex_07   varchar2(4000),',
'    milestone_flex_08   varchar2(4000),',
'    milestone_flex_n01  number,',
'    milestone_flex_n02  number,',
'    milestone_flex_n03  number,',
'    milestone_flex_n04  number,',
'    milestone_flex_d01  timestamp with local time zone,',
'    milestone_flex_d02  timestamp with local time zone,',
'    milestone_flex_d03  timestamp with local time zone,',
'    milestone_flex_d04  timestamp with local time zone,',
'    milestone_flex_clob clob,',
'    --',
'    created                 timestamp(6) with local time zone,',
'    created_by              varchar2(255),',
'    updated                 timestamp(6) with local time zone,',
'    updated_by              varchar2(255),',
'    --',
'    constraint eba_proj_status_ms_temp_fk foreign key ( template_id )',
'        references eba_proj_template_ms(id) on delete set null',
'    )',
'/',
'',
'',
'create index eba_proj_status_ms_i1 on eba_proj_status_ms$ (project_id);',
'create index eba_proj_status_ms_i2 on eba_proj_status_ms$ (milestone_date);',
'create index eba_proj_status_ms_i3 on eba_proj_status_ms$ (created);',
'create index eba_proj_status_ms_i4 on eba_proj_status_ms$ (template_id);',
'',
'create or replace view eba_proj_status_ms as',
'select id,',
'    template_id,',
'    row_version_number, ',
'    row_key, ',
'    project_id, ',
'    milestone_name, ',
'    milestone_description, ',
'    milestone_date, ',
'    milestone_start_date,',
'    original_due_date,',
'    completed_date,',
'    completed_by,',
'    milestone_status,',
'    owner_role_id,',
'    milestone_owner, ',
'    is_major_yn,',
'    is_deleted_yn,',
'    tags, ',
'    milestone_flex_01, ',
'    milestone_flex_02, ',
'    milestone_flex_03, ',
'    milestone_flex_04, ',
'    milestone_flex_05, ',
'    milestone_flex_06, ',
'    milestone_flex_07, ',
'    milestone_flex_08, ',
'    milestone_flex_n01, ',
'    milestone_flex_n02, ',
'    milestone_flex_n03, ',
'    milestone_flex_n04, ',
'    milestone_flex_d01, ',
'    milestone_flex_d02, ',
'    milestone_flex_d03, ',
'    milestone_flex_d04, ',
'    milestone_flex_clob, ',
'    created, ',
'    created_by, ',
'    updated, ',
'    updated_by ',
'from eba_proj_status_ms$ m',
'where exists ( select null from eba_proj_status ps where ps.id = m.project_id )',
'    and is_deleted_yn = ''N'';'))
);
wwv_flow_imp.component_end;
end;
/
