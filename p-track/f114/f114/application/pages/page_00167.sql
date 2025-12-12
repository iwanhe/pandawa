prompt --application/pages/page_00167
begin
--   Manifest
--     PAGE: 00167
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
 p_id=>167
,p_name=>'Email Upcoming Deliverables Send Job'
,p_page_mode=>'MODAL'
,p_step_title=>'Email Upcoming Deliverables Send Job'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486086019073759)
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11888600020324608728)
,p_help_text=>'<p>This job will send one email per <a href="f?p=&APP_ID.:57:&APP_SESSION.:">workday</a> to every user that has incomplete deliverables due within the next seven days. This job can be enabled or disabled, click status to change status.</p>'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11984456295202853160)
,p_name=>'Email Upcoming Deliverables Send Job'
,p_template=>wwv_flow_imp.id(6672346928802369862)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(replace(replace(replace(job_name, ''EBA_PROJ_'', null), ''_JOB'', ''_DELIVERABLES_JOB''), ''_'', '' '')) as job,',
'    case when enabled = ''TRUE'' then ''Enabled'' else ''Disabled'' end as status,',
'    job_name,',
'    comments,',
'    last_start_date,',
'    next_run_date,',
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
'        when repeat_interval = ''freq=daily; byhour=8; byminute=0; bysecond=0;'' then',
'            ''Daily''',
'    end as schedule',
'from user_scheduler_jobs',
'where job_name = ''EBA_PROJ_EMAIL_UPCOMING_JOB'''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984741725056930029)
,p_query_column_id=>1
,p_column_alias=>'JOB'
,p_column_display_sequence=>2
,p_column_heading=>'Job'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984741895556930030)
,p_query_column_id=>2
,p_column_alias=>'STATUS'
,p_column_display_sequence=>1
,p_column_heading=>'Status'
,p_column_link=>'f?p=&APP_ID.:168:&SESSION.::&DEBUG.:RP:P168_JOB_NAME,LAST_VIEW:#JOB_NAME#,&APP_PAGE_ID.'
,p_column_linktext=>'#STATUS#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984741991903930031)
,p_query_column_id=>3
,p_column_alias=>'JOB_NAME'
,p_column_display_sequence=>3
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042354727033240420)
,p_query_column_id=>4
,p_column_alias=>'COMMENTS'
,p_column_display_sequence=>4
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042354883717240421)
,p_query_column_id=>5
,p_column_alias=>'LAST_START_DATE'
,p_column_display_sequence=>5
,p_column_heading=>'Last Run'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_scheduler_jobs',
'where job_name = ''EBA_PROJ_EMAIL_UPCOMING_JOB''',
'    and enabled = ''TRUE'''))
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042354963420240422)
,p_query_column_id=>6
,p_column_alias=>'NEXT_RUN_DATE'
,p_column_display_sequence=>6
,p_column_heading=>'Next Run'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_scheduler_jobs',
'where job_name = ''EBA_PROJ_EMAIL_UPCOMING_JOB''',
'    and enabled = ''TRUE'''))
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15094703515945031454)
,p_query_column_id=>7
,p_column_alias=>'SCHEDULE'
,p_column_display_sequence=>7
,p_column_heading=>'Schedule'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11984457936752853172)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(14042961354835422566)
,p_name=>'Job History'
,p_template=>wwv_flow_imp.id(6672353576565369876)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select status, actual_start_date, run_duration, errors',
'from user_scheduler_job_run_details',
'where job_name = ''EBA_PROJ_EMAIL_UPCOMING_JOB''',
'order by actual_start_date desc'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_scheduler_job_run_details',
'where job_name = ''EBA_PROJ_EMAIL_UPCOMING_JOB'''))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042961632463422569)
,p_query_column_id=>1
,p_column_alias=>'STATUS'
,p_column_display_sequence=>1
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042962048294422571)
,p_query_column_id=>2
,p_column_alias=>'ACTUAL_START_DATE'
,p_column_display_sequence=>2
,p_column_heading=>'Start Date'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042962437125422571)
,p_query_column_id=>3
,p_column_alias=>'RUN_DURATION'
,p_column_display_sequence=>3
,p_column_heading=>'Duration'
,p_column_format=>'999G999G999G999G999G999G990'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042962900413422572)
,p_query_column_id=>4
,p_column_alias=>'ERRORS'
,p_column_display_sequence=>4
,p_column_heading=>'Errors'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(417228582874456652)
,p_name=>'Refresh on Edit'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11984456295202853160)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(417228616045456653)
,p_event_id=>wwv_flow_imp.id(417228582874456652)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11984456295202853160)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
