prompt --application/pages/page_00034
begin
--   Manifest
--     PAGE: 00034
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
 p_id=>34
,p_name=>'Manage Project Milestones'
,p_step_title=>'Manage Project Milestones'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486601256078156)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.permalink { margin: 10px;}',
'.permalink a {color: #707070; font: 11px/12px Arial, sans-serif;}',
'</style>'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.timeline-edit-links .t-StatusList-editLink { position: absolute; right: 8px; top: 8px; font-size: 12px; line-height: 16px; float: right; padding: 4px 8px }',
'.timeline-edit-links .t-StatusList-itemBody { position: relative }',
'.timeline-edit-links .t-StatusList-item { border-bottom: 1px solid rgba(0, 0, 0, .05) }',
'.timeline-edit-links .t-StatusList-item:last-child { border-bottom: none }',
''))
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(11756681878669227855)
,p_help_text=>'You can manage all of your project''s Milestones from this page. Use the filter controls on the left to change the results displayed on the right. You can create new Milestones, edit existing Milestones, create new Action Items for existing Milestones'
||', and view the Milestones Gantt Chart.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6726259764018431199)
,p_plug_name=>'Search Milestones'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:t-Form--stretchInputs:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8030226918473524977)
,p_plug_name=>'Permalink'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.prn(''<div class="permalink"><a href="''||apex_util.prepare_url(''f?p=''||:APP_ID||'':34:''||:APP_SESSION||',
'''::NO:RP,2,200,46:P200_ID,P34_ID,P34_INCLUDE,P34_SHOW,P34_OWNER,P34_IS_MAJOR:''||',
'apex_escape.html(:P34_ID||'',''||:P34_ID||'',''||nvl(:P34_INCLUDE,''OPEN'')||'',''||nvl(:P34_SHOW,''N'')||',
''',''||:P34_OWNER||'',''||nvl(:P34_IS_MAJOR,''ALL'')))||',
'''">Permalink</a></div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8085203048205370259)
,p_name=>'Project Milestones'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>20
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
'            eba_proj_status_ms_no_v mn',
'        where mn.project_id = m.project_id',
'            and mn.milestone_id = m.id',
'            and ( :P34_INCLUDE = ''ALL''',
'                or upper(m.milestone_status) = :P34_INCLUDE )',
'            and ( nvl(:P34_IS_MAJOR,''ALL'') = ''ALL''',
'                or (nvl(m.is_major_yn,''N'') = ''Y''',
'                    and nvl(:P34_IS_MAJOR,''ALL'') = ''MAJOR'') )',
'            and (:P34_SEARCH is  null',
'                or instr(lower(m.milestone_owner),lower(:P34_SEARCH)) > 0',
'                or instr(lower(m.milestone_name),lower(:P34_SEARCH)) > 0',
'                or instr(lower(m.milestone_description),lower(:P34_SEARCH)) > 0 )',
'            and ( :P34_OWNER is null',
'                 or ( m.owner_role_id is null and lower(m.milestone_owner) = :P34_OWNER )',
'                 or ( m.owner_role_id is not null',
'                    and exists (select null',
'                                from eba_proj_user_ref rf,',
'                                    eba_proj_status_users u',
'                                where rf.role_id = m.owner_role_id',
'                                    and rf.project_id = m.project_id',
'                                    and u.id = rf.user_id',
'                                    and lower(u.username) = :P34_OWNER) ) )',
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
'                || apex_escape.html(a.link_text)',
'                ||''" class="t-Button t-Button--small t-Button--noUI"><span class="t-Icon fa fa-link"></span></a>'' ',
'            end as ai_link',
'        from eba_proj_status_ais a,',
'            eba_proj_status_ms m,',
'            eba_proj_status_ms_no_v mn,',
'            eba_proj_status_ai_no_tbl an',
'        where mn.project_id = a.project_id',
'            and mn.milestone_id = a.milestone_id',
'            and an.project_id = a.project_id',
'            and an.action_item_id = a.id',
'            and m.project_id = a.project_id',
'            and m.id = a.milestone_id',
'            and apex_util.get_build_option_status( p_application_id => :APP_ID,',
'                                                   p_build_option_name => ''Project Action Items'') = ''INCLUDE''',
'            and ( :P34_INCLUDE = ''ALL''',
'                or (upper(m.milestone_status) = :P34_INCLUDE',
'                   and upper(a.action_status) = :P34_INCLUDE) )',
'            and ( nvl(:P34_IS_MAJOR,''ALL'') = ''ALL''',
'                or (nvl(m.is_major_yn,''N'') = ''Y''',
'                    and nvl(:P34_IS_MAJOR,''ALL'') = ''MAJOR'') )',
'            and (:P34_SEARCH is  null',
'                or instr(lower(m.milestone_owner),lower(:P34_SEARCH)) > 0',
'                or instr(lower(m.milestone_name),lower(:P34_SEARCH)) > 0',
'                or instr(lower(m.milestone_description),lower(:P34_SEARCH)) > 0 )',
'            and ( :P34_OWNER is null',
'                 or ( m.owner_role_id is null and lower(m.milestone_owner) = :P34_OWNER )',
'                 or ( m.owner_role_id is not null',
'                    and exists (select null',
'                                from eba_proj_user_ref rf,',
'                                    eba_proj_status_users u',
'                                where rf.role_id = m.owner_role_id',
'                                    and rf.project_id = m.project_id',
'                                    and u.id = rf.user_id',
'                                    and lower(u.username) = :P34_OWNER) ) )',
'    )',
'where (pj_id = :P34_ID',
'        or ( nvl(:P34_SHOW ,''N'') = ''Y''',
'            and pj_id in (select id from eba_proj_status s where parent_project_id = :P34_ID)))',
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
 p_id=>wwv_flow_imp.id(1383225604400242047)
