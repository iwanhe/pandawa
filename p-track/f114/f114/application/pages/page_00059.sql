prompt --application/pages/page_00059
begin
--   Manifest
--     PAGE: 00059
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
 p_id=>59
,p_name=>'Project Updates Timeline'
,p_step_title=>'Project Updates Timeline'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486396754076853)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/eba_timeline.css" type="text/css" media="all" charset="utf-8">',
''))
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page renders a timeline report of all project updates. Use the filter controls on the left of the report to change the timeline results. Click an update''s name to display the update. Click the <strong>Updates Dashboard ></strong> button to navig'
||'ate to the updates dashboard page. Click the <strong>Reset</strong> button to reset the page to default.'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6768228511978250802)
,p_plug_name=>'Timeline'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.id,',
'    p.id project_id,',
'    t.status_update_type update_type,',
'    eba_proj_fw.conv_txt_html(',
'        regexp_replace(nvl(u.formatted_update,u.status_update),',
'                       ''##BREAK##.*'',''<br />...<a href="''||apex_util.prepare_url(''f?p=''||:APP_ID||'':129:''||:APP_SESSION',
'                                                        ||''::NO:129:P200_ID,P129_ID,P129_PROJECT_ID:''',
'                                                        ||u.project_id||'',''||u.id||'',''||u.project_id)||''">View More</a>'',',
'                      1,0,''n'')',
'    ) || ',
'    decode(u.gold_yn, null, '' '', ''N'', '' '', ''Y'', ''<br><span class="t-Badge t-Badge--orb t-Badge--small is-warning">Gold</span>'') as status_update,',
'    ''f?p=''||:APP_ID||'':129:''||:app_session',
'        ||'':::129:P200_ID,P129_ID,P129_PROJECT_ID:''',
'        ||p.id||'',''||u.id||'',''||p.id link,',
'    lower(u.update_owner) status_owner,',
'    u.updated update_date,',
'    eba_proj_fw.get_name_from_email_address(u.update_owner) as update_owner,',
'    (   select listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '') within group',
'            (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'        from eba_proj_user_ref rf,',
'            eba_proj_status_users u,',
'            eba_proj_roles r',
'        where rf.project_id = p.id',
'            and rf.user_id = u.id',
'            and rf.role_id = r.id',
'            and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' ) as owner,',
'    p.project,',
'    s.status_short_desc status,',
'    decode(s.is_closed_status,''Y'',''black'',col.color_name) color_code,',
'    apex_util.get_since(u.updated) as updated,',
'    u.created,',
'    u.created_by,',
'    nvl(eba_proj_fw.get_project_rowkey(p_project_id => p.id), p.row_key) as row_key,',
'    u.row_key update_key',
'from eba_proj_status_updates u,',
'    eba_proj_status_update_types t,',
'    eba_proj_status p,',
'    eba_proj_status_codes s,',
'    eba_proj_color_codes col',
'where p.id = u.project_id',
'    and p.PROJECT_STATUS = s.id(+)',
'    and col.id(+) = s.color_code_id',
'    and u.update_type = t.id',
'    and ( nvl(:P59_UPDATE_TYPE,0) = 0',
'        or u.update_type = nvl(:P59_UPDATE_TYPE,0))',
'    and ( :P59_SEARCH is null',
'        or instr(upper(p.row_key),upper(:P59_SEARCH)) > 0',
'        or instr(upper(p.code_name),upper(:P59_SEARCH)) > 0',
'        or instr(upper(u.row_key),upper(:P59_SEARCH)) > 0',
'        or instr(upper(dbms_lob.substr(u.STATUS_UPDATE,2000,1)),upper(:P59_SEARCH)) > 0',
'        or instr(upper(dbms_lob.substr(u.STATUS_UPDATE,2000,1990)),upper(:P59_SEARCH)) > 0',
'        or instr(upper(dbms_lob.substr(u.STATUS_UPDATE,2000,3990)),upper(:P59_SEARCH)) > 0',
'        or instr(upper(u.update_owner),upper(:P59_SEARCH)) > 0)',
'    and ( lower(u.update_owner) = lower(:P59_OWNER)',
'        or :P59_OWNER is null',
'        or :P59_OWNER = ''All Owners'')',
'    and (',
'          :P59_GOLD is null',
'          or',
'          (',
'              :P59_GOLD is not null',
'              and',
'              :P59_GOLD = u.gold_yn',
'          )',
'      )',
'    and ( nvl(:P59_CATEGORY,0) = 0',
'        or p.cat_id = :P59_CATEGORY )',
'    and ( nvl(:P59_PROJECT,0) = 0',
'        or p.id = :P59_PROJECT',
'        or (nvl(:P59_SHOW_CHILD_PROJ,''N'') = ''Y''',
'            and p.parent_project_id = :P59_PROJECT) )',
'    and (nvl(:P59_TIMEFRAME,0) = 0 or (u.created > sysdate - nvl(:P59_TIMEFRAME,0)))',
'order by',
'    u.created desc, p.project'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_ajax_items_to_submit=>'P59_GOLD,P59_PROJECT,P59_SHOW_CHILD_PROJ,P59_OWNER,P59_CATEGORY,P59_TIMEFRAME,P59_UPDATE_TYPE,P59_ROWS,P59_SEARCH'
,p_plug_query_num_rows_item=>'P59_ROWS'
,p_plug_query_no_data_found=>'No project updates found'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'UPDATE_DATE',
  'attribute_02', 'COLOR_CODE',
  'attribute_03', 'PROJECT',
  'attribute_04', 'LINK',
  'attribute_05', 'UPDATE_OWNER',
  'attribute_06', 'UPDATE_TYPE',
  'attribute_07', 'UPDATED',
  'attribute_11', 'STATUS_UPDATE',
  'attribute_12', 'D',
  'attribute_13', 'STATUS')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768228634572250803)
