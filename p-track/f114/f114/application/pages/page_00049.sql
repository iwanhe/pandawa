prompt --application/pages/page_00049
begin
--   Manifest
--     PAGE: 00049
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
 p_id=>49
,p_name=>'Action Items Interactive Report'
,p_step_title=>'Action Items Interactive Report'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486291560075385)
,p_step_template=>wwv_flow_imp.id(6672316913709369812)
,p_help_text=>'<p>Use this Interactive Report view to sort and filter the action items.  Click the <strong>Actions</strong> menu button to control which columns you see and the order in which you see them.  You can name and save your favorite report views by clicki'
||'ng <strong>Actions</strong> then <strong>Save Report</strong>.  Click column headings to filter, sort and control break.  You can also select <strong>Download</strong> under the <strong>Actions</strong> menu.</p>'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8958187027670733275)
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
 p_id=>wwv_flow_imp.id(8958187417967733276)
,p_plug_name=>'Action Items'
,p_region_css_classes=>'flex_actions'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>200
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    case when eba_proj_fw.is_edit_authorized( p_username   => upper(:APP_USER), p_project_id => a.project_id ) = ''Y'' then',
'        ''<a href="'' || apex_util.prepare_url(''f?p='' || :APP_ID || '':73:'' || :APP_SESSION || '':::73:P73_ID,P73_PROJECT_ID:'' || a.id || '','' || a.project_id || '':'') || ''" class="AIEditLink"><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" '
||'class="apex-edit-pencil" alt="Edit Action Item"></a>''',
'    else',
'        null',
'    end as edit_link,',
'    case when a.milestone_id is not null then',
'        (select milestone_name from eba_proj_status_ms where id = a.milestone_id)',
'    else',
'        null',
'    end as milestone,',
'    case when a.link_url is not null and a.link_text is not null and exists (select null',
'                 from apex_application_build_options',
'                where application_id = :APP_ID',
'                  and build_option_name = ''Action Item Links''',
'                  and build_option_status = ''Include'') then',
'        ''<small><a href="'' || apex_escape.html(a.link_url) || ''" target="_blank">''',
'            || apex_escape.html(a.link_text) || ''</a></small>''',
'    end as link_text,',
'    dbms_lob.substr(action,200) action,',
'    id,',
'    milestone_id,',
'    tags,',
'    nvl(type_id,-1) as ai_type,',
'    due_date,',
'    completed_date,',
'    resolution,',
'    nvl(original_due_date, due_date) as original_due_date,',
'    case when due_date = nvl(original_due_date, due_date) then ''No'' else ''Yes'' end as due_date_changed,',
'    (   select y.project',
'        from eba_proj_status x,',
'            eba_proj_status y',
'        where x.id = a.project_id',
'            and x.parent_project_id = y.id) parent_project, ',
'    (   select project',
'        from eba_proj_status x',
'        where x.id = a.project_id ) project,',
'    (   select code_name',
'        from eba_proj_status x',
'        where x.id = a.project_id ) project_code_name,',
'    (   select deal_type_id',
'        from eba_proj_status x',
'        where x.id = a.project_id ) deal_type,',
'    case when a.milestone_id is not null then',
'        (select milestone_start_date from eba_proj_status_ms where id = a.milestone_id)',
'    else',
'        a.created',
'    end as start_date,',
'    case when a.milestone_id is not null then',
'        (select eba_proj_fw.get_name_from_email_address(milestone_owner) from eba_proj_status_ms where id = a.milestone_id and owner_role_id is null)',
'    else',
'        nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '')',
'                within group (order by lower(u.username)) owner',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r,',
'                eba_proj_status_ms m',
'            where m.id = a.milestone_id',
'              and m.owner_role_id is not null',
'              and rf.role_id = m.owner_role_id',
'              and rf.project_id = a.project_id',
'              and u.id = rf.user_id',
'              and r.id = rf.role_id',
'            group by r.name',
'        ), (select ''No ''||r.name||'' defined''',
'            from eba_proj_roles r,',
'                 eba_proj_status_ms ms',
'            where ms.id = a.milestone_id',
'              and r.id = ms.owner_role_id)',
'        )',
'    end as milestone_owner,',
'    decode(eba_proj_stat_ui.is_project_open(a.project_id), 0, ''Closed'', 1, ''Open'') as open_closed,',
'    (select listagg(to_char(to_date(substr(new_value,1,11),''DD-MON-YYYY''),''fmDD-MON-YYYY'')||'' ''||',
'        eba_proj_fw.get_name_from_email_address(changed_by),'', '')  within group (order by change_date)',
'     from eba_proj_history',
'     where table_name = ''STATUS_AIS''',
'       and column_name = ''DUE_DATE''',
'       and component_id = a.id) as change_history,',
'    case when a.milestone_id is not null then',
'        (select milestone_status from eba_proj_status_ms where id = a.milestone_id)',
'    else',
'        null',
'    end as milestone_status,',
'    case when action_status = ''Closed'' then',
'        (select nvl( max(change_date), a.due_date ) from eba_proj_history where table_name = ''STATUS_AI'' and new_value = ''Closed'' and component_id = a.id)',
'    else',
'        null',
'    end as actual_completion_date,',
'    project_id,',
'    nvl(trunc(original_due_date), trunc(due_date)) - trunc(completed_date) as original_day_delta,',
'    nvl(trunc(original_due_date), trunc(due_date)) - trunc(due_date) as original_due_delta,',
'    trunc(due_date) - trunc(completed_date) as day_delta,',
'    (select project_status from eba_proj_status where id = a.project_id) project_status,',
'    (   select category',
'        from eba_proj_status_cats',
'        where id = (select cat_id',
'                    from eba_proj_status',
'                    where id = a.project_id) ) as category,',
'    action_status,',
'    decode(action_status,''Open'',decode(greatest(due_date,systimestamp),due_date,''No'',''Yes''),''No'') past_due,',
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
'    end as owner,',
'    created,',
'    created_by,',
'    updated as updated_hidden,',
'    updated,',
'    updated_by,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_01'',a.action_flex_01) action_flex_01,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_02'',a.action_flex_02) action_flex_02,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_03'',a.action_flex_03) action_flex_03,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_04'',a.action_flex_04) action_flex_04,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_05'',a.action_flex_05) action_flex_05,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_06'',a.action_flex_06) action_flex_06,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_07'',a.action_flex_07) action_flex_07,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_08'',a.action_flex_08) action_flex_08,',
'    eba_proj_flex_fw.fetch_n(''ACTION_FLEX_N01'',a.action_flex_n01) action_flex_n01,',
'    eba_proj_flex_fw.fetch_n(''ACTION_FLEX_N02'',a.action_flex_n02) action_flex_n02,',
'    eba_proj_flex_fw.fetch_n(''ACTION_FLEX_N03'',a.action_flex_n03) action_flex_n03,',
'    eba_proj_flex_fw.fetch_n(''ACTION_FLEX_N04'',a.action_flex_n04) action_flex_n04,',
'    action_flex_d01,',
'    action_flex_d02,',
'    action_flex_d03,',
'    action_flex_d04,',
'    action_flex_clob',
'from eba_proj_status_ais a'))
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
 p_id=>wwv_flow_imp.id(8958187529349733276)
