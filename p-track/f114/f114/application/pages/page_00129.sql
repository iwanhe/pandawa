prompt --application/pages/page_00129
begin
--   Manifest
--     PAGE: 00129
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
 p_id=>129
,p_name=>'Project Update'
,p_page_mode=>'MODAL'
,p_step_title=>'Project Update'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Alert--noUI {',
'    box-shadow: none;',
'    margin: 0;',
'    background: none rgba(0,0,0,.1);',
'border-radius: 0;',
'border-width: 0;',
'}'))
,p_step_template=>wwv_flow_imp.id(6672333557014369841)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'680'
,p_dialog_width=>'720'
,p_dialog_max_width=>'1280'
,p_dialog_resizable=>'Y'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6068280197320452575)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6068282606848493129)
,p_plug_name=>'Project Update'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>30
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in (',
'select u.id,',
'       u.status_update,',
'       nvl(u.formatted_update,u.status_update) formatted_update,',
'       u.project_id, ',
'       u.row_key update_row_key ',
'from EBA_PROJ_STATUS_UPDATES u',
'where u.id = :P129_ID',
'    ) loop',
'    sys.htp.p( replace(c1.formatted_update,''##BREAK##'', '''') );',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12796770699404602614)
,p_plug_name=>'Update Info'
,p_region_css_classes=>'t-Alert--accessibleHeading t-Alert--noUI'
,p_icon_css_classes=>'fa-comment-o'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--customIcons:t-Alert--info'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672345091278369856)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in (',
'select u.id,',
'       u.update_date,',
'       u.UPDATE_OWNER ',
'from EBA_PROJ_STATUS_UPDATES u',
'where u.id = :P129_ID',
'    ) loop',
'    sys.htp.p(''<p class="comment-header">''',
'              ||lower(apex_escape.html(c1.update_owner))||'' &middot; ''',
'              || apex_util.get_since(c1.update_date)||''</p>'');',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6068286599763604714)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12796770699404602614)
,p_button_name=>'EDIT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edit Update'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_ID:&P129_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select row_key ',
'from EBA_PROJ_STATUS_UPDATES ',
'where id = :P129_ID and upper(created_by) = upper(:APP_USER)'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-pencil'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6068280509604454289)
,p_name=>'P129_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6068280197320452575)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6068280705937455958)
,p_name=>'P129_PROJECT_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6068280197320452575)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6730294092990894442)
,p_name=>'P129_NEXT_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6068280197320452575)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6730294475244896388)
,p_name=>'P129_PREVIOUS_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6068280197320452575)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12796771019034602618)
,p_name=>'Refresh on Dialog Close'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6068286599763604714)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12796771153010602619)
,p_event_id=>wwv_flow_imp.id(12796771019034602618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6730294657632899997)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'calc next and previous IDs'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_project_id number;',
'l_id         number := :P129_ID;',
'begin',
'for c1 in (select project_id from EBA_PROJ_STATUS_UPDATES x where x.id = l_id) loop l_project_id := c1.project_id; end loop;',
':P129_NEXT_ID := 0;',
':P129_PREVIOUS_ID := 0;',
'',
'for c1 in (',
'    select u.id',
'    from EBA_PROJ_STATUS_UPDATES u',
'    where PROJECT_ID = l_project_id and',
'          update_date > (select update_date from EBA_PROJ_STATUS_UPDATES x where x.id = l_id)',
'    order by UPDATE_DATE asc) loop',
':P129_NEXT_ID := c1.id;',
'exit;',
'end loop;',
'',
'for c1 in (',
'    select u.id',
'    from EBA_PROJ_STATUS_UPDATES u',
'    where PROJECT_ID = l_project_id and',
'          update_date < (select update_date from EBA_PROJ_STATUS_UPDATES x where x.id = l_id)',
'    order by UPDATE_DATE desc) loop',
':P129_PREVIOUS_ID := c1.id;',
'exit;',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>6730294657632899997
);
wwv_flow_imp.component_end;
end;
/
