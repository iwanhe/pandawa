prompt --application/pages/page_00141
begin
--   Manifest
--     PAGE: 00141
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
 p_id=>141
,p_name=>'Flex Column'
,p_step_title=>'Flex Column'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(6672329631813369836)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_protection_level=>'C'
,p_help_text=>'The flex column details page shows all of the details about the flex column assignment as well as the page list of affected forms and reports. The flex column assigned on date is displayed in a mini-calendar region on the right-hand side of the page.'
||' Click the <strong>Edit Flex Column</strong> button to edit the attributes of this flex column assignment.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6143587613069041772)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_plug_display_point=>'AFTER_HEADER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6143588608467041781)
,p_name=>'Page References'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.region_name,',
'    m.page_id,',
'    p.page_name page_title,',
'    case',
'        when m.region_type = ''CR'' then',
'            ''Classic Report''',
'        when m.region_type = ''IR'' then',
'            ''Interactive Report''',
'        when m.region_type = ''FORM'' then',
'            initcap(m.region_type)',
'    end as region_type,',
'    nvl(initcap(replace(p.authorization_scheme,''_'','' '')),''No Role Required'') authorization_scheme,',
'    p.page_requires_authentication requires_auth',
'from apex_application_page_regions r,',
'    apex_application_pages p,',
'    eba_proj_flex_page_map m',
'where r.application_id = :APP_ID',
'    and r.application_id = p.application_id',
'    and r.page_id = p.page_id',
'    and m.page_id = p.page_id',
'    and m.flex_table = (select flexible_table',
'                        from eba_proj_flex_registry',
'                        where id = :P141_ID)',
'    and r.source_type_code in (''DYNAMIC_QUERY'',''SQL_QUERY'',''STATIC_TEXT'')',
'    and upper(r.region_css_classes) like ''%FLEX%''',
'order by 2,4;'))
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No application forms affected by this flex column assignment'
,p_query_row_count_max=>500
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
 p_id=>wwv_flow_imp.id(6143588782452041784)
