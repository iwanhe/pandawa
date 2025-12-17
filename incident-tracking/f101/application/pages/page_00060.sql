prompt --application/pages/page_00060
begin
--   Manifest
--     PAGE: 00060
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
 p_id=>60
,p_name=>'Activity Calendar'
,p_step_title=>'Activity Calendar'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026850665033934)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(3204234956647058484)
,p_help_text=>'This is a monthly calendar of application activity, reporting distinct users and their total page views by day. Click the <strong><</strong> button to go to the previous month and the <strong>></strong> button to go forward a month. Switch between th'
||'e calendar view to the list view by clicking the <strong>list</strong> button.'
,p_page_component_map=>'08'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1937677220698631144)
,p_plug_name=>'Activity Calendar'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>21
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'lower(USERID)||'' - ''||trim(to_char(count(*),''999G999G999G990''))   "Page Events",',
'trunc(time_stamp) the_day',
'from apex_activity_log l',
'where flow_id = :app_id and userid is not null and userid != ''nobody''',
'group by trunc(time_stamp), lower(USERID)'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_calendar_views', 'list:navigation',
  'display_column', 'Page Events',
  'drag_and_drop', 'N',
  'event_sorting', 'AUTOMATIC',
  'maximum_events_day', '10',
  'multiple_line_event', 'Y',
  'show_time', 'N',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'THE_DAY')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3340625651547664537)
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
wwv_flow_imp.component_end;
end;
/
