prompt --application/deployment/install/install_eba_proj_dates_package_spec
begin
--   Manifest
--     INSTALL: INSTALL-eba_proj_dates package spec
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
 p_id=>wwv_flow_imp.id(13453413641714402439)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'eba_proj_dates package spec'
,p_sequence=>60
,p_script_type=>'INSTALL'
,p_script_option=>'PACKAGE_SPEC'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE PACKAGE "EBA_PROJ_DATES" as',
'',
'    function get_next_workday( p_date in timestamp ) return timestamp;',
'',
'    function get_prev_workday( p_date in timestamp ) return timestamp;',
'',
'    function add_workdays( p_date in timestamp, p_days in number ) return timestamp;',
'',
'    function days_between( p_start in timestamp, p_end in timestamp ) return number;',
'',
'    procedure gen_quarters( p_start_month in varchar2 default ''01'', p_timezone in varchar2, p_num_years in number, p_year_fmt in varchar2, p_delimiter in varchar2 );',
'',
'end eba_proj_dates;',
'/',
'',
''))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(13453413799239402443)
,p_script_id=>wwv_flow_imp.id(13453413641714402439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_PROJ_DATES'
);
wwv_flow_imp.component_end;
end;
/
