prompt --application/pages/page_00044
begin
--   Manifest
--     PAGE: 00044
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
 p_id=>44
,p_name=>'Ticket Links'
,p_step_title=>'Ticket Links'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026474429031351)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This interactive report shows the links assigned to an incident ticket. Click the "Name" column to navigate to the link''s url in a new tab. Click the red trashcan icon to delete a link. Click the pencil icon to edit a link. Click the <strong>Add Link'
||'</strong> button to add a new link. Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions</strong> button to define the number of rows displayed per page, filter, format, download, and/or save the interact'
||'ive report.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3179895547633439547)
,p_plug_name=>'Ticket Links'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609178411209051992)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select incident_id, ',
'id, ',
'nvl(LINK_TEXT,link_target) link_text, ',
'case when substr(link_target,1,4) != ''http'' then',
'   ''http://'' || link_target',
'else',
'   link_target',
'end link_target, ',
'TAGS, ',
'LINK_COMMENTS, ',
'created, ',
'lower(created_by) created_by, ',
'updated, ',
'lower(updated_by) updated_by,',
'''#'' delete_link',
'from eba_intrack_links',
'where incident_id = :P44_ID'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(3179895756844439548)
,p_name=>'Ticket Links'
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
,p_detail_link=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.::P49_ID:#ID#'
,p_detail_link_text=>'<center><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit Link"></center>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(3204234956647058484)
,p_owner=>'CBCHO'
,p_internal_uid=>2511334214831343129
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3179895870522439552)
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
 p_id=>wwv_flow_imp.id(3179895966196439556)
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
 p_id=>wwv_flow_imp.id(3179896064557439556)
,p_db_column_name=>'LINK_TARGET'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Link Target'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3179896156810439558)
,p_db_column_name=>'LINK_TEXT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Name'
,p_column_link=>'#LINK_TARGET#'
,p_column_linktext=>'#LINK_TEXT#'
,p_column_link_attr=>'target="_blank"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3179896255342439560)
,p_db_column_name=>'LINK_COMMENTS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3179896368877439560)
,p_db_column_name=>'TAGS'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3179896454227439560)
,p_db_column_name=>'CREATED'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Date Added'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3179896558390439560)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Added By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3179896662739439560)
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
 p_id=>wwv_flow_imp.id(3179896772193439560)
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
 p_id=>wwv_flow_imp.id(3179898063700450799)
,p_db_column_name=>'DELETE_LINK'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:44:&SESSION.:DELETE_LINK:&DEBUG.::P44_DELETE_LINK_ID:#ID#'
,p_column_linktext=>'<span class="t-Icon fa fa-trash-o" aria-hidden="true"></span>'
,p_column_link_attr=>'class="t-Button t-Button--danger t-Button--simple t-Button--small" title="Delete Link: #LINK_TEXT#"'
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
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(3179906770738660992)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'25113453'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'LINK_TEXT:LINK_TARGET:CREATED:CREATED_BY:TAGS:DELETE_LINK:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3179897067016439562)
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
 p_id=>wwv_flow_imp.id(3179898364177460361)
,p_plug_name=>'button bar'
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
 p_id=>wwv_flow_imp.id(3179896951065439561)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(3179897067016439562)
,p_button_name=>'CREATE_LINK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Link'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:49:P49_INCIDENT_ID:&P44_ID.'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3179904567575631749)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(3179895547633439547)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:RP,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3179905357663638288)
,p_name=>'P44_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3179898364177460361)
,p_prompt=>'Ticket:'
,p_pre_element_text=>'<a href="f?p=&APP_ID.:50:&APP_SESSION.::::P50_ID:&P44_ID.">'
,p_post_element_text=>'</a>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'TICKETS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select subject, id',
'from eba_intrack_incidents_view',
'order by 1'))
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3179905565282640533)
,p_name=>'P44_DELETE_LINK_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3179898364177460361)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(3179908042734681264)
,p_computation_sequence=>10
,p_computation_item=>'P50_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P44_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1731364800899752968)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731365166011752968)
,p_event_id=>wwv_flow_imp.id(1731364800899752968)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3179895547633439547)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731365687012752968)
,p_event_id=>wwv_flow_imp.id(1731364800899752968)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Action Processed.'');'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3179910758018714085)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'delete link'
,p_process_sql_clob=>'delete from eba_intrack_links where id = :P44_DELETE_LINK_ID;'
,p_process_clob_language=>'PLSQL'
,p_process_when=>'DELETE_LINK'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Link deleted'
,p_internal_uid=>3179910758018714085
);
wwv_flow_imp.component_end;
end;
/
