prompt --application/pages/page_00059
begin
--   Manifest
--     PAGE: 00059
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
 p_id=>59
,p_name=>'Ticket Calendar'
,p_alias=>'TICKET_CALENDAR'
,p_step_title=>'Ticket Calendar'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026850665033934)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page shows a calendar view of when incidents were entered into the application. Use the forward and back buttons to go forward a month or back a month. Switch between list view and calendar view by using the buttons on the right. Click on an inc'
||'ident to navigate to that incident''s details page.'
,p_page_component_map=>'08'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1937677282255631145)
,p_plug_name=>'Incidents'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'     id,',
'     incident_number||'' - ''||customer||'' - ''||product_name||'' - ''||created_by label,',
'	"CREATED",',
'	"CREATED_BY",',
'	"UPDATED"',
' from eba_intrack_incidents_view',
''))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_calendar_views', 'list:navigation',
  'display_column', 'LABEL',
  'drag_and_drop', 'N',
  'event_sorting', 'AUTOMATIC',
  'maximum_events_day', '10',
  'multiple_line_event', 'Y',
  'show_time', 'N',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'CREATED',
  'view_edit_link', 'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP,50:P50_ID:&ID.')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3338118462582401293)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
);
wwv_flow_imp.component_end;
end;
/
