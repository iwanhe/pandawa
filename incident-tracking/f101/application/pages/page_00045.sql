prompt --application/pages/page_00045
begin
--   Manifest
--     PAGE: 00045
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
 p_id=>45
,p_name=>'Contacts'
,p_step_title=>'Contacts'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026543046031745)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This interactive report shows all customer contacts. Change the "Customer" select-list to filter the results displayed on this page. Click linked column values to drill down. Click the <strong>Reset</strong> button to reset the interactive report. Cl'
||'ick the <strong>Actions</strong> button to define the number of rows displayed per page, filter, format, download, and/or save the interactive report.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2798442256578600860)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2798529771315618598)
,p_plug_name=>'Contacts'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609178411209051992)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.customer_name, ',
'     cc.id,',
'     cc.first_name, ',
'     cc.last_name,',
'     decode(cc.last_name,null,null,cc.last_name||'', ''||cc.first_name) name,',
'     cc.email,',
'     cc.phone,',
'     cc.country_id,',
'     cc.department_name,',
'     cc.additional_info,',
'     cc.created as created_on,',
'     cc.created_by,',
'     cc.updated as updated_on,',
'     cc.updated_by,',
'     (select count(*) ',
'      from eba_intrack_incidents i ',
'      where i.customer_contact_id = cc.id) tickets,',
'      (select count(*) ',
'      from eba_intrack_incidents i,',
'           eba_intrack_status s',
'      where i.customer_contact_id = cc.id and ',
'            i.status_id = s.id and',
'            s.status_type = ''OPEN'') open_tickets     ',
'from eba_intrack_customers c,',
'     eba_intrack_customer_contact cc',
'where c.id = cc.customer_id(+)',
'and (c.id = :P45_CUSTOMER or nvl(:P45_CUSTOMER,0) = 0)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(2798529873341618598)
,p_name=>'Contacts'
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
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>2129968331328522179
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2798530071266618607)
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
 p_id=>wwv_flow_imp.id(2798530165317618607)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2798530258275618607)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2798530345692618607)
,p_db_column_name=>'EMAIL'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2798530474344618607)
,p_db_column_name=>'PHONE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Phone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2798530542648618608)
,p_db_column_name=>'COUNTRY_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Country'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2798530644227618608)
,p_db_column_name=>'DEPARTMENT_NAME'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2798530763115618608)
,p_db_column_name=>'ADDITIONAL_INFO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Info'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2798530849133618608)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2798530946232618608)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2798531051930618608)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2798531154773618609)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2800312861422126692)
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
 p_id=>wwv_flow_imp.id(2800381647532170025)
,p_db_column_name=>'OPEN_TICKETS'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Open Tickets'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2,RIR:IR_CUSTOMER_CONTACT_EMAIL,IR_STATUS_TYPE:#EMAIL#,Open'
,p_column_linktext=>'#OPEN_TICKETS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2801127263434297634)
,p_db_column_name=>'NAME'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Name'
,p_column_link=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:RP,47:P47_CONTACT_ID:#ID#'
,p_column_linktext=>'#NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2801330246989330725)
,p_db_column_name=>'ID'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(2798538572008618880)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'21299771'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'NAME:CUSTOMER_NAME:EMAIL:COUNTRY_UPDATED_ON:UPDATED_BY:OPEN_TICKETS'
,p_sort_column_1=>'OPEN_TICKETS'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'TICKETS'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'CUSTOMER_NAME'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2818046851969367931)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609169348961051977)
,p_plug_display_sequence=>10
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY_3'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2807220164920129597)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2818046851969367931)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202304669052069)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:45,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2818226369331401354)
,p_name=>'P45_CUSTOMER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2818046851969367931)
,p_item_default=>'0'
,p_prompt=>'Customer'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CUSTOMER'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CUSTOMER_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_CUSTOMERS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Customers -'
,p_lov_null_value=>'0'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'REDIRECT_SET_VALUE')).to_clob
);
wwv_flow_imp.component_end;
end;
/
