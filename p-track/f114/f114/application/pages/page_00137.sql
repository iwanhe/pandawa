prompt --application/pages/page_00137
begin
--   Manifest
--     PAGE: 00137
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
 p_id=>137
,p_name=>'User Profile Page'
,p_step_title=>'&P137_DISPLAY_NAME.''s Profile'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.timeline-edit-links .t-StatusList-editLink { position: absolute; right: 8px; top: 8px; font-size: 12px; line-height: 16px; float: right; padding: 4px 8px }',
'.timeline-edit-links .t-StatusList-itemBody { position: relative }',
'.timeline-edit-links .t-StatusList-item { border-bottom: 1px solid rgba(0, 0, 0, .05) }',
'.timeline-edit-links .t-StatusList-item:last-child { border-bottom: none }',
'.profile-block {',
'  padding: 12px;',
'}',
'.profile-photo-wrap {margin-bottom: 12px; border-bottom: 1px solid rgba(0,0,0,.1); padding-bottom: 12px;}',
'.profile-photo {',
'    border-radius: 2px;',
'    background-size: cover;',
'    background-position: 50%;',
'    width: 100%;',
'    padding-bottom: 100%;',
'    display: block;',
'}',
'.profile-intro {',
'    font-size: 14px;',
'    display: block;',
'    margin-bottom: 12px;',
'    line-height: 1.5;',
'}',
'span.profile-name {',
'    font-weight: bold;',
'    display: block;',
'    margin-bottom: 8px;',
'    font-size: 16px;',
'    line-height: 20px;',
'}',
'.floating-rds.is-stuck {',
'    background: white;',
'    box-shadow: 0 2px 2px 0px rgba(0,0,0,.25);',
'}',
'.region-filters {',
'    border-bottom: 1px solid rgba(0,0,0,.05);',
'}',
'',
'.t-Body-contentInner .col {min-height: 0;}',
'',
'.involvement-user-role {display: block;}',
'.involvement-project-name,',
'.involvement-user-role {',
'    font-weight: bold;',
'}',
'.involvement-pct {white-space: nowrap;}',
'.small-profile-photo { display: block; width: 32px; height: 32px; background-size: cover; background-repeat: no-repeat; border-radius: 100%; box-shadow: 0 0 0 1px rgba(0, 0, 0, .1) inset; }',
'.t-Comments-userIcon.comment-user-has-photo {',
'    border-width: 0;',
'}',
'#PROJECT a {',
'    margin-left: 12px;',
'    font-weight:bold;',
'}'))
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'The User Profile Page allows you to see all relevant information about a given user in one easy to use screen. '
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(4036795412189725287)
,p_name=>'Issues'
,p_region_name=>'issues_region'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'timeline-edit-links'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--hideHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--horizontalBorders'
,p_region_attributes=>'style="display: none;"'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'    project_id,',
'    issue,',
'    case when owner_role_id is null then',
'        issue_owner',
'    else',
'        nvl((select r.name||'': ''||listagg(lower(u.username),'', '')',
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
'    issue_level,',
'    case when is_open = ''N'' then',
'            ''Black''',
'        else',
'            ''Green''',
'    end as color,',
'    decode(is_open,''Y'',''<span class="t-Badge t-Badge--basic t-Badge--xsmall is-success">Open</span>'',''N'',''<span class="t-Badge t-Badge--basic t-Badge--xsmall is-complete">Closed</span>'',is_open) open,',
'    link_01 link,',
'    lower(created_by) created_by,',
'    updated,',
'    (   select project',
'        from eba_proj_status x',
'        where x.id = i.project_id) project,',
'    case when eba_proj_fw.is_edit_authorized(',
'            p_username   => upper(:APP_USER),',
'            p_project_id => i.project_id ) = ''Y'' then',
'        ''<a href="''',
'          ||apex_util.prepare_url(',
'              p_url => ''f?p=''||:APP_ID||'':24:''||:APP_SESSION||'':::24:P24_ID:''||i.id,',
'          p_triggering_element => ''$(''''#issues_region'''')'')||''"',
'         >Edit</a>''',
'    else',
'        null',
'    end as description3,',
'    issue_detail',
'from eba_proj_status_issues i',
'where (( i.owner_role_id is null and lower(i.issue_owner) = lower(:P137_USERNAME))',
'        or ( i.owner_role_id is not null',
'            and exists (select null',
'                        from eba_proj_user_ref rf,',
'                            eba_proj_status_users u',
'                        where rf.role_id = i.owner_role_id',
'                            and rf.project_id = i.project_id',
'                            and u.id = rf.user_id',
'                            and lower(u.username) = lower(:P137_USERNAME)) ))',
'    and ( ( :P137_SHOW_CLOSED_ISSUES = ''OPEN''',
'                and is_open = ''Y'' )',
'            or ( :P137_SHOW_CLOSED_ISSUES = ''ALL''',
'               and is_open in (''Y'',''N'') )',
'        )',
'    and ( ( nvl(:P137_SHOW_L1_ISSUES,''ALL'') = ''1''',
'                and issue_level = ''1'' )',
'            or ( nvl(:P137_SHOW_L2_ISSUES,''ALL'') = ''2''',
'                and issue_level = ''2'' )',
'            or ( nvl(:P137_SHOW_L3_ISSUES,''ALL'') = ''3''',
'                and issue_level = ''3'' )',
'            or ( nvl(:P137_SHOW_L4_ISSUES,''ALL'') = ''4''',
'                and issue_level = ''4'' )',
'            or ( nvl(:P137_SHOW_L1_ISSUES,''ALL'') = ''ALL''',
'                and nvl(:P137_SHOW_L2_ISSUES,''ALL'') = ''ALL''',
'                and nvl(:P137_SHOW_L3_ISSUES,''ALL'') = ''ALL''',
'                and nvl(:P137_SHOW_L4_ISSUES,''ALL'') = ''ALL''',
'                and issue_level in (''1'',''2'',''3'',''4'') )',
'        )',
'    and nvl(:P137_SHOW_REGION,''X'') = ''ISSUES''',
'order by project asc, i.is_open desc, issue_level, upper(issue)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SHOW_CLOSED_ISSUES,P137_SHOW_L1_ISSUES,P137_SHOW_REGION'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>200
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_break_cols=>'1'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'REPEAT_HEADINGS_ON_BREAK_1'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(7563953019503314303)
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from EBA_PROJ_STATUS_ISSUES l',
'where ( l.project_id = :P200_ID ',
'        or (nvl(:P200_INC_CHILD,''N'') = ''Y'' and ',
'            l.project_id in (select s.id ',
'                             from EBA_PROJ_STATUS s',
'                             where s.parent_project_id = :P200_ID))',
'    )'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078537262971325554)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078537345840325555)
,p_query_column_id=>2
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078537475247325556)
,p_query_column_id=>3
,p_column_alias=>'ISSUE'
,p_column_display_sequence=>4
,p_column_heading=>'Issue'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078537545283325557)
,p_query_column_id=>4
,p_column_alias=>'ISSUE_OWNER'
,p_column_display_sequence=>6
,p_column_heading=>'Issue Owner'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078537682974325558)
,p_query_column_id=>5
,p_column_alias=>'ISSUE_LEVEL'
,p_column_display_sequence=>7
,p_column_heading=>'Issue Level'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078537735171325559)
,p_query_column_id=>6
,p_column_alias=>'COLOR'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078537858303325560)
,p_query_column_id=>7
,p_column_alias=>'OPEN'
,p_column_display_sequence=>9
,p_column_heading=>'Open'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078537997946325561)
,p_query_column_id=>8
,p_column_alias=>'LINK'
,p_column_display_sequence=>10
,p_column_heading=>'Link'
,p_column_link=>'&LINK.'
,p_column_linktext=>'#LINK#'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status_issues i',
'where (( i.owner_role_id is null and lower(i.issue_owner) = lower(:P137_USERNAME))',
'        or ( i.owner_role_id is not null',
'            and exists (select null',
'                        from eba_proj_user_ref rf,',
'                            eba_proj_status_users u',
'                        where rf.role_id = i.owner_role_id',
'                            and rf.project_id = i.project_id',
'                            and u.id = rf.user_id',
'                            and lower(u.username) = lower(:P137_USERNAME)) ))',
'    and ( ( :P137_SHOW_CLOSED_ISSUES_1 = ''OPEN''',
'                and is_open = ''Y'' )',
'            or ( :P137_SHOW_CLOSED_ISSUES_1 = ''ALL''',
'               and is_open in (''Y'',''N'') )',
'        )',
'    and ( ( :P137_SHOW_CRITICAL_ISSUES_1 = ''12''',
'                and issue_level in (''1'',''2'') )',
'            or ( :P137_SHOW_CRITICAL_ISSUES_1 = ''ALL'' ',
'                and nvl(issue_level,''4'') in (''1'',''2'',''3'',''4'') )',
'        )',
'    and nvl(:P137_SHOW_REGION,''X'') = ''ISSUES''',
'    and i.link_01 is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078538092970325562)
,p_query_column_id=>9
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>11
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078538155909325563)
,p_query_column_id=>10
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>12
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078538357380325565)
,p_query_column_id=>11
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>1
,p_column_heading=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP:P200_ID:#PROJECT_ID##projectIssues'
,p_column_linktext=>'#PROJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078538496486325566)
,p_query_column_id=>12
,p_column_alias=>'DESCRIPTION3'
,p_column_display_sequence=>13
,p_column_heading=>'Edit'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4078538579412325567)
,p_query_column_id=>13
,p_column_alias=>'ISSUE_DETAIL'
,p_column_display_sequence=>5
,p_column_heading=>'Issue detail'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status_issues i',
'where (( i.owner_role_id is null and lower(i.issue_owner) = lower(:P137_USERNAME))',
'        or ( i.owner_role_id is not null',
'            and exists (select null',
'                        from eba_proj_user_ref rf,',
'                            eba_proj_status_users u',
'                        where rf.role_id = i.owner_role_id',
'                            and rf.project_id = i.project_id',
'                            and u.id = rf.user_id',
'                            and lower(u.username) = lower(:P137_USERNAME)) ))',
'    and ( ( :P137_SHOW_CLOSED_ISSUES_1 = ''OPEN''',
'                and is_open = ''Y'' )',
'            or ( :P137_SHOW_CLOSED_ISSUES_1 = ''ALL''',
'               and is_open in (''Y'',''N'') )',
'        )',
'    and ( ( :P137_SHOW_CRITICAL_ISSUES_1 = ''12''',
'                and issue_level in (''1'',''2'') )',
'            or ( :P137_SHOW_CRITICAL_ISSUES_1 = ''ALL'' ',
'                and nvl(issue_level,''4'') in (''1'',''2'',''3'',''4'') )',
'        )',
'    and nvl(:P137_SHOW_REGION,''X'') = ''ISSUES''',
'    and i.issue_detail is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6729525177252620271)
,p_plug_name=>'Hidden Items'
,p_plug_display_sequence=>110
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6729525628042635733)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>90
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6729747880772276778)
,p_name=>'Projects'
,p_region_name=>'projects_region'
,p_template=>wwv_flow_imp.id(6672346928802369862)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--desc-4ln:u-colors:t-Cards--displayInitials:t-Cards--3cols:t-Cards--basic:t-Cards--animColorFill'
,p_region_attributes=>'style="display: none;"'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'      s.PROJECT  card_title, ',
'      apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||s.id) card_link,',
'      null card_icon,',
'      null card_modifiers,',
'      --',
'      rtrim(decode(s.parent_project_id,null,null,',
'      (select ''Parent (''||project ||'') '' x from eba_proj_status p where p.id = s.parent_project_id))||',
'     nvl(eba_proj_fw.get_project_rowkey(p_project_id => s.id), s.row_key) ||'', ''||',
'     c.status_short_desc||'', ''||',
'     nvl(s.description ,s.goal), '' ,'')',
'     card_text,',
'     --',
'    decode(eba_proj_stat_ui.is_project_open(s.id), 0, ''Closed'', 1, ''Open'') ||'', ''',
'        ||( select listagg(lower(u.username),'', '') within group',
'                (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.project_id = s.id',
'                and rf.user_id = u.id',
'                and rf.role_id = r.id',
'                and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' ) as card_subtext,',
'       upper(',
'          decode(instr(s.PROJECT,'' ''),',
'                 0, ',
'                 substr(s.PROJECT,1,2),',
'                 substr(s.PROJECT,1,1)||substr(s.PROJECT,instr(s.PROJECT,'' '')+1,1)',
'           ))  card_initials,',
'    s.CREATED,',
'    s.CREATED_BY,',
'    nvl(s.UPDATED,s.created) updated,',
'    s.UPDATED_BY,',
'    tags',
'from EBA_PROJ_STATUS s,',
'     eba_proj_status_codes c',
'where c.id(+) = s.PROJECT_STATUS and ',
'      s.project is not null',
'    --',
'    and exists (select null',
'                from eba_proj_user_ref rf,',
'                    eba_proj_status_users u,',
'                    eba_proj_roles r',
'                where rf.project_id = s.id',
'                    and rf.user_id = u.id',
'                    and lower(u.username) = lower(:P137_USERNAME)',
'                    and rf.role_id = r.id',
'                    and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' )',
'    and nvl(:P137_SHOW_REGION,''X'') = ''PROJECTS''',
'order by  to_char(greatest(s.updated,s.created),''YYYYMMDDHH24MISS'') desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SHOW_REGION'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6726044247164908098)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Projects found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6729749165909276782)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6729748443340276782)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Card link'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6729748567320276782)
,p_query_column_id=>3
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>3
,p_column_heading=>'Card icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6729748655945276782)
,p_query_column_id=>4
,p_column_alias=>'CARD_MODIFIERS'
,p_column_display_sequence=>4
,p_column_heading=>'Card modifiers'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6729748725134276782)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>5
,p_column_heading=>'Card text'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6729748859819276782)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>6
,p_column_heading=>'Card subtext'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6729748936674276782)
,p_query_column_id=>7
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>7
,p_column_heading=>'Card initials'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6729749027164276782)
,p_query_column_id=>8
,p_column_alias=>'CREATED'
,p_column_display_sequence=>8
,p_column_heading=>'Created'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6729748038665276782)
,p_query_column_id=>9
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>9
,p_column_heading=>'Created by'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6729748151281276782)
,p_query_column_id=>10
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>10
,p_column_heading=>'Updated'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6729748184717276782)
,p_query_column_id=>11
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>11
,p_column_heading=>'Updated by'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6729748378158276782)
,p_query_column_id=>12
,p_column_alias=>'TAGS'
,p_column_display_sequence=>12
,p_column_heading=>'Tags'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6729749621005286239)
,p_plug_name=>'Region Display Selector'
,p_region_name=>'profile_rds'
,p_region_css_classes=>'floating-rds'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'NO')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6729810911791585445)
,p_plug_name=>'Summary'
,p_region_name=>'summary_region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Open Projects'' Label,',
'    to_char(count(*),''999G999G990'') projects,',
'    ''#projects'' link',
'from eba_proj_status p,',
'    eba_proj_user_ref rf,',
'    eba_proj_status_users u,',
'    eba_proj_roles r,',
'    eba_proj_status_codes sc',
'where rf.project_id = p.id',
'    and rf.user_id = u.id',
'    and rf.role_id = r.id',
'    and u.id = :P137_ID',
'    and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'    and sc.id = p.project_status',
'    and sc.is_closed_status = ''N''',
'union all',
'select ''Open Action Items'' label,',
'    to_char(count(*),''999G999G990'') action_items,',
'    ''#action_items'' link',
'from eba_proj_status_ais a,',
'    eba_proj_status p,',
'    eba_proj_status_codes sc',
'where ( (   a.owner_role_id is null',
'            and ( lower(a.action_owner_01) = lower(:P137_USERNAME)',
'                or lower(a.action_owner_02) = lower(:P137_USERNAME)',
'                or lower(a.action_owner_03) = lower(:P137_USERNAME)',
'                or lower(a.action_owner_04) = lower(:P137_USERNAME) ))',
'        or exists ( select null',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u',
'                    where rf.role_id = a.owner_role_id',
'                        and rf.project_id = a.project_id',
'                        and u.id = rf.user_id',
'                        and lower(u.username) = lower(:P137_USERNAME) ))',
'    and apex_util.get_build_option_status(',
'        p_application_id => :APP_ID,',
'        p_build_option_name => ''Project Action Items''',
'    ) = ''INCLUDE''',
'    and a.action_status = ''Open''',
'    and p.id = a.project_id',
'    and sc.id = p.project_status',
'    and sc.is_closed_status = ''N''',
'union all',
'select ''Open Milestones'' label,',
'    to_char(count(*),''999G999G990'') milestones,',
'    ''#milestones'' link',
'from eba_proj_status_ms m,',
'    eba_proj_status p,',
'    eba_proj_status_codes sc',
'where (( m.owner_role_id is null',
'            and lower(m.milestone_owner) = lower(:P137_USERNAME) )',
'        or exists ( select null',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u',
'                    where rf.role_id = m.owner_role_id',
'                        and rf.project_id = m.project_id',
'                        and u.id = rf.user_id',
'                        and lower(u.username) = lower(:P137_USERNAME) ))',
'    and apex_util.get_build_option_status(',
'        p_application_id => :APP_ID,',
'        p_build_option_name => ''Project Milestones''',
'    ) = ''INCLUDE''',
'    and m.milestone_status = ''Open''',
'    and p.id = m.project_id',
'    and sc.id = p.project_status',
'    and sc.is_closed_status = ''N''',
'union all',
'select ''Involvement Level'' label,',
'    to_char(sum(nvl(percentage,0)),''999G999G990'')||'' %'' involvement,',
'    ''#involvement'' link',
'from eba_proj_user_ref rf,',
'    eba_proj_roles r,',
'    eba_proj_status_users u,',
'    eba_proj_status p,',
'    eba_proj_status_codes sc,',
'    eba_proj_involvement_levels il',
'where u.id = :P137_ID',
'    and rf.project_id = p.id',
'    and rf.user_id = u.id',
'    and rf.role_id = r.id',
'    and il.id = rf.involvement_level_id',
'    and apex_util.get_build_option_status(',
'        p_application_id => :APP_ID,',
'        p_build_option_name => ''Project User Involvement''',
'    ) = ''INCLUDE''',
'    and sc.id = p.project_status',
'    and sc.is_closed_status = ''N''',
'union all',
'select ''Open Issues'' label,',
'    to_char(count(*),''999G999G990'') issues,',
'    ''#issues'' link',
'from eba_proj_status_issues i,',
'    eba_proj_status p,',
'    eba_proj_status_codes sc',
'where nvl(i.is_open,''Y'') = ''Y''',
'    and (( i.owner_role_id is null and lower(i.issue_owner) = lower(:P137_USERNAME))',
'        or ( i.owner_role_id is not null',
'            and exists (select null',
'                        from eba_proj_user_ref rf,',
'                            eba_proj_status_users u',
'                        where rf.role_id = i.owner_role_id',
'                            and rf.project_id = i.project_id',
'                            and u.id = rf.user_id',
'                            and lower(u.username) = lower(:P137_USERNAME)) ))',
'    and apex_util.get_build_option_status(',
'        p_application_id => :APP_ID,',
'        p_build_option_name => ''Project Issues''',
'    ) = ''INCLUDE''',
'    and p.id = i.project_id',
'    and sc.id = p.project_status',
'    and sc.is_closed_status = ''N''',
'union all',
'select ''Status Reports'' label,',
'    to_char(count(*),''999G999G990'') reports,',
'    ''#status_reports'' link',
'from eba_proj_status_rpts u,',
'     eba_proj_status p',
'where u.project_id = p.id',
'    and u.update_owner = lower(:P137_USERNAME)',
'    and (( u.viewable_by = ''Submitter and Project Members''',
'               and exists ( select null',
'                            from eba_proj_user_ref rf,',
'                                eba_proj_status_users usr',
'                            where rf.project_id = p.id',
'                                and rf.user_id = usr.id',
'                                and lower(usr.username) = lower(:APP_USER)',
'                                and eba_proj_fw.is_edit_authorized( usr.username, rf.project_id ) = ''Y'' ))',
'        or',
'            u.viewable_by = ''All''',
'        )',
'    and apex_util.get_build_option_status(',
'        p_application_id => :APP_ID,',
'        p_build_option_name => ''Project Status Reports''',
'    ) = ''INCLUDE''',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LABEL',
  'attribute_02', 'PROJECTS',
  'attribute_04', '&LINK.',
  'attribute_05', '3',
  'attribute_07', 'BOX',
  'attribute_08', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6768103965912011060)
