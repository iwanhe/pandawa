prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Incident Tracking'
,p_alias=>'HOME'
,p_step_title=>'Incident Tracking'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026065771028787)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'body { min-width: 800px !important;}',
'table.uReport > tbody > tr > td.rowHeader {font-weight: bold; padding-left: 8px;}',
'ul.vapList{margin:0 !important;list-style:none}',
'ul.vapList li{display:block;border-top:1px solid #EEE}',
'ul.vapList li:first-child{border-top:none}',
'ul.vapList li a{color:#3D5B80}',
'ul.vapList li label{display:inline-block;width:140px;padding:6px 12px;font:bold 11px/20px Arial,sans-serif;color:#444;vertical-align:top}',
'ul.vapList li span{display:inline-block;padding:6px 12px;font:normal 11px/20px Arial,sans-serif;color:#444;vertical-align:top}',
'ul.vapList li span em{color:#EA0000}',
'',
'ul.barGraph{margin:12px !important;list-style:none;white-space:nowrap}',
'ul.barGraph li{display:inline-block;width:48px}',
'ul.barGraph li:hover big small{background-color:#4A6D98}',
'ul.barGraph li.barHeaders{width:128px}',
'ul.barGraph li.barHeaders > span{text-align:left}',
'ul.barGraph li > label{display:block;font:normal 11px/12px Arial,sans-serif;color:#444;text-align:center}',
'ul.barGraph li > label span{display:block;font:normal 11px/12px Arial,sans-serif;color:#767676}',
'ul.barGraph li > big{height:120px;margin:8px;position:relative;display:block}',
'ul.barGraph li > big > small{display:block;position:absolute;bottom:0;width:30px;-moz-border-radius:4px;-webkit-border-radius:4px;border-radius:4px;background-color:#6A9CDA;-moz-box-shadow:0 1px 0 rgba(255,255,255,0.5) ins',
'et;-webkit-box-shadow:0 1px 0 rgba(255,255,255,0.5) inset;box-shadow:0 1px 0 rgba(255,255,255,0.5) inset;border:1px solid #4A6D98}',
'ul.barGraph li > span{display:block;text-align:center;font:normal 11px/16px Arial,sans-serif;color:#444;border-top:1px solid #F0F0F0;padding:8px}',
'ul.barGraph li > span.noBorder{border-top:none;padding-top:0}',
'ul.barGraph li > span a{color:##405580}',
'',
'/* Hiding overflow when resized */',
'section.uRegion { overflow: hidden; }',
'',
'</style>'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.uRegion.scrollable-region>.uRegionContent {',
'box-sizing: border-box;',
'height: 320px;',
'overflow: auto;',
'}'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<h2>About this Application</h2>',
'<p>The Incident Tracking application gives you a complete system for entering and tracking support incidents.  The application allows you to enter customer companies and multiple contacts for each company, specify products and categories and set up v'
||'alues to limit status codes, severity and urgency attributes for an incident.</p>',
'<p>Incident Tracking includes a wizard to enter essential information about an incident and a variety of ways to sort and report on incidents, including a time line based on when incidents were entered into the system.</p>',
'<p>Once a ticket is entered into the system, you can track the progress of the ticket in an update area of the ticket, or add attachments and links to the incident.  You can also use tags to further classify incidents and use the resulting tag cloud '
||'in your reports.</p>',
'<p>The Incident Tracking system includes robust interactive reports, which provide valuable analysis of incidents through an easy-to-use interface, including the ability to create charts.</p>',
''))
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(498951453522598947)
,p_name=>'Incident Metrics'
,p_template=>wwv_flow_imp.id(1609179910711051998)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--large:t-BadgeList--dash:t-BadgeList--fixed'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with data as (',
'    select nvl(sum(decode(status_type,''OPEN'',1,0)),0) open,',
'           nvl(sum(decode(status_type,''CLOSED'',1,0)),0) closed,',
'           nvl(sum(decode(ASSIGNED_TO_ID,0,0,null,0,1)),0) assignees,',
'           count(distinct customer_id) customers',
'    from eba_intrack_incidents_view',
')',
'select ',
'    data.open open_tickets,',
'    data.closed closed_tickets,',
'    data.customers customer_tickets,',
'    nvl(data.open,0) - nvl(data.assignees,0) assignees',
'from data'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(1609184244586052016)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(497256378284728019)
,p_query_column_id=>1
,p_column_alias=>'OPEN_TICKETS'
,p_column_display_sequence=>1
,p_column_heading=>'Open Tickets'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP::'
,p_column_linktext=>'#OPEN_TICKETS#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(497256483779728020)
,p_query_column_id=>2
,p_column_alias=>'CLOSED_TICKETS'
,p_column_display_sequence=>3
,p_column_heading=>'Closed Tickets'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::IRGT_TICKETS:0'
,p_column_linktext=>'#CLOSED_TICKETS#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(497256568138728021)
,p_query_column_id=>3
,p_column_alias=>'CUSTOMER_TICKETS'
,p_column_display_sequence=>4
,p_column_heading=>'Customer With Open Tickets'
,p_column_link=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RR,30:IRGT_TICKETS:0'
,p_column_linktext=>'#CUSTOMER_TICKETS#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(497256642498728022)
,p_query_column_id=>4
,p_column_alias=>'ASSIGNEES'
,p_column_display_sequence=>2
,p_column_heading=>'Unassigned Open Tickets'
,p_column_link=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:RR,48::'
,p_column_linktext=>'#ASSIGNEES#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1222654173925485351)
,p_name=>'Notifications'
,p_display_sequence=>20
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select     id,',
'    decode(lower(NOTIFICATION_TYPE),''yellow'',''warning'',''red'',''danger'',lower(NOTIFICATION_TYPE)) as ALERT_TYPE,',
'    NOTIFICATION_NAME as ALERT_TITLE,',
'    NOTIFICATION_DESCRIPTION as ALERT_DESC,',
'    '''' alert_action',
'  from EBA_INTRACK_NOTIFICATIONS',
' where (DISPLAY_FROM is null or DISPLAY_FROM <= current_date) and',
'       (DISPLAY_UNTIL is null or DISPLAY_UNTIL >= current_date)',
' order by nvl(DISPLAY_SEQUENCE,0),NOTIFICATION_NAME'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from EBA_INTRACK_NOTIFICATIONS',
' where (DISPLAY_FROM is null or DISPLAY_FROM <= current_date) and',
'       (DISPLAY_UNTIL is null or DISPLAY_UNTIL >= current_date)'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(1609184039072052009)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_num_rows_type=>'0'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1222654443174485352)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1925540328127451517)
,p_query_column_id=>2
,p_column_alias=>'ALERT_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Alert Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1925540746322451519)
,p_query_column_id=>3
,p_column_alias=>'ALERT_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Alert Title'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1925541078627451519)
,p_query_column_id=>4
,p_column_alias=>'ALERT_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Alert Desc'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1925541525273451519)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ACTION'
,p_column_display_sequence=>5
,p_column_heading=>'Alert Action'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1331691379760131981)
,p_plug_name=>'Open Incidents by Product'
,p_region_css_classes=>'i-h350'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(1331691543832131982)
,p_region_id=>wwv_flow_imp.id(1331691379760131981)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(1331691611013131983)
,p_chart_id=>wwv_flow_imp.id(1331691543832131982)
,p_seq=>10
,p_name=>'Incidents by Product'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME the_value,',
'       product_id,',
'       count(*) c',
' from eba_intrack_incidents_view',
'  where status_type = ''OPEN''',
' group by product_name, product_id',
' order by 3 desc'))
,p_items_value_column_name=>'C'
,p_items_label_column_name=>'THE_VALUE'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,RIR,2:IR_PRODUCT_ID:&PRODUCT_ID.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(1331691779412131985)
,p_chart_id=>wwv_flow_imp.id(1331691543832131982)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'on'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(1331691720692131984)
,p_chart_id=>wwv_flow_imp.id(1331691543832131982)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1331691924088131986)
,p_plug_name=>'Open Incidents by Customer'
,p_region_css_classes=>'i-h350'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(1331691998502131987)
,p_region_id=>wwv_flow_imp.id(1331691924088131986)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(1331692141384131988)
,p_chart_id=>wwv_flow_imp.id(1331691998502131987)
,p_seq=>10
,p_name=>'Open Incidents by Customer'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select customer the_value,',
'       customer_id,',
'       count(*) c',
' from eba_intrack_incidents_view',
'  where status_type = ''OPEN''',
' group by customer, customer_id',
' order by 3 desc'))
,p_items_value_column_name=>'C'
,p_items_label_column_name=>'THE_VALUE'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP,RIR,30:IR_ID:&CUSTOMER_ID.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(1373009431293917740)
,p_chart_id=>wwv_flow_imp.id(1331691998502131987)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(1373009279806917739)
,p_chart_id=>wwv_flow_imp.id(1331691998502131987)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1462575528630319368)
,p_plug_name=>'&APPLICATION_TITLE.'
,p_icon_css_classes=>'app-incident-tracking'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609175202208051988)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in ( select preference_value',
'            from eba_intrack_preferences',
'            where preference_name = ''APPLICATION_SUBTITLE''',
'            union all',
'            select ''Track and Manage Incidents''',
'            from dual',
'            where not exists ( select null',
'                               from eba_intrack_preferences',
'                               where preference_name = ''APPLICATION_SUBTITLE'')',
'          ) loop',
'    sys.htp.p(''<p>''||apex_escape.html(c1.preference_value)||''</p>'');',
'end loop;',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1462575620694319369)
,p_plug_name=>'Search'
,p_parent_plug_id=>wwv_flow_imp.id(1462575528630319368)
,p_region_css_classes=>'t-Form--search'
,p_region_template_options=>'#DEFAULT#:t-Form--xlarge'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1739585955681445376)
,p_plug_name=>'ACL Warning'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--defaultIcons:t-Alert--warning:t-Alert--horizontal'
,p_plug_template=>wwv_flow_imp.id(1609167356359051970)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_column=>false
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.ACL_WARNING'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'eba_intrack_fw.get_preference_value(''ACCESS_CONTROL_ENABLED'') = ''N'''
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'f?p=&APP_ID.:SETTINGS:&SESSION.::&DEBUG.:RP::')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(2784471948756171196)
,p_name=>'Recent Activity'
,p_template=>wwv_flow_imp.id(1609179910711051998)
,p_display_sequence=>70
,p_region_css_classes=>'i-h350'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id, ',
'       subject, ',
'       created, ',
'       created_by, ',
'       updated, ',
'       updated_by, ',
'       PRODUCT_NAME,',
'       ''<a href="''||',
'          apex_util.prepare_url(''f?p=''||:APP_ID||'':50:''||:APP_SESSION||''::NO:RP,50,:P50_ID:''||',
'          apex_escape.html(id))||',
'          ''"><span class="t-Button t-Button--warning">''||apex_escape.html(substr(INCIDENT_NUMBER,1,50))||''</span></a>''||',
'       apex_escape.html('' ''||subject||'' - ''||lower(updated_by)||'' - ''||PRODUCT_NAME) summary',
'from eba_intrack_incidents_view',
'order by updated desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(1609189559365052032)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607842640080628103)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607842785216628104)
,p_query_column_id=>2
,p_column_alias=>'SUBJECT'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607842819458628105)
,p_query_column_id=>3
,p_column_alias=>'CREATED'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607842985019628106)
,p_query_column_id=>4
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607843044448628107)
,p_query_column_id=>5
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>8
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607843155568628108)
,p_query_column_id=>6
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607843237142628109)
,p_query_column_id=>7
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607843452052628111)
,p_query_column_id=>8
,p_column_alias=>'SUMMARY'
,p_column_display_sequence=>7
,p_column_heading=>'Ticket'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2799408349442858377)
,p_plug_name=>'Tags'
,p_region_css_classes=>'i-h350'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_region_attributes=>'data-grid="col_1" data-grid-start="yes"  '
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>90
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag, tag_count',
'  from eba_intrack_tags_type_sum',
' where tag_count > 0 and',
'   content_type = ''INCIDENT''',
' order by 2 desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD'
,p_plug_query_no_data_found=>'No tags found.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'f?p=&APP_ID.:2:&APP_SESSION.:::RIR,CIR,2:IRC_TAGS:#TAG#',
  'attribute_03', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3210649574134034581)
