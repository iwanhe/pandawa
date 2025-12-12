prompt --application/pages/page_00157
begin
--   Manifest
--     PAGE: 00157
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
 p_id=>157
,p_name=>'Project Maintenance'
,p_page_mode=>'MODAL'
,p_step_title=>'Project Maintenance'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486086019073759)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_dialog_height=>'350'
,p_dialog_width=>'450'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11945324923120483169)
,p_plug_name=>'Project Maintenance'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11945325705514483170)
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
 p_id=>wwv_flow_imp.id(11945346114256483171)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11945325705514483170)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13305558523070764847)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11945325705514483170)
,p_button_name=>'DELETE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Permanently Delete'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P157_DELETED'
,p_button_condition2=>'Y'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_security_scheme=>wwv_flow_imp.id(16958742599275547529)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11945325485301483170)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11945325705514483170)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11945350506650483479)
,p_name=>'P157_PROJECT_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11945324923120483169)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project'
,p_source=>'PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project d, id r',
'from eba_proj_status$',
'order by upper(project)'))
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11945350824835483479)
,p_name=>'P157_ACCESS_CONTROL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11945324923120483169)
,p_prompt=>'Access Control'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select acl_status_level',
'from eba_proj_status$',
'where id = :P157_PROJECT_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ACL LEVELS'
,p_lov=>'.'||wwv_flow_imp.id(11045413827346451385)||'.'
,p_cHeight=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_proj_user_ref rf,',
'       eba_proj_roles r,',
'       eba_proj_status_users u',
' where (',
'            rf.project_id = :P157_PROJECT_ID',
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
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11945351220362483480)
,p_name=>'P157_DELETED'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11945324923120483169)
,p_prompt=>'Deleted'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select is_deleted_yn',
'from eba_proj_status$',
'where id = :P157_PROJECT_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11945346206995483171)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11945346114256483171)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11945346952780483174)
,p_event_id=>wwv_flow_imp.id(11945346206995483171)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13305558616702764848)
,p_name=>'Confirm Delete'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(13305558523070764847)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13305558738455764849)
,p_event_id=>wwv_flow_imp.id(13305558616702764848)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure you want to permanently delete this project?'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13305558991249764851)
,p_event_id=>wwv_flow_imp.id(13305558616702764848)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DELETE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11807452310463241935)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Changes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update eba_proj_status$',
'set acl_status_level = :P157_ACCESS_CONTROL,',
'    is_deleted_yn = :P157_DELETED',
'where id = :P157_PROJECT_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11945325485301483170)
,p_process_success_message=>'Changes applied.'
,p_internal_uid=>11807452310463241935
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13305558873229764850)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Project'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- This pkg variable has to be set to true for the AD_EBA_PROJ_USER_REF trigger to work properly - Allan 4-DEC-2017',
'eba_proj_fw.g_project_deleted := true;',
'',
'delete from eba_proj_status$ where id = :P157_PROJECT_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(13305558523070764847)
,p_security_scheme=>wwv_flow_imp.id(16958742599275547529)
,p_internal_uid=>13305558873229764850
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11945353708358483486)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>11945353708358483486
);
wwv_flow_imp.component_end;
end;
/
