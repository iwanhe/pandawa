prompt --application/pages/page_00117
begin
--   Manifest
--     PAGE: 00117
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
 p_id=>117
,p_name=>'Project Status Reports Timeline'
,p_step_title=>'Project Status Reports Timeline'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847526594676426358)
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
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(6086979797456591004)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This timeline report can be sorted by using the filter select lists and search field on the left. Click the <strong>Reset</strong> button to reset the filters and the timeline report.',
'</p>'))
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6061450393521883202)
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
 p_id=>wwv_flow_imp.id(6061454194205941386)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow:t-Form--stretchInputs:t-Region--hideHeader'
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
 p_id=>wwv_flow_imp.id(6768908286164562575)
,p_plug_name=>'Status Reports by Date'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    apex_util.prepare_url(''f?p='' || :app_id || '':120:''|| :app_session || '':::120:LAST_VIEW,P200_ID,P120_STATUS_REPORT_ID:117,''|| p.id || '','' || u.id) the_link,',
'    u.ID,',
'    u.row_key status_report_row_key,',
'    p.id project_id,',
'    u.status_title,',
'    dbms_lob.substr(u.status_update,500,1) status_update,',
'    case',
'        when instr(u.update_owner,''@'') > 0 then',
'            case',
'                when instr( replace( substr( u.update_owner, 1, instr(u.update_owner,''@'' ) - 1), ''.'', '' '' ), '' '', 1, 2 ) > 0 then',
'                    substr( replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' ), 1, instr( replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' ), '' '', 1, 1 ) ) '
||'||',
'                    substr( replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' ), instr( replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' ), '' '', 1, 2 ) )',
'            else',
'                replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' )',
'            end',
'    else',
'        lower(u.update_owner)',
'    end as status_owner,',
'    u.update_date,',
'    p.project,',
'    s.Status_Short_Desc status,',
'    decode(s.is_closed_status,''Y'',''black'',col.color_name) color_code,',
'    decode(p.PARENT_PROJECT_ID,null,null,',
'     (select PROJECT d from eba_proj_status where id = p.PARENT_PROJECT_ID)) parent_project,',
'    p.PARENT_PROJECT_ID',
'from',
'    EBA_PROJ_STATUS_RPTS u,',
'    EBA_PROJ_STATUS p,',
'    EBA_PROJ_STATUS_CODES s,',
'    EBA_PROJ_COLOR_CODES col',
'where',
'    p.id = u.project_id',
'and',
'    ( u.update_owner = lower(:APP_USER)',
'    OR',
'    (u.viewable_by = ''Submitter and Project Members''',
'           and exists ( select null',
'                        from eba_proj_user_ref rf,',
'                            eba_proj_status_users u,',
'                            eba_proj_roles r',
'                        where rf.project_id = p.id',
'                            and rf.user_id = u.id',
'                            and lower(u.username) = lower(:APP_USER)',
'                            and rf.role_id = r.id',
'                            and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' )',
'    )',
'    OR',
'    u.viewable_by = ''All'' ',
'    )',
'and',
'    p.PROJECT_STATUS = s.id(+)',
'and',
'    col.id(+) = s.color_code_id',
'and',
'    (',
'       :P117_SEARCH is null or',
'       instr(upper(p.project),upper(:P117_SEARCH)) > 0 or',
'       instr(upper(p.row_key),upper(:P117_SEARCH)) > 0 or',
'       instr(upper(p.code_name),upper(:P117_SEARCH)) > 0 or',
'       instr(upper(u.row_key),upper(:P117_SEARCH)) > 0 or',
'       instr(upper(dbms_lob.substr(u.STATUS_UPDATE,2000,1)),upper(:P117_SEARCH)) > 0 or',
'       instr(upper(dbms_lob.substr(u.STATUS_UPDATE,2000,1990)),upper(:P117_SEARCH)) > 0 or',
'       instr(upper(dbms_lob.substr(u.STATUS_UPDATE,2000,3990)),upper(:P117_SEARCH)) > 0 or',
'       instr(upper(u.update_owner),upper(:P117_SEARCH)) > 0',
'    )',
'and (',
'      lower(u.update_owner) = lower(:P117_OWNER) or',
'      :P117_OWNER is null or',
'      :P117_OWNER = ''All Submitters''',
'    )',
'and (',
'        nvl(:P117_PROJECT,0) = 0 or p.id = :P117_PROJECT',
'        or',
'        (',
'         nvl(:P117_SHOW_CHILD_PROJ,''N'') = ''Y''',
'         and',
'         p.parent_project_id = :P117_PROJECT',
'        )',
'    )',
'and (nvl(:P117_TIMEFRAME,0) = 0 or u.update_date > (systimestamp - nvl(:P117_TIMEFRAME,0)))',
'order by u.update_date desc, p.project'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_plug_query_num_rows_item=>'P117_ROWS'
,p_plug_query_no_data_found=>'No status reports found'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'UPDATE_DATE',
  'attribute_02', 'COLOR_CODE',
  'attribute_03', 'STATUS_TITLE',
  'attribute_04', 'THE_LINK',
  'attribute_05', 'STATUS_TITLE',
  'attribute_06', 'STATUS_OWNER',
  'attribute_07', 'PROJECT',
  'attribute_08', 'PARENT_PROJECT',
  'attribute_09', 'STATUS_UPDATE',
  'attribute_12', 'D',
  'attribute_13', 'STATUS')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768908422742562576)
