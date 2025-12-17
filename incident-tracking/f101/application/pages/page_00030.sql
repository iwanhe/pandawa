prompt --application/pages/page_00030
begin
--   Manifest
--     PAGE: 00030
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
 p_id=>30
,p_name=>'Contacts'
,p_alias=>'CUSTOMERS'
,p_step_title=>'Contacts'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026543046031745)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'<p>This page provides an interactive report of logged tickets summarized by customer.  Click on column headings to sort and filter data, click on the <strong>Actions</strong> menu to customize column display and many additional advanced features.</p>'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2818078553502370889)
,p_plug_name=>'Customers'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609178411209051992)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'     c.id,',
'     c.customer_name, ',
'     c.ROW_KEY,',
'     c.ADDRESS,',
'     c.CITY,',
'     c.STATE,',
'     c.postal_code,',
'     c.country,',
'     c.tags,',
'     c.web_site,',
'     c.stock_symbol,',
'     --',
'    (select count(*) ',
'     from eba_intrack_incidents i,',
'	  eba_intrack_status s',
'     where i.customer_id = c.id and ',
'	  i.status_id = s.id and',
'	  i.DATE_CLOSED > to_date(to_char(current_timestamp,''DD-MON-YYYY''),''DD-MON-YYYY'') - 7 and',
'	  s.status_type = ''CLOSED'') closed_1w,',
'     --',
'     (select count(*) ',
'      from eba_intrack_incidents i ',
'      where i.customer_id = c.id) tickets,',
'      (select count(*) ',
'      from eba_intrack_incidents i,',
'           eba_intrack_status s',
'      where i.customer_id = c.id and ',
'            i.status_id = s.id and',
'            s.status_type = ''OPEN'') open_tickets,',
'     (select count(*) ',
'      from eba_intrack_customer_contact cc',
'      where cc.customer_id = c.id) contacts',
'from eba_intrack_customers c'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(2818078762651370891)
,p_name=>'Contacts'
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
,p_internal_uid=>2149517220638274472
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818078873122370893)
,p_db_column_name=>'CUSTOMER_NAME'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818080071836370897)
,p_db_column_name=>'TICKETS'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Tickets'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818080161673370897)
,p_db_column_name=>'OPEN_TICKETS'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Open Tickets'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2,RIR:IR_STATUS_TYPE,IR_CUSTOMER:Open,#CUSTOMER_NAME#'
,p_column_linktext=>'#OPEN_TICKETS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818080350281370897)
,p_db_column_name=>'ID'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Selected Customer'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818104769977373125)
,p_db_column_name=>'ROW_KEY'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Row Key'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818104846841373128)
,p_db_column_name=>'ADDRESS'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Address'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818104943171373129)
,p_db_column_name=>'CITY'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'City'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818105065260373129)
,p_db_column_name=>'STATE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'State'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818105165722373129)
,p_db_column_name=>'POSTAL_CODE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Postal Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818105271567373129)
,p_db_column_name=>'COUNTRY'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Country'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818105373167373129)
,p_db_column_name=>'TAGS'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818105459353373130)
,p_db_column_name=>'WEB_SITE'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Web Site'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818105564369373130)
,p_db_column_name=>'STOCK_SYMBOL'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Stock Symbol'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818143542881384263)
,p_db_column_name=>'CONTACTS'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Contacts'
,p_column_link=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:RP,RIR:P45_CUSTOMER:#ID#'
,p_column_linktext=>'#CONTACTS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2818415043105450487)
,p_db_column_name=>'CLOSED_1W'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Closed Last 7 Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(2818080449520370898)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'21495190'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'CUSTOMER_NAME:OPEN_TICKETS:CLOSED_1W:TICKETS:CONTACTS:TAGS:WEB_SITE:'
,p_sort_column_1=>'OPEN_TICKETS'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'TICKETS'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'CUSTOMER_NAME'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2818081057574370902)
,p_plug_name=>'Contacts'
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
 p_id=>wwv_flow_imp.id(2818080659572370900)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2818078553502370889)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:30,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(3023053753002893245)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'30'
);
wwv_flow_imp.component_end;
end;
/
