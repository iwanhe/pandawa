prompt --application/pages/page_00020
begin
--   Manifest
--     PAGE: 00020
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
 p_id=>20
,p_name=>'Email Project'
,p_step_title=>'Email Project'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.complete { color : #009900 !important;  }',
'.late { color : #dd0000 !important;  }',
'.done { color : #000000 !important; }',
'#mmTable td, #aiTable td, #msTable td, #issTable td { font-size: 12px; }'))
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Select the type of email you want to send, who want to send it to and click the <strong>Send Email</strong> button to send the email. Click the <strong>Cancel</strong> button to return to the project details page. You can also optionally add carbon-c'
||'opied recipients and personalized message text.'
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7795324407214633810)
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
 p_id=>wwv_flow_imp.id(8904256928893573528)
,p_plug_name=>'Email'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow:t-Form--labelsAbove:t-Region--hideHeader'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_plug_new_grid_column=>false
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'<p>Send email with HTML attachment (see below).</p>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18296370900186442026)
,p_plug_name=>'Preview Project Status Email'
,p_region_name=>'previewStatus'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672353576565369876)
,p_plug_display_sequence=>15
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_email varchar2(255);',
'begin',
'    if instr(:APP_USER,''@'') > 0 then',
'        l_email := lower(:APP_USER);',
'    else',
'        select email_address into l_email from eba_proj_status_users where id = :CURRENT_USER_ID;',
'    end if;',
'    ',
'    eba_proj_stat_email.print_message (',
'        p_id          => :P20_ID, ',
'        p_app_id      => :APP_ID,',
'        p_email       => l_email,',
'        p_session     => :APP_SESSION,',
'        p_app_name    => :APPLICATION_TITLE || '': Status Report '' || to_char(sysdate, ''Month fmDD, YYYY''),',
'        p_reply_email => eba_proj_status_pref_api.get_email,',
'        p_email_type  => ''STATUS''',
'    );',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19058728439605337531)
,p_plug_name=>'Preview Project Details Email'
,p_region_name=>'previewSummary'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672353576565369876)
,p_plug_display_sequence=>25
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_email varchar2(255);',
'begin',
'    if instr(:APP_USER,''@'') > 0 then',
'        l_email := lower(:APP_USER);',
'    else',
'        select email_address into l_email from eba_proj_status_users where id = :CURRENT_USER_ID;',
'    end if;',
'    ',
'    eba_proj_stat_email.print_message (',
'        p_id          => :P20_ID, ',
'        p_app_id      => :APP_ID,',
'        p_email       => l_email,',
'        p_session     => :APP_SESSION,',
'        p_app_name    => :APPLICATION_TITLE,',
'        p_reply_email => eba_proj_status_pref_api.get_email,',
'        p_email_type  => ''SUMMARY''',
'    );',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8904257531448583646)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:2:P2_ID,P200_ID:&P20_ID.,&P20_ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8904257116557579334)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'SEND_EMAIL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Send Email'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8908931528042072720)
,p_branch_name=>'return to last view'
,p_branch_action=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 19-OCT-2010 16:28 by MIKE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8904255618410513692)
,p_name=>'P20_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8904256928893573528)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8904257845647587755)
,p_name=>'P20_TO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8904256928893573528)
,p_prompt=>'To'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>3
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Add a comma-separated list of your recipients'' email addresses here.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8904258039918587756)
,p_name=>'P20_FROM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8904256928893573528)
,p_prompt=>'From'
,p_source=>'lower(:APP_USER)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8904258237660587756)
,p_name=>'P20_CC'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8904256928893573528)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Cc'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'    case when u.email_address is not null then',
'            lower(u.email_address)',
'        when instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0 then',
'            lower(u.username)',
'    end as email',
'from eba_proj_status_users u,',
'    eba_proj_user_ref rf,',
'    eba_proj_roles r',
'where upper(u.username) != upper(:APP_USER)',
'    and ( u.email_address is not null',
'        or (instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0))',
'    and rf.project_id = :P20_ID',
'    and rf.user_id = u.id',
'    and rf.role_id = r.id',
'    and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'order by 1'))
,p_cSize=>80
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'match_type', 'CONTAINS_IGNORE',
  'max_values_in_list', '100')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8904258437542587756)
