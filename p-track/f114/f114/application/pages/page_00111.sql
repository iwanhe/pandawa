prompt --application/pages/page_00111
begin
--   Manifest
--     PAGE: 00111
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
 p_id=>111
,p_name=>'Action Items By Owner Timeline'
,p_step_title=>'Action Items By Owner Timeline'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486291560075385)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style type="text/css" media="all">',
'div.body_inner div.region div.content_block{height:200px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;}',
'.tbl-main .rounded-corner-region .rc-body-r{height:170px !important;}',
'',
'#MILESTONES .rc-body-r{height:490px !important;}',
'#AI .rc-body-r{height:270px !important;}',
'',
'table.formlayout label {display: block; line-height:18px; }',
'table.formlayout label a {font: bold 11px/18px Arial, sans-serif; color: #333;}',
'table.formlayout label + br {display: none;}',
'#main-sb-left > div {margin-left: 10px;}',
'</style>'))
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This timeline report can be sorted by using the filter select lists and search field on the left. Click the <strong>Reset</strong> button to reset the filters and the timeline report.',
'</p>'))
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5979191386141463768)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:t-Form--stretchInputs:t-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(5979194193756463786)
,p_plug_name=>'Legend'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_display_point=>'BEFORE_FOOTER'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ebaStatusListLegend">',
'<ul>',
'<li class="ebaLegendLabel">Action Item Color Coding:</li>',
'<li class="ebaRed">Overdue</li>',
'<li class="ebaYellow">Due Today</li>',
'<li class="ebaGreen">Due In the Future</li>',
'<li class="ebaComplete">Complete</li>',
'</ul>',
'<div class="clear"></div></div>'))
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5979194795765463791)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6760772249404210971)
,p_plug_name=>'Action Items by Owner'
,p_region_css_classes=>'timeline-edit-links'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Region--hideHeader'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with ow as (',
'    select a.id action_item_id,',
'        lower(ai_owner) ai_owner',
'    from eba_proj_status_ais unpivot exclude nulls',
'        ( ai_owner for action_owner_no in ( action_owner_01 as 1,',
'                                            action_owner_02 as 2,',
'                                            action_owner_03 as 3,',
'                                            action_owner_04 as 4',
'                                        )',
'        ) a',
'    where a.owner_role_id is null',
'    union all',
'    select a.id action_item_id,',
'        lower(u.username) ai_owner',
'    from eba_proj_status_ais a,',
'        eba_proj_user_ref rf,',
'        eba_proj_status_users u',
'    where a.owner_role_id is not null',
'        and rf.role_id = a.owner_role_id',
'        and rf.project_id = a.project_id',
'        and rf.user_id = u.id',
')',
'select a.id,',
'    ow.ai_owner,',
'    a.project_id,',
'    a.action_status status,',
'    decode(s.parent_project_id,null,null,',
'        (select project from eba_proj_status where id = s.PARENT_PROJECT_ID)) parent_project,',
'    s.project,',
'    a.action,',
'    apex_util.get_since(a.due_date) due_date,',
'    a.due_date as real_due_date,',
'    case when a.action_status = ''Closed'' then',
'            a.completed_date',
'        else',
'            a.due_date',
'    end as calendar_icon_date,',
'    decode(a.milestone_id,null,null,(select milestone_name m from eba_proj_status_ms where id = a.milestone_id)) milestone,',
'    apex_util.get_since(a.completed_date) as completed,',
'    a.row_key,',
'    dbms_lob.substr(a.action_description,1000,1) action_description,',
'    case when owner_role_id is null then',
'        eba_proj_fw.get_name_from_email_address(action_owner_01)',
'        || decode(a.action_owner_02,null,null,'', ''|| eba_proj_fw.get_name_from_email_address(action_owner_02))',
'        || decode(a.action_owner_03,null,null,'', ''|| eba_proj_fw.get_name_from_email_address(action_owner_03))',
'        || decode(a.action_owner_04,null,null,'', ''|| eba_proj_fw.get_name_from_email_address(action_owner_04))',
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
'    end as owners,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':78:''||:APP_SESSION',
'            ||'':::78:P78_ACTION_ITEM_ID,P200_ID:''||a.id||'',''||s.id) the_link,',
'    case when a.action_status = ''Closed'' then ''Black''',
'        when trunc(a.due_date) < trunc(sysdate) then ''Red''',
'        when trunc(a.due_date) = trunc(sysdate) then ''Yellow''',
'        else ''Green''',
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
'    case when eba_proj_fw.is_edit_authorized(',
'        p_username   => upper(:APP_USER),',
'        p_project_id => a.project_id ) = ''Y'' then',
'        ''<a href="''',
'          ||apex_util.prepare_url(',
'              p_url => ''f?p=''||:APP_ID||'':73:''||:APP_SESSION||'':::73:P73_ID:''||a.id)',
'          ||''" class="t-StatusList-editLink">Edit</a>''',
'    else',
'        null',
'    end as edit_link',
'from eba_proj_status_ais a,',
'    eba_proj_status s,',
'    ow',
'where a.project_id = s.id',
'    and a.id = ow.action_item_id',
'    and (nvl(:P111_STATUS,''Open'') = ''0'' or a.action_status = :P111_STATUS)',
'    and ( :P111_OWNER is null or lower(ow.ai_owner) = lower(:P111_OWNER) )',
'    and ( :P111_SEARCH is null',
'        or a.row_key = :P111_SEARCH',
'        or (instr(upper(action),upper(:P111_SEARCH)) > 0',
'            or instr(upper(action_description),upper(:P111_SEARCH)) > 0))',
'    and (:P111_CATEGORY is null or s.cat_id = :P111_CATEGORY)',
'    and (:P125_QUARTER is null or to_char(a.due_date, ''"Q"QYYYY'') = :P125_QUARTER)',
'order by ow.ai_owner, a.due_date'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_ajax_items_to_submit=>'P111_SEARCH,P111_OWNER,P111_QUARTER,P111_CATEGORY,P111_STATUS,P111_ROWS'
,p_plug_query_num_rows_item=>'P111_ROWS'
,p_plug_query_no_data_found=>'No Action Items found.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'CALENDAR_ICON_DATE',
  'attribute_02', 'COLOR',
  'attribute_03', 'ACTION',
  'attribute_04', 'THE_LINK',
  'attribute_05', 'PROJECT',
  'attribute_06', 'OWNERS',
  'attribute_07', 'MILESTONE',
  'attribute_08', 'COMPLETED',
  'attribute_09', 'ACTION_DESCRIPTION',
  'attribute_11', 'EDIT_LINK',
  'attribute_12', 'D',
  'attribute_13', 'STATUS',
  'attribute_14', 'COLOR_LABEL',
  'attribute_15', 'LINK_TEXT')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760772290509210972)
