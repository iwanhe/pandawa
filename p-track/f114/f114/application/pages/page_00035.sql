prompt --application/pages/page_00035
begin
--   Manifest
--     PAGE: 00035
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
 p_id=>35
,p_name=>'&APPLICATION_TITLE.: Milestones by Date'
,p_step_title=>'&APPLICATION_TITLE.: Milestones by Date'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486601256078156)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/eba_timeline.css" type="text/css" media="all" charset="utf-8">',
'<style type="text/css" media="all">',
'div.body_inner div.region div.content_block{height:200px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;}',
'',
'table.formlayout label {display: block; line-height:18px; }',
'table.formlayout label a {font: bold 11px/18px Arial, sans-serif; color: #333;}',
'table.formlayout label + br {display: none;}',
'#main-sb-left > div {margin-left: 10px;}',
'',
'#MILESTONES .rc-body-r{height:390px !important;}',
'</style>'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.timeline-edit-links .t-StatusList-editLink { position: absolute; right: 8px; top: 8px; font-size: 12px; line-height: 16px; float: right; padding: 4px 8px }',
'.timeline-edit-links .t-StatusList-itemBody { position: relative }',
'.timeline-edit-links .t-StatusList-item { border-bottom: 1px solid rgba(0, 0, 0, .05) }',
'.timeline-edit-links .t-StatusList-item:last-child { border-bottom: none }',
'',
'.nowrap { white-space: nowrap; }',
'.icon-action-item { margin-left: 16px; width: 16px;}',
'.milestones-icon { opacity: .65 }',
'.row-milestone a { margin: 4px 0; display: inline-block; vertical-align: top; }',
'.row-milestone .t-Icon { margin: 4px 0; }',
'.milestones-owner {opacity: 0.65; display: block;}'))
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Use the filter controls on the left to change the Milestones displayed in the timeline on the right. This page also contains links to several other Milestone reports and tools.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8957337440925223678)
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
 p_id=>wwv_flow_imp.id(8957343846717241513)
