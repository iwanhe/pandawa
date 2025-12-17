prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
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
 p_id=>10
,p_name=>'Product'
,p_page_mode=>'MODAL'
,p_step_title=>'Product'
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
 p_id=>wwv_flow_imp.id(1723961402133207540)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2752451067246674888)
,p_plug_name=>'Products'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2752451642854674890)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1723961402133207540)
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
 p_id=>wwv_flow_imp.id(2752451454077674890)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1723961402133207540)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Delete'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P10_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2752451343833674890)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(1723961402133207540)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P10_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2752451248022674890)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(1723961402133207540)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Product'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P10_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2752452448690674892)
,p_name=>'P10_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2752451067246674888)
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
 p_id=>wwv_flow_imp.id(2752452649109674892)
,p_name=>'P10_PRODUCT_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2752451067246674888)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Name'
,p_source=>'PRODUCT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(290774390504242035)
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
 p_id=>wwv_flow_imp.id(2752452846282674892)
,p_name=>'P10_DESCRIPTION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2752451067246674888)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(290774750801242035)
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
 p_id=>wwv_flow_imp.id(2752453068045674892)
,p_name=>'P10_IS_ACTIVE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(2752451067246674888)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Active'
,p_source=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(290774750801242035)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2756814666289904268)
,p_name=>'P10_VERSION_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(2752451067246674888)
,p_prompt=>'Version 1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_display_when=>'P10_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_imp.id(290774750801242035)
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
 p_id=>wwv_flow_imp.id(2756814860936904268)
,p_name=>'P10_VERSION_2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(2752451067246674888)
,p_prompt=>'Version 2'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_display_when=>'P10_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_imp.id(290774750801242035)
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
 p_id=>wwv_flow_imp.id(2756815048879904269)
,p_name=>'P10_VERSION_3'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(2752451067246674888)
,p_prompt=>'Version 3'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_display_when=>'P10_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_imp.id(290774750801242035)
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
 p_id=>wwv_flow_imp.id(2756815273576904269)
,p_name=>'P10_VERSION_4'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(2752451067246674888)
,p_prompt=>'Version 4'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_display_when=>'P10_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_imp.id(290774750801242035)
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
 p_id=>wwv_flow_imp.id(2756948746119917346)
,p_name=>'P10_PK'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(2752451067246674888)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1723961611026207542)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(2752451642854674890)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1723961691581207543)
,p_event_id=>wwv_flow_imp.id(1723961611026207542)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2752453752631674893)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_INTRACK_PRODUCT'
,p_attribute_02=>'EBA_INTRACK_PRODUCT'
,p_attribute_03=>'P10_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_internal_uid=>2752453752631674893
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2752453972812674893)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_INTRACK_PRODUCT'
,p_attribute_02=>'EBA_INTRACK_PRODUCT'
,p_attribute_03=>'P10_ID'
,p_attribute_04=>'ID'
,p_attribute_09=>'P10_PK'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_return_key_into_item1=>'P10_PK'
,p_internal_uid=>2752453972812674893
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2756925570576914972)
,p_process_sequence=>35
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'populate versions'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   procedure insert_version(p_version in varchar2 default null) is',
'   begin',
'      if p_version is not null then',
'          insert into EBA_INTRACK_VERSION (PRODUCT_ID, VERSION_NAME) values (:P10_PK, p_version);',
'      end if;',
'   end;',
'begin',
'   insert_version(:P10_VERSION_1);',
'   insert_version(:P10_VERSION_2);',
'   insert_version(:P10_VERSION_3);',
'   insert_version(:P10_VERSION_4);',
'   commit;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2756925570576914972
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2752454172345674894)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(2752451454077674890)
,p_internal_uid=>2752454172345674894
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1723961499437207541)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1723961499437207541
);
wwv_flow_imp.component_end;
end;
/
