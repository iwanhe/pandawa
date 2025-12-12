prompt --application/pages/page_00017
begin
--   Manifest
--     PAGE: 00017
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
 p_id=>17
,p_name=>'Milestones By Owner Timeline'
,p_step_title=>'Milestones By Owner Timeline'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486601256078156)
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page shows all project Milestones sorted by their owner. Use the filter controls on the left to change the results displayed on the right.'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5354053678467971641)
,p_plug_name=>'Milestones by Owner'
,p_region_css_classes=>'timeline-edit-links'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Region--hideHeader'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
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
'    case when m.milestone_status = ''Completed'' then',
'            m.completed_date',
'        else',
'            m.milestone_date',
'    end as calendar_icon_date,',
'    apex_util.get_since(m.completed_date) as completed,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':107:''||:APP_SESSION',
'        ||'':::107:P107_ID,P107_PROJECT_ID,P200_ID:''',
'        ||m.id||'',''||m.project_id||'',''||m.project_id) link,',
'    p.project,',
'    milestone_description,',
'    milestone_date,',
'    milestone_status,',
'    to_char(milestone_start_date,''Month fmDD, fmYYYY'') milestone_start_date,',
'    ow.milestone_owner,',
'    nvl((select count(*) from eba_proj_status_ais a where a.milestone_id = m.id and a.action_status = ''Open''),0)',
'        ||'' Open Action Items'' ai_open,',
'    case when eba_proj_fw.is_edit_authorized(',
'        p_username   => upper(:APP_USER),',
'        p_project_id => m.project_id ) = ''Y'' then',
'        decode(nvl(is_major_yn,''N''),''Y'',''<b>MAJOR MILESTONE</b>'',null) || ',
'        '' <a href="''',
'          ||apex_util.prepare_url(',
'              p_url => ''f?p=''||:APP_ID||'':48:''||:APP_SESSION||'':::48:P48_ID:''||m.id)',
'          ||''" class="t-StatusList-editLink">Edit</a>''',
'    else',
'        decode(nvl(is_major_yn,''N''),''Y'',''<b>MAJOR MILESTONE</b>'',null)',
'    end as description3',
'from eba_proj_status_ms m,',
'    eba_proj_status p,',
'    eba_proj_status_codes s,',
'    (   select x.id milestone_id, lower(x.milestone_owner) milestone_owner',
'        from eba_proj_status_ms x',
'        where x.owner_role_id is null',
'        union all',
'        select x.id milestone_id, lower(u.username) milestone_owner',
'        from eba_proj_status_ms x,',
'            eba_proj_user_ref rf,',
'            eba_proj_status_users u',
'        where rf.role_id = x.owner_role_id',
'            and rf.project_id = x.project_id',
'            and u.id = rf.user_id',
'    ) ow',
'where p.id = m.project_id',
'    and p.project_status = s.id(+)',
'    and m.id = ow.milestone_id',
'    and ( :P17_MILESTONE_OWNER is null',
'        or ow.milestone_owner = lower(:P17_MILESTONE_OWNER)',
'    )',
'    and ( nvl(:P17_SHOW,''Open'') = ''All''',
'        or (m.milestone_status = ''Open''',
'            and nvl(:P17_SHOW,''Open'') = ''Open'' ))',
'    and (nvl(:P17_IS_MAJOR,''ALL'') = ''ALL''',
'        or (nvl(is_major_yn,''N'') = ''Y''',
'            and nvl(:P17_IS_MAJOR,''ALL'') = ''MAJOR'' ))',
'    and ( :P17_QUARTER is null',
'        or to_char(milestone_date,''"Q"QYYYY'') = :P17_QUARTER )',
'    and ( :P17_SEARCH is null',
'        or upper(:P17_SEARCH) = m.row_key',
'        or instr(upper(m.milestone_name), upper(:P17_SEARCH)) > 0',
'        or instr(upper(m.milestone_description), upper(:P17_SEARCH)) > 0)',
'    and ( nvl(:P17_CATEGORY,0) = 0',
'        or p.cat_id = :P17_CATEGORY)',
'order by 11,',
'    -- First sort',
'    decode( :P17_SORT, ''DATE'', to_char(m.milestone_date,''YYYYMMDD''),null) desc,',
'    decode( :P17_SORT, ''DATE'', p.project, null),',
'    -- Second sort',
'    decode( :P17_SORT, ''DATE2'', to_char(m.milestone_date,''YYYYMMDD''),null),',
'    decode( :P17_SORT, ''DATE2'', p.project, null)'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_ajax_items_to_submit=>'P17_SEARCH,P17_MILESTONE_OWNER,P17_QUARTER,P17_CATEGORY,P17_SHOW,P17_IS_MAJOR,P17_SORT,P17_ROWS'
,p_plug_query_num_rows_item=>'P17_ROWS'
,p_plug_footer=>'<span class="nodatafound" style="border-top: 1px solid #EEE">Completed milestones show when completed within the last 90 days.</span>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'CALENDAR_ICON_DATE',
  'attribute_02', 'COLOR',
  'attribute_03', 'TITLE',
  'attribute_04', 'LINK',
  'attribute_05', 'MILESTONE_OWNER',
  'attribute_06', 'PROJECT',
  'attribute_07', 'AI_OPEN',
  'attribute_08', 'COMPLETED',
  'attribute_09', 'MILESTONE_DESCRIPTION',
  'attribute_11', 'DESCRIPTION3',
  'attribute_12', 'D',
  'attribute_13', 'MILESTONE_STATUS',
  'attribute_14', 'COLOR_LABEL')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5354054141841971644)
