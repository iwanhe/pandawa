prompt --application/deployment/install/install_product_version_table
begin
--   Manifest
--     INSTALL: INSTALL-product version table
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
 p_id=>wwv_flow_imp.id(2742571143670871317)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'product version table'
,p_sequence=>120
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table  eba_intrack_version',
'   (',
'   id                      number,',
'   row_version_number      number,',
'   product_id              number not null,',
'   version_name            varchar2(100),',
'   description             varchar2(4000),',
'   release_date            timestamp with time zone default current_timestamp,',
'   is_active               varchar2(1) default ''Y'',',
'   --',
'   created                timestamp with time zone  not null,',
'   created_by             varchar2(255) not null,',
'   updated                timestamp with time zone,',
'   updated_by             varchar2(255),',
'    constraint eba_intrack_version_pk primary key(id),',
'    constraint eba_intrack_vers_prod_fk foreign key (product_id)',
'     references  eba_intrack_product (id) on delete cascade enable',
'   )',
'/',
'    ',
'create index eba_intrack_version_i1 on eba_intrack_version(product_id);',
'',
'alter table eba_intrack_version',
'   add constraint eba_intrack_ver_is_act_cc',
'       check (is_active in (''Y'',''N''))',
'/',
'',
'create or replace trigger biu_eba_intrack_version',
'   before insert or update on eba_intrack_version',
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
'         :new.row_version_number :=  1;',
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
'show errors',
'',
'insert into eba_intrack_product (id, product_name,default_assignee_id) values (1,''Alpha Analytics Accelerator'',null);',
'insert into eba_intrack_version (id, product_id,version_name) values (1,1,''1.1'');',
'insert into eba_intrack_version (id, product_id,version_name) values (2,1,''1.2'');',
'insert into eba_intrack_version (id, product_id,version_name) values (3,1,''1.3'');',
'insert into eba_intrack_version (id, product_id,version_name) values (4,1,''1.4'');',
'insert into eba_intrack_product (id, product_name,default_assignee_id) values (2,''Butler Bussiness Barcodes'',null);',
'insert into eba_intrack_version (id, product_id,version_name) values (21,2,''1.0'');',
'insert into eba_intrack_version (id, product_id,version_name) values (22,2,''2.0'');',
'insert into eba_intrack_product (id, product_name,default_assignee_id) values (3,''Sanity Testing Services Inc'',null);',
'insert into eba_intrack_version (id, product_id,version_name) values (32,3,''2.0'');',
'insert into eba_intrack_version (id, product_id,version_name) values (33,3,''3.0'');',
'insert into eba_intrack_product (id, product_name,default_assignee_id) values (4,''Oracle Database'',null);',
'insert into eba_intrack_version (id, product_id,version_name) values (41,4,''10.1'');',
'insert into eba_intrack_version (id, product_id,version_name) values (42,4,''10.2'');',
'insert into eba_intrack_version (id, product_id,version_name) values (43,4,''11.1'');',
'insert into eba_intrack_version (id, product_id,version_name) values (44,4,''11.2'');',
'insert into eba_intrack_product (id, product_name,default_assignee_id) values (5,''Oracle Application Express'',null);',
'insert into eba_intrack_version (id, product_id,version_name) values (51,5,''4.0'');',
'insert into eba_intrack_version (id, product_id,version_name) values (52,5,''4.1'');',
'insert into eba_intrack_version (id, product_id,version_name) values (53,5,''4.2'');',
'commit;'))
);
wwv_flow_imp.component_end;
end;
/
