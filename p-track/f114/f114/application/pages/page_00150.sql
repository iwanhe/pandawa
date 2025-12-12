prompt --application/pages/page_00150
begin
--   Manifest
--     PAGE: 00150
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
 p_id=>150
,p_name=>'Person'
,p_page_mode=>'MODAL'
,p_step_title=>'Person'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_dialog_height=>'400'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11565359220444561502)
,p_plug_name=>'Add Person'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11565360014892561503)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672347163384369864)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11807454410822241956)
,p_plug_name=>'Insufficient Access'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_imp.id(6672345091278369856)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>'<p>This user is defined as a reader of this application, and so will not have edit privileges unless updated by an administrator.</p>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11565360368040561503)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11565360014892561503)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11565359905208561503)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11565360014892561503)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Remove User'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status p,',
'    eba_proj_user_ref rf,',
'    eba_proj_status_users u',
'where rf.id = :P150_ID',
'    and p.id = rf.project_id',
'    and rf.user_id = u.id',
'    and ( p.acl_status_level = 1',
'        or ( p.acl_status_level > 1',
'--            and u.username <> :APP_USER',
'            and exists (select null',
'                        from eba_proj_user_ref rf2,',
'                            eba_proj_roles r',
'                        where rf2.project_id = rf.project_id',
'                            and rf2.user_id <> rf.user_id',
'                            and r.id = rf2.role_id',
'                            and nvl(rf2.acl_status_level, r.default_acl_status_level) >= 3',
'                )',
'            )',
'        )'))
,p_button_condition_type=>'EXISTS'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11565359784034561503)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11565360014892561503)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P150_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11565359662637561503)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(11565360014892561503)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Person'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P150_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11466363676311344426)
,p_name=>'P150_NEW_ROLE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11565359220444561502)
,p_prompt=>'New Role'
,p_placeholder=>'New Role Title'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11466364077437344430)
,p_name=>'P150_NEW_ROLE_ACL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11565359220444561502)
,p_prompt=>'New Role Default Access Level'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status',
'where id = :P150_PROJECT_ID',
'    and acl_status_level > 1'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11466365319810344443)
,p_name=>'P150_USERNAME'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11565359220444561502)
,p_use_cache_before_default=>'NO'
,p_prompt=>'User'
,p_placeholder=>'Username'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users',
'where id = :P150_USER_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from eba_proj_status_users u',
'/*where not exists (',
'    select null',
'    from eba_proj_user_ref rf',
'    where rf.project_id = :P150_PROJECT_ID',
'        and rf.user_id = u.id )*/',
'order by lower(username);'))
,p_cSize=>30
,p_read_only_when=>'P150_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'match_type', 'CONTAINS_IGNORE',
  'max_values_in_list', '10')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11565362796014561516)
