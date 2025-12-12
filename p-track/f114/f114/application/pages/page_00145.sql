prompt --application/pages/page_00145
begin
--   Manifest
--     PAGE: 00145
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
 p_id=>145
,p_tab_set=>'TS1'
,p_name=>'Assign Flexible Column - Form Element'
,p_step_title=>'Assign Flexible Column - Form Element'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/**',
' * askConfirm function',
' * Displays a JavaScript confirm dialog with the specified text',
' * */',
'da.askConfirm = function() {',
'    if ( !confirm( this.action.attribute01 ) ) {',
'',
'        // Don''t continue with dynamic actions',
'',
'        /* Set cancel flag in the apex.event namespace to true. This value can be used to cancel subsequent',
'           processing, such as in page submission to stop the page from being submitted. */',
'        apex.event.gCancelFlag = true;',
'',
'        /* Set cancel actions flag in dynamic action namespace to true. This value is used in dynamic',
'           actions processing to stop further actions firing. */',
'        da.gCancelActions = true; ',
'        ',
'    }',
'}; // askConfirm'))
,p_step_template=>wwv_flow_imp.id(6672316913709369812)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_nav_list_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'<p>Select the form element type that will capture the &P144_FLEX_COLUMN. flexible column data. The Number Field and Date Picker form elements have an optional format mask parameter. The Select List form element requires a "Static LOV" or "Dynamic LOV'
||'" definition. If "Dynamic LOV" is selected, you will have to supply a SQL query that returns display and return values. If "Static LOV" is selected, you will define the static list options on the next page.</p>'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6143656511469091888)
,p_plug_name=>'About'
,p_region_css_classes=>'infoTextRegion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayCurrentLabelOnly'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_plug_source=>'<p>Select the form element type that will capture the &P144_FLEX_COLUMN. flexible column data. The Number Field and Date Picker form elements have an optional format mask parameter. The Select List form element requires a "Static LOV" or "Dynamic LOV'
||'" definition. If "Dynamic LOV" is selected, you will have to supply a SQL query that returns display and return values. If "Static LOV" is selected, you will define the static list options on the next page.</p>'
,p_list_template_id=>wwv_flow_imp.id(6672376162491369936)
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
 p_id=>wwv_flow_imp.id(6143656682282091888)
,p_plug_name=>'Create Flex Field Train'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_imp.id(6672360960782369894)
,p_plug_display_sequence=>10
,p_list_id=>wwv_flow_imp.id(6143634101570069465)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6672376162491369936)
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6143652801346091882)
,p_plug_name=>'Settings'
,p_parent_plug_id=>wwv_flow_imp.id(6143656682282091888)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6143658108215091895)
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
 p_id=>wwv_flow_imp.id(6143657309970091894)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6143656682282091888)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6143657511916091894)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6143656682282091888)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Previous'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6143657098388091891)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6143656682282091888)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6143661493484091898)
