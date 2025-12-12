prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Preview Updated Users'
,p_step_title=>'Preview Updated Users'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486291560075385)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_help_text=>'<p>When closing all Action Items that are associated to a given Milestone, the Milestone will also be marked as completed.</p>'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22939805385173654094)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(23189506495863691670)
,p_name=>'Updates'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Form--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    n001 as user_id,',
'    c001 as action,',
'    c002 as old_value,',
'    c003 as new_value,',
'    c004 as username',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_USERS''',
'order by 5;'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No updatable Action Item(s) found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2713434600337930179)
,p_query_column_id=>1
,p_column_alias=>'USER_ID'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2716503265727562067)
,p_query_column_id=>2
,p_column_alias=>'ACTION'
,p_column_display_sequence=>1
,p_column_heading=>'Action'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2716503641060562067)
,p_query_column_id=>3
,p_column_alias=>'OLD_VALUE'
,p_column_display_sequence=>2
,p_column_heading=>'Old Value'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2716504015488562068)
,p_query_column_id=>4
,p_column_alias=>'NEW_VALUE'
,p_column_display_sequence=>3
,p_column_heading=>'New Value'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2713434644219930180)
,p_query_column_id=>5
,p_column_alias=>'USERNAME'
,p_column_display_sequence=>5
,p_column_heading=>'User'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23240350199055093194)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2716507751488562090)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2716508136421562093)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_USERS'''))
,p_button_condition_type=>'EXISTS'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2716510302805562103)
,p_branch_action=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2716506687550562074)
,p_name=>'P16_ACTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(23240350199055093194)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(2716508663188562099)
,p_computation_sequence=>10
,p_computation_item=>'P16_ACTION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    distinct c001 as action',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_USERS'''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2716509773760562101)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Users'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_access_level_id number;',
'    l_country_id      number;',
'    l_region_id       number;',
'begin',
'    for c1 in',
'    (',
'        select',
'            n001 as user_id,',
'            c001 as action,',
'            c002 as old_value,',
'            c003 as new_value,',
'            c004 as username',
'        from',
'            apex_collections',
'        where',
'            collection_name = ''PREVIEW_USERS''',
'    )',
'    loop',
'        if c1.action = ''Change Access Level'' then',
'            select id into l_access_level_id from eba_proj_status_access_levels where access_level = c1.new_value;',
'            update eba_proj_status_users set access_level_id = l_access_level_id where id = c1.user_id;',
'        elsif c1.action = ''Change Country'' then',
'            select id into l_country_id from eba_proj_countries where country_name = c1.new_value;',
'            select region_id into l_region_id from eba_proj_countries where country_name = c1.new_value;',
'            update eba_proj_status_users set country_id = l_country_id where id = c1.user_id;',
'            update eba_proj_status_users set region_id = l_region_id where id = c1.user_id;',
'        elsif c1.action = ''Change Timezone'' then',
'            update eba_proj_status_users set home_timezone = c1.new_value where id = c1.user_id;',
'        elsif c1.action = ''Change Background Check(s)'' then',
'            update eba_proj_status_users set bg_checks = c1.new_value where id = c1.user_id;',
'        elsif c1.action = ''Change Skillsets'' then',
'            update eba_proj_status_users set skillsets = c1.new_value where id = c1.user_id;',
'        elsif c1.action = ''Change Team Group(s)'' then',
'            update eba_proj_status_users set team_groups = c1.new_value where id = c1.user_id;',
'        elsif c1.action = ''Change Locked Status'' then',
'            update eba_proj_status_users set account_locked = c1.new_value where id = c1.user_id;',
'        end if;',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(2716508136421562093)
,p_process_success_message=>'User(s) updated successfully.'
,p_internal_uid=>2716509773760562101
);
wwv_flow_imp.component_end;
end;
/
