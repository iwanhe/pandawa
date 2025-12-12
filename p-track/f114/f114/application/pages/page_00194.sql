prompt --application/pages/page_00194
begin
--   Manifest
--     PAGE: 00194
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
 p_id=>194
,p_name=>'&P194_DISPLAY_USERNAME.''s Dashboard'
,p_step_title=>'&P194_DISPLAY_USERNAME.''s Dashboard'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.timeline-edit-links .t-StatusList-editLink { position: absolute; right: 8px; top: 8px; font-size: 12px; line-height: 16px; float: right; padding: 4px 8px }',
'.timeline-edit-links .t-StatusList-itemBody { position: relative }',
'.timeline-edit-links .t-StatusList-item { border-bottom: 1px solid rgba(0, 0, 0, .05) }',
'.timeline-edit-links .t-StatusList-item:last-child { border-bottom: none }',
'',
'.t-StatusList-itemTitle {margin-right: 48px;}'))
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'The "My Dashboard" page displays all open Action Items and Milestones assigned to the current user. It also shows a list of Projects the current user is a member of and is following. When someone has several Action Items and/or Milestones assigned to'
||' them, they can click the <strong>Mass Update</strong> tool to update several Action Items and/or Milestones at once. '
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(3367290924956834178)
,p_name=>'My Open Issues'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select i.id,',
'    i.project_id,',
'    i.issue,',
'    ''Edit'' as edit,',
'    case when i.owner_role_id is null then',
'        eba_proj_fw.get_name_from_email_address(i.issue_owner)',
'    else',
'        nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '')',
'                within group (order by lower(u.username)) owner',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.role_id = i.owner_role_id',
'                and rf.project_id = i.project_id',
'                and u.id = rf.user_id',
'                and r.id = rf.role_id',
'            group by r.name',
'        ), (select ''No ''||r.name||'' defined''',
'            from eba_proj_roles r',
'            where r.id = i.owner_role_id)',
'        )',
'    end as issue_owner,',
'    i.issue_level,',
'    (select u.id from eba_proj_status_users u where upper(i.created_by) = upper(u.username)) as user_id,',
'    decode(i.is_open,''Y'',''Open'',''N'',''Closed'',i.is_open) status,',
'    decode(i.link_01,null,'' '',',
'           ''<a href="''||apex_escape.html(i.link_01)',
'           ||''" target="_blank" class="t-Button t-Button--icon t-Button--small" title="''',
'           ||apex_escape.html(nvl(i.link_name_01,''Open Issue Link''))||''">''',
'           ||''<span class="t-Icon fa fa-external-link"></span></a>'') link,',
'    i.created,',
'    lower(i.created_by) created_by,',
'    i.updated,',
'    lower(i.updated_by) as updated_by,',
'    (   select project',
'        from eba_proj_status x',
'        where x.id = i.project_id) project',
'from eba_proj_status_issues i',
'where (upper(i.ISSUE_OWNER) = upper(:APP_USER) ',
'       or exists (select null from eba_proj_user_ref r where r.user_id = :CURRENT_USER_ID and i.project_id = r.project_id and i.OWNER_ROLE_ID = r.role_id))',
'  and i.is_open = ''Y''',
'order by issue_level, upper(issue), i.updated desc'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status_issues i',
'where (upper(i.ISSUE_OWNER) = upper(:APP_USER) ',
'       or exists (select null from eba_proj_user_ref r where r.user_id = :CURRENT_USER_ID and i.project_id = r.project_id and i.OWNER_ROLE_ID = r.role_id))',
'  and i.is_open = ''Y'''))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3367291039641834179)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3367291180443834180)
,p_query_column_id=>2
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3367291227619834181)
,p_query_column_id=>3
,p_column_alias=>'ISSUE'
,p_column_display_sequence=>2
,p_column_heading=>'Issue'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3184128518011336773)
,p_query_column_id=>4
,p_column_alias=>'EDIT'
,p_column_display_sequence=>14
,p_column_heading=>'Edit'
,p_column_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24:P24_ID:#ID#'
,p_column_linktext=>'#EDIT#'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3367291347871834182)
,p_query_column_id=>5
,p_column_alias=>'ISSUE_OWNER'
,p_column_display_sequence=>5
,p_column_heading=>'Issue Owner'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3367291451635834183)
,p_query_column_id=>6
,p_column_alias=>'ISSUE_LEVEL'
,p_column_display_sequence=>6
,p_column_heading=>'Issue Level'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3367291571037834184)
,p_query_column_id=>7
,p_column_alias=>'USER_ID'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3367291641893834185)
,p_query_column_id=>8
,p_column_alias=>'STATUS'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3367291727999834186)
,p_query_column_id=>9
,p_column_alias=>'LINK'
,p_column_display_sequence=>9
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483105174213085342)
,p_query_column_id=>10
,p_column_alias=>'CREATED'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3367291891177834187)
,p_query_column_id=>11
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3367291908964834188)
,p_query_column_id=>12
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>13
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483105273783085343)
,p_query_column_id=>13
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>12
,p_column_heading=>'Last Updated By'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3367292090759834189)
,p_query_column_id=>14
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>3
,p_column_heading=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14042366496891240437)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(14042366829102240441)
,p_name=>'Projects I''m Following'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h480:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--inline'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select decode(s.parent_project_id,',
'        null, ''<a href="''',
'            ||apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||s.id)||''">''',
'            ||apex_escape.html(s.project)||''</a>'',',
'        ''<a href="''',
'            ||apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||s.id)',
'            ||''"><span class="child-project-marker">''||apex_escape.html(s.project)||''</span></a>'') project,',
'    c.status_short_desc status,',
'    (   select listagg(lower(u.username),'', '') within group',
'            (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'        from eba_proj_user_ref rf,',
'            eba_proj_status_users u,',
'            eba_proj_roles r',
'        where rf.project_id = s.id',
'            and rf.user_id = u.id',
'            and rf.role_id = r.id',
'            and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' ) as all_owners,',
'    (   select category from eba_proj_status_cats  cat where cat.id = s.cat_id) category,',
'    s.updated,',
'    s.id project_id',
'from eba_proj_status s,',
'    eba_proj_status_codes c',
'where c.id = s.project_status',
'    and c.is_closed_status != ''Y''',
'    and s.project is not null',
'    --',
'    and exists (select null',
'                from eba_proj_status_favorites f',
'                where f.content_id = s.id',
'                    and upper(f.user_name) = upper(:P194_NAME))',
'order by greatest(s.updated,s.created) desc,',
'    s.project'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' '
,p_query_no_data_found=>'No followed projects found'
,p_query_more_data=>'Too many projects to display, please filter'
,p_query_num_rows_item=>'P194_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>100000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042367262135240445)
,p_query_column_id=>1
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>2
,p_column_heading=>'Project'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042367550406240448)
,p_query_column_id=>2
,p_column_alias=>'STATUS'
,p_column_display_sequence=>4
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042367697488240449)
,p_query_column_id=>3
,p_column_alias=>'ALL_OWNERS'
,p_column_display_sequence=>5
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042367073601240443)
,p_query_column_id=>4
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'&CAT_TITLE.'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042367136079240444)
,p_query_column_id=>5
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>6
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14042367338298240446)
,p_query_column_id=>6
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2:P2_ID,P200_ID:#PROJECT_ID#,#PROJECT_ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'NEVER'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14138411759333992902)
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
 p_id=>wwv_flow_imp.id(14138443290208006286)
