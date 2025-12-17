prompt --application/deployment/install/install_assignees
begin
--   Manifest
--     INSTALL: INSTALL-assignees
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
 p_id=>wwv_flow_imp.id(3335154271641640391)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'assignees'
,p_sequence=>315
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_intrack_assignees (',
'   id                      number         not null,',
'   row_version_number      number         not null,',
'   row_key                 varchar2(60)   not null,',
'   assignee_name           varchar2(255)  not null,',
'   assignee_name_upper     varchar2(255)  not null,',
'   email                   varchar2(255),',
'   im                      varchar2(255),',
'   phone1                  varchar2(255),',
'   phone2                  varchar2(255),',
'   tz_preference           varchar2(255),',
'   --',
'   created               timestamp with time zone not null,',
'   created_by            varchar2(255) not null,',
'   updated               timestamp with time zone,',
'   updated_by            varchar2(255),',
'   --',
'   flex_n01                number,',
'   flex_n02                number,',
'   flex_n03                number,',
'   flex_n04                number,',
'   flex_d01                timestamp with time zone,',
'   flex_d02                timestamp with time zone,',
'   flex_d03                timestamp with time zone,',
'   flex_d04                timestamp with time zone,',
'   flex_01                 varchar2(4000),',
'   flex_02                 varchar2(4000),',
'   flex_03                 varchar2(4000),',
'   flex_04                 varchar2(4000),',
'   flex_05                 varchar2(4000),',
'   flex_06                 varchar2(4000),',
'   flex_07                 varchar2(4000),',
'   flex_08                 varchar2(4000)',
'   )',
'/',
'alter table eba_intrack_assignees',
'   add constraint eba_intrack_assignees_pk',
'       primary key (id)',
'/',
'create unique index eba_intrack_assignees_uk on eba_intrack_assignees(assignee_name_upper)',
'/',
'',
'',
'create or replace trigger biu_eba_intrack_assignees',
'   before insert or update on eba_intrack_assignees',
'   for each row',
'begin',
'      if inserting then',
'         if :NEW.ID is null then',
'           select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'')',
'           into :new.id',
'           from dual;',
'         end if;',
'         :NEW.CREATED    := current_timestamp;',
'         :NEW.CREATED_BY := nvl(v(''APP_USER''),USER);',
'         :NEW.UPDATED    := current_timestamp;',
'         :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'         :new.row_version_number := 1;',
'         :new.assignee_name_upper := trim(upper(:new.assignee_name));',
'      end if;',
'',
'      if :new.row_key is null then',
'         select eba_intrack_fw.compress_int(eba_intrack_seq.nextval) into :new.row_key from dual;',
'      end if;',
'',
'      if updating then',
'         :NEW.UPDATED := current_timestamp;',
'         :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'         :new.row_version_number := nvl(:new.row_version_number,0) + 1;',
'         :new.assignee_name_upper := trim(upper(:new.assignee_name));',
'      end if;',
'end;',
'/',
'show errors',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
