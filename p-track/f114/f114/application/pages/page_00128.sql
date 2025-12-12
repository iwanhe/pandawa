prompt --application/pages/page_00128
begin
--   Manifest
--     PAGE: 00128
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
 p_id=>128
,p_name=>'My Dashboard Filters'
,p_page_mode=>'MODAL'
,p_step_title=>'My Dashboard Filters'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'400'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18023882914585252020)
,p_plug_name=>'Filter Projects'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18023882922850252021)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672347163384369864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18023883078618252022)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(18023882922850252021)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18023883186468252023)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(18023882922850252021)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(18023883773577252029)
,p_branch_name=>'Return to My Dashboard'
,p_branch_action=>'f?p=&APP_ID.:194:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18023883461066252026)
,p_name=>'P128_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(18023882914585252020)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18023883558441252027)
,p_name=>'P128_PROJECT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(18023882914585252020)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Filter by Project'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P128_TYPE = ''AI'' then',
'        return :P194_AI_PROJECT;',
'    else',
'        return :P194_MS_PROJECT;',
'    end if;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct d, r',
'from (  select p.project d, p.id r',
'        from eba_proj_status p,',
'            eba_proj_status_ais a',
'        where :P128_TYPE = ''AI''',
'            and a.project_id = p.id',
'            and a.action_status = ''Open''',
'            and (   upper(a.action_owner_01) = upper(:P194_NAME)',
'                or  upper(a.action_owner_02) = upper(:P194_NAME)',
'                or  upper(a.action_owner_03) = upper(:P194_NAME)',
'                or  upper(a.action_owner_04) = upper(:P194_NAME)',
'                or exists ( select null',
'                            from eba_proj_user_ref rf,',
'                                eba_proj_status_users u',
'                            where rf.role_id = a.owner_role_id',
'                                and rf.project_id = a.project_id',
'                                and rf.user_id = u.id',
'                                and upper(u.username) = upper(:P194_NAME)',
'                )',
'            )',
'        union all',
'        select p.project d, p.id r',
'        from eba_proj_status_ms m,',
'            eba_proj_status p',
'        where :P128_TYPE = ''MS''',
'            and m.project_id = p.id',
'            and m.milestone_status = ''Open''',
'            and ( instr(upper(m.milestone_owner), upper(:P194_NAME)) > 0',
'                or exists ( select null',
'                            from eba_proj_user_ref rf,',
'                                eba_proj_status_users u',
'                            where rf.role_id = m.owner_role_id',
'                                and rf.project_id = m.project_id',
'                                and rf.user_id = u.id',
'                                and upper(u.username) = upper(:P194_NAME)',
'                    )',
'               )',
')',
'order by lower(d)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Projects -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18023883245968252024)
,p_name=>'Cancel Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(18023883078618252022)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18023883400771252025)
,p_event_id=>wwv_flow_imp.id(18023883245968252024)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(18023883709074252028)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Preference'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P128_TYPE = ''AI'' then',
'        :P194_AI_PROJECT := :P128_PROJECT;',
'    else',
'        :P194_MS_PROJECT := :P128_PROJECT;',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>18023883709074252028
);
wwv_flow_imp.component_end;
end;
/
