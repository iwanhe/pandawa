prompt --application/pages/page_00057
begin
--   Manifest
--     PAGE: 00057
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
 p_id=>57
,p_name=>'Work Days'
,p_page_mode=>'MODAL'
,p_step_title=>'Work Days'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486086019073759)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_help_text=>'Select which days should be used as normal work days in calculating milestone lengths and validating due dates. Click the <strong>Apply Changes</strong> button to save your work days settings.'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(400619875971487169)
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
 p_id=>wwv_flow_imp.id(12179264455834588931)
,p_plug_name=>'Work Days'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1993405599699027906)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Select which days should be used as normal work days in calculating milestone lengths and validating due dates. Click the <strong>Apply Changes</strong> button to save your work days settings.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13450670999601917874)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12179264668238588933)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(400619875971487169)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(12179264990301588936)
,p_branch_name=>'Go to Administration'
,p_branch_action=>'f?p=&APP_ID.:SETTINGS:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12179264608538588932)
,p_name=>'P57_WORKDAYS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12179264455834588931)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Workdays'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select eba_proj_fw.get_preference_value(''WORKDAYS'') dy',
'from dual'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dy as (',
'    select level x',
'    from dual',
'    connect by level <= 7',
')',
'select to_char(sysdate-to_number(to_char(sysdate,''D''))+dy.x,''Day'') d, dy.x r',
'from dy'))
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '7')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(12179264758250588934)
,p_validation_name=>'P57_WORKDAYS not null'
,p_validation_sequence=>10
,p_validation=>'P57_WORKDAYS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'At least one day must be a workday.'
,p_associated_item=>wwv_flow_imp.id(12179264608538588932)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12179264882858588935)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Workdays'
,p_process_sql_clob=>'eba_proj_fw.set_preference_value(''WORKDAYS'', :P57_WORKDAYS);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Workdays updated.'
,p_internal_uid=>12179264882858588935
);
wwv_flow_imp.component_end;
end;
/
