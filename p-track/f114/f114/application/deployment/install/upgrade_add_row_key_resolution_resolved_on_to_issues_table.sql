prompt --application/deployment/install/upgrade_add_row_key_resolution_resolved_on_to_issues_table
begin
--   Manifest
--     INSTALL: UPGRADE-add row key, resolution, resolved_on to issues table
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
 p_id=>wwv_flow_imp.id(17333135998839092087)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'add row key, resolution, resolved_on to issues table'
,p_sequence=>610
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from user_tab_cols',
' where table_name = ''EBA_PROJ_STATUS_ISSUES$''',
'   and column_name = ''RESOLVED_ON''',
'union',
'select null',
'  from user_tab_cols',
' where table_name = ''EBA_PROJ_STATUS_ISSUES$''',
'   and column_name = ''RESOLUTION'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status_issues$ add (row_key varchar2(30), resolution varchar2(4000), resolved_on timestamp with local time zone)',
'/',
'',
'create or replace trigger biu_eba_proj_status_issues',
'    before insert or update on eba_proj_status_issues$',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if :new.row_key is null then',
'        select eba_proj_fw.compress_int(eba_proj_seq.nextval) into :new.row_key from dual;',
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
'    if :new.is_open = ''N'' then',
'        :new.resolved_on := current_timestamp;',
'    elsif :new.is_open = ''Y'' then',
'        :new.resolved_on := null;',
'    end if;',
'end;',
'/',
'',
'alter trigger  biu_eba_proj_status_issues enable',
'/'))
);
wwv_flow_imp.component_end;
end;
/