,p_name=>'P20_MESSAGE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8904256928893573528)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Message'
,p_source=>'replace(eba_proj_fw.get_preference_value( p_preference_name => ''EMAIL_MSG_BODY'' ), ''Preference does not exist'', null);'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Choose the type of email you would like to send ("Project Details" or "Project Status"), supply the email''s recipients (project members'' email addresses are pre-filled in the "To" text area but any other valid email addresses can be added here or in '
||'the "CC" text field), and click the <strong>Send Email</strong> button.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'Y',
  'resizable', 'N',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8904259218204598736)
,p_name=>'P20_SUBJECT'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8904256928893573528)
,p_prompt=>'Subject'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17064725674523828056)
,p_name=>'P20_RECIPIENT_OPTIONS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8904256928893573528)
,p_item_default=>'MEMBERS'
,p_prompt=>'Click to Populate Recipients'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'PROJECT DETAILS RECIPIENT OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(17204189208091748169)||'.'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '3',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18067129302265239741)
,p_name=>'P20_EMAIL_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8904256928893573528)
,p_item_default=>'nvl(:P20_EMAIL_TYPE,''STATUS'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Email Type'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'SUMMARY_OR_STATUS'
,p_lov=>'.'||wwv_flow_imp.id(18800283283728490867)||'.'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Choose the type of email you would like to send (Details or Status).</p>',
'<p>The "Project Details" Email sends a longer, more comprehensive summary of project details that have transpired over the last 90 days.</p>',
'<p>The "Project Status" Email sends a shorter, more concise summary of project details that have transpired over the last 7 days and the next (upcoming) 7 days.</p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18296371454377442032)
,p_name=>'P20_APP_TITLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8904256928893573528)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18296371702440442034)
,p_name=>'P20_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8904256928893573528)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(8908932144449086893)
,p_computation_sequence=>10
,p_computation_item=>'P20_FROM'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    case',
'        when instr(username,''@'') > 0 then',
'            lower(username)',
'        when instr(username,''@'') = 0 and instr(email_address,''@'') > 0 then',
'            lower(email_address)',
'        else',
'            trim(lower(substr(:P20_TO,1,instr(:P20_TO,'','') - 1)))',
'    end as email_address',
'from',
'    eba_proj_status_users',
'where',
'    upper(username) = :APP_USER;'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18296371570762442033)
,p_computation_sequence=>10
,p_computation_item=>'P20_APP_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>':APPLICATION_TITLE'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18296371801066442035)
,p_computation_sequence=>20
,p_computation_item=>'P20_PROJECT'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select project from eba_proj_status where id = :P20_ID;'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17064724356703828043)
,p_name=>'Add Members'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_ADD_MEMBERS'
,p_condition_element=>'P20_ADD_MEMBERS'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064724821517828048)
,p_event_id=>wwv_flow_imp.id(17064724356703828043)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P20_ADD_MEMBERS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064725225620828052)
,p_event_id=>wwv_flow_imp.id(17064724356703828043)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064724601045828045)
,p_event_id=>wwv_flow_imp.id(17064724356703828043)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Members',
'select listagg( x.email, '', '' )',
'    within group (order by x.email) email_addresses into :P20_TO',
'from (  -- Get all valid project members',
'        select distinct',
'            case when u.email_address is not null then',
'                    lower(u.email_address)',
'                when instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0 then',
'                    lower(u.username)',
'            end as email',
'        from eba_proj_status_users u,',
'            eba_proj_user_ref rf,',
'            eba_proj_roles r',
'        where upper(u.username) != upper(:APP_USER)',
'            and ( u.email_address is not null',
'                or (instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0))',
'            and instr(upper(:P20_TO),nvl(upper(u.email_address),upper(u.username))) = 0',
'            and rf.project_id = :P20_ID',
'            and rf.user_id = u.id',
'            and rf.role_id = r.id',
') x'))
,p_attribute_07=>'P20_ID,P20_TO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064725328651828053)
,p_event_id=>wwv_flow_imp.id(17064724356703828043)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064725092566828050)
,p_event_id=>wwv_flow_imp.id(17064724356703828043)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17064724629607828046)
,p_name=>'Add Followers'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_ADD_FOLLOWERS'
,p_condition_element=>'P20_ADD_FOLLOWERS'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064724916415828049)
,p_event_id=>wwv_flow_imp.id(17064724629607828046)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P20_ADD_FOLLOWERS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064725481114828054)
,p_event_id=>wwv_flow_imp.id(17064724629607828046)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064724789950828047)
,p_event_id=>wwv_flow_imp.id(17064724629607828046)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Followers',
'select listagg( x.email, '', '' )',
'    within group (order by x.email) email_addresses into :P20_TO',
'from (  -- Add any project followers (if this is an open project or it''s a restricted project and the follower has a super admin account)',
'        select distinct',
'            case when u.email_address is not null then',
'                    lower(u.email_address)',
'                when instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0 then',
'                    lower(u.username)',
'            end as email',
'        from eba_proj_status_users u,',
'            eba_proj_status_favorites f,',
'            eba_proj_status s',
'        where f.content_id = :P20_ID',
'            and s.id = f.content_id',
'            and upper(f.user_name) = upper(u.username)',
'            and ( u.email_address is not null',
'                or (instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0))',
'            and instr(upper(:P20_TO),nvl(upper(u.email_address),upper(u.username))) = 0',
'            and f.content_type = ''PROJECT''',
'            and (',
'                    s.acl_status_level = 1 --OPEN',
'                    or',
'                    (',
'                        s.acl_status_level > 1 -- RESTRICTED',
'                        and',
'                        u.access_level_id = 4 -- USER is a Super Admin',
'',
'                    )',
'                )',
'',
') x'))
,p_attribute_07=>'P20_ID,P20_TO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064725565893828055)
,p_event_id=>wwv_flow_imp.id(17064724629607828046)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064725203162828051)
,p_event_id=>wwv_flow_imp.id(17064724629607828046)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17064725735216828057)
,p_name=>'Both'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_RECIPIENT_OPTIONS'
,p_condition_element=>'P20_RECIPIENT_OPTIONS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'BOTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17204378485319832114)
,p_event_id=>wwv_flow_imp.id(17064725735216828057)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064735883971828058)
,p_event_id=>wwv_flow_imp.id(17064725735216828057)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Both',
'select listagg( x.email, '', '' )',
'    within group (order by x.email) email_addresses',
'from (  -- Get all valid project members',
'        select distinct',
'            case when u.email_address is not null then',
'                    lower(u.email_address)',
'                when instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0 then',
'                    lower(u.username)',
'            end as email',
'        from eba_proj_status_users u,',
'            eba_proj_user_ref rf,',
'            eba_proj_roles r',
'        where ( u.email_address is not null',
'                or (instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0))',
'            and rf.project_id = :P20_ID',
'            and rf.user_id = u.id',
'            and rf.role_id = r.id',
'        union',
'        -- Add any project followers (if this is an open project or it''s a restricted project and the follower has a super admin account)',
'        select distinct',
'            case when u.email_address is not null then',
'                    lower(u.email_address)',
'                when instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0 then',
'                    lower(u.username)',
'            end as email',
'        from eba_proj_status_users u,',
'            eba_proj_status_favorites f,',
'            eba_proj_status s',
'        where f.content_id = :P20_ID',
'            and s.id = f.content_id',
'            and upper(f.user_name) = upper(u.username)',
'            and ( u.email_address is not null',
'                or (instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0))',
'            and f.content_type = ''PROJECT''',
'            and (',
'                    s.acl_status_level = 1 --OPEN',
'                    or',
'                    (',
'                        s.acl_status_level > 1 -- RESTRICTED',
'                        and',
'                        u.access_level_id = 4 -- USER is a Super Admin',
'',
'                    )',
'                )',
') x'))
,p_attribute_07=>'P20_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17064735995548828059)
,p_name=>'Members Only'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_RECIPIENT_OPTIONS'
,p_condition_element=>'P20_RECIPIENT_OPTIONS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'MEMBERS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17204378574340832115)
,p_event_id=>wwv_flow_imp.id(17064735995548828059)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064736039935828060)
,p_event_id=>wwv_flow_imp.id(17064735995548828059)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Members',
'select listagg( x.email, '', '' )',
'    within group (order by x.email) email_addresses',
'from (  -- Get all valid project members',
'        select distinct',
'            case when u.email_address is not null then',
'                    lower(u.email_address)',
'                when instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0 then',
'                    lower(u.username)',
'            end as email',
'        from eba_proj_status_users u,',
'            eba_proj_user_ref rf,',
'            eba_proj_roles r',
'        where ( u.email_address is not null',
'                or (instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0))',
'            and rf.project_id = :P20_ID',
'            and rf.user_id = u.id',
'            and rf.role_id = r.id',
') x'))
,p_attribute_07=>'P20_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17064736197014828061)
,p_name=>'Followers Only'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_RECIPIENT_OPTIONS'
,p_condition_element=>'P20_RECIPIENT_OPTIONS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'FOLLOWERS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17204378670712832116)
,p_event_id=>wwv_flow_imp.id(17064736197014828061)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17064736314523828062)
,p_event_id=>wwv_flow_imp.id(17064736197014828061)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_TO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Followers',
'select listagg( x.email, '', '' )',
'    within group (order by x.email) email_addresses',
'from (  -- Add any project followers (if this is an open project or it''s a restricted project and the follower has a super admin account)',
'        select distinct',
'            case when u.email_address is not null then',
'                    lower(u.email_address)',
'                when instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0 then',
'                    lower(u.username)',
'            end as email',
'        from eba_proj_status_users u,',
'            eba_proj_status_favorites f,',
'            eba_proj_status s',
'        where f.content_id = :P20_ID',
'            and s.id = f.content_id',
'            and upper(f.user_name) = upper(u.username)',
'            and ( u.email_address is not null',
'                or (instr(u.username,''@'') > 0 and instr(u.username,''.'') > 0))',
'            and f.content_type = ''PROJECT''',
'            and (',
'                    s.acl_status_level = 1 --OPEN',
'                    or',
'                    (',
'                        s.acl_status_level > 1 -- RESTRICTED',
'                        and',
'                        u.access_level_id = 4 -- USER is a Super Admin',
'',
'                    )',
'                )',
') x'))
,p_attribute_07=>'P20_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18067129397127239742)
,p_name=>'Refresh Preview'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_EMAIL_TYPE'
,p_condition_element=>'P20_EMAIL_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'STATUS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18296371298030442030)
,p_event_id=>wwv_flow_imp.id(18067129397127239742)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P20_ID,P20_APP_TITLE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18296371382057442031)
,p_event_id=>wwv_flow_imp.id(18067129397127239742)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P20_ID,P20_APP_TITLE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19058726858133337515)
,p_event_id=>wwv_flow_imp.id(18067129397127239742)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_SUBJECT'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select :P20_APP_TITLE || '': '' || :P20_PROJECT || '' Status Report '' || to_char(sysdate,''fmDD-Mon-YYYY'') from eba_proj_status where id = :P20_ID'
,p_attribute_07=>'P20_ID,P20_APP_TITLE,P20_PROJECT'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19058728775327337534)
,p_event_id=>wwv_flow_imp.id(18067129397127239742)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_SUBJECT'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select :P20_APP_TITLE || '': '' || :P20_PROJECT from eba_proj_status where id = :P20_ID'
,p_attribute_07=>'P20_ID,P20_APP_TITLE,P20_PROJECT'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18296371059353442028)
,p_event_id=>wwv_flow_imp.id(18067129397127239742)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''div#previewSummary'').hide();',
'$(''div#previewStatus'').show();',
'',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18296371183054442029)
,p_event_id=>wwv_flow_imp.id(18067129397127239742)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''div#previewStatus'').hide();',
'$(''div#previewSummary'').show();'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8909189533573065598)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'send email'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_clob          clob;',
'   l_body          clob := '' '';',
'   l_message       varchar2(4000);',
'   l_from_address  varchar2(255);',
'   l_email         varchar2(255);',
'begin',
'    if instr(:APP_USER,''@'') > 0 then',
'        l_email := lower(:APP_USER);',
'    else',
'        select email_address into l_email from eba_proj_status_users where id = :CURRENT_USER_ID;',
'    end if;',
'    ',
'    if :P20_EMAIL_TYPE = ''SUMMARY'' then',
'        eba_proj_stat_email.print_message (',
'            p_id          => :P20_ID, ',
'            p_app_id      => :APP_ID,',
'            p_email       => l_email,',
'            p_session     => :APP_SESSION,',
'            p_app_name    => :APPLICATION_TITLE,',
'            p_reply_email => eba_proj_status_pref_api.get_email,',
'            p_email_type  => :P20_EMAIL_TYPE ',
'        );',
'    else',
'        eba_proj_stat_email.print_message (',
'            p_id          => :P20_ID, ',
'            p_app_id      => :APP_ID,',
'            p_email       => l_email,',
'            p_session     => :APP_SESSION,',
'            p_app_name    => :APPLICATION_TITLE || '': Status Report '' || to_char(sysdate, ''Month fmDD, YYYY''),',
'            p_reply_email => eba_proj_status_pref_api.get_email,',
'            p_email_type  => :P20_EMAIL_TYPE ',
'        );',
'    end if;',
'',
'    for c1 in (select clob001 from apex_collections where collection_name = ''EMAIL'')',
'    loop',
'        l_clob := c1.clob001;',
'        ',
'        if :P20_MESSAGE is not null then',
'            l_clob := replace(l_clob, ''<!-- Content Wrapper -->'', ''<center><div style="padding: 8px; color: #404040; font-size: 14px; line-height: 20px; border-top: 2px solid #D0D0D0; border-bottom: 2px solid #D0D0D0; margin-bottom: 8px; padding-bott'
||'om: 8px;">''||:P20_MESSAGE||''</div></center>'');',
'        end if;',
'',
'        l_from_address := :P20_FROM;',
'',
'        if l_from_address is not null and instr(:P20_TO,''@'') > 0 then',
'            APEX_MAIL.SEND(',
'                p_to => :P20_TO,',
'                p_from => l_from_address,',
'                p_body => l_body,',
'                p_body_html => l_clob,',
'                p_subj => :P20_SUBJECT,',
'                p_cc  => :P20_CC,',
'                p_bcc   => null,',
'                p_replyto => null);',
'',
'            apex_mail.push_queue;',
'',
'            eba_proj_stat_email.log_sent_email',
'            (',
'                p_email_to   => :P20_TO,',
'                p_email_from => :P20_FROM,',
'                p_body_size  => dbms_lob.getlength(l_clob),',
'                p_type       => ''PROJECT_'' || :P20_EMAIL_TYPE,',
'                p_project_id => :P20_ID',
'            );',
'        end if;',
'    end loop;',
'    commit;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_success_message=>'Message sent'
,p_internal_uid=>8909189533573065598
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8927132428723275623)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'log email request'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_email_first_to varchar2(255) := null;',
'begin',
'    if instr(:P20_TO,'','') > 2 then',
'       l_email_first_to := substr(l_email_first_to,1,instr(:P20_TO,'','') - 1);',
'    else',
'       l_email_first_to := :P20_TO;',
'    end if;',
'',
'    insert into eba_proj_status_email_log (',
'        email_first_to,',
'        email_to,',
'        email_from,',
'        body_size )',
'    values (',
'         trim(l_email_first_to),',
'         trim(:P20_TO),',
'         trim(:P20_FROM),',
'         length(:P20_MESSAGE) );',
'    commit;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8927132428723275623
);
wwv_flow_imp.component_end;
end;
/
