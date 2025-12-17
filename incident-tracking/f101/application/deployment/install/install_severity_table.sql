prompt --application/deployment/install/install_severity_table
begin
--   Manifest
--     INSTALL: INSTALL-severity table
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
 p_id=>wwv_flow_imp.id(2742453171328850899)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'severity table'
,p_sequence=>80
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table  eba_intrack_SEVERITY',
'   (',
'   id                      number,',
'   row_version_number      number,',
'   sequence_number         number not null,',
'   severity_code           varchar2(30) not null enable,',
'   SEVERITY_name           varchar2(50) not null enable,',
'   description             varchar2(255),',
'   is_active               varchar2(1) default ''Y'',',
'   --',
'   created     timestamp with time zone          not null,',
'   created_by  varchar2(255) not null,',
'   updated     timestamp with time zone,',
'   updated_by  varchar2(255),',
'    constraint eba_intrack_SEVERITY_pk primary key(id)',
'   )',
'/',
'',
'alter table eba_intrack_SEVERITY',
'   add constraint eba_intrack_SEV_is_active_cc',
'       check (is_active in (''Y'',''N''))',
'/',
'',
'create or replace trigger biu_eba_intrack_SEVERITY',
'   before insert or update on eba_intrack_SEVERITY',
'   for each row',
'   begin',
'      if inserting then',
'         if :NEW.ID is null then',
'           select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'')',
'           into :new.id',
'           from dual;',
'         end if;',
'         :NEW.CREATED    := current_timestamp;',
'         :NEW.CREATED_BY := nvl(v(''APP_USER''),USER);',
'         :new.row_version_number := 1;',
'      end if;',
'',
'      if inserting or updating then',
'         :NEW.UPDATED    := current_timestamp;',
'         :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'      end if;',
'      if updating then',
'         :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'      end if;',
'      if :new.is_active is null then',
'         :new.is_active := ''Y'';',
'      end if;',
'      if :new.sequence_number is null then',
'          select nvl(max(sequence_number),0) + 1 into :new.sequence_number from eba_intrack_severity;',
'      end if;',
'   end;',
'/',
'show errors',
'    ',
'insert into eba_intrack_SEVERITY (id,sequence_number,severity_code,SEVERITY_name) values (1,1,''10'',''Production Down System'');',
'insert into eba_intrack_SEVERITY (id,sequence_number,severity_code,SEVERITY_name) values (2,2,''20'',''No work around'');',
'insert into eba_intrack_SEVERITY (id,sequence_number,severity_code,SEVERITY_name) values (3,3,''30'',''Work around exists'');',
'insert into eba_intrack_SEVERITY (id,sequence_number,severity_code,SEVERITY_name) values (4,4,''40'',''Non critical issue'');',
'commit;',
''))
);
wwv_flow_imp.component_end;
end;
/
