prompt --application/pages/page_00071
begin
--   Manifest
--     PAGE: 00071
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
 p_id=>71
,p_name=>'Open Tickets'
,p_alias=>'OPEN_TICKETS'
,p_step_title=>'Open Tickets'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(1609136515118051906)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(607844957454628126)
,p_plug_name=>'Button Region'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169348961051977)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(607858893677718321)
,p_name=>'Search Results'
,p_template=>wwv_flow_imp.id(1609179910711051998)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	 "PRODUCT_NAME",',
'         product_version,',
'         customer,',
'     status_code||''. ''||status_name status,',
'	 SEVERITY_ID||'' . ''||"SEVERITY_NAME" SEVERITY_NAME,',
'         id,',
'	 "INCIDENT_NUMBER",',
'	 substr(subject,1,100) "SUBJECT",',
'         assignee,',
'	 "BUG_NUMBER",',
'     decode(bug_number,null,''No'',''Yes'') is_a_bug,',
'	 "CATEGORY_ID",',
'     decode (ASSIGNED_TO_ID,null,''No'',''Yes'') is_assigned,',
'	 "ASSIGNED_TO_ID",',
'	 "ASSIGNED_ON",',
'	 "PRODUCT_ID",',
'	 "CUSTOMER_ID",',
'	 "SEVERITY_ID",',
'     "STATUS_ID",',
'         status_code,',
'         decode(status_type,''OPEN'',''Open'',''CLOSED'',''Closed'',status_type)',
'            status_type,',
'	 "URGENCY_ID",',
'	 "ASSIGNED_TO_GROUP_ID",',
'	"CREATED",',
'	"CREATED_BY",',
'	"UPDATED",',
'	"UPDATED_BY",',
'	"URGENCY_NAME" ,',
'    follow_ups,',
'    ( select extract( day from diff )*24*60*60 +',
'         extract( hour from diff )*60*60 +',
'         extract( minute from diff )*60 +',
'         round(extract( second from diff )) total_seconds',
'         from (select current_timestamp - v.CREATED diff from dual) diff)',
'     ticket_age_seconds,',
'    ( select extract( day from diff )*24*60*60 +',
'         extract( hour from diff )*60*60 +',
'         extract( minute from diff )*60 +',
'         round(extract( second from diff )) total_seconds',
'         from (select current_timestamp - v.updated diff from dual) diff)',
'     last_updated',
' from eba_intrack_incidents_view v',
' where v.status_id in (select id from EBA_INTRACK_STATUS s where STATUS_TYPE = ''OPEN'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(1609189559365052032)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>100000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607860489302718327)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Product'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607860967353718327)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_VERSION'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607861369989718328)
,p_query_column_id=>3
,p_column_alias=>'CUSTOMER'
,p_column_display_sequence=>5
,p_column_heading=>'Customer'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607862112958718328)
,p_query_column_id=>4
,p_column_alias=>'STATUS'
,p_column_display_sequence=>6
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607862574187718328)
,p_query_column_id=>5
,p_column_alias=>'SEVERITY_NAME'
,p_column_display_sequence=>8
,p_column_heading=>'Severity'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607862925256718329)
,p_query_column_id=>6
,p_column_alias=>'ID'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607863329525718329)
,p_query_column_id=>7
,p_column_alias=>'INCIDENT_NUMBER'
,p_column_display_sequence=>1
,p_column_heading=>'Ticket'
,p_column_link=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RR,50:P50_ID:#ID#'
,p_column_linktext=>'<span>#INCIDENT_NUMBER#</span>'
,p_column_link_attr=>'class="t-Button t-Button--warning"'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607863760740718329)
,p_query_column_id=>8
,p_column_alias=>'SUBJECT'
,p_column_display_sequence=>2
,p_column_heading=>'Subject'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607864146974718329)
,p_query_column_id=>9
,p_column_alias=>'ASSIGNEE'
,p_column_display_sequence=>10
,p_column_heading=>'Assignee'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607864521296718330)
,p_query_column_id=>10
,p_column_alias=>'BUG_NUMBER'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607843857465628115)
,p_query_column_id=>11
,p_column_alias=>'IS_A_BUG'
,p_column_display_sequence=>28
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607864957571718330)
,p_query_column_id=>12
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>12
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607844236681628119)
,p_query_column_id=>13
,p_column_alias=>'IS_ASSIGNED'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607865302645718330)
,p_query_column_id=>14
,p_column_alias=>'ASSIGNED_TO_ID'
,p_column_display_sequence=>13
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607865731886718330)
,p_query_column_id=>15
,p_column_alias=>'ASSIGNED_ON'
,p_column_display_sequence=>14
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607866892312718331)
,p_query_column_id=>16
,p_column_alias=>'PRODUCT_ID'
,p_column_display_sequence=>15
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607868180672718332)
,p_query_column_id=>17
,p_column_alias=>'CUSTOMER_ID'
,p_column_display_sequence=>16
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607868890009718332)
,p_query_column_id=>18
,p_column_alias=>'SEVERITY_ID'
,p_column_display_sequence=>17
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607869315830718333)
,p_query_column_id=>19
,p_column_alias=>'STATUS_ID'
,p_column_display_sequence=>18
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607869783824718333)
,p_query_column_id=>20
,p_column_alias=>'STATUS_CODE'
,p_column_display_sequence=>19
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607870120297718333)
,p_query_column_id=>21
,p_column_alias=>'STATUS_TYPE'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607870575401718333)
,p_query_column_id=>22
,p_column_alias=>'URGENCY_ID'
,p_column_display_sequence=>21
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607870906736718334)
,p_query_column_id=>23
,p_column_alias=>'ASSIGNED_TO_GROUP_ID'
,p_column_display_sequence=>22
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607871753126718334)
,p_query_column_id=>24
,p_column_alias=>'CREATED'
,p_column_display_sequence=>23
,p_column_heading=>'Created'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607872100438718337)
,p_query_column_id=>25
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>24
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607872509694718337)
,p_query_column_id=>26
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>25
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_default_sort_dir=>'desc'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607872979997718337)
,p_query_column_id=>27
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>26
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607873387189718337)
,p_query_column_id=>28
,p_column_alias=>'URGENCY_NAME'
,p_column_display_sequence=>7
,p_column_heading=>'Urgency'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607873732957718338)
,p_query_column_id=>29
,p_column_alias=>'FOLLOW_UPS'
,p_column_display_sequence=>27
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607844103074628118)
,p_query_column_id=>30
,p_column_alias=>'TICKET_AGE_SECONDS'
,p_column_display_sequence=>29
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(607844859966628125)
,p_query_column_id=>31
,p_column_alias=>'LAST_UPDATED'
,p_column_display_sequence=>31
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(607859050127718321)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1954838403013033181)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(607858893677718321)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'show_charts', 'N',
  'show_current_facets', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(607859929716718324)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(607844957454628126)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(1609202304669052069)
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:RR,71::'
,p_icon_css_classes=>'fa-undo'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607842392261628101)
,p_name=>'P71_CUSTOMER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(607859050127718321)
,p_prompt=>'Customer'
,p_source=>'CUSTOMER'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>10
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607842516578628102)
,p_name=>'P71_ASSIGNEE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(607859050127718321)
,p_prompt=>'Assignee'
,p_source=>'ASSIGNEE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>8
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607843524953628112)
,p_name=>'P71_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(607859050127718321)
,p_prompt=>'Status'
,p_source=>'STATUS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607843678355628113)
,p_name=>'P71_PRODUCT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(607859050127718321)
,p_prompt=>'Product'
,p_source=>'PRODUCT_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>8
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607843741503628114)
,p_name=>'P71_SEVERITY_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(607859050127718321)
,p_prompt=>'Severity'
,p_source=>'SEVERITY_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>8
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607843964511628116)
,p_name=>'P71_IS_A_BUG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(607859050127718321)
,p_prompt=>'Is a Bug'
,p_source=>'IS_A_BUG'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607844332155628120)
,p_name=>'P71_IS_ASSIGNED'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(607859050127718321)
,p_prompt=>'Is Assigned'
,p_source=>'IS_ASSIGNED'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607844409960628121)
,p_name=>'P71_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(607859050127718321)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>8
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607844569568628122)
,p_name=>'P71_URGENCY_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(607859050127718321)
,p_prompt=>'Urgency'
,p_source=>'URGENCY_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>8
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607844630713628123)
,p_name=>'P71_AGE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(607859050127718321)
,p_prompt=>'Ticket Age'
,p_source=>'TICKET_AGE_SECONDS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_lov=>'STATIC:< hour;|3600,1 - 8 hours;3601|28800,8 - 24 hours;28801|86400,1 - 7 days;86401|604800,7 - 30 days;604801|2592000,> 30 days;2592001|'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'manual_entry', 'N',
  'select_multiple', 'N')).to_clob
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>100
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607844735173628124)
,p_name=>'P71_LAST_UPDATED'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(607859050127718321)
,p_prompt=>'Last Updated'
,p_source=>'LAST_UPDATED'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_lov=>'STATIC:< hour;|3600,1 - 8 hours;3601|28800,8 - 24 hours;28801|86400,1 - 7 days;86401|604800,7 - 30 days;604801|2592000,> 30 days;2592001|'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'manual_entry', 'N',
  'select_multiple', 'N')).to_clob
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>100
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607859567096718324)
,p_name=>'P71_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(607859050127718321)
,p_prompt=>'Search'
,p_source=>'PRODUCT_NAME,PRODUCT_VERSION,CUSTOMER,STATUS_NAME,STATUS,SEVERITY_NAME,INCIDENT_NUMBER,SUBJECT,ASSIGNEE,BUG_NUMBER,ADDITIONAL_PRODUCT_INFO,CUSTOMER_DEPARTMENT,STATUS_CODE,STATUS_TYPE,TAGS,CREATED_BY,UPDATED_BY,URGENCY_NAME,CUSTOMER_CONTACT_EMAIL,CUST'
||'OMER_CONTACT_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>false
,p_fc_filter_values=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
);
wwv_flow_imp.component_end;
end;
/
