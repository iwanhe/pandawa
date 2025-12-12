prompt --application/pages/page_00125
begin
--   Manifest
--     PAGE: 00125
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
 p_id=>125
,p_name=>'&APPLICATION_TITLE. Action Items'
,p_step_title=>'&APPLICATION_TITLE. Action Items'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486291560075385)
,p_javascript_code_onload=>'apex.theme42.sticky(".t-StatusList-blockHeader")'
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Use the filter controls on the left to change the Action Items displayed in the timeline on the right. This page also contains links to several other Action Item reports and tools.'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5201692565292152432)
,p_plug_name=>'Action Item Reports & Tools'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-LinksList--nowrap'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_imp.id(8957466624617531900)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6672372065359369922)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6067382883013140892)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--stretchInputs:t-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_imp.id(6067385688264140902)
,p_plug_name=>'Legend'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>10
,p_plug_new_grid_column=>false
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
 p_id=>wwv_flow_imp.id(6067386108454140910)
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
 p_id=>wwv_flow_imp.id(6768105724654011078)
,p_plug_name=>'Action Items'
,p_region_css_classes=>'timeline-edit-links'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow:t-Region--hideHeader'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id,',
'       a.action title,',
'       case when a.action_status = ''Closed'' then',
'               ''Black''',
'           when trunc(a.due_date) < trunc(sysdate) then',
'               ''Red''',
'           when trunc(a.due_date) = trunc(sysdate) then',
'               ''Yellow''',
'           else',
'               ''Green''',
'       end as color,',
'       case when a.link_url is not null and a.link_text is not null and exists (select null',
'                     from apex_application_build_options',
'                    where application_id = :APP_ID',
'                      and build_option_name = ''Action Item Links''',
'                      and build_option_status = ''Include'') then',
'           ''<small><a href="'' || a.link_url || ''" target="_blank">'' || a.link_text || ''</a></small>''',
'       end as link_text,',
'       case when a.ACTION_STATUS = ''Closed'' then',
'               ''Closed''',
'           when trunc(a.due_date) < trunc(sysdate) then',
'               ''Past Due''',
'           when trunc(a.due_date) = trunc(sysdate) then',
'               ''Due Today''',
'           else',
'               ''Due In The Future''',
'       end as color_label,',
'       case when a.action_status = ''Closed'' then',
'            a.completed_date',
'       else',
'            a.due_date',
'       end as calendar_icon_date,',
'       decode(a.milestone_id,null,null,(select milestone_name m from eba_proj_status_ms where id = a.milestone_id)) milestone,',
'       apex_util.get_since(a.completed_date) as completed,',
'       apex_util.prepare_url(''f?p=''||:APP_ID||'':78:''||:APP_SESSION',
'           ||'':::78:P78_ACTION_ITEM_ID,P200_ID:''',
'           ||a.id||'',''||s.id) link,',
'       decode(parent_project_id,null,null,''Parent Project: ''||(select project d from eba_proj_status where id = s.PARENT_PROJECT_ID)) parent_project,',
'       s.project,',
'       a.action_description,',
'       a.action_status status,',
'       a.due_date due_date,',
'       case when owner_role_id is null then',
'           eba_proj_fw.get_name_from_email_address(a.action_owner_01)',
'           ||decode(a.action_owner_02,null,null,'', ''||eba_proj_fw.get_name_from_email_address(a.action_owner_02))',
'           ||decode(a.action_owner_03,null,null,'', ''||eba_proj_fw.get_name_from_email_address(a.action_owner_03))',
'           ||decode(a.action_owner_04,null,null,'', ''||eba_proj_fw.get_name_from_email_address(a.action_owner_04))',
'       else',
'           nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '
||''')',
'                   within group (order by lower(u.username)) owner',
'               from eba_proj_user_ref rf,',
'                   eba_proj_status_users u,',
'                   eba_proj_roles r',
'               where rf.role_id = a.owner_role_id',
'                   and rf.project_id = a.project_id',
'                   and u.id = rf.user_id',
'                   and r.id = rf.role_id',
'               group by r.name',
'           ), (select ''No ''||r.name||'' defined''',
'               from eba_proj_roles r',
'               where r.id = a.owner_role_id)',
'           )',
'       end as owner,',
'       a.row_key,',
'       case when eba_proj_fw.is_edit_authorized(',
'           p_username   => upper(:APP_USER),',
'           p_project_id => a.project_id ) = ''Y'' then',
'           ''<a href="''',
'             ||apex_util.prepare_url(',
'                 p_url => ''f?p=''||:APP_ID||'':73:''||:APP_SESSION||'':::73:P73_ID:''||a.id)',
'             ||''" class="t-StatusList-editLink">Edit</a>''',
'       else',
'           null',
'       end as edit_link',
'  from eba_proj_status_ais a,',
'       eba_proj_status s,',
'       eba_proj_status_codes c',
' where a.project_id = s.id',
'   and s.project_status = c.id (+)',
'   and (nvl(:P125_STATUS,''Open'') = ''0'' or a.action_status = :P125_STATUS)',
'   and ( :P125_PROJECT is null or a.project_id = :P125_PROJECT )',
'   and (',
'            nvl(:P125_OWNER,''0'') = ''0''',
'            or ',
'            (',
'                a.owner_role_id is null',
'                and ',
'                (',
'                    lower(a.action_owner_01) = lower(:P125_OWNER)',
'                    or',
'                    lower(a.action_owner_02) = lower(:P125_OWNER)',
'                    or',
'                    lower(a.action_owner_03) = lower(:P125_OWNER)',
'                    or',
'                    lower(a.action_owner_04) = lower(:P125_OWNER)',
'                )',
'            )',
'            or',
'            (',
'                a.owner_role_id is not null',
'                and',
'                exists (select null',
'                          from eba_proj_user_ref rf,',
'                               eba_proj_status_users u',
'                         where rf.role_id = a.owner_role_id',
'                           and rf.project_id = a.project_id',
'                           and u.id = rf.user_id',
'                           and lower(u.username) = lower(:P125_OWNER))',
'            )',
'        )',
'   and ( :P125_SEARCH is null',
'       or a.row_key = :P125_SEARCH',
'       or instr(upper(action),upper(:P125_SEARCH)) > 0',
'       or instr(upper(action_description),upper(:P125_SEARCH)) > 0)',
'   and (:P125_CATEGORY is null or s.cat_id = :P125_CATEGORY)',
'   and ( :P125_QUARTER is null',
'          or exists',
'         (select null from eba_proj_fy_periods p where trunc(a.due_date) between p.first_day and p.last_day and p.period_name = :P125_QUARTER)',
'       )',
' order by ',
'    -- first sort',
'    decode(nvl(:P125_SORT,''DUE_DATE''),',
'        ''DUE_DATE'',to_char(a.due_date,''YYYYMMDD'')||s.project,null) nulls last,',
'    -- second sort',
'    decode(nvl(:P125_SORT,''DUE_DATE''),',
'        ''DUE_DATE2'',to_char(a.due_date,''YYYYMMDD'')||s.project,null) desc nulls last'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_ajax_items_to_submit=>'P125_SEARCH,P125_OWNER,P125_QUARTER,P125_CATEGORY,P125_STATUS,P125_SORT,P125_ROWS'
,p_plug_query_num_rows=>5000
,p_plug_query_no_data_found=>'No Action Items found.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'CALENDAR_ICON_DATE',
  'attribute_02', 'COLOR',
  'attribute_03', 'TITLE',
  'attribute_04', 'LINK',
  'attribute_05', 'PROJECT',
  'attribute_06', 'OWNER',
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
 p_id=>wwv_flow_imp.id(6768105831731011079)
