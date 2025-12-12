prompt --application/deployment/install/install_populate_flex_page_map
begin
--   Manifest
--     INSTALL: INSTALL-Populate flex page map
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
 p_id=>wwv_flow_imp.id(6135116605330212585)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Populate flex page map'
,p_sequence=>710
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_proj_flex_fw.populate_page_map_table();',
'    -- Make sure we''re starting with a clean slate.',
'    eba_proj_flex_fw.reset_flex_registry();',
'end;',
''))
);
wwv_flow_imp.component_end;
end;
/
