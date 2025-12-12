prompt --application/pages/page_00087
begin
--   Manifest
--     PAGE: 00087
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
 p_id=>87
,p_name=>'Confirm New Due Dates'
,p_page_mode=>'MODAL'
,p_step_title=>'Confirm New Due Dates'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(16994329256620217353)
,p_name=>'Affected Item(s)'
,p_template=>wwv_flow_imp.id(6672353576565369876)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    v1.type,',
'    v1.name,',
'    v1.original_due_date,',
'    v1.original_start_date,',
'    v1.new_due_date,',
'    v1.new_start_date',
'from',
'    (',
'        select',
'            ''Milestone'' as type,',
'            m.milestone_name as name,',
'            m.milestone_date as original_due_date,',
'            m.milestone_start_date as original_start_date,',
'/*            case when :P87_DATE_CHANGED in (''DUE'',''BOTH'') then eba_proj_dates.add_workdays( p_date => milestone_date, p_days => to_number(:P87_DIFF_DAYS) ) end as new_due_date,',
'            case when :P87_DATE_CHANGED in (''START'',''BOTH'') then eba_proj_dates.add_workdays( p_date => milestone_start_date, p_days => to_number(:P87_DIFF_DAYS) ) end as new_start_date*/',
'            case when m.id = :P87_MS_ID then to_date(:P85_MILESTONE_DATE,''DD-MON-YYYY'')',
'                else  eba_proj_dates.add_workdays(  p_date => m.milestone_date,',
'                                                    p_days => eba_proj_dates.days_between(  p_start => to_date(:P87_ORIG_MILESTONE_DATE,''DD-MON-YYYY''),',
'                                                                                            p_end   => to_date(:P85_MILESTONE_DATE,''DD-MON-YYYY'') )',
'                                                )',
'            end as new_due_date,',
'            case when m.id = :P87_MS_ID then to_date(:P85_MILESTONE_START_DATE,''DD-MON-YYYY'')',
'                else eba_proj_dates.add_workdays(   p_date => m.milestone_start_date,',
'                                                    p_days => eba_proj_dates.days_between(  p_start => to_date(:P87_ORIG_MS_START_DATE,''DD-MON-YYYY''),',
'                                                                                            p_end   => to_date(:P85_MILESTONE_START_DATE,''DD-MON-YYYY'') )',
'                                                )',
'            end as new_start_date',
'        from',
'            EBA_PROJ_STATUS_MS m',
'        where',
'            m.project_id = :P87_PROJECT_ID',
'            and (',
'                m.id = :P87_MS_ID',
'                or (',
'                    :P87_CASCADE_MS = ''Yes''',
'                    and (',
'                        milestone_date >= to_date(:P87_ORIG_MILESTONE_DATE,''DD-Mon-YYYY'')',
'                        or',
'                        milestone_start_date >= to_date(:P87_ORIG_MS_START_DATE,''DD-Mon-YYYY'')',
'                        )',
'                    )',
'            )',
'        union all',
'        select',
'            ''Action Item'' as type,',
'            a.action as name,',
'            a.due_date as original_due_date,',
'            null as original_start_date,',
'--            eba_proj_dates.add_workdays( p_date => a.due_date, p_days => to_number(:P87_DIFF_DAYS) ) as new_due_date,',
'            eba_proj_dates.add_workdays( p_date => ',
'                                            case when m.id = :P87_MS_ID then to_date(:P85_MILESTONE_START_DATE,''DD-MON-YYYY'')',
'                                                else eba_proj_dates.add_workdays(   p_date => m.milestone_start_date,',
'                                                                                    p_days => eba_proj_dates.days_between(  p_start => to_date(:P87_ORIG_MS_START_DATE,''DD-MON-YYYY''),',
'                                                                                                                            p_end   => to_date(:P85_MILESTONE_START_DATE,''DD-MON-YYYY'') )',
'                                                )',
'                                            end,',
'                                        p_days => eba_proj_dates.days_between(  p_start => m.milestone_start_date,',
'                                                                                p_end => a.due_date )',
'                                    ) as new_due_date,',
'            null as new_start_date',
'        from',
'            EBA_PROJ_STATUS_AIS a,',
'            eba_proj_status_ms m',
'        where',
'            a.project_id = :P87_PROJECT_ID',
'            and m.id = a.milestone_id',
'            and :P87_CASCADE_AI = ''Yes''',
'            and (',
'                a.milestone_id = :P87_MS_ID',
'                or',
'                (',
'                    :P87_CASCADE_MS = ''Yes''',
'                        and a.milestone_id in (select id from EBA_PROJ_STATUS_MS where project_id = :P87_PROJECT_ID and ( milestone_date >= to_date(:P87_ORIG_MILESTONE_DATE,''DD-Mon-YYYY'') or milestone_start_date >= to_date(:P87_ORIG_MS_START_DATE,''DD'
||'-Mon-YYYY'')))',
'                )',
'            )',
'    ) v1',
'order by',
'    v1.new_due_date asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>50000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>':P87_CASCADE_MS = ''Yes'' and :P87_CASCADE_AI = ''Yes'''
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16994329339413217354)
,p_query_column_id=>1
,p_column_alias=>'TYPE'
,p_column_display_sequence=>1
,p_column_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16994329490898217355)
,p_query_column_id=>2
,p_column_alias=>'NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16994329533508217356)
,p_query_column_id=>3
,p_column_alias=>'ORIGINAL_DUE_DATE'
,p_column_display_sequence=>5
,p_column_heading=>'Original Due Date'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483109015496085381)
,p_query_column_id=>4
,p_column_alias=>'ORIGINAL_START_DATE'
,p_column_display_sequence=>3
,p_column_heading=>'Original Start Date'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16994329688014217357)
,p_query_column_id=>5
,p_column_alias=>'NEW_DUE_DATE'
,p_column_display_sequence=>6
,p_column_heading=>'New Due Date'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483109107574085382)
,p_query_column_id=>6
,p_column_alias=>'NEW_START_DATE'
,p_column_display_sequence=>4
,p_column_heading=>'New Start Date'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17849134519425449244)
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
 p_id=>wwv_flow_imp.id(17849146150906449260)
,p_plug_name=>'Confirm Date Changes'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17985304398264865714)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(17849134519425449244)
,p_button_name=>'CHANGE_DATES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change Dates'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17849134634051449245)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(17849134519425449244)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17985304689110865717)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(17849134519425449244)
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Previous'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:85:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4004128177241779588)
,p_name=>'P87_ORIG_MS_START_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(17849146150906449260)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4036793820836725271)
,p_name=>'P87_DATE_CHANGED'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(17849146150906449260)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17849146252885449261)
,p_name=>'P87_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17849146150906449260)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17849146398873449262)
,p_name=>'P87_MS_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(17849146150906449260)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17849146431916449263)
,p_name=>'P87_DIFF_DAYS_DISPLAY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(17849146150906449260)
,p_prompt=>'Due Date Change'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>The number of days displayed here factors out days that your application administrator has defined to be non-work days (weekends). So if the original due date was on a Friday and you change the date to be the following Tuesday, this value will sho'
||'w 2 (instead of 4).</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17985304969065865720)
,p_name=>'P87_CASCADE_MS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(17849146150906449260)
,p_prompt=>'Cascade to Future Milestones'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17985305039382865721)
,p_name=>'P87_CASCADE_AI'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(17849146150906449260)
,p_prompt=>'Cascade Dependent Action Items'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17985305765570865728)
,p_name=>'P87_DIFF_DAYS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(17849146150906449260)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17992537272434233510)
,p_name=>'P87_ORIG_MILESTONE_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(17849146150906449260)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18011876445876745618)
,p_computation_sequence=>10
,p_computation_item=>'P87_CASCADE_MS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'replace(replace(:P87_CASCADE_MS,''Y'',''Yes''),''N'',''No'')'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18011876545173745619)
,p_computation_sequence=>20
,p_computation_item=>'P87_CASCADE_AI'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'replace(replace(:P87_CASCADE_AI,''Y'',''Yes''),''N'',''No'')'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(17985304900658865719)
,p_computation_sequence=>10
,p_computation_item=>'P87_DIFF_DAYS_DISPLAY'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>':P87_DIFF_DAYS || '' day(s)'''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17849134789444449246)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(17849134634051449245)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17849134909881449247)
,p_event_id=>wwv_flow_imp.id(17849134789444449246)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(18011876996954745623)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Push Affected Milestone(s) and Action Item(s)'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update eba_proj_status_ms',
'   set milestone_date = case when id = :P87_MS_ID then',
'                to_date(:P85_MILESTONE_DATE,''DD-MON-YYYY'')',
'            else',
'                eba_proj_dates.add_workdays(  p_date => milestone_date,',
'                                              p_days => eba_proj_dates.days_between(  p_start => to_date(:P87_ORIG_MILESTONE_DATE,''DD-MON-YYYY''),',
'                                                                                      p_end   => to_date(:P85_MILESTONE_DATE,''DD-MON-YYYY'') )',
'                                                )',
'            end, ',
'       milestone_start_date = case when id = :P87_MS_ID then',
'                to_date(:P85_MILESTONE_START_DATE,''DD-MON-YYYY'')',
'            else',
'                eba_proj_dates.add_workdays(   p_date => milestone_start_date,',
'                                               p_days => eba_proj_dates.days_between(  p_start => to_date(:P87_ORIG_MS_START_DATE,''DD-MON-YYYY''),',
'                                                                                       p_end   => to_date(:P85_MILESTONE_START_DATE,''DD-MON-YYYY'') )',
'                                                )',
'            end',
'where',
'        project_id = :P87_PROJECT_ID',
'        and (',
'            id = :P87_MS_ID',
'            or (',
'                :P87_CASCADE_MS = ''Yes''',
'                and (',
'                        milestone_date >= to_date(:P87_ORIG_MILESTONE_DATE,''DD-Mon-YYYY'')',
'                        or',
'                        milestone_start_date >= to_date(:P87_ORIG_MS_START_DATE,''DD-Mon-YYYY'')',
'                    )',
'                )',
'        );',
'',
'',
'update eba_proj_status_ais',
'   set due_date = eba_proj_dates.add_workdays(',
'                      p_date => case when milestone_id = :P87_MS_ID then',
'                                    to_date(:P85_MILESTONE_START_DATE,''DD-MON-YYYY'')',
'                                else',
'                                    eba_proj_dates.add_workdays(',
'                                        p_date => (select m.milestone_start_date from eba_proj_status_ms m where m.id = milestone_id and m.project_id = :P87_PROJECT_ID),',
'                                        p_days => eba_proj_dates.days_between(',
'                                                    p_start => to_date(:P87_ORIG_MS_START_DATE,''DD-MON-YYYY''),',
'                                                    p_end   => to_date(:P85_MILESTONE_START_DATE,''DD-MON-YYYY'')',
'                                                )',
'                                   )',
'                                end,',
'                      p_days => eba_proj_dates.days_between(',
'                                    p_start => (select m.milestone_start_date from eba_proj_status_ms m where m.id = milestone_id and m.project_id = :P87_PROJECT_ID),',
'                                    p_end => due_date',
'                                )',
'                  )',
' where project_id = :P87_PROJECT_ID',
'   and id in (select',
'                    id',
'                from',
'                    eba_proj_status_ais a',
'                where',
'                    a.project_id = :P87_PROJECT_ID',
'                --and',
'                   -- id = a.milestone_id',
'                and ',
'                    :P87_CASCADE_AI = ''Yes''',
'                and (',
'                     a.milestone_id = :P87_MS_ID',
'                     or',
'                    (',
'                        :P87_CASCADE_MS = ''Yes''',
'                         and',
'                         a.milestone_id in (select id from EBA_PROJ_STATUS_MS where project_id = :P87_PROJECT_ID and ( milestone_date >= to_date(:P87_ORIG_MILESTONE_DATE,''DD-Mon-YYYY'') or milestone_start_date >= to_date(:P87_ORIG_MS_START_DATE,''DD-Mo'
||'n-YYYY'')))',
'                    )',
'                ));'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(17985304398264865714)
,p_process_when_type=>'NEVER'
,p_internal_uid=>18011876996954745623
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4343226053292438042)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Push Affected Milestone(s) and Action Item(s)_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c1 in ( select',
'                    v1.type,',
'                    v1.new_due_date,',
'                    v1.new_start_date,',
'                    v1.id',
'                from',
'                    (',
'                        select',
'                            ''Milestone'' as type,',
'                            case when m.id = :P87_MS_ID then to_date(:P85_MILESTONE_DATE,''DD-MON-YYYY'')',
'                                else  eba_proj_dates.add_workdays(  p_date => m.milestone_date,',
'                                                                    p_days => eba_proj_dates.days_between(  p_start => to_date(:P87_ORIG_MILESTONE_DATE,''DD-MON-YYYY''),',
'                                                                                                            p_end   => to_date(:P85_MILESTONE_DATE,''DD-MON-YYYY'') )',
'                                                                )',
'                            end as new_due_date,',
'                            case when m.id = :P87_MS_ID then to_date(:P85_MILESTONE_START_DATE,''DD-MON-YYYY'')',
'                                else eba_proj_dates.add_workdays(   p_date => m.milestone_start_date,',
'                                                                    p_days => eba_proj_dates.days_between(  p_start => to_date(:P87_ORIG_MS_START_DATE,''DD-MON-YYYY''),',
'                                                                                                            p_end   => to_date(:P85_MILESTONE_START_DATE,''DD-MON-YYYY'') )',
'                                                                )',
'                            end as new_start_date,',
'                            m.id',
'                        from',
'                            EBA_PROJ_STATUS_MS m',
'                        where',
'                            m.project_id = :P87_PROJECT_ID',
'                            and (',
'                                m.id = :P87_MS_ID',
'                                or (',
'                                    :P87_CASCADE_MS = ''Yes''',
'                                    and (',
'                                        milestone_date >= to_date(:P87_ORIG_MILESTONE_DATE,''DD-Mon-YYYY'')',
'                                        or',
'                                        milestone_start_date >= to_date(:P87_ORIG_MS_START_DATE,''DD-Mon-YYYY'')',
'                                        )',
'                                    )',
'                            )',
'                        union all',
'                        select',
'                            ''Action Item'' as type,',
'                            eba_proj_dates.add_workdays( p_date => ',
'                                                            case when m.id = :P87_MS_ID then to_date(:P85_MILESTONE_START_DATE,''DD-MON-YYYY'')',
'                                                                else eba_proj_dates.add_workdays(   p_date => m.milestone_start_date,',
'                                                                                                    p_days => eba_proj_dates.days_between(  p_start => to_date(:P87_ORIG_MS_START_DATE,''DD-MON-YYYY''),',
'                                                                                                                                            p_end   => to_date(:P85_MILESTONE_START_DATE,''DD-MON-YYYY'') )',
'                                                                )',
'                                                            end,',
'                                                        p_days => eba_proj_dates.days_between(  p_start => m.milestone_start_date,',
'                                                                                                p_end => a.due_date )',
'                                                    ) as new_due_date,',
'                            null as new_start_date,',
'                            a.id',
'                        from',
'                            eba_proj_status_ais a,',
'                            eba_proj_status_ms m',
'                        where',
'                            a.project_id = :P87_PROJECT_ID',
'                            and m.id = a.milestone_id',
'                            and :P87_CASCADE_AI = ''Yes''',
'                            and (',
'                                a.milestone_id = :P87_MS_ID',
'                                or',
'                                (',
'                                    :P87_CASCADE_MS = ''Yes''',
'                                        and a.milestone_id in (select id from eba_proj_status_ms where project_id = :P87_PROJECT_ID and ( milestone_date >= to_date(:P87_ORIG_MILESTONE_DATE,''DD-Mon-YYYY'') or milestone_start_date >= to_date(:P87_ORIG_M'
||'S_START_DATE,''DD-Mon-YYYY'')))',
'                                )',
'                            )',
'                    ) v1',
'                order by',
'                    v1.new_due_date asc ) loop',
'        if c1.type = ''Milestone'' then',
'            update eba_proj_status_ms',
'            set milestone_date = c1.new_due_date,',
'                milestone_start_date = c1.new_start_date',
'            where id = c1.id;',
'        else',
'            update eba_proj_status_ais',
'            set due_date = c1.new_due_date',
'            where id = c1.id;',
'        end if;',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(17985304398264865714)
,p_internal_uid=>4343226053292438042
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(18011877096503745624)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_01=>'P87_CASCADE_AI'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>18011877096503745624
);
wwv_flow_imp.component_end;
end;
/
