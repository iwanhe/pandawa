prompt --application/deployment/install/upgrade_eba_proj_flex_fw_package_spec
begin
--   Manifest
--     INSTALL: UPGRADE-eba_proj_flex_fw package spec
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
 p_id=>wwv_flow_imp.id(6135117414794238546)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'eba_proj_flex_fw package spec'
,p_sequence=>360
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_proj_flex_fw as',
'',
'    procedure flex_report_update (',
'        p_flex_table_name    in varchar2,',
'        p_irr_region_id      in number,',
'        p_flex_column_prefix in varchar2,',
'        p_app_id             in number,',
'        p_page_id            in number,',
'        p_region_type        in varchar2',
'    );',
'',
'    function validate_lov_query ( p_query in varchar2,',
'        p_display_column out varchar2,',
'        p_return_column out varchar2,',
'        p_error out varchar2',
'    ) return boolean;',
'',
'    procedure populate_page_map_table;',
'',
'    procedure reset_flex_registry;',
'',
'    function fetch_v( p_column in varchar2,',
'                      p_input in varchar2 ) return varchar2;',
'',
'    function fetch_n( p_column in varchar2,',
'                      p_input in number ) return varchar2;',
'',
'end eba_proj_flex_fw;',
'/',
'show errors',
''))
);
wwv_flow_imp.component_end;
end;
/
