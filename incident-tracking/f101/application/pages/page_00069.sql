prompt --application/pages/page_00069
begin
--   Manifest
--     PAGE: 00069
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
 p_id=>69
,p_name=>'Manage Sample Data'
,p_page_mode=>'MODAL'
,p_step_title=>'Manage Sample Data'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(3204234467922058482)
,p_help_text=>'Click the <strong>Remove Sample Data</strong> button to remove the sample data the app ships with. Click the <strong>Load Sample Data</strong> button to load the sample data the app ships with. Click the <strong>Reset Data</strong> button to reload t'
||'he sample data the app ships with. Click the <strong>Cancel</strong> button to return to the Administration page.'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1988733559832497713)
,p_plug_name=>'Manage Sample Data'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--warning'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609167356359051970)
,p_plug_display_sequence=>10
,p_plug_source=>'<p>This application ships with sample data.  You can remove and recreate sample data using this page.  If the sample data is old recreating the data makes the dates more current.  Removing or adding sample data will not affect any decisions you creat'
||'ed.</p>'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1988735627408497715)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1988733559832497713)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1988734422703497714)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1988733559832497713)
,p_button_name=>'load_sample_data'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Load Sample Data'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_intrack_tags',
'where tag = ''SAMPLE''',
'and content_type = ''INCIDENT'''))
,p_button_condition_type=>'NOT_EXISTS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1988734852061497715)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(1988733559832497713)
,p_button_name=>'remove_sample_data'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Remove Sample Data'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_intrack_tags',
'where tag = ''SAMPLE''',
'and content_type = ''INCIDENT'''))
,p_button_condition_type=>'EXISTS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1988735242458497715)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(1988733559832497713)
,p_button_name=>'reset_data'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reset Data'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1988738332891497722)
,p_branch_name=>'Go To Administration'
,p_branch_action=>'f?p=&APP_ID.:settings:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 06-JAN-2012 15:08 by MIKE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(318128324594731279)
,p_name=>'CNX'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1988735627408497715)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(318128419643731280)
,p_event_id=>wwv_flow_imp.id(318128324594731279)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1988737009971497718)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'reset data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from eba_intrack_incidents',
'where id in (',
'    select content_id ',
'    from   eba_intrack_tags',
'    where  tag = ''SAMPLE'' );',
'commit;',
'',
'eba_intrack_load_sample;',
'commit;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1988735242458497715)
,p_process_success_message=>'Sample data reset.'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_internal_uid=>1988737009971497718
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1988737417210497721)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'remove sample data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from eba_intrack_incidents',
'where id in (',
'    select content_id ',
'    from   eba_intrack_tags',
'    where  tag = ''SAMPLE'' );',
'commit;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1988734852061497715)
,p_process_success_message=>'Sample Data Removed'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_internal_uid=>1988737417210497721
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1988737784614497722)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Sample Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_intrack_load_sample;',
'commit;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1988734422703497714)
,p_process_success_message=>'Sample Data Loaded.'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_internal_uid=>1988737784614497722
);
wwv_flow_imp.component_end;
end;
/
