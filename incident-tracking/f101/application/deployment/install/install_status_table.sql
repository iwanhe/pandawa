prompt --application/deployment/install/install_status_table
begin
--   Manifest
--     INSTALL: INSTALL-status table
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
 p_id=>wwv_flow_imp.id(2742492463840858201)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'status table'
,p_sequence=>90
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table  eba_intrack_status',
'   (',
'   id                 number not null,',
'   row_version_number number not null,',
'   display_sequence   number not null,',
'   status_name        varchar2(255) not null enable,',
'   status_code        varchar2(50),',
'   description        varchar2(4000),',
'   is_active          varchar2(1) default ''Y'',',
'   status_type        varchar2(30) constraint eba_intrack_status_ty_cc check (status_type in (''OPEN'',''CLOSED'')),',
'   --',
'   created            timestamp with time zone not null,',
'   created_by         varchar2(255) not null,',
'   updated            timestamp with time zone,',
'   updated_by         varchar2(255),',
'    constraint eba_intrack_status_pk primary key(id )',
'   )',
'/',
'',
'alter table eba_intrack_status',
'   add constraint eba_intrack_stat_is_active_cc',
'       check (is_active in (''Y'',''N''))',
'/',
'',
'create or replace trigger biu_eba_intrack_status',
'   before insert or update on eba_intrack_status',
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
'      if :new.status_code is null then',
'          :new.status_code := upper(:new.status_name);',
'      end if;',
'   end;',
'/',
'show errors',
'',
'insert into eba_intrack_status (display_sequence,id,status_name, status_code, status_type) values (10,1,''Open'',''10'',''OPEN'');',
'insert into eba_intrack_status (display_sequence,id,status_name, status_code, status_type) values (20,2,''Pending Additional Information'',''20'',''OPEN'');',
'insert into eba_intrack_status (display_sequence,id,status_name, status_code, status_type) values (30,3,''Researching'',''30'',''OPEN'');',
'insert into eba_intrack_status (display_sequence,id,status_name, status_code, status_type) values (40,4,''Resolution Commmunicated to Customer'',''40'',''OPEN'');',
'insert into eba_intrack_status (display_sequence,id,status_name, status_code, status_type) values (50,5,''Closed and Resolved'',''80'',''CLOSED'');',
'insert into eba_intrack_status (display_sequence,id,status_name, status_code, status_type) values (60,6,''Closed with Bug Filed'',''81'',''CLOSED'');',
'insert into eba_intrack_status (display_sequence,id,status_name, status_code, status_type) values (70,7,''Closed with Enhancement Request Filed'',''82'',''CLOSED'');',
'insert into eba_intrack_status (display_sequence,id,status_name, status_code, status_type) values (80,8,''Closed Without Resolution'',''83'',''CLOSED'');',
'insert into eba_intrack_status (display_sequence,id,status_name, status_code, status_type) values (90,9,''Closed Other Reason'',''84'',''CLOSED'');',
'commit;'))
);
wwv_flow_imp.component_end;
end;
/