,p_query_column_id=>1
,p_column_alias=>'REGION_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Region Title'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143588905016041786)
,p_query_column_id=>2
,p_column_alias=>'PAGE_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Page'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143589011181041786)
,p_query_column_id=>3
,p_column_alias=>'PAGE_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Page Title'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143589096441041786)
,p_query_column_id=>4
,p_column_alias=>'REGION_TYPE'
,p_column_display_sequence=>3
,p_column_heading=>'Region Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143589183921041786)
,p_query_column_id=>5
,p_column_alias=>'AUTHORIZATION_SCHEME'
,p_column_display_sequence=>5
,p_column_heading=>'Authorization'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143589289739041786)
,p_query_column_id=>6
,p_column_alias=>'REQUIRES_AUTH'
,p_column_display_sequence=>6
,p_column_heading=>'Authentication'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6143589594654041786)
,p_name=>'Flex Column'
,p_region_name=>'FLEX_COLUMN'
,p_display_sequence=>40
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.id,',
'    r.row_version_number,',
'    r.flexible_table,',
'    r.flexible_column,',
'    decode(r.active_yn,''Y'',''Yes'',''N'',''No'') active_yn,',
'    r.form_label_text,',
'    nvl(r.report_label_text,r.form_label_text) report_label_text,',
'    (select l.template_name from apex_application_temp_label l where l.application_id = :APP_ID and l.label_template_id = r.label_template_id) as label_template,',
'    decode(r.is_required_yn,''Y'',''Yes'',''N'',''No'') is_required_yn,',
'    case',
'        when r.display_as = ''NUMBER'' then',
'            ''Number Field''',
'        when r.display_as = ''TEXT'' then',
'            ''Text Field''',
'        when r.display_as = ''DATE'' then',
'            ''Date Picker''',
'        when r.display_as = ''TEXTAREA'' then',
'            ''Text Area''',
'        when r.display_as = ''SELECT_LIST'' then',
'            ''Select List''',
'    end display_as,',
'    r.lov_type select_list_type,',
'    r.lov_sql_query,',
'    r.width,',
'    r.max_width,',
'    r.height,',
'    r.format_mask,',
'    initcap(r.label_alignment) label_alignment,',
'--    r.help_text,',
'    decode(r.is_displayed_on_ir,''Y'',''Yes'',''N'',''No'') is_displayed_on_ir,',
'    initcap(nvl(r.updated_by,r.created_by)) last_updated_by,',
'    nvl(r.updated,r.created) last_updated    ',
'from eba_proj_flex_registry r',
'where r.id = :P141_ID',
'order by 1',
''))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672366433573369912)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143589799759041786)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143589900894041786)
,p_query_column_id=>2
,p_column_alias=>'ROW_VERSION_NUMBER'
,p_column_display_sequence=>1
,p_column_heading=>'Row Version Number'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143590091063041786)
,p_query_column_id=>3
,p_column_alias=>'FLEXIBLE_TABLE'
,p_column_display_sequence=>4
,p_column_heading=>'Flexible Table'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143590194711041786)
,p_query_column_id=>4
,p_column_alias=>'FLEXIBLE_COLUMN'
,p_column_display_sequence=>3
,p_column_heading=>'Flexible Column'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143590297167041786)
,p_query_column_id=>5
,p_column_alias=>'ACTIVE_YN'
,p_column_display_sequence=>5
,p_column_heading=>'Active'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143590403858041786)
,p_query_column_id=>6
,p_column_alias=>'FORM_LABEL_TEXT'
,p_column_display_sequence=>12
,p_column_heading=>'Form Label Text'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143590508379041786)
,p_query_column_id=>7
,p_column_alias=>'REPORT_LABEL_TEXT'
,p_column_display_sequence=>15
,p_column_heading=>'Report Label Text'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143590605970041786)
,p_query_column_id=>8
,p_column_alias=>'LABEL_TEMPLATE'
,p_column_display_sequence=>11
,p_column_heading=>'Form Label Template'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143590697439041786)
,p_query_column_id=>9
,p_column_alias=>'IS_REQUIRED_YN'
,p_column_display_sequence=>10
,p_column_heading=>'Is Required'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143590814515041786)
,p_query_column_id=>10
,p_column_alias=>'DISPLAY_AS'
,p_column_display_sequence=>6
,p_column_heading=>'Display As'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143590914622041787)
,p_query_column_id=>11
,p_column_alias=>'SELECT_LIST_TYPE'
,p_column_display_sequence=>8
,p_column_heading=>'Select List Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143591000347041787)
,p_query_column_id=>12
,p_column_alias=>'LOV_SQL_QUERY'
,p_column_display_sequence=>9
,p_column_heading=>'Select List  SQL Query'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where id = :P41_ID',
'    and lov_type = ''DYNAMIC'''))
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143591107252041787)
,p_query_column_id=>13
,p_column_alias=>'WIDTH'
,p_column_display_sequence=>16
,p_column_heading=>'Width'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143591193102041787)
,p_query_column_id=>14
,p_column_alias=>'MAX_WIDTH'
,p_column_display_sequence=>17
,p_column_heading=>'Max Width'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143591294529041787)
,p_query_column_id=>15
,p_column_alias=>'HEIGHT'
,p_column_display_sequence=>19
,p_column_heading=>'Height'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143591385904041787)
,p_query_column_id=>16
,p_column_alias=>'FORMAT_MASK'
,p_column_display_sequence=>7
,p_column_heading=>'Format Mask'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where id = :P41_ID',
'    and display_as in (''DATE'',''NUMBER'')'))
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143591500510041788)
,p_query_column_id=>17
,p_column_alias=>'LABEL_ALIGNMENT'
,p_column_display_sequence=>13
,p_column_heading=>'Form Label Alignment'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143591687065041788)
,p_query_column_id=>18
,p_column_alias=>'IS_DISPLAYED_ON_IR'
,p_column_display_sequence=>14
,p_column_heading=>'Displayed in Interactive Reports'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143591810595041788)
,p_query_column_id=>19
,p_column_alias=>'LAST_UPDATED_BY'
,p_column_display_sequence=>18
,p_column_heading=>'Last Updated By'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6143591904883041788)
,p_query_column_id=>20
,p_column_alias=>'LAST_UPDATED'
,p_column_display_sequence=>20
,p_column_heading=>'Last Updated'
,p_column_format=>'since'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6143591993682041788)
,p_plug_name=>'Flex Column Assigned'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select created, ''Flex Column Assigned'' lbl',
'from eba_proj_flex_registry',
'where id = :P141_ID'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.MINICALENDAR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'CREATED',
  'attribute_02', 'LBL')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6143592385653041788)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6143587391450041772)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'EDIT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edit Flex Column'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:142:&SESSION.::&DEBUG.:RP,142:P142_ID:&P141_ID.'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6143592994258041790)
,p_branch_action=>'f?p=&APP_ID.:141:&SESSION.::&DEBUG.::P141_ID:&P141_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 11-JAN-2012 16:02 by MIKE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6143587788553041772)
,p_name=>'P141_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6143587613069041772)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(6143592804642041789)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp.component_end;
end;
/
