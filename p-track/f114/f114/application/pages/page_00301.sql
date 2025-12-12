prompt --application/pages/page_00301
begin
--   Manifest
--     PAGE: 00301
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
 p_id=>301
,p_name=>'Create Project Wizard Step 2'
,p_page_mode=>'MODAL'
,p_step_title=>'Create a Project'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(6672343678616369853)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_dialog_resizable=>'Y'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11238281184335566635)
,p_plug_name=>'Wizard Buttons'
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
 p_id=>wwv_flow_imp.id(11567902713625095020)
,p_plug_name=>'Create Project Wizard Container'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_imp.id(11567832365745161959)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6672376162491369936)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11567903823504095026)
,p_plug_name=>'Form Items'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11603889826102924304)
,p_plug_name=>'Owner(s)'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11567903100400095024)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11238281184335566635)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11567903441532095025)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11238281184335566635)
,p_button_name=>'Next'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11238280654564566630)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11238281184335566635)
,p_button_name=>'Previous'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Previous'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(11567905117584095029)
,p_branch_name=>'Go to Next Step'
,p_branch_action=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(11567903441532095025)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11601642469737477314)
,p_name=>'P301_ACL_STATUS_LEVEL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11567903823504095026)
,p_prompt=>'Access Control'
,p_source=>'eba_proj_fw.get_preference_value(p_preference_name => ''DEFAULT_PROJECT_ACL'');'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ACL LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11045413827346451385)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11603890118111924308)
,p_name=>'P301_PROJECT_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_item_default=>'lower(:app_user)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Person'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'order by lower(username)'))
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Identify project owners.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11603891106845924312)
,p_name=>'P301_PROJECT_OWNER2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Project Owner 2'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'order by lower(username)'))
,p_cSize=>64
,p_cMaxlength=>255
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11603891938427924314)
,p_name=>'P301_PROJECT_OWNER3'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Project Owner 3'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'order by lower(username)'))
,p_cSize=>64
,p_cMaxlength=>255
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11603892937818924315)
,p_name=>'P301_PROJECT_OWNER4'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Project Owner 4'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'order by lower(username)'))
,p_cSize=>64
,p_cMaxlength=>255
,p_cattributes_element=>'style="display: none"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11603893830165924316)
,p_name=>'P301_PROJECT_OWNER5'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Project Owner 5'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'order by lower(username)'))
,p_cSize=>64
,p_cMaxlength=>255
,p_cattributes_element=>'style="display: none"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11603894771232924317)
,p_name=>'P301_PROJECT_OWNER6'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Project Owner 6'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'order by lower(username)'))
,p_cSize=>64
,p_cMaxlength=>255
,p_cattributes_element=>'style="display: none"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11603895643428924319)
,p_name=>'P301_PROJECT_OWNER7'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Project Owner 7'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'order by lower(username)'))
,p_cSize=>64
,p_cMaxlength=>255
,p_cattributes_element=>'style="display: none"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11603906522704924321)
,p_name=>'P301_PROJECT_OWNER8'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Project Owner 8'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'order by lower(username)'))
,p_cSize=>64
,p_cMaxlength=>255
,p_cattributes_element=>'style="display: none"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11603907459653924322)
,p_name=>'P301_PROJECT_OWNER9'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Project Owner 9'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'order by lower(username)'))
,p_cSize=>64
,p_cMaxlength=>255
,p_cattributes_element=>'style="display: none"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11603908327606924324)
,p_name=>'P301_PROJECT_OWNER10'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Project Owner 10'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'order by lower(username)'))
,p_cSize=>64
,p_cMaxlength=>255
,p_cattributes_element=>'style="display: none"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11603909250637924326)
,p_name=>'P301_PROJECT_OWNER11'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Project Owner 11'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'order by lower(username)'))
,p_cSize=>64
,p_cMaxlength=>255
,p_cattributes_element=>'style="display: none"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11603910193552924327)
,p_name=>'P301_PROJECT_OWNER12'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Project Owner 12'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'order by lower(username)'))
,p_cSize=>64
,p_cMaxlength=>255
,p_cattributes_element=>'style="display: none"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608805031260153647)
,p_name=>'P301_OWNER_ROLE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Project Role'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id',
'  from eba_proj_roles',
' where name = ''Project Manager'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Select the appropriate role for this project owner. Contact your application administrator to add new role(s).'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608805215125153648)
,p_name=>'P301_OWNER_ROLE2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608805222488153649)
,p_name=>'P301_OWNER_ACL'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_item_default=>'3'
,p_prompt=>'Access Level'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Select the appropriate access level for this project owner. Contact your application administrator to add new access level(s).'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608805334919153650)
,p_name=>'P301_OWNER_ACL2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner acl'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608805511955153651)
,p_name=>'P301_OWNER_ROLE3'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608805571557153652)
,p_name=>'P301_OWNER_ACL3'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner acl'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608805705012153653)
,p_name=>'P301_OWNER_ROLE4'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608805791820153654)
,p_name=>'P301_OWNER_ROLE5'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608805910201153655)
,p_name=>'P301_OWNER_ROLE6'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608806004590153656)
,p_name=>'P301_OWNER_ROLE7'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608806086644153657)
,p_name=>'P301_OWNER_ROLE8'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608806150672153658)
,p_name=>'P301_OWNER_ROLE9'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608806235879153659)
,p_name=>'P301_OWNER_ROLE10'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608806388102153660)
,p_name=>'P301_OWNER_ROLE11'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608806438633153661)
,p_name=>'P301_OWNER_ROLE12'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608806606476153662)
,p_name=>'P301_OWNER_ACL4'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner acl'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608806708243153663)
,p_name=>'P301_OWNER_ACL5'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner acl'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11621898973120135514)
,p_name=>'P301_OWNER_ACL6'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner acl'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11621899098162135515)
,p_name=>'P301_OWNER_ACL7'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner acl'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11621899165172135516)
,p_name=>'P301_OWNER_ACL8'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner acl'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11621899312256135517)
,p_name=>'P301_OWNER_ACL9'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner acl'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11621899398721135518)
,p_name=>'P301_OWNER_ACL10'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner acl'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11621899491595135519)
,p_name=>'P301_OWNER_ACL11'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner acl'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11621899564768135520)
,p_name=>'P301_OWNER_ACL12'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(11603889826102924304)
,p_prompt=>'Owner acl'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="display: none"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17768593975924174453)
,p_name=>'P301_RESTRICT_MS_AI_MGT'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(11567903823504095026)
,p_prompt=>'Prevent Changes'
,p_source=>'eba_proj_fw.get_preference_value(p_preference_name => ''DEFAULT_PJCT_RESTRICT_CHANGES'');'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_required_patch=>wwv_flow_imp.id(16868356519761892930)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If this is a restricted project, setting this to Yes will prevent users who only have Edit privileges on the project (either explicitly or through their assigned role) from editing project details and most aspects of milestones and action items.',
'</p>',
'<p>',
'For an open project, setting this to Yes will require users to have Admin rights to the application in order to edit project details and most aspects of milestones and action items.',
'</p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(11807450816798241921)
,p_validation_name=>'Check Required Fields'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P301_PROJECT_OWNER is not null and (:P301_OWNER_ROLE is null or :P301_OWNER_ACL is null) then',
'        return false;',
'    elsif :P301_PROJECT_OWNER2 is not null and (:P301_OWNER_ROLE2 is null or :P301_OWNER_ACL2 is null) then',
'        return false;',
'    elsif :P301_PROJECT_OWNER3 is not null and (:P301_OWNER_ROLE3 is null or :P301_OWNER_ACL3 is null) then',
'        return false;',
'    elsif :P301_PROJECT_OWNER4 is not null and (:P301_OWNER_ROLE4 is null or :P301_OWNER_ACL4 is null) then',
'        return false;',
'    elsif :P301_PROJECT_OWNER5 is not null and (:P301_OWNER_ROLE5 is null or :P301_OWNER_ACL5 is null) then',
'        return false;',
'    elsif :P301_PROJECT_OWNER6 is not null and (:P301_OWNER_ROLE6 is null or :P301_OWNER_ACL6 is null) then',
'        return false;',
'    elsif :P301_PROJECT_OWNER7 is not null and (:P301_OWNER_ROLE7 is null or :P301_OWNER_ACL7 is null) then',
'        return false;',
'    elsif :P301_PROJECT_OWNER8 is not null and (:P301_OWNER_ROLE8 is null or :P301_OWNER_ACL8 is null) then',
'        return false;',
'    elsif :P301_PROJECT_OWNER9 is not null and (:P301_OWNER_ROLE9 is null or :P301_OWNER_ACL9 is null) then',
'        return false;',
'    elsif :P301_PROJECT_OWNER10 is not null and (:P301_OWNER_ROLE10 is null or :P301_OWNER_ACL10 is null) then',
'        return false;',
'    elsif :P301_PROJECT_OWNER11 is not null and (:P301_OWNER_ROLE11 is null or :P301_OWNER_ACL11 is null) then',
'        return false;',
'    elsif :P301_PROJECT_OWNER12 is not null and (:P301_OWNER_ROLE12 is null or :P301_OWNER_ACL12 is null) then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'A role and access level must be specified for each user.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20609278923893714342)
,p_validation_name=>'P301_PROJECT_OWNER Email Username is valid'
,p_validation_sequence=>20
,p_validation=>'P301_PROJECT_OWNER'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':P301_PROJECT_OWNER is not null and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(11567903441532095025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20289567616873214640)
,p_validation_name=>'P301_PROJECT_OWNER2 Email Username is valid'
,p_validation_sequence=>30
,p_validation=>'P301_PROJECT_OWNER2'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':P301_PROJECT_OWNER2 is not null and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(11567903441532095025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20289567811522214641)
,p_validation_name=>'P301_PROJECT_OWNER3 Email Username is valid'
,p_validation_sequence=>40
,p_validation=>'P301_PROJECT_OWNER3'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':P301_PROJECT_OWNER3 is not null and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(11567903441532095025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20289567894326214642)
,p_validation_name=>'P301_PROJECT_OWNER4 Email Username is valid'
,p_validation_sequence=>50
,p_validation=>'P301_PROJECT_OWNER4'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':P301_PROJECT_OWNER4 is not null and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(11567903441532095025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20289568013659214643)
,p_validation_name=>'P301_PROJECT_OWNER5 Email Username is valid'
,p_validation_sequence=>60
,p_validation=>'P301_PROJECT_OWNER5'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':P301_PROJECT_OWNER5 is not null and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(11567903441532095025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20289568053974214644)
,p_validation_name=>'P301_PROJECT_OWNER6 Email Username is valid'
,p_validation_sequence=>70
,p_validation=>'P301_PROJECT_OWNER6'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':P301_PROJECT_OWNER6 is not null and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(11567903441532095025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20289568184303214645)
,p_validation_name=>'P301_PROJECT_OWNER7 Email Username is valid'
,p_validation_sequence=>80
,p_validation=>'P301_PROJECT_OWNER7'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':P301_PROJECT_OWNER7 is not null and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(11567903441532095025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20289568227383214646)
,p_validation_name=>'P301_PROJECT_OWNER8 Email Username is valid'
,p_validation_sequence=>90
,p_validation=>'P301_PROJECT_OWNER8'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':P301_PROJECT_OWNER8 is not null and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(11567903441532095025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20289568394029214647)
,p_validation_name=>'P301_PROJECT_OWNER9 Email Username is valid'
,p_validation_sequence=>100
,p_validation=>'P301_PROJECT_OWNER9'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':P301_PROJECT_OWNER9 is not null and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(11567903441532095025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20289568553424214649)
,p_validation_name=>'P301_PROJECT_OWNER10 Email Username is valid'
,p_validation_sequence=>110
,p_validation=>'P301_PROJECT_OWNER10'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':P301_PROJECT_OWNER10 is not null and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(11567903441532095025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20289568664740214650)
,p_validation_name=>'P301_PROJECT_OWNER11 Email Username is valid'
,p_validation_sequence=>120
,p_validation=>'P301_PROJECT_OWNER11'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':P301_PROJECT_OWNER11 is not null and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(11567903441532095025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20289568825664214652)
,p_validation_name=>'P301_PROJECT_OWNER12 Email Username is valid'
,p_validation_sequence=>130
,p_validation=>'P301_PROJECT_OWNER12'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':P301_PROJECT_OWNER12 is not null and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(11567903441532095025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11466365571695344445)
,p_name=>'Set ACL Level 1'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_OWNER_ROLE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11466365617931344446)
,p_event_id=>wwv_flow_imp.id(11466365571695344445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P301_OWNER_ROLE'))
,p_attribute_07=>'P301_OWNER_ROLE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11466375973387344449)
,p_name=>'Set ACL Level 2'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_OWNER_ROLE2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11466376067968344450)
,p_event_id=>wwv_flow_imp.id(11466375973387344449)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL2'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P301_OWNER_ROLE2'))
,p_attribute_07=>'P301_OWNER_ROLE2'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11466376167440344451)
,p_name=>'Set ACL Level 3'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_OWNER_ROLE3'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11466376246403344452)
,p_event_id=>wwv_flow_imp.id(11466376167440344451)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL3'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P301_OWNER_ROLE3'))
,p_attribute_07=>'P301_OWNER_ROLE3'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11608802536916153622)
,p_name=>'Cancel Wizard'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11567903100400095024)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11608802705826153623)
,p_event_id=>wwv_flow_imp.id(11608802536916153622)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11466376318012344453)
,p_name=>'Set ACL Level 4'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_OWNER_ROLE4'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11466376483840344454)
,p_event_id=>wwv_flow_imp.id(11466376318012344453)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL4'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P301_OWNER_ROLE4'))
,p_attribute_07=>'P301_OWNER_ROLE4'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11466376602404344455)
,p_name=>'Set ACL Level 5'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_OWNER_ROLE5'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11466376698202344456)
,p_event_id=>wwv_flow_imp.id(11466376602404344455)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL5'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P301_OWNER_ROLE5'))
,p_attribute_07=>'P301_OWNER_ROLE5'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11466376788466344457)
,p_name=>'Set ACL Level 6'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_OWNER_ROLE6'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11466376848994344458)
,p_event_id=>wwv_flow_imp.id(11466376788466344457)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL6'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P301_OWNER_ROLE6'))
,p_attribute_07=>'P301_OWNER_ROLE6'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11466376949192344459)
,p_name=>'Set ACL Level 7'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_OWNER_ROLE7'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11466377022864344460)
,p_event_id=>wwv_flow_imp.id(11466376949192344459)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL7'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P301_OWNER_ROLE7'))
,p_attribute_07=>'P301_OWNER_ROLE7'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11466377143584344461)
,p_name=>'Set ACL Level 8'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_OWNER_ROLE8'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11466377267973344462)
,p_event_id=>wwv_flow_imp.id(11466377143584344461)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL8'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P301_OWNER_ROLE8'))
,p_attribute_07=>'P301_OWNER_ROLE8'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11466377364023344463)
,p_name=>'Set ACL Level 90'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_OWNER_ROLE9'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11807450207432241914)
,p_event_id=>wwv_flow_imp.id(11466377364023344463)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL9'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P301_OWNER_ROLE9'))
,p_attribute_07=>'P301_OWNER_ROLE9'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11807450271095241915)
,p_name=>'Set ACL Level 10'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_OWNER_ROLE10'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11807450350430241916)
,p_event_id=>wwv_flow_imp.id(11807450271095241915)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL10'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P301_OWNER_ROLE10'))
,p_attribute_07=>'P301_OWNER_ROLE10'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11807450464777241917)
,p_name=>'Set ACL Level 11'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_OWNER_ROLE11'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11807450611326241918)
,p_event_id=>wwv_flow_imp.id(11807450464777241917)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL11'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P301_OWNER_ROLE11'))
,p_attribute_07=>'P301_OWNER_ROLE11'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11807450646673241919)
,p_name=>'Set ACL Level 12'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_OWNER_ROLE12'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11807450790063241920)
,p_event_id=>wwv_flow_imp.id(11807450646673241919)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL12'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P301_OWNER_ROLE12'))
,p_attribute_07=>'P301_OWNER_ROLE12'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12742815712362434536)
,p_name=>'Show Next User Row'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_PROJECT_OWNER3, P301_PROJECT_OWNER4, P301_PROJECT_OWNER5, P301_PROJECT_OWNER6, P301_PROJECT_OWNER7, P301_PROJECT_OWNER8, P301_PROJECT_OWNER9, P301_PROJECT_OWNER10, P301_PROJECT_OWNER11'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(this.triggeringElement).length > 0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12742815741350434537)
,p_event_id=>wwv_flow_imp.id(12742815712362434536)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(this.triggeringElement).closest(''.row'').next().find(''.col'').show();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13616956054423744859)
,p_name=>'Show/Hide Access Levels'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_ACL_STATUS_LEVEL'
,p_condition_element=>'P301_ACL_STATUS_LEVEL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13616956142439744860)
,p_event_id=>wwv_flow_imp.id(13616956054423744859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL,P301_OWNER_ACL2,P301_OWNER_ACL3,P301_OWNER_ACL4,P301_OWNER_ACL5,P301_OWNER_ACL6,P301_OWNER_ACL7,P301_OWNER_ACL8,P301_OWNER_ACL9,P301_OWNER_ACL10,P301_OWNER_ACL11,P301_OWNER_ACL12'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13616956227924744861)
,p_event_id=>wwv_flow_imp.id(13616956054423744859)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_OWNER_ACL,P301_OWNER_ACL2,P301_OWNER_ACL3,P301_OWNER_ACL4,P301_OWNER_ACL5,P301_OWNER_ACL6,P301_OWNER_ACL7,P301_OWNER_ACL8,P301_OWNER_ACL9,P301_OWNER_ACL10,P301_OWNER_ACL11,P301_OWNER_ACL12'
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
