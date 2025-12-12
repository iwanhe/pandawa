prompt --application/pages/page_00042
begin
--   Manifest
--     PAGE: 00042
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
 p_id=>42
,p_name=>'Application Settings'
,p_page_mode=>'MODAL'
,p_step_title=>'Application Settings'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486086019073759)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_dialog_height=>'600'
,p_help_text=>'<p>The preferences on this page are used to affect several aspects of the application. Click the item-level help icons to learn what each preference does.</p>'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(372129275858594489)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672347163384369864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3473895307713047489)
,p_plug_name=>'Application Settings'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3473895467807047490)
,p_plug_name=>'Project Settings'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3473895565055047491)
,p_plug_name=>'Menu Settings'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3923508743259701350)
,p_plug_name=>'Region Display Selector'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1993405599699027906)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'SESSION')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4270248883069215370)
,p_plug_name=>'Help Settings'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5871348694338927464)
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
 p_id=>wwv_flow_imp.id(5871347907238927456)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(372129275858594489)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5871347691762927454)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(372129275858594489)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5871349288817927470)
,p_branch_action=>'f?p=&APP_ID.:settings:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5871347907238927456)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1546054360373664976)
,p_name=>'P42_MILESTONE_SORT_ORDER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(3473895467807047490)
,p_item_default=>'END'
,p_prompt=>'Sort Milestones By'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(preference_value,''END'')',
'from eba_proj_preferences',
'where preference_name = ''MILESTONE_SORT_ORDER'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This preference controls the ordering of milestones.</p>',
'<ul>',
'    <li><B>By Start Date:</B> Milestones will be sorted by when they begin; a long-running milestone that starts before a shorter one will be listed first, even if the shorter one is due earlier.</li>',
'    <li><B>By Due Date:</B> Milestones will be sorted by when they are due; a long-running milestone that ends after a shorter one will be listed first, even if the shorter one started later.</li>',
'</ul>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'Due Date',
  'off_value', 'END',
  'on_label', 'Start Date',
  'on_value', 'START',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2661937227089730471)
,p_name=>'P42_CAT_TITLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(3473895307713047489)
,p_item_default=>'Category'
,p_prompt=>'Category Title (Singular Form)'
,p_source=>'replace(eba_proj_fw.get_preference_value(''CAT_TITLE''),''Preference does not exist'',''Category'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'By default projects can be assigned to various "Categories". If you would prefer to label "Categories" as something else, enter the singular form of that word here.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2661937376567730472)
,p_name=>'P42_CAT_TITLE_PL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(3473895307713047489)
,p_item_default=>'Categories'
,p_prompt=>'Categories Title (Plural Form)'
,p_source=>'replace(eba_proj_fw.get_preference_value(''CAT_TITLE_PL''),''Preference does not exist'',''Categories'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'By default projects can be assigned to various "Categories". If you would prefer to label "Categories" as something else, enter the plural form of that word here.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3923507907085701342)
,p_name=>'P42_CUSTOM_LINK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3473895565055047491)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Include Custom Menu Entry'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if eba_proj_fw.get_preference_value(''CUSTOM_MENU'') = ''Preference does not exist'' then',
'    return ''N'';',
'else',
'    return ''Y'';',
'end if;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3923508078785701343)
,p_name=>'P42_CUSTOM_MENU'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3473895565055047491)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Custom Menu Title'
,p_source=>'replace(eba_proj_fw.get_preference_value(''CUSTOM_MENU''),''Preference does not exist'',null)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(639523678332439146)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3923508173495701344)
,p_name=>'P42_CUSTOM_MENU_URL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(3473895565055047491)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Menu URL'
,p_source=>'replace(eba_proj_fw.get_preference_value(''CUSTOM_MENU_URL''),''Preference does not exist'',null)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(639523678332439146)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'URL',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3923508249156701345)
,p_name=>'P42_CUSTOM_MENU_ICON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(3473895565055047491)
,p_use_cache_before_default=>'NO'
,p_item_default=>'fa-cloud'
,p_prompt=>'Icon'
,p_source=>'replace(eba_proj_fw.get_preference_value(''CUSTOM_MENU_ICON''),''Preference does not exist'',null)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'CUSTOM_MENU_ICONS'
,p_lov=>'.'||wwv_flow_imp.id(4028404581045797911)||'.'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '8',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3923508857529701351)
,p_name=>'P42_CREATE_CATEGORIES'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(3473895467807047490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'&CAT_TITLE. Creation'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select preference_value',
'from eba_proj_preferences',
'where preference_name = ''CATEGORY_CREATION_LEVEL''',
'union all',
'select ''CONTRIB'' preference_value',
'from dual',
'where not exists (  select null',
'                    from eba_proj_preferences',
'                    where preference_name = ''CATEGORY_CREATION_LEVEL''',
')'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Use this to control whether contributors can create new &CAT_TITLE_PL. during project creation/editing, or if that should be done only by administrators.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'Contributors',
  'off_value', 'CONTRIB',
  'on_label', 'Administrators Only',
  'on_value', 'ADMIN',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3923509038076701353)
