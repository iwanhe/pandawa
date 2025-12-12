prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'Project Details'
,p_page_mode=>'MODAL'
,p_step_title=>'Project Details'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.sidebar-region {width: 300px !important}',
'</style>'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var htmldb_ch_message=''"OK_TO_GET_NEXT_PREV_PK_VALUE"'';'))
,p_step_template=>wwv_flow_imp.id(6672343678616369853)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6147049884496245334)
,p_plug_name=>'Custom Attributes'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7707807539326721199)
,p_plug_name=>'Region Display Selector'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'SESSION')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8903292923759537312)
,p_plug_name=>'Project'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8903296338369537318)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11646584085571978325)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672347163384369864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8903293218774537312)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11646584085571978325)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8903293134752537312)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11646584085571978325)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Project'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P2_ID is null',
'and',
'(',
'    (',
'        eba_proj_stat_ui.get_authorization_level(:APP_USER) >= 2',
'        and',
'        replace(eba_proj_fw.get_preference_value( ''PROJECT_CREATE_REQ_AUTH_ROLE'' ),''Preference does not exist'',''CONTRIBUTORS'') =  ''CONTRIBUTORS''',
'    )',
'    or',
'    (',
'        eba_proj_stat_ui.get_authorization_level(:APP_USER) >= 3',
'        and',
'        replace(eba_proj_fw.get_preference_value( ''PROJECT_CREATE_REQ_AUTH_ROLE'' ),''Preference does not exist'',''CONTRIBUTORS'') =  ''ADMINS''',
'    )',
'    or',
'    (',
'        eba_proj_stat_ui.get_authorization_level(:APP_USER) >= 4',
'        and',
'        replace(eba_proj_fw.get_preference_value( ''PROJECT_CREATE_REQ_AUTH_ROLE'' ),''Preference does not exist'',''CONTRIBUTORS'') =  ''SUPER_ADMINS''',
'    )',
')'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8903293434623537313)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11646584085571978325)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8903293331056537312)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11646584085571978325)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Delete'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7032655508885178614)
,p_branch_name=>'Go To &PROJECT_CAME_FROM.'
,p_branch_action=>'f?p=&APP_ID.:&PROJECT_CAME_FROM.:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(8903293331056537312)
,p_branch_sequence=>10
,p_branch_comment=>'Created 18-NOV-2011 05:55 by DAVID.GALE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8903294143265537314)
,p_branch_name=>'Go To Page &LAST_VIEW.'
,p_branch_action=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2651405833434494560)
,p_name=>'P2_HEADLINE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Headline'
,p_source=>'HEADLINE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
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
 p_id=>wwv_flow_imp.id(2651405929525494561)
,p_name=>'P2_REQUESTING_TEAM'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Requesting Team(s)'
,p_source=>'REQUESTING_TEAM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select distinct REQUESTING_TEAM from eba_proj_status;'
,p_cSize=>30
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(2661828693770016772)
,p_help_text=>'When providing more than one requesting team, please use a comma-separated list.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2651406040533494562)
,p_name=>'P2_IMPACTED_ENVIRONMENT'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Impacted Environment'
,p_source=>'IMPACTED_ENVIRONMENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select distinct IMPACTED_ENVIRONMENT from eba_proj_status;'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(2661829296087027741)
,p_help_text=>'When providing more than one impacted environment, please use a comma-separated list.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4004123635788779543)
,p_name=>'P2_PROJECT_FLEX_D05'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex D05'
,p_source=>'PROJECT_FLEX_D05'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(4004123710705779544)
,p_name=>'P2_PROJECT_FLEX_D06'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex D06'
,p_source=>'PROJECT_FLEX_D06'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(4004123812375779545)
,p_name=>'P2_PROJECT_FLEX_D07'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex D07'
,p_source=>'PROJECT_FLEX_D07'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(4004123939767779546)
,p_name=>'P2_PROJECT_FLEX_D08'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex D08'
,p_source=>'PROJECT_FLEX_D08'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(4004124098829779547)
,p_name=>'P2_PROJECT_FLEX_D09'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex D09'
,p_source=>'PROJECT_FLEX_D09'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(4004124130546779548)
,p_name=>'P2_PROJECT_FLEX_D10'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex D10'
,p_source=>'PROJECT_FLEX_D10'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(4004124237685779549)
,p_name=>'P2_PROJECT_FLEX_D11'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex D11'
,p_source=>'PROJECT_FLEX_D11'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(4004124338157779550)
,p_name=>'P2_PROJECT_FLEX_D12'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex D12'
,p_source=>'PROJECT_FLEX_D12'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(4036792302498725255)
,p_name=>'P2_LOGO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Logo'
,p_source=>'LOGO_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Upload an image file (.png, .jpg, .gif, etc...) that represents this project. The image''s height and width should be 128x128 or 256x256 (in pixels) and cannot exceed 50kb in size.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'blob_last_updated_column', 'LOGO_LASTUPD',
  'character_set_column', 'LOGO_CHARSET',
  'content_disposition', 'attachment',
  'display_as', 'NATIVE',
  'display_download_link', 'Y',
  'download_link_text', 'Download Image',
  'file_types', 'image/*',
  'filename_column', 'LOGO_NAME',
  'mime_type_column', 'LOGO_MIMETYPE',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4036792617804725259)
