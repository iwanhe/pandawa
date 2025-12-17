prompt --application/deployment/install/install_category_table
begin
--   Manifest
--     INSTALL: INSTALL-category table
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
 p_id=>wwv_flow_imp.id(2742531760162866542)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'category table'
,p_sequence=>100
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table  eba_intrack_category',
'   (',
'   id                      number,',
'   row_version_number      number,',
'   display_sequence        number not null,',
'   category_name           varchar2(50) not null enable,',
'   parent_id               number,',
'   description             varchar2(4000),',
'   is_active               varchar2(1) default ''Y'',',
'   --',
'   created           timestamp with time zone not null,',
'   created_by        varchar2(255) not null,',
'   updated           timestamp with time zone,',
'   updated_by        varchar2(255),',
'   constraint eba_intrack_category_pk primary key(id)',
'   )',
'/',
'',
'alter table eba_intrack_category',
'   add constraint eba_intrack_cat_is_active_cc',
'       check (is_active in (''Y'',''N''))',
'/',
'',
'create or replace trigger biu_eba_intrack_category',
'   before insert or update on eba_intrack_category',
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
'   end;',
'/',
'    ',
'    ',
'insert into eba_intrack_category (id,display_sequence,category_name) values (1,10,''Installation Issue'');',
'insert into eba_intrack_category (id,display_sequence,category_name) values (2,20,''Access / Password Issue'');',
'insert into eba_intrack_category (id,display_sequence,category_name) values (3,30,''Product Issue / Defect'');',
'insert into eba_intrack_category (id,display_sequence,category_name) values (4,40,''Upgrade Issue'');',
'insert into eba_intrack_category (id,display_sequence,category_name) values (5,50,''Configuration Issue'');',
'insert into eba_intrack_category (id,display_sequence,category_name) values (6,60,''Other'');',
'commit;'))
);
wwv_flow_imp.component_end;
end;
/
