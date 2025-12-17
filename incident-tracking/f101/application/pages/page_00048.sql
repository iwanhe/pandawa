prompt --application/pages/page_00048
begin
--   Manifest
--     PAGE: 00048
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
 p_id=>48
,p_name=>'Assignees'
,p_alias=>'ASSIGNEES'
,p_step_title=>'Assignees'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026645470032439)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'<p>This page provides an interactive report of logged tickets summarized by assignee.  Click on column headings to sort and filter data, click on the <strong>Actions</strong> menu to customize column display and many additional advanced features.</p>'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2809254463576403829)
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
 p_id=>wwv_flow_imp.id(2809254855578403833)
,p_plug_name=>'Assignees'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609178411209051992)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.assignee_name USERNAME, ',
'     u.id,',
'     u.email,',
'     u.created,',
'     u.created_by,',
'     u.updated,',
'     u.updated_by,',
'     (select count(*) ',
'      from eba_intrack_incidents i ',
'      where i.assigned_to_id = u.id) tickets,',
'      (select count(*) ',
'      from eba_intrack_incidents i,',
'           eba_intrack_status s',
'      where i.assigned_to_id = u.id and ',
'            i.status_id = s.id and',
'            s.status_type = ''OPEN'') open_tickets,',
'      (select count(*) ',
'      from eba_intrack_incidents i,',
'           eba_intrack_status s',
'      where i.assigned_to_id = u.id and ',
'            i.status_id = s.id and',
'            s.status_type = ''CLOSED'') closed_tickets,',
'      (select max(date_closed)',
'      from eba_intrack_incidents i,',
'           eba_intrack_status s',
'      where i.assigned_to_id = u.id and ',
'            i.status_id = s.id and',
'            s.status_type = ''CLOSED'') last_closed   ',
'from eba_intrack_assignees u'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(2809254943774403833)
,p_name=>'Assignees'
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
,p_internal_uid=>2140693401761307414
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2809255157032403835)
,p_db_column_name=>'USERNAME'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Username'
,p_column_link=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:RP,58:P58_ID:#ID#'
,p_column_linktext=>'#USERNAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2809255261277403836)
,p_db_column_name=>'ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2809255343210403836)
,p_db_column_name=>'EMAIL'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2809255768925403836)
,p_db_column_name=>'CREATED'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2809255844339403836)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2809255959116403837)
,p_db_column_name=>'UPDATED'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2809256058778403837)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2809256160682403837)
,p_db_column_name=>'TICKETS'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Tickets'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2809256270046403837)
,p_db_column_name=>'OPEN_TICKETS'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Open Tickets'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2,RIR:IR_ASSIGNEE,IR_STATUS_TYPE:#USERNAME#,Open'
,p_column_linktext=>'#OPEN_TICKETS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2809367861363421876)
,p_db_column_name=>'LAST_CLOSED'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Last Closed'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2809466151928438151)
,p_db_column_name=>'CLOSED_TICKETS'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Closed Tickets'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2,RIR:IR_ASSIGNEE,IR_STATUS_TYPE:#USERNAME#,Closed'
,p_column_linktext=>'#CLOSED_TICKETS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(2809260264910403990)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'21406988'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'USERNAME:EMAIL:OPEN_TICKETS:CLOSED_TICKETS:LAST_CLOSED:'
,p_sort_column_1=>'OPEN_TICKETS'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'USERNAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3335161662730694536)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2809254463576403829)
,p_button_name=>'ADD_ASSIGNEE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Assignee'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:RP,58::'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2809406043140426089)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2809254855578403833)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:48,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(3023080258197894748)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'48'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1723655567640914181)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1723655717479914182)
,p_event_id=>wwv_flow_imp.id(1723655567640914181)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(2809254855578403833)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1723656010859914185)
,p_event_id=>wwv_flow_imp.id(1723655567640914181)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Action Processed.'');'
);
wwv_flow_imp.component_end;
end;
/
