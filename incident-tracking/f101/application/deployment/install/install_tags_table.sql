prompt --application/deployment/install/install_tags_table
begin
--   Manifest
--     INSTALL: INSTALL-tags table
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
 p_id=>wwv_flow_imp.id(2740094773147381730)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'tags table'
,p_sequence=>50
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE TABLE eba_intrack_tags (',
'    id                      number primary key,',
'    tag                     varchar2(255) not null,',
'    content_id              number,',
'    content_type            varchar2(30)',
'                            constraint eba_intrack_tags_ck check',
'                            (content_type in (''INCIDENT'',''CUSTOMER'',''FILE'')),',
'    --',
'    created                 timestamp with time zone,',
'    created_by              varchar2(255),',
'    updated                 timestamp with time zone,',
'    updated_by              varchar2(255)',
'    )',
'/',
'',
'create or replace trigger biu_eba_intrack_tags',
'   before insert or update on eba_intrack_tags',
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
'      end if;',
'',
'      if updating then',
'         :NEW.UPDATED := current_timestamp;',
'         :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'      end if;',
'end;',
'/',
'show errors',
'',
'create table eba_intrack_tags_type_sum (',
'    tag                             varchar2(255),',
'    content_type                    varchar2(30),',
'    tag_count                       number,',
'    constraint eba_intrack_tags_type_sum_pk primary key (tag,content_type)',
'    )',
'/',
'',
'create table eba_intrack_tags_sum (',
'    tag                             varchar2(255),',
'    tag_count                       number,',
'    constraint eba_intrack_tags_sum_pk primary key (tag)',
'    )',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