,p_name=>'P42_CUSTOM_MENU_WARN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(3473895565055047491)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notice'
,p_source=>'Please note that setting the custom menu icon to "Home" will change the icon for the "Projects" menu.'
,p_source_type=>'STATIC'
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
 p_id=>wwv_flow_imp.id(4270248937147215371)
,p_name=>'P42_HELP_ALT_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(4270248883069215370)
,p_prompt=>'Secondary Help URL'
,p_source=>'replace(eba_proj_fw.get_preference_value( ''HELP_VIDEO_URL'' ),''Preference does not exist'',null)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Enter the URL to the video that shows end-users how to use the application.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4270249870445215380)
,p_name=>'P42_HELP_ALT_LINK_TEXT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(4270248883069215370)
,p_item_default=>'&APP_TITLE. Video Tutorial'
,p_prompt=>'Secondary Help Link Text'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Enter the text that end-users will click on to navigate to the URL (defined above).'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5871348083875927456)
,p_name=>'P42_APPLICATION_TITLE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3473895307713047489)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&APP_NAME.'
,p_prompt=>'Application Name'
,p_source=>'&APPLICATION_TITLE.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(639523678332439146)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'<p>The text entered here is used throughout the application, most notably, in the upper left-hand corner of every page. By default, the application name is "P-Track". The change will take effect immediately for the administrator making the change, bu'
||'t other users will only see the change when they get a new session (e.g. at next login).</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6590736085657310532)
,p_name=>'P42_APPLICATION_SUBTITLE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3473895307713047489)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Collaboratively track projects, milestones, and action items.'
,p_prompt=>'Application Subtitle'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select preference_value',
'from eba_proj_preferences',
'where preference_name = ''APPLICATION_SUBTITLE''',
'union all',
'select ''Collaboratively track projects, milestones, and action items.''',
'from dual',
'where not exists ( select null',
'                   from eba_proj_preferences',
'                   where preference_name = ''APPLICATION_SUBTITLE'')'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(639523678332439146)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'<p>The text entered here is displayed under the application name on the home page of the application.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15711647230828245136)
,p_name=>'P42_APPLICATION_DISCLAIMER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(3473895307713047489)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Application Footer'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select preference_value',
'from eba_proj_preferences',
'where preference_name = ''DISCLAIMER_TEXT'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>The text entered here is displayed at the bottom of every page in the application and in all emails sent by this application.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17204382564308832155)
,p_name=>'P42_FEEDBACK_RECIPIENTS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(3473895307713047489)
,p_prompt=>'Feedback Recipients'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if eba_proj_fw.get_preference_value(p_preference_name  => ''FEEDBACK_RECIPIENTS'') = ''Preference does not exist'' then',
'    return null;',
'else',
'    return eba_proj_fw.get_preference_value(p_preference_name  => ''FEEDBACK_RECIPIENTS'');',
'end if;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>Provide a comma-separated list of the email addresses you would like feedback submissions emailed to. When feedback is submitted, the feedback will be emailed to the addresses in this list.</p>'
,p_inline_help_text=>'<a href="f?p=&APP_ID.:203:&APP_SESSION.">Review/Manage Feedback</a>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17985306271284865733)
,p_name=>'P42_MOST_IMPORTANT_ROLE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(3473895467807047490)
,p_prompt=>'Most Important Project Role'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select preference_value',
'from eba_proj_preferences',
'where preference_name = ''MOST_IMPORTANT_PROJECT_ROLE'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_lov_cascade_parent_items=>'P42_PJCT_CREATE_REQ_AUTH_ROLE'
,p_ajax_items_to_submit=>'P42_PJCT_CREATE_REQ_AUTH_ROLE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'<p>Only the email addresses of project members assigned to the role that''s selected here will be displayed in the "cards" view of the application home page.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19741811653812499815)
,p_name=>'P42_DEFAULT_PROJECT_ACL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3473895467807047490)
,p_item_default=>'1'
,p_prompt=>'Default Project Access Control Level'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select preference_value',
'from eba_proj_preferences',
'where preference_name = ''DEFAULT_PROJECT_ACL'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>Select the access control level that the majority of projects will use in this application. The value selected here will be used for all new projects'' access control level value.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'Restricted - Only Accessible by Associated People',
  'off_value', '3',
  'on_label', 'Open',
  'on_value', '1',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19741811880877499817)
