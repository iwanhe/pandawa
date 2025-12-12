prompt --application/pages/page_00214
begin
--   Manifest
--     PAGE: 00214
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
 p_id=>214
,p_name=>'Milestones Analysis Report'
,p_step_title=>'Milestones Analysis Report'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486601256078156)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>unistr('This interactive report shows all project milestones with a control-break on project and status. Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions \00BF</strong> button to define the number of rows display')
||'ed per page, filter, format, download, and/or save the interactive report.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19272913035391975531)
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
 p_id=>wwv_flow_imp.id(19272913625379975536)
,p_plug_name=>'Milestone Date Forecasting Accuracy'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'    case when eba_proj_fw.is_edit_authorized( p_username   => upper(:APP_USER), p_project_id => m.project_id ) = ''Y'' then',
'        ''<a href="'' || apex_util.prepare_url(''f?p='' || :APP_ID || '':48:'' || :APP_SESSION || '':::48:P48_ID,P48_PROJECT_ID:'' || m.id || '','' || m.project_id || '':'') || ''"><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pe'
||'ncil" alt="Edit Milestone"></a>''',
'    else',
'        null',
'    end as edit_link,',
'    case',
'        when (select count(*) from eba_proj_status_ais where project_id = m.project_id and milestone_id = m.id) > 0 then',
'            round(((select count(*) from eba_proj_status_ais where project_id = m.project_id and milestone_id = m.id and action_status = ''Closed'')/(select count(*) from eba_proj_status_ais where project_id = m.project_id and milestone_id = m.id)) * 1'
||'00) || ''%''',
'        else',
'            ''0%''',
'    end as percent_complete,',
'    case',
'        when milestone_status != ''Completed'' and m.milestone_date < current_timestamp then',
'            ''Y''',
'        else',
'            ''N''',
'    end past_due_yn,',
'    project_id,',
'    (   select project',
'        from eba_proj_status x',
'        where x.id = m.project_id ) project, ',
'    milestone_name,',
'    (select project_status from eba_proj_status where id = m.project_id) project_status,',
'    --',
'    (select listagg(to_char(to_date(substr(new_value,1,11),''DD-MON-YYYY''),''fmDD-MON-YYYY'')||'' ''||',
'        eba_proj_fw.get_name_from_email_address(changed_by),'', '')  within group (order by change_date)',
'     from eba_proj_history',
'     where table_name = ''STATUS_MS''',
'       and column_name = ''MILESTONE_DATE''',
'       and component_id = m.id)',
'    change_history,',
'    case when milestone_status = ''Completed'' then',
'        (select nvl(max(change_date), m.milestone_date) from eba_proj_history where table_name = ''STATUS_MS'' and new_value = ''Completed'' and component_id = m.id)',
'    else',
'        null',
'    end as actual_completion_date,',
'    case when milestone_status = ''Completed'' then',
'        completed_date',
'    else',
'        null',
'    end as completion_date,',
'    milestone_date,',
'    milestone_start_date,',
'    nvl(original_due_date, milestone_date) as original_due_date,',
'    nvl(trunc(original_due_date), trunc(milestone_date)) - trunc(completed_date) as original_day_delta,',
'    trunc(milestone_date) - trunc(completed_date) as day_delta,',
'    nvl(trunc(original_due_date), trunc(milestone_date)) - trunc(milestone_date) as original_due_delta,',
'    milestone_status,',
'    decode(nvl(is_major_yn,''N''),''N'',''No'',''Yes'') major,',
'    case when owner_role_id is null then',
'        eba_proj_fw.get_name_from_email_address(milestone_owner)',
'    else',
'        nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '')',
'                within group (order by lower(u.username)) owner',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.role_id = m.owner_role_id',
'                and rf.project_id = m.project_id',
'                and u.id = rf.user_id',
'                and r.id = rf.role_id',
'            group by r.name',
'        ), (select ''No ''||r.name||'' defined''',
'            from eba_proj_roles r',
'            where r.id = m.owner_role_id)',
'        )',
'    end as milestone_owner',
'from eba_proj_status_ms m'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(19272913772206975536)
,p_name=>'Milestone Date Forecasting Accuracy'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ALLAN'
,p_internal_uid=>18153194856785993323
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19272914256871975544)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19272914554045975545)
,p_db_column_name=>'EDIT_LINK'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Edit'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19272914917933975546)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Project Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19272915375572975546)
,p_db_column_name=>'PROJECT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200,RIR:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19272915728700975547)
,p_db_column_name=>'MILESTONE_NAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Milestone'
,p_column_link=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:RP,107:P107_ID,P107_PROJECT_ID:#ID#,#PROJECT_ID#'
,p_column_linktext=>'#MILESTONE_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19272916596872975549)
,p_db_column_name=>'ORIGINAL_DUE_DATE'
,p_display_order=>15
,p_column_identifier=>'G'
,p_column_label=>'Original Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#ORIGINAL_DUE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19272916199512975549)
,p_db_column_name=>'MILESTONE_DATE'
,p_display_order=>25
,p_column_identifier=>'F'
,p_column_label=>'Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#MILESTONE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19058730445561337551)
,p_db_column_name=>'COMPLETION_DATE'
,p_display_order=>35
,p_column_identifier=>'L'
,p_column_label=>'Completion Date'
,p_column_html_expression=>'<span style="white-space: pre;">#COMPLETION_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19272916967360975551)
,p_db_column_name=>'DAY_DELTA'
,p_display_order=>45
,p_column_identifier=>'H'
,p_column_label=>'Due to Completion Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19272917396232975552)
,p_db_column_name=>'MILESTONE_STATUS'
,p_display_order=>55
,p_column_identifier=>'I'
,p_column_label=>'Milestone Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19272917728155975552)
,p_db_column_name=>'MAJOR'
,p_display_order=>65
,p_column_identifier=>'J'
,p_column_label=>'Major'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19272918160204975552)
,p_db_column_name=>'MILESTONE_OWNER'
,p_display_order=>75
,p_column_identifier=>'K'
,p_column_label=>'Milestone Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18828368208757420919)
,p_db_column_name=>'CHANGE_HISTORY'
,p_display_order=>85
,p_column_identifier=>'M'
,p_column_label=>'Change History'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19204381337263214121)
,p_db_column_name=>'ACTUAL_COMPLETION_DATE'
,p_display_order=>95
,p_column_identifier=>'N'
,p_column_label=>'Marked as Completed On'
,p_column_html_expression=>'<span style="white-space: pre;">#ACTUAL_COMPLETION_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19204381525960214123)
,p_db_column_name=>'MILESTONE_START_DATE'
,p_display_order=>105
,p_column_identifier=>'O'
,p_column_label=>'Start Date'
,p_column_html_expression=>'<span style="white-space: pre;">#MILESTONE_START_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19204383628089214144)
,p_db_column_name=>'ORIGINAL_DAY_DELTA'
,p_display_order=>115
,p_column_identifier=>'P'
,p_column_label=>'Original Due to Completion Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741812744649499826)
,p_db_column_name=>'ORIGINAL_DUE_DELTA'
,p_display_order=>135
,p_column_identifier=>'R'
,p_column_label=>'Original Due to Due Date Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741812863066499827)
,p_db_column_name=>'PERCENT_COMPLETE'
,p_display_order=>145
,p_column_identifier=>'S'
,p_column_label=>'Percent Complete'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741812967318499828)
,p_db_column_name=>'PAST_DUE_YN'
,p_display_order=>155
,p_column_identifier=>'T'
,p_column_label=>'Past Due'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(8910494933283350717)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20124882010007729625)
,p_db_column_name=>'PROJECT_STATUS'
,p_display_order=>165
,p_column_identifier=>'U'
,p_column_label=>'Project Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(8916964241877251201)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19272921907687976355)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'181532030'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>1000
,p_report_columns=>'PROJECT:PROJECT_STATUS:MILESTONE_NAME:MILESTONE_STATUS:MAJOR:MILESTONE_OWNER:MILESTONE_START_DATE:ORIGINAL_DUE_DATE:MILESTONE_DATE:ORIGINAL_DUE_DELTA:COMPLETION_DATE:ACTUAL_COMPLETION_DATE:DAY_DELTA:CHANGE_HISTORY:PERCENT_COMPLETE:PAST_DUE_YN:'
,p_break_on=>'PROJECT:PROJECT_STATUS:0:0:0:0'
,p_break_enabled_on=>'PROJECT:PROJECT_STATUS:0:0:0:0'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19058730526335337552)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19272913625379975536)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp.component_end;
end;
/