,p_name=>'Action Items'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No Action Items found.'
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
,p_internal_uid=>3761960847090116518
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13908316043536113230)
,p_db_column_name=>'EDIT_LINK'
,p_display_order=>10
,p_column_identifier=>'AV'
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
,p_display_condition=>'return NVL(:REQUEST,''EMPTY'') NOT IN (''CSV'',''XLS'',''PDF'',''XML'',''RTF'',''HTMLD'');'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958187741750733284)
,p_db_column_name=>'ACTION'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Action Item'
,p_column_link=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:78,200:P78_ACTION_ITEM_ID,P200_ID:#ID#,#PROJECT_ID#'
,p_column_linktext=>'#ACTION#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958187833943733286)
,p_db_column_name=>'ID'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958188040631733287)
,p_db_column_name=>'PROJECT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:200:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958188130175733287)
,p_db_column_name=>'ACTION_STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Action Item Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958188242949733287)
,p_db_column_name=>'OWNER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Action Item Owner(s)'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958188446977733289)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8958188617361733290)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8040827041020052330)
,p_db_column_name=>'PARENT_PROJECT'
,p_display_order=>90
,p_column_identifier=>'K'
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
 p_id=>wwv_flow_imp.id(8040827534356069332)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>'Selected Project'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7863096709405574187)