,p_name=>'ID'
,p_data_type=>'ID'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5354054500110971646)
,p_name=>'TITLE'
,p_data_type=>'TITLE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Title'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5354055041504971647)
,p_name=>'COLOR'
,p_data_type=>'COLOR'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5354055541807971647)
,p_name=>'LINK'
,p_data_type=>'LINK'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Link'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5354056019414971648)
,p_name=>'PROJECT'
,p_data_type=>'PROJECT'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project'
,p_display_sequence=>50
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5354056512958971648)
,p_name=>'DESCRIPTION3'
,p_data_type=>'DESCRIPTION3'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Description3'
,p_display_sequence=>70
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5354057065259971649)
,p_name=>'MILESTONE_DESCRIPTION'
,p_data_type=>'MILESTONE_DESCRIPTION'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Milestone description'
,p_display_sequence=>80
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5354057552934971651)
,p_name=>'MILESTONE_DATE'
,p_data_type=>'MILESTONE_DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Milestone date'
,p_display_sequence=>90
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5354058069691971653)
,p_name=>'MILESTONE_STATUS'
,p_data_type=>'MILESTONE_STATUS'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>110
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5354058495844971653)
,p_name=>'MILESTONE_START_DATE'
,p_data_type=>'MILESTONE_START_DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Milestone start date'
,p_display_sequence=>130
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5354059032922971653)
,p_name=>'MILESTONE_OWNER'
,p_data_type=>'MILESTONE_OWNER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Owner(s)'
,p_display_sequence=>150
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5354059574572971654)
,p_name=>'AI_OPEN'
,p_data_type=>'AI_OPEN'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Open Action Items'
,p_display_sequence=>170
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15358143831433283815)
,p_name=>'COLOR_LABEL'
,p_data_type=>'COLOR_LABEL'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color label'
,p_display_sequence=>180
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19204384737857214155)
,p_name=>'CALENDAR_ICON_DATE'
,p_data_type=>'CALENDAR_ICON_DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Calendar icon date'
,p_display_sequence=>190
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19204384902289214156)
,p_name=>'COMPLETED'
,p_data_type=>'COMPLETED'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Completed'
,p_display_sequence=>200
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5354059961888971662)
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
 p_id=>wwv_flow_imp.id(5354060372918971662)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5354066426484971700)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5354060372918971662)
