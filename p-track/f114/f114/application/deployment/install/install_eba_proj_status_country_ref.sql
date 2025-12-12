prompt --application/deployment/install/install_eba_proj_status_country_ref
begin
--   Manifest
--     INSTALL: INSTALL-eba_proj_status_country_ref
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
 p_id=>wwv_flow_imp.id(18873956431605494701)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'eba_proj_status_country_ref'
,p_sequence=>240
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_country_ref$ (',
'    id          number,',
'    project_id  number not null,',
'    country_id  number not null,',
'    --',
'    created             timestamp with local time zone,',
'    created_by          varchar2(255),',
'    updated             timestamp with local time zone,',
'    updated_by          varchar2(255),',
'    --',
'    constraint eba_proj_status_country_ref_pk',
'        primary key (id),',
'    constraint eba_proj_status_country_fk1',
'        foreign key (project_id)',
'        references eba_proj_status$( id ) on delete cascade,',
'    constraint eba_proj_status_country_fk2',
'        foreign key (country_id)',
'        references eba_proj_countries( id ) on delete cascade',
');',
'create index eba_proj_status_country_ref_i1 on eba_proj_status_country_ref$( project_id );',
'create index eba_proj_status_country_ref_i2 on eba_proj_status_country_ref$( country_id );',
'',
'create or replace trigger biu_eba_proj_status_cntry_ref',
'    before insert or update on eba_proj_status_country_ref$',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'    end if;',
'    if :new.project_id is not null then',
'        update eba_proj_status$ set updated = localtimestamp where id = :new.project_id;',
'    end if;',
'    :new.updated := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'end biu_eba_proj_status_cntry_ref;',
'/',
'alter trigger biu_eba_proj_status_cntry_ref enable;',
'/',
'',
'create or replace view eba_proj_status_country_ref as',
'select rf.id,',
'    rf.project_id,',
'    rf.country_id,',
'    rf.created,',
'    rf.created_by,',
'    rf.updated,',
'    rf.updated_by',
'from eba_proj_status_country_ref$ rf',
'where exists ( select null from eba_proj_status p where p.id = rf.project_id );',
'/'))
);
wwv_flow_imp.component_end;
end;
/
