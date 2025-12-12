prompt --application/pages/page_00090
begin
--   Manifest
--     PAGE: 00090
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
 p_id=>90
,p_name=>'User Details'
,p_page_mode=>'MODAL'
,p_step_title=>'User Details'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847526696754426930)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>'.t-Form-inputContainer span.display_only {font-weight: normal;}'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_help_text=>'Supply the mandatory form data and click the <strong>Add User</strong> button to add a new user. Click the <strong>Cancel</strong> button to return to the Access Control List page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(417229994125456666)
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
 p_id=>wwv_flow_imp.id(7759573897286679351)
,p_plug_name=>'User Details'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6040749094818019460)
,p_plug_name=>'Information'
,p_parent_plug_id=>wwv_flow_imp.id(7759573897286679351)
,p_region_css_classes=>'infoTextRegion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if 1 = 2 then',
'-- if the user has no access indicate this; and inform admin that they need to change the access level for the use to have access',
'htp.prn(replace(',
'    apex_lang.message(''ACCESS_CONTROL_INFO''),',
'    ''#IMAGE_PREFIX''||''#'',',
'    :image_prefix));',
'end if;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6040749302091021505)
,p_plug_name=>'Form Items'
,p_parent_plug_id=>wwv_flow_imp.id(7759573897286679351)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7759576696090679357)
,p_plug_name=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>60
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7759574285583679353)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(417229994125456666)
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
 p_id=>wwv_flow_imp.id(7759574696751679353)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(417229994125456666)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Delete'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P90_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7759574104877679353)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(417229994125456666)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P90_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7759574505118679353)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(417229994125456666)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add User'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P90_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2661876776800613330)
,p_name=>'P90_HOME_TIMEZONE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Home Timezone'
,p_source=>'HOME_TIMEZONE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct tzname d, tzname r',
'  from V$TIMEZONE_NAMES',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2661877044914615818)
,p_name=>'P90_REGION_ID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Region'
,p_source=>'REGION_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d, r',
'from (  select ''- Select -'' d, null r, 1 o',
'        from dual',
'        union all',
'        select region_name d, id r, 2 o',
'        from eba_proj_regions )',
'order by o, lower(d)'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2661877310758618430)
,p_name=>'P90_COUNTRY_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Country'
,p_source=>'COUNTRY_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select country_name||'' (''||country_code||'')'' d, id r',
'from eba_proj_countries c',
'where (nvl(:P90_REGION_ID,-1) = -1 or c.region_id = :P90_REGION_ID)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_lov_cascade_parent_items=>'P90_REGION_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2661877659531621114)
,p_name=>'P90_TEAM_GROUPS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Team Groups'
,p_source=>'TEAM_GROUPS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select distinct team_groups from eba_proj_status_users'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(2661829695961054886)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2661877969979623609)
,p_name=>'P90_SKILLSETS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Skillset(s)'
,p_source=>'SKILLSETS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select distinct skillsets from eba_proj_status_users'
,p_cSize=>30
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(2661829854737059914)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2661878240815628517)
,p_name=>'P90_BG_CHECKS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Background Checks'
,p_source=>'BG_CHECKS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select distinct bg_checks from eba_proj_status_users'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(2661830040094079007)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2661878580352630288)
,p_name=>'P90_HIPPA_CERT_DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'HIPPA Certified On'
,p_source=>'HIPPA_CERT_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(2661830257654087551)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7759574914023679354)
,p_name=>'P90_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7759575086648679355)
,p_name=>'P90_USERNAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Username'
,p_source=>'USERNAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(7759575291408679355)
,p_name=>'P90_ACCESS_LEVEL_ID'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_item_default=>'2'
,p_prompt=>'Access Level'
,p_source=>'ACCESS_LEVEL_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ACCESS_LEVEL as display_value, ID as return_value ',
'  from EBA_PROJ_STATUS_ACCESS_LEVELS',
'order by 2 desc'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(639523678332439146)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>When Access Control is enabled, Administrators have the ability to restrict access to certain application features, for authenticated users. P-Track supports the following 4 access levels; Reader, Contributor, Administrator, and Super Admin.<p>',
'<ul>',
'  <li><strong>Readers</strong> have read-only access to all project information and can also view reports.</li>',
'  <li><strong>Contributors</strong> can create, edit and delete projects and view reports.</li>',
'  <li><strong>Administrators</strong>, in addition to Contributor''s capability, can also perform configuration of access control, and installing or uninstalling sample data.</li>',
'  <li><strong>Super Admins</strong>, in addition to Administrator''s capability, can view and edit all projects, regardless of their restriction status.</li>',
'</ul>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7759575497271679355)
,p_name=>'P90_ACCOUNT_LOCKED'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Account Locked?'
,p_source=>'ACCOUNT_LOCKED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P90_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7759575692600679355)
,p_name=>'P90_CREATED_BY'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_source=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P90_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7759575911705679356)
,p_name=>'P90_CREATED'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_source=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P90_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7759576104599679356)
,p_name=>'P90_UPDATED_BY'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_source=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P90_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7759576313514679356)
,p_name=>'P90_UPDATED'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_source=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P90_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8223041926171552056)
,p_name=>'P90_EMAIL_ADDRESS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Email'
,p_source=>'EMAIL_ADDRESS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'EMAIL',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11039932101862316277)
,p_name=>'P90_PHONE_01'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Phone 1'
,p_source=>'PHONE_01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>30
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEL',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11039945136144237487)
,p_name=>'P90_TITLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Title'
,p_source=>'TITLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11040174222150319803)
,p_name=>'P90_PHONE_02'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Phone 2'
,p_source=>'PHONE_02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEL',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11040538889986325809)
,p_name=>'P90_ADDRESS'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Address'
,p_source=>'ADDRESS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>2
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11040542256217328213)
,p_name=>'P90_NOTE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Profile'
,p_source=>'NOTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>2
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11040551973935250199)
,p_name=>'P90_ASSISTANT_NAME'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Assistant Name'
,p_source=>'ASSISTANT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(2705749400803732907)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11040554486169252755)
,p_name=>'P90_ASSISTANT_PHONE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Assistant Phone'
,p_source=>'ASSISTANT_PHONE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(2705749400803732907)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEL',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15183310402297313674)
,p_name=>'P90_PHOTO_BLOB'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Image/File'
,p_source=>'PHOTO_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Please upload square photos, non-square photos may appear distorted. Images should be 250 pixels wide and 250 pixels tall.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'content_disposition', 'attachment',
  'display_as', 'NATIVE',
  'display_download_link', 'Y',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15183340489263371401)
