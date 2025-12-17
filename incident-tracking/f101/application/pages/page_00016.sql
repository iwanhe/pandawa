prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Create Ticket'
,p_page_mode=>'MODAL'
,p_step_title=>'Create Ticket'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026474429031351)
,p_step_template=>wwv_flow_imp.id(1609165787138051967)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(3204234956647058484)
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2757988566604159568)
,p_plug_name=>'Wizard'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_imp.id(2757987265671159566)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(1609201215784052059)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2762045861394942348)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169348961051977)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2763161169911209663)
,p_plug_name=>'content'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2107102984585749793)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2762045861394942348)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2757449163144021732)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(2762045861394942348)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202304669052069)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2757449052822021732)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2762045861394942348)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Previous'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2757449856435021733)
,p_branch_action=>'f?p=&APP_ID.:17:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(2757449163144021732)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2757449568775021733)
,p_branch_action=>'f?p=&APP_ID.:15:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(2757449052822021732)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2763223667271218371)
,p_name=>'P16_PRODUCT'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2763161169911209663)
,p_item_default=>'0'
,p_prompt=>'Product'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select product_name, id from EBA_INTRACK_PRODUCT',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select Product -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_imp.id(1609202139053052065)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2763338558969291694)
,p_name=>'P16_PRODUCT_VERSION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(2763161169911209663)
,p_prompt=>'Product Version'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select version_name, id',
'from EBA_INTRACK_VERSION',
'where PRODUCT_ID = :P16_PRODUCT',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select Version -'
,p_lov_cascade_parent_items=>'P16_PRODUCT'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_imp.id(1609202139053052065)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2763451651182327332)
,p_name=>'P16_ADDITIONAL_PRODUCT_INFO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2763161169911209663)
,p_prompt=>'Additional Product Information'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'N',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1036239324533267765)
,p_name=>'Cancel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(2107102984585749793)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1036239380945267766)
,p_event_id=>wwv_flow_imp.id(1036239324533267765)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
