prompt --application/deployment/install/install_group_tables
begin
--   Manifest
--     INSTALL: INSTALL-group tables
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
 p_id=>wwv_flow_imp.id(2779722957051921636)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'group tables'
,p_sequence=>60
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table  eba_intrack_group',
'   (   id number,',
'           row_version_number      number,',
'   group_name varchar2(50) not null enable,',
'   description varchar2(255),',
'   is_active varchar2(1) default ''Y'',',
'   --',
'   created     timestamp with time zone not null,',
'   created_by  varchar2(255) not null,',
'   updated     timestamp with time zone,',
'   updated_by  varchar2(255)',
'   )',
'/',
'',
'',
'alter table eba_intrack_group',
'   add constraint eba_intrack_group_pk',
'     primary key (id)',
'/',
'alter table eba_intrack_group',
'  add constraint eba_intrack_group_uk',
'  unique( group_name )',
'/',
'',
'alter table eba_intrack_group',
'   add constraint eba_intrack_grp_is_act_cc',
'       check (is_active in (''y'',''n'',''Y'',''N''))',
'/',
'',
'',
'create or replace trigger biu_eba_intrack_group',
'   before insert or update on eba_intrack_group',
'   for each row',
'   begin',
'      if inserting then',
'         if :NEW.ID is null then',
'           select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'')',
'           into :new.id',
'           from dual;',
'         end if;',
'         :NEW.CREATED := current_timestamp;',
'         :NEW.CREATED_BY := nvl(v(''APP_USER''),USER);',
'         :new.row_version_number := 1;',
'      end if;',
'',
'      if updating then',
'         :NEW.UPDATED    := current_timestamp;',
'         :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'         :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'      end if;',
'   end;',
'/',
'',
'',
'create table  eba_intrack_user_group (',
'   id                          number,',
'   row_version_number          number,',
'   user_id                     number not null enable,',
'   group_id                    number not null enable,',
'   --',
'   created                     timestamp with time zone not null,',
'   created_by                  varchar2(255) not null,',
'   updated                     timestamp with time zone,',
'   updated_by                  varchar2(255),',
'    constraint eba_intrack_user_group_pk primary key(id ),',
'    constraint eba_intrack_usr_grp_usr_fk foreign key (user_id)',
'     references  eba_intrack_users (id) on delete cascade enable,',
'    constraint eba_intrack_user_grp_grp_fk foreign key (group_id)',
'     references  eba_intrack_group (id) on delete cascade enable',
'   )',
'/',
'',
'create index eba_intrack_usr_grp_i1 on eba_intrack_user_group(user_id);',
'create index eba_intrack_usr_grp_i2 on eba_intrack_user_group(group_id);',
'',
'create or replace trigger biu_eba_intrack_user_group',
'   before insert or update on eba_intrack_user_group',
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
'      if updating then',
'         :NEW.UPDATED    := current_timestamp;',
'         :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'         :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'      end if;',
'   end;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
