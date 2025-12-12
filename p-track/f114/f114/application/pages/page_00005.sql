prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
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
 p_id=>5
,p_name=>'Milestones Monthly Calendar'
,p_step_title=>'Milestones Monthly Calendar'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486601256078156)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'a.milestoneStatus {',
'    border-left-width: 2px;',
'    border-left-style: solid;',
'    padding: 4px;',
'    display: block;',
'    line-height: 12px;',
'    font-size: 11px;',
'    color: #404040;',
'}',
'',
'/* Ensuring that calendar has full height to show all events */',
'.fc-day-grid-container.fc-scroller {',
'    height: auto !important;',
'}'))
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This calendar displays project Milestones due dates. There is a legend at the bottom of the page that explains the color-coding. Use the filters on the left to vary the results on the right. Click the <strong><</strong> button to go to the previous m'
||'onth and the <strong>></strong> button to go forward a month. Switch between the calendar view to the list view by clicking the <strong>list</strong> button.'
,p_page_component_map=>'08'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7297633979863651194)
,p_plug_name=>'Milestones'
,p_region_name=>'milestonesCalendar'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--hiddenOverflow:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select /*decode(eba_proj_stat_ui.is_project_open(m.project_id), 0, ''#CHK# '', 1, null) ||*/ m.milestone_name next_milestone_name, ',
'    m.milestone_date next_milestone_date,',
'    m.milestone_status,',
'    m.id,',
'    p.id as project_id, ',
'    p.project,',
'    case',
'        when m.milestone_status = ''Completed'' then ''apex-cal-gray''',
'        when m.milestone_status = ''Open'' then ''apex-cal-green''',
'    end as css_class,',
'    s.status_short_desc status_text,',
'    ''apex-cal-''|| lower(c.color_name) css_color,',
'    (   select listagg(lower(u.username),'', '') within group',
'            (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username)) as owners',
'        from eba_proj_user_ref rf,',
'            eba_proj_status_users u,',
'            eba_proj_roles r',
'        where rf.project_id = p.id',
'            and rf.user_id = u.id',
'            and rf.role_id = r.id',
'            and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' ) as owner',
'from eba_proj_status p,',
'    eba_proj_status_codes s,',
'    eba_proj_color_codes c,',
'    eba_proj_status_ms m',
'where p.project_status = s.id(+)',
'    and p.id = m.project_id',
'    and c.id(+) = s.color_code_id',
'    and (nvl(:P5_IS_MAJOR,''ALL'') = ''ALL''',
'        or (nvl(is_major_yn,''N'') = ''Y'' and nvl(:P5_IS_MAJOR,''ALL'') = ''MAJOR'' ) )',
'    and ( nvl(:P5_OWNER,''All Owners'') = ''All Owners''',
'        or exists (select null',
'                   from eba_proj_user_ref rf,',
'                       eba_proj_status_users u',
'                   where rf.project_id = p.id',
'                       and rf.user_id = u.id',
'                       and upper(u.username) = upper(:P5_OWNER)))',
'    and ( nvl(:P5_CATEGORY,0) = 0',
'        or p.cat_id = :P5_CATEGORY',
'    )',
'    and (nvl(:P5_PROJECT,0) = 0',
'        or :P5_PROJECT = p.id',
'        or (nvl(:P5_SHOW_CHILD_PROJ,''N'') = ''Y''',
'            and p.parent_project_id = :P5_PROJECT))',
'    and ( :P5_SEARCH is null',
'        or instr(upper(eba_proj_fw.get_project_rowkey(p_project_id => p.id)||''/''||m.milestone_name||''/''||m.milestone_description),',
'            upper(:P5_search)) > 0',
'        or instr(upper(p.project), upper(:P5_SEARCH)) > 0',
'    )',
'    and ( :P5_MILESTONE_OWNER is null',
'        or (m.owner_role_id is null and lower(m.milestone_owner) = lower(:P5_MILESTONE_OWNER))',
'        or exists ( select null',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u',
'                    where rf.role_id = m.owner_role_id',
'                        and rf.project_id = m.project_id',
'                        and u.id = rf.user_id',
'                        and lower(u.username) = lower(:P5_MILESTONE_OWNER)',
'        )',
'    )',
'order by 2'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_calendar_views', 'list:navigation',
  'css_class', 'CSS_CLASS',
  'display_column', 'NEXT_MILESTONE_NAME',
  'drag_and_drop', 'N',
  'event_sorting', 'AUTOMATIC',
  'maximum_events_day', '10',
  'multiple_line_event', 'Y',
  'primary_key_column', 'ID',
  'show_time', 'N',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'NEXT_MILESTONE_DATE',
  'supplemental_information', wwv_flow_string.join(wwv_flow_t_varchar2(
    '<b>Project:</b> &PROJECT.</br>',
    '<b>Project Status:</b> &STATUS_TEXT.</br>',
    '<b>Milestone Status:</b> &MILESTONE_STATUS.</br>')),
  'view_edit_link', 'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:RP,107,200:P200_ID,P107_ID,P107_PROJECT_ID:&PROJECT_ID.,&ID.,&PROJECT_ID.')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8913234643602533560)
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
 p_id=>wwv_flow_imp.id(8913240225206578085)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:t-Form--stretchInputs:t-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20466779160247189935)