,p_name=>'P2_LOGO_DISPLAY'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_post_element_text=>'&nbsp;<button class="t-Button t-Button--small" id="deletePic" type="button">Delete Logo</button>'
,p_source=>'LOGO_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'style="max-width:500px;max-height:250px;"'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null from eba_proj_status s',
'where s.id = :P200_ID and logo_blob is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'DB_COLUMN',
  'blob_last_updated_column', 'LOGO_LASTUPD',
  'filename_column', 'LOGO_NAME')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4294092471285891488)
,p_name=>'P2_PROJECT_START_DATE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Start Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'PROJECT_START_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5749883112557676770)
,p_name=>'P2_DESCRIPTION'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>6
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5981959793798211897)
,p_name=>'P2_URL'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Primary URL'
,p_source=>'URL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>4000
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(6144308904050379930)
,p_name=>'P2_PROJECT_FLEX_N01'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Potential Revenue'
,p_source=>'PROJECT_FLEX_N01'
,p_source_type=>'DB_COLUMN'
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
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6144309486366388183)
,p_name=>'P2_PROJECT_FLEX_N02'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Random Number'
,p_source=>'PROJECT_FLEX_N02'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144309682915389802)
,p_name=>'P2_PROJECT_FLEX_N03'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex N03'
,p_source=>'PROJECT_FLEX_N03'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144309912448391297)
,p_name=>'P2_PROJECT_FLEX_N04'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex N04'
,p_source=>'PROJECT_FLEX_N04'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144310205547394450)
,p_name=>'P2_PROJECT_FLEX_D01'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Completed ETA'
,p_source=>'PROJECT_FLEX_D01'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144310402312395978)
,p_name=>'P2_PROJECT_FLEX_D02'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'hhhh'
,p_source=>'PROJECT_FLEX_D02'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144310698862397614)
,p_name=>'P2_PROJECT_FLEX_D03'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'yyyy'
,p_source=>'PROJECT_FLEX_D03'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144310995627399049)
,p_name=>'P2_PROJECT_FLEX_D04'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ssss'
,p_source=>'PROJECT_FLEX_D04'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144311191314401104)
,p_name=>'P2_PROJECT_FLEX_CLOB'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex CLOB'
,p_source=>'PROJECT_FLEX_CLOB'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144311386785403189)
,p_name=>'P2_PROJECT_FLEX_01'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Cloud-Related?'
,p_source=>'PROJECT_FLEX_01'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144311683334404801)
,p_name=>'P2_PROJECT_FLEX_02'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'DG Test'
,p_source=>'PROJECT_FLEX_02'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144311913299406111)
,p_name=>'P2_PROJECT_FLEX_03'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex 03'
,p_source=>'PROJECT_FLEX_03'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144312110279407432)
,p_name=>'P2_PROJECT_FLEX_04'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex 04'
,p_source=>'PROJECT_FLEX_04'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144312806613409142)
,p_name=>'P2_PROJECT_FLEX_05'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex 05'
,p_source=>'PROJECT_FLEX_05'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144313002300411177)
,p_name=>'P2_PROJECT_FLEX_06'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex 06'
,p_source=>'PROJECT_FLEX_06'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144313298634412867)
,p_name=>'P2_PROJECT_FLEX_07'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex 07'
,p_source=>'PROJECT_FLEX_07'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(6144313494105414987)
,p_name=>'P2_PROJECT_FLEX_08'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(6147049884496245334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Flex 08'
,p_source=>'PROJECT_FLEX_08'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(8223041836883552055)
,p_name=>'P2_ACL_STATUS_LEVEL'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Access Control'
,p_source=>'ACL_STATUS_LEVEL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'PROJECT ACL LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11045413827346451385)||'.'
,p_colspan=>8
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''unlocked''',
'from eba_proj_status p',
'where id = :P2_ID',
'    and ( acl_status_level = 1',
'        or exists (select null',
'                   from eba_proj_status_users u,',
'                       eba_proj_user_ref rf,',
'                       eba_proj_roles r',
'                   where nvl(rf.acl_status_level, r.default_acl_status_level) = 3',
'                       and rf.project_id = p.id',
'                       and rf.role_id = r.id',
'                       and rf.user_id = u.id',
'                       and upper(u.username) = upper(:APP_USER)',
'                    )',
'    )',
'    or',
'    eba_proj_stat_ui.get_authorization_level(:APP_USER) = 4'))
,p_display_when_type=>'EXISTS'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from dual',
'where eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''N''',
'union all',
'select null',
'  from eba_proj_user_ref rf,',
'       eba_proj_roles r,',
'       eba_proj_status_users u',
' where (',
'            rf.project_id = :P2_ID',
'            and        ',
'            u.username = :APP_USER -- current user has an application account',
'            and ',
'            rf.user_id = u.id -- current user is a member of current project',
'            and',
'            rf.role_id = r.id -- current user has a role in current project',
'            and',
'            rf.acl_status_level = 3 -- with admin rights',
'        )',
'        or',
'        (',
'            u.access_level_id = 4 -- current user is a super admin',
'            and',
'            u.username = :APP_USER -- current user has an application account',
'        )'))
,p_read_only_when_type=>'NOT_EXISTS'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'   <strong>Open</strong> : project is visable to all users ',
'</p>',
'<p>',
'    <strong>Restricted</strong>: Only visable to project memebers (people assigned to the project) and any application user that has the <strong>super admin</strong> role.',
'</p>',
''))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8903294338056537314)
,p_name=>'P2_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8903294528837537315)
,p_name=>'P2_PROJECT'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Name'
,p_source=>'PROJECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>200
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8903294926444537315)
,p_name=>'P2_PROJECT_STATUS'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in (select  ID from EBA_PROJ_STATUS_CODES where STATUS_short_desc = ''Unknown'') loop',
'   return c1.id;',
'end loop;',
'return null;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Status'
,p_source=>'PROJECT_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PAGE 2 PROJECT_STATUS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATUS_short_desc display_value, ID return_value ',
'from EBA_PROJ_STATUS_CODES s',
'where s.is_active_yn = ''Y'' or id = :P2_PROJECT_STATUS',
'order by s.is_active_yn desc, s.display_sequence'))
,p_cHeight=>1
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8903350017489454064)
,p_name=>'P2_PROJECT_CATEGORY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_item_default=>'-1'
,p_prompt=>'&CAT_TITLE.'
,p_source=>'CAT_ID'
,p_source_type=>'DB_COLUMN'
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
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8903733943873991472)
,p_name=>'P2_GOAL'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Goal'
,p_source=>'GOAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>6
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'N',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8903734734440007663)
,p_name=>'P2_PROJECT_CUSTOMER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Customer'
,p_source=>'PROJECT_CUSTOMER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>255
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(8904227423615540732)
,p_name=>'P2_ROW_KEY'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Key'
,p_source=>'ROW_KEY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>'P2_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8921505236299135694)
,p_name=>'P2_TAGS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.TAGS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag',
'  from eba_proj_tags_type_sum',
' where content_type = ''STATUS''',
' order by 1'))
,p_cSize=>79
,p_cMaxlength=>4000
,p_tag_attributes=>'placeholder="Enter tags separated by commas"'
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'Tags may not contain the following characters: : ; \ / ? &')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8923930748778346074)
,p_name=>'P2_PARENT_PROJECT_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Parent Project'
,p_placeholder=>'Click icon to optionally identify a parent project'
,p_source=>'PARENT_PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project, id ',
'from eba_proj_status ',
'where ((:P2_ID is not null and id != :P2_ID) or :P2_ID is null) and ',
'   parent_project_id is null ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- No Parent -'
,p_cSize=>80
,p_cMaxlength=>4000
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(19782202788559795354)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8927663628091389441)
,p_name=>'P2_NEW_CATEGORY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New &CAT_TITLE.'
,p_placeholder=>'New &CAT_TITLE.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from ( select eba_proj_fw.get_preference_value(''CATEGORY_CREATION_LEVEL'') ccl,',
'            eba_proj_stat_ui.get_authorization_level( :APP_USER ) al',
'        from dual ) x',
'where x.al >= 3',
'    or ( x.al = 2 and x.ccl in (''CONTRIB'',''Preference does not exist''))'))
,p_display_when_type=>'EXISTS'
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(11984497473796778553)
,p_name=>'P2_SIZE_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Size'
,p_source=>'SIZE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project_size, id',
'from eba_proj_status_sizes',
'order by display_sequence'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Project Size -'
,p_cHeight=>1
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(12131994237014236636)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15711647019419245134)
,p_name=>'P2_RESTRICT_MS_AI_MANAGEMENT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Prevent Changes'
,p_source=>'RESTRICT_MS_AI_MANAGEMENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''unlocked''',
'from eba_proj_status p',
'where id = :P2_ID',
'    and ( acl_status_level = 1',
'        or exists (select null',
'                   from eba_proj_status_users u,',
'                       eba_proj_user_ref rf,',
'                       eba_proj_roles r',
'                   where nvl(rf.acl_status_level, r.default_acl_status_level) = 3',
'                       and rf.project_id = p.id',
'                       and rf.role_id = r.id',
'                       and rf.user_id = u.id',
'                       and upper(u.username) = upper(:APP_USER)',
'                    )',
'    )',
'    or',
'    eba_proj_stat_ui.get_authorization_level(:APP_USER) = 4'))
,p_display_when_type=>'EXISTS'
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18296371938154442037)
,p_name=>'P2_CODE_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Code Name'
,p_source=>'CODE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_restricted_characters=>'WEB_SAFE'
,p_required_patch=>wwv_flow_imp.id(19136678749050950256)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18296373364999442051)
,p_name=>'P2_DEAL_TYPE_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8903292923759537312)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Deal Type'
,p_source=>'DEAL_TYPE_ID'
,p_source_type=>'DB_COLUMN'
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
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P2_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(19136688366517761209)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8927666616410442898)
,p_validation_name=>'P2_PROJECT_CATEGORY'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (nvl(:P2_PROJECT_CATEGORY,''0'') = ''0'' and :P2_NEW_CATEGORY is not null) then ',
'   return true;',
'elsif nvl(:P2_PROJECT_CATEGORY,''0'') != ''0'' then ',
'   return true;',
'else',
'   return false;',
'end if;',
'return false;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'&CAT_TITLE. or New &CAT_TITLE. must be entered'
,p_validation_condition=>'P2_NEW_CATEGORY'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_imp.id(8903350017489454064)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7865817492998903777)
,p_validation_name=>'P2_PROJECT Name is Unique'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_num_projects integer;',
'begin',
'    select',
'        count(*)',
'    into',
'        l_num_projects',
'    from',
'        eba_proj_status',
'    where',
'        lower(project) = lower(:P2_PROJECT);',
'',
'    if l_num_projects > 0 then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'A project with this name already exists. Please use a different project name.'
,p_validation_condition=>':REQUEST in (''CREATE'')'
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(8903294528837537315)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8927664945537404018)
,p_name=>'show hide new cat'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_PROJECT_CATEGORY'
,p_condition_element=>'P2_PROJECT_CATEGORY'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8927665247876404036)
,p_event_id=>wwv_flow_imp.id(8927664945537404018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_NEW_CATEGORY'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8927665417166404041)
,p_event_id=>wwv_flow_imp.id(8927664945537404018)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_NEW_CATEGORY'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8285546741291271422)
,p_name=>'cancel dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8903293434623537313)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8285546887961271423)
,p_event_id=>wwv_flow_imp.id(8285546741291271422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(21048390845085075517)
,p_name=>'Set Region'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_COUNTRY_ID'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P2_REGION_ID'
,p_required_patch=>wwv_flow_imp.id(18882216890018093962)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21048391004595075518)
,p_event_id=>wwv_flow_imp.id(21048390845085075517)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_REGION_ID'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select region_id from eba_proj_countries where id = :P2_COUNTRY_ID;'
,p_attribute_07=>'P2_COUNTRY_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(21048391149414075520)
,p_name=>'Reset Country if Region Changes'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_REGION_ID'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_required_patch=>wwv_flow_imp.id(18882216890018093962)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21048391239116075521)
,p_event_id=>wwv_flow_imp.id(21048391149414075520)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P2_REGION_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21048391411081075522)
,p_event_id=>wwv_flow_imp.id(21048391149414075520)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_COUNTRY_ID'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(4036794746353725280)
,p_name=>'Delete Logo Image'
,p_event_sequence=>50
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#deletePic'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).text() === "Delete Logo"'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4036794904204725281)
,p_event_id=>wwv_flow_imp.id(4036794746353725280)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure you want to delete this project logo?'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4036794995412725282)
,p_event_id=>wwv_flow_imp.id(4036794746353725280)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update eba_proj_status$ set logo_blob = null, logo_mimetype = null, logo_name = null, logo_lastupd = null, logo_charset = null where id = :P2_ID;',
'commit;'))
,p_attribute_02=>'P2_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4036795015340725283)
,p_event_id=>wwv_flow_imp.id(4036794746353725280)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a'').text(''Download'').remove();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4036795171953725284)
,p_event_id=>wwv_flow_imp.id(4036794746353725280)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_LOGO_DISPLAY'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8903295734323537318)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_PROJ_STATUS'
,p_attribute_02=>'EBA_PROJ_STATUS'
,p_attribute_03=>'P2_ID'
,p_attribute_04=>'ID'
,p_process_error_message=>'Unable to fetch row.'
,p_internal_uid=>8903295734323537318
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8927665741644421741)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set category if needed'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_id number := null;',
'begin',
'if :P2_PROJECT_CATEGORY = 0 and :P2_NEW_CATEGORY is not null then',
'   insert into EBA_PROJ_STATUS_CATS (CATEGORY) values (:P2_NEW_CATEGORY)',
'   returning id into l_id;',
'elsif :P2_PROJECT_CATEGORY is not null and :P2_PROJECT_CATEGORY > 0 then',
'   l_id := :P2_PROJECT_CATEGORY;',
'else',
'   l_id := null;',
'end if;',
':P2_PROJECT_CATEGORY := l_id;',
'commit;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P2_NEW_CATEGORY'
,p_internal_uid=>8927665741644421741
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8919197122329388144)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Handle Delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update eba_proj_status$',
'set is_deleted_yn = ''Y'',',
'    deleted_by = :APP_USER,',
'    deleted_on = localtimestamp',
'where (id = :P2_ID',
'    or parent_project_id = :P2_ID);',
'    ',
'-- Now, make sure we land on a valid page.',
'if :PROJECT_CAME_FROM in (85,200) and :P2_PARENT_PROJECT_ID is not null then',
'    APEX_UTIL.SET_SESSION_STATE(''P200_ID'',:P2_PARENT_PROJECT_ID);',
'    APEX_UTIL.SET_SESSION_STATE(''P85_ID'', :P2_PARENT_PROJECT_ID);',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_button_id=>wwv_flow_imp.id(8903293331056537312)
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>8919197122329388144
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8903295939046537318)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_PROJ_STATUS'
,p_attribute_02=>'EBA_PROJ_STATUS'
,p_attribute_03=>'P2_ID'
,p_attribute_04=>'ID'
,p_attribute_09=>'P2_ID'
,p_attribute_11=>'I:U'
,p_attribute_12=>'Y'
,p_process_error_message=>'Unable to process row of table EBA_PROJ_STATUS.'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_success_message=>'Action Processed.'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_return_key_into_item1=>'P2_ID'
,p_internal_uid=>8903295939046537318
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8903296120050537318)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_imp.id(8903293331056537312)
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>8903296120050537318
);
wwv_flow_imp.component_end;
end;
/
