prompt --application/pages/page_00193
begin
--   Manifest
--     PAGE: 00193
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
 p_id=>193
,p_name=>'Copy Project Template'
,p_page_mode=>'MODAL'
,p_step_title=>'Copy Project Template'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486086019073759)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_dialog_height=>'250'
,p_dialog_width=>'300'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13642385597416877309)
,p_plug_name=>'Project Template'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Please enter the name for the new template. All Milestone and Action Items will be copied.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13658056725021877316)
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
 p_id=>wwv_flow_imp.id(13658058330127877319)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(13658056725021877316)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13658057930227877318)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(13658056725021877316)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Copy'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(13658061763474877329)
,p_branch_name=>'Go to Template Details'
,p_branch_action=>'f?p=&APP_ID.:184:&SESSION.::&DEBUG.:RP,184:P184_ID:&P193_NEW_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13616945453968744853)
,p_name=>'P193_NEW_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(13642385597416877309)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13658055948376877314)
,p_name=>'P193_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13642385597416877309)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13658056376344877315)
,p_name=>'P193_NAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(13642385597416877309)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_new_name varchar2(255);',
'begin',
'    for c1 in',
'    (select name || '' (Copy)'' as new_name from eba_proj_templates where id = :P193_ID)',
'    loop',
'        l_new_name := c1.new_name;',
'    end loop;',
'    return l_new_name;',
'end;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'New Template Name'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13658060332372877322)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(13658058330127877319)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13658060832561877323)
,p_event_id=>wwv_flow_imp.id(13658060332372877322)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13616945353284744852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Copy Template'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_template_id   number;',
'    l_ms_id         number;',
'    l_parent_ms     number;',
'',
'    type ms_t       is table of number index by varchar2(256);',
'    l_milestone_map ms_t;',
'',
'    procedure copy_action_items (   p_old_template_id in number,',
'                                    p_new_template_id in number,',
'                                    p_template_ms_id  in number default null,',
'                                    p_new_ms_id       in number default null',
'                                ) is',
'    begin',
'        -- Loop over template action items',
'        for ai in ( select ait.name,',
'                        ait.description,',
'                        ait.due_date_offset,',
'                        ait.type_id,',
'                        ait.owner',
'                    from eba_proj_template_ai ait',
'                    where ait.template_id = p_old_template_id',
'                        and ( ( p_template_ms_id is null',
'                                and ait.milestone_id is null )',
'                            or ( ait.milestone_id = p_template_ms_id )',
'                        ) ) loop',
'            -- Copy the Action Item Template',
'            insert into eba_proj_template_ai (  template_id,',
'                                                name,',
'                                                description,',
'                                                due_date_offset,',
'                                                type_id,',
'                                                milestone_id,',
'                                                owner )',
'            values (    p_new_template_id,',
'                        ai.name,',
'                        ai.description,',
'                        ai.due_date_offset,',
'                        ai.type_id,',
'                        p_new_ms_id,',
'                        ai.owner',
'            );',
'        end loop;',
'    end copy_action_items;',
'begin',
'    insert into eba_proj_templates ( name )',
'    values ( :P193_NAME )',
'    returning id into l_template_id;',
'',
'    -- Loop over template milestones',
'    for ms in ( select mst.id,',
'                    mst.name,',
'                    mst.description,',
'                    mst.start_date_offset,',
'                    mst.due_date_offset,',
'                    mst.is_major_yn,',
'                    mst.parent_milestone_id,',
'                    mst.owner',
'                from eba_proj_template_ms mst',
'                where mst.template_id = :P193_ID',
'                    start with mst.parent_milestone_id is null',
'                    connect by prior mst.id = mst.parent_milestone_id',
'            ) loop',
'        -- Copy the milestone',
'        if ms.parent_milestone_id is not null then',
'            l_parent_ms := l_milestone_map( ms.parent_milestone_id );',
'        else',
'            l_parent_ms := null;',
'        end if;',
'        insert into eba_proj_template_ms (  template_id,',
'                                            name,',
'                                            description,',
'                                            start_date_offset,',
'                                            due_date_offset,',
'                                            is_major_yn,',
'                                            parent_milestone_id,',
'                                            owner )',
'        values (    l_template_id,',
'                    ms.name,',
'                    ms.description,',
'                    ms.start_date_offset,',
'                    ms.due_date_offset,',
'                    ms.is_major_yn,',
'                    l_parent_ms,',
'                    ms.owner',
'        )',
'        returning id into l_milestone_map( ms.id );',
'',
'        -- Copy action items associated with the template milestone',
'        copy_action_items ( p_old_template_id => :P193_ID,',
'                            p_new_template_id => l_template_id,',
'                            p_template_ms_id  => ms.id,',
'                            p_new_ms_id       => l_parent_ms',
'                        );',
'    end loop;',
'',
'    -- Copy action items that are not associated with any template milestones',
'    copy_action_items ( p_old_template_id => :P193_ID,',
'                        p_new_template_id => l_template_id,',
'                        p_template_ms_id  => null,',
'                        p_new_ms_id       => null',
'                    );',
'',
'    :P193_NEW_ID := l_template_id;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Template copied.'
,p_internal_uid=>13616945353284744852
);
wwv_flow_imp.component_end;
end;
/
