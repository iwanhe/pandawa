prompt --application/deployment/install/upgrade_remove_text_search
begin
--   Manifest
--     INSTALL: UPGRADE-Remove Text Search
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
 p_id=>wwv_flow_imp.id(989732973385330924)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Remove Text Search'
,p_sequence=>1390
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    procedure drop_text_preference( p_pref_name in varchar2 ) is',
'    begin',
'        execute immediate ''begin ctx_ddl.drop_preference('''''' || p_pref_name || ''''''); end;'';',
'    exception when others then',
'        null;',
'    end drop_text_preference;',
'',
'begin',
'    -- Drop any old text indexes',
'    for c1 in ( select index_name',
'                from user_indexes',
'                where index_name in (',
'                    ''EBA_PROJ_STATUS_TXT1_IDX'',',
'                    ''EBA_PROJ_STATUS_TXT2_IDX'',',
'                    ''EBA_PROJ_AI_TXT_IDX'',',
'                    ''EBA_PROJ_FILES_TXT_IDX'',',
'                    ''EBA_PROJ_LINKS_TXT_IDX'',',
'                    ''EBA_PROJ_MS_TXT_IDX'',',
'                    ''EBA_PROJ_RPTS_TXT_IDX'',',
'                    ''EBA_PROJ_UPDATES_TXT_IDX'',',
'                    ''EBA_PROJ_USERS_TXT_IDX'',',
'                    ''EBA_PROJ_TAGS_TXT_IDX'',',
'                    ''EBA_PROJ_ISSUES_TXT_IDX'',',
'                    ''EBA_PROJ_RES_TXT_IDX''',
'                    )) loop',
'        execute immediate ''drop index ''||c1.index_name;',
'    end loop;',
'',
'    drop_text_preference( ''eba_proj_status_multi'' );',
'    drop_text_preference( ''eba_proj_files_multi'' );',
'    drop_text_preference( ''eba_proj_links_multi'' );',
'    drop_text_preference( ''eba_proj_status_ms_multi'' );',
'    drop_text_preference( ''eba_proj_status_ais_multi'' );',
'    drop_text_preference( ''eba_proj_status_rpts_multi'' );',
'    drop_text_preference( ''eba_proj_status_iss_multi'' );',
'    drop_text_preference( ''eba_proj_status_res_multi'' );',
'    ',
'    -- drop the old package',
'    for c1 in (select ''x'' ',
'               from user_objects',
'               where object_type = ''PACKAGE''',
'               and   object_name = ''EBA_PROJ_TEXT''',
'              ) loop',
'        execute immediate ''drop package EBA_PROJ_TEXT'';',
'    end loop;',
'end;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
