prompt --application/pages/page_00068
begin
--   Manifest
--     PAGE: 00068
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
 p_id=>68
,p_name=>'Milestones Gantt Chart'
,p_step_title=>'Milestones Gantt Chart'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486601256078156)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.permalink { margin: 10px;}',
'.permalink a {color: #707070; font: 11px/12px Arial, sans-serif;}',
'',
'table.formlayout label {display: block; line-height:18px; }',
'table.formlayout label a {font: bold 11px/18px Arial, sans-serif; color: #333;}',
'table.formlayout label + br {display: none;}',
'#main-sb-left > div {margin-left: 10px;}',
'</style>',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'a.lateMilestone{background-color:#f7cdcd !important;border-color:#962a2a !important;color:#660000 !important}',
'a.lateMilestone:hover{background-color:#deb8b8 !important}',
'a.openMilestone{background-color:#dff6da !important;border-color:#778e73 !important}',
'a.openMilestone:hover{background-color:#c8dbc3 !important}',
'a.completedMilestone{background-color:#b0b0b0 !important; border-color:#303030 !important}',
'a.completedMilestone:hover{background-color:#606060 !important; color:#fafafa !important}'))
,p_step_template=>wwv_flow_imp.id(6672316913709369812)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page shows a Gantt chart of project milestones. Use the filter controls at the top of the page to change the Gantt chart''s results. Click the <strong>View Project</strong> button to return to the project details page. Click the <strong>Reset</st'
||'rong> button to clear the filter controls and reset the page to default.'
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5853154110450382106)
,p_plug_name=>'Gantt Chart'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--removeHeader'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>30
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.project,',
'    p.id project_id,',
'    m.milestone_name,',
'    case when :P68_DUE_DATES_ONLY = ''Y'' then',
'            cast(m.milestone_date as date)',
'        else',
'            cast(m.milestone_start_date as date)',
'    end start_date,',
'    cast(m.milestone_date as date) end_date,',
'    trim(to_char(m.milestone_start_date,''DD Month''))||'' - ''||trim(to_char(m.milestone_date,''DD Month''))',
'        ||case',
'            when owner_role_id is null then',
'                milestone_owner',
'            else',
'                nvl((select r.name||'': ''||listagg(lower(u.username),'', '')',
'                        within group (order by lower(u.username)) owner',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u,',
'                        eba_proj_roles r',
'                    where rf.role_id = m.owner_role_id',
'                        and rf.project_id = m.project_id',
'                        and u.id = rf.user_id',
'                        and r.id = rf.role_id',
'                    group by r.name',
'                ), '''' )',
'        end as title_text,',
'    m.id milestone_id,',
'    case upper(nvl(m.milestone_status,''OPEN''))',
'        when ''COMPLETED'' then',
'            ''completedMilestone''',
'        when ''OPEN'' then',
'            decode(sign(trunc(current_date) - trunc(cast(m.milestone_date as date))),',
'                1, ''lateMilestone'',',
'                ''openMilestone'')',
'        else',
'            ''brown''',
'    end as color,',
'    ''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||p.id project_link',
'from eba_proj_status_ms m,',
'    eba_proj_status p',
'where m.project_id = p.id',
'    and m.milestone_date is not null',
'    and m.milestone_start_date is not null',
'    and m.milestone_start_date <= m.milestone_date',
'    and (nvl(:P68_PROJECT,0) = 0 or p.id = :P68_PROJECT',
'        or (nvl(:P68_SHOW_CHILD_PROJ,''N'') = ''Y''',
'            and p.parent_project_id = :P68_PROJECT))',
'    and (nvl(:P68_IS_MAJOR,''ALL'') = ''ALL'' or m.is_major_yn = ''Y'')',
'    and (:P68_MILESTONE_OWNER is null',
'        or (m.owner_role_id is null and lower(m.milestone_owner) = lower(:P68_MILESTONE_OWNER))',
'        or exists ( select null',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u',
'                    where rf.role_id = m.owner_role_id',
'                        and rf.project_id = m.project_id',
'                        and u.id = rf.user_id',
'                        and lower(u.username) = lower(:P68_MILESTONE_OWNER) )',
'    )',
'    and (nvl(upper(:P68_SHOW),''ALL'') = ''ALL'' or nvl(upper(:P68_SHOW),''ALL'') = upper(m.milestone_status))',
'    and (nvl(:P68_CATEGORY,0) = 0 or cat_id = :P68_CATEGORY)',
'    and (',
'            (',
'                :P68_PROJECT_OPEN = ''Open''',
'                and',
'                p.project_status in (select id from EBA_PROJ_STATUS_CODES where IS_ACTIVE_YN = ''Y'' and IS_CLOSED_STATUS = ''N'')',
'            )',
'            or',
'            (',
'                :P68_PROJECT_OPEN = ''Closed''',
'                and',
'                p.project_status in (select id from EBA_PROJ_STATUS_CODES where IS_ACTIVE_YN = ''Y'' and IS_CLOSED_STATUS = ''Y'')',
'            )',
'        )',
'    and (:P68_SEARCH is null',
'        or instr(upper(m.milestone_name), upper(:P68_SEARCH)) > 0',
'        or instr(upper(m.milestone_description), upper(:P68_SEARCH)) > 0',
'        or instr(upper(p.row_key), upper(:P68_SEARCH)) > 0',
'        or instr(upper(p.code_name), upper(:P68_SEARCH)) > 0',
'    )',
'    and (nvl(:P68_OWNER,''All Owners'') = ''All Owners''',
'        or exists ( select null',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u,',
'                        eba_proj_roles r',
'                    where rf.project_id = p.id',
'                        and rf.user_id = u.id',
'                        and rf.role_id = r.id',
'                        and lower(u.username) = lower(:P68_OWNER)',
'                        and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'                  )',
'    )',
'order by p.project, m.milestone_name;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.GANTT_CHART'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'PROJECT',
  'attribute_02', 'MILESTONE_NAME',
  'attribute_03', 'TITLE_TEXT',
  'attribute_04', 'COLOR',
  'attribute_05', 'START_DATE',
  'attribute_06', 'END_DATE',
  'attribute_07', 'f?p=&APP_ID.:200:&APP_SESSION.:::200:P200_ID:&PROJECT_ID.',
  'attribute_08', 'f?p=&APP_ID.:48:&APP_SESSION.:::200,48:P48_ID,P48_PROJECT_ID,P200_ID:&MILESTONE_ID.,&PROJECT_ID.,&PROJECT_ID.',
  'attribute_09', 'P68_GANTT_PERIOD',
  'attribute_10', 'P68_START_DATE',
  'attribute_11', '30:22:18:8')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5872997011095516945)
