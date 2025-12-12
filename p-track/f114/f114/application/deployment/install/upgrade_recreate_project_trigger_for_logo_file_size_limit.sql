prompt --application/deployment/install/upgrade_recreate_project_trigger_for_logo_file_size_limit
begin
--   Manifest
--     INSTALL: UPGRADE-recreate project trigger for logo file size limit
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(4064248335836963233)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'recreate project trigger for logo file size limit'
,p_sequence=>1290
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_STATUS$''',
'    and column_name = ''LOGO_BLOB'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger bi_eba_proj_status',
'    before insert or update on eba_proj_status$',
'    for each row',
'begin',
'    if :new.tags is not null then',
'        :new.tags := eba_proj_fw.tags_cleaner(:new.tags);',
'    end if;',
'    if (inserting or updating) and nvl(dbms_lob.getlength(:new.logo_blob),0) > 51200 then',
'        raise_application_error(-20000, ''The size of the uploaded file was over 50KB. Please upload a smaller file.'');',
'    end if;',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'        :new.row_version_number := 1;',
'    elsif updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'    if inserting or updating then',
'        :new.updated := localtimestamp;',
'        :new.updated_by := nvl(wwv_flow.g_user,user);',
'    end if;',
'    if :new.row_key is null then',
'        select eba_proj_fw.compress_int(eba_proj_seq.nextval) into :new.row_key from dual;',
'    end if;',
'    if :new.headline is null then',
'        :new.headline_last_updated := null;',
'    elsif :new.headline != nvl(:old.headline,''#X#X#X'') then',
'        :new.headline_last_updated := localtimestamp;',
'    end if;',
'    eba_proj_fw.tag_sync(',
'        p_new_tags      => :new.tags,',
'        p_old_tags      => :old.tags,',
'        p_content_type  => ''STATUS'',',
'        p_content_id    => :new.id );',
'end;',
'/',
'alter trigger bi_eba_proj_status enable',
'/'))
);
wwv_flow_imp.component_end;
end;
/
