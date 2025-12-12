prompt --application/pages/page_00108
begin
--   Manifest
--     PAGE: 00108
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_page.create_page(
 p_id=>108
,p_name=>'Reassign Action Items'
,p_page_mode=>'MODAL'
,p_step_title=>'Reassign Action Items'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486086019073759)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_help_text=>'<p>This page is used to reassign ownership of action items. Select the user the Action Item is currently assigned to from the "Change From" select list, type in the username of the new assignee in the "Change To" text field, and click the <strong>Cha'
||'nge Owner</strong> button.</p>'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5975717195163109317)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5975721483480191736)
,p_plug_name=>'Action Items'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select action_item_owner,',
'       (select count(*) ',
'     from EBA_PROJ_STATUS_AIS ',
'     where lower(action_item_owner) = lower(ACTION_OWNER_01) or',
'           lower(action_item_owner) = lower(ACTION_OWNER_02) or',
'           lower(action_item_owner) = lower(ACTION_OWNER_03) or',
'           lower(action_item_owner) = lower(ACTION_OWNER_04)) count_of_action_items',
'from',
'(',
'select distinct lower(d) action_item_owner',
'from (',
'select ACTION_OWNER_01 d',
'from   EBA_PROJ_STATUS_AIS',
'where ACTION_OWNER_01 is not null',
'union',
'select ACTION_OWNER_02 d',
'from   EBA_PROJ_STATUS_AIS',
'where ACTION_OWNER_02 is not null',
'union',
'select ACTION_OWNER_03 d',
'from   EBA_PROJ_STATUS_AIS',
'where ACTION_OWNER_03 is not null',
'union',
'select ACTION_OWNER_04 d',
'from   EBA_PROJ_STATUS_AIS',
'where ACTION_OWNER_04 is not null',
') x',
') y'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(5975721606612191736)
,p_name=>'Action Items'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>779494924352574978
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5975722883105202590)
,p_db_column_name=>'ACTION_ITEM_OWNER'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Action Item Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5975725690720381382)
,p_db_column_name=>'COUNT_OF_ACTION_ITEMS'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Count of Action Items'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5975721984172191942)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7794954'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'ACTION_ITEM_OWNER:COUNT_OF_ACTION_ITEMS'
,p_sort_column_1=>'ACTION_ITEM_OWNER'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5975723692184222641)
,p_plug_name=>'Rename Owner'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672347163384369864)
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5975723198633214975)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5975721483480191736)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:RP,108,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5975724814572295260)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5975721483480191736)
,p_button_name=>'RENAME_OWNER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change Owner'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5975725406513313277)
,p_branch_name=>'branch back to same page with success message'
,p_branch_action=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:RP,108::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5975724289538245205)
,p_name=>'P108_CHANGE_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5975723692184222641)
,p_prompt=>'Change From'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct substr(lower(d),1,64) d, lower(d) r ',
'from (',
'select ACTION_OWNER_01 d',
'from   EBA_PROJ_STATUS_AIS',
'where ACTION_OWNER_01 is not null',
'union',
'select ACTION_OWNER_02 d',
'from   EBA_PROJ_STATUS_AIS',
'where ACTION_OWNER_02 is not null',
'union',
'select ACTION_OWNER_03 d',
'from   EBA_PROJ_STATUS_AIS',
'where ACTION_OWNER_03 is not null',
'union',
'select ACTION_OWNER_04 d',
'from   EBA_PROJ_STATUS_AIS',
'where ACTION_OWNER_04 is not null',
')',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(639523678332439146)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5975724508935251424)
,p_name=>'P108_CHANGE_TO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5975723692184222641)
,p_prompt=>'Change To'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(639523678332439146)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5975725100636310226)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'update action item owner'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update EBA_PROJ_STATUS_AIS set ACTION_OWNER_01 = lower(:P108_CHANGE_TO) where lower(ACTION_OWNER_01) = lower(:P108_CHANGE_FROM);',
'update EBA_PROJ_STATUS_AIS set ACTION_OWNER_02 = lower(:P108_CHANGE_TO) where lower(ACTION_OWNER_02) = lower(:P108_CHANGE_FROM);',
'update EBA_PROJ_STATUS_AIS set ACTION_OWNER_03 = lower(:P108_CHANGE_TO) where lower(ACTION_OWNER_03) = lower(:P108_CHANGE_FROM);',
'update EBA_PROJ_STATUS_AIS set ACTION_OWNER_04 = lower(:P108_CHANGE_TO) where lower(ACTION_OWNER_04) = lower(:P108_CHANGE_FROM);'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action item owner changed from &P108_CHANGE_FROM. to &P108_CHANGE_TO..'
,p_internal_uid=>5975725100636310226
);
wwv_flow_imp.component_end;
end;
/