,p_plug_name=>'Open Action Items'
,p_region_name=>'actionItems'
,p_region_css_classes=>'timeline-edit-links'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h480:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id,',
'    a.action title,',
'    case when a.action_status = ''Closed'' then',
'            ''Black''',
'        when trunc(a.due_date) < trunc(sysdate) then',
'            ''Red''',
'        when trunc(a.due_date) = trunc(sysdate) then',
'            ''Yellow''',
'        else',
'            ''Green''',
'    end as color,',
'    case when a.link_url is not null and a.link_text is not null and exists (select null',
'                 from apex_application_build_options',
'                where application_id = :APP_ID',
'                  and build_option_name = ''Action Item Links''',
'                  and build_option_status = ''Include'') then',
'        ''<small><a href="'' || a.link_url || ''" target="_blank">'' || a.link_text || ''</a></small>''',
'    end as link_text,',
'    case when a.ACTION_STATUS = ''Closed'' then',
'            ''Closed''',
'        when trunc(a.due_date) < trunc(sysdate) then',
'            ''Past Due''',
'        when trunc(a.due_date) = trunc(sysdate) then',
'            ''Due Today''',
'        else',
'            ''Due In The Future''',
'    end as color_label,',
'    decode(a.milestone_id,null,null,(select milestone_name m from eba_proj_status_ms where id = a.milestone_id)) milestone,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':78:''||:APP_SESSION',
'                ||'':::78:P78_ACTION_ITEM_ID,P200_ID:''',
'                ||a.id||'',''||s.id) link,',
'    case when s.parent_project_id is null then',
'            null',
'        else',
'            ''Parent Project: ''||(   select project d',
'                                    from eba_proj_status',
'                                    where id = s.parent_project_id )',
'    end as parent_project,',
'    s.project,',
'    a.action_description,',
'    a.ACTION_STATUS status,',
'    a.due_date due_date,',
'    case when owner_role_id is null then',
'        eba_proj_fw.get_name_from_email_address(a.action_owner_01)',
'        ||decode(a.action_owner_02,null,null,'', ''||eba_proj_fw.get_name_from_email_address(a.action_owner_02))',
'        ||decode(a.action_owner_03,null,null,'', ''||eba_proj_fw.get_name_from_email_address(a.action_owner_03))',
'        ||decode(a.action_owner_04,null,null,'', ''||eba_proj_fw.get_name_from_email_address(a.action_owner_04))',
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
'    a.row_key,',
'    case when eba_proj_fw.is_edit_authorized(',
'        p_username   => upper(:APP_USER),',
'        p_project_id => a.project_id ) = ''Y'' then',
'        ''<a href="''',
'          ||apex_util.prepare_url(',
'              p_url => ''f?p=''||:APP_ID||'':73:''||:APP_SESSION||'':::73:P73_ID:''||a.id,',
'              p_triggering_element => ''$(''''#actionItems'''')'')||''"',
'         class="t-StatusList-editLink">Edit</a>''',
'    else',
'        null',
'    end as edit_link',
'from eba_proj_status_ais a,',
'    eba_proj_status s,',
'    eba_proj_status_codes c',
'where a.project_id = s.id',
'    and s.project_status = c.id',
'    and s.project_status not in (select id from eba_proj_status_codes where is_closed_status = ''Y'')',
'    and c.is_closed_status != ''Y''',
'    and a.action_status = ''Open''',
'    and (( a.owner_role_id is null',
'        and (   upper(a.action_owner_01) = upper(:P194_NAME)',
'            or  upper(a.action_owner_02) = upper(:P194_NAME)',
'            or  upper(a.action_owner_03) = upper(:P194_NAME)',
'            or  upper(a.action_owner_04) = upper(:P194_NAME)',
'        )) or ( a.owner_role_id is not null',
'            and exists ( select null',
'                        from eba_proj_user_ref rf,',
'                            eba_proj_status_users u',
'                        where rf.role_id = a.owner_role_id',
'                            and rf.project_id = a.project_id',
'                            and rf.user_id = u.id',
'                            and upper(u.username) = upper(:P194_NAME) )',
'        )',
'    )',
'    and ( :P194_AI_PROJECT is null or s.id = :P194_AI_PROJECT )',
'order by a.due_date,',
'    lower(s.project)'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_plug_query_num_rows=>5000
,p_plug_query_no_data_found=>'No open Action Items found'
,p_required_patch=>wwv_flow_imp.id(11756699376794143132)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'DUE_DATE',
  'attribute_02', 'COLOR',
  'attribute_03', 'TITLE',
  'attribute_04', 'LINK',
  'attribute_05', 'PROJECT',
  'attribute_06', 'OWNER',
  'attribute_07', 'MILESTONE',
  'attribute_09', 'ACTION_DESCRIPTION',
  'attribute_11', 'EDIT_LINK',
  'attribute_12', 'D',
  'attribute_13', 'STATUS',
  'attribute_14', 'COLOR_LABEL',
  'attribute_15', 'LINK_TEXT')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14138443700388006289)
