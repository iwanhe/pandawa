prompt --application/pages/page_00053
begin
--   Manifest
--     PAGE: 00053
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
 p_id=>53
,p_name=>'Ticket Attachments'
,p_step_title=>'Ticket Attachments'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026474429031351)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This interactive report shows all attachments for the ticket listed. Click the <strong>Add Attachment</strong> button to add a new attachment/upload a file. Click the pencil icon next to any existing attachment to edit that attachment. Click the tras'
||'hcan icon next to any existing attachment to delete that attachment. Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions</strong> button to define the number of rows displayed per page, filter, format, d'
||'ownload, and/or save the interactive report.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3105709348679783088)
,p_plug_name=>'Ticket Attachments'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609178411209051992)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select incident_id, ',
'id,',
'apex_escape.html(filename) as link_text,',
'''<a href="''||APEX_UTIL.GET_BLOB_FILE_SRC(''P54_FILE_BLOB'',id)||''">''||apex_escape.html(filename)||''</a>'' name,',
'substr(file_comments,1,50)||decode(greatest(length(file_comments),50),50,'''',''...'') description,',
'TAGS,',
'dbms_lob.getlength(FILE_BLOB) file_size,',
'FILE_MIMETYPE mimetype,',
'created date_added, lower(created_by) added_by,',
'updated, lower(updated_by) updated_by,',
'''#'' delete_file',
'from eba_intrack_files',
'where incident_id = :P53_ID',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(3105709561508783089)
,p_name=>'Ticket Attachments'
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
,p_detail_link=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:54:P54_ID:#ID#'
,p_detail_link_text=>'<center><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit Ticket Attachment"></center>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(3204234956647058484)
,p_owner=>'CBCHO'
,p_internal_uid=>2437148019495686670
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3105709664897783092)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3105709767470783093)
,p_db_column_name=>'INCIDENT_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Incident Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3105710274103783094)
,p_db_column_name=>'TAGS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3105710556299783095)
,p_db_column_name=>'UPDATED'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3105710662926783096)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3105730873035788450)
,p_db_column_name=>'NAME'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select filename',
'from eba_intrack_files',
'where incident_id = :P53_ID',
'order by 1'))
,p_rpt_show_filter_lov=>'C'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3105730967070788451)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3105731068456788451)
,p_db_column_name=>'FILE_SIZE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Size'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3105731154896788451)
,p_db_column_name=>'MIMETYPE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Mimetype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3105731268859788451)
,p_db_column_name=>'DATE_ADDED'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Date Added'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3105731353723788451)
,p_db_column_name=>'ADDED_BY'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Added By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3105731454787788452)
,p_db_column_name=>'DELETE_FILE'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:53:&SESSION.:DELETE_FILE:&DEBUG.::P53_DELETE_FILE_ID:#ID#'
,p_column_linktext=>'<span class="t-Icon fa fa-trash-o" aria-hidden="true"></span>'
,p_column_link_attr=>'class="t-Button t-Button--danger t-Button--simple t-Button--small" title="Delete Attachment: #LINK_TEXT#"'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(274103139775497513)
,p_db_column_name=>'LINK_TEXT'
,p_display_order=>28
,p_column_identifier=>'S'
,p_column_label=>'Link Text'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(3105784052734791994)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'24372226'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'NAME:FILE_SIZE:DESCRIPTION:DATE_ADDED:ADDED_BY:TAGS:DELETE_FILE::LINK_TEXT'
,p_sort_column_1=>'DATE_ADDED'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'FILE_SIZE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3105710952073783096)
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
 p_id=>wwv_flow_imp.id(3105761749271791046)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(1609169348961051977)
,p_plug_display_sequence=>10
,p_plug_new_grid_column=>false
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3105710854672783096)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(3105710952073783096)
,p_button_name=>'ATTACH_FILE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Attachment'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:54:P54_INCIDENT_ID:&P53_ID.'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3105931767887815364)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(3105709348679783088)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:RP,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(274103197167497514)
,p_name=>'P53_TICKET_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(3105761749271791046)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(274103395498497516)
,p_name=>'P53_TICKET_LINK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3105761749271791046)
,p_item_default=>'<a href="f?p=&APP_ID.:50:&APP_SESSION.:::50:P50_ID:&P53_ID.">&P53_TICKET_NAME.</a>'
,p_prompt=>'Ticket: '
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
 p_id=>wwv_flow_imp.id(3106388456637849894)
,p_name=>'P53_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3105761749271791046)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3106483964040861477)
,p_name=>'P53_DELETE_FILE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(3105761749271791046)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(3106430570143853828)
,p_computation_sequence=>10
,p_computation_item=>'P50_ID'
,p_computation_point=>'AFTER_FOOTER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P53_ID'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(274103363702497515)
,p_computation_sequence=>10
,p_computation_item=>'P53_TICKET_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_escape.html(subject)',
'from eba_intrack_incidents_view',
'where id = :P53_ID'))
,p_compute_when=>'P53_ID'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1731366370742756608)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731366824213756609)
,p_event_id=>wwv_flow_imp.id(1731366370742756608)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3105709348679783088)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731367316652756610)
,p_event_id=>wwv_flow_imp.id(1731366370742756608)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Action Processed.'');'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3106514749280866759)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'delete file'
,p_process_sql_clob=>'delete from eba_intrack_files where id = :P53_DELETE_FILE_ID;'
,p_process_clob_language=>'PLSQL'
,p_process_when=>'DELETE_FILE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'File deleted.'
,p_internal_uid=>3106514749280866759
);
wwv_flow_imp.component_end;
end;
/