,p_name=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768105971103011080)
,p_name=>'TITLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Title'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768106032784011081)
,p_name=>'COLOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768106108854011082)
,p_name=>'LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Link'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768106193889011083)
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
 p_id=>wwv_flow_imp.id(6768106370530011084)
,p_name=>'PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project'
,p_display_sequence=>60
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768106619964011087)
,p_name=>'ACTION_DESCRIPTION'
,p_data_type=>'CLOB'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Action description'
,p_display_sequence=>90
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768106786241011089)
,p_name=>'STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>110
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768107082241011091)
,p_name=>'DUE_DATE'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Due date'
,p_display_sequence=>130
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768107227625011093)
,p_name=>'OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Owner(s)'
,p_display_sequence=>150
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768107351336011094)
,p_name=>'ROW_KEY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Row key'
,p_display_sequence=>160
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15010743169890268049)
,p_name=>'EDIT_LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Edit link'
,p_display_sequence=>180
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15358144534527283822)
,p_name=>'COLOR_LABEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color label'
,p_display_sequence=>170
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18296373958509442057)
,p_name=>'LINK_TEXT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Link text'
,p_display_sequence=>190
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19204384997189214157)
,p_name=>'CALENDAR_ICON_DATE'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Calendar icon date'
,p_display_sequence=>200
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19204385035440214158)
,p_name=>'MILESTONE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Milestone'
,p_display_sequence=>210
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19204385165175214159)
,p_name=>'COMPLETED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Completed'
,p_display_sequence=>220
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6067383684913140897)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6067382883013140892)
,p_button_name=>'P125_RESET_ALL'
,p_button_static_id=>'P125_RESET_ALL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.:RP,125::'
,p_icon_css_classes=>'fa-undo-alt'
,p_request_source_type=>'ALWAYS_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6067382295087140889)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CREATE_ACTION_ITEM'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Action Item'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:73::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5354144779939332182)
,p_name=>'P125_QUARTER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6067382883013140892)
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
 p_id=>wwv_flow_imp.id(6067383096512140894)
