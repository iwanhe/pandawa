prompt --application/pages/page_00033
begin
--   Manifest
--     PAGE: 00033
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
 p_id=>33
,p_name=>'Projects to view in navigator'
,p_step_title=>'Projects to view in navigator'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Select the types of projects you would like displayed in your left-hand navigation menu (open projects only or all projects). Click the <strong>Apply Changes</strong> button to set the preference value and vary the projects displayed in your menu.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5292925855010498766)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5297556597610138853)
,p_plug_name=>'Navigation Menu Preferences'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(14125335418275651865)
,p_name=>'Project Status Codes'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select status_short_desc,',
'    case',
'        when :P33_NAV_MENU_PREFERENCE = ''ALL'' then',
'            ''Displayed''',
'        else',
'            decode(is_closed_status, ''Y'', ''Not displayed'', ''N'', ''Displayed'', is_closed_status)',
'    end display_in_tree,',
'    decode(IS_DESIRABLE_YN,null,''Yes'',''Y'',''Yes'',''N'',''No'',''Unknown'') IS_DESIRABLE,',
'    decode(is_closed_status,''Y'',''Yes'',''N'',''No'',is_closed_status) is_closed_status,',
'    (select c.color_name from eba_proj_color_codes c where c.id = sc.color_code_id) color,',
'    (select count(*) from eba_proj_status s where s.project_status = sc.id) as project_count',
'from EBA_PROJ_STATUS_CODES  sc',
'where IS_ACTIVE_YN = ''Y''',
'order by display_sequence'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14125347281915651874)
,p_query_column_id=>1
,p_column_alias=>'STATUS_SHORT_DESC'
,p_column_display_sequence=>1
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14125537151632700393)
,p_query_column_id=>2
,p_column_alias=>'DISPLAY_IN_TREE'
,p_column_display_sequence=>3
,p_column_heading=>'Display In Tree'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14125347666672651874)
,p_query_column_id=>3
,p_column_alias=>'IS_DESIRABLE'
,p_column_display_sequence=>2
,p_column_heading=>'Is Desirable'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14125348111782651875)
,p_query_column_id=>4
,p_column_alias=>'IS_CLOSED_STATUS'
,p_column_display_sequence=>4
,p_column_heading=>'Is Closed Status'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14125348479785651875)
,p_query_column_id=>5
,p_column_alias=>'COLOR'
,p_column_display_sequence=>5
,p_column_heading=>'Color'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14125348861133651876)
,p_query_column_id=>6
,p_column_alias=>'PROJECT_COUNT'
,p_column_display_sequence=>6
,p_column_heading=>'Projects'
,p_column_format=>'999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5282043365815171782)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5282043272984171781)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5282043514563171784)
,p_branch_name=>'Return to preferences page'
,p_branch_action=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5282043113831171780)
,p_name=>'P33_NAV_MENU_PREFERENCE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5297556597610138853)
,p_item_default=>'OPEN'
,p_prompt=>'Navigation Menu Preference'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select preference_value',
'from eba_proj_user_preferences p',
'where upper(p.username) = :APP_USER',
'    and p.preference_name = ''NAVIGATION MENU'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:All Projects;ALL,Open Projects;OPEN'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1789201053720898951)
,p_name=>'Refresh Status Codes Region'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P33_NAV_MENU_PREFERENCE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1789201274029898953)
,p_event_id=>wwv_flow_imp.id(1789201053720898951)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P33_NAV_MENU_PREFERENCE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1789201187823898952)
,p_event_id=>wwv_flow_imp.id(1789201053720898951)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(14125335418275651865)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5282043439699171783)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Navigation Preference'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'merge into eba_proj_user_preferences p',
'using ( select :APP_USER username, ''NAVIGATION MENU'' preference_name, :P33_NAV_MENU_PREFERENCE preference_value',
'        from dual ) src',
'on ( p.username = src.username and p.preference_name = src.preference_name )',
'when matched then',
'    update set p.preference_value = src.preference_value',
'when not matched then',
'    insert ( username, preference_name, preference_value )',
'    values ( src.username, src.preference_name, src.preference_value );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Preference saved.'
,p_internal_uid=>5282043439699171783
);
wwv_flow_imp.component_end;
end;
/