,p_plug_name=>'Search Filter'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--stretchInputs:t-Region--hideHeader'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_02'
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(9413054958112137418)
,p_name=>'Milestones'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_sub_css_classes=>'t-Report--cleanBorders'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n, row_type, row_type_label, row_type_icon, name, start_date, end_date, completed_date, owner,',
'    ''<span class="t-Badge t-Badge--basic t-Badge--xsmall is-''',
'        ||apex_escape.html(color_code)||'' w100p">''||apex_escape.html(status)||''</span>'' status,',
'    disp_link, edit_link, add_link, ai_link,',
'    (   select pj.project from eba_proj_status pj where pj.id = pj_id ) project_name, pj_id project_id',
'from (  select mn.milestone_number||''.0'' n,',
'            ''<strong>''||apex_escape.html(m.milestone_name)||''</strong>'' name,',
'            ''Milestone'' row_type_label,',
'            ''milestone'' row_type,',
'            case when upper(m.milestone_status) = ''OPEN'' then ''fa-flag-o''',
'                 else ''fa-flag'' end as row_type_icon,',
'            m.milestone_start_date start_date,',
'            m.milestone_date end_date,',
'            m.completed_date completed_date,',
'            m.milestone_status status,',
'            case when m.owner_role_id is null then',
'                eba_proj_fw.get_name_from_email_address(m.milestone_owner)',
'            else',
'                nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))'
||'),'', '')',
'                        within group (order by lower(u.username)) owner',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u,',
'                        eba_proj_roles r',
'                    where rf.role_id = m.owner_role_id',
'                        and rf.project_id = m.project_id',
'                        and u.id = rf.user_id',
'                        and r.id = rf.role_id',
'                    group by r.name',
'                ), (select ''No ''||r.name||'' defined''',
'                    from eba_proj_roles r',
'                    where r.id = m.owner_role_id)',
'                )',
'            end as owner,',
'            m.project_id pj_id,',
'            m.id ms_id,',
'            null ai_id,',
'            case when upper(m.milestone_status) = ''OPEN'' and trunc(m.milestone_date) > trunc(sysdate) then ''success''',
'                when upper(m.milestone_status) = ''OPEN'' and trunc(m.milestone_date) = trunc(sysdate) then ''warning''',
'                when upper(m.milestone_status) = ''OPEN'' /* past due */ then ''danger''',
'                else ''complete'' end as color_code,',
'            mn.milestone_number o1,',
'            0                   o2,',
'            apex_util.prepare_url(''f?p=''||:APP_ID||'':107:''||:APP_SESSION||'':::107:P107_ID,P107_PROJECT_ID,P200_ID:''',
'                ||m.id||'',''||m.project_id||'',''||m.project_id) disp_link,',
'            apex_util.prepare_url(''f?p=''||:APP_ID||'':48:''||:APP_SESSION||'':::48:P48_ID:''||m.id) edit_link,',
'            case when eba_proj_fw.are_ms_ai_restricted( p_application_id => :APP_ID,',
'                                                        p_username   => upper(:APP_USER),',
'                                                        p_project_id => m.project_id ) = ''N''',
'                    and eba_proj_stat_ui.get_authorization_level( p_username => upper(:APP_USER) ) >= 2 then',
'                ''<button type="button" class="t-Button t-Button--small t-Button--simple u-pullRight" onClick="''',
'                    ||apex_util.prepare_url(''f?p=''||:APP_ID||'':73:''||:APP_SESSION||'':::73:P73_PROJECT_ID,P73_MILESTONE_ID:''',
'                                            ||m.project_id||'',''||m.id)||''">Add Action Item</button>''',
'             end as add_link,',
'             null as ai_link',
'        from eba_proj_status_ms m,',
'            eba_proj_status_ms_no_v mn,',
'            eba_proj_status p',
'        where mn.project_id = m.project_id',
'            and mn.milestone_id = m.id',
'            and p.id = m.project_id',
'            and (:P35_MILESTONE_OWNER is null',
'                or ( m.owner_role_id is null and lower(m.milestone_owner) = lower(:P35_MILESTONE_OWNER))',
'                or exists ( select null',
'                            from eba_proj_user_ref rf,',
'                                eba_proj_status_users u',
'                            where rf.role_id = m.owner_role_id',
'                                and rf.project_id = m.project_id',
'                                and u.id = rf.user_id',
'                                and lower(u.username) = lower(:P35_MILESTONE_OWNER) )',
'                )',
'            and ( nvl(:P35_SHOW,''Open'') = ''All''',
'                or (m.milestone_status = ''Open''',
'                    and nvl(:P35_SHOW,''Open'') = ''Open'' ))',
'            and (nvl(:P35_IS_MAJOR,''ALL'') = ''ALL''',
'                or (nvl(is_major_yn,''N'') = ''Y''',
'                    and nvl(:P35_IS_MAJOR,''ALL'') = ''MAJOR'' ))',
'            and ( :P35_QUARTER is null',
'                  or exists',
'                 (select null from eba_proj_fy_periods p where trunc(m.milestone_date) between p.first_day and p.last_day and p.period_name = :P35_QUARTER)',
'                )',
'            and ( :P35_PROJECT is null or m.project_id = :P35_PROJECT )',
'            and ( :P35_SEARCH is null',
'                or upper(:P35_SEARCH) = m.row_key',
'                or instr(upper(m.milestone_name), upper(:P35_SEARCH)) > 0',
'                or instr(upper(m.milestone_description), upper(:P35_SEARCH)) > 0)',
'            and ( nvl(:P35_CATEGORY,0) = 0',
'                or p.cat_id = :P35_CATEGORY)',
'    union all',
'        select mn.milestone_number||''.''||an.action_item_number n,',
'            apex_escape.html(a.action) name,',
'            ''Action Item'' row_type_label,',
'            ''action-item'' row_type,',
'            case when upper(a.action_status) = ''OPEN'' then ''icon-action-item''',
'                 else ''fa fa-check icon-action-item'' end as row_type_icon,',
'            null start_date,',
'            a.due_date end_date,',
'            a.completed_date completed_date,',
'            a.action_status status,',
'            case when a.owner_role_id is null then',
'                eba_proj_fw.get_name_from_email_address(a.action_owner_01)',
'                    ||nvl2(a.action_owner_02,'', ''||eba_proj_fw.get_name_from_email_address(a.action_owner_02),null)',
'                    ||nvl2(a.action_owner_03,'', ''||eba_proj_fw.get_name_from_email_address(a.action_owner_03),null)',
'                    ||nvl2(a.action_owner_04,'', ''||eba_proj_fw.get_name_from_email_address(a.action_owner_04),null)',
'            else',
'                nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))'
||'),'', '')',
'                        within group (order by lower(u.username)) owner',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u,',
'                        eba_proj_roles r',
'                    where rf.role_id = a.owner_role_id',
'                        and rf.project_id = a.project_id',
'                        and u.id = rf.user_id',
'                        and r.id = rf.role_id',
'                    group by r.name',
'                ), (select ''No ''||r.name||'' defined''',
'                    from eba_proj_roles r',
'                    where r.id = a.owner_role_id)',
'                )',
'            end as owner,',
'            a.project_id pj_id,',
'            a.milestone_id ms_id,',
'            a.id ai_id,',
'            case when upper(a.action_status) = ''OPEN'' and trunc(a.due_date) > trunc(sysdate) then ''success''',
'                when upper(a.action_status) = ''OPEN'' and trunc(m.milestone_date) = trunc(sysdate) then ''warning''',
'                when upper(a.action_status) = ''OPEN'' /* past due */ then ''danger''',
'                else ''complete'' end as color_code,',
'            mn.milestone_number   o1,',
'            an.action_item_number o2,',
'            apex_util.prepare_url(''f?p=''||:APP_ID||'':78:''||:APP_SESSION||'':::107:LAST_VIEW,P78_GOTO,P78_ACTION_ITEM_ID,P55_ID,P200_ID:200,MS,''',
'                ||a.id||'',''||a.project_id||'',''||a.project_id) disp_link,',
'            apex_util.prepare_url(''f?p=''||:APP_ID||'':73:''||:APP_SESSION||'':::73:P73_ID:''||a.id) edit_link,',
'            null add_link,',
'            case when a.link_url is not null then ''<a href="'' ||apex_escape.html(a.link_url)|| ''" target="_blank" title="''',
'                ||apex_escape.html(a.link_text)',
'                ||''" class="t-Button t-Button--small t-Button--noUI"><span class="t-Icon fa fa-link"></span></a>'' ',
'            end as ai_link',
'        from eba_proj_status_ais a,',
'            eba_proj_status_ms m,',
'            eba_proj_status_ms_no_v mn,',
'            eba_proj_status_ai_no_tbl an,',
'            eba_proj_status p',
'        where mn.project_id = a.project_id',
'            and mn.milestone_id = a.milestone_id',
'            and an.project_id = a.project_id',
'            and an.action_item_id = a.id',
'            and m.project_id = a.project_id',
'            and m.id = a.milestone_id',
'            and p.id = m.project_id',
'            and apex_util.get_build_option_status( p_application_id => :APP_ID,',
'                                                   p_build_option_name => ''Project Action Items'') = ''INCLUDE''',
'            and (:P35_MILESTONE_OWNER is null',
'                or ( m.owner_role_id is null and lower(m.milestone_owner) = lower(:P35_MILESTONE_OWNER))',
'                or exists ( select null',
'                            from eba_proj_user_ref rf,',
'                                eba_proj_status_users u',
'                            where rf.role_id = m.owner_role_id',
'                                and rf.project_id = m.project_id',
'                                and u.id = rf.user_id',
'                                and lower(u.username) = lower(:P35_MILESTONE_OWNER) )',
'                )',
'            and ( nvl(:P35_SHOW,''Open'') = ''All''',
'                or (m.milestone_status = nvl(:P35_SHOW,''Open'')',
'                   and a.action_status = nvl(:P35_SHOW,''Open''))',
'                )',
'            and (nvl(:P35_IS_MAJOR,''ALL'') = ''ALL''',
'                or (nvl(is_major_yn,''N'') = ''Y''',
'                    and nvl(:P35_IS_MAJOR,''ALL'') = ''MAJOR'' ))',
'            and ( :P35_QUARTER is null',
'                  or exists',
'                 (select null from eba_proj_fy_periods p where trunc(m.milestone_date) between p.first_day and p.last_day and p.period_name = :P35_QUARTER)',
'                )',
'            and ( :P35_PROJECT is null or m.project_id = :P35_PROJECT )',
'            and ( :P35_SEARCH is null',
'                or upper(:P35_SEARCH) = m.row_key',
'                or instr(upper(m.milestone_name), upper(:P35_SEARCH)) > 0',
'                or instr(upper(m.milestone_description), upper(:P35_SEARCH)) > 0)',
'            and ( nvl(:P35_CATEGORY,0) = 0',
'                or p.cat_id = :P35_CATEGORY)',
'    )',
'order by o1, o2'))
,p_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-StatusList-legend" style="padding: 8px; border-top: 1px solid rgba(0,0,0,.05); font-size: 11px;">',
'    <strong>Status Color Coding:</strong>',
'    <span class="t-Badge t-Badge--basic t-Badge--small is-complete">Closed</span>',
'    <span class="t-Badge t-Badge--basic t-Badge--small is-danger">Past Due</span>',
'    <span class="t-Badge t-Badge--basic t-Badge--small is-warning">Due Today</span>',
'    <span class="t-Badge t-Badge--basic t-Badge--small is-success">Due in the Future</span>',
'</div>'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>50000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394099236490889715)
,p_query_column_id=>1
,p_column_alias=>'N'
,p_column_display_sequence=>2
,p_column_heading=>'Item #'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394099693030889716)
,p_query_column_id=>2
,p_column_alias=>'ROW_TYPE'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394100038491889717)
,p_query_column_id=>3
,p_column_alias=>'ROW_TYPE_LABEL'
,p_column_display_sequence=>14
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394100479114889717)
,p_query_column_id=>4
,p_column_alias=>'ROW_TYPE_ICON'
,p_column_display_sequence=>12
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394100870665889718)
,p_query_column_id=>5
,p_column_alias=>'NAME'
,p_column_display_sequence=>5
,p_column_heading=>'Name'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-MediaBlock row-#ROW_TYPE#">',
'  <div class="a-MediaBlock-graphic">',
'    <span class="t-Icon milestones-icon fa #ROW_TYPE_ICON#" aria-hidden="true"></span><span class="u-VisuallyHidden">#ROW_TYPE_LABEL#</span> ',
'  </div>',
'  <div class="a-MediaBlock-content">',
'    <a href="#DISP_LINK#">#NAME#</a>',
'    #ADD_LINK#',
'  </div>',
'</div>'))
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394101233976889718)
,p_query_column_id=>6
,p_column_alias=>'START_DATE'
,p_column_display_sequence=>7
,p_column_heading=>'Start'
,p_column_format=>'DD-MON-YYYY'
,p_column_css_class=>'nowrap'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394101685674889719)
,p_query_column_id=>7
,p_column_alias=>'END_DATE'
,p_column_display_sequence=>8
,p_column_heading=>'End'
,p_column_format=>'DD-MON-YYYY'
,p_column_css_class=>'nowrap'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394102071834889719)
,p_query_column_id=>8
,p_column_alias=>'COMPLETED_DATE'
,p_column_display_sequence=>9
,p_column_heading=>'Completed'
,p_column_format=>'DD-MON-YYYY'
,p_column_css_class=>'nowrap'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394102464054889722)
,p_query_column_id=>9
,p_column_alias=>'OWNER'
,p_column_display_sequence=>6
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394102823756889723)
,p_query_column_id=>10
,p_column_alias=>'STATUS'
,p_column_display_sequence=>10
,p_column_heading=>'Status'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394103238804889725)
,p_query_column_id=>11
,p_column_alias=>'DISP_LINK'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394103675710889726)
,p_query_column_id=>12
,p_column_alias=>'EDIT_LINK'
,p_column_display_sequence=>1
,p_column_link=>'#EDIT_LINK#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P35_ID ) = ''Y'''))
,p_display_when_condition2=>'PLSQL'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394104085832889729)
,p_query_column_id=>13
,p_column_alias=>'ADD_LINK'
,p_column_display_sequence=>13
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394104498495889729)
,p_query_column_id=>14
,p_column_alias=>'AI_LINK'
,p_column_display_sequence=>15
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(19136719722975969919)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394104853908889730)
,p_query_column_id=>15
,p_column_alias=>'PROJECT_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT_NAME#'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'ITEM_IS_NULL'
,p_display_when_condition=>'P35_PROJECT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1394105257684889730)
,p_query_column_id=>16
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>16
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19908160784281807186)
,p_plug_name=>'Milestone Reports & Tools'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-LinksList--nowrap'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_imp.id(5253677596989895621)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6672372065359369922)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8042895345525114385)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8957343846717241513)
,p_button_name=>'P35_RESET_REPORT'
,p_button_static_id=>'P35_RESET_REPORT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-undo-alt'
,p_request_source=>'Reset Report'
,p_request_source_type=>'STATIC'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8957348621852729715)
,p_branch_action=>'f?p=&FLOW_ID.:35:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5351976532889902132)
,p_name=>'P35_QUARTER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8957343846717241513)
,p_prompt=>'Quarter'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'QUARTERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select period_name as d,',
'       period_name as r',
'  from eba_proj_fy_periods',
' order by first_day asc'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Quarters -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8030254828764390063)
,p_name=>'P35_IS_MAJOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8957343846717241513)
,p_item_default=>'ALL'
,p_prompt=>'Type'
,p_source=>'ALL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MAJOR MILESTONES'
,p_lov=>'.'||wwv_flow_imp.id(8030253724000369799)||'.'
,p_cHeight=>1
,p_tag_attributes=>'style="width: 170px;"'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8030291442820427052)
,p_name=>'P35_MILESTONE_OWNER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8957343846717241513)
,p_prompt=>'Milestone Owner'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MILESTONE OR PROJECT OWNER TWO VALUES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct display_owner d, lower(owner) r',
'from (',
'    select eba_proj_fw.get_name_from_email_address(u.username) as display_owner, u.username as owner',
'    from eba_proj_status_users u,',
'        eba_proj_user_ref rf,',
'        eba_proj_roles r,',
'        eba_proj_status p',
'    where rf.user_id = u.id',
'        and rf.role_id = r.id',
'        and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'        and rf.project_id = p.id',
'    union all',
'    select eba_proj_fw.get_name_from_email_address(milestone_owner) as display_owner, milestone_owner as owner',
'    from eba_proj_status_ms',
'    where milestone_owner is not null',
'        and owner_role_id is null',
'    union all',
'    select eba_proj_fw.get_name_from_email_address(u.username) as display_owner, u.username as owner',
'    from eba_proj_user_ref rf,',
'        eba_proj_status_users u,',
'        eba_proj_roles r,',
'        eba_proj_status_ms m',
'    where m.owner_role_id is not null',
'        and rf.role_id = m.owner_role_id',
'        and rf.project_id = m.project_id',
'        and u.id = rf.user_id',
'        and r.id = rf.role_id',
')',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Owners -'
,p_cHeight=>1
,p_tag_attributes=>'style="width: 170px;"'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Identifies milestone owner.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8042924741891201517)
,p_name=>'P35_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8957343846717241513)
,p_prompt=>'Search'
,p_placeholder=>'Search Milestones'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8957344239246241525)
,p_name=>'P35_CATEGORY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8957343846717241513)
,p_item_default=>'0'
,p_prompt=>'&CAT_TITLE.'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CATEGORIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CATEGORY display_value, ID return_value ',
'from EBA_PROJ_STATUS_CATS',
'where is_active_yn = ''Y''',
'order by display_sequence nulls last, 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All &CAT_TITLE_PL. -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_tag_attributes=>'style="width: 170px;"'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Restrict this report to this &CAT_TITLE_LC..'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8957349531722154842)
,p_name=>'P35_SHOW'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8957343846717241513)
,p_item_default=>'Open'
,p_prompt=>'Status'
,p_source=>'Open'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:All;All,Open;Open'
,p_cHeight=>1
,p_tag_attributes=>'style="width: 170px;"'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15302909490141743015)
,p_name=>'P35_CURRENT_USER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8957343846717241513)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20128181076876563446)
,p_name=>'P35_PROJECT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8957343846717241513)
,p_prompt=>'Project'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project d, id r',
'from eba_proj_status',
'order by upper(project)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Projects -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(15302909543488743016)
,p_computation_sequence=>10
,p_computation_item=>'P35_CURRENT_USER'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'lower(:APP_USER)'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(8957350237281307854)
,p_computation_sequence=>20
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'35'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15249826596646968854)
,p_name=>'Set Current User as Owner'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#myMSs'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15249826696495968855)
,p_event_id=>wwv_flow_imp.id(15249826596646968854)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P35_MILESTONE_OWNER'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'lower(:APP_USER)'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15302910314779743023)
,p_event_id=>wwv_flow_imp.id(15249826596646968854)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9413054958112137418)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15213085034697322328)
,p_name=>'Search Milestones on Enter'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.keyCode == 13'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'change, keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15302911733494743038)
,p_event_id=>wwv_flow_imp.id(15213085034697322328)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P35_MILESTONE_OWNER,P35_QUARTER,P35_CATEGORY,P35_SHOW,P35_IS_MAJOR,P35_SEARCH'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15213085307190322330)
,p_event_id=>wwv_flow_imp.id(15213085034697322328)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'this.browserEvent.preventDefault();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15213085120747322329)
,p_event_id=>wwv_flow_imp.id(15213085034697322328)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9413054958112137418)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17332776857150993343)
,p_name=>'Refresh Report'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_MILESTONE_OWNER,P35_QUARTER,P35_CATEGORY,P35_SHOW,P35_IS_MAJOR,P35_PROJECT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17332776992209993344)
,p_event_id=>wwv_flow_imp.id(17332776857150993343)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Need to do this for plugin',
'null;',
''))
,p_attribute_02=>'P35_MILESTONE_OWNER,P35_QUARTER,P35_CATEGORY,P35_SHOW,P35_IS_MAJOR,P35_PROJECT'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17332777045278993345)
,p_event_id=>wwv_flow_imp.id(17332776857150993343)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9413054958112137418)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17332777203796993346)
,p_name=>'Reset Page'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8042895345525114385)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17332777288487993347)
,p_event_id=>wwv_flow_imp.id(17332777203796993346)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P35_MILESTONE_OWNER,P35_QUARTER,P35_CATEGORY,P35_SHOW,P35_IS_MAJOR,P35_SEARCH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20289565984560214623)
,p_name=>'Refresh region on close after edit'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9413054958112137418)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20289566095047214624)
,p_event_id=>wwv_flow_imp.id(20289565984560214623)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9413054958112137418)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8042908830912980679)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_imp.id(8042895345525114385)
,p_internal_uid=>8042908830912980679
);
wwv_flow_imp.component_end;
end;
/