,p_name=>'ID'
,p_data_type=>'ID'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760772441025210973)
,p_name=>'AI_OWNER'
,p_data_type=>'AI_OWNER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Ai owner'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760772506740210974)
,p_name=>'PROJECT_ID'
,p_data_type=>'PROJECT_ID'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project id'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760772624204210975)
,p_name=>'STATUS'
,p_data_type=>'STATUS'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760772707687210976)
,p_name=>'PARENT_PROJECT'
,p_data_type=>'PARENT_PROJECT'
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
 p_id=>wwv_flow_imp.id(6760772842285210977)
,p_name=>'PROJECT'
,p_data_type=>'PROJECT'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project'
,p_display_sequence=>60
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760772970207210978)
,p_name=>'ACTION'
,p_data_type=>'ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Action'
,p_display_sequence=>70
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760773042118210979)
,p_name=>'DUE_DATE'
,p_data_type=>'DUE_DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Due Date'
,p_display_sequence=>80
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760773157816210980)
,p_name=>'ROW_KEY'
,p_data_type=>'ROW_KEY'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Row key'
,p_display_sequence=>90
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760773187857210981)
,p_name=>'ACTION_DESCRIPTION'
,p_data_type=>'ACTION_DESCRIPTION'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Action description'
,p_display_sequence=>100
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760773357910210982)
,p_name=>'OWNERS'
,p_data_type=>'OWNERS'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Owner(s)'
,p_display_sequence=>110
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760773808544210987)
,p_name=>'THE_LINK'
,p_data_type=>'THE_LINK'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'The link'
,p_display_sequence=>160
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760773960216210988)
,p_name=>'COLOR'
,p_data_type=>'COLOR'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color'
,p_display_sequence=>170
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15010742851406268046)
,p_name=>'EDIT_LINK'
,p_data_type=>'EDIT_LINK'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Edit link'
,p_display_sequence=>200
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15331872517284223542)
,p_name=>'REAL_DUE_DATE'
,p_data_type=>'REAL_DUE_DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Real due date'
,p_display_sequence=>180
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15358144487088283821)
,p_name=>'COLOR_LABEL'
,p_data_type=>'COLOR_LABEL'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color label'
,p_display_sequence=>190
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18296374216221442060)
,p_name=>'LINK_TEXT'
,p_data_type=>'LINK_TEXT'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Link text'
,p_display_sequence=>210
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19204384431387214152)
,p_name=>'CALENDAR_ICON_DATE'
,p_data_type=>'CALENDAR_ICON_DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Calendar icon date'
,p_display_sequence=>220
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19204384602844214153)
,p_name=>'COMPLETED'
,p_data_type=>'COMPLETED'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Completed'
,p_display_sequence=>230
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19204384672268214154)
,p_name=>'MILESTONE'
,p_data_type=>'MILESTONE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Milestone'
,p_display_sequence=>240
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5979192602642463776)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5979191386141463768)
,p_button_name=>'P111_RESET_ALL'
,p_button_static_id=>'P111_RESET_ALL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.:RP,111::'
,p_icon_css_classes=>'fa-undo-alt'
,p_request_source_type=>'ALWAYS_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5979238198264659665)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CREATE_ACTION_ITEM'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Action Item'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:73::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-chevron-right'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5354196293506534983)
,p_name=>'P111_QUARTER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(5979191386141463768)
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
 p_id=>wwv_flow_imp.id(5979191997295463774)
