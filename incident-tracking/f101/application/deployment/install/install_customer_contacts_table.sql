prompt --application/deployment/install/install_customer_contacts_table
begin
--   Manifest
--     INSTALL: INSTALL-customer contacts table
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
 p_id=>wwv_flow_imp.id(2762268548244014190)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'customer contacts table'
,p_sequence=>240
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table  eba_intrack_customer_contact',
'   (',
'   id                      number constraint eba_intrack_cust_con_pk primary key,',
'   row_version_number      number not null,',
'   customer_id             number constraint eba_intrack_cust_con_fk',
'                                  references eba_intrack_customers (id)',
'                                  on delete cascade,',
'   first_name              varchar2(80),',
'   last_name               varchar2(80),',
'   email                   varchar2(255) not null,',
'   phone                   varchar2(50),',
'   phone_type              varchar2(50),',
'   phone2                  varchar2(50),',
'   phone2_type             varchar2(50),',
'   country_id              varchar2(50),',
'   department_name         varchar2(255),',
'   is_active               varchar2(1) default ''Y'' not null enable,',
'   additional_info         varchar2(4000),',
'   --',
'   created     timestamp with time zone          not null,',
'   created_by  varchar2(255) not null,',
'   updated     timestamp with time zone,',
'   updated_by  varchar2(255)',
'   )',
'/',
'',
'alter table eba_intrack_customer_contact',
'   add constraint eba_intrack_cust_con_ia_cc',
'       check (is_active in (''Y'',''N''))',
'/',
'    ',
'create index eba_intrack_cust_con_i1 on eba_intrack_customer_contact(customer_id);',
'create index eba_intrack_cust_con_i2 on eba_intrack_customer_contact(email);',
'',
'create or replace trigger biu_eba_intrack_cust_con',
'   before insert or update on eba_intrack_customer_contact',
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
'      :new.email := lower(:new.email);',
'   end;',
'/',
'show errors'))
);
wwv_flow_imp.component_end;
end;
/