,p_name=>'P150_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11565359220444561502)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11565363127349561529)
,p_name=>'P150_USER_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11565359220444561502)
,p_use_cache_before_default=>'NO'
,p_source=>'USER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11565363495181561530)
,p_name=>'P150_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11565359220444561502)
,p_use_cache_before_default=>'NO'
,p_source=>'PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11565363866002561531)
,p_name=>'P150_ROLE_ID'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11565359220444561502)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Role'
,p_source=>'ROLE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d, r',
'from (',
'    select name d, id r, 10 s',
'    from eba_proj_roles',
'    union all',
'    select ''- New Role -'' d, -1 r, 20 s',
'    from dual',
')',
'order by s, lower(d), r'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select Role -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11565364310186561531)
,p_name=>'P150_ACL_STATUS_LEVEL'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11565359220444561502)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Access Level'
,p_source=>'ACL_STATUS_LEVEL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE ACCESS LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status',
'where id = :P150_PROJECT_ID',
'    and acl_status_level > 1'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6790474241978091310)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11565364715396561532)
,p_name=>'P150_NOTES'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11565359220444561502)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11807454694614241959)
,p_name=>'P150_SHOW_WARNING'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11807454410822241956)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11984496136451778540)
,p_name=>'P150_INVOLVEMENT_LEVEL_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11565359220444561502)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Involvement Level'
,p_source=>'INVOLVEMENT_LEVEL_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'INVOLVEMENT LEVEL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select involvement_level||decode(PERCENTAGE,null,null,'' - ''||percentage||''%'') d, id r',
'from eba_proj_involvement_levels',
'order by display_sequence'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select Level -'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(12124281749376450905)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(11466364699637344436)
,p_validation_name=>'New Role not null'
,p_validation_sequence=>10
,p_validation=>'P150_NEW_ROLE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must not be null.'
,p_validation_condition=>'P150_ROLE_ID'
,p_validation_condition2=>'-1'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(11466363676311344426)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(11466364444878344434)
,p_validation_name=>'New Role Unique'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_roles',
'where upper(name) = upper(:P150_NEW_ROLE)'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'#LABEL# must be a value which does not already exist.'
,p_validation_condition=>'P150_ROLE_ID'
,p_validation_condition2=>'-1'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(11466363676311344426)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(14177236783183239459)
,p_validation_name=>'P150_USERNAME Email Username is valid'
,p_validation_sequence=>30
,p_validation=>'P150_USERNAME'
,p_validation2=>'^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@(-?[a-zA-Z0-9+])+(\.(-?[a-zA-Z0-9+])*)+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Username is not in a valid email address format. Either enter an email address or have your application administrator change the application''s username format to "Non-Email Address".'
,p_validation_condition=>':REQUEST in (''CREATE'', ''SAVE'') and eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(11466365319810344443)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(16870288091261548892)
,p_validation_name=>'Check Removal of Admin'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c1 in ( select p.acl_status_level,',
'                    p.id project_id',
'                from eba_proj_status p',
'                where p.id = :P150_PROJECT_ID ) LOOP',
'        if c1.acl_status_level = 1 then',
'            -- Open project, no need to check.',
'            return true;',
'        end if;',
'        -- Closed project. If the user being inserted/updated is an admin, no problem.',
'        if :REQUEST != ''DELETE''',
'                and ((:P150_ROLE_ID is not null and :P150_ACL_STATUS_LEVEL >= 3)',
'                    or (:P150_ROLE_ID is null and :P150_NEW_ROLE_ACL >= 3)) then',
'            return true;',
'        end if;',
'        -- Closed project, user is being deleted or not granted admin.',
'        -- Only allow if another admin already exists.',
'        for c2 in ( select null',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_roles r',
'                    where rf.user_id != :P150_USER_ID',
'                        and rf.project_id = c1.project_id',
'                        and r.id = rf.role_id',
'                        and nvl(rf.acl_status_level, r.default_acl_status_level) >= 3 ) LOOP',
'            return true;',
'        end loop;',
'    end loop;',
'    -- If we''ve gotten this far, don''t allow the save.',
'    return false;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'There must be at least one user with project administration rights to restricted projects.'
,p_validation_condition=>'SAVE,DELETE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(15711647321180245137)
,p_validation_name=>'User Already on Project'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_user_ref rf,',
'    eba_proj_status_users u',
'where upper(u.username) = upper(:P150_USERNAME)',
'    and rf.user_id = u.id',
'    and rf.role_id = :P150_ROLE_ID',
'    and rf.project_id = :P150_PROJECT_ID'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'#LABEL# is already associated with this project in this role.'
,p_when_button_pressed=>wwv_flow_imp.id(11565359662637561503)
,p_associated_item=>wwv_flow_imp.id(11466365319810344443)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11565360426456561503)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11565360368040561503)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11565361249722561506)
,p_event_id=>wwv_flow_imp.id(11565360426456561503)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11466364154943344431)
,p_name=>'Show/Hide New Role Fields'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P150_ROLE_ID'
,p_condition_element=>'P150_ROLE_ID'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'-1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11466364245500344432)
,p_event_id=>wwv_flow_imp.id(11466364154943344431)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P150_NEW_ROLE,P150_NEW_ROLE_ACL'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11466364357181344433)
,p_event_id=>wwv_flow_imp.id(11466364154943344431)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P150_NEW_ROLE,P150_NEW_ROLE_ACL'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11807450932479241922)
,p_name=>'Set Access Level'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P150_ROLE_ID'
,p_condition_element=>'P150_ROLE_ID'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11807451027290241923)
,p_event_id=>wwv_flow_imp.id(11807450932479241922)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P150_ACL_STATUS_LEVEL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select default_acl_status_level',
'from eba_proj_roles',
'where id = :P150_ROLE_ID;'))
,p_attribute_07=>'P150_ROLE_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11807454448068241957)
,p_name=>'Check Access Control'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P150_USERNAME,P150_ACL_STATUS_LEVEL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11807454516752241958)
,p_event_id=>wwv_flow_imp.id(11807454448068241957)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c1 in (select access_level_id',
'               from eba_proj_status_users u',
'               where u.username = :P150_USERNAME',
'              ) loop',
'        if c1.access_level_id = 1 and :P150_ACL_STATUS_LEVEL > 1 then',
'            :P150_SHOW_WARNING := ''Y'';',
'        else',
'            :P150_SHOW_WARNING := ''N'';',
'        end if;',
'    end loop;',
'end;    '))
,p_attribute_02=>'P150_USERNAME,P150_ACL_STATUS_LEVEL'
,p_attribute_03=>'P150_SHOW_WARNING'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11807454743112241960)
,p_name=>'Show/Hide Warning'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P150_SHOW_WARNING'
,p_condition_element=>'P150_SHOW_WARNING'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11807454844951241961)
,p_event_id=>wwv_flow_imp.id(11807454743112241960)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11807454410822241956)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11807455006733241962)
,p_event_id=>wwv_flow_imp.id(11807454743112241960)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11807454410822241956)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11565365478810561534)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_PROJ_USER_REF'
,p_attribute_02=>'EBA_PROJ_USER_REF'
,p_attribute_03=>'P150_ID'
,p_attribute_04=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>11565365478810561534
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11466364528710344435)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create New Role'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into eba_proj_roles ( name, default_acl_status_level )',
'values ( :P150_NEW_ROLE, nvl(:P150_NEW_ROLE_ACL,1) )',
'returning id into :P150_ROLE_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P150_ROLE_ID'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'-1'
,p_process_success_message=>'Role created.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_internal_uid=>11466364528710344435
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11466365424811344444)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create/Set User'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c1 in (select id',
'               from eba_proj_status_users u',
'               where lower(username) = lower(:P150_USERNAME)) loop',
'        :P150_USER_ID := c1.id;',
'    end loop;',
'    if :P150_USER_ID is null then',
'        -- Create User, Pending Approval status',
'        insert into eba_proj_status_users',
'            ( username, access_level_id )',
'        values ( :P150_USERNAME, 0 )',
'        returning id into :P150_USER_ID;',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P150_USER_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>11466365424811344444
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11565375864381561535)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_PROJ_USER_REF'
,p_attribute_02=>'EBA_PROJ_USER_REF'
,p_attribute_03=>'P150_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>11565375864381561535
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11565376266677561536)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11565359905208561503)
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>11565376266677561536
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11565376629424561536)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>11565376629424561536
);
wwv_flow_imp.component_end;
end;
/
