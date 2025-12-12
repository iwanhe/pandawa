prompt --application/pages/page_00216
begin
--   Manifest
--     PAGE: 00216
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
 p_id=>216
,p_name=>'Action Items Analysis Report'
,p_step_title=>'Action Items Analysis Report'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486291560075385)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>unistr('This interactive report shows all project action items with a control-break on project and status. Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions \00BF</strong> button to define the number of rows displ')
||'ayed per page, filter, format, download, and/or save the interactive report.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19058730659107337553)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19288800552154946419)
,p_plug_name=>'Action Item Date Forecasting Analysis'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'    project_id,',
'    (   select project',
'        from eba_proj_status x',
'        where x.id = a.project_id ) project, ',
'    action,',
'    (select project_status from eba_proj_status where id = a.project_id) project_status,',
'    nvl(type_id, -1) as type,',
'    --',
'    (select listagg(to_char(to_date(substr(new_value,1,11),''DD-MON-YYYY''),''fmDD-MON-YYYY'')||'' ''||',
'        eba_proj_fw.get_name_from_email_address(changed_by),'', '')  within group (order by change_date)',
'     from eba_proj_history',
'     where table_name = ''STATUS_AIS''',
'       and column_name = ''DUE_DATE''',
'       and component_id = a.id)',
'    change_history,',
'    case when action_status = ''Closed'' then',
'        (select nvl( max(change_date), a.due_date ) from EBA_PROJ_HISTORY where table_name = ''STATUS_AI'' and new_value = ''Closed'' and component_id = a.id)',
'    else',
'        null',
'    end as actual_completion_date,',
'    case when action_status = ''Closed'' then',
'        completed_date',
'    else',
'        null',
'    end as completion_date,',
'    case when milestone_id is not null then',
'        (select milestone_start_date from eba_proj_status_ms where id = a.milestone_id)',
'    else',
'        a.created',
'    end as start_date,',
'    due_date,',
'    case when milestone_id is not null then',
'        (select milestone_name from eba_proj_status_ms where id = milestone_id)',
'    else',
'        null',
'    end as milestone,',
'    case when milestone_id is not null then',
'        (select milestone_owner from eba_proj_status_ms where id = milestone_id)',
'    else',
'        null',
'    end as milestone_owner,',
'    nvl(original_due_date, due_date) as original_due_date,',
'    nvl(trunc(original_due_date), trunc(due_date)) - trunc(completed_date) as original_day_delta,',
'    nvl(trunc(original_due_date), trunc(due_date)) - trunc(due_date) as original_due_delta,',
'    trunc(due_date) - trunc(completed_date) as day_delta,',
'    case',
'        when a.action_status != ''Closed'' and a.due_date < current_timestamp then',
'            ''Y''',
'        else',
'            ''N''',
'    end past_due_yn,',
'    action_status,',
'    case when owner_role_id is null then',
'        eba_proj_fw.get_name_from_email_address(a.action_owner_01)',
'        || decode(a.action_owner_02,null,null,'', ''|| eba_proj_fw.get_name_from_email_address(a.action_owner_02))',
'        || decode(a.action_owner_03,null,null,'', ''|| eba_proj_fw.get_name_from_email_address(a.action_owner_03))',
'        || decode(a.action_owner_04,null,null,'', ''|| eba_proj_fw.get_name_from_email_address(a.action_owner_04))',
'    else',
'        nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '')',
'                within group (order by lower(u.username)) owner',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.role_id = a.owner_role_id',
'                and rf.project_id = a.project_id',
'                and u.id = rf.user_id',
'                and r.id = rf.role_id',
'            group by r.name',
'        ), (select ''No ''||r.name||'' defined''',
'            from eba_proj_roles r',
'            where r.id = a.owner_role_id)',
'        )',
'    end as action_owner',
'from eba_proj_status_ais a'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(19288800647430946419)
,p_name=>'Action Item Date Forecasting Analysis'
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
,p_internal_uid=>18169081732009964206
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19288801109762946430)
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
 p_id=>wwv_flow_imp.id(19288801513913946432)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Project Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19288801885501946432)
