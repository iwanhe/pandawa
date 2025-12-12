prompt --application/pages/page_00063
begin
--   Manifest
--     PAGE: 00063
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
 p_id=>63
,p_name=>'Milestones Interactive Report'
,p_step_title=>'Milestones Interactive Report'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486601256078156)
,p_javascript_code_onload=>'$(''div[aria-describedby="msIRR_dialog_js"] > select#msIRR_shuttle_right > option[value="PROJECT"]'').remove();'
,p_step_template=>wwv_flow_imp.id(6672316913709369812)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'<p>Click the <strong>Actions</strong> menu button to control which columns you see and the order in which you see them.  You can name and save your favorite report views by clicking <strong>Actions</strong> then <strong>Save Report</strong>.  Click c'
||'olumn headings to filter, sort and control break.  You can also select <strong>Download</strong> under the <strong>Actions</strong> menu.</p>'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8958190729218777342)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8958191124431777344)
,p_plug_name=>'Milestones'
,p_region_name=>'msIRR'
,p_region_css_classes=>'flex_milestones'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'    case when eba_proj_fw.is_edit_authorized( p_username   => upper(:APP_USER), p_project_id => m.project_id ) = ''Y'' then',
'        ''<a href="'' || apex_util.prepare_url(''f?p='' || :APP_ID || '':48:'' || :APP_SESSION || '':::48:P48_ID,P48_PROJECT_ID:'' || m.id || '','' || m.project_id || '':'') || ''"><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pe'
||'ncil" alt="Edit Milestone"></a>''',
'    else',
'        null',
'    end as edit_link,',
'    row_key,',
'    (   select y.project',
'        from eba_proj_status x,',
'            eba_proj_status y',
'        where x.id = m.project_id',
'            and x.parent_project_id = y.id) parent_project,',
'    project_id,',
'    (   select project',
'        from eba_proj_status x',
'        where x.id = m.project_id ) project,',
'    milestone_name,',
'    milestone_name milestone_name_nolink,',
'    milestone_description,',
'    milestone_date,',
'    tags,',
'    milestone_start_date,',
'    case when m.milestone_status = ''Completed'' then',
'        nvl(completed_date, milestone_date)',
'    else',
'        null',
'    end as completed_date,',
'    nvl(original_due_date, milestone_date) as original_due_date,',
'    decode(eba_proj_stat_ui.is_project_open(m.project_id), 0, ''Closed'', 1, ''Open'') as open_closed,',
'    case when milestone_date = nvl(original_due_date, milestone_date) then ''No'' else ''Yes'' end as due_date_changed,',
'    (   select status_short_desc',
'        from eba_proj_status_codes',
'        where id = (select project_status',
'                    from eba_proj_status',
'                    where id = m.project_id)) as status_level,',
'    (   select category',
'        from eba_proj_status_cats',
'        where id = (select cat_id',
'                    from eba_proj_status',
'                    where id = m.project_id)) as category,',
'    milestone_status,',
'    decode(nvl(is_major_yn,''N''),''N'',''No'',''Yes'') major,',
'    created,',
'    created_by,',
'    updated,',
'    updated_by,',
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
'    nvl(trunc(original_due_date), trunc(milestone_date)) - trunc(completed_date) as original_day_delta,',
'    nvl(trunc(original_due_date), trunc(milestone_date)) - trunc(milestone_date) as original_due_delta,',
'    trunc(milestone_date) - trunc(nvl(completed_date, milestone_date)) as day_delta,',
'    (select listagg(to_char(to_date(substr(new_value,1,11),''DD-MON-YYYY''),''fmDD-MON-YYYY'')||'' ''||',
'        eba_proj_fw.get_name_from_email_address(changed_by),'', '')  within group (order by change_date)',
'     from eba_proj_history',
'     where table_name = ''STATUS_MS''',
'       and column_name = ''MILESTONE_DATE''',
'       and component_id = m.id) as change_history,',
'    (   select code_name',
'        from eba_proj_status x',
'        where x.id = m.project_id ) project_code_name,',
'    (   select deal_type_id',
'        from eba_proj_status x',
'        where x.id = m.project_id ) deal_type,',
'    case when milestone_status = ''Completed'' then',
'        (select nvl(max(change_date), m.milestone_date) from eba_proj_history where table_name = ''STATUS_MS'' and new_value = ''Completed'' and component_id = m.id)',
'    else',
'        null',
'    end as actual_completion_date,',
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
'    end as milestone_owner,',
'    decode(eba_proj_stat_ui.is_project_open(m.project_id), 0, ''Closed'', 1, ''Open'') as project_open,',
'    milestone_flex_01,',
'    milestone_flex_02,',
'    milestone_flex_03,',
'    milestone_flex_04,',
'    milestone_flex_05,',
'    milestone_flex_06,',
'    milestone_flex_07,',
'    milestone_flex_08,',
'    milestone_flex_n01,',
'    milestone_flex_n02,',
'    milestone_flex_n03,',
'    milestone_flex_n04,',
'    milestone_flex_d01,',
'    milestone_flex_d02,',
'    milestone_flex_d03,',
'    milestone_flex_d04,',
'    milestone_flex_clob',
'from eba_proj_status_ms m'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(8958191226476777344)
,p_name=>'Milestones'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No Milestones found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>3761964544217160586
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13908316666091113236)
,p_db_column_name=>'EDIT_LINK'
,p_display_order=>10
,p_column_identifier=>'AN'
,p_column_label=>'<span class="u-VisuallyHidden">Edit</span>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'FUNCTION_BODY'
,p_display_condition=>'return NVL(:REQUEST,''EMPTY'') NOT IN(''CSV'',''XLS'',''PDF'',''XML'',''RTF'',''HTMLD'');'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958191442232777345)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958191636773777346)
,p_db_column_name=>'ROW_KEY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Row Key'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958191742458777346)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Selected Project'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958191839329777347)
,p_db_column_name=>'PROJECT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958191934783777347)
,p_db_column_name=>'MILESTONE_NAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Milestone'
,p_column_link=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:107:P107_ID,P107_PROJECT_ID,P200_ID:#ID#,#PROJECT_ID#,#PROJECT_ID#'
,p_column_linktext=>'#MILESTONE_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7029633998159833280)
,p_db_column_name=>'MILESTONE_NAME_NOLINK'
,p_display_order=>70
,p_column_identifier=>'Q'
,p_column_label=>'Milestone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_security_scheme=>'!'||wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958192046513777347)
,p_db_column_name=>'MILESTONE_DESCRIPTION'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958192218539777351)
,p_db_column_name=>'MILESTONE_STATUS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Milestone Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958192431582777352)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958192623948777357)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>110
,p_column_identifier=>'M'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8029988932997507459)
,p_db_column_name=>'MILESTONE_OWNER'
,p_display_order=>120
,p_column_identifier=>'N'
,p_column_label=>'Milestone Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8030256039068411928)
,p_db_column_name=>'MAJOR'
,p_display_order=>130
,p_column_identifier=>'O'
,p_column_label=>'Major'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8040828134271088223)
,p_db_column_name=>'PARENT_PROJECT'
,p_display_order=>140
,p_column_identifier=>'P'
,p_column_label=>'Parent Project'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Allow Parent Projects''',
'   and build_option_status = ''Include'''))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7863079384621977601)
,p_db_column_name=>'STATUS_LEVEL'
,p_display_order=>150
,p_column_identifier=>'R'
,p_column_label=>'Project Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7863083896667075748)
,p_db_column_name=>'CATEGORY'
,p_display_order=>160
,p_column_identifier=>'S'
,p_column_label=>'&CAT_TITLE.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155099893885584346)
,p_db_column_name=>'MILESTONE_DATE'
,p_display_order=>170
,p_column_identifier=>'T'
,p_column_label=>'Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#MILESTONE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17849133522514449234)
,p_db_column_name=>'ORIGINAL_DUE_DATE'
,p_display_order=>180
,p_column_identifier=>'AO'
,p_column_label=>'Original Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#ORIGINAL_DUE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17849133686324449235)
,p_db_column_name=>'DUE_DATE_CHANGED'
,p_display_order=>190
,p_column_identifier=>'AP'
,p_column_label=>'Due Date Changed'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155100005821584353)
,p_db_column_name=>'CREATED'
,p_display_order=>200
,p_column_identifier=>'U'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'Since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155100098048584353)
,p_db_column_name=>'UPDATED'
,p_display_order=>210
,p_column_identifier=>'V'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'Since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155100200212584353)
,p_db_column_name=>'MILESTONE_FLEX_01'
,p_display_order=>220
,p_column_identifier=>'W'
,p_column_label=>'MILESTONE_FLEX_01'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155100290341584353)
,p_db_column_name=>'MILESTONE_FLEX_02'
,p_display_order=>230
,p_column_identifier=>'X'
,p_column_label=>'MILESTONE_FLEX_02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155100391144584353)
,p_db_column_name=>'MILESTONE_FLEX_03'
,p_display_order=>240
,p_column_identifier=>'Y'
,p_column_label=>'MILESTONE_FLEX_03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155100495272584353)
,p_db_column_name=>'MILESTONE_FLEX_04'
,p_display_order=>250
,p_column_identifier=>'Z'
,p_column_label=>'MILESTONE_FLEX_04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155100585460584354)
,p_db_column_name=>'MILESTONE_FLEX_05'
,p_display_order=>260
,p_column_identifier=>'AA'
,p_column_label=>'MILESTONE_FLEX_05'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_05'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155100684224584354)
,p_db_column_name=>'MILESTONE_FLEX_06'
,p_display_order=>270
,p_column_identifier=>'AB'
,p_column_label=>'MILESTONE_FLEX_06'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_06'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155100782891584354)
,p_db_column_name=>'MILESTONE_FLEX_07'
,p_display_order=>280
,p_column_identifier=>'AC'
,p_column_label=>'MILESTONE_FLEX_07'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_07'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155100911398584354)
,p_db_column_name=>'MILESTONE_FLEX_08'
,p_display_order=>290
,p_column_identifier=>'AD'
,p_column_label=>'MILESTONE_FLEX_08'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_08'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155101010140584354)
,p_db_column_name=>'MILESTONE_FLEX_N01'
,p_display_order=>300
,p_column_identifier=>'AE'
,p_column_label=>'Estimated Cost (in Man Hours)'
,p_column_type=>'NUMBER'
,p_format_mask=>'999G999G999G999G999G999G999'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_N01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155101082261584354)
,p_db_column_name=>'MILESTONE_FLEX_N02'
,p_display_order=>310
,p_column_identifier=>'AF'
,p_column_label=>'MILESTONE_FLEX_N02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_N02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155101183937584355)
,p_db_column_name=>'MILESTONE_FLEX_N03'
,p_display_order=>320
,p_column_identifier=>'AG'
,p_column_label=>'MILESTONE_FLEX_N03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_N03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155101294307584355)
,p_db_column_name=>'MILESTONE_FLEX_N04'
,p_display_order=>330
,p_column_identifier=>'AH'
,p_column_label=>'MILESTONE_FLEX_N04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_N04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155101382618584355)
,p_db_column_name=>'MILESTONE_FLEX_D01'
,p_display_order=>340
,p_column_identifier=>'AI'
,p_column_label=>'MILESTONE_FLEX_D01'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_D01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155101490177584355)
,p_db_column_name=>'MILESTONE_FLEX_D02'
,p_display_order=>350
,p_column_identifier=>'AJ'
,p_column_label=>'MILESTONE_FLEX_D02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_D02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155101600612584355)
,p_db_column_name=>'MILESTONE_FLEX_D03'
,p_display_order=>360
,p_column_identifier=>'AK'
,p_column_label=>'MILESTONE_FLEX_D03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_D03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155101699972584355)
,p_db_column_name=>'MILESTONE_FLEX_D04'
,p_display_order=>370
,p_column_identifier=>'AL'
,p_column_label=>'MILESTONE_FLEX_D04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_D04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155101798484584355)
,p_db_column_name=>'MILESTONE_FLEX_CLOB'
,p_display_order=>380
,p_column_identifier=>'AM'
,p_column_label=>'MILESTONE_FLEX_CLOB'
,p_display_in_default_rpt=>'N'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_CLOB'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18808041316984757056)
,p_db_column_name=>'PROJECT_OPEN'
,p_display_order=>390
,p_column_identifier=>'AQ'
,p_column_label=>'Project Open Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19204381625476214124)
,p_db_column_name=>'MILESTONE_START_DATE'
,p_display_order=>400
,p_column_identifier=>'AR'
,p_column_label=>'Start Date'
,p_column_html_expression=>'<span style="white-space: pre;">#MILESTONE_START_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19204383010645214137)
,p_db_column_name=>'COMPLETED_DATE'
,p_display_order=>410
,p_column_identifier=>'AS'
,p_column_label=>'Completion Date'
,p_column_html_expression=>'<span style="white-space: pre;">#COMPLETED_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741813076315499829)
,p_db_column_name=>'PERCENT_COMPLETE'
,p_display_order=>420
,p_column_identifier=>'AT'
,p_column_label=>'Percent Complete'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741813116912499830)
,p_db_column_name=>'PAST_DUE_YN'
,p_display_order=>430
,p_column_identifier=>'AU'
,p_column_label=>'Past Due'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(8910494933283350717)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741813256171499831)
,p_db_column_name=>'DAY_DELTA'
,p_display_order=>440
,p_column_identifier=>'AV'
,p_column_label=>'Due Date to Completion Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741815244964499851)
,p_db_column_name=>'ORIGINAL_DAY_DELTA'
,p_display_order=>450
,p_column_identifier=>'AW'
,p_column_label=>'Original Due to Completion Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741815386096499852)
,p_db_column_name=>'ORIGINAL_DUE_DELTA'
,p_display_order=>460
,p_column_identifier=>'AX'
,p_column_label=>'Original Due to Due Date Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741815451076499853)
,p_db_column_name=>'CHANGE_HISTORY'
,p_display_order=>470
,p_column_identifier=>'AY'
,p_column_label=>'Change History'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741815527644499854)
,p_db_column_name=>'PROJECT_CODE_NAME'
,p_display_order=>480
,p_column_identifier=>'AZ'
,p_column_label=>'Project Code Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Code Names''',
'   and build_option_status = ''Include'''))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741815629752499855)
,p_db_column_name=>'DEAL_TYPE'
,p_display_order=>490
,p_column_identifier=>'BA'
,p_column_label=>'Deal Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(19158512130599850300)
,p_rpt_show_filter_lov=>'1'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_proj_status',
' where deal_type_id is not null',
'   and exists (select null ',
'                 from eba_proj_deal_types',
'                where is_active_yn = ''Y'')',
'   and exists (select null',
'                 from apex_application_build_options',
'                where application_id = :APP_ID',
'                  and build_option_name = ''Project Deal Types''',
'                  and build_option_status = ''Include'')'))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741815745026499856)
,p_db_column_name=>'ACTUAL_COMPLETION_DATE'
,p_display_order=>500
,p_column_identifier=>'BB'
,p_column_label=>'Marked as Completed On'
,p_column_html_expression=>'<span style="white-space: pre;">#ACTUAL_COMPLETION_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20124882954767729635)
,p_db_column_name=>'OPEN_CLOSED'
,p_display_order=>510
,p_column_identifier=>'BC'
,p_column_label=>'Project Open Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(711447058578939477)
,p_db_column_name=>'TAGS'
,p_display_order=>520
,p_column_identifier=>'BD'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8958192735458777704)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'9340510'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'PROJECT:EDIT_LINK:MILESTONE_NAME:MILESTONE_STATUS:MAJOR:MILESTONE_DATE:COMPLETED_DATE:DAY_DELTA:PAST_DUE_YN:PERCENT_COMPLETE:MILESTONE_OWNER:'
,p_sort_column_1=>'MILESTONE_DATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CREATED'
,p_sort_direction_2=>'DESC'
,p_break_on=>'PROJECT:0:0:0:0:0'
,p_break_enabled_on=>'PROJECT:0:0:0:0:0'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(736235120778546746)
,p_report_id=>wwv_flow_imp.id(8958192735458777704)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'PROJECT_OPEN'
,p_operator=>'='
,p_expr=>'Open'
,p_condition_sql=>'"PROJECT_OPEN" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Open''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(18932045843759975533)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Open Projects'
,p_report_seq=>10
,p_report_alias=>'178123270'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'EDIT_LINK:MILESTONE_NAME:PROJECT:PROJECT_OPEN:ORIGINAL_DUE_DATE:MILESTONE_DATE:DUE_DATE_CHANGED:MILESTONE_OWNER:MILESTONE_STATUS:MAJOR:STATUS_LEVEL:CATEGORY:UPDATED::PERCENT_COMPLETE:PAST_DUE_YN:DAY_DELTA:ORIGINAL_DAY_DELTA:ORIGINAL_DUE_DELTA:CHANGE_'
||'HISTORY:PROJECT_CODE_NAME:DEAL_TYPE:ACTUAL_COMPLETION_DATE:OPEN_CLOSED'
,p_sort_column_1=>'MILESTONE_DATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CREATED'
,p_sort_direction_2=>'DESC'
,p_break_on=>'PROJECT:0:0:0:0:0'
,p_break_enabled_on=>'PROJECT:0:0:0:0:0'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(19591262018433716110)
,p_report_id=>wwv_flow_imp.id(18932045843759975533)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'MILESTONE_STATUS'
,p_operator=>'='
,p_expr=>'Open'
,p_condition_sql=>'"MILESTONE_STATUS" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Open''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(19591262512066716111)
,p_report_id=>wwv_flow_imp.id(18932045843759975533)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'PROJECT_OPEN'
,p_operator=>'='
,p_expr=>'Open'
,p_condition_sql=>'"PROJECT_OPEN" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Open''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7864211913036718200)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CREATE_MILESTONE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Milestone'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:48::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-chevron-right'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8030256223962417086)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8958191124431777344)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:RP,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(8040828329554096283)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(13084278418030234154)
,p_computation_sequence=>20
,p_computation_item=>'PROJECT_CAME_FROM'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13305560196374764863)
,p_name=>'Refresh IRR on Add'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7864211913036718200)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13589414303532266014)
,p_event_id=>wwv_flow_imp.id(13305560196374764863)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8958191124431777344)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13908316769006113237)
,p_name=>'Refresh IRR on Edit'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8958191124431777344)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13908316851768113238)
,p_event_id=>wwv_flow_imp.id(13908316769006113237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8958191124431777344)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(16994329024475217351)
,p_name=>'Remove Project Column'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'button#msIRR_actions_menu_0i'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16994329150821217352)
,p_event_id=>wwv_flow_imp.id(16994329024475217351)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alert($(''select#msIRR_shuttle_right > option[value="PROJECT"]'').html());',
'$(''select#msIRR_shuttle_right > option[value="PROJECT"]'').remove();'))
);
wwv_flow_imp.component_end;
end;
/