,p_query_column_id=>1
,p_column_alias=>'N'
,p_column_display_sequence=>2
,p_column_heading=>'Item #'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1383225910388242048)
,p_query_column_id=>2
,p_column_alias=>'ROW_TYPE'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1383226400975242048)
,p_query_column_id=>3
,p_column_alias=>'ROW_TYPE_LABEL'
,p_column_display_sequence=>14
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1383226727121242049)
,p_query_column_id=>4
,p_column_alias=>'ROW_TYPE_ICON'
,p_column_display_sequence=>12
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1383227172317242049)
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
 p_id=>wwv_flow_imp.id(1383227594295242050)
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
 p_id=>wwv_flow_imp.id(1383227979442242051)
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
 p_id=>wwv_flow_imp.id(1383228324889242051)
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
 p_id=>wwv_flow_imp.id(1383228752533242052)
,p_query_column_id=>9
,p_column_alias=>'OWNER'
,p_column_display_sequence=>6
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1383229162914242052)
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
 p_id=>wwv_flow_imp.id(1383229601464242053)
,p_query_column_id=>11
,p_column_alias=>'DISP_LINK'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1383229905230242054)
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
'    p_project_id => :P34_ID ) = ''Y'''))
,p_display_when_condition2=>'PLSQL'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1383230319067242054)
,p_query_column_id=>13
,p_column_alias=>'ADD_LINK'
,p_column_display_sequence=>13
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1383230765160242055)
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
 p_id=>wwv_flow_imp.id(1369287388953583874)
,p_query_column_id=>15
,p_column_alias=>'PROJECT_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT_NAME#'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'P34_SHOW'
,p_display_when_condition2=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369287494296583875)
,p_query_column_id=>16
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>16
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8917947732417424760)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8957248033171241573)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'RETURN_TO_PROJECT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Return to Project'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.::P200_ID:&P34_ID.#projectMilestones'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8956997534184897753)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'ADD_MILESTONE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Milestone'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:RP,48:P48_PROJECT_ID,LAST_VIEW:&P34_ID.,34'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P34_ID ) = ''N'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8030295940095154890)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'GANTT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'View Gantt'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.:68:P68_PROJECT:&P34_ID.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8029989535467886652)
,p_name=>'P34_OWNER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6726259764018431199)
,p_prompt=>'Owner'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MILESTONE OWNERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct owner d, owner r',
'from (',
'    select lower(x.milestone_owner) owner',
'    from eba_proj_status_ms x',
'    where x.owner_role_id is null',
'    union all',
'    select lower(u.username) owner',
'    from eba_proj_status_ms x,',
'        eba_proj_user_ref rf,',
'        eba_proj_status_users u',
'    where rf.role_id = x.owner_role_id',
'        and rf.project_id = x.project_id',
'        and u.id = rf.user_id',
')',
'where owner is not null',
'order by owner'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'REDIRECT_SET_VALUE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8029997230887780772)
,p_name=>'P34_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6726259764018431199)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8030251744957063566)
,p_name=>'P34_IS_MAJOR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6726259764018431199)
,p_item_default=>'ALL'
,p_prompt=>'Classification'
,p_source=>'ALL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MAJOR MILESTONES'
,p_lov=>'.'||wwv_flow_imp.id(8030253724000369799)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'REDIRECT_SET_VALUE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8917949537707450530)
,p_name=>'P34_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6726259764018431199)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8959655841800170047)
,p_name=>'P34_INCLUDE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6726259764018431199)
,p_item_default=>'OPEN'
,p_prompt=>'Include'
,p_source=>'OPEN'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'MILESTONES TO INCLUDE ALL OR OPEN'
,p_lov=>'.'||wwv_flow_imp.id(12377098388122604202)||'.'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'REDIRECT_SET_VALUE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8959656142670208149)
,p_name=>'P34_SHOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6726259764018431199)
,p_item_default=>'N'
,p_prompt=>'Show Child Projects'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'REDIRECT_SET_VALUE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13084276861772234138)
,p_name=>'Refresh IRR'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8956997534184897753)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13084276981497234139)
,p_event_id=>wwv_flow_imp.id(13084276861772234138)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8085203048205370259)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15010741863126268036)
,p_name=>'Update Milestones'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8085203048205370259)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15010741951476268037)
,p_event_id=>wwv_flow_imp.id(15010741863126268036)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8085203048205370259)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
