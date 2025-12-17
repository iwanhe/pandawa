prompt --application/pages/page_00022
begin
--   Manifest
--     PAGE: 00022
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
 p_id=>22
,p_name=>'Customers'
,p_page_mode=>'MODAL'
,p_step_title=>'Customers'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(3204235665975067375)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_imp.id(3204234467922058482)
,p_help_text=>'Click the <strong>Add Customer</strong> button to create a new customer. Click the pencil icon to edit or delete an existing customer. Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions</strong> button '
||'to define the number of rows displayed per page, filter, format, download, and/or save the interactive report.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2760591169955682608)
,p_plug_name=>'Customers'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(1609178411209051992)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'    id,',
'    row_version_number,',
'    row_key,',
'    customer_name,',
'    customer_name_upper,',
'    marquee_customer_yn,',
'    tags,',
'    dbms_lob.substr(customer_profile,4000,1) customer_profile,',
'    web_site,',
'    stock_symbol,',
'    sic,',
'    duns,',
'    created,',
'    created_by,',
'    updated,',
'    updated_by,',
'    flex_n01,',
'    flex_n02,',
'    flex_n03,',
'    flex_n04,',
'    flex_d01,',
'    flex_d02,',
'    flex_d03,',
'    flex_d04,',
'    flex_01,',
'    flex_02,',
'    flex_03,',
'    flex_04,',
'    flex_05,',
'    flex_06,',
'    flex_07,',
'    flex_08,',
'    dbms_lob.substr(flex_clob,4000,1) flex_clob',
'from eba_intrack_customers'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(2760591342204682609)
,p_name=>'Customers'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.::P23_ROWID:#ROWID#'
,p_detail_link_text=>'<center><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit Customer"></center>'
,p_owner=>'MIKE'
,p_internal_uid=>2092029800191586190
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760591471415682612)
,p_db_column_name=>'ROWID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760591567557682612)
,p_db_column_name=>'ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760591652303682612)
,p_db_column_name=>'ROW_VERSION_NUMBER'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Row Version Number'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760591743050682612)
,p_db_column_name=>'ROW_KEY'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Row Key'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760591864998682613)
,p_db_column_name=>'CUSTOMER_NAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760591960777682613)
,p_db_column_name=>'CUSTOMER_NAME_UPPER'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Customer Name Upper'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760592043295682614)
,p_db_column_name=>'MARQUEE_CUSTOMER_YN'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Marquee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760592161715682614)
,p_db_column_name=>'TAGS'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760592272854682614)
,p_db_column_name=>'CUSTOMER_PROFILE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Profile'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760592348519682614)
,p_db_column_name=>'WEB_SITE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Web Site'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760592449975682614)
,p_db_column_name=>'STOCK_SYMBOL'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Stock Symbol'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760592557405682615)
,p_db_column_name=>'SIC'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'SIC'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760592646008682615)
,p_db_column_name=>'DUNS'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'DUNS'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760592745589682615)
,p_db_column_name=>'CREATED'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760592855402682616)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760592951202682616)
,p_db_column_name=>'UPDATED'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760593043932682616)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760593154215682616)
,p_db_column_name=>'FLEX_N01'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Flex N01'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760593243782682618)
,p_db_column_name=>'FLEX_N02'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Flex N02'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760593342890682618)
,p_db_column_name=>'FLEX_N03'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Flex N03'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760593455545682618)
,p_db_column_name=>'FLEX_N04'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Flex N04'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760593557442682618)
,p_db_column_name=>'FLEX_D01'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Flex D01'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760593662527682619)
,p_db_column_name=>'FLEX_D02'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Flex D02'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760593749961682619)
,p_db_column_name=>'FLEX_D03'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Flex D03'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760593869625682619)
,p_db_column_name=>'FLEX_D04'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Flex D04'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760593958430682620)
,p_db_column_name=>'FLEX_01'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Flex 01'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760594062169682620)
,p_db_column_name=>'FLEX_02'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Flex 02'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760594171163682620)
,p_db_column_name=>'FLEX_03'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Flex 03'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760594245448682620)
,p_db_column_name=>'FLEX_04'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Flex 04'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760594374498682620)
,p_db_column_name=>'FLEX_05'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Flex 05'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760594457882682621)
,p_db_column_name=>'FLEX_06'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Flex 06'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760594555485682621)
,p_db_column_name=>'FLEX_07'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Flex 07'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760594673438682621)
,p_db_column_name=>'FLEX_08'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Flex 08'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2760594743932682622)
,p_db_column_name=>'FLEX_CLOB'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Flex Clob'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(2760599749199683270)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'20920383'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'ROWID:ROW_KEY:CUSTOMER_NAME:MARQUEE_CUSTOMER_YN:TAGS:WEB_SITE:CREATED:FLEX_N01:FLEX_N02:FLEX_N03:FLEX_N04:FLEX_D01:FLEX_D02:FLEX_D03:FLEX_D04:FLEX_01:FLEX_02:FLEX_03:FLEX_04:FLEX_05:FLEX_06:FLEX_07:FLEX_08:FLEX_CLOB'
,p_sort_column_1=>'CUSTOMER_NAME'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3732111891544533957)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2760591169955682608)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2760594958607682626)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2760591169955682608)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Customer'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1723912008700599061)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1723912422337599069)
,p_event_id=>wwv_flow_imp.id(1723912008700599061)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(2760591169955682608)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1723912880818599070)
,p_event_id=>wwv_flow_imp.id(1723912008700599061)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Action Processed.'');'
);
wwv_flow_imp.component_end;
end;
/
