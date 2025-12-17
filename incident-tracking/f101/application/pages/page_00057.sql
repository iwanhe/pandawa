prompt --application/pages/page_00057
begin
--   Manifest
--     PAGE: 00057
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_page.create_page(
 p_id=>57
,p_name=>'Help'
,p_alias=>'HELP'
,p_step_title=>'Help'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320025964040028300)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'div#uOneCol div.helpContainer div.helpSide h1.appNameHeader {margin-top: 8px; font-size: 16px; line-height: 24px;}',
'div.helpContainer div.helpSide ul.vapList {',
'padding-top: 8px;}',
'</style>'))
,p_step_template=>wwv_flow_imp.id(1609163135326051960)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'This is the main help content for the entire app.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(2074617738234100365)
,p_name=>'&APPLICATION_TITLE.'
,p_template=>wwv_flow_imp.id(1609175202208051988)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'t-HeroRegion--featured'
,p_icon_css_classes=>'app-incident-tracking'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-AVPList--rightAligned'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.version app_version,',
'       to_char(aa.pages,''999G999G990'') pages,',
'       ''Oracle'' vendor',
'from apex_applications aa',
'where aa.application_id = :APP_ID'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(1609191499082052037)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2074617855731100366)
,p_query_column_id=>1
,p_column_alias=>'APP_VERSION'
,p_column_display_sequence=>1
,p_column_heading=>'App version'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2074617937038100367)
,p_query_column_id=>2
,p_column_alias=>'PAGES'
,p_column_display_sequence=>2
,p_column_heading=>'Pages'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2074617997204100368)
,p_query_column_id=>3
,p_column_alias=>'VENDOR'
,p_column_display_sequence=>3
,p_column_heading=>'Vendor'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3259573044643102137)
,p_plug_name=>'Help Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>10
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1457213150600935423)
,p_plug_name=>'About this Application'
,p_parent_plug_id=>wwv_flow_imp.id(3259573044643102137)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TRANSLATED_MESSAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'HELP_ABOUT',
  'attribute_12', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1457213368503938044)
,p_plug_name=>'Getting Started'
,p_parent_plug_id=>wwv_flow_imp.id(3259573044643102137)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TRANSLATED_MESSAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'HELP_GETTING_STARTED',
  'attribute_12', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1457213574044939682)
,p_plug_name=>'Features'
,p_parent_plug_id=>wwv_flow_imp.id(3259573044643102137)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TRANSLATED_MESSAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'HELP_FEATURES',
  'attribute_12', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1457213746816941240)
,p_plug_name=>'Support'
,p_parent_plug_id=>wwv_flow_imp.id(3259573044643102137)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''https://forums.oracle.com/forums/forum.jspa?forumID=137'' support_link,',
'    ''OTN Forum'' support_text',
'from dual'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TRANSLATED_MESSAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'HELP_SUPPORT',
  'attribute_02', 'SUPPORT_LINK',
  'attribute_03', 'SUPPORT_TEXT',
  'attribute_12', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3259574245472102144)
,p_plug_name=>'Help'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>80
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