,p_button_name=>'P17_RESET_REPORT'
,p_button_static_id=>'P35_RESET_REPORT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-undo-alt'
,p_request_source=>'Reset Report'
,p_request_source_type=>'STATIC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5354066032881971699)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CREATE_MILESTONE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Milestone'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:48::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-chevron-right'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5354069523381971713)
,p_branch_action=>'f?p=&FLOW_ID.:17:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5354060732388971663)
,p_name=>'P17_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5354060372918971662)
,p_prompt=>'Search'
,p_placeholder=>'Search'
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
 p_id=>wwv_flow_imp.id(5354061092660971667)
,p_name=>'P17_MILESTONE_OWNER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5354060372918971662)
,p_prompt=>'Milestone Owner'
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
 p_id=>wwv_flow_imp.id(5354062031865971683)
,p_name=>'P17_QUARTER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(5354060372918971662)
,p_prompt=>'Quarter'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(add_months(sysdate-90,(x.lvl-1)*3), ''"Q"Q" - "YYYY'') dt , to_char(add_months(sysdate-90,(x.lvl-1)*3), ''"Q"QYYYY'') r',
'from (  select level lvl ',
'        from dual ',
'        connect by level < 10 ',
'    ) x ',
'order by x.lvl'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Quarters -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5354062474792971687)
,p_name=>'P17_CATEGORY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(5354060372918971662)
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
 p_id=>wwv_flow_imp.id(5354063316098971688)
,p_name=>'P17_SHOW'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(5354060372918971662)
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
 p_id=>wwv_flow_imp.id(5354063737532971688)
,p_name=>'P17_IS_MAJOR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(5354060372918971662)
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
 p_id=>wwv_flow_imp.id(5354064174879971688)
,p_name=>'P17_SORT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(5354060372918971662)
,p_item_default=>'DATE'
,p_prompt=>'Sort'
,p_source=>'DATE'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MILESTONES SORT ORDER'
,p_lov=>'.'||wwv_flow_imp.id(6810783702064302550)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5354064497084971689)
,p_name=>'P17_ROWS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(5354060372918971662)
,p_item_default=>'100'
,p_prompt=>'Rows'
,p_source=>'100'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'NUMBER OF ROWS'
,p_lov=>'.'||wwv_flow_imp.id(6837380404471503108)||'.'
,p_cHeight=>1
,p_tag_attributes=>'style="width: 170px;"'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(5354066978191971705)
,p_computation_sequence=>10
,p_computation_item=>'P17_SORT'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'DATE'
,p_compute_when=>'P17_SORT'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(5354067348735971706)
,p_computation_sequence=>20
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5354067997841971709)
,p_name=>'show child selector'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_PROJECT'
,p_condition_element=>'P17_PROJECT'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5354068549762971712)
,p_event_id=>wwv_flow_imp.id(5354067997841971709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_SHOW_CHILD_PROJ'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5354069024441971712)
,p_event_id=>wwv_flow_imp.id(5354067997841971709)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_SHOW_CHILD_PROJ'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13589415517030266027)
,p_name=>'Reload page on dialog close'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5354066032881971699)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13589415619643266028)
,p_event_id=>wwv_flow_imp.id(13589415517030266027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5354053678467971641)
,p_attribute_01=>'location.reload();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15331871422758223531)
,p_name=>'Apply Filters'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_MILESTONE_OWNER,P17_QUARTER,P17_CATEGORY,P17_SHOW,P17_IS_MAJOR,P17_SORT,P17_ROWS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331871647766223533)
,p_event_id=>wwv_flow_imp.id(15331871422758223531)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5354053678467971641)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15337973053292599495)
,p_name=>'Search Status Reports on Enter'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.keyCode == 13'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'change, keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15337974420797599500)
,p_event_id=>wwv_flow_imp.id(15337973053292599495)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'this.browserEvent.preventDefault();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15337973992220599499)
,p_event_id=>wwv_flow_imp.id(15337973053292599495)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5354053678467971641)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15010742100844268038)
,p_name=>'Update Milestones'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(5354053678467971641)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15010742148591268039)
,p_event_id=>wwv_flow_imp.id(15010742100844268038)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5354053678467971641)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5354067661740971707)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_imp.id(5354066426484971700)
,p_internal_uid=>5354067661740971707
);
wwv_flow_imp.component_end;
end;
/
