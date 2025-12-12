prompt --application/pages/page_00073
begin
--   Manifest
--     PAGE: 00073
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
 p_id=>73
,p_name=>'Action Item'
,p_page_mode=>'MODAL'
,p_step_title=>'Action Item'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486291560075385)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(6672343678616369853)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6156716104650793096)
,p_plug_name=>'Additional Data'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672353576565369876)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y''',
'    and eba_proj_fw.are_ms_ai_restricted(',
'        p_application_id => :APP_ID,',
'        p_username   => upper(:APP_USER),',
'        p_project_id => :P73_PROJECT_ID ) = ''N''',
'    and eba_proj_fw.template_lock_yn (',
'        p_application_id => :APP_ID,',
'        p_username   => upper(:APP_USER),',
'        p_action_item_id => :P73_ID ) = ''N'''))
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6629871475655806480)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(6672347163384369864)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8039714034233994321)
,p_plug_name=>'Action Item'
,p_region_template_options=>'#DEFAULT#:t-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8039717817858994337)
,p_plug_name=>'Created By'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>30
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in',
'(',
'    select created, created_by, updated, updated_by, project_id, original_due_date, due_date',
'      from eba_proj_status_ais',
'     where id = :P73_ID',
')',
'loop',
'    sys.htp.p(''Created ''||apex_util.get_since(c1.created)||'' by ''||apex_escape.html(eba_proj_fw.get_name_from_email_address(c1.created_by)));',
'    sys.htp.p(''<br>Last updated ''||apex_util.get_since(c1.updated)||'' by ''||apex_escape.html(eba_proj_fw.get_name_from_email_address(c1.updated_by)));',
'    sys.htp.p(''<br><a href="''||apex_util.prepare_url(''f?p=''||:app_id||'':200:''||:app_session||'':::200:P200_ID,P2_ID:''||',
'     c1.project_id||'',''||c1.project_id)||''">View Project</a>'');',
'    if nvl(c1.original_due_date, c1.due_date) < c1.due_date then',
'        sys.htp.p(''<br><strong>Due On:</strong> '' || ''<span style="text-decoration:line-through;">'' || to_char(c1.original_due_date, ''fmDD-MON-YYYY'') || ''</span> '' || to_char(c1.due_date, ''fmDD-MON-YYYY''));',
'    else',
'        sys.htp.p(''<br><strong>Due On:</strong> '' || to_char(c1.due_date, ''fmDD-MON-YYYY''));',
'    end if;',
'end loop;',
'',
'   ',
'         '))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P73_ID'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6873179584767525519)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6629871475655806480)
,p_button_name=>'CREATE_AGAIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Add and Add Another'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P73_ID is null',
'and eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''N'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8039714633509994331)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6629871475655806480)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Action Item'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P73_ID is null',
'and eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''N'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8039714243440994326)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6629871475655806480)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P73_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8039714436843994330)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6629871475655806480)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8039714823930994331)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6629871475655806480)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Delete'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P73_ID is not null',
'and eba_proj_fw.template_lock_yn (',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_action_item_id => :P73_ID ) = ''N''',
'and eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''N'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6873218301044530304)
,p_branch_action=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:73:P73_PROJECT_ID,P73_MILESTONE_ID:&P73_PROJECT_ID.,&P73_MILESTONE_ID.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6873179584767525519)
,p_branch_sequence=>10
,p_branch_comment=>'Created 20-OCT-2011 12:14 by DAVID.GALE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(13084277168219234141)
,p_branch_name=>'Back to Last View on Delete'
,p_branch_action=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(8039714823930994331)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2646785159503448950)
,p_name=>'P73_MS_DUE_DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_required_patch=>wwv_flow_imp.id(11756681878669227855)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4357443275892764753)
,p_name=>'P73_ACTION_OWNER_04'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Owner 4'
,p_source=>'ACTION_OWNER_04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(u.username) d',
'from eba_proj_status_users u',
'order by 1'))
,p_cSize=>64
,p_cMaxlength=>0
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''Y'''))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'match_type', 'CONTAINS_IGNORE',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5985414894850079268)
,p_name=>'P73_TAGS'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
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
,p_cSize=>80
,p_cMaxlength=>4000
,p_tag_attributes=>'placeholder="Enter tags separated by commas"'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''Y'''))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'Tags may not contain the following characters: : ; \ / ? &')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6064202498502083199)
,p_name=>'P73_MILESTONE_ID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone'
,p_source=>'MILESTONE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select milestone_name||'' (''||to_char(milestone_date,:APP_DATE_FORMAT)||'')'' d, id r',
'from eba_proj_status_ms m',
'where project_id = :P73_PROJECT_ID',
'  and (',
'     milestone_status != ''Completed'' or',
'     m.id = :P73_MILESTONE_ID',
'     )',
'order by milestone_date'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- No Milestone -'
,p_lov_cascade_parent_items=>'P73_PROJECT_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.template_lock_yn (',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_action_item_id => :P73_ID ) = ''Y''',
'or',
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''Y'''))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(11756681878669227855)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from eba_proj_status_ms',
'where project_id = :P73_PROJECT_ID',
'and milestone_status != ''Completed'''))
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156716289075793100)
,p_name=>'P73_ACTION_FLEX_05'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex 05'
,p_source=>'ACTION_FLEX_05'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_05'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156716508748793104)
,p_name=>'P73_ACTION_FLEX_N01'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Estimated Cost (in Man Hours)'
,p_source=>'ACTION_FLEX_N01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_N01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156716712820793105)
,p_name=>'P73_ACTION_FLEX_N02'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex N02'
,p_source=>'ACTION_FLEX_N02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_N02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156716902532793105)
,p_name=>'P73_ACTION_FLEX_N03'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex N03'
,p_source=>'ACTION_FLEX_N03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_N03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156717095469793105)
,p_name=>'P73_ACTION_FLEX_N04'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex N04'
,p_source=>'ACTION_FLEX_N04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_N04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156717306011793105)
,p_name=>'P73_ACTION_FLEX_D01'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex D01'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'ACTION_FLEX_D01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_D01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156717498136793105)
,p_name=>'P73_ACTION_FLEX_D02'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex D02'
,p_source=>'ACTION_FLEX_D02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_D02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156717688494793106)
,p_name=>'P73_ACTION_FLEX_D03'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex D03'
,p_source=>'ACTION_FLEX_D03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_D03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156717890290793107)
,p_name=>'P73_ACTION_FLEX_D04'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex D04'
,p_source=>'ACTION_FLEX_D04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_D04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156718100095793107)
,p_name=>'P73_ACTION_FLEX_CLOB'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex CLOB'
,p_source=>'ACTION_FLEX_CLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_CLOB'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156718307531793108)
,p_name=>'P73_ACTION_FLEX_01'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex 01'
,p_source=>'ACTION_FLEX_01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156718506332793108)
,p_name=>'P73_ACTION_FLEX_02'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex 02'
,p_source=>'ACTION_FLEX_02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156718711948793108)
,p_name=>'P73_ACTION_FLEX_03'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex 03'
,p_source=>'ACTION_FLEX_03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156718885968793108)
,p_name=>'P73_ACTION_FLEX_04'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex 04'
,p_source=>'ACTION_FLEX_04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156719090633793108)
,p_name=>'P73_ACTION_FLEX_06'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex 06'
,p_source=>'ACTION_FLEX_06'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_06'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156719283849793109)
,p_name=>'P73_ACTION_FLEX_07'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex 07'
,p_source=>'ACTION_FLEX_07'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_07'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156719492297793109)
,p_name=>'P73_ACTION_FLEX_08'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6156716104650793096)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ACTION Flex 08'
,p_source=>'ACTION_FLEX_08'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_AIS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''ACTION_FLEX_08'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8039715023906994332)
,p_name=>'P73_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8039715242593994334)
,p_name=>'P73_PROJECT_ID'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project'
,p_source=>'PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_read_only_when=>'P73_PROJECT_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8039715417011994335)
,p_name=>'P73_ACTION_OWNER_01'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Owner 1'
,p_post_element_text=>' &nbsp; <small>[<a href="javascript:$s(''P73_ACTION_OWNER_01'',$v(''P73_CURRENT_USER''));">Me</a>]</small>'
,p_source=>'ACTION_OWNER_01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(u.username) d',
'from eba_proj_status_users u',
'order by 1'))
,p_cSize=>64
,p_cMaxlength=>255
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''Y'''))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'match_type', 'CONTAINS_IGNORE',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8039715641633994335)
,p_name=>'P73_ACTION_OWNER_02'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Owner 2'
,p_source=>'ACTION_OWNER_02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(u.username) d',
'from eba_proj_status_users u',
'order by 1'))
,p_cSize=>64
,p_cMaxlength=>255
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''Y'''))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8039715844510994336)
,p_name=>'P73_ACTION_OWNER_03'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Owner 3'
,p_source=>'ACTION_OWNER_03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(u.username) d',
'from eba_proj_status_users u',
'order by 1'))
,p_cSize=>64
,p_cMaxlength=>255
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''Y'''))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'match_type', 'CONTAINS_IGNORE',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8039716033920994336)
,p_name=>'P73_ACTION'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Action'
,p_source=>'ACTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.template_lock_yn (',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_action_item_id => :P73_ID ) = ''Y''',
'or',
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''Y'''))
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
 p_id=>wwv_flow_imp.id(8039716247736994336)
,p_name=>'P73_ACTION_DESCRIPTION'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'ACTION_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>32767
,p_cHeight=>4
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''Y'''))
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
 p_id=>wwv_flow_imp.id(8039716433130994336)
