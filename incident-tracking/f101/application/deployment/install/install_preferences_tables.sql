prompt --application/deployment/install/install_preferences_tables
begin
--   Manifest
--     INSTALL: INSTALL-Preferences tables
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(2740035842672372964)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Preferences tables'
,p_sequence=>40
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_intrack_preferences (',
'    id                      number              not null',
'                                                constraint eba_intrack_preferences_pk',
'                                                primary key,',
'    preference_name         varchar2(255)       not null',
'                                                constraint eba_intrack_prefs_prefname_ck',
'                                                check (upper(preference_name)=preference_name),',
'    preference_value        varchar2(255)       not null,',
'    preference_description  varchar2(4000)      null,',
'    created_by              varchar2(255)       not null,',
'    created                 timestamp with time zone,',
'    updated_by              varchar2(255),',
'    updated                 timestamp with time zone )',
'/',
'create unique index eba_intrack_preferences_uk on eba_intrack_preferences (preference_name);',
'/',
'',
'create or replace trigger eba_intrack_preferences_biu',
'before insert or update on eba_intrack_preferences',
'    for each row',
'begin',
'    if inserting and :new.id is null then',
'        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'')',
'        into :new.id',
'        from dual;',
'    end if;',
'    if inserting then',
'        :new.created_by := nvl(v(''APP_USER''),USER);',
'        :new.created    := current_timestamp;',
'    end if;',
'    if updating then',
'        :new.updated_by := nvl(v(''APP_USER''),USER);',
'        :new.updated    := current_timestamp;',
'    end if;',
'    :new.preference_name := upper(:new.preference_name);',
'end;',
'/',
'alter trigger eba_intrack_preferences_biu enable;',
'/',
'insert into eba_intrack_preferences (id, preference_name, preference_value) values (1, ''ACCESS_CONTROL_ENABLED'', ''N'');',
'insert into eba_intrack_preferences (id, preference_name, preference_value) values (2, ''ACCESS_CONTROL_SCOPE'', ''ACL_ONLY'');    ',
'insert into eba_intrack_preferences (id,preference_name,preference_value,preference_description) values (3,''DEFAULT_STATUS'',''1'',''ID column value from status table'');',
'insert into eba_intrack_preferences (id,preference_name,preference_value,preference_description) values (4,''DEFAULT_CATEGORY'',''1'',''ID column value from category table'');',
'insert into eba_intrack_preferences (id,preference_name,preference_value,preference_description) values (5,''DEFAULT_URGENCY'',''3'',''ID column value from urgency table'');',
'insert into eba_intrack_preferences (id,preference_name,preference_value,preference_description) values (6,''DEFAULT_SEVERITY'',''3'',''ID column value from severity table'' );',
'insert into eba_intrack_preferences (id,preference_name,preference_value,preference_description) values (7,''SYSTEM_NAME'',''Sample Incident Tracking'',''Any name you like'');',
'insert into eba_intrack_preferences (id,preference_name,preference_value,preference_description) values (8,''AUTO_ASSIGN'',''Y'',''valid values are Y and N, if Y new tickets will be auto assigned'');',
'insert into eba_intrack_preferences (id,preference_name,preference_value,preference_description) values (9,''ALLOW_ATTACHMENTS'',''Y'',''valid values are Y and N, if Y attachements will be exposed in the UI'');',
'insert into eba_intrack_preferences (id,preference_name,preference_value,preference_description) values (10,''USERNAME_FORMAT'',''EMAIL'',''Defines the format of the ACL usernames EMAIL or STRING'');',
'commit;'))
);
wwv_flow_imp.component_end;
end;
/
