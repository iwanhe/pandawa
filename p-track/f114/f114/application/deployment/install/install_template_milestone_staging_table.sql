prompt --application/deployment/install/install_template_milestone_staging_table
begin
--   Manifest
--     INSTALL: INSTALL-Template Milestone Staging Table
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
 p_id=>wwv_flow_imp.id(20049372421420594646)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Template Milestone Staging Table'
,p_sequence=>900
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_stg_tmp_ms',
'(',
'    id                  number,',
'    session_id          number                          not null,',
'    parent_milestone    varchar2(255),',
'    template_id         number                          not null,',
'    name                varchar2(255)                   not null,',
'    row_version         number,',
'    description         varchar2(4000),',
'    owner               varchar2(255),',
'    owner_role_id       number,',
'    start_date_offset   number                          default 0 not null,',
'    due_date_offset     number                          default 1 not null,',
'    is_major_yn         varchar2(1),',
'    created             timestamp with local time zone,',
'    created_by          varchar2(255),',
'    updated             timestamp with local time zone,',
'    updated_by          varchar2(255),',
'    constraint eba_proj_stg_tmp_ms_pk primary key (id),',
'    constraint eba_proj_stg_tmp_ms_tmpl_fk',
'        foreign key (template_id)',
'        references eba_proj_templates (id)',
'        on delete cascade',
')',
'/',
'',
'create or replace trigger biu_eba_proj_stg_tmp_ms',
'    before insert or update on eba_proj_stg_tmp_ms',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.session_id := wwv_flow.g_instance;',
'        if :new.created is null then',
'            :new.created := localtimestamp;',
'        end if;',
'        if :new.created_by is null then',
'            :new.created_by := nvl(wwv_flow.g_user, user);',
'        end if;',
'        :new.row_version := 1;',
'    else',
'        :new.row_version := nvl(:old.row_version, 1) + 1;',
'    end if;',
'    :new.updated := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user, user);',
'end;',
'/',
'',
'alter trigger biu_eba_proj_stg_tmp_ms enable',
'/'))
);
wwv_flow_imp.component_end;
end;
/