,p_name=>'P73_DUE_DATE'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Due Date'
,p_format_mask=>'&APP_DATE_FORMAT.'
,p_source=>'DUE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>255
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''Y'''))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8039716643830994336)
,p_name=>'P73_ACTION_STATUS'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Open'
,p_prompt=>'Status'
,p_source=>'ACTION_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ACTION ITEM STATUS (OPEN, CLOSED)'
,p_lov=>'.'||wwv_flow_imp.id(8959401832930782472)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8039717437788994337)
,p_name=>'P73_AI_TYPE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_dflt_ai_id number;',
'begin',
'    if eba_proj_fw.get_preference_value(''DEFAULT_AI_TYPE'') = ''Preference does not exist'' then',
'        select max(id)',
'          into l_dflt_ai_id',
'          from eba_proj_status_ais_types;',
'    else',
'        l_dflt_ai_id := eba_proj_fw.get_preference_value(''DEFAULT_AI_TYPE'');',
'    end if;',
'    return l_dflt_ai_id;',
'end;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Type'
,p_source=>'TYPE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select AI_TYPE, id',
'from EBA_PROJ_STATUS_AIS_TYPES',
'where is_active_yn = ''Y''',
'    or id = :P73_AI_TYPE',
'order by is_active_yn desc, display_sequence'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.template_lock_yn (',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_action_item_id => :P73_ID ) = ''Y''',
'or',
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''Y'''))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15010739963790268017)
,p_name=>'P73_OWNER_ROLE_ID'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Assign to Role'
,p_source=>'OWNER_ROLE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- No Role -'
,p_cHeight=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P73_PROJECT_ID ) = ''Y'''))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this to assign the action item''s owner based on the roles of the people associated with the project. If a role is selected here, any people with that role for this project will be listed as this action item''s owner(s).</p>',
'<p>Leave blank to manually assign owners to the action item.</p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17526766802290169943)
,p_name=>'P73_RESOLUTION'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Resolution'
,p_source=>'RESOLUTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(18118675022980458324)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'N',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18296372239285442040)
,p_name=>'P73_LINK_TEXT'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Link Text'
,p_source=>'LINK_TEXT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_required_patch=>wwv_flow_imp.id(19136719722975969919)
,p_help_text=>'<p>Enter the clickable text that''s displayed in an Action Item''s link.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'Documentation'
,p_quick_pick_value_01=>'Documentation'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18296372385255442041)
,p_name=>'P73_LINK_URL'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Link Target'
,p_placeholder=>'http://www.oracle.com/'
,p_source=>'LINK_URL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(19136719722975969919)
,p_help_text=>'<p>Enter the Universal Resource Locator (URL) that you would like to redirect users to when they click the link. The value supplied here will usually begin with "http://" or "https://".</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18832428095446063299)
,p_name=>'P73_INC_IN_STATUS_EML_YN'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Inc in status eml yn'
,p_source=>'INC_IN_STATUS_EML_YN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Include in Status Email;Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'<p>If this check box is checked then this Action Item will appear in the Completed Activities or the Upcoming Activities region of the Project Status Email. If left unchecked, this Action Item will never appear in the Project Status Email.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19204381786634214125)
,p_name=>'P73_COMPLETED_DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_item_default=>'to_char(sysdate,''DD-MON-YYYY'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Completed Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'COMPLETED_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(19865313585076670920)
,p_name=>'P73_CURRENT_USER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_source=>'lower(:APP_USER)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19865313634605670921)
,p_name=>'P73_RMN_OPEN_ASSOC_AI_CNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19865315027857670935)
,p_name=>'P73_CLOSE_ASSOC_MS'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_item_default=>'Y'
,p_prompt=>'Close Associated Open Milestone'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'If "Yes" is selected, the Milestone associated with this last open Action Item will be marked as completed. If "No" is selected, the Milestone associated with this Action Item will remain open.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20043307863625787334)
,p_name=>'P73_RMN_OPEN_ASSOC_AI_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20124882491690729630)
,p_name=>'P73_ORIGINAL_DUE_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_source=>'ORIGINAL_DUE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20289566281934214626)
,p_name=>'P73_COMPLETED_BY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_use_cache_before_default=>'NO'
,p_source=>'COMPLETED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21048392834447075537)
,p_name=>'P73_ASSOC_MS_STATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8039714034233994321)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(6064507189610861868)
,p_computation_sequence=>10
,p_computation_item=>'P73_DUE_DATE'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(milestone_date,:APP_DATE_FORMAT)',
'from eba_proj_status_ms',
'where id = :P73_MILESTONE_ID'))
,p_compute_when=>':P73_MILESTONE_ID is not null and :P73_DUE_DATE is null'
,p_compute_when_text=>'PLSQL'
,p_compute_when_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18808041750243757060)
,p_computation_sequence=>20
,p_computation_item=>'P73_INC_IN_STATUS_EML_YN'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
,p_compute_when=>'P73_INC_IN_STATUS_EML_YN'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20289566141100214625)
,p_computation_sequence=>30
,p_computation_item=>'P73_COMPLETED_DATE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'null'
,p_compute_when=>'P73_ACTION_STATUS'
,p_compute_when_text=>'Closed'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20289566498163214628)
,p_computation_sequence=>40
,p_computation_item=>'P73_COMPLETED_BY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'null'
,p_compute_when=>'P73_ACTION_STATUS'
,p_compute_when_text=>'Closed'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(19865313826184670923)
,p_computation_sequence=>10
,p_computation_item=>'P73_RMN_OPEN_ASSOC_AI_CNT'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_num_assoc_ais_open number;',
'begin',
'    select count(*)',
'      into l_num_assoc_ais_open',
'      from eba_proj_status_ais',
'     where project_id = :P73_PROJECT_ID',
'       and action_status = ''Open''',
'       and milestone_id = :P73_MILESTONE_ID;',
'    return l_num_assoc_ais_open;',
'end;'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20043307929404787335)
,p_computation_sequence=>20
,p_computation_item=>'P73_RMN_OPEN_ASSOC_AI_ID'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select id from eba_proj_status_ais where project_id = :P73_PROJECT_ID and action_status = ''Open'''
,p_compute_when=>'P73_RMN_OPEN_ASSOC_AI_CNT'
,p_compute_when_text=>'1'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(21048392953142075538)
,p_computation_sequence=>30
,p_computation_item=>'P73_ASSOC_MS_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select milestone_status',
'  from eba_proj_status_ms',
' where id = :P73_MILESTONE_ID;'))
,p_compute_when=>'P73_MILESTONE_ID'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(19865313723501670922)
,p_computation_sequence=>10
,p_computation_item=>'P73_MILESTONE_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select milestone_id from eba_proj_status_ais where id = :P73_ID;'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(19865314004622670924)
,p_computation_sequence=>10
,p_computation_item=>'P73_PROJECT_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select project_id from eba_proj_status_ais where id = :P73_ID;'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1921856470954828190)
,p_computation_sequence=>40
,p_computation_item=>'P73_MS_DUE_DATE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select to_char(milestone_date,''DD-MON-YYYY'') from EBA_PROJ_STATUS_MS where id = :P73_MILESTONE_ID;'
,p_compute_when=>'P73_MILESTONE_ID'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6064290302225929099)
,p_validation_name=>'P73_DUE_DATE on/before MS'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status_ms',
'where id = :P73_MILESTONE_ID',
'    and milestone_date < to_date( :P73_DUE_DATE, :APP_DATE_FORMAT )'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'#LABEL# cannot be after the associated milestone''s due date.'
,p_validation_condition=>'P73_MILESTONE_ID'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_imp.id(8039716433130994336)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(17526766857694169944)
,p_validation_name=>'Resolution Not Null'
,p_validation_sequence=>20
,p_validation=>'P73_RESOLUTION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value when completing/closing an action item.'
,p_validation_condition=>'P73_ACTION_STATUS'
,p_validation_condition2=>'Closed'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(18118675022980458324)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6064288183708886443)
,p_name=>'Set due date'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P73_MILESTONE_ID'
,p_condition_element=>'P73_MILESTONE_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6064288484679886446)
,p_event_id=>wwv_flow_imp.id(6064288183708886443)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_DUE_DATE'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(milestone_date,:APP_DATE_FORMAT)',
'from eba_proj_status_ms',
'where id = :P73_MILESTONE_ID'))
,p_attribute_07=>'P73_MILESTONE_ID,P73_DUE_DATE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21048394532468075554)
,p_event_id=>wwv_flow_imp.id(6064288183708886443)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_DUE_DATE'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'to_char(sysdate + 14,:APP_DATE_FORMAT)'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2646785206067448951)
,p_event_id=>wwv_flow_imp.id(6064288183708886443)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_MS_DUE_DATE'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(milestone_date,:APP_DATE_FORMAT)',
'from eba_proj_status_ms',
'where id = :P73_MILESTONE_ID'))
,p_attribute_07=>'P73_MILESTONE_ID,P73_DUE_DATE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21048394508206075553)
,p_event_id=>wwv_flow_imp.id(6064288183708886443)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_CLOSE_ASSOC_MS'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11238282346378566647)
,p_name=>'Cancel Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8039714436843994330)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11238282472229566648)
,p_event_id=>wwv_flow_imp.id(11238282346378566647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15010740084253268018)
,p_name=>'Show/Hide Owners'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P73_OWNER_ROLE_ID'
,p_condition_element=>'P73_OWNER_ROLE_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15010740147374268019)
,p_event_id=>wwv_flow_imp.id(15010740084253268018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_ACTION_OWNER_01,P73_ACTION_OWNER_02,P73_ACTION_OWNER_03'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15010740268078268020)
,p_event_id=>wwv_flow_imp.id(15010740084253268018)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_ACTION_OWNER_01,P73_ACTION_OWNER_02,P73_ACTION_OWNER_03'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18523080928804785146)
,p_name=>'Close AI'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P73_ACTION_STATUS'
,p_condition_element=>'P73_ACTION_STATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Closed'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20124884687007729652)
,p_event_id=>wwv_flow_imp.id(18523080928804785146)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P73_ACTION_STATUS,P73_COMPLETED_DATE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20124884756042729653)
,p_event_id=>wwv_flow_imp.id(18523080928804785146)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P73_ACTION_STATUS,P73_COMPLETED_DATE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19204382092231214128)
,p_event_id=>wwv_flow_imp.id(18523080928804785146)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_COMPLETED_DATE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19204382151228214129)
,p_event_id=>wwv_flow_imp.id(18523080928804785146)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_COMPLETED_DATE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20043307594087787331)
,p_event_id=>wwv_flow_imp.id(18523080928804785146)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_RESOLUTION'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20043307640118787332)
,p_event_id=>wwv_flow_imp.id(18523080928804785146)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_RESOLUTION'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20289566327458214627)
,p_event_id=>wwv_flow_imp.id(18523080928804785146)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_COMPLETED_BY'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':APP_USER'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18808038526035757028)
,p_name=>'Set Value'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P73_INC_IN_STATUS_EML_YN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18808038619286757029)
,p_event_id=>wwv_flow_imp.id(18808038526035757028)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P73_INC_IN_STATUS_EML_YN := nvl(:P73_INC_IN_STATUS_EML_YN,''N'');'
,p_attribute_02=>'P73_INC_IN_STATUS_EML_YN'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20124885697816729662)
,p_name=>'Show/Hide Close Associated Milestone Radiogroup'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P73_ACTION_STATUS'
,p_condition_element=>'P73_ACTION_STATUS'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P73_MILESTONE_ID'
,p_required_patch=>wwv_flow_imp.id(11756681878669227855)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21048393948951075548)
,p_event_id=>wwv_flow_imp.id(20124885697816729662)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_RMN_OPEN_ASSOC_AI_CNT'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select count(*)',
'      from eba_proj_status_ais',
'     where project_id = :P73_PROJECT_ID',
'       and action_status = ''Open''',
'       and milestone_id = :P73_MILESTONE_ID;'))
,p_attribute_07=>'P73_MILESTONE_ID,P73_PROJECT_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21048394041795075549)
,p_event_id=>wwv_flow_imp.id(20124885697816729662)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P73_RMN_OPEN_ASSOC_AI_ID'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select id from eba_proj_status_ais where project_id = :P73_PROJECT_ID and :P73_MILESTONE_ID = milestone_id and :P73_RMN_OPEN_ASSOC_AI_CNT = 1 and action_status = ''Open'''
,p_attribute_07=>'P73_PROJECT_ID,P73_MILESTONE_ID,P73_RMN_OPEN_ASSOC_AI_CNT'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21048393621691075545)
,p_event_id=>wwv_flow_imp.id(20124885697816729662)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v(''P73_RMN_OPEN_ASSOC_AI_CNT'') == 1 && $v(''P73_ACTION_STATUS'') == ''Closed'' && $v(''P73_RMN_OPEN_ASSOC_AI_ID'') == $v(''P73_ID'')) {',
'    //alert(''show close associated radio group'');',
'    $(''#P73_CLOSE_ASSOC_MS_CONTAINER'').show();',
'}',
'else {',
'    //alert(''hide close associated radio group'');',
'    $(''#P73_CLOSE_ASSOC_MS_CONTAINER'').hide();',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2646785769942448956)
,p_name=>'Check Validity of Submission'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8039714243440994326)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'($v(''P73_ACTION_STATUS'') == ''Closed''',
'    //&& $("#P73_MS_DUE_DATE").datepicker("getDate") < $("#P73_COMPLETED_DATE").datepicker("getDate")',
'   && $v(''P73_MS_DUE_DATE'') < $("#P73_COMPLETED_DATE").datepicker("getDate")',
'&& ! confirm("Warning: Marking this action item as Complete after the associated milestone was due is likely to cause a delay to the project. Are you sure you want to continue?"))',
'|| ($v(''P73_ASSOC_MS_STATUS'') == ''Completed'' && $v(''P73_ACTION_STATUS'') == ''Open''',
'&& ! confirm("This Action Item''s associated Milestone has already been completed. Setting this Action Item''s status to \"Open\" will also re-open it''s associated Milestone. Are you sure you want to continue?"))'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_required_patch=>wwv_flow_imp.id(11756681878669227855)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2646785845936448957)
,p_event_id=>wwv_flow_imp.id(2646785769942448956)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2646785939771448958)
,p_event_id=>wwv_flow_imp.id(2646785769942448956)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'SAVE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2646786043704448959)
,p_name=>'Submit (No Milestones)'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8039714243440994326)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_required_patch=>-wwv_flow_imp.id(11756681878669227855)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2646786159659448960)
,p_event_id=>wwv_flow_imp.id(2646786043704448959)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'SAVE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8039718548033994354)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_PROJ_STATUS_AIS'
,p_attribute_02=>'EBA_PROJ_STATUS_AIS'
,p_attribute_03=>'P73_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'Unable to fetch row.'
,p_internal_uid=>8039718548033994354
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19130303299567903216)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete AI'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update eba_proj_status_ais$',
'set is_deleted_yn = ''Y'',',
'    deleted_by = :APP_USER,',
'    deleted_on = localtimestamp',
'where id = :P73_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8039714823930994331)
,p_process_success_message=>'Action Item deleted.'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>19130303299567903216
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8039718734497994356)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_PROJ_STATUS_AIS'
,p_attribute_02=>'EBA_PROJ_STATUS_AIS'
,p_attribute_03=>'P73_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U'
,p_attribute_12=>'Y'
,p_process_error_message=>'Unable to process row of table EBA_PROJ_STATUS_AIS.'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_success_message=>'Action Processed.'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>8039718734497994356
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19865315526856670940)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Close Associated Milestone'
,p_process_sql_clob=>'update eba_proj_status_ms set completed_date = nvl(to_date(:P73_COMPLETED_DATE,''DD-MON-YYYY''),current_timestamp), milestone_status = ''Completed'' where id = :P73_MILESTONE_ID;'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8039714243440994326)
,p_process_when=>':P73_CLOSE_ASSOC_MS = ''Y'' and :P73_ACTION_STATUS = ''Closed'' and :P73_RMN_OPEN_ASSOC_AI_CNT = ''1'''
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'Associated Milestone successfully closed.'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>19865315526856670940
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8039718945440994356)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'46'
,p_process_when_button_id=>wwv_flow_imp.id(8039714823930994331)
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>8039718945440994356
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11238282263998566646)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE, SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>11238282263998566646
);
wwv_flow_imp.component_end;
end;
/
