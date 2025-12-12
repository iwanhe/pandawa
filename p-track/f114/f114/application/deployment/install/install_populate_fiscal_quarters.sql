prompt --application/deployment/install/install_populate_fiscal_quarters
begin
--   Manifest
--     INSTALL: INSTALL-Populate Fiscal Quarters
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
 p_id=>wwv_flow_imp.id(3370084068444093588)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Populate Fiscal Quarters'
,p_sequence=>730
,p_script_type=>'INSTALL'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>'select null from eba_proj_fy_periods'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_proj_dates.gen_quarters(p_start_month => ''01'', p_timezone => ''US/Pacific'', p_num_years => 30, p_year_fmt => ''YYYY'', p_delimiter => '' - '');',
'end;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