,p_name=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768228691647250804)
,p_name=>'PROJECT_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project id'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768228953856250806)
,p_name=>'UPDATE_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Update Type'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768229041297250807)
,p_name=>'STATUS_UPDATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status update'
,p_display_sequence=>50
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768229103599250808)
,p_name=>'LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Link'
,p_display_sequence=>60
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768906768522562559)
,p_name=>'STATUS_OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Contributor'
,p_display_sequence=>70
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768906796752562560)
,p_name=>'UPDATE_DATE'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Update date'
,p_display_sequence=>80
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768907022260562562)
,p_name=>'UPDATE_OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Contributor'
,p_display_sequence=>100
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768907158264562563)
,p_name=>'OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Owner'
,p_display_sequence=>110
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768907215700562564)
,p_name=>'PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project'
,p_display_sequence=>120
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768907386228562566)
,p_name=>'STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>140
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768907547194562567)
,p_name=>'COLOR_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color code'
,p_display_sequence=>150
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768907651206562568)
,p_name=>'UPDATED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Updated'
,p_display_sequence=>160
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768907714983562569)
,p_name=>'CREATED'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Created'
,p_display_sequence=>170
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768907848060562570)
,p_name=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Created by'
,p_display_sequence=>180
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768908024503562572)
,p_name=>'ROW_KEY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Row key'
,p_display_sequence=>200
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768908192053562574)
,p_name=>'UPDATE_KEY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Update key'
,p_display_sequence=>220
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8957353139704635809)
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
 p_id=>wwv_flow_imp.id(8957355039209847677)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow:t-Form--stretchInputs:t-Region--hideHeader'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(8039686027332658121)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8957355039209847677)