,p_plug_name=>'Action Items'
,p_region_name=>'action_items_region'
,p_region_css_classes=>'timeline-edit-links'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_region_attributes=>'style="display: none;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id,',
'    a.action title,',
'    case when a.action_status = ''Closed'' then ''Black''',
'        when trunc(a.due_date) < trunc(sysdate) then ''Red''',
'        when trunc(a.due_date) = trunc(sysdate) then ''Yellow''',
'        else ''Green''',
'    end as color,',
'    case when a.ACTION_STATUS = ''Closed'' then',
'            ''Closed''',
'        when trunc(a.due_date) < trunc(sysdate) then',
'            ''Past Due''',
'        when trunc(a.due_date) = trunc(sysdate) then',
'            ''Due Today''',
'        else',
'            ''Due In The Future''',
'    end as color_label,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':78:''||:APP_SESSION',
'        ||'':::78:P78_ACTION_ITEM_ID,P200_ID:''',
'        ||a.id||'',''||s.id) link,',
'    decode(parent_project_id,null,null,',
'        ''Parent Project: ''||(   select project d',
'                                from eba_proj_status',
'                                where id = s.parent_project_id)) parent_project,',
'    s.project,',
'    a.action_description,',
'    a.action_status status,',
'    a.due_date due_date,',
'    case when a.owner_role_id is null then',
'        a.action_owner_01',
'            ||decode(a.action_owner_02,null,null,'', ''||a.action_owner_02)',
'            ||decode(a.action_owner_03,null,null,'', ''||a.action_owner_03)',
'            ||decode(a.action_owner_04,null,null,'', ''||a.action_owner_04)',
'    else',
'        nvl((select r.name||'': ''||listagg(lower(u.username),'', '')',
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
'              p_triggering_element => ''$(''''#action_items_region'''')'')',
'          ||''" class="t-StatusList-editLink">Edit</a>''',
'    else',
'        null',
'    end as edit_link',
'from eba_proj_status_ais a,',
'    eba_proj_status s,',
'    eba_proj_status_codes c',
'where a.project_id = s.id',
'   and ( ( nvl(:P137_SHOW_CLOSED_AIS,''OPEN'') = ''OPEN''',
'            and upper(a.action_status) = ''OPEN'' )',
'        or ( :P137_SHOW_CLOSED_AIS = ''ALL''',
'            and upper(a.action_status) in (''OPEN'',''CLOSED'') )',
'    )',
'    and s.project_status = c.id (+)',
'    and (( a.owner_role_id is null',
'        and ( lower(a.action_owner_01) = lower(:P137_USERNAME)',
'            or lower(a.action_owner_02) = lower(:P137_USERNAME)',
'            or lower(a.action_owner_03) = lower(:P137_USERNAME)',
'            or lower(a.action_owner_04) = lower(:P137_USERNAME) )',
'        )',
'        or exists ( select null',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u',
'                    where rf.role_id = a.owner_role_id',
'                        and rf.project_id = a.project_id',
'                        and u.id = rf.user_id',
'                        and lower(u.username) = lower(:P137_USERNAME) )',
'    )',
'    and nvl(:P137_SHOW_REGION,''X'') = ''ACTION_ITEMS''',
'order by case when nvl(:P137_SHOW_CLOSED_AIS,''OPEN'') = ''OPEN'' then a.due_date end asc, ',
'    case when :P137_SHOW_CLOSED_AIS = ''ALL'' then to_char(a.due_date,''YYYYMMDDHH24MI'') end desc nulls last'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_ajax_items_to_submit=>'P137_SHOW_CLOSED_AIS,P137_SHOW_REGION'
,p_plug_query_num_rows=>5000
,p_plug_query_no_data_found=>'No Action Items found.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'DUE_DATE',
  'attribute_02', 'COLOR',
  'attribute_03', 'TITLE',
  'attribute_04', 'LINK',
  'attribute_05', 'PROJECT',
  'attribute_06', 'OWNER',
  'attribute_09', 'ACTION_DESCRIPTION',
  'attribute_11', 'EDIT_LINK',
  'attribute_12', 'D',
  'attribute_13', 'STATUS',
  'attribute_14', 'COLOR_LABEL')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768104061151011061)
