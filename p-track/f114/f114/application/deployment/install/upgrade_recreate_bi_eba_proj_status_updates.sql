prompt --application/deployment/install/upgrade_recreate_bi_eba_proj_status_updates
begin
--   Manifest
--     INSTALL: UPGRADE-recreate bi_eba_proj_status_updates
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
 p_id=>wwv_flow_imp.id(4194368099100307129)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'recreate bi_eba_proj_status_updates'
,p_sequence=>1310
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger bi_eba_proj_status_updates',
'    before insert or update on eba_proj_status_updates$',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if :new.tags is not null then',
'        :new.tags := eba_proj_fw.tags_cleaner(:new.tags);',
'    end if;',
'    if inserting then',
'        :new.created := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'        :new.row_version_number := 1;',
'    elsif updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'    :new.updated := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'    if :new.row_key is null then',
'        :new.row_key := eba_proj_fw.compress_int(eba_proj_seq.nextval);',
'    end if;',
'    if :new.update_date is null then',
'        :new.update_date := localtimestamp;',
'    end if;',
'    if :new.update_owner is null then',
'        :new.update_owner := nvl(wwv_flow.g_user,user);',
'    end if;',
'',
'    :new.update_owner := lower(:new.update_owner);',
'    :new.upper_update_owner := upper(:new.update_owner);',
'    :new.formatted_update := eba_proj_fw.save_formatted_status_update( :new.status_update );',
'',
'    eba_proj_fw.tag_sync(',
'        p_new_tags      => :new.tags,',
'        p_old_tags      => :old.tags,',
'        p_content_type  => ''UPDATES'',',
'        p_content_id    => :new.id );',
'end;',
'/',
'alter trigger bi_eba_proj_status_updates enable',
'/'))
);
wwv_flow_imp.component_end;
end;
/