,p_name=>'P111_CATEGORY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(5979191386141463768)
,p_prompt=>'&CAT_TITLE.'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CATEGORIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CATEGORY display_value, ID return_value ',
'from EBA_PROJ_STATUS_CATS',
'where is_active_yn = ''Y''',
'order by display_sequence nulls last, 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All &CAT_TITLE_PL. -'
,p_cHeight=>1
,p_tag_attributes=>'style="width: 170px;"'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5979192202969463774)
,p_name=>'P111_ROWS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(5979191386141463768)
,p_item_default=>'100'
,p_prompt=>'Rows'
,p_source=>'100'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'NUMBER OF ROWS'
,p_lov=>'.'||wwv_flow_imp.id(6837380404471503108)||'.'
,p_cHeight=>1
,p_tag_attributes=>'style="width: 170px;"'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5979192994016463779)
,p_name=>'P111_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5979191386141463768)
,p_prompt=>'Search'
,p_placeholder=>'Search Action Items'
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
 p_id=>wwv_flow_imp.id(5979193390723463780)
,p_name=>'P111_OWNER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5979191386141463768)
,p_prompt=>'Action Item Owner'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ACTION ITEM OWNERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct v1.owner d, lower(v1.username) r',
'from (',
'    select eba_proj_fw.get_name_from_email_address(action_owner_01) owner, action_owner_01 username from eba_proj_status_ais',
'    union all',
'    select eba_proj_fw.get_name_from_email_address(action_owner_02) owner, action_owner_02 username from eba_proj_status_ais',
'    union all',
'    select eba_proj_fw.get_name_from_email_address(action_owner_03) owner, action_owner_03 username from eba_proj_status_ais',
'    union all',
'    select eba_proj_fw.get_name_from_email_address(action_owner_04) owner, action_owner_04 username from eba_proj_status_ais',
'    union all',
'    select eba_proj_fw.get_name_from_email_address(u.username) owner, u.username username',
'    from eba_proj_status_users u',
'    where exists (  select null',
'                      from eba_proj_status_ais a,',
'                           eba_proj_user_ref rf',
'                     where rf.role_id = a.owner_role_id',
'                       and rf.project_id = a.project_id',
'                       and rf.user_id = u.id',
'                 )',
'    ) v1',
'where v1.owner is not null',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Owners -'
,p_cHeight=>1
,p_tag_attributes=>'style="width: 170px;"'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5979193608610463780)
,p_name=>'P111_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(5979191386141463768)
,p_item_default=>'Open'
,p_prompt=>'Action Item Status'
,p_source=>'Open'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ACTION ITEM STATUS (OPEN, CLOSED)'
,p_lov=>'.'||wwv_flow_imp.id(8959401832930782472)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_tag_attributes=>'style="width: 170px;"'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(5979195187747463795)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'111'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5979195312256463797)
,p_name=>'show child selector'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P111_PROJECT'
,p_condition_element=>'P111_PROJECT'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5979195583004463800)
,p_event_id=>wwv_flow_imp.id(5979195312256463797)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P111_SHOW_CHILD_PROJ'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5979195786109463800)
,p_event_id=>wwv_flow_imp.id(5979195312256463797)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P111_SHOW_CHILD_PROJ'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13305559299432764854)
,p_name=>'Refresh Timeline'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5979238198264659665)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13305559399172764855)
,p_event_id=>wwv_flow_imp.id(13305559299432764854)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'location.reload();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15331872703614223543)
,p_name=>'Apply Filters'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P111_OWNER,P111_QUARTER,P111_CATEGORY,P111_STATUS,P111_ROWS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331872904805223545)
,p_event_id=>wwv_flow_imp.id(15331872703614223543)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6760772249404210971)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15339221566703914864)
,p_name=>'Search Action Items on Enter'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P111_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.keyCode == 13'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'change, keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15339222000361914871)
,p_event_id=>wwv_flow_imp.id(15339221566703914864)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'this.browserEvent.preventDefault();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15339222898960914873)
,p_event_id=>wwv_flow_imp.id(15339221566703914864)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6760772249404210971)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15010742996367268047)
,p_name=>'Update Action Items'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6760772249404210971)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15010743020456268048)
,p_event_id=>wwv_flow_imp.id(15010742996367268047)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6760772249404210971)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