,p_name=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768104094121011062)
,p_name=>'TITLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Title'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768104260677011063)
,p_name=>'COLOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768104284321011064)
,p_name=>'LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Link'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768104421047011065)
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
 p_id=>wwv_flow_imp.id(6768104545128011066)
,p_name=>'PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project'
,p_display_sequence=>60
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768104791931011069)
,p_name=>'ACTION_DESCRIPTION'
,p_data_type=>'CLOB'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Action description'
,p_display_sequence=>90
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768105043112011071)
,p_name=>'STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>110
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768105201230011073)
,p_name=>'DUE_DATE'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Due date'
,p_display_sequence=>130
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768105420861011075)
,p_name=>'OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Owner(s)'
,p_display_sequence=>150
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768105575974011076)
,p_name=>'ROW_KEY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Row key'
,p_display_sequence=>160
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15010743640451268054)
,p_name=>'EDIT_LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Edit link'
,p_display_sequence=>180
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15358144623204283823)
,p_name=>'COLOR_LABEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color label'
,p_display_sequence=>170
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6768921687342632463)
,p_plug_name=>'Milestones'
,p_region_name=>'milestones_region'
,p_region_css_classes=>'timeline-edit-links'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_region_attributes=>'style="display: none;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select m.id,',
'    m.milestone_name title,',
'    case when m.milestone_status = ''Completed'' then',
'            ''Black''',
'        when trunc(m.milestone_date) < trunc(current_date) then',
'            ''Red''',
'        when trunc(m.milestone_date) = trunc(current_date) then',
'            ''Yellow''',
'        else',
'            ''Green''',
'    end as color,',
'    case when trunc(m.milestone_date) < trunc(sysdate) and nvl(m.milestone_status,''Completed'') = ''Completed'' then',
'            ''Closed''',
'        when trunc(m.milestone_date) < trunc(sysdate) and nvl(m.milestone_status,''Completed'') != ''Completed'' then',
'            ''Past Due''',
'        when trunc(m.milestone_date) = trunc(sysdate) and nvl(m.milestone_status,''Completed'') != ''Completed'' then',
'            ''Due Today''',
'        when trunc(m.milestone_date) > trunc(sysdate) and nvl(m.milestone_status,''Completed'') != ''Completed'' then',
'            ''Due In The Future''',
'    end as color_label,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':107:''||:APP_SESSION',
'        ||'':::107:P107_ID,P107_PROJECT_ID,P200_ID:''',
'        ||m.id||'',''||m.project_id||'',''||m.project_id) link,',
'    p.project,',
'    case when eba_proj_fw.is_edit_authorized(',
'        p_username   => upper(:APP_USER),',
'        p_project_id => m.project_id ) = ''Y'' then',
'        decode(nvl(is_major_yn,''N''),''Y'',''<b>MAJOR MILESTONE</b>'',null) || ',
'        ''<a href="''',
'          ||apex_util.prepare_url(',
'              p_url => ''f?p=''||:APP_ID||'':48:''||:APP_SESSION||'':::48:P48_ID:''||m.id,',
'              p_triggering_element => ''$(''''#milestones_region'''')'')',
'          ||''" class="t-StatusList-editLink">Edit</a>''',
'    else',
'        decode(nvl(is_major_yn,''N''),''Y'',''<b>MAJOR MILESTONE</b>'',null)',
'    end as description3,',
'    milestone_description,',
'    milestone_date,',
'    milestone_status,',
'    to_char(milestone_start_date,''Month fmDD, fmYYYY'') milestone_start_date,',
'    case when owner_role_id is null then',
'        milestone_owner',
'    else',
'        nvl((select r.name||'': ''||listagg(lower(u.username),'', '')',
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
'    nvl((select count(*) from eba_proj_status_ais a where a.milestone_id = m.id and a.action_status = ''Open''),0)',
'        ||'' Open Action Items'' ai_open',
'from eba_proj_status_ms m,',
'    eba_proj_status p,',
'    eba_proj_status_codes s',
'where p.id = m.project_id',
'    and p.project_status = s.id(+)',
'    and ( ( nvl(:P137_SHOW_CLOSED_MS,''OPEN'') = ''OPEN''',
'                and upper(m.milestone_status) = ''OPEN'' )',
'            or ( :P137_SHOW_CLOSED_MS = ''ALL''',
'               and upper(m.milestone_status) in (''OPEN'',''COMPLETED'') )',
'      )',
'    and (( m.owner_role_id is null',
'            and lower(m.milestone_owner) = lower(:P137_USERNAME) )',
'        or exists ( select null',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u',
'                    where rf.role_id = m.owner_role_id',
'                        and rf.project_id = m.project_id',
'                        and u.id = rf.user_id',
'                        and lower(u.username) = lower(:P137_USERNAME) )',
'    )',
'    and nvl(:P137_SHOW_REGION,''X'') = ''MILESTONES''',
'order by case when nvl(:P137_SHOW_CLOSED_MS,''OPEN'') = ''OPEN'' then m.milestone_date end asc, ',
'         case when :P137_SHOW_CLOSED_MS = ''ALL'' then to_char(m.milestone_date,''YYYYMMDD'') end desc',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_ajax_items_to_submit=>'P137_SHOW_CLOSED_MS,P137_SHOW_REGION'
,p_plug_query_num_rows=>15
,p_plug_query_no_data_found=>'No Milestones found.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'MILESTONE_DATE',
  'attribute_02', 'COLOR',
  'attribute_03', 'TITLE',
  'attribute_04', 'LINK',
  'attribute_05', 'PROJECT',
  'attribute_06', 'MILESTONE_OWNER',
  'attribute_07', 'MILESTONE_START_DATE',
  'attribute_09', 'MILESTONE_DESCRIPTION',
  'attribute_11', 'DESCRIPTION3',
  'attribute_12', 'D',
  'attribute_13', 'MILESTONE_STATUS',
  'attribute_14', 'COLOR_LABEL')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768921842378632464)
