prompt --application/pages/page_00067
begin
--   Manifest
--     PAGE: 00067
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_page.create_page(
 p_id=>67
,p_name=>'Application Activity by Page'
,p_step_title=>'Application Activity by Page'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026850665033934)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(3204234956647058484)
,p_help_text=>'This is an interactive report of page view details. Change the "Timeframe" filter to vary the report''s results. Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions</strong> button to define the number of'
||' rows displayed per page, filter, format, download, and/or save the interactive report.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1559331674239222656)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(1609169348961051977)
,p_plug_display_sequence=>10
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1559332062120222665)
,p_plug_name=>'Application Activity by Page'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609178411209051992)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'step_id            Page,',
'(select page_name from apex_application_pages p where p.page_id = l.step_id and p.application_id = :app_id) page_name,',
'min(ELAP)        min_Elapsed,',
'avg(ELAP)        avg_Elapsed,',
'median(elap)     median_elapsed,',
'max(elap)        max_elapsed,',
'sum(nvl(NUM_ROWS,0))    total_rows,',
'--sum(IR_SEARCH)   total_ir_searches,',
'sum(decode(SQLERRM,null,0,1) )   Errors,',
'sum(decode(page_mode,''P'',1,0)) partial_page_views,',
'sum(decode(page_mode,''D'',1,0)) full_page_views,',
'count(*) page_views,',
'count(*) * median(elap) weighted_performance,',
'count(distinct userid) distinct_users,',
'count(distinct session_id) application_sessions',
'from apex_activity_log l',
'where ',
'    flow_id = :app_id',
'    and time_stamp > sysdate - to_number(:P67_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')',
'    and userid is not null',
'group by step_id'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(1559332274525222670)
,p_name=>'Application Activity'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>890770732512126251
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559332746625222681)
,p_db_column_name=>'PAGE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559332853356222681)
,p_db_column_name=>'MIN_ELAPSED'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Min Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D9999'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559332953467222681)
,p_db_column_name=>'AVG_ELAPSED'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Avg Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D9999'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559333067773222681)
,p_db_column_name=>'MEDIAN_ELAPSED'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Median Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D9999'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559333150147222682)
,p_db_column_name=>'MAX_ELAPSED'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Max Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D9999'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559333258718222682)
,p_db_column_name=>'ERRORS'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Errors'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559333342041222683)
,p_db_column_name=>'PARTIAL_PAGE_VIEWS'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Partial Page Views'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559333447839222683)
,p_db_column_name=>'FULL_PAGE_VIEWS'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Full Page Views'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559333572354222683)
,p_db_column_name=>'PAGE_VIEWS'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Page Views'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559333670758222683)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Page Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559332356015222676)
,p_db_column_name=>'TOTAL_ROWS'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Total Rows'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559332471978222681)
,p_db_column_name=>'WEIGHTED_PERFORMANCE'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Weighted Performance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D99'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559332560118222681)
,p_db_column_name=>'DISTINCT_USERS'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Distinct Users'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1559332653394222681)
,p_db_column_name=>'APPLICATION_SESSIONS'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Application Sessions'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1559333756532222683)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8907723'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'PAGE:PAGE_NAME:MEDIAN_ELAPSED:PAGE_VIEWS:WEIGHTED_PERFORMANCE:ERRORS:DISTINCT_USERS:APPLICATION_SESSIONS'
,p_sort_column_1=>'WEIGHTED_PERFORMANCE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'PAGE_VIEWS'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'TIMESTAMP'
,p_sort_direction_3=>'DESC'
,p_sort_column_4=>'View'
,p_sort_direction_4=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1559334570123222700)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1559333963934222685)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1559331674239222656)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202304669052069)
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:67,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1559331869267222657)
,p_name=>'P67_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1559331674239222656)
,p_item_default=>'00001.0000000000'
,p_prompt=>'Timeframe'
,p_source=>'00001.0000000000'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME (4 WEEKS)'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select wwv_flow_lang.system_message(''N_MINUTES'',''15'') d, ',
'trim(to_char(15/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_MINUTES'',''30'') d, ',
'trim(to_char(30/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_HOUR'',''1'') d, ',
'trim(to_char(1/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_MINUTES'',''90'') d, ',
'trim(to_char(90/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_HOURS'',''2'') d, ',
'trim(to_char(1/12,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_HOURS'',''3'') d, ',
'trim(to_char(3/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_HOURS'',''4'') d, ',
'trim(to_char(4/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_HOURS'',''5'') d, ',
'trim(to_char(5/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_HOURS'',''6'') d, ',
'trim(to_char(6/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_HOURS'',''8'') d, ',
'trim(to_char(8/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_HOURS'',''10'') d, ',
'trim(to_char(10/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_HOURS'',''12'') d, ',
'trim(to_char(12/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_HOURS'',''16'') d, ',
'trim(to_char(16/24,''00000.9999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_DAY'',''1'') d, trim(to_char(1,''00000.9999999999'')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_DAYS'',''2'') d, trim(to_char(2,''00000.9999999999'')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_DAYS'',''3'') d, trim(to_char(3,''00000.9999999999'')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_DAYS'',''4'') d, trim(to_char(4,''00000.9999999999'')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_DAYS'',''5'') d, trim(to_char(5,''00000.9999999999'')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_WEEK'',''1'') d, trim(to_char(7,''00000.9999999999'')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_WEEKS'',''2'') d, trim(to_char(14,''00000.9999999999'')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_WEEKS'',''3'') d, trim(to_char(21,''00000.9999999999'')) t from dual',
'union all ',
'select wwv_flow_lang.system_message(''N_WEEKS'',''4'') d, trim(to_char(28,''00000.9999999999'')) t from dual',
'order by 2'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp.component_end;
end;
/
