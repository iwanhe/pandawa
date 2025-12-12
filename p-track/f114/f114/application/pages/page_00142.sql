prompt --application/pages/page_00142
begin
--   Manifest
--     PAGE: 00142
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
 p_id=>142
,p_name=>'Edit Flex Column'
,p_step_title=>'Edit Flex Column'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_protection_level=>'C'
,p_help_text=>'Edit the flex column assignment''s attributes on this page. Be sure to provide data for all required fields. Click the <strong>Apply Changes</strong> button to save your changes. Click the <strong>Unassign</strong> button to remove this assignment. Cl'
||'ick the <strong>Cancel</strong> button to return to the flex column details page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6143596707029059722)
,p_plug_name=>'Flex Column Attributes'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6143608697072059747)
,p_name=>'Static Select List Options'
,p_parent_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_template=>wwv_flow_imp.id(6672353576565369876)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'    display_sequence,',
'    display_value,',
'    return_value,',
'    ''Edit'' as edit',
'from eba_proj_flex_static_lovs',
'where flex_table = :P142_FLEXIBLE_TABLE',
'    and flex_column = :P142_FLEXIBLE_COLUMN',
'order by 1'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143608894711059748)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143609011586059748)
,p_query_column_id=>2
,p_column_alias=>'DISPLAY_SEQUENCE'
,p_column_display_sequence=>3
,p_column_heading=>'DISPLAY_SEQUENCE'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143609106335059748)
,p_query_column_id=>3
,p_column_alias=>'DISPLAY_VALUE'
,p_column_display_sequence=>4
,p_column_heading=>'DISPLAY_VALUE'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143609214924059748)
,p_query_column_id=>4
,p_column_alias=>'RETURN_VALUE'
,p_column_display_sequence=>5
,p_column_heading=>'RETURN_VALUE'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143609289363059748)
,p_query_column_id=>5
,p_column_alias=>'EDIT'
,p_column_display_sequence=>2
,p_column_heading=>'&nbsp;'
,p_column_link=>'javascript:$s(''P142_EDIT_DISPLAY_SEQUENCE'',''#DISPLAY_SEQUENCE#'');$s(''P142_EDIT_DISPLAY_VALUE'',''#DISPLAY_VALUE#'');$s(''P142_EDIT_RETURN_VALUE'',''#RETURN_VALUE#'');$s(''P142_EDIT_OPTION_ID'',''#ID#'');openModal(''editListOption'');document.forms[0].P142_EDIT_DI'
||'SPLAY_VALUE.focus();'
,p_column_linktext=>'#EDIT#'
,p_column_link_attr=>'class="t-Button t-Button--primary" title="#EDIT#"'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6143609789533059748)
,p_plug_name=>'Edit Static List Option'
,p_region_name=>'editListOption'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_plug_template=>wwv_flow_imp.id(6672356708893369886)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>500
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6143611601694059756)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6143609993408059749)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6143609789533059748)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:closeModal();'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6143609400883059748)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6143608697072059747)
,p_button_name=>'ADD_LIST_OPTION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Add a List Option'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:openModal(''editListOption'');document.forms[0].P142_EDIT_DISPLAY_VALUE.focus();'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6143597090663059726)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6143610184621059749)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6143609789533059748)
,p_button_name=>'DELETE_LIST_OPTION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Delete'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE_LIST_OPTION'');'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6143597293680059729)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Unassign'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P142_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6143596899225059725)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P142_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6143610401709059749)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6143609789533059748)
,p_button_name=>'SAVE_LIST_OPTION'
,p_button_static_id=>'SLO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save List Option'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6143618182569059767)
,p_branch_name=>'Static List Option Action'
,p_branch_action=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.:P142_ID:&P142_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_NOT_IN_CONDITION'
,p_branch_condition=>'SAVE:DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6143618010718059767)
,p_branch_action=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143597485346059730)
,p_name=>'P142_LABEL_TEMPLATE_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Label Template'
,p_source=>'LABEL_TEMPLATE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LABEL_TEMPLATES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select template_name || '' ('' || decode(theme_number, 50, ''Mobile Theme'', 42, ''Desktop Theme'') || '')''  dv,',
'    label_template_id rv',
'from apex_application_temp_label',
'where application_id = :APP_ID',
'and theme_number in (select u.theme_number',
'                     from apex_application_themes t, apex_appl_user_interfaces u',
'                     where t.ui_type_id = u.ui_type_id',
'                     and t.application_id = u.application_id',
'                     and t.application_id = :APP_ID',
'                     and u.ui_type_name = ''DESKTOP'')',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Select the label template that the label text for this flex column should use. This value is unassigned by default.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143598014093059733)
,p_name=>'P142_HELP_TEXT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Help Text'
,p_source=>'HELP_TEXT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'This field should be filled-in with text that will help the end-user better understand what data is being stored in the flex column. It should only be filled-in if you''ve selected a label template that includes help text.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143598495564059734)
,p_name=>'P142_FORMAT_MASK'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Format Mask'
,p_source=>'FORMAT_MASK'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6143598987224059734)
,p_name=>'P142_LABEL_ALIGNMENT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_item_default=>'RIGHT'
,p_source=>'LABEL_ALIGNMENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Select the label alignment that this flex column''s label text will use in application forms. Currently only Right, Right-Top, Right-Center, and Right-Bottom are offered. This value is set to ''Right'' by default.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143599507645059734)
,p_name=>'P142_RPT_LABEL_TEXT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Report Label Text'
,p_source=>'REPORT_LABEL_TEXT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Enter the label text that will appear as the report''s column heading for this flex column. If this field is left blank, reports will use the form label text by default.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143599989165059736)
,p_name=>'P142_FLEXIBLE_COLUMN'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flexible Column'
,p_source=>'FLEXIBLE_COLUMN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'FLEX_COLUMNS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct c.column_name|| '' - ''||c.data_type||',
'    decode(c.data_type,''VARCHAR2'',''(''||c.data_length||'')'',null) as dv,',
'    c.column_name as rv',
'from sys.all_tab_columns c,',
'    eba_proj_flex_registry f',
'where c.table_name = :P142_FLEXIBLE_TABLE',
'    and c.column_name = f.flexible_column (+)',
'    and nvl(f.active_yn,''N'') = ''N''',
'    and lower(c.column_name) like ''%flex%''',
'    and instr(c.table_name,''FLEX'') = 0',
'order by 1',
''))
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'The options in this select list consist of all unassigned flex columns in the data source that was selected above.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143600495076059736)
,p_name=>'P142_ACTIVE_YN'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Is Active'
,p_source=>'ACTIVE_YN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Choose whether or not this flex column should be displayed and used in this application. Selecting, ''No'' will prevent this flex field from displaying in forms and reports that are based on this flex field''s data source. This value is set to ''Yes'' by '
||'default.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143600998509059736)
,p_name=>'P142_ATTRIBUTE_LABEL'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Form Label Text'
,p_source=>'FORM_LABEL_TEXT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Enter the label text that will be displayed on forms that capture the data that is stored in this flex column.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143601505524059737)
,p_name=>'P142_IS_REQUIRED_YN'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Is Required'
,p_source=>'IS_REQUIRED_YN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Choose whether this flex column can be left null or not. Selecting, ''No'' will allow forms that update this flex column''s value to accept null. Selecting, ''Yes'' will force the end-user to provide data for this flex column. This value is unassigned by '
||'default.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143601982501059737)
,p_name=>'P142_DISPLAY_AS'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Display As'
,p_source=>'DISPLAY_AS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'P142_FLEX_DATA_TYPES'
,p_lov=>'.'||wwv_flow_imp.id(6143620889553059777)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'This field identifies the type of form element that will be used in application forms to capture the data that will be stored in your flex column. If you chose a date flex column on the previous page, then the form element will be a Date Picker. If y'
||'ou chose a number flex column on the previous page, then your form element will be either a select list or a number field. etc...'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143602483828059738)
,p_name=>'P142_LOV_SQL_QUERY'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'List of Values SQL Query'
,p_source=>'LOV_SQL_QUERY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cHeight=>4
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
 p_id=>wwv_flow_imp.id(6143603009432059738)
