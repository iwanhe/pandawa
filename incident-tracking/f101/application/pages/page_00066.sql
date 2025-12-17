prompt --application/pages/page_00066
begin
--   Manifest
--     PAGE: 00066
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
 p_id=>66
,p_name=>'Ticket Usage Metrics'
,p_step_title=>'Ticket Usage Metrics'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026474429031351)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page shows a calendar view of when this incident/ticket has been viewed. Use the forward and back buttons to go forward a month or back a month. Switch between list view and calendar view by using the buttons on the right.'
,p_page_component_map=>'08'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1542720151378716135)
,p_plug_name=>'Project Usage Metrics'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    trunc(view_timestamp) view_timestamp,',
'    trim(to_char(count(*),''999G999G999G990'')) || '' view(s) - '' || trim(to_char(count(distinct app_username),''999G999G999G990'')) || '' user(s)'' c',
'from',
'    eba_intrack_clicks',
'where',
'    view_id = :P66_ID ',
'and',
'    view_timestamp > sysdate - 90',
'group by trunc(view_timestamp ) '))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_calendar_views', 'list:navigation',
  'display_column', 'C',
  'drag_and_drop', 'N',
  'event_sorting', 'AUTOMATIC',
  'maximum_events_day', '10',
  'multiple_line_event', 'N',
  'show_time', 'N',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'VIEW_TIMESTAMP')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1542721347000716140)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1542721963027716142)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1542721574580716140)
,p_name=>'P66_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1542721347000716140)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
