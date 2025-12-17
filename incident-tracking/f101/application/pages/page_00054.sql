prompt --application/pages/page_00054
begin
--   Manifest
--     PAGE: 00054
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
 p_id=>54
,p_name=>'Attachment'
,p_page_mode=>'MODAL'
,p_step_title=>'Attachment'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026474429031351)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(3204234956647058484)
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1731374533327779145)
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
 p_id=>wwv_flow_imp.id(3105704772278782998)
,p_plug_name=>'Attachment'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3105705346034783002)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1731374533327779145)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3105705169456783002)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1731374533327779145)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Delete'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P54_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3105705055361783002)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(1731374533327779145)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P54_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3105704964763783002)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(1731374533327779145)
,p_button_name=>'ATTACH_FILE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Attachment'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P54_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(759855064382500216)
,p_name=>'P54_TICKET_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(3105704772278782998)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(759855523660500221)
,p_name=>'P54_TICKET_LINK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3105704772278782998)
,p_item_default=>'<a href="f?p=&APP_ID.:50:&APP_SESSION.:::50:P50_ID:&P53_ID.">&P54_TICKET_NAME.</a>'
,p_prompt=>'Ticket:'
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
  'based_on', 'VALUE',
  'format', 'HTML_UNSAFE',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3105706149856783007)
,p_name=>'P54_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3105704772278782998)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3105706372885783016)
,p_name=>'P54_INCIDENT_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(3105704772278782998)
,p_use_cache_before_default=>'NO'
,p_item_default=>'something'
,p_source=>'INCIDENT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3105706547408783018)
,p_name=>'P54_FILENAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(3105704772278782998)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name:'
,p_source=>'FILENAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P54_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3105706756320783018)
,p_name=>'P54_FILE_MIMETYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(3105704772278782998)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Mimetype:'
,p_source=>'FILE_MIMETYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P54_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3105706943661783018)
,p_name=>'P54_FILE_BLOB'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(3105704772278782998)
,p_use_cache_before_default=>'NO'
,p_prompt=>'File'
,p_post_element_text=>'<p><em>Attachments must be under 15M in size.</em></p>'
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(1609202139053052065)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'blob_last_updated_column', 'UPDATED',
  'character_set_column', 'FILE_CHARSET',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'filename_column', 'FILENAME',
  'mime_type_column', 'FILE_MIMETYPE',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3105707150262783019)
,p_name=>'P54_FILE_COMMENTS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(3105704772278782998)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'FILE_COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'N',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3105707362791783019)
,p_name=>'P54_TAGS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(3105704772278782998)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(759855445743500220)
,p_computation_sequence=>10
,p_computation_item=>'P54_TICKET_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_escape.html(subject)',
'from eba_intrack_incidents_view',
'where id = :P54_INCIDENT_ID'))
,p_compute_when=>'P54_INCIDENT_ID'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1731374766931779148)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(3105705346034783002)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731374875895779149)
,p_event_id=>wwv_flow_imp.id(1731374766931779148)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3105708353687783022)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_INTRACK_FILES'
,p_attribute_02=>'EBA_INTRACK_FILES'
,p_attribute_03=>'P54_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_internal_uid=>3105708353687783022
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3105708554598783022)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_INTRACK_FILES'
,p_attribute_02=>'EBA_INTRACK_FILES'
,p_attribute_03=>'P54_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_internal_uid=>3105708554598783022
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3105708754173783022)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(3105705169456783002)
,p_internal_uid=>3105708754173783022
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1731374746721779147)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1731374746721779147
);
wwv_flow_imp.component_end;
end;
/