,p_name=>'P142_WIDTH'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_item_default=>'30'
,p_prompt=>'Width'
,p_format_mask=>'9999999'
,p_source=>'WIDTH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_cMaxlength=>7
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'This field defines the width of the form element for this flex column. This field defaults to 30 for all form elements except text areas. Text areas default to 80.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'min_value', '1',
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143603500322059738)
,p_name=>'P142_MAX_WIDTH'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_item_default=>'30'
,p_prompt=>'Max. Width'
,p_format_mask=>'9999999'
,p_source=>'MAX_WIDTH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_cMaxlength=>7
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'This field defines the maximum width of the form element for this flex column. This field defaults to 4000 for all form elements.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'min_value', '1',
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143603983504059739)
,p_name=>'P142_HEIGHT'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_prompt=>'Height'
,p_format_mask=>'9999999'
,p_source=>'HEIGHT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_cMaxlength=>7
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'This field defines the height of the form element for this flex column. This field defaults to 1 for all form elements except text areas. Text areas default to 5.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'min_value', '1',
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143604494185059739)
,p_name=>'P142_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143604692059059740)
,p_name=>'P142_FLEXIBLE_TABLE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flexible Data Store'
,p_source=>'FLEXIBLE_TABLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'FLEX_TABLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select f.display_name_plrl display_value,',
'    f.flexible_table return_value',
'from eba_proj_flex_registry f',
'where f.assigned_yn = ''N''',
'group by f.display_name_plrl, f.flexible_table',
'order by 1'))
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'The options listed here refer to the tables in the application that contain flex columns. These options typically correlate to tab names in the application.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143605211940059740)
,p_name=>'P142_IS_DISPLAYED_IN_IRR_YN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_source=>'IS_DISPLAYED_ON_IR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'If you want this flex column to be displayed in interactive reports, select ''Yes'', otherwise select ''No''. Remember that the ''Is Active'' column must also be set to ''Yes''.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143605712281059740)
,p_name=>'P142_LOV_TYPE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Select List Type'
,p_source=>'LOV_TYPE'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6143606185480059740)
,p_name=>'P142_RPT_HDR_ALIGNMENT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_item_default=>'CENTER'
,p_prompt=>'Report Heading Alignment'
,p_source=>'RPT_HDR_ALIGNMENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'FLEX_HDR_ALIGNMENTS'
,p_lov=>'.'||wwv_flow_imp.id(6143623586916059780)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'This field is used to determine the alignment of the flex column''s heading text in various application reports. It''s options include  "Left", "Center", and "Right" and it is defaulted to "Center".'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143606705390059741)
,p_name=>'P142_DEFAULT_VALUE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Default Form Value'
,p_source=>'DEFAULT_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'This field holds the flex column''s default value that''s used in application forms that update this flex column''s value. You can enter up to 4,000 characters in this field. For example, this field should be set to ''Y'' or ''N'' for a Yes/No Select List w'
||'ith defined return values of ''Y'' and ''N''.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143610582530059749)
,p_name=>'P142_EDIT_DISPLAY_SEQUENCE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6143609789533059748)
,p_prompt=>'Display Sequence'
,p_format_mask=>'9999999'
,p_source=>'select max(display_sequence) + 10 from eba_proj_flex_static_lovs where flex_table = :P142_FLEXIBLE_TABLE and flex_column = :P142_FLEXIBLE_COLUMN;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_cMaxlength=>7
,p_tag_attributes=>'style="width: 100px;"'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143610782748059752)
,p_name=>'P142_EDIT_DISPLAY_VALUE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6143609789533059748)
,p_prompt=>'Display Value'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
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
 p_id=>wwv_flow_imp.id(6143610992531059752)