,p_db_column_name=>'CATEGORY'
,p_display_order=>120
,p_column_identifier=>'N'
,p_column_label=>'&CAT_TITLE.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155102711328606625)
,p_db_column_name=>'DUE_DATE'
,p_display_order=>130
,p_column_identifier=>'O'
,p_column_label=>'Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#DUE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17849133729974449236)
,p_db_column_name=>'ORIGINAL_DUE_DATE'
,p_display_order=>140
,p_column_identifier=>'AW'
,p_column_label=>'Original Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#ORIGINAL_DUE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17849133902362449237)
,p_db_column_name=>'DUE_DATE_CHANGED'
,p_display_order=>150
,p_column_identifier=>'AX'
,p_column_label=>'Due Date Changed'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155102800956606626)
,p_db_column_name=>'CREATED'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'Since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155102887642606626)
,p_db_column_name=>'UPDATED'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'Since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155104201419606629)
,p_db_column_name=>'ACTION_FLEX_D01'
,p_display_order=>180
,p_column_identifier=>'AD'
,p_column_label=>'ACTION_FLEX_D01'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_D01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155104290626606629)
,p_db_column_name=>'ACTION_FLEX_D02'
,p_display_order=>190
,p_column_identifier=>'AE'
,p_column_label=>'ACTION_FLEX_D02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_D02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155104401377606630)
,p_db_column_name=>'ACTION_FLEX_D03'
,p_display_order=>200
,p_column_identifier=>'AF'
,p_column_label=>'ACTION_FLEX_D03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_D03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155104486367606630)
,p_db_column_name=>'ACTION_FLEX_D04'
,p_display_order=>210
,p_column_identifier=>'AG'
,p_column_label=>'ACTION_FLEX_D04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_D04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6155104601858606630)
,p_db_column_name=>'ACTION_FLEX_CLOB'
,p_display_order=>220
,p_column_identifier=>'AH'
,p_column_label=>'ACTION_FLEX_CLOB'
,p_display_in_default_rpt=>'N'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_CLOB'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5282041235513171761)
,p_db_column_name=>'ACTION_FLEX_01'
,p_display_order=>230
,p_column_identifier=>'AI'
,p_column_label=>'ACTION_FLEX_01'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5282041332093171762)
,p_db_column_name=>'ACTION_FLEX_02'
,p_display_order=>240
,p_column_identifier=>'AJ'
,p_column_label=>'ACTION_FLEX_02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5282041429086171763)
,p_db_column_name=>'ACTION_FLEX_03'
,p_display_order=>250
,p_column_identifier=>'AK'
,p_column_label=>'ACTION_FLEX_03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5282041565247171764)
,p_db_column_name=>'ACTION_FLEX_04'
,p_display_order=>260
,p_column_identifier=>'AL'
,p_column_label=>'ACTION_FLEX_04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5282041663280171765)
,p_db_column_name=>'ACTION_FLEX_05'
,p_display_order=>270
,p_column_identifier=>'AM'
,p_column_label=>'ACTION_FLEX_05'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_05'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5282041736139171766)
,p_db_column_name=>'ACTION_FLEX_06'
,p_display_order=>280
,p_column_identifier=>'AN'
,p_column_label=>'ACTION_FLEX_06'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_06'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5282041854916171767)
,p_db_column_name=>'ACTION_FLEX_07'
,p_display_order=>290
,p_column_identifier=>'AO'
,p_column_label=>'ACTION_FLEX_07'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_07'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5282041925431171768)
,p_db_column_name=>'ACTION_FLEX_08'
,p_display_order=>300
,p_column_identifier=>'AP'
,p_column_label=>'ACTION_FLEX_08'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_08'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5282042079575171769)
,p_db_column_name=>'ACTION_FLEX_N01'
,p_display_order=>310
,p_column_identifier=>'AQ'
,p_column_label=>'Estimated Cost (in Man Hours)'
,p_column_type=>'STRING'
,p_format_mask=>'999G999G999G999G999G999G999'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_N01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5282042154791171770)
,p_db_column_name=>'ACTION_FLEX_N02'
,p_display_order=>320
,p_column_identifier=>'AR'
,p_column_label=>'ACTION_FLEX_N02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_N02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5282042236754171771)
,p_db_column_name=>'ACTION_FLEX_N03'
,p_display_order=>330
,p_column_identifier=>'AS'
,p_column_label=>'ACTION_FLEX_N03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_N03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5282042353655171772)
,p_db_column_name=>'ACTION_FLEX_N04'
,p_display_order=>340
,p_column_identifier=>'AT'
,p_column_label=>'ACTION_FLEX_N04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_N04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5201476568456934460)
,p_db_column_name=>'PAST_DUE'
,p_display_order=>350
,p_column_identifier=>'AU'
,p_column_label=>'Past Due'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18067128313185239731)
,p_db_column_name=>'RESOLUTION'
,p_display_order=>360
,p_column_identifier=>'AY'
,p_column_label=>'Resolution'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status (',
'    p_application_id => :APP_ID,',
'    p_build_option_name => ''Mandatory Action Item Resolution''',
') = ''INCLUDE'''))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18808039905989757041)
,p_db_column_name=>'AI_TYPE'
,p_display_order=>370
,p_column_identifier=>'AZ'
,p_column_label=>'Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(18916316741608990911)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18808040279936757045)
,p_db_column_name=>'UPDATED_HIDDEN'
,p_display_order=>380
,p_column_identifier=>'BA'
,p_column_label=>'Updated hidden'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18296374163702442059)
,p_db_column_name=>'LINK_TEXT'
,p_display_order=>390
,p_column_identifier=>'BB'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19204382909880214136)
,p_db_column_name=>'COMPLETED_DATE'
,p_display_order=>400
,p_column_identifier=>'BC'
,p_column_label=>'Completion Date'
,p_column_html_expression=>'<span style="white-space: pre;">#COMPLETED_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741811578712499814)
,p_db_column_name=>'MILESTONE'
,p_display_order=>410
,p_column_identifier=>'BE'
,p_column_label=>'Milestone'
,p_column_link=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:RP,107:P107_ID,P107_PROJECT_ID,P200_ID:#MILESTONE_ID#,#PROJECT_ID#,#PROJECT_ID#'
,p_column_linktext=>'#MILESTONE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741811794778499816)
,p_db_column_name=>'MILESTONE_ID'
,p_display_order=>420
,p_column_identifier=>'BF'
,p_column_label=>'Milestone id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741814299075499841)
,p_db_column_name=>'DAY_DELTA'
,p_display_order=>440
,p_column_identifier=>'BI'
,p_column_label=>'Due Date to Completion Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741814435908499843)
,p_db_column_name=>'START_DATE'
,p_display_order=>460
,p_column_identifier=>'BK'
,p_column_label=>'Start Date'
,p_column_html_expression=>'<span style="white-space: pre;">#START_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741814547522499844)
,p_db_column_name=>'ACTUAL_COMPLETION_DATE'
,p_display_order=>470
,p_column_identifier=>'BL'
,p_column_label=>'Marked as Completed On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741814657692499845)
,p_db_column_name=>'ORIGINAL_DAY_DELTA'
,p_display_order=>480
,p_column_identifier=>'BM'
,p_column_label=>'Original Due to Completion Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741814758138499846)
,p_db_column_name=>'ORIGINAL_DUE_DELTA'
,p_display_order=>490
,p_column_identifier=>'BN'
,p_column_label=>'Original Due to Due Date Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741814843328499847)
,p_db_column_name=>'MILESTONE_OWNER'
,p_display_order=>500
,p_column_identifier=>'BO'
,p_column_label=>'Milestone Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741814935931499848)
,p_db_column_name=>'CHANGE_HISTORY'
,p_display_order=>510
,p_column_identifier=>'BP'
,p_column_label=>'Change History'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741815026604499849)
,p_db_column_name=>'MILESTONE_STATUS'
,p_display_order=>520
,p_column_identifier=>'BQ'
,p_column_label=>'Milestone Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19741814333478499842)
,p_db_column_name=>'PROJECT_CODE_NAME'
,p_display_order=>530
,p_column_identifier=>'BJ'
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
 p_id=>wwv_flow_imp.id(19741815134518499850)
