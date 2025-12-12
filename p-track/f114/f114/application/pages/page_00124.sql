prompt --application/pages/page_00124
begin
--   Manifest
--     PAGE: 00124
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
 p_id=>124
,p_name=>'Additional Required Item'
,p_page_mode=>'MODAL'
,p_step_title=>'Additional Required Item'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(5847486086019073759)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(628364522803098936)
,p_plug_name=>'Form on EBA_PROJ_REQUIRED_ITEMS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4348746159905060781)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672347163384369864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(628364991788098936)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(4348746159905060781)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Assign Item as Required'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P124_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(628365216652098936)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(4348746159905060781)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(628365155382098936)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(4348746159905060781)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Delete Required Assignment'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P124_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(628367209384098938)
,p_name=>'P124_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(628364522803098936)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(628367693862098964)
,p_name=>'P124_PAGE_ID'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(628364522803098936)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Page'
,p_source=>'PAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REQUIRED PAGES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct page_id || '' - '' || apex_escape.html(page_name) d, page_id r',
'  from  apex_application_page_items',
' where application_id = :APP_ID',
'   and is_required = ''No''',
'  and item_label_template not in (''Hidden'',''Required'')',
'order by page_id asc;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(639523678332439146)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(628368014231098966)
,p_name=>'P124_ITEM_NAME'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(628364522803098936)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Item Name'
,p_source=>'ITEM_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct label || '' - '' || item_name d, item_name r',
'  from apex_application_page_items',
' where application_id = :APP_ID',
'   and page_id = :P124_PAGE_ID',
'   and instr(item_name,''FLEX'') = 0',
'   and is_required = ''No''',
'   and item_label_template not in (''Hidden'',''Required'')',
'   and label is not null',
'   and item_name not in (select distinct item_name from eba_proj_required_items)',
'union',
'select distinct item_name d, item_name r',
'  from eba_proj_required_items',
' where id = :P124_ID'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_lov_cascade_parent_items=>'P124_PAGE_ID'
,p_ajax_items_to_submit=>'P124_PAGE_ID,P124_ITEM_NAME'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(639523678332439146)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4348746327863060783)
,p_name=>'P124_REQ_TEMPLATE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(628364522803098936)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4348746572250060785)
,p_name=>'P124_OPT_TEMPLATE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(628364522803098936)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(4348746468823060784)
,p_computation_sequence=>10
,p_computation_item=>'P124_REQ_TEMPLATE_ID'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select label_template_id  ',
'  from APEX_APPLICATION_TEMP_LABEL  ',
' where template_name = ''Required''  ',
'   and application_id = :APP_ID'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(4348746643942060786)
,p_computation_sequence=>20
,p_computation_item=>'P124_OPT_TEMPLATE_ID'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select label_template_id  ',
'  from APEX_APPLICATION_TEMP_LABEL  ',
' where template_name = ''Optional''  ',
'   and application_id = :APP_ID'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(711446067411939467)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(628365216652098936)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(711446130032939468)
,p_event_id=>wwv_flow_imp.id(711446067411939467)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(628368817522098969)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_PROJ_REQUIRED_ITEMS'
,p_attribute_02=>'EBA_PROJ_REQUIRED_ITEMS'
,p_attribute_03=>'P124_ID'
,p_attribute_04=>'ID'
,p_internal_uid=>628368817522098969
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(628369215782098969)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_PROJ_REQUIRED_ITEMS'
,p_attribute_02=>'EBA_PROJ_REQUIRED_ITEMS'
,p_attribute_03=>'P124_ID'
,p_attribute_04=>'ID'
,p_attribute_09=>'P124_ID'
,p_attribute_11=>'I:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_internal_uid=>628369215782098969
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4348746219327060782)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Make Required Assignment'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_app_builder_api.edit_page_item ( ',
'    p_page_id             => :P124_PAGE_ID, ',
'    p_item_name           => :P124_ITEM_NAME, ',
'    p_is_required         => true,',
'    p_label_template_id   => :P124_REQ_TEMPLATE_ID',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(628364991788098936)
,p_internal_uid=>4348746219327060782
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4348746711062060787)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Required Assignment'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_app_builder_api.edit_page_item ( ',
'    p_page_id             => :P124_PAGE_ID, ',
'    p_item_name           => :P124_ITEM_NAME, ',
'    p_is_required         => false,',
'    p_label_template_id   => :P124_OPT_TEMPLATE_ID',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(628365155382098936)
,p_internal_uid=>4348746711062060787
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(628369677509098970)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(628365155382098936)
,p_internal_uid=>628369677509098970
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(416112878523061583)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>416112878523061583
);
wwv_flow_imp.component_end;
end;
/