,p_name=>'P142_EDIT_RETURN_VALUE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6143609789533059748)
,p_prompt=>'Return Value'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
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
 p_id=>wwv_flow_imp.id(6143611213664059754)
,p_name=>'P142_EDIT_OPTION_ID'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6143609789533059748)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6196958910714451544)
,p_name=>'P142_LOV_DISPLAY_COL'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_source=>'LOV_DISPLAY_COL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6196959105969453730)
,p_name=>'P142_LOV_RETURN_COL'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6143596707029059722)
,p_use_cache_before_default=>'NO'
,p_source=>'LOV_RETURN_COL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(6143612185529059757)
,p_computation_sequence=>10
,p_computation_item=>'P142_IS_DISPLAYED_IN_IRR_YN'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>':P142_ACTIVE_YN'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6143612409416059757)
,p_validation_name=>'P142_LOV_TYPE Not Null'
,p_validation_sequence=>10
,p_validation=>'P142_LOV_TYPE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>'P142_DISPLAY_AS'
,p_validation_condition2=>'SELECT_LIST'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(6143596899225059725)
,p_associated_item=>wwv_flow_imp.id(6143605712281059740)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6143612599154059758)
,p_validation_name=>'P142_EDIT_DISPLAY_SEQUENCE Not Null'
,p_validation_sequence=>20
,p_validation=>'P142_EDIT_DISPLAY_SEQUENCE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>'P142_EDIT_OPTION_ID'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(6143610401709059749)
,p_associated_item=>wwv_flow_imp.id(6143610582530059749)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6143612792719059758)
,p_validation_name=>'P142_EDIT_DISPLAY_VALUE Not Null'
,p_validation_sequence=>30
,p_validation=>'P142_EDIT_DISPLAY_VALUE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>'P142_EDIT_OPTION_ID'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(6143610401709059749)
,p_associated_item=>wwv_flow_imp.id(6143610782748059752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6143612997192059758)
,p_validation_name=>'P142_EDIT_RETURN_VALUE Not Null'
,p_validation_sequence=>40
,p_validation=>'P142_EDIT_RETURN_VALUE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>'P142_EDIT_OPTION_ID'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(6143610401709059749)
,p_associated_item=>wwv_flow_imp.id(6143610992531059752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6193628112150582684)
,p_validation_name=>'P142_EDIT_RETURN_VALUE Numeric'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_num number;',
'begin',
'    l_num := to_number( :P142_EDIT_RETURN_VALUE );',
'    return true;',
'exception',
'    when others then',
'        return false;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL# must be numeric for this flex field.'
,p_validation_condition=>':P142_FLEXIBLE_COLUMN like ''%FLEX_N%'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(6143610401709059749)
,p_associated_item=>wwv_flow_imp.id(6143610992531059752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6193621994768484356)
,p_validation_name=>'P142_LOV_SQL_QUERY is Valid'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_disp_col varchar2(30);',
'    l_ret_col  varchar2(30);',
'    l_error    varchar2(4000);',
'begin',
'    if eba_proj_flex_fw.validate_lov_query( :P142_LOV_SQL_QUERY,',
'                l_disp_col, l_ret_col, l_error ) then',
'        :P142_LOV_DISPLAY_COL := l_disp_col;',
'        :P142_LOV_RETURN_COL  := l_ret_col;',
'        return null;',
'    else',
'        return l_error;',
'    end if;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>':P142_DISPLAY_AS = ''SELECT_LIST'' and :P142_LOV_TYPE = ''DYNAMIC'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(6143596899225059725)
,p_associated_item=>wwv_flow_imp.id(6143602483828059738)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6193655513522280963)
,p_validation_name=>'Static select list cannot be NULL'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_cnt number := 0;',
'begin',
'    select count(*) into l_cnt',
'    from eba_proj_flex_registry',
'    where id = :P142_ID',
'        and lov_sql_query is not null;',
'    if :P142_DISPLAY_AS = ''SELECT_LIST'' and :P142_LOV_TYPE = ''STATIC'' and l_cnt = 0 then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'You must create a static select list when the "Display As" is set to "Select List". Click the "Add a List Option" button below to create your static list of values now.'
,p_when_button_pressed=>wwv_flow_imp.id(6143596899225059725)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6143614907575059760)
,p_name=>'Show/Hide LOV Type'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P142_DISPLAY_AS'
,p_condition_element=>'P142_DISPLAY_AS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SELECT_LIST'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143615196311059764)
,p_event_id=>wwv_flow_imp.id(6143614907575059760)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P142_LOV_TYPE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143615391991059765)
,p_event_id=>wwv_flow_imp.id(6143614907575059760)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P142_LOV_TYPE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197853098930830484)
,p_event_id=>wwv_flow_imp.id(6143614907575059760)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P142_LOV_SQL_QUERY'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197853295048832228)
,p_event_id=>wwv_flow_imp.id(6143614907575059760)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6143608697072059747)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6197850388648668678)
,p_name=>'Show/Hide Dynamic LOV query'
,p_event_sequence=>15
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P142_DISPLAY_AS,P142_LOV_TYPE'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v(''P142_DISPLAY_AS'') == ''SELECT_LIST''',
'&& $v(''P142_LOV_TYPE'') == ''DYNAMIC'''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197850692990668679)
,p_event_id=>wwv_flow_imp.id(6197850388648668678)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P142_LOV_SQL_QUERY'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197850884561668679)
,p_event_id=>wwv_flow_imp.id(6197850388648668678)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P142_LOV_SQL_QUERY'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6143616108961059766)
,p_name=>'Show/Hide Static LOV region'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P142_DISPLAY_AS,P142_LOV_TYPE'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v(''P142_DISPLAY_AS'') == ''SELECT_LIST''',
'&& $v(''P142_LOV_TYPE'') == ''STATIC'''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6193623082907489882)
,p_event_id=>wwv_flow_imp.id(6143616108961059766)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6143608697072059747)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6193623311793491630)
,p_event_id=>wwv_flow_imp.id(6143616108961059766)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6143608697072059747)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6143615506212059765)
,p_name=>'Toggle format mask'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P142_DISPLAY_AS'
,p_condition_element=>'P142_DISPLAY_AS'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'NUMBER,DATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143615798555059766)
,p_event_id=>wwv_flow_imp.id(6143615506212059765)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P142_FORMAT_MASK'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6143616004435059766)
,p_event_id=>wwv_flow_imp.id(6143615506212059765)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P142_FORMAT_MASK'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6197830102417341440)
,p_name=>'Configure "Add List Item" button (on Edit)'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6143609789533059748)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v(''P142_EDIT_DISPLAY_SEQUENCE'') > '''' && ',
'$v(''P142_EDIT_DISPLAY_VALUE'') > '''' && $v(''P142_EDIT_RETURN_VALUE'') > '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusin'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197830384036341440)
,p_event_id=>wwv_flow_imp.id(6197830102417341440)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6143610401709059749)
,p_attribute_01=>'disabled'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197830592424341440)
,p_event_id=>wwv_flow_imp.id(6197830102417341440)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6143610401709059749)
,p_attribute_01=>'disabled'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197830796746341440)
,p_event_id=>wwv_flow_imp.id(6197830102417341440)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#SLO").attr("href","javascript:apex.submit(''SAVE_LIST_OPTION'');");'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197830988234341440)
,p_event_id=>wwv_flow_imp.id(6197830102417341440)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#SLO").attr("href","#");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6193590993383392182)
,p_name=>'Configure "Add List Item" button (on Add)'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P142_EDIT_RETURN_VALUE'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v(''P142_EDIT_DISPLAY_SEQUENCE'') > '''' && ',
'$v(''P142_EDIT_DISPLAY_VALUE'') > '''' && $v(''P142_EDIT_RETURN_VALUE'') > '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6193591283876392185)
,p_event_id=>wwv_flow_imp.id(6193590993383392182)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6143610401709059749)
,p_attribute_01=>'disabled'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6193591505097392186)
,p_event_id=>wwv_flow_imp.id(6193590993383392182)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6143610401709059749)
,p_attribute_01=>'disabled'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6193591810957398016)
,p_event_id=>wwv_flow_imp.id(6193590993383392182)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#SLO").attr("href","javascript:apex.submit(''SAVE_LIST_OPTION'');");'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6193592004703400924)
,p_event_id=>wwv_flow_imp.id(6193590993383392182)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#SLO").attr("href","#");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6197827884278326727)
,p_name=>'Configure "Add List Item" button (on Add)'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P142_EDIT_DISPLAY_VALUE'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v(''P142_EDIT_DISPLAY_SEQUENCE'') > '''' && ',
'$v(''P142_EDIT_DISPLAY_VALUE'') > '''' && $v(''P142_EDIT_RETURN_VALUE'') > '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197828196332326728)
,p_event_id=>wwv_flow_imp.id(6197827884278326727)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6143610401709059749)
,p_attribute_01=>'disabled'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197828404304326728)
,p_event_id=>wwv_flow_imp.id(6197827884278326727)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6143610401709059749)
,p_attribute_01=>'disabled'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197828601840326728)
,p_event_id=>wwv_flow_imp.id(6197827884278326727)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#SLO").attr("href","javascript:apex.submit(''SAVE_LIST_OPTION'');");'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197828798547326728)
,p_event_id=>wwv_flow_imp.id(6197827884278326727)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#SLO").attr("href","#");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6197829112329334816)
,p_name=>'Configure "Add List Item" button (on Add)'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P142_EDIT_DISPLAY_SEQUENCE'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v(''P142_EDIT_DISPLAY_SEQUENCE'') > '''' && ',
'$v(''P142_EDIT_DISPLAY_VALUE'') > '''' && $v(''P142_EDIT_RETURN_VALUE'') > '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197829414300334816)
,p_event_id=>wwv_flow_imp.id(6197829112329334816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6143610401709059749)
,p_attribute_01=>'disabled'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197829597089334817)
,p_event_id=>wwv_flow_imp.id(6197829112329334816)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6143610401709059749)
,p_attribute_01=>'disabled'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197829813745334817)
,p_event_id=>wwv_flow_imp.id(6197829112329334816)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#SLO").attr("href","javascript:apex.submit(''SAVE_LIST_OPTION'');");'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6197830005570334817)
,p_event_id=>wwv_flow_imp.id(6197829112329334816)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#SLO").attr("href","#");'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6143613309464059759)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_PROJ_FLEX_REGISTRY'
,p_attribute_02=>'EBA_PROJ_FLEX_REGISTRY'
,p_attribute_03=>'P142_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_internal_uid=>6143613309464059759
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6143613506649059759)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_PROJ_FLEX_REGISTRY'
,p_attribute_02=>'EBA_PROJ_FLEX_REGISTRY'
,p_attribute_03=>'P142_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_success_message=>'Action Processed.'
,p_internal_uid=>6143613506649059759
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6143613698512059760)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Flex Column'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_update_stmt varchar2(10000);',
'    l_display_as  varchar2(128) := ''TEXT'';',
'    l_width       number := 30;',
'    l_max_width   number := 4000;',
'    l_height      number := 1;',
'begin',
'    -- Null the flex column data in the table containing the flex column',
'    execute immediate( ''update '' || sys.dbms_assert.enquote_name(:P142_FLEXIBLE_TABLE)',
'                      ||'' set '' || sys.dbms_assert.enquote_name(:P142_FLEXIBLE_COLUMN) || '' = null''',
'                      ||'' where '' || sys.dbms_assert.enquote_name(:P142_FLEXIBLE_COLUMN) || '' is not null''',
'                     );',
'',
'    -- Reset the form element dimensions and element type for CLOB flex columns',
'    if instr(:P142_FLEXIBLE_COLUMN,''_CLOB'') > 0 then',
'        l_display_as := ''TEXTAREA'';',
'        l_width      := 80;',
'        l_max_width  := 40000;',
'        l_height     := 5;',
'    end if;',
'',
'    -- remove records for Static LOVs',
'    if :P142_LOV_TYPE = ''STATIC'' then',
'        delete from eba_proj_flex_static_lovs',
'         where flex_table = :P142_FLEXIBLE_TABLE',
'           and flex_column = :P142_FLEXIBLE_COLUMN;',
'    end if;',
'',
'    -- Update the column data in the flex registry table',
'    update eba_proj_flex_registry',
'       set assigned_yn = ''N'',',
'           form_label_text =:P142_FLEXIBLE_COLUMN,',
'           active_yn = ''N'',',
'           is_required_yn = ''N'',',
'           label_template_id = 0,',
'           display_as = l_display_as,',
'           width = l_width,',
'           max_width = l_max_width,',
'           height = l_height,',
'           is_displayed_on_ir = ''N''',
'     where flexible_table = :P142_FLEXIBLE_TABLE',
'       and flexible_column = :P142_FLEXIBLE_COLUMN;',
'    commit;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM# || '' '' || :P142_FLEXIBLE_TABLE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6143597293680059729)
,p_internal_uid=>6143613698512059760
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6143613903227059760)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Static List Option'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_cnt       number := 0;',
'    l_lov_query varchar2(32767);',
'begin',
'    -- Delete the list option record',
'    delete from eba_proj_flex_static_lovs',
'     where id = :P142_EDIT_OPTION_ID;',
'',
'    -- Prepare the lov query from dual that will be used to generate the form element',
'    for c1 in',
'    (',
'        select display_value, return_value',
'          from eba_proj_flex_static_lovs',
'         where id = :P142_EDIT_OPTION_ID',
'         order by display_sequence',
'    )',
'    loop',
'        if l_cnt = 0 then',
'            l_lov_query := ''select q''''['' || c1.display_value || '']'''' dv, q''''['' || c1.return_value || '']'''' rv from dual'';',
'        else',
'            l_lov_query := l_lov_query || chr(10) || ''union all'' || chr(10);',
'            l_lov_query := l_lov_query || ''select q''''['' || c1.display_value || '']'''' dv, q''''['' || c1.return_value || '']'''' rv from dual'';',
'        end if;',
'        l_cnt := l_cnt + 1;',
'    end loop;',
'',
'    -- Update the lov query column in the flex registry table',
'    update eba_proj_flex_registry',
'       set lov_sql_query = l_lov_query',
'     where id = :P142_ID;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6143610184621059749)
,p_process_when=>'P142_EDIT_OPTION_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Static list option deleted'
,p_internal_uid=>6143613903227059760
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6143614091609059760)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Static List Option'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_cnt       number := 0;',
'    l_lov_query varchar2(32767);',
'begin',
'    -- Update the list option record',
'    update eba_proj_flex_static_lovs',
'       set display_sequence = :P142_EDIT_DISPLAY_SEQUENCE,',
'           display_value = :P142_EDIT_DISPLAY_VALUE,',
'           return_value = :P142_EDIT_RETURN_VALUE',
'     where id = :P142_EDIT_OPTION_ID;',
'',
'    -- Prepare the lov query from dual that will be used to generate the form element',
'    for c1 in',
'    (',
'        select display_value, return_value',
'          from eba_proj_flex_static_lovs',
'         where id = :P142_EDIT_OPTION_ID',
'         order by display_sequence',
'    )',
'    loop',
'        if l_cnt = 0 then',
'            l_lov_query := ''select q''''['' || c1.display_value || '']'''' dv, q''''['' || c1.return_value || '']'''' rv from dual'';',
'        else',
'            l_lov_query := l_lov_query || chr(10) || ''union all'' || chr(10);',
'            l_lov_query := l_lov_query || ''select q''''['' || c1.display_value || '']'''' dv, q''''['' || c1.return_value || '']'''' rv from dual'';',
'        end if;',
'        l_cnt := l_cnt + 1;',
'    end loop;',
'',
'    -- Update the lov query column in the flex registry table',
'    update eba_proj_flex_registry',
'       set lov_sql_query = l_lov_query',
'     where id = :P142_ID;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6143610401709059749)
,p_process_when=>':P142_EDIT_OPTION_ID is not null'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'Static list option updated'
,p_internal_uid=>6143614091609059760
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6143614309475059760)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Static List Option'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_cnt       number := 0;',
'    l_lov_query varchar2(32767);',
'begin',
'    -- Insert the new list option record',
'    insert into eba_proj_flex_static_lovs',
'    (flex_table, flex_column, display_sequence, display_value, return_value)',
'    values',
'    (:P142_FLEXIBLE_TABLE, :P142_FLEXIBLE_COLUMN, :P142_EDIT_DISPLAY_SEQUENCE, :P142_EDIT_DISPLAY_VALUE, :P142_EDIT_RETURN_VALUE)',
'    returning id into :P142_EDIT_OPTION_ID;',
'',
'    -- Prepare the lov query from dual that will be used to generate the form element',
'    for c1 in',
'    (',
'        select display_value, return_value',
'          from eba_proj_flex_static_lovs',
'         where id = :P142_EDIT_OPTION_ID',
'         order by display_sequence',
'    )',
'    loop',
'        if l_cnt = 0 then',
'            l_lov_query := ''select q''''['' || c1.display_value || '']'''' dv, q''''['' || c1.return_value || '']'''' rv from dual'';',
'        else',
'            l_lov_query := l_lov_query || chr(10) || ''union all'' || chr(10);',
'            l_lov_query := l_lov_query || ''select q''''['' || c1.display_value || '']'''' dv, q''''['' || c1.return_value || '']'''' rv from dual'';',
'        end if;',
'        l_cnt := l_cnt + 1;',
'    end loop;',
'',
'    -- Update the lov query column in the flex registry table',
'    update eba_proj_flex_registry',
'       set lov_sql_query = l_lov_query',
'     where id = :P142_ID;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6143610401709059749)
,p_process_when=>'P142_EDIT_OPTION_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'Static list option created'
,p_internal_uid=>6143614309475059760
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6143614502005059760)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Configure Report Columns'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Make sure the page registry is up-to-date.',
'eba_proj_flex_fw.populate_page_map_table();',
'',
'-- Update all report columns.',
'for c1 in ( select distinct m.flex_table,',
'                m.page_id,',
'                m.region_id,',
'                m.flex_column_prefix,',
'                m.region_type',
'            from eba_proj_flex_page_map m,',
'                eba_proj_flex_registry r',
'            where m.flex_table = :P142_FLEXIBLE_TABLE',
'                and m.flex_table = r.flexible_table',
'                and m.region_type in (''IR'',''CR'')',
'        ) loop',
'    eba_proj_flex_fw.flex_report_update (',
'        p_flex_table_name    => c1.flex_table,',
'        p_irr_region_id      => c1.region_id,',
'        p_flex_column_prefix => c1.flex_column_prefix,',
'        p_app_id             => :APP_ID,',
'        p_page_id            => c1.page_id,',
'        p_region_type        => c1.region_type',
'    );',
'end loop;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P142_FLEXIBLE_TABLE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>6143614502005059760
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6143613089017059758)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'update entire static lov'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_cnt       number := 0;',
'    l_lov_query varchar2(32767);',
'    l_updt_stmt varchar2(2000);',
'begin',
'    -- Prepare the lov query from dual that will be used to generate the form element',
'    for c1 in ( select display_value,',
'                    case',
'                        when :P142_FLEXIBLE_COLUMN like ''%FLEX_N%'' then return_value',
'                        else ''q''''[''||return_value||'']''''''',
'                    end as ret_val',
'                from eba_proj_flex_static_lovs',
'                where flex_column = :P142_FLEXIBLE_COLUMN',
'                order by display_sequence ) loop',
'        if l_cnt = 0 then',
'            l_lov_query := ''select q''''['' || c1.display_value || '']'''' dv, ''',
'                || c1.ret_val || '' rv from dual'';',
'        else',
'            l_lov_query := l_lov_query || chr(10) || ''union all'' || chr(10);',
'            l_lov_query := l_lov_query || ''select q''''['' || c1.display_value || '']'''' dv, ''',
'                || c1.ret_val || '' rv from dual'';',
'        end if;',
'        l_cnt := l_cnt + 1;',
'    end loop;',
'',
'    -- Update the lov query column in the flex registry table',
'    update eba_proj_flex_registry',
'       set lov_sql_query = l_lov_query',
'     where id = :P142_ID;',
'',
'    l_updt_stmt := ''update ''||sys.dbms_assert.enquote_name(:P142_FLEXIBLE_TABLE)',
'        ||'' set ''||dbms_assert.enquote_name(:P142_FLEXIBLE_COLUMN)||'' = :1 where ''',
'        ||sys.dbms_assert.enquote_name(:P142_FLEXIBLE_COLUMN)||'' is null'';',
'    execute immediate l_updt_stmt using :P142_DEFAULT_VALUE;',
'    commit;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P142_DISPLAY_AS = ''SELECT_LIST'' and :P142_LOV_TYPE = ''STATIC'' and :REQUEST <> ''DELETE'''
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>6143613089017059758
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6197850201283634504)
,p_process_sequence=>85
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Static LOV items'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from eba_proj_flex_static_lovs',
'where flex_table = :P142_FLEXIBLE_TABLE',
'    and flex_column = :P142_FLEXIBLE_COLUMN;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'not (:P142_DISPLAY_AS = ''SELECT_LIST'' and :P142_LOV_TYPE = ''STATIC'')'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>6197850201283634504
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6143614704514059760)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'17'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6143597293680059729)
,p_internal_uid=>6143614704514059760
);
wwv_flow_imp.component_end;
end;
/