,p_plug_name=>'Legend'
,p_parent_plug_id=>wwv_flow_imp.id(5853154110450382106)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" class="apex-gantt-chart" style="width:300px;">',
'<tbody>',
'    <tr>',
'        <td><a href="#" title="" class="openMilestone">Open Milestone</a></td>',
'        <td><a href="#" title="" class="completedMilestone">Closed Milestone</a></td>',
'        <td><a href="#" title="" class="lateMilestone">Late Milestone</a></td>',
'    </tr>',
'</tbody>',
'</table>'))
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
 p_id=>wwv_flow_imp.id(8031813726172846194)
,p_plug_name=>'Permalink'
,p_parent_plug_id=>wwv_flow_imp.id(5853154110450382106)
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.prn(''<div class="permalink">'');',
'',
'sys.htp.prn(''<a href="''||apex_util.prepare_url(''f?p=''||:APP_ID||'':68:''||:APP_SESSION||',
'''::NO:RP,68:''||',
'''P200_ID,''||',
'''P68_PROJECT,''||',
'''P68_IS_MAJOR,''||',
'''P68_SHOW,''||',
'''P68_OWNER,''||',
'''P68_MILESTONE_OWNER,''||',
'''P68_CATEGORY:''||',
'apex_escape.html(:P68_PROJECT||'',''||:P68_PROJECT||'',''||nvl(:P68_IS_MAJOR,''ALL'')||'',''||',
'nvl(:P68_SHOW,''Open'')||'',''||:P68_OWNER||'',''||:P68_MILESTONE_OWNER||',
''',''||:P68_CATEGORY))||',
'''">Permalink</a>'');',
'',
'if nvl(:P68_PROJECT,0) != 0 then',
'sys.htp.prn('', '');',
'sys.htp.prn(''<a href="''||apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||',
'''::NO:RP,2,200:P200_ID:''||apex_escape.html(:P68_PROJECT))||''">View Project</a>'');',
'',
'sys.htp.prn('', '');',
'sys.htp.prn(''<a href="''||apex_util.prepare_url(''f?p=''||:APP_ID||'':48:''||:APP_SESSION||',
'''::NO:RP,2,48,200:P200_ID,P48_PROJECT_ID,LAST_VIEW:''||',
'apex_escape.html(:P68_PROJECT||'',''||:P68_PROJECT||'',68''))||',
'''">New Milestone</a>'');',
'end if;',
'sys.htp.prn(''</div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6669538113967083462)
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
 p_id=>wwv_flow_imp.id(8030258343926489018)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--hideHeader:t-Form--stretchInputs'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_imp.id(8959697229957664416)
,p_plug_name=>'Milestone View Mode'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_imp.id(8957335740783211398)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6672372065359369922)
,p_plug_display_condition_type=>'NEVER'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.horizontal-links-list {margin-bottom: 10px;}',
'</style>'))
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8042923740151125282)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'P68_RESET'
,p_button_static_id=>'P68_RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.:RP,68::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7864209701979713481)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CREATE_MILESTONE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Milestone'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:48::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-chevron-right'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18658259522720460714)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'VIEW_PROJECT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'View Project'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.::P200_ID:&P68_PROJECT.#projectMilestones'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8042923940397125284)
,p_branch_action=>'f?p=&FLOW_ID.:68:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5850780614570454046)
,p_name=>'P68_GANTT_PERIOD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8030258343926489018)
,p_item_default=>'W'
,p_prompt=>'Period'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Daily;D,Weekly;W,Monthly;M,Quarterly;Q'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6746593786820540891)
,p_name=>'P68_SHOW_CHILD_PROJ'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(8030258343926489018)
,p_item_default=>'N'
,p_prompt=>'Show Child Projects'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(19782202788559795354)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8030258518777489022)
,p_name=>'P68_OWNER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8030258343926489018)
,p_prompt=>'Project Person'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'DISTINCT PROJECT OWNERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select eba_proj_fw.get_name_from_email_address(u.username) d, lower(u.username) r',
'from eba_proj_status_users u',
'where exists ( select null',
'               from eba_proj_user_ref rf,',
'                   eba_proj_roles r,',
'                   eba_proj_status p,',
'                   eba_proj_status_codes sc',
'               where rf.user_id = u.id',
'                   and p.id = rf.project_id',
'                   and rf.role_id = r.id',
'                   and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'                   and p.project_status = sc.id',
'                   and sc.is_closed_status != ''Y'' )',
'order by lower(u.username)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Owners -'
,p_lov_null_value=>'All Owners'
,p_cSize=>64
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8030258717851489023)
,p_name=>'P68_CATEGORY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8030258343926489018)
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
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Restrict this report to this &CAT_TITLE_LC..'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8030259439063489024)
,p_name=>'P68_SHOW'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(8030258343926489018)
,p_item_default=>'Open'
,p_prompt=>'Milestone Status'
,p_source=>'Open'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SHOW ALL OPEN'
,p_lov=>'.'||wwv_flow_imp.id(8030284120218013671)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8030259629771489024)
,p_name=>'P68_IS_MAJOR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8030258343926489018)
,p_item_default=>'ALL'
,p_prompt=>'Type'
,p_source=>'ALL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MAJOR MILESTONES'
,p_lov=>'.'||wwv_flow_imp.id(8030253724000369799)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8030279831431326172)
,p_name=>'P68_START_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8030258343926489018)
,p_prompt=>'Start'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'return to_char(current_date,''DD-MON-YYYY'');'
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8030286640761227752)
,p_name=>'P68_MILESTONE_OWNER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8030258343926489018)
,p_prompt=>'Milestone Owner'
,p_display_as=>'NATIVE_POPUP_LOV'
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
,p_cSize=>64
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Identifies milestone owner.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8030289018607297078)
,p_name=>'P68_PROJECT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8030258343926489018)
,p_prompt=>'Project'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SELECT PROJECT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d, r',
'from ( select ltrim(replace(SYS_CONNECT_BY_PATH(project, '':TREESEP:''), '':TREESEP:'','' / ''), ''/ '') d,',
'           id r',
'       from eba_proj_status',
'       start with parent_project_id is null',
'           connect by prior id = parent_project_id',
'           order siblings by project )',
'union all',
'select ps.project d, ps.id r',
'from eba_proj_status ps',
'where ps.parent_project_id is not null',
'    and not exists ( select null',
'                     from eba_proj_status p2',
'                     where p2.id = ps.parent_project_id );'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cSize=>64
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8042925619737270747)
,p_name=>'P68_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8030258343926489018)
,p_prompt=>'Search'
,p_placeholder=>'Search Milestones'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18808041440786757057)
,p_name=>'P68_PROJECT_OPEN'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8030258343926489018)
,p_item_default=>'ALL'
,p_prompt=>'Project Status'
,p_source=>'Open'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT OPEN'
,p_lov=>'.'||wwv_flow_imp.id(18932132484862150518)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19130303080195903214)
,p_name=>'P68_DUE_DATES_ONLY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8030258343926489018)
,p_item_default=>'N'
,p_prompt=>'Show only Due Dates'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(8030283037214895600)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'68'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(13305545742559764819)
,p_computation_sequence=>20
,p_computation_item=>'PROJECT_CAME_FROM'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6746608994092543003)
,p_name=>'show child selector'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_PROJECT'
,p_condition_element=>'P68_PROJECT'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6746609285068543004)
,p_event_id=>wwv_flow_imp.id(6746608994092543003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_SHOW_CHILD_PROJ'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6746609491161543004)
,p_event_id=>wwv_flow_imp.id(6746608994092543003)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_SHOW_CHILD_PROJ'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15331872054171223537)
,p_name=>'refresh gantt chart after filter value change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_GANTT_PERIOD,P68_PROJECT,P68_START_DATE,P68_OWNER,P68_MILESTONE_OWNER,P68_CATEGORY,P68_SHOW,P68_IS_MAJOR,P68_SHOW_CHILD_PROJ,P68_PROJECT_OPEN,P68_DUE_DATES_ONLY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331872200360223538)
,p_event_id=>wwv_flow_imp.id(15331872054171223537)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P68_GANTT_PERIOD,P68_PROJECT,P68_START_DATE,P68_OWNER,P68_MILESTONE_OWNER,P68_CATEGORY,P68_SHOW,P68_IS_MAJOR,P68_SHOW_CHILD_PROJ,P68_PROJECT_OPEN,P68_DUE_DATES_ONLY'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331872231856223539)
,p_event_id=>wwv_flow_imp.id(15331872054171223537)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15338411765609719130)
,p_name=>'Search Milestones on Enter'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.keyCode == 13'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'change, keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15338412638104719133)
,p_event_id=>wwv_flow_imp.id(15338411765609719130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P68_SEARCH,P68_GANTT_PERIOD,P68_PROJECT,P68_START_DATE,P68_OWNER,P68_MILESTONE_OWNER,P68_CATEGORY,P68_SHOW,P68_IS_MAJOR,P68_SHOW_CHILD_PROJ'
,p_attribute_03=>'P68_SEARCH'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15338412212743719133)
,p_event_id=>wwv_flow_imp.id(15338411765609719130)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'this.browserEvent.preventDefault();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2646786368221448962)
,p_event_id=>wwv_flow_imp.id(15338411765609719130)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15331872415418223540)
,p_name=>'refresh chart on close after add'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7864209701979713481)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331872417813223541)
,p_event_id=>wwv_flow_imp.id(15331872415418223540)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5853154110450382106)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18658301570885473296)
,p_name=>'hide return to project button'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_PROJECT'
,p_condition_element=>'P68_PROJECT'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18658301925094473300)
,p_event_id=>wwv_flow_imp.id(18658301570885473296)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(18658259522720460714)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18658302441482473301)
,p_event_id=>wwv_flow_imp.id(18658301570885473296)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(18658259522720460714)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8042924033702132845)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset session state'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_imp.id(8042923740151125282)
,p_internal_uid=>8042924033702132845
);
wwv_flow_imp.component_end;
end;
/
