prompt --application/pages/page_00105
begin
--   Manifest
--     PAGE: 00105
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
 p_id=>105
,p_name=>'Build Options'
,p_page_mode=>'MODAL'
,p_step_title=>'Build Options'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486086019073759)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_help_text=>'<p>Build options allow for specific application functionality to be included and available, or excluded and not available.  Use build options to identify which features and functions you would like to run your application with.</p>'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(400620104969487172)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(5969667382653502618)
,p_name=>'Build Options'
,p_region_name=>'feature_config_region'
,p_template=>wwv_flow_imp.id(1993405599699027906)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select build_option_id id,',
'  case',
'    when build_option_name in (''Feedback'', ''Flex Columns'', ''Project Templates'', ''Restrict Changes (Template)'')',
'    then ''Application''',
'    when build_option_name in (''Dashboard'',''Dashboard: Show Parent Projects'', ''Dashboard: Show People Resources'', ''Dashboard: Show Projects by Category'',',
'        ''Dashboard: Show Projects by Status'', ''Dashboard: Show least recently edited'', ''Dashboard: Show recently created'', ''Dashboard: Show recently edited projects'',',
'        ''Dashboard: Show summary'')',
'    then ''DashBoard''',
'    when build_option_name in (''Email Past Due Deliverables'', ''Email Project Details'', ''Email Project Statuses'', ''Email Upcoming Deliverables'', ''Include E-Mail Ingest'')',
'    then ''Email''',
'    when build_option_name in (''Background Checks'', ''HIPPA Certification Date'', ''Skillsets'', ''Team Groups'', ''Assistant'')',
'    then ''People''',
'    when build_option_name in (''Action Item Links'', ''Allow Parent Projects'', ''Content complete "fish bowl"'', ''Edit Closed Projects'', ''Headlines'',',
'        ''Impacted Environments'', ''Mandatory Action Item Resolution'', ''Merge'', ''Perma Link'', ''Project Action Items'',',
'        ''Project Attachments'', ''Project Code Names'', ''Project Countries'', ''Project Deal Types'', ''Project Issues'',',
'        ''Project Links'', ''Project Milestones'', ''Project Resources'', ''Project Sizes'', ''Project Status Reports'',',
'        ''Project Updates'', ''Project User Involvement'', ''Project Validations'', ''Requesting Teams'', ''Restrict Changes'',''Heat Map Reporting'',',
'        ''Project Issues Categories'', ''Project Issues Reference Identifier'')',
'    then ''Projects''',
'  end feature_type,',
'  build_option_name feature_name, ',
'  component_comment feature_comment,',
'  apex_item.hidden(1, build_option_id) ||',
'    apex_item.hidden(2, build_option_status) || ',
'    apex_item.switch ( ',
'       p_idx => 3,',
'       p_value => build_option_status,',
'       p_on_value => ''Include'',',
'       p_on_label => ''Yes'',',
'       p_off_value => ''Exclude'',',
'       p_off_label => ''No'',',
'       p_item_id => ''BO_OPT_'' || rownum,',
'       p_item_label => apex_escape.html(build_option_name) || '': Is Enabled'',',
'       p_attributes => ''style="white-space:pre;"'') enabled,',
'  last_updated_on updated,',
'  lower(last_updated_by) updated_by,',
'  (select count(*) from apex_application_pages p where p.application_id = :APP_ID and p.build_option = bo.build_option_name) pages,',
'  (select count(*) from apex_application_page_regions p where p.application_id = :APP_ID and p.build_option = bo.build_option_name) regions,',
'  (select count(*) from apex_application_page_buttons p where p.application_id = :APP_ID and p.build_option = bo.build_option_name) buttons,',
'  (select count(*) from apex_application_page_items p where p.application_id = :APP_ID and p.build_option = bo.build_option_name) items',
'from apex_application_build_options bo',
'where application_id = :APP_ID',
'  and build_option_name in (''Feedback'', ''Flex Columns'', ''Project Templates'', ''Restrict Changes (Template)'',',
'    ''Dashboard'',''Dashboard: Show Parent Projects'', ''Dashboard: Show People Resources'', ''Dashboard: Show Projects by Category'',',
'    ''Dashboard: Show Projects by Status'', ''Dashboard: Show least recently edited'', ''Dashboard: Show recently created'', ',
'    ''Dashboard: Show recently edited projects'', ''Dashboard: Show summary'', ''Email Past Due Deliverables'', ''Email Project Details'', ''Email Project Statuses'', ',
'    ''Email Upcoming Deliverables'', ''Include E-Mail Ingest'', ''Background Checks'', ''HIPPA Certification Date'', ''Skillsets'', ''Team Groups'', ''Action Item Links'', ',
'    ''Allow Parent Projects'', ''Content complete "fish bowl"'', ''Edit Closed Projects'', ''Headlines'', ''Impacted Environments'', ''Mandatory Action Item Resolution'', ',
'    ''Merge'', ''Perma Link'', ''Project Action Items'', ''Project Attachments'', ''Project Code Names'', ''Project Countries'', ''Project Deal Types'', ''Project Issues'',',
'    ''Project Links'', ''Project Milestones'', ''Project Resources'', ''Project Sizes'', ''Project Status Reports'', ''Project Updates'', ''Project User Involvement'', ',
'    ''Project Validations'', ''Requesting Teams'', ''Restrict Changes'', ''Assistant'',''Heat Map Reporting'',''Project Issues Categories'',''Project Issues Reference Identifier'')',
'order by feature_type, build_option_name'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_break_cols=>'1'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2661935742632730456)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2661935847051730457)
,p_query_column_id=>2
,p_column_alias=>'FEATURE_TYPE'
,p_column_display_sequence=>1
,p_column_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2661935944419730458)
,p_query_column_id=>3
,p_column_alias=>'FEATURE_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Feature'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2661936037795730459)
,p_query_column_id=>4
,p_column_alias=>'FEATURE_COMMENT'
,p_column_display_sequence=>3
,p_column_heading=>'Comment'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2661936196072730460)
,p_query_column_id=>5
,p_column_alias=>'ENABLED'
,p_column_display_sequence=>4
,p_column_heading=>'Enabled'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2661936208013730461)
,p_query_column_id=>6
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>11
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2661936334661730462)
,p_query_column_id=>7
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>10
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2661936883164730467)
,p_query_column_id=>8
,p_column_alias=>'PAGES'
,p_column_display_sequence=>6
,p_column_heading=>'Pages'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2661936984504730468)
,p_query_column_id=>9
,p_column_alias=>'REGIONS'
,p_column_display_sequence=>7
,p_column_heading=>'Regions'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2661937025642730469)
,p_query_column_id=>10
,p_column_alias=>'BUTTONS'
,p_column_display_sequence=>8
,p_column_heading=>'Buttons'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2661937111189730470)
,p_query_column_id=>11
,p_column_alias=>'ITEMS'
,p_column_display_sequence=>9
,p_column_heading=>'Items'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5969669799261502627)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5969669014271502626)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(400620104969487172)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5969670086121502629)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for i in 1..apex_application.g_f01.count loop',
'    for c1 in ( select application_id, build_option_name, build_option_status',
'                from apex_application_build_options',
'                where apex_application.g_f01(i) = build_option_id',
'                   and application_Id = :APP_ID) loop',
'        if c1.build_option_status != apex_application.g_f03(i) then',
'            apex_util.set_build_option_status(  p_application_id => :APP_ID,',
'                                                p_id => apex_application.g_f01(i),',
'                                                p_build_status => upper(apex_application.g_f03(i)) );',
'        end if;',
'    end loop;',
'end loop;',
'-- Reset the project details help text (in case any build options have changed for that page)',
':P200_HELP_TEXT := eba_proj_help.get_project_details_help_text(p_app_id => :P_APP_ID);'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Build Option Status(es) failed to be updated.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Build Option Status(es) updated.'
,p_internal_uid=>5969670086121502629
);
wwv_flow_imp.component_end;
end;
/
