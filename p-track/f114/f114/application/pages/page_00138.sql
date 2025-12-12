prompt --application/pages/page_00138
begin
--   Manifest
--     PAGE: 00138
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
 p_id=>138
,p_name=>'Search'
,p_page_mode=>'MODAL'
,p_step_title=>'Search &APPLICATION_TITLE.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5849761210133065838)
,p_step_template=>wwv_flow_imp.id(6672343678616369853)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'700'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15213096440163322342)
,p_plug_name=>'Search'
,p_region_css_classes=>'search-dialog'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:t-Form--large:t-Form--stretchInputs:margin-top-md:margin-bottom-md:margin-left-md:margin-right-md'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15213096640403322344)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(15213096440163322342)
,p_button_name=>'Search'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'search-button'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>3
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(15213096799460322345)
,p_branch_name=>'Perform Search'
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,8:P8_SEARCH,P8_PROJECT:&P138_SEARCH.,&P138_PROJECT.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15213096569769322343)
,p_name=>'P138_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(15213096440163322342)
,p_item_default=>'null'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Search'
,p_placeholder=>'Search projects, people, and more...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19130303637157903220)
,p_name=>'P138_PROJECT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(15213096440163322342)
,p_prompt=>'Filter by Project'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project d, id r',
'from eba_proj_status',
'order by upper(project)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Search All Projects -'
,p_cHeight=>1
,p_colspan=>9
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_css_classes=>'margin-top-sm'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20043308372888787339)
,p_name=>'Add autocomplete off to form'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20043308477582787340)
,p_event_id=>wwv_flow_imp.id(20043308372888787339)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''form'').attr(''autocomplete'', ''off'' );'
);
wwv_flow_imp.component_end;
end;
/
