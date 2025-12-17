prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
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
 p_id=>5
,p_name=>'Status Codes'
,p_page_mode=>'MODAL'
,p_step_title=>'Status Codes'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(3204235665975067375)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_imp.id(3204234467922058482)
,p_help_text=>'Manage the list of Status Codes that will be available to end-users. Click the <strong>Add Status Code</strong> button to add a new status code. Click the pencil icon next to any existing status code to edit that specific status code. Click the <stro'
||'ng>Reset</strong> button to reset the interactive report. Click the <strong>Actions</strong> button to define the number of rows displayed per page, filter, format, download, and/or save the interactive report.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2752024568823614979)
,p_plug_name=>'Status Codes'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(1609178411209051992)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'    display_sequence,',
'    id,',
'    row_version_number,',
'    status_name,',
'    status_code,',
'    description,',
'    is_active,',
'    created,',
'    created_by,',
'    updated,',
'    updated_by',
'from eba_intrack_status'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(2752024767721614980)
,p_name=>'Status Codes'
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
,p_detail_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_ROWID:#ROWID#'
,p_detail_link_text=>'<center><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit Status Code"></center>'
,p_owner=>'MIKE'
,p_internal_uid=>2083463225708518561
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2752024852142614981)
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
 p_id=>wwv_flow_imp.id(2752024971908614982)
,p_db_column_name=>'ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2752025065025614982)
,p_db_column_name=>'ROW_VERSION_NUMBER'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Row Version Number'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2752025151086614982)
,p_db_column_name=>'STATUS_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Status Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2752025246208614982)
,p_db_column_name=>'STATUS_CODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Status Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2752025351870614983)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2752025469315614983)
,p_db_column_name=>'IS_ACTIVE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Active'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2752025668101614984)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2752025856986614984)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'UpdatedBy'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2807693450684172851)
,p_db_column_name=>'DISPLAY_SEQUENCE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Display Sequence'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3267196453766281574)
,p_db_column_name=>'CREATED'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3267196567390281574)
,p_db_column_name=>'UPDATED'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(2752038159552615527)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'20834767'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'DISPLAY_SEQUENCE:STATUS_NAME:STATUS_CODE:IS_ACTIVE_BY_BY_ON_ON::CREATED:UPDATED'
,p_sort_column_1=>'DISPLAY_SEQUENCE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'STATUS_NAME'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2807265755354136329)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2752024568823614979)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2752026044301614984)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2752024568823614979)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Status Code'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1728607747605680272)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1728608062291680273)
,p_event_id=>wwv_flow_imp.id(1728607747605680272)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(2752024568823614979)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1728608636706680273)
,p_event_id=>wwv_flow_imp.id(1728607747605680272)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Action Processed.'');'
);
wwv_flow_imp.component_end;
end;
/