,p_name=>'P125_CATEGORY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6067382883013140892)
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
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6067383307108140896)
,p_name=>'P125_ROWS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6067382883013140892)
,p_item_default=>'100'
,p_prompt=>'Rows'
,p_source=>'100'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'NUMBER OF ROWS'
,p_lov=>'.'||wwv_flow_imp.id(6837380404471503108)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6067384088596140898)
,p_name=>'P125_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6067382883013140892)
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
 p_id=>wwv_flow_imp.id(6067384492842140898)
,p_name=>'P125_OWNER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6067382883013140892)
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
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6067384706628140898)
,p_name=>'P125_STATUS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6067382883013140892)
,p_item_default=>'Open'
,p_prompt=>'Status'
,p_source=>'Open'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ACTION ITEM STATUS (OPEN, CLOSED)'
,p_lov=>'.'||wwv_flow_imp.id(8959401832930782472)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6067384905793140899)
,p_name=>'P125_SORT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6067382883013140892)
,p_item_default=>'DUE_DATE'
,p_prompt=>'Sort'
,p_source=>'DUE_DATE'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ACTION ITEMS SORT ORDER'
,p_lov=>'.'||wwv_flow_imp.id(8959635237446662859)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15302909748245743018)
,p_name=>'P125_CURRENT_USER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6067382883013140892)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20128217634236567801)
,p_name=>'P125_PROJECT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6067382883013140892)
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
 p_id=>wwv_flow_imp.id(15302909908052743019)
,p_computation_sequence=>10
,p_computation_item=>'P125_CURRENT_USER'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'lower(:APP_USER)'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(6067386509083140916)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15302911190864743032)
,p_name=>'Search Action Items on Enter'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P125_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.keyCode == 13'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'change, keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15302911312974743033)
,p_event_id=>wwv_flow_imp.id(15302911190864743032)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'this.browserEvent.preventDefault();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15302911415408743034)
,p_event_id=>wwv_flow_imp.id(15302911190864743032)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768105724654011078)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15302911999548743040)
,p_name=>'Search on Item Change'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P125_OWNER,P125_QUARTER,P125_CATEGORY,P125_STATUS,P125_SORT,P125_ROWS,P125_PROJECT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4270248687143215368)
,p_event_id=>wwv_flow_imp.id(15302911999548743040)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P125_OWNER,P125_QUARTER,P125_CATEGORY,P125_STATUS,P125_SORT,P125_ROWS,P125_PROJECT'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15302912171853743042)
,p_event_id=>wwv_flow_imp.id(15302911999548743040)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768105724654011078)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15302912298315743043)
,p_name=>'Refresh IRR on Close after add'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6067382295087140889)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15302912340182743044)
,p_event_id=>wwv_flow_imp.id(15302912298315743043)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768105724654011078)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15010743270782268050)
,p_name=>'Update Action Items'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6768105724654011078)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15010743402513268051)
,p_event_id=>wwv_flow_imp.id(15010743270782268050)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768105724654011078)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