,p_button_name=>'P59_RESET'
,p_button_static_id=>'P59_RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-undo-alt'
,p_request_source=>'reset'
,p_request_source_type=>'STATIC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20619521668903799339)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'UPDATES_DASHBOARD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Updates Dashboard'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8039686539453661647)
,p_branch_action=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:RP,59::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(8039686027332658121)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 01-JUL-2011 07:39 by SBKENNED'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7864201908357678990)
,p_branch_action=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_comment=>'Created 30-JUL-2012 09:04 by SHAKEEB'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6072521410636265475)
,p_name=>'P59_TIMEFRAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8957355039209847677)
,p_item_default=>'90'
,p_prompt=>'Timeframe'
,p_source=>'90'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME - LONGER'
,p_lov=>'.'||wwv_flow_imp.id(6072479693769082825)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6746388186979427436)
,p_name=>'P59_SHOW_CHILD_PROJ'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8957355039209847677)
,p_item_default=>'Y'
,p_prompt=>'Show Child Projects'
,p_source=>'Y'
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
 p_id=>wwv_flow_imp.id(6837432504256512566)
,p_name=>'P59_ROWS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8957355039209847677)
,p_item_default=>'100'
,p_prompt=>'Rows'
,p_source=>'50'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'NUMBER OF ROWS'
,p_lov=>'.'||wwv_flow_imp.id(6837380404471503108)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8030274435643731222)
,p_name=>'P59_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8957355039209847677)
,p_prompt=>'Search'
,p_placeholder=>'Search Updates'
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
 p_id=>wwv_flow_imp.id(8030275339995921797)
,p_name=>'P59_UPDATE_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8957355039209847677)
,p_item_default=>'0'
,p_prompt=>'Type'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'UPDATE TYPES (ALL)'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select status_update_type||decode(is_active_yn,''Y'','''','' (Inactive)'') d, id r',
'from   EBA_PROJ_STATUS_UPDATE_TYPES',
'order by is_active_yn desc, display_sequence'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8957355235387847682)
,p_name=>'P59_OWNER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8957355039209847677)
,p_prompt=>'Contributor'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'COUNT OF PROJECT UPDATES OWNERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select eba_proj_fw.get_name_from_email_address(u.update_owner) || '' (''||count(*)||'')'' d,',
'       lower(u.update_owner) r',
'from eba_proj_status_updates u',
'where u.update_owner is not null ',
'group by eba_proj_fw.get_name_from_email_address(u.update_owner), lower(u.update_owner)',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Owners -'
,p_lov_null_value=>'All Owners'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8957355437978847683)
,p_name=>'P59_CATEGORY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8957355039209847677)
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
 p_id=>wwv_flow_imp.id(8957554230304561674)
,p_name=>'P59_PROJECT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8957355039209847677)
,p_item_default=>'0'
,p_prompt=>'Project'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
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
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18042285516556618691)
,p_name=>'P59_GOLD'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8957355039209847677)
,p_prompt=>'Gold Rated'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'<p>Filter updates by their "Gold" rating.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(8957354820508842219)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(13305545544135764817)
,p_computation_sequence=>20
,p_computation_item=>'PROJECT_CAME_FROM'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6746403394252429477)
,p_name=>'show child selector'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_PROJECT'
,p_condition_element=>'P59_PROJECT'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6746403700466429479)
,p_event_id=>wwv_flow_imp.id(6746403394252429477)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P59_SHOW_CHILD_PROJ'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6746403895053429479)
,p_event_id=>wwv_flow_imp.id(6746403394252429477)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P59_SHOW_CHILD_PROJ'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15331869868636223515)
,p_name=>'Refresh results on filter change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_GOLD,P59_PROJECT,P59_OWNER,P59_SHOW_CHILD_PROJ,P59_TIMEFRAME,P59_CATEGORY,P59_ROWS,P59_UPDATE_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331870039376223517)
,p_event_id=>wwv_flow_imp.id(15331869868636223515)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768228511978250802)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15332129694515327588)
,p_name=>'Search Updates on Enter'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.keyCode == 13'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'change, keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15332130609401327595)
,p_event_id=>wwv_flow_imp.id(15332129694515327588)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'this.browserEvent.preventDefault();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15332130111099327594)
,p_event_id=>wwv_flow_imp.id(15332129694515327588)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768228511978250802)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