,p_db_column_name=>'DEAL_TYPE'
,p_display_order=>540
,p_column_identifier=>'BR'
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
 p_id=>wwv_flow_imp.id(20124881882554729624)
,p_db_column_name=>'PROJECT_STATUS'
,p_display_order=>550
,p_column_identifier=>'BS'
,p_column_label=>'Project Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(8916964241877251201)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20124882901453729634)
,p_db_column_name=>'OPEN_CLOSED'
,p_display_order=>560
,p_column_identifier=>'BT'
,p_column_label=>'Project Open Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(711447132597939478)
,p_db_column_name=>'TAGS'
,p_display_order=>570
,p_column_identifier=>'BU'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8958188746231733501)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'9340470'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EDIT_LINK:PROJECT:CATEGORY:MILESTONE:ACTION:ACTION_STATUS:AI_TYPE:DUE_DATE:COMPLETED_DATE:DAY_DELTA:PAST_DUE:OWNER:'
,p_sort_column_1=>'DUE_DATE'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7864206399746704849)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CREATE_ACTION_ITEM'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Action Item'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:73::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-chevron-right'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8958194532865814787)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8958187417967733276)
,p_button_name=>'RESET_BUTTON'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18808039933647757042)
,p_name=>'P49_PAST_DUE_YN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8958187417967733276)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(8040827728946077193)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'49'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(13084278551555234155)
,p_computation_sequence=>20
,p_computation_item=>'PROJECT_CAME_FROM'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13305559113736764852)
,p_name=>'Refresh IRR on AI Add'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7864206399746704849)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13305559116790764853)
,p_event_id=>wwv_flow_imp.id(13305559113736764852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8958187417967733276)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13908316190726113231)
,p_name=>'Refresh IRR on AI Edit'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8958187417967733276)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13908316218965113232)
,p_event_id=>wwv_flow_imp.id(13908316190726113231)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8958187417967733276)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18808039644329757039)
,p_name=>'Change Breadcrumb Title'
,p_event_sequence=>30
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P49_PAST_DUE_YN'') == ''Y'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18808039798168757040)
,p_event_id=>wwv_flow_imp.id(18808039644329757039)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''span.t-Breadcrumb-label'').html(''Past Due Action Items Report'');',
'document.title = ''Past Due Action Items Report'';'))
);
wwv_flow_imp.component_end;
end;
/
