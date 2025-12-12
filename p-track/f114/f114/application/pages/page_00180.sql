prompt --application/pages/page_00180
begin
--   Manifest
--     PAGE: 00180
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
 p_id=>180
,p_name=>'Email Upcoming'
,p_page_mode=>'MODAL'
,p_step_title=>'Email Upcoming'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486086019073759)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11888600020324608728)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Email all users or a single user to notify them of action items and milestones that are due in the next 7 days.  Each user will get an email with their specific list of action items and milestones.</p>',
'<p><strong>Note:</strong> <em>This tool does not respect an end-user''s "Upcoming Milestones and Action Items Schedule" email preference setting (unless it was set to "Never (Opt-Out)", these users will not appear in the "Single User" user list even t'
||'hough they have upcoming milestones and/or action items). If a user''s "Upcoming Milestones and Action Items Schedule" email preference setting is set to any value, other than "Never (Opt-Out)", they will receive an upcoming deliverables email as soon'
||' as you click the <strong>Email</strong> button (above).</em></p>'))
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(417228801030456654)
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
 p_id=>wwv_flow_imp.id(11888548396631578673)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11888548810110578675)
,p_plug_name=>'Upcoming Milestones and Action Item Email Remider'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>30
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(17204380349106832133)
,p_name=>'No Upcoming MS or AI'
,p_template=>wwv_flow_imp.id(6672346928802369862)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null id,',
'    ''warning'' ALERT_TYPE,',
'    ''No Existing Upcoming Milestones or Action Items'' as ALERT_TITLE,',
'    ''There are currently no upcoming Milestones or Action Items defined in the '' || :APPLICATION_TITLE || '' application.'' as ALERT_DESC,',
'    '''' alert_action',
'from dual'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from (',
'    select action_owner_01 owner from eba_proj_status_ais',
'    union all',
'    select action_owner_02 owner from eba_proj_status_ais',
'    union all',
'    select action_owner_03 owner from eba_proj_status_ais',
'    union all',
'    select action_owner_04 owner from eba_proj_status_ais',
'    union all',
'    select u.username owner',
'    from eba_proj_status_users u',
'    where exists (  select null',
'                    from eba_proj_status_ais a,',
'                        eba_proj_user_ref rf',
'                    where rf.role_id = a.owner_role_id',
'                        and rf.project_id = a.project_id',
'                        and rf.user_id = u.id',
'    )',
') x',
'where x.owner is not null',
'    and exists (select null',
'                from eba_proj_status_ais$ a,',
'                    eba_proj_status$ p,',
'                    eba_proj_status_codes s',
'                where p.id = a.project_id',
'                    and p.project_status = s.id (+)',
'                    and p.is_deleted_yn = ''N''',
'                    and a.action_status = ''Open''',
'                    and a.due_date between sysdate and sysdate + 7',
'                    and ( a.action_owner_01 = x.owner',
'                        or a.action_owner_02 = x.owner',
'                        or a.action_owner_03 = x.owner',
'                        or a.action_owner_04 = x.owner',
'                        or exists ( select null',
'                                    from eba_proj_user_ref rf,',
'                                        eba_proj_status_users u',
'                                    where rf.role_id = a.owner_role_id',
'                                        and rf.project_id = a.project_id',
'                                        and rf.user_id = u.id',
'                                        and u.username = x.owner',
'                        )',
'                    )',
'                union all',
'                select null',
'                from eba_proj_status_ms$ m,',
'                    eba_proj_status$ p,',
'                    eba_proj_status_codes s',
'                where p.id = m.project_id',
'                    and p.project_status = s.id (+)',
'                    and m.milestone_status = ''Open''',
'                    and m.milestone_date between sysdate and sysdate + 7',
'                    and p.is_deleted_yn = ''N''',
'                    and ( m.milestone_owner = x.owner',
'                        or exists ( select null',
'                                    from eba_proj_user_ref rf,',
'                                        eba_proj_status_users u',
'                                    where rf.role_id = m.owner_role_id',
'                                        and rf.project_id = m.project_id',
'                                        and rf.user_id = u.id',
'                                        and u.username = x.owner',
'                        )',
'                    )',
'        )'))
,p_display_condition_type=>'NOT_EXISTS'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672361770805369896)
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17204380499018832134)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17204380600460832135)
,p_query_column_id=>2
,p_column_alias=>'ALERT_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Alert type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17204380714211832136)
,p_query_column_id=>3
,p_column_alias=>'ALERT_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Alert title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17204380741548832137)
,p_query_column_id=>4
,p_column_alias=>'ALERT_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Alert desc'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17204380889808832138)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ACTION'
,p_column_display_sequence=>5
,p_column_heading=>'Alert action'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11888550276936578692)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(417228801030456654)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11888550697190578696)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(417228801030456654)
,p_button_name=>'EMAIL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Email'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(11888553678471578719)
,p_branch_name=>'Back to Last View'
,p_branch_action=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11888549169351578675)
,p_name=>'P180_PAST_DUE_TARGET'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11888548810110578675)
,p_item_default=>'ALL'
,p_prompt=>'Past Due Target'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'EMAIL TARGET ALL OR USER'
,p_lov=>'.'||wwv_flow_imp.id(11876960261351330225)||'.'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from (',
'    select action_owner_01 owner from eba_proj_status_ais',
'    union all',
'    select action_owner_02 owner from eba_proj_status_ais',
'    union all',
'    select action_owner_03 owner from eba_proj_status_ais',
'    union all',
'    select action_owner_04 owner from eba_proj_status_ais',
'    union all',
'    select u.username owner',
'    from eba_proj_status_users u',
'    where exists (  select null',
'                    from eba_proj_status_ais a,',
'                        eba_proj_user_ref rf',
'                    where rf.role_id = a.owner_role_id',
'                        and rf.project_id = a.project_id',
'                        and rf.user_id = u.id',
'    )',
') x',
'where x.owner is not null',
'    and exists (select null',
'                from eba_proj_status_ais$ a,',
'                    eba_proj_status$ p,',
'                    eba_proj_status_codes s',
'                where p.id = a.project_id',
'                    and p.project_status = s.id (+)',
'                    and p.is_deleted_yn = ''N''',
'                    and a.action_status = ''Open''',
'                    and a.due_date between sysdate and sysdate + 7',
'                    and ( a.action_owner_01 = x.owner',
'                        or a.action_owner_02 = x.owner',
'                        or a.action_owner_03 = x.owner',
'                        or a.action_owner_04 = x.owner',
'                        or exists ( select null',
'                                    from eba_proj_user_ref rf,',
'                                        eba_proj_status_users u',
'                                    where rf.role_id = a.owner_role_id',
'                                        and rf.project_id = a.project_id',
'                                        and rf.user_id = u.id',
'                                        and u.username = x.owner',
'                        )',
'                    )',
'                union all',
'                select null',
'                from eba_proj_status_ms$ m,',
'                    eba_proj_status$ p,',
'                    eba_proj_status_codes s',
'                where p.id = m.project_id',
'                    and p.project_status = s.id (+)',
'                    and m.milestone_status = ''Open''',
'                    and m.milestone_date between sysdate and sysdate + 7',
'                    and p.is_deleted_yn = ''N''',
'                    and ( m.milestone_owner = x.owner',
'                        or exists ( select null',
'                                    from eba_proj_user_ref rf,',
'                                        eba_proj_status_users u',
'                                    where rf.role_id = m.owner_role_id',
'                                        and rf.project_id = m.project_id',
'                                        and rf.user_id = u.id',
'                                        and u.username = x.owner',
'                        )',
'                    )',
'        )'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11888549550260578683)
,p_name=>'P180_EMAIL_USER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11888548810110578675)
,p_prompt=>'Email User'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'OPT-IN USERS WITH UPCOMING DELIVERABLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct lower(x.owner) d, lower(x.owner) r',
'from (',
'    select  ais.action_owner_01 as owner, nvl(u.upcoming_reminders_freq,''DAILY'') as urs from eba_proj_status_ais ais, eba_proj_status_users u where upper(ais.action_owner_01) = u.username and ais.owner_role_id is null',
'    union all',
'    select ais.action_owner_02 as owner, nvl(u.upcoming_reminders_freq,''DAILY'') as urs from eba_proj_status_ais ais, eba_proj_status_users u where upper(ais.action_owner_02) = u.username and ais.owner_role_id is null',
'    union all',
'    select ais.action_owner_03 as owner, nvl(u.upcoming_reminders_freq,''DAILY'') as urs from eba_proj_status_ais ais, eba_proj_status_users u where upper(ais.action_owner_03) = u.username and ais.owner_role_id is null',
'    union all',
'    select ais.action_owner_04 as owner, nvl(u.upcoming_reminders_freq,''DAILY'') as urs  from eba_proj_status_ais ais, eba_proj_status_users u where upper(ais.action_owner_04) = u.username and ais.owner_role_id is null',
'    union all',
'    select u.username as owner, nvl(u.upcoming_reminders_freq,''DAILY'') as urs',
'      from eba_proj_status_users u',
'     where exists (  select null',
'                       from eba_proj_status_ais a,',
'                            eba_proj_user_ref rf',
'                      where rf.role_id = a.owner_role_id',
'                        and rf.project_id = a.project_id',
'                        and rf.user_id = u.id',
'    )',
') x',
'where x.owner is not null',
'  and x.urs != ''NEVER''',
'  and exists (select null',
'                from eba_proj_status_ais$ a,',
'                     eba_proj_status$ p,',
'                     eba_proj_status_codes s',
'               where p.id = a.project_id',
'                 and p.project_status = s.id (+)',
'                 and s.is_closed_status != ''Y''',
'                 and p.is_deleted_yn = ''N''',
'                 and a.action_status = ''Open''',
'                 and a.due_date between sysdate and sysdate + 7',
'                 and ( a.action_owner_01 = x.owner',
'                        or a.action_owner_02 = x.owner',
'                        or a.action_owner_03 = x.owner',
'                        or a.action_owner_04 = x.owner',
'                        or exists ( select null',
'                                    from eba_proj_user_ref rf,',
'                                        eba_proj_status_users u',
'                                    where rf.role_id = a.owner_role_id',
'                                        and rf.project_id = a.project_id',
'                                        and rf.user_id = u.id',
'                                        and u.username = x.owner',
'                        )',
'                    )',
'                union all',
'                select null',
'                from eba_proj_status_ms$ m,',
'                    eba_proj_status$ p,',
'                    eba_proj_status_codes s',
'                where p.id = m.project_id',
'                    and p.project_status = s.id (+)',
'                    and s.is_closed_status != ''Y''',
'                    and m.milestone_status = ''Open''',
'                    and m.milestone_date between sysdate and sysdate + 7',
'                    and p.is_deleted_yn = ''N''',
'                    and ( m.milestone_owner = x.owner',
'                        or exists ( select null',
'                                    from eba_proj_user_ref rf,',
'                                        eba_proj_status_users u',
'                                    where rf.role_id = m.owner_role_id',
'                                        and rf.project_id = m.project_id',
'                                        and rf.user_id = u.id',
'                                        and u.username = x.owner',
'                        )',
'                    )',
'        )',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(11888551195784578699)
,p_validation_name=>'P180_EMAIL_USER Not Null'
,p_validation_sequence=>10
,p_validation=>'P180_EMAIL_USER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Select the recipient''s email address from this list.'
,p_validation_condition=>'P180_PAST_DUE_TARGET'
,p_validation_condition2=>'USER'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(11888550697190578696)
,p_associated_item=>wwv_flow_imp.id(11888549550260578683)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11888552235155578706)
,p_name=>'hide show all users'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P180_PAST_DUE_TARGET'
,p_condition_element=>'P180_PAST_DUE_TARGET'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'USER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11888552788086578713)
,p_event_id=>wwv_flow_imp.id(11888552235155578706)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P180_EMAIL_USER'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11888553176934578716)
,p_event_id=>wwv_flow_imp.id(11888552235155578706)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P180_EMAIL_USER'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(417228805036456655)
,p_name=>'CNX'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11888550276936578692)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(417228979121456656)
,p_event_id=>wwv_flow_imp.id(417228805036456655)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11888551492278578701)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Email to All Users'
,p_process_sql_clob=>'eba_proj_stat_email.send_upcoming_emails(p_app_id => :APP_ID, p_method => ''ON_DEMAND'');'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11888550697190578696)
,p_process_when=>'P180_PAST_DUE_TARGET'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'ALL'
,p_process_success_message=>'Emails sent successfully.'
,p_internal_uid=>11888551492278578701
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11888551884183578704)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Email to Selected User'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_stat_email.send_upcoming_emails(',
'    p_app_id     => :APP_ID,',
'    p_user_email => :P180_EMAIL_USER,',
'    p_method     => ''ON_DEMAND''',
');'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11888550697190578696)
,p_process_when=>'P180_PAST_DUE_TARGET'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'USER'
,p_process_success_message=>'Email sent successfully.'
,p_internal_uid=>11888551884183578704
);
wwv_flow_imp.component_end;
end;
/
