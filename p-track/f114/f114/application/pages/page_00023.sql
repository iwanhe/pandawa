prompt --application/pages/page_00023
begin
--   Manifest
--     PAGE: 00023
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
 p_id=>23
,p_name=>'Remove Attachments'
,p_page_mode=>'MODAL'
,p_step_title=>'Remove Attachments'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486086019073759)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_dialog_chained=>'N'
,p_help_text=>'Select the age of the attachments you would like to remove and click the <strong>Remove Attachments</strong> button. All attachments from all projects that are older than the specified age will be removed.'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(416112930692061584)
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
 p_id=>wwv_flow_imp.id(6229429002954489380)
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
 p_id=>wwv_flow_imp.id(6229429503954496279)
,p_plug_name=>'Metrics'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>200
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    ''Size > 180 Days'' as label,',
'    to_char(',
'    decode(',
'         nvl(sum(dbms_lob.getlength(file_blob)),0),',
'         0,',
'         0,',
'         sum(dbms_lob.getlength(file_blob))/(1024*1024)',
'    ),',
'    ''999G999G999G999G990D99'') ||'' MB'' as value,',
'    100      as percent',
'from eba_proj_status_files f',
'where to_date(to_char(created,''YYYYMMDD''),''YYYYMMDD'') < sysdate - 180',
'union all',
'select',
'    ''Size > 1 year'' as label,',
'    to_char(',
'    decode(',
'         nvl(sum(dbms_lob.getlength(file_blob)),0),',
'         0,',
'         0,',
'         sum(dbms_lob.getlength(file_blob))/(1024*1024)',
'    ),',
'    ''999G999G999G999G990D99'') ||'' MB'' as value,',
'    100      as percent',
'from eba_proj_status_files f',
'where to_date(to_char(created,''YYYYMMDD''),''YYYYMMDD'') < sysdate - 365',
'union all',
'select',
'    ''Size > 2 Years'' as label,',
'    to_char(',
'    decode(',
'         nvl(sum(dbms_lob.getlength(file_blob)),0),',
'         0,',
'         0,',
'         sum(dbms_lob.getlength(file_blob))/(1024*1024)',
'    ),',
'    ''999G999G999G999G990D99'') ||'' MB'' as value,',
'    100      as percent',
'from eba_proj_status_files f',
'where to_date(to_char(created,''YYYYMMDD''),''YYYYMMDD'') < sysdate - 730',
'union all',
'select',
'    ''Size > 3 Years'' as label,',
'    to_char(',
'    decode(',
'         nvl(sum(dbms_lob.getlength(file_blob)),0),',
'         0,',
'         0,',
'         sum(dbms_lob.getlength(file_blob))/(1024*1024)',
'    ),',
'    ''999G999G999G999G990D99'') ||'' MB'' as value,',
'    100      as percent',
'from eba_proj_status_files f',
'where to_date(to_char(created,''YYYYMMDD''),''YYYYMMDD'') < sysdate - 1095'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LABEL',
  'attribute_02', 'VALUE',
  'attribute_03', 'PERCENT',
  'attribute_05', '2',
  'attribute_06', 'B',
  'attribute_07', 'BOX',
  'attribute_08', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6229430299760542367)
,p_plug_name=>'Remove Attachments'
,p_region_css_classes=>'infoTextRegion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'BELOW'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6229431285771563414)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(416112930692061584)
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
 p_id=>wwv_flow_imp.id(6229431483380563421)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(416112930692061584)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Remove Attachments'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6229430711866551293)
,p_name=>'P23_AGE_IN_DAYS'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6229430299760542367)
,p_item_default=>'730'
,p_prompt=>'Age In Days'
,p_source=>'730'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REMOVE AGE IN DAYS'
,p_lov=>'.'||wwv_flow_imp.id(6229432398899579895)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_inline_help_text=>'Remove all attachments older then the specified age in days.  Use this to reduce storage space.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(416113051104061585)
,p_name=>'CNX'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6229431285771563414)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(416113135205061586)
,p_event_id=>wwv_flow_imp.id(416113051104061585)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6229431910889573979)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'remove attachments'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete ',
'from eba_proj_status_files f',
'where to_date(to_char(created,''YYYYMMDD''),''YYYYMMDD'') <= sysdate - :P23_AGE_IN_DAYS;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6229431483380563421)
,p_process_success_message=>'Attachments Removed'
,p_internal_uid=>6229431910889573979
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(416113257783061587)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>416113257783061587
);
wwv_flow_imp.component_end;
end;
/
