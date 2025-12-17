prompt --application/pages/page_00028
begin
--   Manifest
--     PAGE: 00028
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
 p_id=>28
,p_name=>'Edit Ticket'
,p_alias=>'EDIT_TICKET'
,p_step_title=>'Edit Ticket'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026474429031351)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/eba_info_bubble.css" type="text/css" media="all" charset="utf-8">',
'',
'<style>',
'.permalink { padding: 0 10px 10px 10px; text-align: center;}',
'.permalink a {color: #888; font: 11px/12px Arial, sans-serif;}',
'</style>',
''))
,p_step_template=>wwv_flow_imp.id(1609163135326051960)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(3204234956647058484)
,p_help_text=>'Edit an ticket''s attributes on this page. Click the <strong>Apply Changes</strong> button to save your changes. Click the <strong>Cancel</strong> button to return to the ticket details page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1224927454418833585)
,p_plug_name=>'Hidden Items'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>100
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>wwv_flow_imp.id(1223401557354991272)
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>100
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2770849564427875817)
,p_plug_name=>'Ticket'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2770856746497875854)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>90
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2771012648222894485)
,p_plug_name=>'Bug Information'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2771051061381898231)
,p_plug_name=>'Product'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2771070270039900724)
,p_plug_name=>'Customer'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3310573346410441673)
,p_plug_name=>'Attributes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>37
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2770849749215875818)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2770856746497875854)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P28_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2770849951136875818)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2770856746497875854)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2770850158166875819)
,p_branch_action=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1224928172392851858)
,p_name=>'P28_ROW_KEY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2770849564427875817)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ticket'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select INCIDENT_NUMBER',
'from EBA_INTRACK_INCIDENTS',
'where id = :P28_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770850350954875822)
,p_name=>'P28_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3310573346410441673)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770850751284875836)
,p_name=>'P28_INCIDENT_NUMBER'
,p_item_sequence=>71
,p_item_plug_id=>wwv_flow_imp.id(3310573346410441673)
,p_use_cache_before_default=>'NO'
,p_source=>'INCIDENT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770850970633875840)
,p_name=>'P28_BUG_NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(2771012648222894485)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Bug Number'
,p_source=>'BUG_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>48
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770851142968875840)
,p_name=>'P28_SUBJECT'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2770849564427875817)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Subject'
,p_source=>'SUBJECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(1609202139053052065)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770852156258875842)
,p_name=>'P28_CATEGORY_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(3310573346410441673)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Category'
,p_source=>'CATEGORY_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CATEGORY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CATEGORY_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_CATEGORY',
' order by display_sequence'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770852373492875842)
,p_name=>'P28_ASSIGNED_TO_ID'
,p_item_sequence=>31
,p_item_plug_id=>wwv_flow_imp.id(3310573346410441673)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Assigned To'
,p_source=>'ASSIGNED_TO_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'ASSIGNEES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select assignee_name d, id r',
'from   eba_intrack_assignees',
'order by 1'))
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770853350795875845)
,p_name=>'P28_DESCRIPTION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(2770849564427875817)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>32767
,p_cHeight=>8
,p_field_template=>wwv_flow_imp.id(1609202139053052065)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'N',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770853547115875846)
,p_name=>'P28_PRODUCT_ID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(2771051061381898231)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product'
,p_source=>'PRODUCT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_PRODUCT',
' order by 1'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770853771909875846)
,p_name=>'P28_PRODUCT_VERSION_ID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(2771051061381898231)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Version'
,p_source=>'PRODUCT_VERSION_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCT VERSION'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VERSION_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_VERSION',
' order by 1'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770853944404875846)
,p_name=>'P28_ADDITIONAL_PRODUCT_INFO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(2771051061381898231)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Additional Product Info'
,p_source=>'ADDITIONAL_PRODUCT_INFO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'N',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770854148670875847)
,p_name=>'P28_CUSTOMER_ID'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(2771070270039900724)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Customer'
,p_source=>'CUSTOMER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CUSTOMER'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CUSTOMER_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_CUSTOMERS',
' order by 1'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770854345581875848)
,p_name=>'P28_CUSTOMER_DEPARTMENT'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(2771070270039900724)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Department'
,p_source=>'CUSTOMER_DEPARTMENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>500
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770854763765875848)
,p_name=>'P28_STATUS_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(3310573346410441673)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'STATUS_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select status_code||''. ''||STATUS_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_STATUS',
' order by display_sequence'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770854969238875848)
,p_name=>'P28_SEVERITY_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(3310573346410441673)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Severity'
,p_source=>'SEVERITY_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SEVERITY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select severity_code||''. ''||SEVERITY_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_SEVERITY',
' order by sequence_number'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770855170778875848)
,p_name=>'P28_URGENCY_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(3310573346410441673)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Urgency'
,p_source=>'URGENCY_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'URGENCY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select URGENCY_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_URGENCY',
' order by display_sequence'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770855743568875849)
,p_name=>'P28_TAGS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2770849564427875817)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag',
'  from eba_intrack_tags_type_sum',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>80
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2801034361225287551)
,p_name=>'P28_CUSTOMER_CONTACT_ID'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(2771070270039900724)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Customer Contact'
,p_source=>'CUSTOMER_CONTACT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select email, id',
'from eba_intrack_customer_contact',
'where CUSTOMER_ID = :P28_CUSTOMER_ID',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(3023114471703898638)
,p_computation_sequence=>10
,p_computation_item=>'P50_ID'
,p_computation_point=>'AFTER_FOOTER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&P28_ID.'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2300827564491951681)
,p_validation_name=>'Unique incident summary'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_intrack_incidents',
'where product_id = :P28_PRODUCT_ID',
'    and product_version_id = :P28_PRODUCT_VERSION_ID',
'    and subject = :P28_SUBJECT',
'    and id <> :P28_ID'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'An incident with the same summary already exists for this product.'
,p_associated_item=>wwv_flow_imp.id(2770851142968875840)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(300240260307380402)
,p_validation_name=>'Valid Characters in Tag'
,p_validation_sequence=>40
,p_validation=>'not regexp_like( :P28_TAGS, ''[:;#\/\\\?\&]'' )'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Tags may not contain the following characters: : ; \ / ? &'
,p_when_button_pressed=>wwv_flow_imp.id(2770849749215875818)
,p_associated_item=>wwv_flow_imp.id(2770855743568875849)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2770856256410875852)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_INTRACK_INCIDENTS'
,p_attribute_02=>'EBA_INTRACK_INCIDENTS'
,p_attribute_03=>'P28_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_internal_uid=>2770856256410875852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2770856443592875854)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_INTRACK_INCIDENTS'
,p_attribute_02=>'EBA_INTRACK_INCIDENTS'
,p_attribute_03=>'P28_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_internal_uid=>2770856443592875854
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2770856648226875854)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2770856648226875854
);
wwv_flow_imp.component_end;
end;
/
