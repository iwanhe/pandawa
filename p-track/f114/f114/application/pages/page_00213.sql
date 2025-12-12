prompt --application/pages/page_00213
begin
--   Manifest
--     PAGE: 00213
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
 p_id=>213
,p_name=>'Preview My Updated Action Items'
,p_step_title=>'Preview My Updated Action Items'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486291560075385)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>If everything looks good, click the <strong>Apply Changes</strong> button otherwise click the <strong>Cancel</strong> button.</p>',
'<p>When closing all Action Items that are associated to a given Milestone, the Milestone will also be marked as completed.</p>'))
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20289555368096214617)
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
 p_id=>wwv_flow_imp.id(20466781281676189956)
,p_name=>'Exceptions'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Form--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    n001 as ai_id,',
'    c001 as action_item,',
'    c002 as action,',
'    c003 as old_value,',
'    c004 as new_value,',
'    c005 as project,',
'    c006 as completed_date,',
'    c007 as resolution,',
'    eba_proj_fw.get_name_from_email_address(c008) as completed_by,',
'    c009 as error',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_AIS''',
'and',
'    c009 is not null',
'order by 2'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    null',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_AIS''',
'and',
'    c009 is not null'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20466781622505189960)
,p_query_column_id=>1
,p_column_alias=>'AI_ID'
,p_column_display_sequence=>3
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20466781810718189961)
,p_query_column_id=>2
,p_column_alias=>'ACTION_ITEM'
,p_column_display_sequence=>4
,p_column_heading=>'Action Item'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20466781849981189962)
,p_query_column_id=>3
,p_column_alias=>'ACTION'
,p_column_display_sequence=>5
,p_column_heading=>'Action'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20466781919411189963)
,p_query_column_id=>4
,p_column_alias=>'OLD_VALUE'
,p_column_display_sequence=>6
,p_column_heading=>'Old Value'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20590099838552653714)
,p_query_column_id=>5
,p_column_alias=>'NEW_VALUE'
,p_column_display_sequence=>7
,p_column_heading=>'New Value'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20590100006551653715)
,p_query_column_id=>6
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>8
,p_column_heading=>'Project'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20466781484089189958)
,p_query_column_id=>7
,p_column_alias=>'COMPLETED_DATE'
,p_column_display_sequence=>1
,p_column_heading=>'Completed date'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    null',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_AIS''',
'and',
'    c006 is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20466781592400189959)
,p_query_column_id=>8
,p_column_alias=>'RESOLUTION'
,p_column_display_sequence=>2
,p_column_heading=>'Resolution'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    null',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_AIS''',
'and',
'    c007 is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20590100105544653716)
,p_query_column_id=>9
,p_column_alias=>'COMPLETED_BY'
,p_column_display_sequence=>9
,p_column_heading=>'Completed By'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    null',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_AIS''',
'and',
'    c008 is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20289569065638214654)
,p_query_column_id=>10
,p_column_alias=>'ERROR'
,p_column_display_sequence=>10
,p_column_heading=>'Error'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(20539256478786252193)
,p_name=>'Updates'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Form--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    n001 as ai_id,',
'    n002 as ms_id,',
'    c001 as action_item,',
'    c002 as action,',
'    c003 as old_value,',
'    c004 as new_value,',
'    c005 as project,',
'    c006 as completed_date,',
'    c007 as resolution,',
'    eba_proj_fw.get_name_from_email_address(c008) as completed_by',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_AIS''',
'and',
'    c009 is null',
'order by 2'))
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
 p_id=>wwv_flow_imp.id(20539257125340252196)
,p_query_column_id=>1
,p_column_alias=>'AI_ID'
,p_column_display_sequence=>1
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21048394231804075551)
,p_query_column_id=>2
,p_column_alias=>'MS_ID'
,p_column_display_sequence=>4
,p_column_heading=>'Milestone'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_inline_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select milestone_name, id',
'  from eba_proj_status_ms'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20539257580791252197)
,p_query_column_id=>3
,p_column_alias=>'ACTION_ITEM'
,p_column_display_sequence=>2
,p_column_heading=>'Action Item'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20539258011426252198)
,p_query_column_id=>4
,p_column_alias=>'ACTION'
,p_column_display_sequence=>5
,p_column_heading=>'Action'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20539258369388252198)
,p_query_column_id=>5
,p_column_alias=>'OLD_VALUE'
,p_column_display_sequence=>6
,p_column_heading=>'Old Value'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20539258753813252198)
,p_query_column_id=>6
,p_column_alias=>'NEW_VALUE'
,p_column_display_sequence=>7
,p_column_heading=>'New Value'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20539259183401252199)
,p_query_column_id=>7
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>3
,p_column_heading=>'Project'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20466780375017189947)
,p_query_column_id=>8
,p_column_alias=>'COMPLETED_DATE'
,p_column_display_sequence=>8
,p_column_heading=>'Completed Date'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    null',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_AIS''',
'and',
'    c006 is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20466780602522189949)
,p_query_column_id=>9
,p_column_alias=>'RESOLUTION'
,p_column_display_sequence=>9
,p_column_heading=>'Resolution'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    null',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_AIS''',
'and',
'    c007 is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20466780635024189950)
,p_query_column_id=>10
,p_column_alias=>'COMPLETED_BY'
,p_column_display_sequence=>10
,p_column_heading=>'Completed By'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    null',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_AIS''',
'and',
'    c008 is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20590100181977653717)
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
 p_id=>wwv_flow_imp.id(20289555472525214618)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:212:&SESSION.::&DEBUG.:RP,212:P212_PROJECT_ID:&P213_PROJECT_ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20289555591086214619)
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
'    collection_name = ''PREVIEW_AIS''',
'and',
'    c009 is null'))
,p_button_condition_type=>'EXISTS'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(20590100292122653718)
,p_branch_action=>'f?p=&APP_ID.:194:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1789202963628898970)
,p_name=>'P213_PROJECT_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(20590100181977653717)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20466780781192189951)
,p_name=>'P213_ACTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(20590100181977653717)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20466780887934189952)
,p_computation_sequence=>10
,p_computation_item=>'P213_ACTION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    distinct c002 as action',
'from',
'    apex_collections',
'where',
'    collection_name = ''PREVIEW_AIS'''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20466780939674189953)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update AI Statuses'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_open_ai_cnt number;',
'    l_ms_status   eba_proj_status_ms.milestone_status%type;',
'begin',
'    for c1 in',
'    (',
'        select',
'            n001 as ai_id,',
'            n002 as ms_id,',
'            c004 as new_value,',
'            c006 as completed_date,',
'            c007 as resolution,',
'            c008 as completed_by',
'        from',
'            apex_collections',
'        where',
'            collection_name = ''PREVIEW_AIS''',
'        and',
'            c009 is null',
'    )',
'    loop',
'        if c1.new_value = ''Closed'' then',
'            update eba_proj_status_ais',
'               set action_status = c1.new_value,',
'                   completed_date = c1.completed_date,',
'                   completed_by = c1.completed_by,',
'                   resolution = c1.resolution',
'             where id = c1.ai_id;',
'            if c1.ms_id is not null then',
'                select count(*) into l_open_ai_cnt from eba_proj_status_ais where milestone_id = c1.ms_id and action_status = ''Open'';',
'                if l_open_ai_cnt = 0 then',
'                    for c2 in',
'                    (',
'                        select milestone_status',
'                          from eba_proj_status_ms',
'                         where id = c1.ms_id',
'                    )',
'                    loop',
'                        l_ms_status := c2.milestone_status;',
'                    end loop;',
'                    if l_ms_status = ''Open'' then',
'                        update eba_proj_status_ms',
'                           set milestone_status = ''Completed'',',
'                               completed_date = c1.completed_date',
'                         where id = c1.ms_id;',
'                    end if;',
'                end if;',
'            end if;',
'        else',
'            update eba_proj_status_ais',
'               set action_status = c1.new_value',
'             where id = c1.ai_id;',
'        end if;',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(20289555591086214619)
,p_process_when=>'P213_ACTION'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'Change Status'
,p_process_success_message=>'Action Item status(es) updated accordingly.'
,p_internal_uid=>20466780939674189953
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20466781039554189954)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update AI Due Dates'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in',
'(',
'    select',
'        n001 as ai_id,',
'        c004 as new_value',
'    from',
'        apex_collections',
'    where',
'        collection_name = ''PREVIEW_AIS''',
'    and',
'        c009 is null',
')',
'loop',
'    update eba_proj_status_ais',
'       set due_date = to_date(c1.new_value,''DD-MON-YYYY'')',
'     where id = c1.ai_id;',
'end loop;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(20289555591086214619)
,p_process_when=>'P213_ACTION'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'Change Due Date'
,p_process_success_message=>'Action Item due date(s) updated accordingly.'
,p_internal_uid=>20466781039554189954
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20466781196761189955)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update AI Types'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in',
'(',
'    select',
'        n001 as ai_id,',
'        c004 as new_value',
'    from',
'        apex_collections',
'    where',
'        collection_name = ''PREVIEW_AIS''',
'    and',
'        c009 is null',
')',
'loop',
'    update eba_proj_status_ais',
'       set type_id = (select id from eba_proj_status_ais_types where lower(ai_type) = lower(c1.new_value))',
'     where id = c1.ai_id;',
'end loop;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(20289555591086214619)
,p_process_when=>'P213_ACTION'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'Change Type'
,p_process_success_message=>'Action Item type(s) updated accordingly.'
,p_internal_uid=>20466781196761189955
);
wwv_flow_imp.component_end;
end;
/