,p_name=>'P90_PHOTO_MIMETYPE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_source=>'PHOTO_MIMETYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15183343094196373221)
,p_name=>'P90_PHOTO_CHARSET'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_source=>'PHOTO_CHARSET'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15183345082693375299)
,p_name=>'P90_PHOTO_LASTUPD'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_source=>'PHOTO_LASTUPD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15183347329389317911)
,p_name=>'P90_PHOTO_NAME'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Photo Name'
,p_source=>'PHOTO_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P195_PHOTO_BLOB'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
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
 p_id=>wwv_flow_imp.id(15183377903607328737)
,p_name=>'P90_PHOTO_DISPLAY'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Photo'
,p_source=>'PHOTO_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'width="250" height="250"'
,p_display_when=>'select null from EBA_PROJ_STATUS_USERS where id = :P90_ID and dbms_lob.getlength(photo_blob) > 0'
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Drag and drop a new image file onto the File Browse/Choose File button above to replace this photo. Please upload square photos, non-square photos may appear distorted. Images should be 250 pixels wide and 250 pixels tall.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'DB_COLUMN',
  'blob_last_updated_column', 'PHOTO_LASTUPD',
  'filename_column', 'PHOTO_NAME')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15246403074802083447)
,p_name=>'P90_FIRST_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'First Name'
,p_source=>'FIRST_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15246407196207088036)
,p_name=>'P90_LAST_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Last Name'
,p_source=>'LAST_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17526767209896169947)
,p_name=>'P90_PAST_DUE_REMINDERS_FREQ'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_item_default=>'UNSET'
,p_prompt=>'Past Due Milestones and Action Items Email Delivery Schedule'
,p_source=>'PAST_DUE_REMINDERS_FREQ'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EMAIL SCHEDULE OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(16037919235537104348)||'.'
,p_cHeight=>1
,p_read_only_when=>'P90_PAST_DUE_REMINDERS_FREQ'
,p_read_only_when2=>'NEVER'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11876370140123189618)
,p_help_text=>'This user preference can only be changed by an administrator if it has never been set or it has been previously enabled by the user that is being edited. If it is set to "Never (Opted-Out)", it cannot be changed.'
,p_inline_help_text=>'<p>The process that sends these emails is currently <strong><a href="f?p=&APP_ID.:163:&APP_SESSION.">&P90_PAST_DUE_JOB_STATUS.</a></strong>.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17526767314811169948)
,p_name=>'P90_UPCOMING_REMINDERS_FREQ'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_item_default=>'UNSET'
,p_prompt=>'Upcoming Milestones and Action Items Email Delivery Schedule'
,p_source=>'UPCOMING_REMINDERS_FREQ'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EMAIL SCHEDULE OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(16037919235537104348)||'.'
,p_cHeight=>1
,p_read_only_when=>'P90_UPCOMING_REMINDERS_FREQ'
,p_read_only_when2=>'NEVER'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11888600020324608728)
,p_help_text=>'This user preference can only be changed by an administrator if it has never been set or it has been previously enabled by the user that is being edited. If it is set to "Never (Opted-Out)", it cannot be changed.'
,p_inline_help_text=>'<p>The process that sends these emails is currently <strong><a href="f?p=&APP_ID.:167:&APP_SESSION.">&P90_UPCOMING_JOB_STATUS.</a></strong>.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17526767398801169949)
,p_name=>'P90_PROJECT_SUMMARY_FAV_FREQ'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_item_default=>'UNSET'
,p_prompt=>'Project Details Email Delivery Schedule'
,p_source=>'PROJECT_SUMMARY_FAV_FREQ'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EMAIL SCHEDULE OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(16037919235537104348)||'.'
,p_cHeight=>1
,p_read_only_when=>'P90_PROJECT_SUMMARY_FAV_FREQ'
,p_read_only_when2=>'NEVER'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(15764621210683200192)
,p_help_text=>'This user preference can only be changed by an administrator if it has never been set or it has been previously enabled by the user that is being edited. If it is set to "Never (Opted-Out)", it cannot be changed.'
,p_inline_help_text=>'<p>The process that sends these emails is currently <strong><a href="f?p=&APP_ID.:197:&APP_SESSION.">&P90_PROJECT_SUMMARY_JOB_STATUS.</a></strong>.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17815673167547957018)
,p_name=>'P90_PAST_DUE_JOB_STATUS'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(7759573897286679351)
,p_display_as=>'NATIVE_HIDDEN'
,p_required_patch=>wwv_flow_imp.id(11876370140123189618)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17815700716767959906)
,p_name=>'P90_UPCOMING_JOB_STATUS'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(7759573897286679351)
,p_display_as=>'NATIVE_HIDDEN'
,p_required_patch=>wwv_flow_imp.id(11888600020324608728)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17815707338451912114)
,p_name=>'P90_PROJECT_SUMMARY_JOB_STATUS'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(7759573897286679351)
,p_display_as=>'NATIVE_HIDDEN'
,p_required_patch=>wwv_flow_imp.id(15764621210683200192)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18067128567846239734)
,p_name=>'P90_PROJECT_STATUS_JOB_STATUS'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(7759573897286679351)
,p_display_as=>'NATIVE_HIDDEN'
,p_required_patch=>wwv_flow_imp.id(15764621210683200192)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18067128731287239736)
,p_name=>'P90_PROJECT_STATUS_FAV_FREQ'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_use_cache_before_default=>'NO'
,p_item_default=>'UNSET'
,p_prompt=>'Project Status Email Delivery Schedule'
,p_source=>'PROJECT_STATUS_FAV_FREQ'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EMAIL SCHEDULE OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(16037919235537104348)||'.'
,p_cHeight=>1
,p_read_only_when=>'P90_PROJECT_STATUS_FAV_FREQ'
,p_read_only_when2=>'NEVER'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(15764621210683200192)
,p_help_text=>'This user preference can only be changed by an administrator if it has never been set or it has been previously enabled by the user that is being edited. If it is set to "Never (Opted-Out)", it cannot be changed.'
,p_inline_help_text=>'<p>The process that sends these emails is currently <strong><a href="f?p=&APP_ID.:197:&APP_SESSION.">&P90_PROJECT_STATUS_JOB_STATUS.</a></strong>.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18208250265250393660)
,p_name=>'P90_NEW_USER_INFO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6040749302091021505)
,p_prompt=>'Additional Pending User Details'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(639523993125439151)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'HTML_UNSAFE',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(17526768019045169956)
,p_computation_sequence=>10
,p_computation_item=>'P90_PAST_DUE_JOB_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    case when enabled = ''TRUE'' then ''Enabled'' else ''Disabled'' end as status',
'from user_scheduler_jobs',
'where job_name = ''EBA_PROJ_EMAIL_PAST_DUE_JOB'''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(17526768183427169957)
,p_computation_sequence=>20
,p_computation_item=>'P90_UPCOMING_JOB_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    case when enabled = ''TRUE'' then ''Enabled'' else ''Disabled'' end as status',
'from user_scheduler_jobs',
'where job_name = ''EBA_PROJ_EMAIL_UPCOMING_JOB'''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(17526768273728169958)
,p_computation_sequence=>30
,p_computation_item=>'P90_PROJECT_SUMMARY_JOB_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    case when enabled = ''TRUE'' then ''Enabled'' else ''Disabled'' end as status',
'from user_scheduler_jobs',
'where job_name = ''EBA_PROJ_EMAIL_SUMMARY_JOB'''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18208250348308393661)
,p_computation_sequence=>40
,p_computation_item=>'P90_NEW_USER_INFO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_retval varchar2(32767);',
'    l_notes  varchar2(4100);',
'begin',
'    for c1 in',
'    (',
'        select',
'            p.project,',
'            r.name as role,',
'            case nvl(ref.acl_status_level, r.default_acl_status_level)',
'                when 1 then',
'                    ''Read Only''',
'                when 2 then',
'                    ''Read / Write''',
'                when 3 then',
'                    ''Read / Write (with Admin)''',
'            end as privs,',
'            ref.notes,',
'            apex_util.get_since(ref.created) as created,',
'            ref.created_by',
'        from',
'            eba_proj_status$  p,',
'            eba_proj_roles    r,',
'            eba_proj_user_ref ref',
'        where',
'            ref.user_id = :P90_ID',
'        and',
'            p.id = ref.project_id',
'        and',
'            r.id = ref.role_id (+)',
'    )',
'    loop',
'        if c1.notes is not null then',
'            l_notes := ''<strong>Notes:</strong> '' || apex_escape.html(c1.notes) || ''<br>'';',
'        else',
'            l_notes := null;',
'        end if;',
'        l_retval := l_retval || ''<p>'' ||',
'            ''<strong>Project:</strong> '' || apex_escape.html(c1.project) || ''<br>'' ||',
'            ''<strong>Project Role:</strong> '' || apex_escape.html(c1.role) || ''<br>'' ||',
'            ''<strong>Project Privileges:</strong> '' || apex_escape.html(c1.privs) || ''<br>'' ||',
'            l_notes ||',
'            ''<strong>Created:</strong> '' || apex_escape.html(c1.created)',
'                || '' by '' || apex_escape.html(lower(c1.created_by)) ||',
'            ''</p>'' || chr(10);',
'    end loop;',
'    return l_retval;',
'end;'))
,p_compute_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    null',
'from',
'    eba_proj_status$  p,',
'    eba_proj_roles    r,',
'    eba_proj_user_ref ref',
'where',
'    ref.user_id = :P90_ID',
'and',
'    p.id = ref.project_id',
'and',
'    r.id = ref.role_id (+)'))
,p_compute_when_type=>'EXISTS'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18067128622335239735)
,p_computation_sequence=>50
,p_computation_item=>'P90_PROJECT_STATUS_JOB_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    case when enabled = ''TRUE'' then ''Enabled'' else ''Disabled'' end as status',
'from user_scheduler_jobs',
'where job_name = ''EBA_PROJ_EMAIL_STATUS_JOB'''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(6046436411411316036)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
,p_compute_when=>'LAST_VIEW'
,p_compute_when_text=>'200:89'
,p_compute_when_type=>'VALUE_OF_ITEM_IN_CONDITION_NOT_IN_COLON_DELIMITED_LIST'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7759577293395679361)
,p_validation_name=>'cannot update yourself'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status_users',
'where upper(username) = :APP_USER',
'    and id = :P90_ID',
'    and :P90_ACCESS_LEVEL_ID < 3'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'You cannot remove administration rights from your own record.'
,p_when_button_pressed=>wwv_flow_imp.id(7759574104877679353)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6046437405360334078)
,p_validation_name=>'P90_USERNAME Email Username is valid'
,p_validation_sequence=>20
,p_validation=>'P90_USERNAME'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Please note the application''s username format below.'
,p_validation_condition=>'eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(7759575086648679355)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18208250475306393662)
,p_name=>'Show/Hide New User Info Item'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P90_ACCESS_LEVEL_ID'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(''input[name=p_t07]:checked'').val() == 0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18208250581258393663)
,p_event_id=>wwv_flow_imp.id(18208250475306393662)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P90_NEW_USER_INFO'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18296369639603442014)
,p_event_id=>wwv_flow_imp.id(18208250475306393662)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P90_NEW_USER_INFO'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2721924899327631351)
,p_name=>'Set Region'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P90_COUNTRY_ID'
,p_condition_element=>'P90_COUNTRY_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2721924930915631352)
,p_event_id=>wwv_flow_imp.id(2721924899327631351)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P90_REGION_ID'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select region_id',
'from eba_proj_countries',
'where id = :P90_COUNTRY_ID'))
,p_attribute_07=>'P90_COUNTRY_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(417230063514456667)
,p_name=>'CNX'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7759574285583679353)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(417230135972456668)
,p_event_id=>wwv_flow_imp.id(417230063514456667)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7759577794675679363)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_PROJ_STATUS_USERS'
,p_attribute_02=>'EBA_PROJ_STATUS_USERS'
,p_attribute_03=>'P90_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_internal_uid=>7759577794675679363
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7759578010836679364)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_PROJ_STATUS_USERS'
,p_attribute_02=>'EBA_PROJ_STATUS_USERS'
,p_attribute_03=>'P90_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>7759578010836679364
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7759578211425679365)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'4'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7759574696751679353)
,p_internal_uid=>7759578211425679365
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(417230256119456669)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>417230256119456669
);
wwv_flow_imp.component_end;
end;
/
