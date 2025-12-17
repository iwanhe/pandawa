prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'Tickets'
,p_alias=>'TICKETS'
,p_step_title=>'Tickets'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026474429031351)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'<p>This page provides an interactive report of logged tickets.  Click on column headings to sort and filter data, click on the <strong>Actions</strong> menu to customize column display and many additional advanced features.</p>'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2770424751198810209)
,p_plug_name=>'Incidents'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609178411209051992)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	 "PRODUCT_NAME",',
'         product_version,',
'         customer,',
'	 "STATUS_NAME",',
'         status_code||''. ''||status_name status,',
'	 "SEVERITY_NAME",',
'         id,',
'	 "INCIDENT_NUMBER",',
'	 "SUBJECT",',
'         assignee,',
'	 "BUG_NUMBER",',
'	 "CATEGORY_ID",',
'	 "ASSIGNED_TO_ID",',
'	 "ASSIGNED_ON",',
'	 "DATE_CLOSED",',
'	 "DESCRIPTION",',
'	 "PRODUCT_ID",',
'	 "PRODUCT_VERSION_ID",',
'	 "ADDITIONAL_PRODUCT_INFO",',
'	 "CUSTOMER_ID",',
'	 "CUSTOMER_DEPARTMENT",',
'	 "SEVERITY_ID",',
'	 "STATUS_ID",',
'         status_code,',
'         decode(status_type,''OPEN'',''Open'',''CLOSED'',''Closed'',status_type)',
'            status_type,',
'	 "URGENCY_ID",',
'	 "ASSIGNED_TO_GROUP_ID",',
'	 "TAGS",',
'	"CREATED",',
'	"CREATED_BY",',
'	"UPDATED",',
'	"UPDATED_BY",',
'	"URGENCY_NAME" ,',
'        follow_ups,',
'        customer_contact_email,',
'        customer_contact_name',
' from eba_intrack_incidents_view'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(2770424870715810219)
,p_name=>'incidents'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>2101863328702713800
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770425448229810227)
,p_db_column_name=>'SUBJECT'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770425045402810225)
,p_db_column_name=>'PRODUCT_NAME'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770425160036810227)
,p_db_column_name=>'STATUS_NAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Status Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770425256217810227)
,p_db_column_name=>'SEVERITY_NAME'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Severity'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770425358433810227)
,p_db_column_name=>'INCIDENT_NUMBER'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Incident'
,p_column_link=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP,50:P50_ID:#ID#'
,p_column_linktext=>'<span>#INCIDENT_NUMBER#</span>'
,p_column_link_attr=>'class="t-Button t-Button--warning"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770425573100810227)
,p_db_column_name=>'BUG_NUMBER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Bug#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770425971988810228)
,p_db_column_name=>'CATEGORY_ID'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>'Category ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770426073625810228)
,p_db_column_name=>'ASSIGNED_TO_ID'
,p_display_order=>80
,p_column_identifier=>'K'
,p_column_label=>'Assigned To ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770426167130810228)
,p_db_column_name=>'ASSIGNED_ON'
,p_display_order=>90
,p_column_identifier=>'L'
,p_column_label=>'Assigned On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDay, fmDD fmMonth, YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770426270486810228)
,p_db_column_name=>'DATE_CLOSED'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Date Closed'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770426372274810228)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>110
,p_column_identifier=>'N'
,p_column_label=>'Description'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770426465710810229)
,p_db_column_name=>'PRODUCT_ID'
,p_display_order=>120
,p_column_identifier=>'O'
,p_column_label=>'Selected Product'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770426562675810229)
,p_db_column_name=>'PRODUCT_VERSION_ID'
,p_display_order=>130
,p_column_identifier=>'P'
,p_column_label=>'Product Version ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770426655535810229)
,p_db_column_name=>'ADDITIONAL_PRODUCT_INFO'
,p_display_order=>140
,p_column_identifier=>'Q'
,p_column_label=>'Additional Product Info'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770426752653810229)
,p_db_column_name=>'CUSTOMER_ID'
,p_display_order=>150
,p_column_identifier=>'R'
,p_column_label=>'Customer ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770426868001810229)
,p_db_column_name=>'CUSTOMER_DEPARTMENT'
,p_display_order=>160
,p_column_identifier=>'S'
,p_column_label=>'Customer Department'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770426961851810229)
,p_db_column_name=>'SEVERITY_ID'
,p_display_order=>170
,p_column_identifier=>'T'
,p_column_label=>'Severity ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770427055011810229)
,p_db_column_name=>'STATUS_ID'
,p_display_order=>180
,p_column_identifier=>'U'
,p_column_label=>'Status ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770427163724810229)
,p_db_column_name=>'URGENCY_ID'
,p_display_order=>190
,p_column_identifier=>'V'
,p_column_label=>'Urgency ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770427262841810229)
,p_db_column_name=>'ASSIGNED_TO_GROUP_ID'
,p_display_order=>200
,p_column_identifier=>'W'
,p_column_label=>'Assigned To Group Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770427563422810230)
,p_db_column_name=>'TAGS'
,p_display_order=>210
,p_column_identifier=>'Z'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_rpt_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag d',
'from eba_intrack_tags_type_sum',
'where content_type = ''INCIDENT''',
'order by 1'))
,p_rpt_show_filter_lov=>'C'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770427769977810230)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>220
,p_column_identifier=>'AB'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770427955627810230)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>230
,p_column_identifier=>'AD'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770428053110810230)
,p_db_column_name=>'URGENCY_NAME'
,p_display_order=>240
,p_column_identifier=>'AE'
,p_column_label=>'Urgency'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2770955953632886607)
,p_db_column_name=>'ID'
,p_display_order=>250
,p_column_identifier=>'AF'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2776197151038041793)
,p_db_column_name=>'STATUS_CODE'
,p_display_order=>260
,p_column_identifier=>'AG'
,p_column_label=>'Status Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2777842146964422124)
,p_db_column_name=>'FOLLOW_UPS'
,p_display_order=>270
,p_column_identifier=>'AH'
,p_column_label=>'Follow Ups'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2781390354288396912)
,p_db_column_name=>'STATUS'
,p_display_order=>280
,p_column_identifier=>'AI'
,p_column_label=>'Status Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2781390455280396912)
,p_db_column_name=>'STATUS_TYPE'
,p_display_order=>290
,p_column_identifier=>'AJ'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2785964549850625673)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>300
,p_column_identifier=>'AK'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2797243460646445257)
,p_db_column_name=>'PRODUCT_VERSION'
,p_display_order=>310
,p_column_identifier=>'AL'
,p_column_label=>'Product Version'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2800566143255235037)
,p_db_column_name=>'CUSTOMER_CONTACT_EMAIL'
,p_display_order=>320
,p_column_identifier=>'AM'
,p_column_label=>'Contact Email'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2800566254732235038)
,p_db_column_name=>'CUSTOMER_CONTACT_NAME'
,p_display_order=>330
,p_column_identifier=>'AN'
,p_column_label=>'Contact Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2816391465515873806)
,p_db_column_name=>'ASSIGNEE'
,p_display_order=>340
,p_column_identifier=>'AO'
,p_column_label=>'Assignee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3267196147271260773)
,p_db_column_name=>'CREATED'
,p_display_order=>350
,p_column_identifier=>'AP'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3267196246711260776)
,p_db_column_name=>'UPDATED'
,p_display_order=>360
,p_column_identifier=>'AQ'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(2770435452237810453)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'21018740'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'INCIDENT_NUMBER:CUSTOMER:PRODUCT_NAME:STATUS:SEVERITY_NAME:SUBJECT:ASSIGNEE_ON:CUSTOMER_CONTACT_EMAIL::CREATED:UPDATED'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'UPDATED_ON'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'CREATED_ON'
,p_sort_direction_3=>'DESC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(3305871342859601667)
,p_report_id=>wwv_flow_imp.id(2770435452237810453)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'STATUS_TYPE'
,p_operator=>'='
,p_expr=>'Open'
,p_condition_sql=>'"STATUS_TYPE" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Open''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4401602905216848915)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2776282265892093405)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(4401602905216848915)
,p_button_name=>'CREATE_TICKET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Ticket'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:15,16,17::'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2770543145489846326)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2770424751198810209)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(3023027246769891480)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'2'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1036239765004267770)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(2776282265892093405)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1036239897898267771)
,p_event_id=>wwv_flow_imp.id(1036239765004267770)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(2770424751198810209)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
