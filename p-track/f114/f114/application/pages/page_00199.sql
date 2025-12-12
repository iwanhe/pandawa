prompt --application/pages/page_00199
begin
--   Manifest
--     PAGE: 00199
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
 p_id=>199
,p_name=>'Email Preferences'
,p_page_mode=>'MODAL'
,p_step_title=>'Email Preferences'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5849761210133065838)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1789200966449898950)
,p_plug_name=>'About this page'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>'<p>Select the frequency in which you would prefer to receive &APPLICATION_TITLE. automated emails.<br><br></p> '
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15358155921474283836)
,p_plug_name=>'Milestones and Action Items Emails (Past Due and Upcoming)'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15358156421001283841)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18808041999685757062)
,p_plug_name=>'Project Status Emails'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_required_patch=>wwv_flow_imp.id(18524168470145109483)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18808042071100757063)
,p_plug_name=>'Project Details Email'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_required_patch=>wwv_flow_imp.id(15764621210683200192)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15358156881105283845)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(15358156421001283841)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15358156532712283842)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(15358156421001283841)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15358156078647283837)
,p_name=>'P199_PAST_DUE_FREQ'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(15358155921474283836)
,p_use_cache_before_default=>'NO'
,p_item_default=>'DAILY'
,p_prompt=>'Past Due Milestones and Action Items Schedule'
,p_post_element_text=>'<br><em>&P199_PAST_DUE_POST_TEXT.</em>'
,p_source=>'PAST_DUE_REMINDERS_FREQ'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'EMAIL SCHEDULE OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(16037919235537104348)||'.'
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(11876370140123189618)
,p_help_text=>'Select the frequency in which you would like to receive the automated past due milestone and action item emails. Emails are only sent when the database job is enabled and on the following days: &P199_WORKDAY_SCHEDULE.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15358156126244283838)
,p_name=>'P199_UPCOMING_FREQ'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(15358155921474283836)
,p_use_cache_before_default=>'NO'
,p_item_default=>'WEEKLY'
,p_prompt=>'Upcoming Milestones and Action Items Schedule'
,p_post_element_text=>'<br><em>&P199_UPCOMING_POST_TEXT.</em>'
,p_source=>'UPCOMING_REMINDERS_FREQ'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'EMAIL SCHEDULE OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(16037919235537104348)||'.'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(11888600020324608728)
,p_help_text=>'Select the frequency in which you would like to receive the automated upcoming milestone and action item emails. Emails are only sent when the database job is enabled and on the following days: &P199_WORKDAY_SCHEDULE.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15358156311886283839)
,p_name=>'P199_PROJECT_SUMMARY_FREQ'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(18808042071100757063)
,p_use_cache_before_default=>'NO'
,p_item_default=>'MONTHLY'
,p_prompt=>'Schedule'
,p_post_element_text=>'<br><em>&P199_PROJECT_SUMMARY_POST_TEXT.</em>'
,p_source=>'PROJECT_SUMMARY_FAV_FREQ'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'EMAIL SCHEDULE OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(16037919235537104348)||'.'
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(15764621210683200192)
,p_help_text=>'Select the frequency in which you would like to receive the automated project details emails. Emails are only sent when the database job is enabled and on the following days: &P199_WORKDAY_SCHEDULE.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16890198109806955518)
,p_name=>'P199_WORKDAY_SCHEDULE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(15358155921474283836)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17204381955673832149)
,p_name=>'P199_SUMMARY_SCOPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(18808042071100757063)
,p_use_cache_before_default=>'NO'
,p_item_default=>'BOTH'
,p_prompt=>'Scope'
,p_source=>'PROJECT_SUMMARY_FAV_SCOPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'PROJECT DETAILS SCOPE OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(17470115273394938265)||'.'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(15764621210683200192)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Define the scope of the project details emails you receive. The details of these choices are listed below:</p>',
'<ul>',
'    <li><strong>All Projects</strong> - All open, accessible projects in the application.</li>',
'    <li><strong>Projects I''m Following</strong> - All open, accessible projects that you''re currently following.</li>',
'    <li><strong>Projects I''m a Member Of</strong> - All open, accessible projects where you are a member.</li>',
'    <li><strong>Projects I''m a Member Of and I''m Following</strong> - All open, accessible projects where you are a member combined with all of the open, accessible projects that you''re currently following.</li>',
'</ul>',
''))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17526767446018169950)
,p_name=>'P199_PAST_DUE_JOB_STATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(15358155921474283836)
,p_display_as=>'NATIVE_HIDDEN'
,p_required_patch=>wwv_flow_imp.id(11876370140123189618)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17526767532401169951)
,p_name=>'P199_UPCOMING_JOB_STATUS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(15358155921474283836)
,p_display_as=>'NATIVE_HIDDEN'
,p_required_patch=>wwv_flow_imp.id(11888600020324608728)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17526767643860169952)
,p_name=>'P199_PROJECT_SUMMARY_JOB_STATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(18808042071100757063)
,p_display_as=>'NATIVE_HIDDEN'
,p_required_patch=>wwv_flow_imp.id(15764621210683200192)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17526768345749169959)
,p_name=>'P199_PAST_DUE_POST_TEXT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(15358155921474283836)
,p_source=>'The process that sends these emails is currently &P199_PAST_DUE_JOB_STATUS.. Please contact your application administrator to enable the sending of these emails.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P199_PAST_DUE_JOB_STATUS'
,p_display_when2=>'Disabled'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_required_patch=>wwv_flow_imp.id(11876370140123189618)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17526768487001169960)
,p_name=>'P199_UPCOMING_POST_TEXT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(15358155921474283836)
,p_source=>'The process that sends these emails is currently &P199_UPCOMING_JOB_STATUS.. Please contact your application administrator to enable the sending of these emails.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P199_UPCOMING_JOB_STATUS'
,p_display_when2=>'Disabled'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_required_patch=>wwv_flow_imp.id(11876370140123189618)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17526768577185169961)
,p_name=>'P199_PROJECT_SUMMARY_POST_TEXT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(18808042071100757063)
,p_source=>'The process that sends these emails is currently &P199_PROJECT_SUMMARY_JOB_STATUS.. Please contact your application administrator to enable the sending of these emails.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P199_PROJECT_SUMMARY_JOB_STATUS'
,p_display_when2=>'Disabled'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_required_patch=>wwv_flow_imp.id(11876370140123189618)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18296369801806442015)
,p_name=>'P199_PROJECT_STATUS_FREQ'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(18808041999685757062)
,p_use_cache_before_default=>'NO'
,p_item_default=>'MONTHLY'
,p_prompt=>'Schedule'
,p_post_element_text=>'<br><em>&P199_PROJECT_STATUS_POST_TEXT.</em>'
,p_source=>'PROJECT_STATUS_FAV_FREQ'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'EMAIL SCHEDULE OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(16037919235537104348)||'.'
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(18524168470145109483)
,p_help_text=>'Select the frequency in which you would like to receive the automated project status emails. Emails are only sent when the database job is enabled and on the following days: &P199_WORKDAY_SCHEDULE.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18296369849490442016)
,p_name=>'P199_STATUS_SCOPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(18808041999685757062)
,p_use_cache_before_default=>'NO'
,p_item_default=>'BOTH'
,p_prompt=>'Scope'
,p_source=>'PROJECT_STATUS_FAV_SCOPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'PROJECT DETAILS SCOPE OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(17470115273394938265)||'.'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(18524168470145109483)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Define the scope of the project status emails you receive. The details of these choices are listed below:</p>',
'<ul>',
'    <li><strong>All Projects</strong> - All open, accessible projects in the application.</li>',
'    <li><strong>Projects I''m Following</strong> - All open, accessible projects that you''re currently following.</li>',
'    <li><strong>Projects I''m a Member Of</strong> - All open, accessible projects where you are a member.</li>',
'    <li><strong>Projects I''m a Member Of and I''m Following</strong> - All open, accessible projects where you are a member combined with all of the open, accessible projects that you''re currently following.</li>',
'</ul>',
''))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18296370477782442022)
,p_name=>'P199_PROJECT_STATUS_JOB_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(18808041999685757062)
,p_display_as=>'NATIVE_HIDDEN'
,p_required_patch=>wwv_flow_imp.id(18524168470145109483)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18296370610395442023)
,p_name=>'P199_PROJECT_STATUS_POST_TEXT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(18808041999685757062)
,p_source=>'The process that sends these emails is currently &P199_PROJECT_STATUS_JOB_STATUS.. Please contact your application administrator to enable the sending of these emails.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P199_PROJECT_STATUS_JOB_STATUS'
,p_display_when2=>'Disabled'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_required_patch=>wwv_flow_imp.id(18524168470145109483)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(17526767718530169953)
,p_computation_sequence=>10
,p_computation_item=>'P199_PAST_DUE_JOB_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    case when enabled = ''TRUE'' then ''Enabled'' else ''Disabled'' end as status',
'from user_scheduler_jobs',
'where job_name = ''EBA_PROJ_EMAIL_PAST_DUE_JOB'''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(17526767904865169954)
,p_computation_sequence=>20
,p_computation_item=>'P199_UPCOMING_JOB_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    case when enabled = ''TRUE'' then ''Enabled'' else ''Disabled'' end as status',
'from user_scheduler_jobs',
'where job_name = ''EBA_PROJ_EMAIL_UPCOMING_JOB'''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(17526767993874169955)
,p_computation_sequence=>30
,p_computation_item=>'P199_PROJECT_SUMMARY_JOB_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    case when enabled = ''TRUE'' then ''Enabled'' else ''Disabled'' end as status',
'from user_scheduler_jobs',
'where job_name = ''EBA_PROJ_EMAIL_SUMMARY_JOB'''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18296370740179442025)
,p_computation_sequence=>40
,p_computation_item=>'P199_PROJECT_STATUS_JOB_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    case when enabled = ''TRUE'' then ''Enabled'' else ''Disabled'' end as status',
'from user_scheduler_jobs',
'where job_name = ''EBA_PROJ_EMAIL_STATUS_JOB'''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(16890198178982955519)
,p_computation_sequence=>10
,p_computation_item=>'P199_WORKDAY_SCHEDULE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'replace(replace(replace(replace(replace(replace(replace(replace(replace(eba_proj_fw.get_preference_value(''WORKDAYS''),'':'','',''),''1'',''Sunday''),''2'',''Monday''),''3'',''Tuesday''),''4'',''Wednesday''),''5'',''Thursday''),''6'',''Friday''),''7'',''Saturday''),'','','', '')'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15358156670009283843)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(15358156532712283842)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15358156812254283844)
,p_event_id=>wwv_flow_imp.id(15358156670009283843)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17204382082049832150)
,p_name=>'Show/Hide Scope'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_PROJECT_SUMMARY_FREQ'
,p_condition_element=>'P199_PROJECT_SUMMARY_FREQ'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'NEVER,UNSET'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17204382324984832153)
,p_event_id=>wwv_flow_imp.id(17204382082049832150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P199_PROJECT_SUMMARY_FREQ'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17204382435421832154)
,p_event_id=>wwv_flow_imp.id(17204382082049832150)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P199_PROJECT_SUMMARY_FREQ'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17204382150771832151)
,p_event_id=>wwv_flow_imp.id(17204382082049832150)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMMARY_SCOPE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17204382247095832152)
,p_event_id=>wwv_flow_imp.id(17204382082049832150)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMMARY_SCOPE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18296369992936442017)
,p_name=>'Show/Hide Status Scope'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_PROJECT_STATUS_FREQ'
,p_condition_element=>'P199_PROJECT_STATUS_FREQ'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'NEVER,UNSET'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18296370246111442020)
,p_event_id=>wwv_flow_imp.id(18296369992936442017)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P199_PROJECT_STATUS_FREQ'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18296370415409442021)
,p_event_id=>wwv_flow_imp.id(18296369992936442017)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P199_PROJECT_STATUS_FREQ'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18296370023090442018)
,p_event_id=>wwv_flow_imp.id(18296369992936442017)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_STATUS_SCOPE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18296370116257442019)
,p_event_id=>wwv_flow_imp.id(18296369992936442017)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_STATUS_SCOPE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(16951547362850927348)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Automatic Row Processing'
,p_attribute_02=>'EBA_PROJ_STATUS_USERS'
,p_attribute_03=>'CURRENT_USER_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>16951547362850927348
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15358156971432283846)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Your email preferences were updated successfully.'
,p_internal_uid=>15358156971432283846
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(16951547299029927347)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Automatic Row Fetch EBA_PROJ_STATUS_USERS'
,p_attribute_02=>'EBA_PROJ_STATUS_USERS'
,p_attribute_03=>'CURRENT_USER_ID'
,p_attribute_04=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>16951547299029927347
);
wwv_flow_imp.component_end;
end;
/