,p_branch_name=>'Go to Static LOV setup'
,p_branch_action=>'f?p=&APP_ID.:146:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6143657309970091894)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P145_FORM_ELEMENT_TYPE = ''SELECT_LIST'' and :P145_LOV_TYPE = ''STATIC'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6143661700150091898)
,p_branch_name=>'Go to Confirm'
,p_branch_action=>'f?p=&APP_ID.:147:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6143657309970091894)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6143661890267091898)
,p_branch_action=>'f?p=&APP_ID.:144:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6143657511916091894)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143652998017091882)
,p_name=>'P145_FORM_ELEMENT_TYPE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6143652801346091882)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if instr(:P144_FLEX_COLUMN,''FLEX_D'') > 0 then',
'    return ''DATE'';',
'elsif instr(:P144_FLEX_COLUMN,''FLEX_CLOB'') > 0 then',
'    return ''TEXTAREA'';',
'end if;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Form Element Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'FLEX_FIELD_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Date Picker'' dv, ''DATE'' rv',
'from dual',
'where -- Only date columns',
'    instr(:P144_FLEX_COLUMN,''FLEX_D'') > 0',
'union all',
'select ''Large Text Input Field (Text Area)'' dv, ''TEXTAREA'' rv',
'from dual',
'where -- CLOB and varchar2 columns',
'    instr(:P144_FLEX_COLUMN,''FLEX_CLOB'') > 0',
'    or instr(:P144_FLEX_COLUMN,''FLEX_0'') > 0',
'union all',
'select ''Number Field'' dv, ''NUMBER'' rv',
'from dual',
'where -- Only number columns',
'    instr(:P144_FLEX_COLUMN,''FLEX_N'') > 0',
'union all',
'select ''Select List'' dv, ''SELECT_LIST'' rv',
'from dual',
'where -- Only number and varchar2 columns',
'    instr(:P144_FLEX_COLUMN,''FLEX_0'') > 0',
'    or instr(:P144_FLEX_COLUMN,''FLEX_N'') > 0',
'union all',
'select ''Text Field'' dv, ''TEXT'' rv',
'from dual',
'where -- Only varchar2 columns',
'    instr(:P144_FLEX_COLUMN,''FLEX_0'') > 0'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'This field identifies the type of form element that will be used in application forms to capture the data that will be stored in your flex column. If you chose a date flex column on the previous page, then the form element will be a Date Picker. If y'
||'ou chose a number flex column on the previous page, then your form element will be either a select list or a number field. etc...'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143653504112091886)
,p_name=>'P145_FORMAT_MASK'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6143652801346091882)
,p_prompt=>'Format Mask'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'This field allows you to supply a format mask to a Date Picker and/or a Number Field form element.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143653994302091886)
,p_name=>'P145_WIDTH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6143652801346091882)
,p_item_default=>'30'
,p_format_mask=>'9999999'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'This field defines the width of the form element for this flex column. This field defaults to 30 for all form elements except text areas. Text areas default to 80.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143654507808091886)
,p_name=>'P145_MAX_WIDTH'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6143652801346091882)
,p_item_default=>'4000'
,p_format_mask=>'9999999'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'This field defines the maximum width of the form element for this flex column. This field defaults to 4000 for all form elements.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143654987512091887)
,p_name=>'P145_HEIGHT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6143652801346091882)
,p_item_default=>'1'
,p_format_mask=>'9999999'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'This field defines the height of the form element for this flex column. This field defaults to 1 for all form elements except text areas. Text areas default to 5.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143655499886091887)
,p_name=>'P145_LOV_QUERY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6143652801346091882)
,p_prompt=>'Select List Query'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The select list query for a flex column must select a display and a return value and resemble this construct:',
'<br><br>',
'<pre>',
'select ename d, empno r',
'from   emp',
'order by 1',
'</pre>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143656014666091888)
,p_name=>'P145_LOV_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6143652801346091882)
,p_item_default=>'STATIC'
,p_prompt=>'Select List Type'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'FLEX_LOV_TYPE'
,p_lov=>'.'||wwv_flow_imp.id(6143622687220059778)||'.'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Choose whether your "List of Values" (LOV) is defined by a static list or a dynamic SQL query.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6196958106222408009)
,p_name=>'P145_LOV_DISPLAY_COL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6143652801346091882)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6196958302556409748)
,p_name=>'P145_LOV_RETURN_COL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6143652801346091882)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6143658483220091895)
,p_validation_name=>'P145_LOV_QUERY Valid'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_disp_col varchar2(30);',
'    l_ret_col  varchar2(30);',
'    l_error    varchar2(4000);',
'begin',
'    if eba_proj_flex_fw.validate_lov_query( :P145_LOV_QUERY,',
'                l_disp_col, l_ret_col, l_error ) then',
'        :P145_LOV_DISPLAY_COL := l_disp_col;',
'        :P145_LOV_RETURN_COL  := l_ret_col;',
'        return null;',
'    else',
'        return l_error;',
'    end if;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P145_LOV_TYPE'
,p_validation_condition2=>'DYNAMIC'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(6143657309970091894)
,p_associated_item=>wwv_flow_imp.id(6143655499886091887)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6143658607718091895)
,p_name=>'Show/Hide Format Mask'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P145_FORM_ELEMENT_TYPE'
,p_condition_element=>'P145_FORM_ELEMENT_TYPE'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'DATE,NUMBER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143658891818091897)
,p_event_id=>wwv_flow_imp.id(6143658607718091895)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P145_FORMAT_MASK'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143659082792091897)
,p_event_id=>wwv_flow_imp.id(6143658607718091895)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P145_FORMAT_MASK'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197858994167121401)
,p_event_id=>wwv_flow_imp.id(6143658607718091895)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P145_LOV_QUERY'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6143659192699091897)
,p_name=>'Change width/height for textarea'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P145_FORM_ELEMENT_TYPE'
,p_condition_element=>'P145_FORM_ELEMENT_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'TEXTAREA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143659494751091897)
,p_event_id=>wwv_flow_imp.id(6143659192699091897)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P145_WIDTH'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'80'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143659685277091897)
,p_event_id=>wwv_flow_imp.id(6143659192699091897)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P145_WIDTH'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'30'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143659889258091897)
,p_event_id=>wwv_flow_imp.id(6143659192699091897)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P145_HEIGHT'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'5'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143660084825091897)
,p_event_id=>wwv_flow_imp.id(6143659192699091897)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P145_HEIGHT'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'1'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6143660186681091897)
,p_name=>'Show/Hide LOV Type'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P145_FORM_ELEMENT_TYPE'
,p_condition_element=>'P145_FORM_ELEMENT_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SELECT_LIST'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197859186188125059)
,p_event_id=>wwv_flow_imp.id(6143660186681091897)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P145_LOV_TYPE'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'STATIC'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143660513445091897)
,p_event_id=>wwv_flow_imp.id(6143660186681091897)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P145_LOV_TYPE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143660698642091897)
,p_event_id=>wwv_flow_imp.id(6143660186681091897)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P145_LOV_TYPE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6143660797096091897)
,p_name=>'Show/Hide Dynamic LOV Query Item'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P145_LOV_TYPE'
,p_condition_element=>'P145_LOV_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'DYNAMIC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143661099947091897)
,p_event_id=>wwv_flow_imp.id(6143660797096091897)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P145_LOV_QUERY'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143661301563091898)
,p_event_id=>wwv_flow_imp.id(6143660797096091897)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P145_LOV_QUERY'
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
