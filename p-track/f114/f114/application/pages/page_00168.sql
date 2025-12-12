prompt --application/pages/page_00168
begin
--   Manifest
--     PAGE: 00168
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
 p_id=>168
,p_name=>'Configure Email Send Job'
,p_page_mode=>'MODAL'
,p_step_title=>'Configure Email Send Job'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486086019073759)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11984740252956930014)
,p_plug_name=>'Enable Email Send Job'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11984740981825930021)
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
 p_id=>wwv_flow_imp.id(11984741109930930022)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11984740981825930021)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11984741323836930025)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11984740981825930021)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11984740410981930015)
,p_name=>'P168_JOB_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11984740252956930014)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11984740439314930016)
,p_name=>'P168_JOB_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11984740252956930014)
,p_item_default=>'DAILY'
,p_prompt=>'Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ENABLED OR DISABLED'
,p_lov=>'.'||wwv_flow_imp.id(11984963079421995979)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(639523678332439146)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11984740685903930018)
,p_name=>'P168_JOB'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11984740252956930014)
,p_prompt=>'Job'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15094703252417031451)
,p_name=>'P168_INTERVAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11984740252956930014)
,p_item_default=>'DAILY'
,p_prompt=>'Email Send Schedule'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(639523678332439146)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(11984740901076930020)
,p_computation_sequence=>20
,p_computation_item=>'P168_JOB'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select initcap(replace(replace(replace(job_name, ''EBA_PROJ_'', null), ''_JOB'', ''_DELIVERABLES_JOB''), ''_'', '' '')) from user_scheduler_jobs where job_name = :P168_JOB_NAME'
,p_compute_when=>'P168_JOB_NAME'
,p_compute_when_text=>'EBA_PROJ_EMAIL_SUMMARY_JOB, EBA_PROJ_EMAIL_STATUS_JOB'
,p_compute_when_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(15094703015604031449)
,p_computation_sequence=>30
,p_computation_item=>'P168_JOB'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select ''Email '' || initcap(replace(replace(job_name, ''EBA_PROJ_EMAIL_'', ''Project ''), ''_'', '' '')) from user_scheduler_jobs where job_name = :P168_JOB_NAME'
,p_compute_when=>'P168_JOB_NAME'
,p_compute_when_text=>'EBA_PROJ_EMAIL_SUMMARY_JOB, EBA_PROJ_EMAIL_STATUS_JOB'
,p_compute_when_type=>'VALUE_OF_ITEM_IN_CONDITION_NOT_IN_COLON_DELIMITED_LIST'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(16951547165924927346)
,p_computation_sequence=>40
,p_computation_item=>'P168_INTERVAL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    case',
'        when repeat_interval = ''freq=monthly; bymonth=1,4,7,10; byday=1mon; byhour=8; byminute=0; bysecond=0;'' then',
'            ''Quarterly''',
'        when repeat_interval = ''freq=monthly; bymonthday=15,-1; byhour=8; byminute=0; bysecond=0;'' then',
'            ''Bi-Monthly''',
'        when repeat_interval = ''freq=monthly; byday=1mon; byhour=8; byminute=0; bysecond=0;'' then',
'            ''Monthly''',
'        when repeat_interval = ''freq=weekly; byday=mon; byhour=8; byminute=0; bysecond=0;'' then',
'            ''Weekly''',
'        when repeat_interval = ''freq=daily; byday='' || replace(replace(replace(replace(replace(replace(replace(replace(eba_proj_fw.get_preference_value(''WORKDAYS''),'':'','',''),''1'',''SUN''),''2'',''MON''),''3'',''TUE''),''4'',''WED''),''5'',''THU''),''6'',''FRI''),''7'',''SAT'') '
||'|| ''; byhour=8; byminute=0; bysecond=0;'' then',
'            ''Daily''',
'        when repeat_interval is null then',
'            ''Never''',
'    end as schedule',
'from user_scheduler_jobs',
'where job_name = :P168_JOB_NAME'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(11984740793846930019)
,p_computation_sequence=>10
,p_computation_item=>'P168_JOB_STATUS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select decode(enabled, ''TRUE'', ''ENABLED'', ''DISABLED'') as status from user_scheduler_jobs where job_name = :P168_JOB_NAME'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11984741182446930023)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11984741109930930022)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11984741297012930024)
,p_event_id=>wwv_flow_imp.id(11984741182446930023)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18808041527989757058)
,p_name=>'Submit New Value'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P168_JOB_STATUS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18808041711499757059)
,p_event_id=>wwv_flow_imp.id(18808041527989757058)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P168_JOB_STATUS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(14042368121180240454)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save URL as Preference'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_proj_fw.set_preference_value(',
'        p_preference_name => ''HOST_URL'',',
'        p_preference_value => nvl( wwv_flow_utilities.host_url(''SCRIPT''),',
'                                   nvl( wwv_flow_utilities.get_protocol(), ''http'' )',
'                                       ||''://''|| owa_util.get_cgi_env( ''HTTP_HOST'' )',
'                                       || owa_util.get_cgi_env( ''SCRIPT_NAME'' ) )',
'    );',
'    commit;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>14042368121180240454
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11984742184333930033)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enable Send Mail Job'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_schema          varchar2(30);',
'    l_program         varchar2(30)   := replace(:P168_JOB_NAME,''_JOB'',''_PRG'');',
'    l_job             varchar2(30)   := :P168_JOB_NAME;',
'    l_interval        varchar2(30)   := upper(:P168_INTERVAL);',
'    l_action          varchar2(50);',
'    l_freq            varchar2(255);',
'    l_num_params      number         := 1;',
'    l_app_id          number         := :APP_ID;',
'    l_prog_type       varchar2(20)   := ''STORED_PROCEDURE'';',
'    l_param_name      varchar2(10)   := ''P_APP_ID'';',
'    l_param_type      varchar2(10)   := ''NUMBER'';',
'    l_prg_comments    varchar2(255)  := ''Sends job-driven emails.'';',
'    l_start_ts        timestamp with local time zone := systimestamp;',
'    l_scheduler       varchar2(10)   := ''dbms'';',
'    l_sql_stmt        varchar2(3000);',
'begin',
'    for c1 in ( select null',
'                from all_objects',
'                where object_type = ''PACKAGE''',
'                    and object_name = ''CLOUD_SCHEDULER'' ) loop',
'        l_scheduler := ''cloud'';',
'    end loop;',
'    ',
'    -- Remove the program and job',
'    l_sql_stmt := ''begin sys.''||l_scheduler||''_scheduler.drop_program (program_name => :1, force => true); end;'';',
'',
'    execute immediate l_sql_stmt using l_program;',
'',
'    l_sql_stmt := ''begin sys.''||l_scheduler||''_scheduler.drop_job (job_name => :1); end;'';',
'',
'    execute immediate l_sql_stmt using l_job;',
'',
'    commit;',
'',
'    if l_job = ''EBA_PROJ_EMAIL_PAST_DUE_JOB'' then',
'        l_action := ''eba_proj_stat_email.send_past_due_emails'';',
'    elsif l_job = ''EBA_PROJ_EMAIL_UPCOMING_JOB'' then',
'        l_action := ''eba_proj_stat_email.send_upcoming_emails'';',
'    elsif l_job = ''EBA_PROJ_EMAIL_SUMMARY_JOB'' then',
'        l_action := ''eba_proj_stat_email.send_summary_emails'';',
'    elsif l_job = ''EBA_PROJ_EMAIL_STATUS_JOB'' then',
'        l_action := ''eba_proj_stat_email.send_status_emails'';',
'    end if;',
'',
'    -- Set the job''s repeat_interval value',
'    if l_interval = ''QUARTERLY'' then',
'        l_freq := ''freq=monthly; bymonth=1,4,7,10; byday=1mon; byhour=8; byminute=0; bysecond=0;'';',
'    elsif l_interval = ''BIMONTHLY'' then',
'        l_freq := ''freq=monthly; bymonthday=15,-1; byhour=8; byminute=0; bysecond=0;'';',
'    elsif l_interval = ''MONTHLY'' then',
'        l_freq := ''freq=monthly; byday=1mon; byhour=8; byminute=0; bysecond=0;'';',
'    elsif l_interval = ''WEEKLY'' then',
'        l_freq := ''freq=weekly; byday=mon; byhour=8; byminute=0; bysecond=0;'';',
'    elsif l_interval = ''DAILY'' then',
'        l_freq := ''freq=daily; byhour=8; byminute=0; bysecond=0;'';',
'    end if;',
'',
'    -- Recreate program and job',
'    begin',
'        l_sql_stmt := ''begin sys.''||l_scheduler||''_scheduler.create_program (',
'           program_name        => :1,',
'           program_type        => :2,',
'           program_action      => :3,',
'           number_of_arguments => :4,',
'           enabled             => false); end;'';',
'',
'        execute immediate l_sql_stmt using l_program, l_prog_type, l_action, l_num_params;',
'',
'        l_sql_stmt := ''begin sys.''||l_scheduler||''_scheduler.define_program_argument (',
'           program_name      => :1,',
'           argument_position => :2,',
'           argument_name     => :3,',
'           argument_type     => :4 ); end;'';',
'',
'        execute immediate l_sql_stmt using l_program, l_num_params, l_param_name, l_param_type;',
'',
'    exception when others then',
'        -- ORA-00955: name is already used by an existing object',
'        if sqlcode not in (-955,-27477) then',
'            raise;',
'        end if;',
'    end;',
'    begin',
'        l_sql_stmt := ''begin sys.''||l_scheduler||''_scheduler.create_job (',
'           job_name        => :1,',
'           program_name    => :2,',
'           start_date      => :3,',
'           repeat_interval => :4,',
'           -- The job is created disabled by default. Enable only in those environments where this is actually needed.',
'           enabled         => false,',
'           comments        => :5 ); end;'';',
'',
'        execute immediate l_sql_stmt using l_job, l_program, l_start_ts, l_freq, l_prg_comments;',
'',
'    exception when others then',
'        -- ORA-00955: name is already used by an existing object',
'        if sqlcode not in (-955,-27477) then',
'            raise;',
'        end if;',
'    end;',
'',
'    -- Populate schema owner',
'    select sys_context( ''userenv'', ''current_schema'' ) into l_schema from sys.dual;',
'',
'    -- Set App ID attribute',
'    l_sql_stmt := ''begin sys.''||l_scheduler||''_scheduler.define_program_argument (',
'        program_name            => :1,',
'        argument_position       => :2,',
'        argument_name           => :3,',
'        argument_type           => :4,',
'        default_value           => :5); end;'';',
'',
'    execute immediate l_sql_stmt using l_program, l_num_params, l_prog_type, l_param_type, l_app_id;',
'',
'    -- Enable Program',
'    l_sql_stmt := ''begin sys.''||l_scheduler||''_scheduler.enable( name => :1 ); end;'';',
'',
'    execute immediate l_sql_stmt using l_schema || ''.'' || l_program;',
'',
'    -- Enable Job',
'    l_sql_stmt := ''begin sys.''||l_scheduler||''_scheduler.enable( name => :1 ); end;'';',
'',
'    execute immediate l_sql_stmt using l_schema || ''.'' || l_job;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11984741323836930025)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P168_JOB_NAME = ''EBA_PROJ_EMAIL_UPCOMING_JOB'' and :P168_JOB_STATUS = ''ENABLED'')',
'or',
'(:P168_JOB_NAME = ''EBA_PROJ_EMAIL_PAST_DUE_JOB'' and :P168_JOB_STATUS = ''ENABLED'')',
'or',
'(:P168_JOB_NAME = ''EBA_PROJ_EMAIL_SUMMARY_JOB'' and :P168_JOB_STATUS = ''ENABLED'')',
'or',
'(:P168_JOB_NAME = ''EBA_PROJ_EMAIL_STATUS_JOB'' and :P168_JOB_STATUS = ''ENABLED'')'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'The &P168_JOB. job was enabled successfully.'
,p_internal_uid=>11984742184333930033
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11984742386973930035)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Disable Send Mail Job'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_schema          varchar2(30);',
'    l_program         varchar2(30)   := replace(:P168_JOB_NAME,''_JOB'',''_PRG'');',
'    l_job             varchar2(30)   := :P168_JOB_NAME;',
'    l_scheduler       varchar2(10)   := ''dbms'';',
'    l_sql_stmt        varchar2(3000);',
'begin',
'    for c1 in ( select null',
'                from all_objects',
'                where object_type = ''PACKAGE''',
'                    and object_name = ''CLOUD_SCHEDULER'' ) loop',
'        l_scheduler := ''cloud'';',
'    end loop;',
'',
'    -- Populate schema owner',
'    select sys_context( ''userenv'', ''current_schema'' ) into l_schema from sys.dual;',
'',
'    -- Disable Program',
'    l_sql_stmt := ''begin sys.''||l_scheduler||''_scheduler.disable (name => :1, force => true); end;'';',
'    execute immediate l_sql_stmt using l_schema ||''.''|| l_program;',
'',
'    -- Disable Job',
'    l_sql_stmt := ''begin sys.''||l_scheduler||''_scheduler.disable (name => :1, force => true); end;'';',
'    execute immediate l_sql_stmt using l_schema ||''.''|| l_job;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11984741323836930025)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P168_JOB_NAME = ''EBA_PROJ_EMAIL_UPCOMING_JOB'' and :P168_JOB_STATUS = ''DISABLED'')',
'or',
'(:P168_JOB_NAME = ''EBA_PROJ_EMAIL_PAST_DUE_JOB'' and :P168_JOB_STATUS = ''DISABLED'')',
'or',
'(:P168_JOB_NAME = ''EBA_PROJ_EMAIL_SUMMARY_JOB'' and :P168_JOB_STATUS = ''DISABLED'')',
'or',
'(:P168_JOB_NAME = ''EBA_PROJ_EMAIL_STATUS_JOB'' and :P168_JOB_STATUS = ''DISABLED'')'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'The "Email Past Due Deliverables" job was disabled successfully.'
,p_internal_uid=>11984742386973930035
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(416113703627061591)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>416113703627061591
);
wwv_flow_imp.component_end;
end;
/
