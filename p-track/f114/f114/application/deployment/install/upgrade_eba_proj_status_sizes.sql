prompt --application/deployment/install/upgrade_eba_proj_status_sizes
begin
--   Manifest
--     INSTALL: UPGRADE-eba_proj_status_sizes
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
 p_id=>wwv_flow_imp.id(11686979712522067111)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'eba_proj_status_sizes'
,p_sequence=>150
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_PROJ_STATUS_SIZES'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_sizes (',
'    id                     number primary key,',
'    project_size           varchar2(50),',
'    size_description       varchar2(4000),',
'    display_sequence       number,',
'    --',
'    created                timestamp(6) with local time zone,',
'    created_by             varchar2(255),',
'    updated                timestamp(6) with local time zone,',
'    updated_by             varchar2(255)',
'    )',
'/',
'',
'insert into eba_proj_status_sizes (id, project_size, size_description, display_sequence) values (1, ''Small'', '''', 1);',
'insert into eba_proj_status_sizes (id, project_size, size_description, display_sequence) values (2, ''Medium'', '''', 2);',
'insert into eba_proj_status_sizes (id, project_size, size_description, display_sequence) values (3, ''Large'', '''', 3);',
'insert into eba_proj_status_sizes (id, project_size, size_description, display_sequence) values (4, ''X-Large'', '''', 4);',
'',
'commit;',
'',
'CREATE OR REPLACE TRIGGER eba_proj_status_sizes_BIU',
'   before insert or update on eba_proj_status_sizes',
'   for each row',
'begin',
'',
'   if :new.ID is null then',
'     :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'   end if;',
'   ',
'   if inserting then',
'       :new.created := localtimestamp;',
'       :new.created_by := nvl(apex_application.g_user,user);',
'   end if;',
'   if inserting or updating then',
'       :new.updated := localtimestamp;',
'       :new.updated_by := nvl(apex_application.g_user,user);',
'   end if;',
'end;',
'/',
'',
'ALTER TRIGGER eba_proj_status_sizes_BIU ENABLE',
'/',
'',
'alter table eba_proj_status$',
'    add (size_id number,',
'         constraint eba_proj_status_size_fk',
'             foreign key ( size_id )',
'                 references eba_proj_status_sizes',
'    );',
'create index eba_proj_status_i17 on eba_proj_status$ (size_id);'))
);
wwv_flow_imp.component_end;
end;
/
