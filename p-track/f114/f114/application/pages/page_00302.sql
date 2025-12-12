prompt --application/pages/page_00302
begin
--   Manifest
--     PAGE: 00302
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
 p_id=>302
,p_name=>'Create Project Wizard Step 3'
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
 p_id=>wwv_flow_imp.id(11238281238881566636)
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
 p_id=>wwv_flow_imp.id(11568059492644111513)
,p_plug_name=>'Create Project Wizard Container'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_imp.id(11567832365745161959)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6672376162491369936)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11568061085557111516)
,p_plug_name=>'Form Items'
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11606027249727989506)
,p_plug_name=>'Custom Attributes'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_column=>false
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11568060233666111515)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11238281238881566636)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11568060616008111515)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11238281238881566636)
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
 p_id=>wwv_flow_imp.id(11568059855624111514)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11238281238881566636)
,p_button_name=>'Previous'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Previous'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(11568062353029111519)
,p_branch_name=>'Go to Next Step'
,p_branch_action=>'f?p=&APP_ID.:303:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(11568060616008111515)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2661939047767730489)
,p_name=>'P302_HEADLINE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Headline'
,p_source=>'HEADLINE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(2661826592516005471)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2661939148435730490)
,p_name=>'P302_REQUESTING_TEAM'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Requesting Team(s)'
,p_source=>'REQUESTING_TEAM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select distinct REQUESTING_TEAM from eba_proj_status'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(2661828693770016772)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2661939231941730491)
,p_name=>'P302_IMPACTED_ENVIRONMENT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Impacted Environment(s)'
,p_source=>'IMPACTED_ENVIRONMENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(2661829296087027741)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4004126885401779575)
,p_name=>'P302_PROJECT_FLEX_D05'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex D05'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_D05'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4004126996422779576)
,p_name=>'P302_PROJECT_FLEX_D06'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex D06'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_D06'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4004127081628779577)
,p_name=>'P302_PROJECT_FLEX_D07'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex D07'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_D07'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4004127204291779578)
,p_name=>'P302_PROJECT_FLEX_D08'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex D08'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_D08'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4004127238811779579)
,p_name=>'P302_PROJECT_FLEX_D09'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex D09'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_D09'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4004127311565779580)
,p_name=>'P302_PROJECT_FLEX_D10'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex D10'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_D10'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4004127499216779581)
,p_name=>'P302_PROJECT_FLEX_D11'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex D11'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_D11'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4004127604365779582)
,p_name=>'P302_PROJECT_FLEX_D12'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex D12'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_D12'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11605922346734897417)
,p_name=>'P302_URL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_prompt=>'Primary URL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Use this attribute to identify an external web site that is considered the primary URL for this project.  For example it could be a link to an external system or cloud service, or a link to an external marketing page that describes your project.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606027551724989511)
,p_name=>'P302_PROJECT_FLEX_N01'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'What?'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_N01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_help_text=>'I''m updating a flex field. This should have limited update impact.'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606028427066989515)
,p_name=>'P302_PROJECT_FLEX_N02'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Random Number'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_N02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_help_text=>'Pick your favorite number!'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606029318506989516)
,p_name=>'P302_PROJECT_FLEX_N03'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex N03'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_N03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606029731807989517)
,p_name=>'P302_PROJECT_FLEX_N04'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex N04'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_N04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606030205270989518)
,p_name=>'P302_PROJECT_FLEX_D01'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex D01'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_D01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606030581566989518)
,p_name=>'P302_PROJECT_FLEX_D02'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex D02'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_D02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606031011514989519)
,p_name=>'P302_PROJECT_FLEX_D03'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex D03'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_D03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606031360519989520)
,p_name=>'P302_PROJECT_FLEX_D04'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex D04'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_D04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606031787427989521)
,p_name=>'P302_PROJECT_FLEX_01'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'New Field'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606032147633989521)
,p_name=>'P302_PROJECT_FLEX_02'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex 02'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606032611127989521)
,p_name=>'P302_PROJECT_FLEX_03'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex 03'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606032961459989522)
,p_name=>'P302_PROJECT_FLEX_04'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex 04'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606033375222989522)
,p_name=>'P302_PROJECT_FLEX_05'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex 05'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_05'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606033768203989523)
,p_name=>'P302_PROJECT_FLEX_06'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex 06'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_06'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606034150816989523)
,p_name=>'P302_PROJECT_FLEX_07'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex 07'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_07'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606034546198989524)
,p_name=>'P302_PROJECT_FLEX_08'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex 08'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_08'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606034948375989526)
,p_name=>'P302_PROJECT_FLEX_CLOB'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(11606027249727989506)
,p_prompt=>'Project Flex CLOB'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''PROJECT_FLEX_CLOB'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606048312422907731)
,p_name=>'P302_GOAL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_prompt=>'Goal'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>3
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Identifies the goal of the project.  Identifying the goal of a project promotes a common focus and understanding.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'N',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606055274242912656)
,p_name=>'P302_TAGS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_prompt=>'Tags'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.TAGS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag',
'  from eba_proj_tags_type_sum',
' where content_type = ''STATUS''',
' order by 1'))
,p_cSize=>80
,p_cMaxlength=>4000
,p_tag_attributes=>'placeholder="Enter tags separated by commas"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11606077351204995964)
,p_name=>'P302_PROJECT_CUSTOMER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_prompt=>'Customer'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>255
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'If this project is in support of a customer identify the customer name.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13489406016027658025)
,p_name=>'P302_PROJECT_STATUS'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--for c1 in (select  ID from EBA_PROJ_STATUS_CODES where STATUS_short_desc = ''Unknown'') loop',
'--   return c1.id;',
'--end loop;',
'return null;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PAGE 2 PROJECT_STATUS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATUS_short_desc display_value, ID return_value ',
'from EBA_PROJ_STATUS_CODES s',
'where s.is_active_yn = ''Y'' or id = :P2_PROJECT_STATUS',
'order by s.is_active_yn desc, s.display_sequence'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Select a status that best fits the project.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13489407445758660847)
,p_name=>'P302_PROJECT_CATEGORY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_item_default=>'-1'
,p_prompt=>'&CAT_TITLE.'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select display_value d, return_value r',
'from (',
'    select ''- Select &CAT_TITLE. -'' display_value, -1 return_value, 1 sort_order',
'    from dual',
'    union all',
'    select ''- New &CAT_TITLE. -'' display_value, 0 return_value, 2 sort_order',
'    from ( select eba_proj_fw.get_preference_value(''CATEGORY_CREATION_LEVEL'') ccl,',
'                eba_proj_stat_ui.get_authorization_level( :APP_USER ) al',
'            from dual ) x',
'    where x.al >= 3',
'        or ( x.al = 2 and x.ccl in (''CONTRIB'',''Preference does not exist''))',
'    union all',
'    select CATEGORY display_value, ID return_value, 3 sort_order',
'    from eba_proj_status_cats c',
')',
'order by sort_order, lower(display_value)'))
,p_cHeight=>1
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Select a &CAT_TITLE_LC. that best fits the project.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_item_comment=>'&CAT_TITLE_PL. allow projects to be grouped.  You can create new &CAT_TITLE_PL_LC. as needed.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13489413025314664913)
,p_name=>'P302_NEW_CATEGORY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_prompt=>'New &CAT_TITLE.'
,p_placeholder=>'New &CAT_TITLE.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from ( select eba_proj_fw.get_preference_value(''CATEGORY_CREATION_LEVEL'') ccl,',
'            eba_proj_stat_ui.get_authorization_level( :APP_USER ) al',
'        from dual ) x',
'where x.al >= 3',
'    or ( x.al = 2 and x.ccl in (''CONTRIB'',''Preference does not exist''))'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13489418942443721160)
,p_name=>'P302_SIZE_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_prompt=>'Project Size'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project_size, id',
'from eba_proj_status_sizes',
'order by display_sequence'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(12131994237014236636)
,p_help_text=>'Choose the size that best fits the project.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13489432329865672790)
,p_name=>'P302_DESCRIPTION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_prompt=>'Description'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>65
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Enter descriptive text about this project. HTML is not allowed.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20619521891640799341)
,p_name=>'P302_COUNTRY_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_prompt=>'Country'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'P302_COUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select country_name d, id r',
'  from eba_proj_countries',
' where :P302_REGION_ID is null',
'    or region_id = :P302_REGION_ID',
' order by lower(country_name)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(18882216890018093962)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20619522003941799342)
,p_name=>'P302_REGION_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_prompt=>'Region'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REGIONS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select region_name d, id r',
'from eba_proj_regions',
'order by lower(region_name)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(18882216890018093962)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20619522341385799346)
,p_name=>'P302_CORRECT_REGION_ID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21048392270391075531)
,p_name=>'P302_DEAL_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11568061085557111516)
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
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(19136688366517761209)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(13489456356205684834)
,p_validation_name=>'P302_NEW_CATEGORY Not Null'
,p_validation_sequence=>10
,p_validation=>'P302_NEW_CATEGORY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'&CAT_TITLE. or New &CAT_TITLE. must be entered'
,p_validation_condition=>'P302_PROJECT_CATEGORY'
,p_validation_condition2=>'0'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(11568060616008111515)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11608802356043153620)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11568060233666111515)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11608802509936153621)
,p_event_id=>wwv_flow_imp.id(11608802356043153620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13489415279711667940)
,p_name=>'show hide new cat'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_PROJECT_CATEGORY'
,p_condition_element=>'P302_PROJECT_CATEGORY'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13489426207840667950)
,p_event_id=>wwv_flow_imp.id(13489415279711667940)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_NEW_CATEGORY'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13489426617334667950)
,p_event_id=>wwv_flow_imp.id(13489415279711667940)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_NEW_CATEGORY'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13489415631970667948)
,p_event_id=>wwv_flow_imp.id(13489415279711667940)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_NEW_CATEGORY'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20619522022392799343)
,p_name=>'Set Region'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_COUNTRY_ID'
,p_condition_element=>'P302_COUNTRY_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20619522253474799345)
,p_event_id=>wwv_flow_imp.id(20619522022392799343)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_REGION_ID,P302_CORRECT_REGION_ID'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select region_id from eba_proj_countries where id = :P302_COUNTRY_ID'
,p_attribute_07=>'P302_COUNTRY_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20619522448682799347)
,p_name=>'Reset Country if Region Changes'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_REGION_ID'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20619522850637799351)
,p_event_id=>wwv_flow_imp.id(20619522448682799347)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P302_REGION_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20619522932449799352)
,p_event_id=>wwv_flow_imp.id(20619522448682799347)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_COUNTRY_ID'
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