,p_name=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14138444054169006290)
,p_name=>'TITLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Title'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14138444527276006292)
,p_name=>'COLOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14138445100767006292)
,p_name=>'LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Link'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14138445611799006293)
,p_name=>'PARENT_PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Parent Project'
,p_display_sequence=>50
,p_use_as_row_header=>false
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Allow Parent Projects''',
'   and build_option_status = ''Include'''))
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14138446071913006294)
,p_name=>'PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project'
,p_display_sequence=>60
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14138446537242006295)
,p_name=>'ACTION_DESCRIPTION'
,p_data_type=>'CLOB'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Action description'
,p_display_sequence=>90
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14138447102319006296)
,p_name=>'STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>110
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14138447577761006297)
,p_name=>'DUE_DATE'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Due date'
,p_display_sequence=>130
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14138448061647006298)
,p_name=>'OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Owner(s)'
,p_display_sequence=>150
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14138448555197006299)
,p_name=>'ROW_KEY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Row key'
,p_display_sequence=>160
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15010740884482268026)
,p_name=>'EDIT_LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Edit link'
,p_display_sequence=>170
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15358144957251283826)
,p_name=>'COLOR_LABEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color label'
,p_display_sequence=>180
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18296374070160442058)
,p_name=>'LINK_TEXT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Link text'
,p_display_sequence=>190
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19204383493019214142)
,p_name=>'MILESTONE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Milestone'
,p_display_sequence=>200
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14139547956093392584)
,p_plug_name=>'Open Milestones'
,p_region_name=>'milestones'
,p_region_css_classes=>'timeline-edit-links'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h480:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select m.id,',
'       m.milestone_name title,',
'       case when m.milestone_status = ''Completed'' then',
'               ''Black''',
'           when trunc(m.milestone_date) < trunc(current_date) then',
'               ''Red''',
'           when trunc(m.milestone_date) = trunc(current_date) then',
'               ''Yellow''',
'           else',
'               ''Green''',
'       end as color,',
'       case when trunc(m.milestone_date) < trunc(sysdate) and nvl(m.milestone_status,''Completed'') = ''Completed'' then',
'               ''Closed''',
'           when trunc(m.milestone_date) < trunc(sysdate) and nvl(m.milestone_status,''Completed'') != ''Completed'' then',
'               ''Past Due''',
'           when trunc(m.milestone_date) = trunc(sysdate) and nvl(m.milestone_status,''Completed'') != ''Completed'' then',
'               ''Due Today''',
'           when trunc(m.milestone_date) > trunc(sysdate) and nvl(m.milestone_status,''Completed'') != ''Completed'' then',
'               ''Due In The Future''',
'       end as color_label,',
'       apex_util.prepare_url(''f?p=''||:APP_ID||'':107:''||:APP_SESSION',
'           ||'':::107:P107_ID,P200_ID,P107_PROJECT_ID:''',
'           ||m.id||'',''||m.project_id||'',''||m.project_id) link,',
'       m.milestone_description,',
'       m.milestone_date,',
'       m.milestone_status,',
'       m.milestone_start_date,',
'       s.project,',
'       case when owner_role_id is null then',
'            eba_proj_fw.get_name_from_email_address(m.milestone_owner)',
'       else',
'           nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '
||''')',
'                   within group (order by lower(u.username)) owner',
'               from eba_proj_user_ref rf,',
'                   eba_proj_status_users u,',
'                   eba_proj_roles r',
'               where rf.role_id = m.owner_role_id',
'                   and rf.project_id = m.project_id',
'                   and u.id = rf.user_id',
'                   and r.id = rf.role_id',
'               group by r.name',
'           ), (select ''No ''||r.name||'' defined''',
'               from eba_proj_roles r',
'               where r.id = m.owner_role_id)',
'           )',
'       end as milestone_owner,',
'       nvl((   select count(*)',
'               from eba_proj_status_ais a',
'               where a.milestone_id = m.id',
'                   and a.action_status = ''Open''),0) ||'' Open Action Items'' ai_open,',
'       case when eba_proj_fw.is_edit_authorized(',
'           p_username   => upper(:APP_USER),',
'           p_project_id => m.project_id ) = ''Y'' then',
'           decode(nvl(m.is_major_yn,''N''),''Y'',''<b>MAJOR MILESTONE</b>'',null) || ',
'           ''<a href="''',
'             ||apex_util.prepare_url(',
'                 p_url => ''f?p=''||:APP_ID||'':48:''||:APP_SESSION||'':::48:P48_ID:''||m.id,',
'                 p_triggering_element => ''$(''''#milestones'''')'')||''"',
'            class="t-StatusList-editLink">Edit</a>''',
'       else',
'           decode(nvl(m.is_major_yn,''N''),''Y'',''<b>MAJOR MILESTONE</b>'',null)',
'       end as description3',
'from eba_proj_status_ms m,',
'    eba_proj_status s,',
'    eba_proj_status_codes c',
'where m.project_id = s.id',
'    and s.project_status = c.id',
'    and s.project_status not in (select id from eba_proj_status_codes where is_closed_status = ''Y'')',
'    and c.is_closed_status != ''Y''',
'    and m.milestone_status = ''Open''',
'    and ( m.owner_role_id is null',
'            and',
'            instr(upper(m.milestone_owner), upper(:P194_NAME)) > 0',
'        or',
'            exists ( select null',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u',
'                    where rf.role_id = m.owner_role_id',
'                        and rf.project_id = m.project_id',
'                        and rf.user_id = u.id',
'                        and upper(u.username) = upper(:P194_NAME)',
'            )',
'       )',
'    and ( :P194_MS_PROJECT is null or s.id = :P194_MS_PROJECT )',
'order by m.milestone_date, m.milestone_name, m.id'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_plug_query_num_rows=>5000
,p_plug_query_no_data_found=>'No open Milestones found'
,p_required_patch=>wwv_flow_imp.id(11756681878669227855)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'MILESTONE_DATE',
  'attribute_02', 'COLOR',
  'attribute_03', 'TITLE',
  'attribute_04', 'LINK',
  'attribute_05', 'PROJECT',
  'attribute_06', 'AI_OPEN',
  'attribute_07', 'MILESTONE_OWNER',
  'attribute_09', 'MILESTONE_DESCRIPTION',
  'attribute_11', 'DESCRIPTION3',
  'attribute_12', 'D',
  'attribute_13', 'MILESTONE_STATUS',
  'attribute_14', 'COLOR_LABEL')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14139548349397392589)
