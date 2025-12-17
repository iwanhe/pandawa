prompt --application/deployment/install/install_files_table
begin
--   Manifest
--     INSTALL: INSTALL-files table
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
 p_id=>wwv_flow_imp.id(2791234366226999138)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'files table'
,p_sequence=>330
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_intrack_files (',
'    id                      number primary key,',
'    row_version_number      number,',
'    incident_id             number references eba_intrack_incidents(id) on delete cascade,',
'    --',
'    filename                varchar2(4000),',
'    file_mimetype           varchar2(512),',
'    file_charset            varchar2(512),',
'    file_blob               blob,',
'    file_comments           varchar2(4000),',
'    tags                    varchar2(4000),',
'    --',
'    created                 timestamp with time zone,',
'    created_by              varchar2(255),',
'    updated                 timestamp with time zone,',
'    updated_by              varchar2(255)',
'    )',
'/',
'',
'create index eba_intrack_files_i1 on eba_intrack_files (incident_id);',
'',
'alter table eba_intrack_files add constraint eba_intrack_files_uq_id_fn unique (incident_id, filename);',
'',
'',
'CREATE OR REPLACE TRIGGER biu_eba_intrack_files',
'   before insert or update on eba_intrack_files',
'   for each row',
'begin',
'  if (inserting or updating) and nvl(dbms_lob.getlength(:new.file_blob),0) > 15728640 then',
'    raise_application_error(-20000, ''The size of the uploaded file was over 15MB. Please upload a smaller file.'');',
'  end if;',
'  if :new.tags is not null then',
'    :new.tags := eba_intrack_fw.tags_cleaner(:new.tags);',
'  end if;',
'  if :new.id is null then',
'    select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from dual;',
'  end if;',
'  if inserting then',
'    :new.created := current_timestamp;',
'    :new.created_by := nvl(wwv_flow.g_user,user);',
'    :new.row_version_number := 1;',
'  elsif updating then',
'    :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'  end if;',
'  if inserting or updating then',
'    :new.updated := current_timestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'  end if;',
'  eba_intrack_fw.tag_sync(',
'    p_new_tags      => :new.tags,',
'    p_old_tags      => :old.tags,',
'    p_content_type  => ''FILE'',',
'    p_content_id    => :new.id);',
'end;',
'/',
'ALTER TRIGGER biu_eba_intrack_files ENABLE',
'/',
'',
'',
'create or replace trigger eba_intrack_files_bd',
'    before delete on eba_intrack_files',
'    for each row',
'begin',
'',
'    eba_intrack_fw.tag_sync(',
'        p_new_tags      => null,',
'        p_old_tags      => :old.tags,',
'        p_content_type  => ''FILE'',',
'        p_content_id    => :old.id );',
'',
'end eba_intrack_files_bd;',
'/',
'show errors',
''))
);
wwv_flow_imp.component_end;
end;
/
