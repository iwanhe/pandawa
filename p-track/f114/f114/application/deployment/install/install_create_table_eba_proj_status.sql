prompt --application/deployment/install/install_create_table_eba_proj_status
begin
--   Manifest
--     INSTALL: INSTALL-CREATE TABLE EBA_proj_status$
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
 p_id=>wwv_flow_imp.id(6060579399278744869)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'CREATE TABLE EBA_proj_status$'
,p_sequence=>160
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE TABLE eba_proj_status$ (',
'    id                        number  primary key,',
'    is_deleted_yn             varchar2(1) default ''N'' not null',
'        constraint eba_proj_status_ck_del',
'            check ( is_deleted_yn in (''Y'',''N'') ),',
'    deleted_by varchar2(255),',
'    deleted_on timestamp with local time zone,',
'    --',
'    template_id               number,',
'    row_version_number        number,',
'    cat_id                    number  references eba_proj_status_cats(id),',
'    parent_project_id         number  references eba_proj_status$(id) on delete cascade,',
'    row_key                   varchar2(30),',
'    project                   varchar2(200),',
'    description               varchar2(4000),',
'    project_customer          varchar2(255),',
'    logo_blob                 blob,',
'    logo_name                 varchar2(512),',
'    logo_mimetype             varchar2(512),',
'    logo_charset              varchar2(512),',
'    logo_lastupd              date,',
'    acl_status_level          number default 1 not null',
'        constraint eba_proj_status_ck_acl',
'            check ( acl_status_level in (1, 2, 3) ),',
'    --',
'    project_flex_01           varchar2(4000),',
'    project_flex_02           varchar2(4000),',
'    project_flex_03           varchar2(4000),',
'    project_flex_04           varchar2(4000),',
'    project_flex_05           varchar2(4000),',
'    project_flex_06           varchar2(4000),',
'    project_flex_07           varchar2(4000),',
'    project_flex_08           varchar2(4000),',
'    project_flex_n01          number,',
'    project_flex_n02          number,',
'    project_flex_n03          number,',
'    project_flex_n04          number,',
'    project_flex_d01          timestamp with local time zone,',
'    project_flex_d02          timestamp with local time zone,',
'    project_flex_d03          timestamp with local time zone,',
'    project_flex_d04          timestamp with local time zone,',
'    project_flex_d05          timestamp with local time zone,',
'    project_flex_d06          timestamp with local time zone,',
'    project_flex_d07          timestamp with local time zone,',
'    project_flex_d08          timestamp with local time zone,',
'    project_flex_d09          timestamp with local time zone,',
'    project_flex_d10          timestamp with local time zone,',
'    project_flex_d11          timestamp with local time zone,',
'    project_flex_d12          timestamp with local time zone,',
'    project_flex_clob         clob,',
'    --',
'    project_status            number  references eba_proj_status_codes(id),',
'    restrict_ms_ai_management varchar2(1),',
'    size_id                   number,',
'    tags                      varchar2(4000),',
'    next_milestone_name       varchar2(100),',
'    next_milestone_date       timestamp(6) with local time zone,',
'    goal                      varchar2(4000),',
'    what_is_success           varchar2(4000),',
'    url                       varchar2(4000),',
'    include_by_default_yn     varchar2(1),',
'    code_name                 varchar2(255),',
'    deal_type_id              number,',
'    project_start_date        timestamp(6) with local time zone,',
'    --',
'    headline                  varchar2(4000),',
'    headline_last_updated     timestamp with local time zone,',
'    requesting_team           varchar2(255),',
'    impacted_environment      varchar2(255),',
'    --',
'    created                   timestamp(6) with local time zone,',
'    created_by                varchar2(255),',
'    updated                   timestamp(6) with local time zone,',
'    updated_by                varchar2(255),',
'    --',
'    constraint eba_proj_status_size_fk',
'        foreign key( size_id )',
'            references EBA_PROJ_STATUS_SIZES(id),',
'    constraint eba_proj_deal_type_fk',
'        foreign key( deal_type_id )',
'            references eba_proj_deal_types(id)',
')',
'/',
'',
'create unique index eba_proj_status_project_unq on eba_proj_status$ (project);',
'create index eba_proj_status_i1 on eba_proj_status$ (cat_id);',
'create index eba_proj_status_i2 on eba_proj_status$ (project_status);',
'create index eba_proj_status_i3 on eba_proj_status$ (row_key);',
'create index eba_proj_status_i16 on eba_proj_status$ (parent_project_id);',
'create index eba_proj_status_i17 on eba_proj_status$ (size_id);',
'create index eba_proj_status_i18 on eba_proj_status$ (created);',
'create index eba_proj_status_i19 on eba_proj_status$ (deal_type_id);'))
);
wwv_flow_imp.component_end;
end;
/