,p_name=>'THE_LINK'
,p_data_type=>'THE_LINK'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'The link'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768908505529562577)
,p_name=>'ID'
,p_data_type=>'ID'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768908693649562579)
,p_name=>'STATUS_REPORT_ROW_KEY'
,p_data_type=>'STATUS_REPORT_ROW_KEY'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Row Key'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768908892761562581)
,p_name=>'PROJECT_ID'
,p_data_type=>'PROJECT_ID'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project ID'
,p_display_sequence=>60
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768909001130562582)
,p_name=>'STATUS_TITLE'
,p_data_type=>'STATUS_TITLE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Title'
,p_display_sequence=>70
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768909092613562583)
,p_name=>'STATUS_UPDATE'
,p_data_type=>'STATUS_UPDATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Update'
,p_display_sequence=>80
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768909261030562584)
,p_name=>'STATUS_OWNER'
,p_data_type=>'STATUS_OWNER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Submitter'
,p_display_sequence=>90
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768909424728562586)
,p_name=>'UPDATE_DATE'
,p_data_type=>'UPDATE_DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Update Date'
,p_display_sequence=>110
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768909512537562587)
,p_name=>'PROJECT'
,p_data_type=>'PROJECT'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project'
,p_display_sequence=>120
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768909718830562589)
,p_name=>'STATUS'
,p_data_type=>'STATUS'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>140
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768909926219562591)
,p_name=>'COLOR_CODE'
,p_data_type=>'COLOR_CODE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color'
,p_display_sequence=>160
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6768910060036562592)
,p_name=>'PARENT_PROJECT'
,p_data_type=>'PARENT_PROJECT'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Parent Project'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(6768910202636562594)
,p_name=>'PARENT_PROJECT_ID'
,p_data_type=>'PARENT_PROJECT_ID'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Parent Project ID'
,p_display_sequence=>190
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6067006087371943060)
,p_name=>'Legend'
,p_parent_plug_id=>wwv_flow_imp.id(6768908286164562575)
,p_display_sequence=>10
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    c.sprite_url,',
'    c.sprite_position_x,',
'    c.sprite_position_y,',
'    s.Status_Short_Desc',
'from',
'    EBA_PROJ_STATUS_CODES s,',
'    eba_proj_color_codes c',
'where',
'    s.color_code_id = c.id',
'and',
'    s.is_active_yn = ''Y''',
'order by',
'    s.display_sequence'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_num_rows_type=>'0'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6067006402271943070)
,p_query_column_id=>1
,p_column_alias=>'SPRITE_URL'
,p_column_display_sequence=>1
,p_column_heading=>'Sprite Url'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6067006482995943070)
,p_query_column_id=>2
,p_column_alias=>'SPRITE_POSITION_X'
,p_column_display_sequence=>2
,p_column_heading=>'Sprite Position X'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6067006596793943070)
,p_query_column_id=>3
,p_column_alias=>'SPRITE_POSITION_Y'
,p_column_display_sequence=>3
,p_column_heading=>'Sprite Position Y'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6067006285991943067)
,p_query_column_id=>4
,p_column_alias=>'STATUS_SHORT_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Status Short Desc'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6061455399186941390)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(6061454194205941386)
,p_button_name=>'P117_RESET'
,p_button_static_id=>'P117_RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.:RP,117::'
,p_icon_css_classes=>'fa-undo-alt'
,p_request_source_type=>'ALWAYS_NULL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6061451186527883221)
,p_branch_action=>'f?p=&FLOW_ID.:117:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6061454403757941388)
,p_name=>'P117_SHOW_CHILD_PROJ'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6061454194205941386)
,p_item_default=>'Y'
,p_prompt=>'Show Child Projects'
,p_source=>'Y'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_cHeight=>1
,p_display_when=>'P117_PROJECT'
,p_display_when2=>'0'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(19782202788559795354)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6061454814091941389)
,p_name=>'P117_ROWS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6061454194205941386)
,p_item_default=>'100'
,p_prompt=>'Rows'
,p_source=>'100'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'NUMBER OF ROWS'
,p_lov=>'.'||wwv_flow_imp.id(6837380404471503108)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6061455002632941389)
,p_name=>'P117_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6061454194205941386)
,p_prompt=>'Search'
,p_placeholder=>'Search Status Reports'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6061455787758941390)
,p_name=>'P117_OWNER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6061454194205941386)
,p_prompt=>'Submitter'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUS REPORT SUBMITTER'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'     distinct',
'     case',
'         when instr(u.update_owner,''@'') > 0 then',
'             case',
'                 when instr( replace( substr( u.update_owner, 1, instr(u.update_owner,''@'' ) - 1), ''.'', '' '' ), '' '', 1, 2 ) > 0 then',
'                     substr( replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' ), 1, instr( replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' ), '' '', 1, 1 ) )'
||' ||',
'                     substr( replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' ), instr( replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' ), '' '', 1, 2 ) )',
'             else',
'                 replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' )',
'             end',
'     else',
'         lower(u.update_owner)',
'     end d,',
'     lower(u.update_owner) r',
'from EBA_PROJ_STATUS_RPTS u,',
'     EBA_PROJ_STATUS p',
'where p.id = u.project_id ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Submitters -'
,p_lov_null_value=>'All Submitters'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6061456712532941398)
,p_name=>'P117_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6061454194205941386)
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
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6072516785873231344)
,p_name=>'P117_TIMEFRAME'
,p_item_sequence=>55
,p_item_plug_id=>wwv_flow_imp.id(6061454194205941386)
,p_item_default=>'28'
,p_prompt=>'Timeframe'
,p_source=>'28'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME - LONGER'
,p_lov=>'.'||wwv_flow_imp.id(6072479693769082825)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(6061450793408883204)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'117'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15331870149866223518)
,p_name=>'Refresh results on filter value change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P117_PROJECT,P117_SHOW_CHILD_PROJ,P117_OWNER,P117_TIMEFRAME,P117_ROWS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331870252855223519)
,p_event_id=>wwv_flow_imp.id(15331870149866223518)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P117_PROJECT,P117_SHOW_CHILD_PROJ,P117_OWNER,P117_TIMEFRAME,P117_ROWS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331870409487223520)
,p_event_id=>wwv_flow_imp.id(15331870149866223518)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768908286164562575)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15332253208463383612)
,p_name=>'Search Status Reports on Enter'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P117_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.keyCode == 13'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'change, keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15332254594467383614)
,p_event_id=>wwv_flow_imp.id(15332253208463383612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P117_SEARCH,P117_PROJECT,P117_SHOW_CHILD_PROJ,P117_OWNER,P117_TIMEFRAME,P117_ROWS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15332254109906383614)
,p_event_id=>wwv_flow_imp.id(15332253208463383612)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'this.browserEvent.preventDefault();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15332253522054383614)
,p_event_id=>wwv_flow_imp.id(15332253208463383612)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768908286164562575)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
