prompt --application/pages/page_00065
begin
--   Manifest
--     PAGE: 00065
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
 p_id=>65
,p_name=>'&APPLICATION_TITLE.: Projects By Owner'
,p_step_title=>'&APPLICATION_TITLE.: Projects By Owner'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style type="text/css" media="all">',
'div.body_inner div.region div.content_block{height:200px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;}',
'.tbl-main .rounded-corner-region .rc-body-r{height:170px !important;}',
'',
'#MILESTONES .rc-body-r{height:500px !important;}',
'#TO .rc-body-r{height:280px !important;}',
'',
'</style>'))
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".t-Report-report").setTableHeadersAsFixed();',
'apex.theme42.sticky(".js-stickyTableHeader");'))
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6697791100031890839)
,p_name=>'Top Owners'
,p_region_name=>'TO'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Region--hideHeader'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--inline:t-Report--rowHighlightOff'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with total_count as (',
'select count(*) c',
'from eba_proj_status p',
' where (  ',
'       p.project_status not in (',
'       select id',
'       from eba_proj_status_codes',
'       where is_closed_status = ''Y''',
'                            )',
'       ) and',
'    (nvl(:P65_CATEGORY,0) = 0 or p.CAT_ID = :P65_CATEGORY) and',
'    (nvl(:P65_STATUS,''x'') = ''x'' or instr(:P65_STATUS,p.PROJECT_STATUS) > 0) and',
'     (:P65_SEARCH is null or ',
'         instr(upper(p.PROJECT), upper(:P65_SEARCH)) > 0 or',
'         instr(upper(p.tags), upper(:P65_SEARCH)) > 0 or',
'         instr(upper(p.goal), upper(:P65_SEARCH)) > 0 or',
'         instr((select upper(s.status_short_desc)',
'                from eba_proj_status_codes s',
'                where s.id = p.project_status),upper(:P65_SEARCH)) > 0 or',
'         instr(upper(p.row_key),upper(:P65_SEARCH)) > 0 or',
'         instr(upper(p.code_name),upper(:P65_SEARCH)) > 0 )',
')',
'select lower(u.username) project_owner,',
'       count(*) as c,',
'       decode(total_count.c,0,0,100*count(*)/total_count.c) pct_total,',
'       max(p.updated) last_updated',
'  from total_count,',
'    eba_proj_status p,',
'    eba_proj_user_ref rf,',
'    eba_proj_roles r,',
'    eba_proj_status_users u',
' where rf.project_id = p.id',
'    and rf.user_id = u.id',
'    and rf.role_id = r.id',
'    and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'    and (  ',
'       p.project_status not in (',
'       select id',
'       from eba_proj_status_codes',
'       where is_closed_status = ''Y''',
'                            )',
'       ) and',
'    (nvl(:P65_CATEGORY,0) = 0 or p.CAT_ID = :P65_CATEGORY) and',
'    (nvl(:P65_STATUS,''x'') = ''x'' or instr(:P65_STATUS,p.PROJECT_STATUS) > 0) and',
'     (:P65_SEARCH is null or ',
'         instr(upper(p.PROJECT), upper(:P65_SEARCH)) > 0 or',
'         instr(upper(p.tags), upper(:P65_SEARCH)) > 0 or',
'         instr(upper(p.goal), upper(:P65_SEARCH)) > 0 or',
'         instr((select upper(s.status_short_desc)',
'                from eba_proj_status_codes s',
'                where s.id = p.project_status),upper(:P65_SEARCH)) > 0 or',
'         instr(upper(p.row_key),upper(:P65_SEARCH)) > 0 or',
'         instr(upper(p.code_name),upper(:P65_SEARCH)) > 0 )',
' group by lower(u.username), total_count.c'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No owners found'
,p_query_row_count_max=>50000
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6697791374750890841)
,p_query_column_id=>1
,p_column_alias=>'PROJECT_OWNER'
,p_column_display_sequence=>1
,p_column_heading=>'Project Owner'
,p_column_link=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP:P64_OWNER,P64_STATUS,P64_CATEGORY:#PROJECT_OWNER#,&P65_STATUS.,&P65_CATEGORY.'
,p_column_linktext=>'#PROJECT_OWNER#'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>2
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6697791428654890846)
,p_query_column_id=>2
,p_column_alias=>'C'
,p_column_display_sequence=>2
,p_column_heading=>'Project Count'
,p_column_format=>'999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_default_sort_dir=>'desc'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6697864421586432933)
,p_query_column_id=>3
,p_column_alias=>'PCT_TOTAL'
,p_column_display_sequence=>4
,p_column_heading=>'% of Total'
,p_column_format=>'PCT_GRAPH'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6697793470866957781)
,p_query_column_id=>4
,p_column_alias=>'LAST_UPDATED'
,p_column_display_sequence=>3
,p_column_heading=>'Last Updated'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8959405039722900805)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs:t-Form--labelsAbove:t-Region--hideHeader'
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6774428512459036603)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'P65_GO'
,p_button_static_id=>'P65_GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'uButtonAlt'
,p_request_source=>'Go'
,p_request_source_type=>'STATIC'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8959405434950900805)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'P65_RESET'
,p_button_static_id=>'P65_RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_request_source=>'reset_page'
,p_request_source_type=>'STATIC'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6764562102333284590)
,p_name=>'P65_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8959405039722900805)
,p_prompt=>'Search'
,p_placeholder=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8959405645759900903)
,p_name=>'P65_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8959405039722900805)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare r varchar2(400) := null; ',
'begin',
'for c1 in (select ID from EBA_PROJ_STATUS_CODES where is_active_yn = ''Y''',
'order by display_sequence) loop',
'r := r||c1.id||'':'';',
'end loop;',
'return r;',
'exception when others then return ''0'';',
'end;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Status'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare r varchar2(400) := null; ',
'begin',
'for c1 in (select ID from EBA_PROJ_STATUS_CODES where is_active_yn = ''Y''',
'order by display_sequence) loop',
'r := r||c1.id||'':'';',
'end loop;',
'return r;',
'exception when others then return ''0'';',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'STATUS CODES WITH COUNTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select display_value, return_value',
'from',
'(',
'select STATUS_short_desc || '' (''||count(*)||'')'' display_value, ',
'       sc.ID return_value ,',
'       sc.display_sequence',
'from EBA_PROJ_STATUS_CODES sc, eba_proj_status s',
'where is_active_yn = ''Y'' and ',
'      status_short_desc is not null and',
'      s.project_status = sc.id',
'group by sc.STATUS_short_desc, sc.id, sc. display_sequence',
'order by 3,1',
') x'))
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8959405847913900903)
,p_name=>'P65_CATEGORY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8959405039722900805)
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
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(8959407119642900957)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'65'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8959407328575900957)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'clear cache for this page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_imp.id(8959405434950900805)
,p_internal_uid=>8959407328575900957
);
wwv_flow_imp.component_end;
end;
/
