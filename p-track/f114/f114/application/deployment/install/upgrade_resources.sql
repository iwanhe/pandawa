prompt --application/deployment/install/upgrade_resources
begin
--   Manifest
--     INSTALL: UPGRADE-Resources
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
 p_id=>wwv_flow_imp.id(12018342548426429122)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Resources'
,p_sequence=>160
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_PROJ_RESOURCES$'';'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_resource_types (',
'    id                      number ',
'                            constraint eba_proj_resource_types_pk',
'                            primary key, ',
'    resource_type           varchar2(255) not null,',
'    notes                   varchar2(4000),',
'    --',
'    created                 timestamp (6) with local time zone, ',
'    created_by              varchar2(255), ',
'    updated                 timestamp (6) with local time zone, ',
'    updated_by              varchar2(255)',
')',
'/',
'',
'create or replace trigger eba_proj_resource_types_biu',
'    before insert or update on eba_proj_resource_types',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'    end if;',
'    :new.updated := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'end;',
'/',
'',
'alter trigger eba_proj_resource_types_biu enable',
'/',
'',
'create table eba_proj_resources$ (',
'    id                      number ',
'                            constraint eba_proj_resources_pk',
'                            primary key, ',
'    row_version_number      number, ',
'    project_id              number',
'                            constraint eba_proj_resources_proj_fk',
'                            references eba_proj_status$(id)',
'                            on delete cascade, ',
'    resource_name           varchar2(255) not null,',
'    notes                   varchar2(4000),',
'    resource_type_id           number',
'                            constraint eba_proj_resources_type_fk',
'                            references eba_proj_resource_types(id)',
'                            on delete cascade,',
'    --',
'    created                 timestamp (6) with local time zone, ',
'    created_by              varchar2(255), ',
'    updated                 timestamp (6) with local time zone, ',
'    updated_by              varchar2(255)',
')',
'/',
'',
'create index  eba_proj_resources_i1 on  eba_proj_resources$(project_id)',
'/',
'create index  eba_proj_resources_i2 on  eba_proj_resources$(resource_type_id)',
'/',
'',
'create or replace trigger eba_proj_resources_aiu',
'    after insert or update on eba_proj_resources$',
'    for each row',
'begin',
'    --',
'    -- cascade update to project',
'    --',
'    update eba_proj_status$ set updated = localtimestamp',
'    where  id = :new.project_id;',
'end;',
'/',
'',
'alter trigger eba_proj_resources_aiu enable',
'/',
'',
'create or replace trigger eba_proj_resources_biu ',
'    before insert or update on eba_proj_resources$',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'        :new.row_version_number := 1;',
'    elsif updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'    :new.updated := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'end;',
'/',
'',
'alter trigger  eba_proj_resources_biu enable',
'/'))
);
wwv_flow_imp.component_end;
end;
/