,p_name=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14139548736051392591)
,p_name=>'TITLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Title'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14139549228093392591)
,p_name=>'COLOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14139549771863392592)
,p_name=>'LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Link'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14139550739120392592)
,p_name=>'DESCRIPTION3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Description3'
,p_display_sequence=>70
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14139551309063392593)
,p_name=>'MILESTONE_DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Milestone description'
,p_display_sequence=>80
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14139551720744392593)
,p_name=>'MILESTONE_DATE'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Milestone date'
,p_display_sequence=>90
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14139552218011392595)
,p_name=>'MILESTONE_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>110
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14139552716612392596)
,p_name=>'MILESTONE_START_DATE'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Start'
,p_display_sequence=>130
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14139553254335392596)
,p_name=>'MILESTONE_OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Owner(s)'
,p_display_sequence=>150
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14139553773261392597)
,p_name=>'AI_OPEN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Open Action Items'
,p_display_sequence=>170
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15358144873298283825)
,p_name=>'COLOR_LABEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color label'
,p_display_sequence=>180
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(17985306194648865732)
,p_name=>'PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project'
,p_display_sequence=>190
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(14141046055805852957)
,p_name=>'My Open Projects'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h480:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select decode(s.parent_project_id,',
'        null, ''<a href="''',
'            ||apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||s.id)||''">''',
'            ||apex_escape.html(s.project)||''</a>'',',
'        ''<a href="''',
'            ||apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||s.id)',
'            ||''"><span class="child-project-marker">''||apex_escape.html(s.project)||''</span></a>'') project,',
'    c.status_short_desc status,',
'    (   select listagg(lower(u.username),'', '') within group',
'            (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'        from eba_proj_user_ref rf,',
'            eba_proj_status_users u,',
'            eba_proj_roles r',
'        where rf.project_id = s.id',
'            and rf.user_id = u.id',
'            and rf.role_id = r.id',
'            and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' ) as all_owners,',
'    (   select category from eba_proj_status_cats  cat where cat.id = s.cat_id) category,',
'    s.updated,',
'    s.id project_id',
'from eba_proj_status s,',
'    eba_proj_status_codes c',
'where c.id = s.project_status',
'    and c.is_closed_status != ''Y''',
'    and  s.project is not null',
'    --',
'    and exists (select null',
'                from eba_proj_user_ref rf,',
'                    eba_proj_status_users u',
'                where rf.project_id = s.id',
'                    and rf.user_id = u.id',
'                    and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'                    and upper(u.username) = upper(:P194_NAME))',
'order by greatest(s.updated,s.created) desc,',
'    s.project'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>25
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' '
,p_query_no_data_found=>'No projects found'
,p_query_more_data=>'Too many projects to display, please filter'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>100000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14141047495614852966)
,p_query_column_id=>1
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>2
,p_column_heading=>'Project'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14141048697459852969)
,p_query_column_id=>2
,p_column_alias=>'STATUS'
,p_column_display_sequence=>4
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14141049072664852970)
,p_query_column_id=>3
,p_column_alias=>'ALL_OWNERS'
,p_column_display_sequence=>5
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14141046710746852965)
,p_query_column_id=>4
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'&CAT_TITLE.'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14141047103023852965)
,p_query_column_id=>5
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>6
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14141047880756852967)
,p_query_column_id=>6
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2:P2_ID,P200_ID:#PROJECT_ID#,#PROJECT_ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'NEVER'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18023883827063252030)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(14138443290208006286)
,p_button_name=>'FILTER_AI'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'&P194_AI_FILTER.'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:128:&SESSION.::&DEBUG.:RP,128:P128_TYPE:AI'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18023883964759252031)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(14139547956093392584)
,p_button_name=>'FILTER_MS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'&P194_MS_FILTER.'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:128:&SESSION.::&DEBUG.:RP,128:P128_TYPE:MS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20289555642266214620)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(14138443290208006286)
,p_button_name=>'MASS_UPDATE_AIS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Mass Update'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:212:&SESSION.::&DEBUG.:RP,212:P212_PROJECT_ID:&P194_AI_PROJECT.'
,p_button_condition=>'P194_OPEN_AI_CNT'
,p_button_condition_type=>'ITEM_IS_NOT_ZERO'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20619520953937799332)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(14139547956093392584)
,p_button_name=>'MASS_UPDATE_MS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Mass Update'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:215:&SESSION.::&DEBUG.:RP,215:P215_PROJECT_ID:&P194_MS_PROJECT.'
,p_button_condition=>'P194_OPEN_MS_CNT'
,p_button_condition_type=>'ITEM_IS_NOT_ZERO'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14042366570019240438)
,p_name=>'P194_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(14042366496891240437)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18023882632934252018)
,p_name=>'P194_AI_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(14138443290208006286)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18023882750105252019)
,p_name=>'P194_MS_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(14139547956093392584)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18023884062492252032)
,p_name=>'P194_AI_FILTER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(14138443290208006286)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P194_AI_PROJECT is null then',
'        return ''Filter by Project'';',
'    else',
'        for c1 in ( select project',
'                    from eba_proj_status',
'                    where id = :P194_AI_PROJECT ) loop',
'            if length(c1.project) > 30 then',
'                return ''Filtered: ''||substr(c1.project,1,30)||''...'';',
'            else',
'                return ''Filtered: ''||c1.project;',
'            end if;',
'        end loop;',
'    end if;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18023884149863252033)
,p_name=>'P194_MS_FILTER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(14139547956093392584)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P194_MS_PROJECT is null then',
'        return ''Filter by Project'';',
'    else',
'        for c1 in ( select project',
'                    from eba_proj_status',
'                    where id = :P194_MS_PROJECT ) loop',
'            if length(c1.project) > 30 then',
'                return ''Filtered: ''||substr(c1.project,1,30)||''...'';',
'            else',
'                return ''Filtered: ''||c1.project;',
'            end if;',
'        end loop;',
'    end if;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20043309309050787348)
,p_name=>'P194_DISPLAY_USERNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(14042366496891240437)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20289555723278214621)
,p_name=>'P194_OPEN_AI_CNT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(14042366496891240437)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21048391677180075525)
,p_name=>'P194_OPEN_MS_CNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(14042366496891240437)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20289565841524214622)
,p_computation_sequence=>20
,p_computation_item=>'P194_OPEN_AI_CNT'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(a.id)',
'from eba_proj_status_ais a,',
'    eba_proj_status s,',
'    eba_proj_status_codes c',
'where a.project_id = s.id',
'    and s.project_status = c.id',
'    and c.is_closed_status != ''Y''',
'    and a.action_status = ''Open''',
'    and (( a.owner_role_id is null',
'        and (   upper(a.action_owner_01) = upper(:P194_NAME)',
'            or  upper(a.action_owner_02) = upper(:P194_NAME)',
'            or  upper(a.action_owner_03) = upper(:P194_NAME)',
'            or  upper(a.action_owner_04) = upper(:P194_NAME)',
'        )) or ( a.owner_role_id is not null',
'            and exists ( select null',
'                        from eba_proj_user_ref rf,',
'                            eba_proj_status_users u',
'                        where rf.role_id = a.owner_role_id',
'                            and rf.project_id = a.project_id',
'                            and rf.user_id = u.id',
'                            and upper(u.username) = upper(:P194_NAME) )',
'        )',
'    )',
'    and ( :P194_AI_PROJECT is null or s.id = :P194_AI_PROJECT )',
'order by a.due_date,',
'    lower(s.project)'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(21048391812878075526)
,p_computation_sequence=>30
,p_computation_item=>'P194_OPEN_MS_CNT'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(m.id)',
'from eba_proj_status_ms m,',
'    eba_proj_status s,',
'    eba_proj_status_codes c',
'where m.project_id = s.id',
'    and s.project_status = c.id',
'    and c.is_closed_status != ''Y''',
'    and m.milestone_status = ''Open''',
'    and (( m.owner_role_id is null',
'            and instr(upper(m.milestone_owner), upper(:P194_NAME)) > 0 )',
'        or',
'            exists ( select null',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u',
'                    where rf.role_id = m.owner_role_id',
'                        and rf.project_id = m.project_id',
'                        and rf.user_id = u.id',
'                        and upper(u.username) = upper(:P194_NAME)',
'            )',
'       )',
'    and ( :P194_MS_PROJECT is null or s.id = :P194_MS_PROJECT )'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(14042366722221240440)
,p_computation_sequence=>10
,p_computation_item=>'P194_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'lower(:APP_USER)'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20043309398202787349)
,p_computation_sequence=>10
,p_computation_item=>'P194_DISPLAY_USERNAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'eba_proj_fw.get_name_from_email_address(:APP_USER)'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(17985306383654865734)
,p_computation_sequence=>20
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14042365900134240431)
,p_name=>'Lookup New User'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P194_USER'
,p_condition_element=>'P194_USER'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14042365939175240432)
,p_event_id=>wwv_flow_imp.id(14042365900134240431)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15010740921835268027)
,p_name=>'Update Action Items'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(14138443290208006286)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15010741066611268028)
,p_event_id=>wwv_flow_imp.id(15010740921835268027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(14138443290208006286)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15010741157885268029)
,p_name=>'Refresh Milestones'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(14139547956093392584)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15010741259167268030)
,p_event_id=>wwv_flow_imp.id(15010741157885268029)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(14139547956093392584)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3367292145135834190)
,p_name=>'Refresh on Issue Edit'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(3367290924956834178)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3367292216410834191)
,p_event_id=>wwv_flow_imp.id(3367292145135834190)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3367290924956834178)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
