prompt --application/pages/page_00024
begin
--   Manifest
--     PAGE: 00024
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
 p_id=>24
,p_name=>'Notification'
,p_page_mode=>'MODAL'
,p_step_title=>'Notification'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(3204235665975067375)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(3204234467922058482)
,p_dialog_chained=>'N'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1485235363781915471)
,p_plug_name=>'Notifications'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>20
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1723963362219207560)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169348961051977)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2891979662820659206)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1723963362219207560)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2891979843967659206)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(1723963362219207560)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Delete'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P24_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2891980062508659206)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(1723963362219207560)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P24_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2891979452702659205)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(1723963362219207560)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Notification'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P24_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2891980260671659206)
,p_name=>'P24_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1485235363781915471)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2891980466662659209)
,p_name=>'P24_NOTIFICATION_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1485235363781915471)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notification Name'
,p_source=>'NOTIFICATION_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(290774390504242035)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2891980674197659209)
,p_name=>'P24_NOTIFICATION_DESCRIPTION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1485235363781915471)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notification Description'
,p_source=>'NOTIFICATION_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(290774750801242035)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'N',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2891980852667659209)
,p_name=>'P24_NOTIFICATION_TYPE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1485235363781915471)
,p_use_cache_before_default=>'NO'
,p_item_default=>'YELLOW'
,p_prompt=>'Notification Type'
,p_source=>'NOTIFICATION_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'NOTIFICATION TYPE'
,p_lov=>'.'||wwv_flow_imp.id(2891983752419659218)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(290774390504242035)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2891981060906659209)
,p_name=>'P24_DISPLAY_FROM'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1485235363781915471)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Display From'
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'DISPLAY_FROM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(290774750801242035)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2891981258515659211)
,p_name=>'P24_DISPLAY_UNTIL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1485235363781915471)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Display Until'
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'DISPLAY_UNTIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(290774390504242035)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2891981642326659211)
,p_name=>'P24_DISPLAY_SEQUENCE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1485235363781915471)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Display Sequence'
,p_source=>'DISPLAY_SEQUENCE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>8
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(290774750801242035)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2891982672845659213)
,p_validation_name=>'P24_DISPLAY_FROM must be timestamp'
,p_validation_sequence=>10
,p_validation=>'P24_DISPLAY_FROM'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(2891981060906659209)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2891982862566659215)
,p_validation_name=>'P24_DISPLAY_UNTIL must be timestamp'
,p_validation_sequence=>20
,p_validation=>'P24_DISPLAY_UNTIL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(2891981258515659211)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(1583000063350798979)
,p_validation_name=>'End after Beginning'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P24_DISPLAY_FROM is not null and :P24_DISPLAY_UNTIL is not null then',
'    return to_timestamp(:P24_DISPLAY_FROM,''DD-MON-YYYY HH24:MI:SS'') < to_timestamp(:P24_DISPLAY_UNTIL,''DD-MON-YYYY HH24:MI:SS'');',
'else',
'    return true;',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Display From and To dates must be in proper chronological order.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1723963493064207561)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(2891979662820659206)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1723963608778207562)
,p_event_id=>wwv_flow_imp.id(1723963493064207561)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2891982943043659215)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_INTRACK_NOTIFICATIONS'
,p_attribute_02=>'EBA_INTRACK_NOTIFICATIONS'
,p_attribute_03=>'P24_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_internal_uid=>2891982943043659215
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2891983149815659216)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_INTRACK_NOTIFICATIONS'
,p_attribute_02=>'EBA_INTRACK_NOTIFICATIONS'
,p_attribute_03=>'P24_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_internal_uid=>2891983149815659216
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2891983362472659216)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'12'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(2891979843967659206)
,p_internal_uid=>2891983362472659216
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1723963678683207563)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1723963678683207563
);
wwv_flow_imp.component_end;
end;
/