,p_name=>'P42_PROJECT_ROWKEY_OPTION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(3473895467807047490)
,p_item_default=>'ROWKEY'
,p_prompt=>'Project Breadcrumb Display Options'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select preference_value',
'from eba_proj_preferences',
'where preference_name = ''PROJECT_ROWKEY_OPTION'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'PROJECT ROWKEY OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(19743665795053002032)||'.'
,p_lov_cascade_parent_items=>'P42_PJCT_CREATE_REQ_AUTH_ROLE'
,p_ajax_items_to_submit=>'P42_PJCT_CREATE_REQ_AUTH_ROLE'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'<p>This preference determines if a project''s system-generated unique identifier should be displayed or not. If the "Project Code Names" build option has been enabled and there are existing projects with assigned code names then the "Show Project Code'
||' Name" option will also be available for selection here.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19741815881419499857)
,p_name=>'P42_DEFAULT_RESTRICT_CHANGES'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(3473895467807047490)
,p_item_default=>'N'
,p_prompt=>'Default Project Restrict Changes Value'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select preference_value',
'from eba_proj_preferences',
'where preference_name = ''DEFAULT_PJCT_RESTRICT_CHANGES'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(16868356519761892930)
,p_help_text=>'<p>Select the "Restrict Changes" value that the majority of projects will use in this application. The value selected here will be used for all new projects'' "Restrict Changes" value.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20043308289019787338)
,p_name=>'P42_PJCT_CREATE_REQ_AUTH_ROLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3473895467807047490)
,p_prompt=>'Minimum Project Creation Role'
,p_source=>'replace(eba_proj_fw.get_preference_value( ''PROJECT_CREATE_REQ_AUTH_ROLE'' ),''Preference does not exist'',''CONTRIBUTORS'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'PROJECT CREATION ROLES'
,p_lov=>'.'||wwv_flow_imp.id(20354645645213395392)||'.'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Select the minimum application role required for an end-user to create a project in this application.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(4270249916483215381)
,p_validation_name=>'Verify Help Video URL'
,p_validation_sequence=>10
,p_validation=>'return eba_proj_fw.check_url(:P42_HELP_ALT_URL)'
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'The secondary help URL entered is not valid. Please enter a valid website url to continue. If you try to navigate to the url in a browser and it works fine, ensure the site didn''t redirect from http:// to https:// after the page loaded. If you notice'
||' that happened, then change your URL to https:// here and everything should work.'
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_lstnr_ver varchar2(30);',
'    l_html_clob clob;',
'begin',
'    select owa_util.get_cgi_env(''APEX_LISTENER_VERSION'') into l_lstnr_ver from dual;',
'',
'    -- If ORDS is configured, check to see if https GET requests can be collected (this means an Oracle Wallet has been configured)',
'    if l_lstnr_ver is not null then',
'        begin',
'            select apex_web_service.make_rest_request(',
'                       p_url => ''https://www.oracle.com/'', ',
'                       p_http_method => ''GET'' ) ',
'              into l_html_clob',
'              from dual;',
'        exception',
'          when others then',
'            l_html_clob := null;',
'        end;',
'    end if;',
'',
'    -- If the end-user provided a url and ORDS is active and an Oracle Wallet has been configured, ',
'    -- then go ahead and check to see if the url the end-user entered is a real website',
'    -- otherwise don''t run this URL validation at all - just use whatever URL they provided',
'    if :P42_HELP_ALT_URL is not null and l_html_clob is not null then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'FUNCTION_BODY'
,p_when_button_pressed=>wwv_flow_imp.id(5871347907238927456)
,p_associated_item=>wwv_flow_imp.id(4270248937147215371)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(4270250378694215385)
,p_validation_name=>'Link Text Not Null if URL Provided'
,p_validation_sequence=>20
,p_validation=>'P42_HELP_ALT_LINK_TEXT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value when alternate help URL has been provided.'
,p_validation_condition=>'P42_HELP_ALT_URL'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(5871347907238927456)
,p_associated_item=>wwv_flow_imp.id(4270249870445215380)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3923508319265701346)
,p_name=>'Show/Hide Custom Menu Details'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_CUSTOM_LINK'
,p_condition_element=>'P42_CUSTOM_LINK'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3923508427839701347)
,p_event_id=>wwv_flow_imp.id(3923508319265701346)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_CUSTOM_MENU,P42_CUSTOM_MENU_URL,P42_CUSTOM_MENU_ICON'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3923508572703701348)
,p_event_id=>wwv_flow_imp.id(3923508319265701346)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_CUSTOM_MENU,P42_CUSTOM_MENU_URL,P42_CUSTOM_MENU_ICON'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3923509131120701354)
,p_name=>'Show/Hide Icon Warning'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_CUSTOM_MENU_ICON'
,p_condition_element=>'P42_CUSTOM_MENU_ICON'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'fa-home'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3923509238996701355)
,p_event_id=>wwv_flow_imp.id(3923509131120701354)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_CUSTOM_MENU_WARN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3923509362651701356)
,p_event_id=>wwv_flow_imp.id(3923509131120701354)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_CUSTOM_MENU_WARN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(400619954983487170)
,p_name=>'CNX'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5871347691762927454)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(400620080303487171)
,p_event_id=>wwv_flow_imp.id(400619954983487170)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5871349014102927467)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Preferences'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':APPLICATION_TITLE := :P42_APPLICATION_TITLE;',
'',
'eba_proj_fw.set_preference_value(''CAT_TITLE_PL'', :P42_CAT_TITLE_PL);',
':CAT_TITLE_PL := eba_proj_fw.get_preference_value(''CAT_TITLE_PL'');',
'eba_proj_fw.set_preference_value(''CAT_TITLE'', :P42_CAT_TITLE);',
':CAT_TITLE := eba_proj_fw.get_preference_value(''CAT_TITLE'');',
'',
'eba_proj_fw.set_preference_value(''CAT_TITLE_PL_LC'', lower(:P42_CAT_TITLE_PL));',
':CAT_TITLE_PL_LC := eba_proj_fw.get_preference_value(''CAT_TITLE_PL_LC'');',
'eba_proj_fw.set_preference_value(''CAT_TITLE_LC'', lower(:P42_CAT_TITLE));',
':CAT_TITLE_LC := eba_proj_fw.get_preference_value(''CAT_TITLE_LC'');',
'',
'eba_proj_fw.set_preference_value( ''APPLICATION_TITLE'',             :P42_APPLICATION_TITLE );',
'eba_proj_fw.set_preference_value( ''APPLICATION_SUBTITLE'',          :P42_APPLICATION_SUBTITLE );',
'eba_proj_fw.set_preference_value( ''DEFAULT_PROJECT_ACL'',           :P42_DEFAULT_PROJECT_ACL );',
'eba_proj_fw.set_preference_value( ''DEFAULT_PJCT_RESTRICT_CHANGES'', :P42_DEFAULT_RESTRICT_CHANGES );',
'eba_proj_fw.set_preference_value( ''PROJECT_ROWKEY_OPTION'',         :P42_PROJECT_ROWKEY_OPTION );',
'eba_proj_fw.set_preference_value( ''MILESTONE_SORT_ORDER'',          :P42_MILESTONE_SORT_ORDER );',
'eba_proj_fw.set_preference_value( ''MOST_IMPORTANT_PROJECT_ROLE'',   :P42_MOST_IMPORTANT_ROLE );',
'eba_proj_fw.set_preference_value( ''DISCLAIMER_TEXT'',               :P42_APPLICATION_DISCLAIMER );',
'eba_proj_fw.set_preference_value( ''FEEDBACK_RECIPIENTS'',           :P42_FEEDBACK_RECIPIENTS );',
'eba_proj_fw.set_preference_value( ''PROJECT_CREATE_REQ_AUTH_ROLE'',  :P42_PJCT_CREATE_REQ_AUTH_ROLE );',
'eba_proj_fw.set_preference_value( ''HELP_ALT_URL'',                  :P42_HELP_ALT_URL );',
'eba_proj_fw.set_preference_value( ''HELP_ALT_LINK_TEXT'',            :P42_HELP_ALT_LINK_TEXT );',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5871347907238927456)
,p_process_success_message=>'Application settings updated.'
,p_internal_uid=>5871349014102927467
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3923508626164701349)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Custom Menu'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P42_CUSTOM_LINK = ''Y'' and :P42_CUSTOM_MENU is not null and :P42_CUSTOM_MENU_URL is not null then',
'    eba_proj_fw.set_preference_value( ''CUSTOM_MENU'',      :P42_CUSTOM_MENU );',
'    eba_proj_fw.set_preference_value( ''CUSTOM_MENU_URL'',  :P42_CUSTOM_MENU_URL );',
'    eba_proj_fw.set_preference_value( ''CUSTOM_MENU_ICON'', :P42_CUSTOM_MENU_ICON );',
'else',
'    delete from eba_proj_preferences',
'    where preference_name in ( ''CUSTOM_MENU'', ''CUSTOM_MENU_URL'', ''CUSTOM_MENU_ICON'' );',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>3923508626164701349
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3923508959464701352)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Category Creation Pref'
,p_process_sql_clob=>'eba_proj_fw.set_preference_value( ''CATEGORY_CREATION_LEVEL'', :P42_CREATE_CATEGORIES );'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>3923508959464701352
);
wwv_flow_imp.component_end;
end;
/
