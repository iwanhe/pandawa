prompt --application/pages/page_00025
begin
--   Manifest
--     PAGE: 00025
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
 p_id=>25
,p_name=>'Tags'
,p_alias=>'TAGS'
,p_step_title=>'Tags'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026850665033934)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This shows all of the defined tags used throughout the app and the font size indicates the number of times the tag has been assigned.'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2794946759328802313)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2794977943902806441)
,p_plug_name=>'Tags'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>11
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag, tag_count',
'  from eba_intrack_tags_type_sum',
' where tag_count > 0',
' order by 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD'
,p_plug_query_no_data_found=>'No tags found.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'f?p=&APP_ID.:2:&APP_SESSION.::::IRC_TAGS:#TAG#',
  'attribute_03', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