,p_db_column_name=>'PROJECT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19058730822659337555)
,p_db_column_name=>'MILESTONE'
,p_display_order=>13
,p_column_identifier=>'L'
,p_column_label=>'Milestone'
,p_column_link=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:RP,107:P107_ID,P107_PROJECT_ID:#ID#,#PROJECT_ID#'
,p_column_linktext=>'#MILESTONE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19058730920675337556)
,p_db_column_name=>'MILESTONE_OWNER'
,p_display_order=>23
,p_column_identifier=>'M'
,p_column_label=>'Milestone Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19288802227516946433)
,p_db_column_name=>'ACTION'
,p_display_order=>33
,p_column_identifier=>'D'
,p_column_label=>'Action Item'
,p_column_link=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:RP,78:P78_ACTION_ITEM_ID,P78_PROJECT_ID:#ID#,#PROJECT_ID#'
,p_column_linktext=>'#ACTION#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19288803897322946435)
,p_db_column_name=>'ORIGINAL_DUE_DATE'
,p_display_order=>43
,p_column_identifier=>'H'
,p_column_label=>'Original Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#ORIGINAL_DUE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19288803500068946434)
,p_db_column_name=>'DUE_DATE'
,p_display_order=>53
,p_column_identifier=>'G'
,p_column_label=>'Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#DUE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19288803105707946434)
,p_db_column_name=>'COMPLETION_DATE'
,p_display_order=>63
,p_column_identifier=>'F'
,p_column_label=>'Completion Date'
,p_column_html_expression=>'<span style="white-space: pre;">#COMPLETION_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19288804279604946435)
,p_db_column_name=>'DAY_DELTA'
,p_display_order=>73
,p_column_identifier=>'I'
,p_column_label=>'Due to Completion Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19288802616192946433)
,p_db_column_name=>'CHANGE_HISTORY'
,p_display_order=>83
,p_column_identifier=>'E'
,p_column_label=>'Change History'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19288804689981946436)
,p_db_column_name=>'ACTION_STATUS'
,p_display_order=>93
,p_column_identifier=>'J'
,p_column_label=>'Action Item Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19288805113020946436)
,p_db_column_name=>'ACTION_OWNER'
,p_display_order=>103
,p_column_identifier=>'K'
,p_column_label=>'Action Item Owner(s)'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19204381505470214122)
,p_db_column_name=>'ACTUAL_COMPLETION_DATE'
,p_display_order=>113
,p_column_identifier=>'N'
,p_column_label=>'Marked as Closed On'
,p_column_html_expression=>'<span style="white-space: pre;">#ACTUAL_COMPLETION_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19204383548035214143)
,p_db_column_name=>'ORIGINAL_DAY_DELTA'
,p_display_order=>123
,p_column_identifier=>'O'
,p_column_label=>'Original Due to Completion Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741813675610499835)
,p_db_column_name=>'TYPE'
,p_display_order=>143
,p_column_identifier=>'S'
,p_column_label=>'Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(18916316741608990911)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741813771986499836)
,p_db_column_name=>'START_DATE'
,p_display_order=>153
,p_column_identifier=>'T'
,p_column_label=>'Start Date'
,p_column_html_expression=>'<span style="white-space: pre;">#START_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741813861699499837)
,p_db_column_name=>'ORIGINAL_DUE_DELTA'
,p_display_order=>163
,p_column_identifier=>'U'
,p_column_label=>'Original Due to Due Date Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741813980838499838)
,p_db_column_name=>'PAST_DUE_YN'
,p_display_order=>173
,p_column_identifier=>'V'
,p_column_label=>'Past Due'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(8910494933283350717)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20124881790152729623)
,p_db_column_name=>'PROJECT_STATUS'
,p_display_order=>183
,p_column_identifier=>'W'
,p_column_label=>'Project Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(8916964241877251201)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19288837238103947974)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'181691184'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>1000
,p_report_columns=>'PROJECT:PROJECT_STATUS:MILESTONE:ACTION:ACTION_STATUS:TYPE:ACTION_OWNER:START_DATE:ORIGINAL_DUE_DATE:DUE_DATE:ORIGINAL_DUE_DELTA:COMPLETION_DATE:ACTUAL_COMPLETION_DATE:DAY_DELTA:CHANGE_HISTORY:PAST_DUE_YN:'
,p_break_on=>'PROJECT:PROJECT_STATUS:0:0:0:0'
,p_break_enabled_on=>'PROJECT:PROJECT_STATUS:0:0:0:0'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19058730805957337554)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19288800552154946419)
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
