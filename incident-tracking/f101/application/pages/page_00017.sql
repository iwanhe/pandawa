prompt --application/pages/page_00017
begin
--   Manifest
--     PAGE: 00017
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
 p_id=>17
,p_name=>'Create Ticket'
,p_page_mode=>'MODAL'
,p_step_title=>'Create Ticket'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026474429031351)
,p_step_template=>wwv_flow_imp.id(1609165787138051967)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(3204234956647058484)
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2757988759095159569)
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
 p_id=>wwv_flow_imp.id(2762099967627944121)
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
 p_id=>wwv_flow_imp.id(2763568670491351783)
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
 p_id=>wwv_flow_imp.id(2107104967085755397)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2762099967627944121)
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
 p_id=>wwv_flow_imp.id(2757450955831021734)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(2762099967627944121)
,p_button_name=>'FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Ticket'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2757451059339021734)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2762099967627944121)
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
 p_id=>wwv_flow_imp.id(2757451558630021735)
,p_branch_action=>'f?p=&APP_ID.:16:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(2757451059339021734)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(300263011392933595)
,p_name=>'P17_TAGS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(2763568670491351783)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag',
'  from eba_intrack_tags_type_sum',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>80
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2763595953653356387)
,p_name=>'P17_URGENCY'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2763568670491351783)
,p_prompt=>'Urgency'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'URGENCY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select URGENCY_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_URGENCY',
' order by display_sequence'))
,p_field_template=>wwv_flow_imp.id(1609202139053052065)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '4',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2763596156093356387)
,p_name=>'P17_SEVERITY'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(2763568670491351783)
,p_prompt=>'Severity'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SEVERITY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select severity_code||''. ''||SEVERITY_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_SEVERITY',
' order by sequence_number'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609202139053052065)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2763596367141356387)
,p_name=>'P17_CATEGORY'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2763568670491351783)
,p_prompt=>'Category'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CATEGORY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CATEGORY_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_CATEGORY',
' order by display_sequence'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609202139053052065)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2763596554599356387)
,p_name=>'P17_DESCRIPTION'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(2763568670491351783)
,p_prompt=>'Description'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>32767
,p_cHeight=>14
,p_field_template=>wwv_flow_imp.id(1609202139053052065)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'N',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2764043372419541624)
,p_name=>'P17_STATUS'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(2763568670491351783)
,p_prompt=>'Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select status_code||''. ''||STATUS_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_STATUS',
' order by display_sequence'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609202139053052065)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2764218262685586137)
,p_name=>'P17_X'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(2763568670491351783)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2765151047597742629)
,p_name=>'P17_X2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(2763568670491351783)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2770345065172747963)
,p_name=>'P17_INDCIDENT_SUMMARY'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(2763568670491351783)
,p_prompt=>'Summary'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(1609202139053052065)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(2782362442785838300)
,p_computation_sequence=>10
,p_computation_item=>'P17_URGENCY'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select max(preference_value) v',
'from EBA_INTRACK_PREFERENCES  ',
'where PREFERENCE_NAME = ''DEFAULT_URGENCY'''))
,p_compute_when=>'P17_URGENCY'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(2782682744694876655)
,p_computation_sequence=>10
,p_computation_item=>'P17_SEVERITY'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select max(preference_value) v',
'from EBA_INTRACK_PREFERENCES  ',
'where PREFERENCE_NAME = ''DEFAULT_SEVERITY'''))
,p_compute_when=>'P17_SEVERITY'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(2782758173437885009)
,p_computation_sequence=>10
,p_computation_item=>'P17_CATEGORY'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select max(preference_value) v',
'from EBA_INTRACK_PREFERENCES  ',
'where PREFERENCE_NAME = ''DEFAULT_CATEGORY'''))
,p_compute_when=>'P17_CATEGORY'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(2782807159024890337)
,p_computation_sequence=>10
,p_computation_item=>'P17_STATUS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select max(preference_value) v',
'from EBA_INTRACK_PREFERENCES  ',
'where PREFERENCE_NAME = ''DEFAULT_STATUS'''))
,p_compute_when=>'P17_STATUS'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2300827528940951680)
,p_validation_name=>'Unique subject'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_intrack_incidents',
'where product_id = :P16_PRODUCT',
'    and product_version_id = :P16_PRODUCT_VERSION',
'    and subject = :P17_INCIDENT_SUMMARY'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'An incident with the same name already exists for this product.'
,p_associated_item=>wwv_flow_imp.id(2770345065172747963)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(300263386953935001)
,p_validation_name=>'Valid Characters in Tag'
,p_validation_sequence=>20
,p_validation=>'not regexp_like( :P17_TAGS, ''[:;#\/\\\?\&]'' )'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Tags may not contain the following characters: : ; \ / ? &'
,p_when_button_pressed=>wwv_flow_imp.id(2757450955831021734)
,p_associated_item=>wwv_flow_imp.id(300263011392933595)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1036239607268267768)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(2107104967085755397)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1036239671075267769)
,p_event_id=>wwv_flow_imp.id(1036239607268267768)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2764949267888663320)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create ticket'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_id           number;',
'    l_customer_id  number;',
'    l_contact_id   number;',
'begin',
'    if nvl(:P15_CUSTOMER,0) = 0 then',
'       l_customer_id := null;',
'    else',
'       l_customer_id := :P15_CUSTOMER;',
'    end if;',
'    if nvl(:P15_CONTACT,0) = 0 then',
'       l_contact_id := null;',
'    else',
'       l_contact_id := :P15_CONTACT;',
'    end if;',
'    l_id :=  eba_intrack_incident.create_ticket (',
'        p_customer_id             => l_customer_id,',
'        p_customer_name           => :P15_NEW_CUSTOMER_NAME,',
'        p_customer_web_site       => :P15_WEB_SITE,',
'        p_customer_address        => :P15_ADDRESS,',
'        p_customer_city           => :P15_CITY,',
'        p_customer_state          => :P15_STATE,',
'        p_customer_postal_code    => :P15_POSTAL_CODE,',
'        --                      ',
'        p_contact_id              => l_contact_id,',
'        p_contact_first_name      => :P15_CONTACT_FIRST_NAME,',
'        p_contact_last_name       => :P15_CONTACT_LAST_NAME,',
'        p_contact_email           => :P15_CONTACT_EMAIL,',
'        p_contact_department      => null,',
'        p_contact_phone           => :P15_CONTACT_PHONE,',
'        p_contact_phone_type      => null,',
'        p_contact_country         => :P15_CONTACT_COUNTRY,',
'        --                      ',
'        p_product_id              => :P16_PRODUCT,',
'        p_product_version_id      => :P16_PRODUCT_VERSION,',
'        p_product_additional_info => :P16_ADDITIONAL_PRODUCT_INFO,',
'        --',
'        p_urgency_id              => :P17_URGENCY,',
'        p_severity_id             => :P17_SEVERITY,',
'        p_category_id             => :P17_CATEGORY,',
'        p_status_id               => :P17_STATUS,',
'        --',
'        p_subject                 => :P17_INDCIDENT_SUMMARY,',
'        p_incident_description    => :P17_DESCRIPTION,',
'        p_bug_number              => null,',
'        p_additional_info         => null,',
'        --',
'        p_tags                    => :P17_TAGS);',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(2757450955831021734)
,p_process_success_message=>'Ticket Created'
,p_internal_uid=>2764949267888663320
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1036239477899267767)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1036239477899267767
);
wwv_flow_imp.component_end;
end;
/
