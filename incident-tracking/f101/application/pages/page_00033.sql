prompt --application/pages/page_00033
begin
--   Manifest
--     PAGE: 00033
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
 p_id=>33
,p_name=>'Access Control Configuration'
,p_page_mode=>'MODAL'
,p_step_title=>'Access Control Configuration'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(3204234467922058482)
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(971924804110146935)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169348961051977)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2856629242844058227)
,p_plug_name=>'Access Control Configuration'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(326728112170330042)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(971924804110146935)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(326727741337330041)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(971924804110146935)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(326737920561330056)
,p_branch_name=>'Back to Admin'
,p_branch_action=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326728847716330042)
,p_name=>'P33_AC_ENABLED'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2856629242844058227)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Any authenticated user may access this application'
,p_source=>'return eba_intrack_fw.get_preference_value(''ACCESS_CONTROL_ENABLED'');'
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(290774750801242035)
,p_item_template_options=>'#DEFAULT#'
,p_inline_help_text=>'Choose <strong>No</strong> if all users are defined in the access control list. Choose <strong>Yes</strong> if authenticated users not in the access control list may also use this application.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326729233823330043)
,p_name=>'P33_ACCESS_CONTROL_SCOPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2856629242844058227)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Treat authenticated users not in ACL as'
,p_source=>'eba_intrack_fw.get_preference_value(''ACCESS_CONTROL_SCOPE'');'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'ACCESS CONTROL SCOPE1'
,p_lov=>'.'||wwv_flow_imp.id(326738208632330061)||'.'
,p_field_template=>wwv_flow_imp.id(290774750801242035)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'YES'
,p_inline_help_text=>'This option determines the role of users that are not defined in the Access Control List (ACL).  A user with <strong>Reader</strong> role can only read application data. A user with <strong>Contributor</strong> role can read <strong>and write</strong'
||'> application data.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326729560523330043)
,p_name=>'P33_USERNAME_FORMAT'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(2856629242844058227)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Use Email for Usernames'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (eba_intrack_fw.get_preference_value(''USERNAME_FORMAT'') = ''EMAIL'') then ',
'  return ''Y'';',
'else',
'  return ''N'';',
'end if;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(290774750801242035)
,p_item_template_options=>'#DEFAULT#'
,p_inline_help_text=>'This option determines whether to use email addresses as the username format for users in the Access Control List (ACL).  This is useful when using Single Sign-On or LDAP authentication.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326730014054330044)
,p_name=>'P33_HIDDEN_AC_ENABLED'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2856629242844058227)
,p_use_cache_before_default=>'NO'
,p_source=>'return eba_intrack_fw.get_preference_value(''ACCESS_CONTROL_ENABLED'');'
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(326732312931330052)
,p_name=>'ENABLE ACCESS CONTROL CHANGED'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P33_AC_ENABLED'
,p_condition_element=>'P33_AC_ENABLED'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(326732768829330053)
,p_event_id=>wwv_flow_imp.id(326732312931330052)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P33_ACCESS_CONTROL_SCOPE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(326733346397330053)
,p_event_id=>wwv_flow_imp.id(326732312931330052)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P33_ACCESS_CONTROL_SCOPE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(326734596203330054)
,p_name=>'APPLY CHANGES WHEN AC ENABLED'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(326728112170330042)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'($v(''P33_HIDDEN_AC_ENABLED'') !== $v(''P33_AC_ENABLED'') &&',
' $v(''P33_AC_ENABLED'') === ''Y'')'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(326735137649330054)
,p_event_id=>wwv_flow_imp.id(326734596203330054)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'APPLY_CHANGES_AC_ENABLED'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(326735464248330055)
,p_name=>'APPLY CHANGES WHEN AC DISABLED'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(326728112170330042)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'($v(''P33_HIDDEN_AC_ENABLED'') !== $v(''P33_AC_ENABLED'') &&',
' $v(''P33_AC_ENABLED'') === ''N'')'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(326735991690330055)
,p_event_id=>wwv_flow_imp.id(326735464248330055)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Disabling Access Control means that all application features are available to any user who can authenticate. Are you sure you want to disable Access Control?'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(326736468683330055)
,p_event_id=>wwv_flow_imp.id(326735464248330055)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'APPLY_CHANGES_AC_DISABLED'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(326736880371330055)
,p_name=>'APPLY CHANGES WHEN AC UNCHANGED'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(326728112170330042)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'($v(''P33_HIDDEN_AC_ENABLED'') === $v(''P33_AC_ENABLED''))'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(326737362625330055)
,p_event_id=>wwv_flow_imp.id(326736880371330055)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'APPLY_CHANGES_AC_UNCHANGED'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(326733713301330053)
,p_name=>'Cancel Dialog'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(326727741337330041)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(326734246041330054)
,p_event_id=>wwv_flow_imp.id(326733713301330053)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(326731079314330050)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ACCESS CONTROL ENABLED'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_intrack_fw.set_preference_value (',
'        p_preference_name  => ''ACCESS_CONTROL_ENABLED'',',
'        p_preference_value => :P33_AC_ENABLED);',
'    eba_intrack_fw.set_preference_value (',
'        p_preference_name  => ''ACCESS_CONTROL_SCOPE'',',
'        p_preference_value => (case ',
'                                   when :P33_AC_ENABLED = ''Y'' then :P33_ACCESS_CONTROL_SCOPE',
'                                   else ''ACL_ONLY'' ',
'                               end) );',
'',
'    -- Seed user table with current user as an administrator or set the current user as administrator',
'    declare',
'       l_count number;',
'    begin',
'        select count(*) ',
'            into l_count ',
'        from eba_intrack_users',
'        where username = :APP_USER;',
'        if l_count = 0 then',
'            insert into eba_intrack_users(username, access_level_id) values (:APP_USER, 3);   ',
'        else',
'            update eba_intrack_users',
'            set access_level_id = 3',
'            where username = :APP_USER;',
'        end if;',
'    end;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error trying to enable Access Control.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'APPLY_CHANGES_AC_ENABLED'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Access Control enabled. Access to the application and its features are defined by an administrator in the <a href="f?p=&APP_ID.:MANAGE_ACL:&APP_SESSION.:::RP::">Access Control List</a>.'
,p_internal_uid=>326731079314330050
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(326731517119330051)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ACCESS CONTROL DISABLED'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_intrack_fw.set_preference_value (',
'        p_preference_name  => ''ACCESS_CONTROL_ENABLED'',',
'        p_preference_value => :P33_AC_ENABLED);',
'    eba_intrack_fw.set_preference_value (',
'        p_preference_name  => ''ACCESS_CONTROL_SCOPE'',',
'        p_preference_value => (case ',
'                                   when :P33_AC_ENABLED = ''Y'' then :P33_ACCESS_CONTROL_SCOPE',
'                                   else ''ACL_ONLY'' ',
'                               end) );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error trying to disable Access Control.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'APPLY_CHANGES_AC_DISABLED'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Access Control disabled. All application features are now available to any user who can authenticate.'
,p_internal_uid=>326731517119330051
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(326731868237330051)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ACCESS CONTROL UNCHANGED'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_intrack_fw.set_preference_value (',
'        p_preference_name  => ''ACCESS_CONTROL_ENABLED'',',
'        p_preference_value => :P33_AC_ENABLED);',
'    eba_intrack_fw.set_preference_value (',
'        p_preference_name  => ''ACCESS_CONTROL_SCOPE'',',
'        p_preference_value => (case ',
'                                   when :P33_AC_ENABLED = ''Y'' then :P33_ACCESS_CONTROL_SCOPE',
'                                   else ''ACL_ONLY'' ',
'                               end) );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error trying to save Access Control Configuration.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'APPLY_CHANGES_AC_UNCHANGED'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Access Control Configuration saved.'
,p_internal_uid=>326731868237330051
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(326730732149330050)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Format'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_intrack_fw.set_preference_value (',
'    p_preference_name  => ''USERNAME_FORMAT'',',
'    p_preference_value => case nvl(:P33_USERNAME_FORMAT,''N'') ',
'                            when ''Y'' then ''EMAIL''',
'                            when ''N'' then ''STRING'' ',
'                          end);'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>326730732149330050
);
wwv_flow_imp.component_end;
end;
/