,p_plug_name=>'Time zone'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="clear: left; "'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>110
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Dates and Times are displayed in the',
'  <a href="&P1_TIMEZONE_URL.">&P1_TIMEZONE.</a> timezone.</p>'))
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4401192206016118242)
,p_plug_name=>'Breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4401606324402864061)
,p_plug_name=>'search'
,p_plug_display_sequence=>40
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'<div class="sCustomSearch">'
,p_plug_footer=>'</div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3268297570746756136)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2784471948756171196)
,p_button_name=>'VIEW_TICKETS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'View Tickets'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3270315059772787004)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(2799408349442858377)
,p_button_name=>'VIEW_TAGS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'View Tags'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2784023851509020581)
,p_branch_name=>'Go To Page 37'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP,37:P37_SEARCH:&P1_SEARCH.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 28-DEC-2011 13:35 by MIKE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(172765498385269744)
,p_branch_name=>'Check First Run'
,p_branch_action=>'f?p=&APP_ID.:1000:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>'eba_intrack_fw.get_preference_value(''FIRST_RUN'') = ''YES'''
,p_branch_condition_text=>'PLSQL'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1253752849040080887)
,p_name=>'P1_TIMEZONE_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3210649574134034581)
,p_source=>'apex_util.prepare_url(''f?p=''||:APP_ID||'':56:''||:APP_SESSION)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1253753044080083183)
,p_name=>'P1_TIMEZONE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(3210649574134034581)
,p_use_cache_before_default=>'NO'
,p_source=>'nvl(apex_util.get_session_time_zone(),''unknown'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4401606636523867572)
,p_name=>'P1_SEARCH'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1462575620694319369)
,p_prompt=>'Search'
,p_placeholder=>'Search tickets and customers'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(1609201949677052061)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(3023000742267890172)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1751884665496906055)
,p_name=>'Set Value in Session State'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1751884775122906056)
,p_event_id=>wwv_flow_imp.id(1751884665496906055)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P1_SEARCH'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
