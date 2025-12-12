prompt --application/deployment/install/upgrade_drop_microsite_tables
begin
--   Manifest
--     INSTALL: UPGRADE-Drop Microsite Tables
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
 p_id=>wwv_flow_imp.id(17371694810823751959)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Drop Microsite Tables'
,p_sequence=>130
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c1 in ( select object_name name',
'                from user_objects',
'                where upper(object_type) = ''PACKAGE''',
'                    and object_name like ''EBA_PROJ%MICROSITE%''',
'            ) loop',
'        execute immediate ''drop package ''||c1.name;',
'    end loop;',
'    for c1 in ( select view_name name',
'                from user_views',
'                where view_name like ''EBA_PROJ%MICROSITE%''',
'            ) loop',
'        execute immediate ''drop view ''||c1.name;',
'    end loop;',
'    for c1 in ( select table_name name',
'                from user_tables',
'                where table_name like ''EBA_PROJ%MICROSITE%''',
'            ) loop',
'        execute immediate ''drop table ''||c1.name||'' cascade constraints'';',
'    end loop;',
'end;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
