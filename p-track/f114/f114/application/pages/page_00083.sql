prompt --application/pages/page_00083
begin
--   Manifest
--     PAGE: 00083
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
 p_id=>83
,p_name=>'Edit Milestone'
,p_page_mode=>'MODAL'
,p_step_title=>'Edit Milestone'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486601256078156)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6590735823473310530)
,p_plug_name=>'Additional Data'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672353576565369876)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7607360823034780509)
,p_plug_name=>'Edit Milestone'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7607361521020780521)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672347163384369864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7607361999739780522)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7607361521020780521)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7607361435134780521)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7607361521020780521)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Delete'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P83_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7607361347175780521)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7607361521020780521)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P83_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7607361308058780521)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7607361521020780521)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P83_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607364640607780893)
,p_name=>'P83_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7607360823034780509)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607364997094780913)
,p_name=>'P83_PROJECT_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7607360823034780509)
,p_use_cache_before_default=>'NO'
,p_source=>'PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607365342491780916)
,p_name=>'P83_MILESTONE_NAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7607360823034780509)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone'
,p_source=>'MILESTONE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607365755380780916)
,p_name=>'P83_MILESTONE_DESCRIPTION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7607360823034780509)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'MILESTONE_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607366179582780917)
,p_name=>'P83_MILESTONE_DATE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7607360823034780509)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Due Date'
,p_source=>'MILESTONE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607366962656780921)
,p_name=>'P83_MILESTONE_START_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7607360823034780509)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Start Date'
,p_source=>'MILESTONE_START_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607367723146780922)
,p_name=>'P83_MILESTONE_STATUS'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7607360823034780509)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'MILESTONE_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Open;Open,Completed;Completed'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607368127830780922)
,p_name=>'P83_MILESTONE_OWNER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7607360823034780509)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Owner'
,p_source=>'MILESTONE_OWNER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607368540845780923)
,p_name=>'P83_IS_MAJOR_YN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7607360823034780509)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Major Milestone'
,p_source=>'IS_MAJOR_YN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.SIMPLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607368931161780923)
,p_name=>'P83_TAGS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7607360823034780509)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.TAGS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag',
'from eba_proj_tags_type_sum',
'where content_type = ''MILESTONE''',
'order by upper(tag)'))
,p_cSize=>60
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'Tags may not contain the following characters: : ; \ / ? &')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607369347242780924)
,p_name=>'P83_MILESTONE_FLEX_01'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex 01'
,p_source=>'MILESTONE_FLEX_01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607369782530780924)
,p_name=>'P83_MILESTONE_FLEX_02'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex 02'
,p_source=>'MILESTONE_FLEX_02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607370142780780925)
,p_name=>'P83_MILESTONE_FLEX_03'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex 03'
,p_source=>'MILESTONE_FLEX_03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607370551468780926)
,p_name=>'P83_MILESTONE_FLEX_04'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex 04'
,p_source=>'MILESTONE_FLEX_04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607370926305780926)
,p_name=>'P83_MILESTONE_FLEX_05'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex 05'
,p_source=>'MILESTONE_FLEX_05'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_05'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607371342267780926)
,p_name=>'P83_MILESTONE_FLEX_06'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex 06'
,p_source=>'MILESTONE_FLEX_06'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_06'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607371800910780927)
,p_name=>'P83_MILESTONE_FLEX_07'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex 07'
,p_source=>'MILESTONE_FLEX_07'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_07'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607372123378780927)
,p_name=>'P83_MILESTONE_FLEX_08'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex 08'
,p_source=>'MILESTONE_FLEX_08'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_08'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607372589199780928)
,p_name=>'P83_MILESTONE_FLEX_N01'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex N01'
,p_source=>'MILESTONE_FLEX_N01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_N01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607372983143780928)
,p_name=>'P83_MILESTONE_FLEX_N02'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex N02'
,p_source=>'MILESTONE_FLEX_N02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_N02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607373390852780928)
,p_name=>'P83_MILESTONE_FLEX_N03'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex N03'
,p_source=>'MILESTONE_FLEX_N03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_N03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607373744988780929)
,p_name=>'P83_MILESTONE_FLEX_N04'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex N04'
,p_source=>'MILESTONE_FLEX_N04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_N04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607374193756780929)
,p_name=>'P83_MILESTONE_FLEX_D01'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex D01'
,p_source=>'MILESTONE_FLEX_D01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_D01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607374930683780930)
,p_name=>'P83_MILESTONE_FLEX_D02'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex D02'
,p_source=>'MILESTONE_FLEX_D02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_D02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607375811011780931)
,p_name=>'P83_MILESTONE_FLEX_D03'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex D03'
,p_source=>'MILESTONE_FLEX_D03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_D03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607376597703780932)
,p_name=>'P83_MILESTONE_FLEX_D04'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex D04'
,p_source=>'MILESTONE_FLEX_D04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_D04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7607377356899780933)
,p_name=>'P83_MILESTONE_FLEX_CLOB'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(6590735823473310530)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone Flex Clob'
,p_source=>'MILESTONE_FLEX_CLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_CLOB'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7607366657658780918)
,p_validation_name=>'P83_MILESTONE_DATE must be timestamp'
,p_validation_sequence=>70
,p_validation=>'P83_MILESTONE_DATE'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(7607366179582780917)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7607367462360780921)
,p_validation_name=>'P83_MILESTONE_START_DATE must be timestamp'
,p_validation_sequence=>80
,p_validation=>'P83_MILESTONE_START_DATE'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(7607366962656780921)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7607374668841780930)
,p_validation_name=>'P83_MILESTONE_FLEX_D01 must be timestamp'
,p_validation_sequence=>290
,p_validation=>'P83_MILESTONE_FLEX_D01'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(7607374193756780929)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7607375440204780931)
,p_validation_name=>'P83_MILESTONE_FLEX_D02 must be timestamp'
,p_validation_sequence=>300
,p_validation=>'P83_MILESTONE_FLEX_D02'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(7607374930683780930)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7607376251020780932)
,p_validation_name=>'P83_MILESTONE_FLEX_D03 must be timestamp'
,p_validation_sequence=>310
,p_validation=>'P83_MILESTONE_FLEX_D03'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(7607375811011780931)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7607377060266780933)
,p_validation_name=>'P83_MILESTONE_FLEX_D04 must be timestamp'
,p_validation_sequence=>320
,p_validation=>'P83_MILESTONE_FLEX_D04'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(7607376597703780932)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7607362064941780522)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7607361999739780522)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7607362858919780525)
,p_event_id=>wwv_flow_imp.id(7607362064941780522)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7607385824721780941)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_PROJ_STATUS_MS'
,p_attribute_02=>'EBA_PROJ_STATUS_MS'
,p_attribute_03=>'P83_ID'
,p_attribute_04=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>7607385824721780941
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7607386309115780942)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_PROJ_STATUS_MS'
,p_attribute_02=>'EBA_PROJ_STATUS_MS'
,p_attribute_03=>'P83_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>7607386309115780942
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7607386670744780943)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7607361435134780521)
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>7607386670744780943
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7607387046296780943)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>7607387046296780943
);
wwv_flow_imp.component_end;
end;
/
