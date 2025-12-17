prompt --application/pages/page_00052
begin
--   Manifest
--     PAGE: 00052
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
 p_id=>52
,p_name=>'Updates'
,p_step_title=>'Updates'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026474429031351)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This interactive report shows all updates for the ticket listed. Click the <strong>Add Update</strong> button to add a new update. Click the pencil icon next to any existing update to edit that update. Click the trashcan icon next to any existing upd'
||'ate to delete that update. Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions</strong> button to define the number of rows displayed per page, filter, format, download, and/or save the interactive repor'
||'t.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3024702649597927038)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3024725966245928394)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(1609169348961051977)
,p_plug_display_sequence=>10
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3305872956889643583)
,p_plug_name=>'Updates and Notes'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609178411209051992)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    id,',
'    note,',
'    tags,',
'    created,',
'    created_by,',
'    updated,',
'    updated_by,',
'    ''#'' delete_note',
'from',
'    EBA_INTRACK_NOTES',
'where',
'    incident_id = :P52_ID;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(3305873067170643593)
,p_name=>'Updates and Notes'
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
,p_detail_link=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.::P55_ID:#ID#'
,p_detail_link_text=>'<center><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit Update"></center>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(3204234956647058484)
,p_owner=>'ASITTERS'
,p_internal_uid=>2637311525157547174
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3305873569336643609)
,p_db_column_name=>'NOTE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Note'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3305873669508643609)
,p_db_column_name=>'TAGS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3305873749305643609)
,p_db_column_name=>'CREATED'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3305873859871643609)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3305873951276643609)
,p_db_column_name=>'UPDATED'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3305874063966643609)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3305877056739832793)
,p_db_column_name=>'ID'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3305877446612848756)
,p_db_column_name=>'DELETE_NOTE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:52:&SESSION.:DELETE_NOTE:&DEBUG.::P52_DELETE_NOTE_ID:#ID#'
,p_column_linktext=>'<span class="t-Icon fa fa-trash-o" aria-hidden="true"></span>'
,p_column_link_attr=>'class="t-Button t-Button--danger t-Button--simple t-Button--small" title="Delete Link: #LINK_TEXT#"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(3305874171780647921)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'26373127'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'NOTE:TAGS:CREATED:CREATED_BY:UPDATED:UPDATED_BY:DELETE_NOTE:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3305875847510763935)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(3024702649597927038)
,p_button_name=>'ADD_NOTE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Update'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.:RP,55:P55_INCIDENT_ID:&P52_ID.'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3305875556729757090)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(3305872956889643583)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:52:&SESSION.::&DEBUG.:52,RIR:P52_ID:&P52_ID.'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(759855619197500222)
,p_name=>'P52_TICKET_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3024725966245928394)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(759855743233500223)
,p_name=>'P52_TICKET_LINK'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(3024725966245928394)
,p_item_default=>'<a href="f?p=&APP_ID.:50:&APP_SESSION.:::50:P50_ID:&P53_ID.">&P53_TICKET_NAME.</a>'
,p_prompt=>'Ticket:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'HTML_UNSAFE',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3024775746636932216)
,p_name=>'P52_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3024725966245928394)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3305877271976837234)
,p_name=>'P52_DELETE_NOTE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3305872956889643583)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(3024840143435950238)
,p_computation_sequence=>10
,p_computation_item=>'P50_ID'
,p_computation_point=>'AFTER_FOOTER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&P52_ID.'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(759855866053500224)
,p_computation_sequence=>10
,p_computation_item=>'P52_TICKET_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_escape.html(subject)',
'from eba_intrack_incidents_view',
'where id = :P52_ID'))
,p_compute_when=>'P52_ID'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1731363219627750542)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731363607401750550)
,p_event_id=>wwv_flow_imp.id(1731363219627750542)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3305872956889643583)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731364110933750550)
,p_event_id=>wwv_flow_imp.id(1731363219627750542)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Action Processed.'');'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3305878058695899594)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Note'
,p_process_sql_clob=>'delete from eba_intrack_notes where id = :P52_DELETE_NOTE_ID;'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_process_when=>'DELETE_NOTE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Note deleted'
,p_internal_uid=>3305878058695899594
);
wwv_flow_imp.component_end;
end;
/
