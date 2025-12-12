prompt --application/deployment/install/install_eba_project_status_verifications
begin
--   Manifest
--     INSTALL: INSTALL-eba_project_status_verifications
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
 p_id=>wwv_flow_imp.id(6064080311326568656)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'eba_project_status_verifications'
,p_sequence=>630
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_verifications (',
'    id                   number primary key,',
'    project_id           number references eba_proj_status$ ( id ) on delete cascade,',
'    verified_by          varchar2(255) not null,',
'    verification_comment varchar2(4000),',
'    created              timestamp(6) with local time zone,',
'    created_by           varchar2(255),',
'    updated              timestamp(6) with local time zone,',
'    updated_by           varchar2(255)',
')',
'/',
'',
'create index eba_proj_status_ver_i1 on eba_proj_status_verifications (project_id)',
'/',
'',
'create or replace trigger eba_eba_proj_status_ver',
'    before insert or update on eba_proj_status_verifications',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := localtimestamp;',
'        :new.created_by := nvl(apex_application.g_user,user);',
'    end if;',
'    if inserting or updating then',
'        :new.updated := localtimestamp;',
'        :new.updated_by := nvl(apex_application.g_user,user);',
'    end if;',
'end;',
'/',
'alter trigger eba_eba_proj_status_ver enable',
'/',
'',
'create or replace trigger aiu_eba_proj_status_ver',
'    after insert or update on eba_proj_status_verifications',
'    for each row',
'begin',
'    --',
'    -- cascade update to project',
'    --',
'    update eba_proj_status set updated = localtimestamp',
'    where  id = :new.project_id;',
'end;',
'/',
'alter trigger aiu_eba_proj_status_ver enable',
'/'))
);
wwv_flow_imp.component_end;
end;
/
