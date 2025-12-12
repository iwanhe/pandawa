prompt --application/pages/page_00303
begin
--   Manifest
--     PAGE: 00303
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
 p_id=>303
,p_name=>'Create Project Wizard Step 4'
,p_page_mode=>'MODAL'
,p_step_title=>'Create a Project'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(6672343678616369853)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_dialog_resizable=>'Y'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11238281319883566637)
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
 p_id=>wwv_flow_imp.id(11568078205840115391)
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
 p_id=>wwv_flow_imp.id(11568079764172115393)
,p_plug_name=>'Form Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11568078963981115393)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11238281319883566637)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11568079394384115393)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11238281319883566637)
,p_button_name=>'CREATE_PROJECT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Project'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(',
'    eba_proj_stat_ui.get_authorization_level(:APP_USER) >= 2',
'    and',
'    replace(eba_proj_fw.get_preference_value( ''PROJECT_CREATE_REQ_AUTH_ROLE'' ),''Preference does not exist'',''CONTRIBUTORS'') =  ''CONTRIBUTORS''',
')',
'or',
'(',
'    eba_proj_stat_ui.get_authorization_level(:APP_USER) >= 3',
'    and',
'    replace(eba_proj_fw.get_preference_value( ''PROJECT_CREATE_REQ_AUTH_ROLE'' ),''Preference does not exist'',''CONTRIBUTORS'') =  ''ADMINS''',
')',
'or',
'(',
'    eba_proj_stat_ui.get_authorization_level(:APP_USER) >= 4',
'    and',
'    replace(eba_proj_fw.get_preference_value( ''PROJECT_CREATE_REQ_AUTH_ROLE'' ),''Preference does not exist'',''CONTRIBUTORS'') =  ''SUPER_ADMINS''',
')'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-chevron-right'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11568078590376115392)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11238281319883566637)
,p_button_name=>'Previous'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Previous'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(11568081485256115398)
,p_branch_name=>'Go to Previous Step'
,p_branch_action=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(11568078590376115392)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(11621899786008135522)
,p_branch_name=>'Go to New Project Details Page'
,p_branch_action=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:&P303_PROJECT_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(11568079394384115393)
,p_branch_sequence=>30
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P303_PROJECT_ID'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608801880689153615)
,p_name=>'P303_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Project'
,p_source=>'P300_PROJECT'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P300_PROJECT'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608801954197153616)
,p_name=>'P303_PARENT_PROJECT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Parent Project'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project',
'from eba_proj_status',
'where ID = :P300_PARENT_PROJECT_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P300_PARENT_PROJECT_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608802070957153617)
,p_name=>'P303_PROJECT_STATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Status'
,p_source=>'P302_PROJECT_STATUS'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'PAGE 2 PROJECT_STATUS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATUS_short_desc display_value, ID return_value ',
'from EBA_PROJ_STATUS_CODES s',
'where s.is_active_yn = ''Y'' or id = :P2_PROJECT_STATUS',
'order by s.is_active_yn desc, s.display_sequence'))
,p_display_when=>'P302_PROJECT_STATUS'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608802804726153624)
,p_name=>'P303_PROJECT_CATEGORY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'&CAT_TITLE.'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_category varchar2(100);',
'begin',
'    for c in',
'    (',
'        select category',
'          from eba_proj_status_cats',
'         where id = :P302_PROJECT_CATEGORY',
'    )',
'    loop',
'        l_category := c.category;',
'    end loop;',
'    if l_category is null then',
'        l_category := :P302_NEW_CATEGORY;',
'    end if;',
'    return l_category;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'nvl(:P302_NEW_CATEGORY, :P302_PROJECT_CATEGORY) != ''-1'''
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608802891657153625)
,p_name=>'P303_DESCRIPTION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Description'
,p_source=>'P302_DESCRIPTION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P302_DESCRIPTION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608802935512153626)
,p_name=>'P303_ACL_STATUS_LEVEL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Access Control'
,p_source=>'P301_ACL_STATUS_LEVEL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ACL LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11045413827346451385)||'.'
,p_cHeight=>1
,p_display_when=>'P301_ACL_STATUS_LEVEL'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608803056041153627)
,p_name=>'P303_PROJECT_OWNER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Project Owner(s)'
,p_source=>'P301_PROJECT_OWNER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P301_PROJECT_OWNER'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608803168289153628)
,p_name=>'P303_PROJECT_OWNER_2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_source=>'P301_PROJECT_OWNER2'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P301_PROJECT_OWNER2'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608803216157153629)
,p_name=>'P303_PROJECT_OWNER_3'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_source=>'P301_PROJECT_OWNER3'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P301_PROJECT_OWNER3'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608803315758153630)
,p_name=>'P303_PROJECT_OWNER_4'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_source=>'P301_PROJECT_OWNER4'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P301_PROJECT_OWNER4'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608803476549153631)
,p_name=>'P303_PROJECT_OWNER_5'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_source=>'P301_PROJECT_OWNER5'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P301_PROJECT_OWNER5'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608803596090153632)
,p_name=>'P303_PROJECT_OWNER_6'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_source=>'P301_PROJECT_OWNER6'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P301_PROJECT_OWNER6'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608803707239153633)
,p_name=>'P303_PROJECT_OWNER_7'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_source=>'P301_PROJECT_OWNER7'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P301_PROJECT_OWNER7'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608803753590153634)
,p_name=>'P303_PROJECT_OWNER_8'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_source=>'P301_PROJECT_OWNER8'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P301_PROJECT_OWNER8'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608803820806153635)
,p_name=>'P303_PROJECT_OWNER_9'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_source=>'P301_PROJECT_OWNER9'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P301_PROJECT_OWNER9'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608804013887153636)
,p_name=>'P303_PROJECT_OWNER_10'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_source=>'P301_PROJECT_OWNER10'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P301_PROJECT_OWNER10'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608804033858153637)
,p_name=>'P303_PROJECT_OWNER_11'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_source=>'P301_PROJECT_OWNER11'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P301_PROJECT_OWNER11'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608804115604153638)
,p_name=>'P303_PROJECT_OWNER_12'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_source=>'P301_PROJECT_OWNER12'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P301_PROJECT_OWNER12'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608804255675153639)
,p_name=>'P303_GOAL'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Goal'
,p_source=>'P302_GOAL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P302_GOAL'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608804376316153640)
,p_name=>'P303_PROJECT_CUSTOMER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Customer'
,p_source=>'P302_PROJECT_CUSTOMER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P302_PROJECT_CUSTOMER'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608804473730153641)
,p_name=>'P303_TAGS'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Tags'
,p_source=>'P302_TAGS'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P302_TAGS'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608804560094153642)
,p_name=>'P303_URL'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Primary URL'
,p_source=>'P302_URL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P302_URL'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11608804627849153643)
,p_name=>'P303_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12611567420331010917)
,p_name=>'P303_SIZE_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Project Size'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_size varchar2(100);',
'begin',
'    for c in',
'    (',
'        select project_size',
'          from eba_proj_status_sizes',
'         where id = :P302_SIZE_ID',
'    )',
'    loop',
'        l_size := c.project_size;',
'    end loop;',
'    return l_size;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>':P302_SIZE_ID is not null'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(12131994237014236636)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13305557406874764835)
,p_name=>'P303_TEMPLATE_BASED'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Template-Based Project'
,p_source=>'Yes'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P300_USE_TEMPLATE_YN'
,p_display_when2=>'Y'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(13510291845500699844)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13305557544828764837)
,p_name=>'P303_TEMPLATE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Template'
,p_source=>'P300_TEMPLATE_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'PROJECT TEMPLATES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_templates',
' order by 1'))
,p_display_when=>'P300_TEMPLATE_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(13510291845500699844)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13305557675021764838)
,p_name=>'P303_START_DATE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Start Date'
,p_format_mask=>'fmDD-MON-YYYY fmHH:MI PM'
,p_source=>'P300_PROJECT_START_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P300_PROJECT_START_DATE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(13510291845500699844)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20619523735754799360)
,p_name=>'P303_COUNTRY'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Country'
,p_source=>'P302_COUNTRY_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'COUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select country_name d, id r',
'from eba_proj_countries',
'order by lower(country_name)'))
,p_cHeight=>1
,p_display_when=>'P302_COUNTRY_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(18882216890018093962)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20619523876382799361)
,p_name=>'P303_REGION'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_prompt=>'Region'
,p_source=>'P302_REGION_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REGIONS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select region_name d, id r',
'from eba_proj_regions',
'order by lower(region_name)'))
,p_cHeight=>1
,p_display_when=>'P302_REGION_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(18882216890018093962)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21048392358190075532)
,p_name=>'P303_DEAL_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11568079764172115393)
,p_item_default=>':P302_DEAL_TYPE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Deal Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'DEAL TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    deal_type d,',
'    id r',
'from',
'    eba_proj_deal_types',
'where',
'    is_active_yn = ''Y''',
'order by',
'    display_sequence'))
,p_cHeight=>1
,p_display_when=>'P303_DEAL_TYPE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(19136688366517761209)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11608802176436153618)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11568078963981115393)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11608802222919153619)
,p_event_id=>wwv_flow_imp.id(11608802176436153618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11609373671688226543)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set category if needed'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_id number := null;',
'begin',
'if :P302_PROJECT_CATEGORY = 0 and :P302_NEW_CATEGORY is not null then',
'   insert into EBA_PROJ_STATUS_CATS (CATEGORY) values (:P302_NEW_CATEGORY)',
'   returning id into l_id;',
'elsif :P302_PROJECT_CATEGORY is not null and :P302_PROJECT_CATEGORY > 0 then',
'   l_id := :P302_PROJECT_CATEGORY;',
'else',
'   l_id := null;',
'end if;',
':P302_PROJECT_CATEGORY := l_id;',
'commit;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_button_id=>wwv_flow_imp.id(11568079394384115393)
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>11609373671688226543
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11609383216866144216)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Project'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into EBA_PROJ_STATUS',
'(IS_DELETED_YN, TEMPLATE_ID, CAT_ID, PARENT_PROJECT_ID, PROJECT, DESCRIPTION, PROJECT_CUSTOMER,',
'ACL_STATUS_LEVEL, PROJECT_STATUS, TAGS, GOAL, SIZE_ID, RESTRICT_MS_AI_MANAGEMENT,',
'URL, CODE_NAME, PROJECT_FLEX_01, PROJECT_FLEX_02, PROJECT_FLEX_03, PROJECT_FLEX_04,',
'PROJECT_FLEX_05, PROJECT_FLEX_06, PROJECT_FLEX_07, PROJECT_FLEX_08,',
'PROJECT_FLEX_N01, PROJECT_FLEX_N02, PROJECT_FLEX_N03, PROJECT_FLEX_N04,',
'PROJECT_FLEX_D01, PROJECT_FLEX_D02, PROJECT_FLEX_D03, PROJECT_FLEX_D04,',
'PROJECT_FLEX_D05, PROJECT_FLEX_D06, PROJECT_FLEX_D07, PROJECT_FLEX_D08,',
'PROJECT_FLEX_D09, PROJECT_FLEX_D10, PROJECT_FLEX_D11, PROJECT_FLEX_D12,',
'PROJECT_FLEX_CLOB, DEAL_TYPE_ID, PROJECT_START_DATE)',
'values',
'(''N'', :P300_TEMPLATE_ID, :P302_PROJECT_CATEGORY, :P300_PARENT_PROJECT_ID, :P300_PROJECT, :P302_DESCRIPTION, :P302_PROJECT_CUSTOMER, ',
':P301_ACL_STATUS_LEVEL, :P302_PROJECT_STATUS, :P302_TAGS, :P302_GOAL, :P302_SIZE_ID, :P301_RESTRICT_MS_AI_MGT,',
':P302_URL, :P300_CODE_NAME, :P300_PROJECT_FLEX_01, :P300_PROJECT_FLEX_02, :P300_PROJECT_FLEX_03, :P300_PROJECT_FLEX_04,',
':P300_PROJECT_FLEX_05, :P300_PROJECT_FLEX_06, :P300_PROJECT_FLEX_07, :P300_PROJECT_FLEX_08,',
':P300_PROJECT_FLEX_N01, :P300_PROJECT_FLEX_N02, :P300_PROJECT_FLEX_N03, :P300_PROJECT_FLEX_N04,',
':P300_PROJECT_FLEX_D01, :P300_PROJECT_FLEX_D02, :P300_PROJECT_FLEX_D03, :P300_PROJECT_FLEX_D04,',
':P300_PROJECT_FLEX_D05, :P300_PROJECT_FLEX_D06, :P300_PROJECT_FLEX_D07, :P300_PROJECT_FLEX_D08,',
':P300_PROJECT_FLEX_D09, :P300_PROJECT_FLEX_D10, :P300_PROJECT_FLEX_D11, :P300_PROJECT_FLEX_D12,',
':P300_PROJECT_FLEX_CLOB, :P302_DEAL_TYPE, :P300_PROJECT_START_DATE)',
'returning id into :P303_PROJECT_ID;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Unable to create project. #SQLERRM#'
,p_process_when_button_id=>wwv_flow_imp.id(11568079394384115393)
,p_process_success_message=>'Project created. '
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_return_key_into_item1=>'P2_ID'
,p_internal_uid=>11609383216866144216
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20619523919394799362)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Country Info'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into eba_proj_status_country_ref',
'(project_id, country_id)',
'values',
'(:P303_PROJECT_ID, :P302_COUNTRY_ID);'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11568079394384115393)
,p_process_when=>'P302_COUNTRY_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>wwv_flow_imp.id(18882216890018093962)
,p_internal_uid=>20619523919394799362
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11608805014641153646)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add Project Owners'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_project_id number := :P303_PROJECT_ID;',
'    function get_user_id ( p_email_address in varchar2 ) return number is',
'        l_user_id number;',
'    begin',
'        for c in (',
'            select id',
'            from eba_proj_status_users',
'            where lower(username) = lower(p_email_address)',
'        ) loop',
'            l_user_id := c.id;',
'        end loop;',
'        if l_user_id is null then',
'            insert into eba_proj_status_users',
'                ( username, access_level_id )',
'            values ( p_email_address, 0 )',
'            returning id into l_user_id;',
'        end if;',
'        return l_user_id;',
'    end get_user_id;',
'',
'    procedure add_project_user (',
'        p_user_id    in number,',
'        p_project_id in number,',
'        p_role_id    in number,',
'        p_acl_level  in number',
'    ) is',
'    begin',
'        if p_user_id is null or p_project_id is null or p_role_id is null or p_acl_level is null then',
'            raise_application_error(-20000,''An error was encountered while creating a project member. p_user_id = '' || p_user_id || ''p_project_id = '' || p_project_id || ''p_role_id = '' || p_role_id || ''p_acl_level = '' || p_acl_level);',
'        end if;',
'        insert into EBA_PROJ_USER_REF',
'            (user_id, project_id, role_id, acl_status_level)',
'        values',
'            (p_user_id, p_project_id, p_role_id, p_acl_level);',
'    end add_project_user;',
'begin',
'    if :P301_PROJECT_OWNER is not null and :P301_OWNER_ROLE is not null and :P301_OWNER_ACL is not null then',
'        add_project_user(',
'            p_user_id    => get_user_id(p_email_address => :P301_PROJECT_OWNER),',
'            p_project_id => l_project_id,',
'            p_role_id    => :P301_OWNER_ROLE,',
'            p_acl_level  => :P301_OWNER_ACL',
'        );',
'    end if;',
'    if :P301_PROJECT_OWNER2 is not null and :P301_OWNER_ROLE2 is not null and :P301_OWNER_ACL2 is not null then',
'        add_project_user(',
'            p_user_id    => get_user_id(p_email_address => :P301_PROJECT_OWNER2),',
'            p_project_id => l_project_id,',
'            p_role_id    => :P301_OWNER_ROLE2,',
'            p_acl_level  => :P301_OWNER_ACL2',
'        );',
'    end if;',
'    if :P301_PROJECT_OWNER3 is not null and :P301_OWNER_ROLE3 is not null and :P301_OWNER_ACL3 is not null then',
'        add_project_user(',
'            p_user_id    => get_user_id(p_email_address => :P301_PROJECT_OWNER3),',
'            p_project_id => l_project_id,',
'            p_role_id    => :P301_OWNER_ROLE3,',
'            p_acl_level  => :P301_OWNER_ACL3',
'        );',
'    end if;',
'    if :P301_PROJECT_OWNER4 is not null and :P301_OWNER_ROLE4 is not null and :P301_OWNER_ACL4 is not null then',
'        add_project_user(',
'            p_user_id    => get_user_id(p_email_address => :P301_PROJECT_OWNER4),',
'            p_project_id => l_project_id,',
'            p_role_id    => :P301_OWNER_ROLE4,',
'            p_acl_level  => :P301_OWNER_ACL4',
'        );',
'    end if;',
'    if :P301_PROJECT_OWNER5 is not null and :P301_OWNER_ROLE5 is not null and :P301_OWNER_ACL5 is not null then',
'        add_project_user(',
'            p_user_id    => get_user_id(p_email_address => :P301_PROJECT_OWNER5),',
'            p_project_id => l_project_id,',
'            p_role_id    => :P301_OWNER_ROLE5,',
'            p_acl_level  => :P301_OWNER_ACL5',
'        );',
'    end if;',
'    if :P301_PROJECT_OWNER6 is not null and :P301_OWNER_ROLE6 is not null and :P301_OWNER_ACL6 is not null then',
'        add_project_user(',
'            p_user_id    => get_user_id(p_email_address => :P301_PROJECT_OWNER6),',
'            p_project_id => l_project_id,',
'            p_role_id    => :P301_OWNER_ROLE6,',
'            p_acl_level  => :P301_OWNER_ACL6',
'        );',
'    end if;',
'    if :P301_PROJECT_OWNER7 is not null and :P301_OWNER_ROLE7 is not null and :P301_OWNER_ACL7 is not null then',
'        add_project_user(',
'            p_user_id    => get_user_id(p_email_address => :P301_PROJECT_OWNER7),',
'            p_project_id => l_project_id,',
'            p_role_id    => :P301_OWNER_ROLE7,',
'            p_acl_level  => :P301_OWNER_ACL7',
'        );',
'    end if;',
'    if :P301_PROJECT_OWNER8 is not null and :P301_OWNER_ROLE8 is not null and :P301_OWNER_ACL8 is not null then',
'        add_project_user(',
'            p_user_id    => get_user_id(p_email_address => :P301_PROJECT_OWNER8),',
'            p_project_id => l_project_id,',
'            p_role_id    => :P301_OWNER_ROLE8,',
'            p_acl_level  => :P301_OWNER_ACL8',
'        );',
'    end if;',
'    if :P301_PROJECT_OWNER9 is not null and :P301_OWNER_ROLE9 is not null and :P301_OWNER_ACL9 is not null then',
'        add_project_user(',
'            p_user_id    => get_user_id(p_email_address => :P301_PROJECT_OWNER9),',
'            p_project_id => l_project_id,',
'            p_role_id    => :P301_OWNER_ROLE9,',
'            p_acl_level  => :P301_OWNER_ACL9',
'        );',
'    end if;',
'    if :P301_PROJECT_OWNER10 is not null and :P301_OWNER_ROLE10 is not null and :P301_OWNER_ACL10 is not null then',
'        add_project_user(',
'            p_user_id    => get_user_id(p_email_address => :P301_PROJECT_OWNER10),',
'            p_project_id => l_project_id,',
'            p_role_id    => :P301_OWNER_ROLE10,',
'            p_acl_level  => :P301_OWNER_ACL10',
'        );',
'    end if;',
'    if :P301_PROJECT_OWNER11 is not null and :P301_OWNER_ROLE11 is not null and :P301_OWNER_ACL11 is not null then',
'        add_project_user(',
'            p_user_id    => get_user_id(p_email_address => :P301_PROJECT_OWNER11),',
'            p_project_id => l_project_id,',
'            p_role_id    => :P301_OWNER_ROLE11,',
'            p_acl_level  => :P301_OWNER_ACL11',
'        );',
'    end if;',
'    if :P301_PROJECT_OWNER12 is not null and :P301_OWNER_ROLE12 is not null and :P301_OWNER_ACL12 is not null then',
'        add_project_user(',
'            p_user_id    => get_user_id(p_email_address => :P301_PROJECT_OWNER12),',
'            p_project_id => l_project_id,',
'            p_role_id    => :P301_OWNER_ROLE12,',
'            p_acl_level  => :P301_OWNER_ACL12',
'        );',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Unable to create project owners. #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11568079394384115393)
,p_process_when=>'P303_PROJECT_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Project owners created. '
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>11608805014641153646
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13305557994766764841)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add Template MSs and AIs'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_start    timestamp with local time zone;',
'    l_ms_start timestamp with local time zone;',
'    l_ms_due   timestamp with local time zone;',
'    l_ms_id    number;',
'',
'    procedure add_action_items',
'    (',
'        p_template_id    in number,',
'        p_start_date     in timestamp with local time zone,',
'        p_ms_template_id in number default null,',
'        p_ms_id          in number default null',
'    )',
'    is',
'        l_ai_due timestamp with local time zone;',
'    begin',
'        -- Loop over template action items',
'        for ai in',
'        (',
'            select ait.id,',
'                   ait.name,',
'                   ait.description,',
'                   ait.due_date_offset,',
'                   ait.type_id,',
'                   ait.owner,',
'                   nvl(ait.inc_in_status_eml_yn,''N'') inc_in_status_eml_yn,',
'                   ait.owner_role_id,',
'                   ait.link_text,',
'                   ait.link_url',
'              from eba_proj_template_ai ait',
'             where ait.template_id = p_template_id',
'               and ( ',
'                        (',
'                            p_ms_template_id is null',
'                            and',
'                            ait.milestone_id is null',
'                        )',
'                        or',
'                        ( ait.milestone_id = p_ms_template_id )',
'                   )',
'             order by ait.due_date_offset',
'        )',
'        loop',
'            l_ai_due := eba_proj_dates.add_workdays( p_start_date, ai.due_date_offset );',
'            -- Create the actual Action Item',
'            insert into eba_proj_status_ais$',
'            (',
'                project_id,',
'                template_id,',
'                action_owner_01,',
'                owner_role_id,',
'                action,',
'                action_description,',
'                due_date,',
'                action_status,',
'                type_id,',
'                inc_in_status_eml_yn,',
'                milestone_id,',
'                link_text,',
'                link_url',
'            )',
'            values',
'            (',
'                :P303_PROJECT_ID,',
'                ai.id,',
'                ai.owner,',
'                ai.owner_role_id,',
'                ai.name,',
'                ai.description,',
'                l_ai_due,',
'                ''Open'',',
'                ai.type_id,',
'                ai.inc_in_status_eml_yn,',
'                p_ms_id,',
'                ai.link_text,',
'                ai.link_url',
'            );',
'        end loop;',
'    end add_action_items;',
'begin',
'    l_start := to_timestamp_tz( :P300_PROJECT_START_DATE || ''09:00 AM'' || '' '' || nvl(:TZ,''US/Pacific''), ''fmDD-MON-YYYY fmHH:MI PM TZR'' );',
'    -- Loop over template milestones',
'    for ms in',
'    (',
'        select mst.id,',
'               mst.start_date_offset,',
'               mst.due_date_offset,',
'               mst.name,',
'               mst.description,',
'               mst.is_major_yn,',
'               mst.owner,',
'               mst.owner_role_id',
'          from eba_proj_template_ms mst',
'         where mst.template_id = :P300_TEMPLATE_ID',
'         start with mst.parent_milestone_id is null',
'        connect by prior mst.id = mst.parent_milestone_id',
'    )',
'    loop ',
'        l_ms_start := eba_proj_dates.add_workdays( l_start, eba_proj_template_fw.start_offset(ms.id) );',
'        l_ms_due   := eba_proj_dates.add_workdays( l_ms_start, ms.due_date_offset );',
'        -- Create the actual Milestone',
'        insert into eba_proj_status_ms$',
'        (',
'            project_id,',
'            template_id,',
'            milestone_name,',
'            milestone_description,',
'            milestone_start_date,',
'            milestone_date,',
'            milestone_status,',
'            milestone_owner,',
'            owner_role_id,',
'            is_major_yn',
'        )',
'        values',
'        (',
'            :P303_PROJECT_ID,',
'            ms.id,',
'            ms.name,',
'            ms.description,',
'            l_ms_start,',
'            l_ms_due,',
'            ''Open'',',
'            ms.owner,',
'            ms.owner_role_id,',
'            ms.is_major_yn',
'        ) returning id into l_ms_id;',
'',
'        -- Create action items associated with the template milestone',
'        add_action_items(',
'            p_template_id    => :P300_TEMPLATE_ID,',
'            p_start_date     => l_ms_start,',
'            p_ms_template_id => ms.id,',
'            p_ms_id          => l_ms_id',
'        );',
'',
'    end loop;',
'',
'    -- Create action items that are not associated with any template milestones',
'    add_action_items(',
'        p_template_id    => :P300_TEMPLATE_ID,',
'        p_start_date     => l_start,',
'        p_ms_template_id => null,',
'        p_ms_id          => null',
'    );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11568079394384115393)
,p_process_when=>':P300_USE_TEMPLATE_YN = ''Y'' and :P300_TEMPLATE_ID is not null'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'Template milestones and action items created.'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>wwv_flow_imp.id(13510291845500699844)
,p_internal_uid=>13305557994766764841
);
wwv_flow_imp.component_end;
end;
/