,p_plug_name=>'Legend'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region-body">',
'    <div style="border:1px #000 solid; width:150px; padding:5px; height: 40px; background-color: #2ECC71; float:left; margin: 5px 10px 5px 0px; color:#FFFFFF;">Open</div>',
'    <div style="border:1px #000 solid; width:150px; padding:5px; height: 40px; background-color: #A0A0A0; float:left; margin: 5px 10px 5px 0px; color:#404040;">Complete</div>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8042914834900019636)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8913240225206578085)
,p_button_name=>'P5_RESET_REPORT'
,p_button_static_id=>'P5_RESET_REPORT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-undo-alt'
,p_request_source=>'Reset Report'
,p_request_source_type=>'STATIC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18067126656049239715)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'GO_TO_PROJECT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Go to Project'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP:P200_ID:&P5_PROJECT.'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8913362238809329873)
,p_branch_action=>'f?p=&FLOW_ID.:5:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6744695585361584784)
,p_name=>'P5_SHOW_CHILD_PROJ'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8913240225206578085)
,p_item_default=>'N'
,p_prompt=>'Show Child Projects'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(19782202788559795354)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6812092201558416015)
,p_name=>'P5_SEARCH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8913240225206578085)
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
 p_id=>wwv_flow_imp.id(6812107509177418147)
,p_name=>'P5_MILESTONE_OWNER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8913240225206578085)
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
,p_cSize=>50
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(8030258034098476798)
,p_name=>'P5_IS_MAJOR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8913240225206578085)
,p_item_default=>'ALL'
,p_prompt=>'Type'
,p_source=>'ALL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MAJOR MILESTONES'
,p_lov=>'.'||wwv_flow_imp.id(8030253724000369799)||'.'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8042847234716455334)
,p_name=>'P5_PROJECT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8913240225206578085)
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
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(8913361333563308900)
,p_name=>'P5_OWNER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8913240225206578085)
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
,p_lov_null_text=>'- All People -'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(8913362937682357471)
,p_name=>'P5_CATEGORY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8913240225206578085)
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
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Restrict this report to this &CAT_TITLE_LC..'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20466779224770189936)
,p_name=>'P5_CURR_MONTH'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8913240225206578085)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20466779375452189937)
,p_name=>'P5_CURR_YEAR'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8913240225206578085)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20466779751535189941)
,p_name=>'P5_CURR_DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(8913240225206578085)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(8913278129802636168)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'5'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6775285084258217639)
,p_name=>'show child selector'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_PROJECT'
,p_condition_element=>'P5_PROJECT'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6775285403358217640)
,p_event_id=>wwv_flow_imp.id(6775285084258217639)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_SHOW_CHILD_PROJ'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6775285612697217641)
,p_event_id=>wwv_flow_imp.id(6775285084258217639)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_SHOW_CHILD_PROJ'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15331871727282223534)
,p_name=>'refresh results on filter value change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_PROJECT,P5_SHOW_CHILD_PROJ,P5_OWNER,P5_MILESTONE_OWNER,P5_CATEGORY,P5_IS_MAJOR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331871852846223535)
,p_event_id=>wwv_flow_imp.id(15331871727282223534)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P5_PROJECT,P5_SHOW_CHILD_PROJ,P5_OWNER,P5_MILESTONE_OWNER,P5_CATEGORY,P5_IS_MAJOR'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331871990650223536)
,p_event_id=>wwv_flow_imp.id(15331871727282223534)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7297633979863651194)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15338161198450693810)
,p_name=>'Search Status Reports on Enter'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.keyCode == 13'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'change, keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15338162021112693812)
,p_event_id=>wwv_flow_imp.id(15338161198450693810)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P5_SEARCH,P5_PROJECT,P5_SHOW_CHILD_PROJ,P5_OWNER,P5_MILESTONE_OWNER,P5_CATEGORY,P5_IS_MAJOR'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15338161595478693811)
,p_event_id=>wwv_flow_imp.id(15338161198450693810)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'this.browserEvent.preventDefault();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15338162612886693813)
,p_event_id=>wwv_flow_imp.id(15338161198450693810)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7297633979863651194)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18067127204214239720)
,p_name=>'Show/Hide Go To Project Button'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_PROJECT'
,p_condition_element=>'P5_PROJECT'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18067127299046239721)
,p_event_id=>wwv_flow_imp.id(18067127204214239720)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(18067126656049239715)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18067127374951239722)
,p_event_id=>wwv_flow_imp.id(18067127204214239720)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(18067126656049239715)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8042914943212022068)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_imp.id(8042914834900019636)
,p_internal_uid=>8042914943212022068
);
wwv_flow_imp.component_end;
end;
/