,p_name=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768921901812632465)
,p_name=>'TITLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Title'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768922033237632466)
,p_name=>'COLOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768922151998632467)
,p_name=>'LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Link'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768922194896632468)
,p_name=>'PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project'
,p_display_sequence=>50
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768922468156632470)
,p_name=>'DESCRIPTION3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Description3'
,p_display_sequence=>70
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768922528409632471)
,p_name=>'MILESTONE_DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Milestone description'
,p_display_sequence=>80
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768922657183632472)
,p_name=>'MILESTONE_DATE'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Milestone date'
,p_display_sequence=>90
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768922838220632474)
,p_name=>'MILESTONE_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>110
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768923056283632476)
,p_name=>'MILESTONE_START_DATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Start'
,p_display_sequence=>130
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768923273172632478)
,p_name=>'MILESTONE_OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Owner(s)'
,p_display_sequence=>150
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768923438441632480)
,p_name=>'AI_OPEN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Open Action Items'
,p_display_sequence=>170
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15358144737243283824)
,p_name=>'COLOR_LABEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color label'
,p_display_sequence=>180
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7468761767738916437)
,p_plug_name=>'Project Views'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_region_attributes=>'style="display: none;"'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6729756331275461540)
,p_plug_name=>'Project Views'
,p_parent_plug_id=>wwv_flow_imp.id(7468761767738916437)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>80
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    NVL((select project from eba_proj_status p where p.id = c.project_id),''UNKNOWN'') project,',
'    PROJECT_ID,',
'    max(VIEW_TIMESTAMP) view_timestamp,',
'    count(*) total_views',
'from EBA_PROJ_STATUS_CLICKS c',
'where upper(:P137_USERNAME) = app_username',
'group by project_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6729756396757461540)
,p_name=>'Project Views'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'MIKE'
,p_internal_uid=>1533529714497844782
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6729756703270461555)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Project ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6729756921283461555)
,p_db_column_name=>'VIEW_TIMESTAMP'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Last View'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6729758397718481990)
,p_db_column_name=>'PROJECT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6729758711294495806)
,p_db_column_name=>'TOTAL_VIEWS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Total Views'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6729757215289461761)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'15335306'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT:VIEW_TIMESTAMP:TOTAL_VIEWS'
,p_sort_column_1=>'TOTAL_VIEWS'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'VIEW_TIMESTAMP'
,p_sort_direction_2=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15213083717779322315)
,p_plug_name=>'Profile'
,p_region_css_classes=>'profile-block'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>100
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_country eba_proj_countries.country_name%type;',
'    l_region  eba_proj_regions.region_name%type;',
'begin',
'    sys.htp.p(''<div class="profile-photo-wrap">'');',
'    sys.htp.p(''<span class="profile-photo" style="background-image: url(''''''',
'        ||apex_util.prepare_url(''f?p=''||:APP_ID||''.:IMAGE:''||:APP_SESSION||''::::GET_ID:''',
'              ||apex_escape.html(:P137_USERNAME))',
'        ||'''''');"></span>'');',
'    sys.htp.p(''</div>'');',
'',
'    for c1 in (',
'      select id, ',
'             first_name ||'' ''||last_name full_name,',
'             email_address,',
'             NOTE,',
'             ACCESS_LEVEL_ID,',
'             PHONE_01,',
'             PHONE_02,',
'             title,',
'             address,',
'             home_timezone,',
'             country_id,',
'             region_id,',
'             team_groups,',
'             skillsets,',
'             hippa_cert_date,',
'             bg_checks,',
'             assistant_name,',
'             assistant_phone',
'        from eba_proj_status_users',
'       where username = upper(:P137_USERNAME)',
'    )',
'    loop',
'        sys.htp.p(''<span class="profile-intro">'');',
'',
'        if c1.title is not null then',
'            sys.htp.p(''<span class="profile-name">''||apex_escape.html(c1.full_name)||''<br><small>''||apex_escape.html(c1.title)||''</small></span>'');',
'        else',
'            sys.htp.p(''<span class="profile-name">''||apex_escape.html(c1.full_name)||''</span>'');',
'        end if;',
'',
'        sys.htp.p(''<span class="profile-text">''||apex_escape.html(c1.note)||''</span>'');',
'        sys.htp.p(''</span>'');',
'',
'        if c1.email_address is not null then',
'            sys.htp.p(''<span class="profile-attr"><span class="t-Icon fa fa-envelope-o"></span> <a href="mailto:''',
'                ||apex_escape.html(c1.email_address)||''">''||apex_escape.html(c1.email_address)||''</a></span>'');',
'        end if;',
'',
'        if c1.phone_01 is not null then',
'            sys.htp.p(''<br><span class="profile-attr"><span class="t-Icon fa fa-phone"></span> ''||apex_escape.html(c1.phone_01)||''</span>'');',
'        end if;',
'',
'        if c1.phone_02 is not null then',
'            sys.htp.p(''<br><span class="profile-attr"><span class="t-Icon fa fa-phone"></span> ''||apex_escape.html(c1.phone_02)||''</span>'');',
'        end if;',
'',
'        if c1.address is not null then',
'            sys.htp.p(''<br><span class="profile-attr"><span class="t-Icon fa fa-home"></span> ''||apex_escape.html(c1.address)||''</span>'');',
'        end if;',
'',
'        if c1.country_id is not null and c1.region_id is not null then',
'            select country_name into l_country from eba_proj_countries where id = c1.country_id;',
'            select region_name into l_region from eba_proj_regions where id = c1.region_id;',
'            sys.htp.p(''<br><span class="profile-attr"><span class="t-Icon fa fa-globe"></span> ''||apex_escape.html(l_country)||'' (''||apex_escape.html(l_region)||'')</span>'');',
'        elsif c1.country_id is not null and c1.region_id is null then',
'            select country_name into l_country from eba_proj_countries where id = c1.country_id;',
'            sys.htp.p(''<br><span class="profile-attr"><span class="t-Icon fa fa-globe"></span> ''||apex_escape.html(l_country)||''</span>'');',
'        elsif c1.country_id is null and c1.region_id is not null then',
'            select region_name into l_region from eba_proj_regions where id = c1.region_id;',
'            sys.htp.p(''<br><span class="profile-attr"><span class="t-Icon fa fa-globe"></span> ''||apex_escape.html(l_region)||''</span>'');',
'        end if;',
'        ',
'        if c1.home_timezone is not null then',
'            sys.htp.p(''<br><span class="profile-attr"><span class="t-Icon fa fa-clock-o"></span> ''||apex_escape.html(c1.home_timezone)||'' Timezone</span><br>'');',
'        end if;',
'        ',
'        if c1.assistant_name is not null and apex_util.get_build_option_status(p_application_id => :APP_ID, p_build_option_name => ''Assistant'') = ''INCLUDE'' then',
'            sys.htp.p(''<br><span class="profile-attr"><strong>Assistant:</strong><br>''||apex_escape.html(c1.assistant_name)||''</span>'');',
'        end if;',
'',
'        if c1.assistant_phone is not null and apex_util.get_build_option_status(p_application_id => :APP_ID, p_build_option_name => ''Assistant'') = ''INCLUDE'' then',
'            sys.htp.p(''<br><span class="profile-attr"><span class="t-Icon fa fa-phone"></span> ''||apex_escape.html(c1.assistant_phone)||''</span>'');',
'        end if;',
'',
'        if c1.team_groups is not null and apex_util.get_build_option_status(p_application_id => :APP_ID, p_build_option_name => ''Team Groups'') = ''INCLUDE'' then',
'            sys.htp.p(''<br><span class="profile-attr"><strong>Team Groups:</strong><br>''||apex_escape.html(c1.team_groups)||''</span>'');',
'        end if;',
'',
'        if c1.bg_checks is not null and apex_util.get_build_option_status(p_application_id => :APP_ID, p_build_option_name => ''Background Checks'') = ''INCLUDE'' then',
'            sys.htp.p(''<br><span class="profile-attr"><strong>Background Checks:</strong><br>''||apex_escape.html(c1.bg_checks)||''</span>'');',
'        end if;',
'',
'        if c1.hippa_cert_date is not null and apex_util.get_build_option_status(p_application_id => :APP_ID, p_build_option_name => ''HIPPA Certification Date'') = ''INCLUDE'' then',
'            sys.htp.p(''<br><span class="profile-attr"><strong>HIPPA Certified On:</strong><br>''||apex_escape.html(to_char(c1.hippa_cert_date,''Month fmddfm, YYYY''))||''</span>'');',
'        end if;',
'    end loop;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15229403088852372621)
,p_plug_name=>'Involvement'
,p_region_name=>'involvement_region'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_region_attributes=>'style="display: none;"'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id,',
'    p.project,',
'    r.name role,',
'    case when eba_proj_fw.is_edit_authorized(p_username => upper(:APP_USER), p_project_id => p.id, p_min_auth => 3 ) = ''Y'' then',
'        ''<a href="''',
'            ||apex_util.prepare_url(''f?p=''||:APP_ID||'':150:''||:APP_SESSION||'':::150:P150_ID:''||rf.id)',
'            ||''"><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil"''',
'            ||''alt="Edit User''''s Involvement Level" title="Edit User''''s Involvement Level"></a>''',
'    else',
'        null',
'    end as edit_link,',
'    case',
'        when 1 = (select acl_status_level from eba_proj_status p where p.id = :P137_ID) then',
'            -- Open; show P-Track access level',
'            (   select access_level',
'                from eba_proj_status_access_levels pal',
'                where pal.id = u.access_level_id )',
'        else',
'            -- Restricted. Show project access level',
'            case nvl(rf.acl_status_level,r.default_acl_status_level)',
'                when 1 then ''Read Only''',
'                when 2 then ''Edit''',
'                when 3 then ''Full Access''',
'            end',
'    end as access_level,',
'    (   select involvement_level||decode(PERCENTAGE ,null,null,'' - ''||PERCENTAGE ||''%'') x',
'        from eba_proj_involvement_levels il',
'        where il.id = rf.involvement_level_id',
'    ) involvement,',
'    (   select PERCENTAGE x',
'        from eba_proj_involvement_levels il',
'        where il.id = rf.involvement_level_id',
'    ) involvement_pct,',
'    substr(notes,1,500)||decode(greatest( NVL(length(notes),0), 500),500,'''',''...'') notes,',
'    (select category from EBA_PROJ_STATUS_CATS  cat where cat.id = p.cat_id) category,',
'     p.updated,',
'     p.id project_id,',
'     eba_proj_stat_get_con_comp(p.id) complete_status, ',
'     (  select status_short_desc',
'                            from eba_proj_status_codes c',
'                            where c.id = p.project_status) project_status,',
'     (select decode(IS_CLOSED_STATUS ,''Y'',''No'',''Yes'') x from eba_proj_status_codes c',
'                            where c.id = p.project_status ) is_open,',
'     (select decode(IS_CLOSED_STATUS ,''Y'',''Closed'',''Open'') x from eba_proj_status_codes c',
'                            where c.id = p.project_status ) open_label,',
'     (select decode(IS_CLOSED_STATUS ,''Y'',''is-complete'',''is-info'') x from eba_proj_status_codes c',
'                            where c.id = p.project_status ) open_class,',
'    rf.id rf_id',
'from eba_proj_user_ref rf,',
'    eba_proj_roles r,',
'    eba_proj_status_users u,',
'    eba_proj_status p',
'where ',
'    u.id = :P137_ID',
'    and rf.project_id = p.id',
'    and rf.user_id = u.id',
'    and rf.role_id = r.id',
'    and nvl(:P137_SHOW_REGION,''X'') = ''INVOLVEMENT''',
'order by r.default_acl_status_level desc,',
'    r.name,',
'    u.username'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P137_SHOW_REGION'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_required_patch=>wwv_flow_imp.id(12124281749376450905)
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(15229403144424372621)
,p_name=>'Involvement'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>14109684229003390408
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15229403497875372630)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15229403888464372632)
,p_db_column_name=>'PROJECT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP:P200_ID:#ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_link_attr=>'class="involvement-project-name"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15229404246181372633)
,p_db_column_name=>'ROLE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Role'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="involvement-user-role">#ROLE#</span>',
'<span class="involvement-user-notes">#NOTES#</span>'))
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15229404924534372634)
,p_db_column_name=>'INVOLVEMENT'
,p_display_order=>4
,p_column_identifier=>'E'
,p_column_label=>'Involvement'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'    p_application_id => :APP_ID,',
'    p_build_option_name => ''Project User Involvement''',
') = ''INCLUDE'''))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15213096397390322341)
,p_db_column_name=>'INVOLVEMENT_PCT'
,p_display_order=>14
,p_column_identifier=>'O'
,p_column_label=>'Involvement'
,p_column_html_expression=>'<span class="involvement-pct">#INVOLVEMENT#</span>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15229405384729372634)
,p_db_column_name=>'NOTES'
,p_display_order=>24
,p_column_identifier=>'F'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15229404565772372633)
,p_db_column_name=>'ACCESS_LEVEL'
,p_display_order=>34
,p_column_identifier=>'D'
,p_column_label=>'Access'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15229405742593372635)
,p_db_column_name=>'CATEGORY'
,p_display_order=>44
,p_column_identifier=>'G'
,p_column_label=>'&CAT_TITLE.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15229426165123372636)
,p_db_column_name=>'UPDATED'
,p_display_order=>54
,p_column_identifier=>'H'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15229426592964372637)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>64
,p_column_identifier=>'I'
,p_column_label=>'Project ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15229427015368372637)
,p_db_column_name=>'PROJECT_STATUS'
,p_display_order=>74
,p_column_identifier=>'J'
,p_column_label=>'Project Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15229801889136460146)
,p_db_column_name=>'COMPLETE_STATUS'
,p_display_order=>84
,p_column_identifier=>'K'
,p_column_label=>'Completeness'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15229802592697460154)
,p_db_column_name=>'IS_OPEN'
,p_display_order=>94
,p_column_identifier=>'L'
,p_column_label=>'Project Open'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15232768466707635839)
,p_db_column_name=>'RF_ID'
,p_display_order=>104
,p_column_identifier=>'M'
,p_column_label=>'Edit'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15249822775349968816)
,p_db_column_name=>'EDIT_LINK'
,p_display_order=>114
,p_column_identifier=>'N'
,p_column_label=>'Edit'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(16932115813594253130)
,p_db_column_name=>'OPEN_LABEL'
,p_display_order=>124
,p_column_identifier=>'P'
,p_column_label=>'Open Label'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(16932115866850253131)
,p_db_column_name=>'OPEN_CLASS'
,p_display_order=>134
,p_column_identifier=>'Q'
,p_column_label=>'Open Class'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(15229433055528379636)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'141097142'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EDIT_LINK:PROJECT:ROLE:INVOLVEMENT_PCT:COMPLETE_STATUS:'
,p_sort_column_1=>'INVOLVEMENT_PCT'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'INVOLVEMENT'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PROJECT'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(16989862987086207230)
,p_report_id=>wwv_flow_imp.id(15229433055528379636)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'IS_OPEN'
,p_operator=>'='
,p_expr=>'Yes'
,p_condition_sql=>'"IS_OPEN" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Yes''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15338932408493841000)
,p_name=>'Status Reports'
,p_region_name=>'status_reports_region'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_sub_css_classes=>'t-Report--cleanBorders'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--noBorders:t-Report--rowHighlight'
,p_region_attributes=>'style="display: none;"'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    u.status_title,',
'    eba_proj_fw.format_status_report( dbms_lob.substr(u.status_update,450,1), ''Y'',:APP_ID,:APP_SESSION,u.project_id, ''N'', 400, u.id ) note_text,',
'    lower(u.update_owner) created_by,',
'    u.update_date created_on,',
'    u.id,',
'    u.update_date',
'from eba_proj_status_rpts u,',
'     eba_proj_status p',
'where u.project_id = p.id',
'    and u.update_owner = lower(:P137_USERNAME)',
'    and (( u.viewable_by = ''Submitter and Project Members''',
'               and exists ( select null',
'                            from eba_proj_user_ref rf,',
'                                eba_proj_status_users usr',
'                            where rf.project_id = p.id',
'                                and rf.user_id = usr.id',
'                                and lower(usr.username) = lower(:APP_USER)',
'                                and eba_proj_fw.is_edit_authorized( usr.username, rf.project_id ) = ''Y'' ))',
'        OR',
'         u.viewable_by = ''All''',
'        )',
'    and nvl(:P137_SHOW_REGION,''X'') = ''STATUS_REPORTS''',
'order by u.update_date desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SHOW_REGION'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>1500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No status reports'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
,p_required_patch=>wwv_flow_imp.id(6086979797456591004)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15338932638115841005)
,p_query_column_id=>1
,p_column_alias=>'STATUS_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Status Title'
,p_column_link=>'f?p=&APP_ID.:120:&SESSION.::&DEBUG.:120:P120_STATUS_REPORT_ID:#ID#'
,p_column_linktext=>'#STATUS_TITLE#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15338933052022841007)
,p_query_column_id=>2
,p_column_alias=>'NOTE_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Status Report'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15338933492763841007)
,p_query_column_id=>3
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>3
,p_column_heading=>'Submitted By'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15338933862344841007)
,p_query_column_id=>4
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>4
,p_column_heading=>'Submitted'
,p_column_format=>'SINCE'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15338934226351841008)
,p_query_column_id=>5
,p_column_alias=>'ID'
,p_column_display_sequence=>6
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15338934697631841008)
,p_query_column_id=>6
,p_column_alias=>'UPDATE_DATE'
,p_column_display_sequence=>5
,p_column_heading=>'Update Date'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18011880334858745657)
,p_plug_name=>'User Email Preferences'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>120
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(19203383906025833546)
,p_name=>'Updates'
,p_region_name=>'updates_region'
,p_template=>wwv_flow_imp.id(6672346928802369862)
,p_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_sub_css_classes=>'t-Report--cleanBorders'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Comments--chat'
,p_region_attributes=>'style="display: none;"'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select comment_modifiers,',
'    note_type,',
'    comment_text,',
'    attribute_1,',
'    attribute_2,',
'    attribute_3,',
'    attribute_4,',
'    user_name,',
'    comment_date,',
'    icon_modifier,',
'    user_icon,',
'    actions,',
'    gold_label,',
'    gold_class,',
'    update_id,',
'    update_date,',
'    apex_util.prepare_url(''f?p='' || :APP_ID || '':137:'' || :APP_SESSION || '':::137:P137_ID:'' || x.user_id) as profile_url,',
'    project,',
'    project_id',
'from (  ',
'    select * from (',
'    select '''' comment_modifiers, --use is-systemMessage for gray look',
'            t.status_update_type||decode(t.is_active_yn,''Y'','''','' (inactive)'') note_type,',
'            regexp_replace(nvl(u.formatted_update,u.status_update),',
'                           ''##BREAK##.*'',''<br />...<a href="''||apex_util.prepare_url(''f?p=''||:APP_ID||'':129:''||:APP_SESSION',
'                                                        ||''::NO:129:P200_ID,P129_ID,P129_PROJECT_ID:''',
'                                                        ||u.project_id||'',''||u.id||'',''||u.project_id)||''">View More</a>'',',
'                          1,0,''n'') comment_text,',
'            '''' attribute_1,',
'            '''' attribute_2,',
'            '''' attribute_3,',
'            '''' attribute_4,',
'            decode(u.gold_yn, null, '' '', ''N'', null, ''Y'', ''Gold'') as gold_label,',
'            decode(u.gold_yn, null, '' '', ''N'', ''is-hidden'', ''Y'', ''is-warning'') as gold_class,',
'            decode(us.first_name,null,lower(us.username),decode(us.last_name, null, lower(us.username), initcap(us.first_name || '' '' || us.last_name))) user_name,',
'            u.update_date comment_date,',
'            case',
'               when dbms_lob.getlength(us.photo_blob) > 0 then',
'                   ''comment-user-has-photo''',
'               else',
'                   ''u-color-''||(ora_hash(u.created_by,44) + 1)',
'            end icon_modifier,',
'',
'            -- get user photo or initials',
'            case',
'                when dbms_lob.getlength(us.photo_blob) > 0 then',
'                    ''<span class="small-profile-photo" style="background-image: url(''''''',
'                      ||apex_util.prepare_url(''f?p=''||:APP_ID||'':IMAGE:''||:APP_SESSION||''::::GET_ID:''||apex_escape.html(us.username))',
'                      ||'''''');"></span>''',
'                else',
'                    upper(decode(instr(replace(u.created_by,''.'','' ''),'' ''),',
'                                 0, ',
'                                 substr(u.created_by,1,2),',
'                                 substr(u.created_by,1,1)||substr(u.created_by,instr(replace(u.created_by,''.'','' ''),'' '')+1,1)',
'                          ))',
'            end user_icon,',
'            --',
'            case when eba_proj_fw.is_edit_authorized( p_username => upper(:APP_USER),',
'                                                      p_project_id => u.project_id ) = ''Y''',
'                    then ''Edit''',
'                else ''''',
'            end as actions,',
'            u.id update_id,',
'            u.update_date,',
'            us.id as user_id,',
'            (select project from EBA_PROJ_STATUS p where p.id = u.project_id) project,',
'            u.project_id project_id',
'        from eba_proj_status_updates u,',
'             eba_proj_status_update_types t,',
'             eba_proj_status_users us',
'        where upper(u.update_owner) = us.username',
'          and u.update_type = t.id(+)',
'          and ( u.update_owner = lower(:P137_USERNAME) )',
'          and nvl(:P137_SHOW_REGION,''X'') = ''UPDATES''',
'        -- eba_proj_status_users.username is forced to upper via trigger',
'        -- eba_proj_status_updates.owner is forced to lower via trigger',
'      order by u.update_date desc',
'      ) where rownum < 20',
') x'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SHOW_REGION'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364136973369904)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Updates'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
,p_required_patch=>wwv_flow_imp.id(6086979797456591004)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203400334287836802)
,p_query_column_id=>1
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>2
,p_column_heading=>'Comment Modifiers'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203400757722836803)
,p_query_column_id=>2
,p_column_alias=>'NOTE_TYPE'
,p_column_display_sequence=>3
,p_column_heading=>'Note Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203401155142836805)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>4
,p_column_heading=>'Comment Text'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203401556947836807)
,p_query_column_id=>4
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>5
,p_column_heading=>'Attribute 1'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203401947479836809)
,p_query_column_id=>5
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>6
,p_column_heading=>'Attribute 2'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203402405641836811)
,p_query_column_id=>6
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>7
,p_column_heading=>'Attribute 3'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203402769253836812)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>8
,p_column_heading=>'Attribute 4'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203403193218836815)
,p_query_column_id=>8
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>9
,p_column_heading=>'User Name'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203403547688836818)
,p_query_column_id=>9
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>10
,p_column_heading=>'Comment Date'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_default_sort_dir=>'desc'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203403987830836820)
,p_query_column_id=>10
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>11
,p_column_heading=>'Icon Modifier'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203404269877836822)
,p_query_column_id=>11
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>12
,p_column_heading=>'User Icon'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203404632469836823)
,p_query_column_id=>12
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>13
,p_column_heading=>'Actions'
,p_column_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_ID:#UPDATE_ID#'
,p_column_linktext=>'#ACTIONS#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203405056255836823)
,p_query_column_id=>13
,p_column_alias=>'GOLD_LABEL'
,p_column_display_sequence=>14
,p_column_heading=>'Gold Label'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203405432024836824)
,p_query_column_id=>14
,p_column_alias=>'GOLD_CLASS'
,p_column_display_sequence=>15
,p_column_heading=>'Gold Class'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203415894625836826)
,p_query_column_id=>15
,p_column_alias=>'UPDATE_ID'
,p_column_display_sequence=>16
,p_column_heading=>'Update Id'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203396129885833553)
,p_query_column_id=>16
,p_column_alias=>'UPDATE_DATE'
,p_column_display_sequence=>1
,p_column_heading=>'Update Date'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19203416231746836830)
,p_query_column_id=>17
,p_column_alias=>'PROFILE_URL'
,p_column_display_sequence=>17
,p_column_heading=>'Profile Url'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18828368032943420918)
,p_query_column_id=>18
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>18
,p_column_heading=>'Project'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18268311904453554029)
,p_query_column_id=>19
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>19
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17273606798683293444)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'REFRESH'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Refresh'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:137:&SESSION.::&DEBUG.:RP::'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15221742362323026317)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'UPDATE_MY_PROFILE'
,p_button_static_id=>'update_my_profile'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update My Profile'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:195:&SESSION.::&DEBUG.:RP:P195_ID:&P137_ID.'
,p_button_condition=>'upper(:P137_USERNAME) = upper(:APP_USER)'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15358145431643283831)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'UPDATE_USER_PROFILE'
,p_button_static_id=>'update_user_profile'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update &P137_DISPLAY_NAME.''s Profile'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:195:&SESSION.::&DEBUG.:RP,195:P195_ID:&P137_ID.'
,p_button_condition=>'upper(:P137_USERNAME) != upper(:APP_USER)'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15059387513159948152)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(15229403088852372621)
,p_button_name=>'RESET_INVOLVEMENT_IRR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR:P137_ID,P137_USERNAME:&P137_ID.,&P137_USERNAME.'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7468761894572916438)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6729756331275461540)
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
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(15464080979616166358)
,p_branch_name=>'Redirect back to home'
,p_branch_action=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NOT_EXISTS'
,p_branch_condition=>'select id from eba_proj_status_users where id = :P137_ID'
,p_branch_comment=>'Redirect user back to homepage when P137_ID is not valid. This prevents tampering with the URL.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4036795508860725288)
,p_name=>'P137_SHOW_CLOSED_ISSUES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(4036795412189725287)
,p_item_default=>'OPEN'
,p_prompt=>'Show All Issues'
,p_source=>'OPEN'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Include Closed;ALL'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_css_classes=>'region-filters'
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4036795677192725289)
,p_name=>'P137_SHOW_L1_ISSUES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(4036795412189725287)
,p_item_default=>'ALL'
,p_prompt=>'Show Only Level 1 Issues'
,p_source=>'ALL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Level 1;1'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_css_classes=>'region-filters'
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4078540912310325591)
,p_name=>'P137_SHOW_L2_ISSUES'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(4036795412189725287)
,p_item_default=>'ALL'
,p_prompt=>'Show Level 2 Issues'
,p_source=>'ALL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Level 2;2'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_css_classes=>'region-filters'
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4091349339858305345)
,p_name=>'P137_SHOW_L3_ISSUES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(4036795412189725287)
,p_item_default=>'ALL'
,p_prompt=>'Show Level 3 Issues'
,p_source=>'ALL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Level 3;3'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_css_classes=>'region-filters'
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4091349965478305351)
,p_name=>'P137_SHOW_L4_ISSUES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(4036795412189725287)
,p_item_default=>'ALL'
,p_prompt=>'Show Level 4 Issues'
,p_source=>'ALL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Level 4;4'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_css_classes=>'region-filters'
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6729525391789626215)
,p_name=>'P137_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6729525177252620271)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15059387610083948153)
,p_name=>'P137_DISPLAY_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6729525177252620271)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15059387831634948156)
,p_name=>'P137_SHOW_CLOSED_AIS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6768103965912011060)
,p_prompt=>'Show All Action Items'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Include Closed;ALL'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_css_classes=>'region-filters'
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15059388490605948162)
,p_name=>'P137_SHOW_CLOSED_MS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6768921687342632463)
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Include Completed;ALL'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_css_classes=>'region-filters'
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15213084358234322321)
,p_name=>'P137_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6729525177252620271)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15464077367231166322)
,p_name=>'P137_SHOW_REGION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6729525177252620271)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18011880448488745658)
,p_name=>'P137_PAST_DUE_EMAIL_PREF'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(18011880334858745657)
,p_prompt=>'Past Due Milestones and Action Items Emails'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11876370140123189618)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18011880601812745659)
,p_name=>'P137_UPCOMING_EMAIL_PREF'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(18011880334858745657)
,p_prompt=>'Upcoming Milestones and Action Items Emails'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11888600020324608728)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18011880632601745660)
,p_name=>'P137_PROJECT_SUMMARY_EMAIL_PREF'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(18011880334858745657)
,p_prompt=>'Project Details Emails'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(15764621210683200192)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20619521061085799333)
,p_name=>'P137_PROJECT_STATUS_EMAIL_PREF'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(18011880334858745657)
,p_prompt=>'Project Status Emails'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(18524168470145109483)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18011880809230745661)
,p_computation_sequence=>10
,p_computation_item=>'P137_PAST_DUE_EMAIL_PREF'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select initcap(PAST_DUE_REMINDERS_FREQ) from EBA_PROJ_STATUS_USERS where id = :P137_ID;'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11876370140123189618)
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18011880862832745662)
,p_computation_sequence=>20
,p_computation_item=>'P137_UPCOMING_EMAIL_PREF'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select initcap(UPCOMING_REMINDERS_FREQ) from EBA_PROJ_STATUS_USERS where id = :P137_ID;'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11888600020324608728)
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18011880917801745663)
,p_computation_sequence=>30
,p_computation_item=>'P137_PROJECT_SUMMARY_EMAIL_PREF'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select initcap(PROJECT_SUMMARY_FAV_FREQ) from EBA_PROJ_STATUS_USERS where id = :P137_ID;'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(15764621210683200192)
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20619521186896799334)
,p_computation_sequence=>40
,p_computation_item=>'P137_PROJECT_STATUS_EMAIL_PREF'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select initcap(PROJECT_STATUS_FAV_FREQ) from EBA_PROJ_STATUS_USERS where id = :P137_ID;'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(18524168470145109483)
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(13305556037285764822)
,p_computation_sequence=>20
,p_computation_item=>'PROJECT_CAME_FROM'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(15227076006642127214)
,p_computation_sequence=>30
,p_computation_item=>'P137_USERNAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from EBA_PROJ_STATUS_USERS',
'where id = :P137_ID'))
,p_computation_error_message=>'unable to set username, unexpected error'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(15059387711979948154)
,p_computation_sequence=>40
,p_computation_item=>'P137_DISPLAY_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select eba_proj_fw.get_name_from_email_address(u.username)',
'from EBA_PROJ_STATUS_USERS u',
'where id = :P137_ID'))
,p_computation_error_message=>'unable to set username, unexpected error'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(15464080288246166351)
,p_computation_sequence=>60
,p_computation_item=>'P137_SHOW_CLOSED_AIS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'OPEN'
,p_compute_when=>'P137_SHOW_CLOSED_AIS'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(15464080369434166352)
,p_computation_sequence=>70
,p_computation_item=>'P137_SHOW_CLOSED_MS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'OPEN'
,p_compute_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15059387999834948157)
,p_name=>'Refresh AI Timeline'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P137_SHOW_CLOSED_AIS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15059388068105948158)
,p_event_id=>wwv_flow_imp.id(15059387999834948157)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768103965912011060)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15059388547313948163)
,p_name=>'Refresh Issues Report Closed'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P137_SHOW_CLOSED_ISSUES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15249822662483968815)
,p_event_id=>wwv_flow_imp.id(15059388547313948163)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P137_SHOW_CLOSED_ISSUES := nvl(:P137_SHOW_CLOSED_ISSUES,''OPEN'');'
,p_attribute_02=>'P137_SHOW_CLOSED_ISSUES'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4078538965241325571)
,p_event_id=>wwv_flow_imp.id(15059388547313948163)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(4036795412189725287)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(4078540523488325587)
,p_name=>'Refresh Issues Report L1'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P137_SHOW_L1_ISSUES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4078540604992325588)
,p_event_id=>wwv_flow_imp.id(4078540523488325587)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P137_SHOW_L1_ISSUES := nvl(:P137_SHOW_L1_ISSUES,''ALL'');'
,p_attribute_02=>'P137_SHOW_L1_ISSUES'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4078540776536325589)
,p_event_id=>wwv_flow_imp.id(4078540523488325587)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(4036795412189725287)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(4091349066898305342)
,p_name=>'Refresh Issues Report L2'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P137_SHOW_L2_ISSUES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4091349167134305343)
,p_event_id=>wwv_flow_imp.id(4091349066898305342)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P137_SHOW_L2_ISSUES := nvl(:P137_SHOW_L2_ISSUES,''ALL'');'
,p_attribute_02=>'P137_SHOW_L2_ISSUES'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4091349221014305344)
,p_event_id=>wwv_flow_imp.id(4091349066898305342)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(4036795412189725287)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(4091349444250305346)
,p_name=>'Refresh Issues Report L3'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P137_SHOW_L3_ISSUES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4091349508108305347)
,p_event_id=>wwv_flow_imp.id(4091349444250305346)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P137_SHOW_L3_ISSUES := nvl(:P137_SHOW_L3_ISSUES,''ALL'');'
,p_attribute_02=>'P137_SHOW_L3_ISSUES'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4091349683616305348)
,p_event_id=>wwv_flow_imp.id(4091349444250305346)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(4036795412189725287)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(4091350021611305352)
,p_name=>'Refresh Issues Report L4'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P137_SHOW_L4_ISSUES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4091350145551305353)
,p_event_id=>wwv_flow_imp.id(4091350021611305352)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P137_SHOW_L4_ISSUES := nvl(:P137_SHOW_L4_ISSUES,''ALL'');'
,p_attribute_02=>'P137_SHOW_L4_ISSUES'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4091350271899305354)
,p_event_id=>wwv_flow_imp.id(4091350021611305352)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(4036795412189725287)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15213084698752322324)
,p_name=>'Stick Region Display Selector'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15213084777076322325)
,p_event_id=>wwv_flow_imp.id(15213084698752322324)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6729749621005286239)
,p_attribute_01=>'$(this.affectedElements).stickyWidget({toggleWidth: true});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15010743759751268055)
,p_name=>'Update Action Items'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6768103965912011060)
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15010743886284268056)
,p_event_id=>wwv_flow_imp.id(15010743759751268055)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768103965912011060)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15010743922065268057)
,p_name=>'Update Milestones'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6768921687342632463)
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15010744026287268058)
,p_event_id=>wwv_flow_imp.id(15010743922065268057)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768921687342632463)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15358145274605283829)
,p_name=>'Refresh Profile on Dialog Close'
,p_event_sequence=>110
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#update_my_profile, #update_user_profile'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15358145369591283830)
,p_event_id=>wwv_flow_imp.id(15358145274605283829)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15464076925314166318)
,p_name=>'Badgelist Navigation'
,p_event_sequence=>120
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.t-BadgeList-wrap'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#summary_region'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15464077068692166319)
,p_event_id=>wwv_flow_imp.id(15464076925314166318)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var activeTab = $(this.triggeringElement).attr(''href'').substr(1);',
'$("li.apex-rds-item[aria-controls=''"+activeTab+"_region''] a").click();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15358157309710283849)
,p_name=>'Refresh MS Timeline'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P137_SHOW_CLOSED_MS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15358157442244283851)
,p_event_id=>wwv_flow_imp.id(15358157309710283849)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768921687342632463)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15464077142356166320)
,p_name=>'Show Projects on Tab Active'
,p_event_sequence=>140
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'li.apex-rds-item[aria-controls=''projects_region''] a'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P137_SHOW_REGION'') !== ''PROJECTS'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15464077305732166321)
,p_event_id=>wwv_flow_imp.id(15464077142356166320)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P137_SHOW_REGION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'PROJECTS'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15464077437846166323)
,p_event_id=>wwv_flow_imp.id(15464077142356166320)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6729747880772276778)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15464077586156166324)
,p_name=>'Show Involvement on Tab Active'
,p_event_sequence=>150
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'li.apex-rds-item[aria-controls=''involvement_region''] a'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P137_SHOW_REGION'') !== ''INVOLVEMENT'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15464077651053166325)
,p_event_id=>wwv_flow_imp.id(15464077586156166324)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P137_SHOW_REGION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'INVOLVEMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15464077750165166326)
,p_event_id=>wwv_flow_imp.id(15464077586156166324)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(15229403088852372621)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15464077920678166328)
,p_name=>'Show Status Reports on Tab Active'
,p_event_sequence=>160
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'li.apex-rds-item[aria-controls=''status_reports_region''] a'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P137_SHOW_REGION'') !== ''STATUS_REPORTS'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15464078083681166329)
,p_event_id=>wwv_flow_imp.id(15464077920678166328)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P137_SHOW_REGION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'STATUS_REPORTS'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15464078149127166330)
,p_event_id=>wwv_flow_imp.id(15464077920678166328)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(15338932408493841000)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15464078277740166331)
,p_name=>'Show Action Items on Tab Active'
,p_event_sequence=>170
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'li.apex-rds-item[aria-controls=''action_items_region''] a'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P137_SHOW_REGION'') !== ''ACTION_ITEMS'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15464079583957166344)
,p_event_id=>wwv_flow_imp.id(15464078277740166331)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P137_SHOW_REGION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'ACTION_ITEMS'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15464078496058166333)
,p_event_id=>wwv_flow_imp.id(15464078277740166331)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768103965912011060)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15464078809977166336)
,p_name=>'Show Milestones on Tab Active'
,p_event_sequence=>180
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'li.apex-rds-item[aria-controls=''milestones_region''] a'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P137_SHOW_REGION'') !== ''MILESTONES'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15464078851915166337)
,p_event_id=>wwv_flow_imp.id(15464078809977166336)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P137_SHOW_REGION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'MILESTONES'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15464079013961166338)
,p_event_id=>wwv_flow_imp.id(15464078809977166336)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768921687342632463)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15464079214856166340)
,p_name=>'Show Issues on Tab Active'
,p_event_sequence=>190
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'li.apex-rds-item[aria-controls=''issues_region''] a'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P137_SHOW_REGION'') !== ''ISSUES'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15464079284713166341)
,p_event_id=>wwv_flow_imp.id(15464079214856166340)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P137_SHOW_REGION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'ISSUES'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4078540898797325590)
,p_event_id=>wwv_flow_imp.id(15464079214856166340)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(4036795412189725287)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18268311920929554030)
,p_name=>'Show Updates on Tab Active'
,p_event_sequence=>200
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'li.apex-rds-item[aria-controls=''updates_region''] a'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P137_SHOW_REGION'') !== ''UPDATES'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18268312047850554031)
,p_event_id=>wwv_flow_imp.id(18268311920929554030)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P137_SHOW_REGION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'UPDATES'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18268312149599554032)
,p_event_id=>wwv_flow_imp.id(18268311920929554030)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19203383906025833546)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(16932115560960253128)
,p_name=>'Refresh Involvement'
,p_event_sequence=>210
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(15229403088852372621)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16932115672411253129)
,p_event_id=>wwv_flow_imp.id(16932115560960253128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(15229403088852372621)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18268312375993554034)
,p_name=>'Refresh Updates'
,p_event_sequence=>220
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(19203383906025833546)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18268312481994554035)
,p_event_id=>wwv_flow_imp.id(18268312375993554034)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19203383906025833546)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(4091349776663305349)
,p_name=>'Refresh Issues after edit'
,p_event_sequence=>230
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(4036795412189725287)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4091349822800305350)
,p_event_id=>wwv_flow_imp.id(4091349776663305349)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(4036795412189725287)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
