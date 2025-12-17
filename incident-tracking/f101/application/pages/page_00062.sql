prompt --application/pages/page_00062
begin
--   Manifest
--     PAGE: 00062
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
 p_id=>62
,p_name=>'Rename Application'
,p_page_mode=>'MODAL'
,p_step_title=>'Rename Application'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(3204235665975067375)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(3204234467922058482)
,p_help_text=>'<p>Use this to control the application name displayed on the top left of each page and on the login pages. By default, the application name is "Incident Tracking". The change will take effect immediately for the administrator making the change, but o'
||'ther users will only see the change when they get a new session (e.g. at next login).</p>'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1334930673547306103)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169348961051977)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1334931052842309941)
,p_plug_name=>'Rename Application'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>20
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1937677368319631146)
,p_plug_name=>'Information'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>'<p>Use this to control the application name displayed on the top left of each page and on the login pages.  By default, the application name is "&APP_NAME.".  The change will take effect immediately for the administrator making the change, but other '
||'users will only see the change when they get a new session (e.g. at next login).</p>'
,p_required_patch=>wwv_flow_imp.id(1074673254616582769)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1334931264270313296)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1334930673547306103)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1334931443969316831)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1334930673547306103)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1334932661031354007)
,p_branch_action=>'f?p=&APP_ID.:settings:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(1334931443969316831)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(172050432185075647)
,p_name=>'P62_APPLICATION_SUBTITLE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1334931052842309941)
,p_prompt=>'Application Subtitle'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select preference_value',
'from eba_intrack_preferences',
'where preference_name = ''APPLICATION_SUBTITLE''',
'union all',
'select ''Track and Manage Incidents''',
'from dual',
'where not exists ( select null',
'                   from eba_intrack_preferences',
'                   where preference_name = ''APPLICATION_SUBTITLE'')'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(290774390504242035)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1334931848979329222)
,p_name=>'P62_APPLICATION_TITLE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1334931052842309941)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Application Name'
,p_source=>'nvl(:APPLICATION_TITLE, :APP_NAME)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(290774390504242035)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(318128154019731277)
,p_name=>'CNX'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1334931264270313296)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(318128216354731278)
,p_event_id=>wwv_flow_imp.id(318128154019731277)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1334932366872351907)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Application Title'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':APPLICATION_TITLE := :P62_APPLICATION_TITLE;',
'',
'merge into eba_intrack_preferences dst',
'using ( select ''APPLICATION_TITLE'' preference_name, :P62_APPLICATION_TITLE preference_value from dual ) src',
'on ( dst.preference_name = src.preference_name )',
'when matched then',
'    update set dst.preference_value = src.preference_value',
'when not matched then',
'    insert ( preference_name, preference_value )',
'    values ( src.preference_name, src.preference_value );',
'',
'merge into eba_intrack_preferences dst',
'using ( select ''APPLICATION_SUBTITLE'' preference_name, :P62_APPLICATION_SUBTITLE preference_value from dual ) src',
'on ( dst.preference_name = src.preference_name )',
'when matched then',
'    update set dst.preference_value = src.preference_value',
'when not matched then',
'    insert ( preference_name, preference_value )',
'    values ( src.preference_name, src.preference_value );',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1334931443969316831)
,p_process_success_message=>'Application renamed.'
,p_internal_uid=>1334932366872351907
);
wwv_flow_imp.component_end;
end;
/
