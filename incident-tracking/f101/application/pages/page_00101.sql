prompt --application/pages/page_00101
begin
--   Manifest
--     PAGE: 00101
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
 p_id=>101
,p_name=>'Sign In Page'
,p_alias=>'LOGIN'
,p_step_title=>'Sign In | &APPLICATION_TITLE.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(1320028145732051434)
,p_step_template=>wwv_flow_imp.id(1609142962133051925)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4401190827084118227)
,p_plug_name=>'&P101_APP_NAME.'
,p_region_name=>'incident_tracking'
,p_icon_css_classes=>'app-incident-tracking'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609178666138051994)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3150915160568455042)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(4401190827084118227)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1334933250883373924)
,p_name=>'P101_APP_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(4401190827084118227)
,p_use_cache_before_default=>'NO'
,p_source=>'nvl(:APPLICATION_TITLE, :APP_NAME)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4401190928942118229)
,p_name=>'P101_USERNAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(4401190827084118227)
,p_prompt=>'Username'
,p_placeholder=>'username'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"></span>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>100
,p_field_template=>wwv_flow_imp.id(1609201949677052061)
,p_item_icon_css_classes=>'fa-user'
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
 p_id=>wwv_flow_imp.id(4401191022779118231)
,p_name=>'P101_PASSWORD'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(4401190827084118227)
,p_prompt=>'Password'
,p_placeholder=>'password'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"></span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>64
,p_cMaxlength=>100
,p_field_template=>wwv_flow_imp.id(1609201949677052061)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3270015948839499422)
,p_name=>'Set Focus'
,p_event_sequence=>10
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'( $v( "P101_USERNAME" ) === "" )'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3270016245972499423)
,p_event_id=>wwv_flow_imp.id(3270015948839499422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P101_USERNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3270016448844499423)
,p_event_id=>wwv_flow_imp.id(3270015948839499422)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P101_PASSWORD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4401191336942118233)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>4401191336942118233
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4401191217542118232)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P101_USERNAME,',
'    p_password => :P101_PASSWORD );'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>4401191217542118232
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4401191513134118234)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_internal_uid=>4401191513134118234
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4401191418094118234)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>4401191418094118234
);
wwv_flow_imp.component_end;
end;
/
