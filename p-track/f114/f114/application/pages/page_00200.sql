prompt --application/pages/page_00200
begin
--   Manifest
--     PAGE: 00200
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
 p_id=>200
,p_name=>'Project Details'
,p_step_title=>'&P200_PROJECT_NAME.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.js-dynamicHideShowRegion { display: none }',
'.apex-rds { visibility: hidden }',
'.completed-milestones { display: block; font-size: 11px; border-top: 1px solid rgba(0, 0, 0, .1); padding: 8px }',
'.timeline-edit-links .t-StatusList-editLink { position: absolute; right: 8px; top: 8px; font-size: 12px; line-height: 16px; float: right; padding: 4px 8px }',
'.timeline-edit-links .t-StatusList-itemBody { position: relative }',
'.timeline-edit-links .t-StatusList-item { border-bottom: 1px solid rgba(0, 0, 0, .05) }',
'.timeline-edit-links .t-StatusList-item:last-child { border-bottom: none }',
'.t-Report--cleanBorders .t-Report-colHead { border-bottom: 1px solid rgba(0, 0, 0, .05); background-color: #fcfcfc; color: #707070; font-weight: normal; padding-bottom: .8rem; padding-top: .8rem }',
'.t-Report--cleanBorders .js-stickyTableHeader.is-stuck .t-Report-colHead { border-bottom: 0; }',
'.link-comments { color: #707070; word-break: break-word; margin-top: 4px }',
'.link-comments:empty { display: none }',
'.apex-edit-pencil { vertical-align: top }',
'.project-audit-info { font-size: 11px; line-height: 16px; color: #707070; }',
'.t-Report--cleanBorders .t-Report-cell { border-top: 1px solid #F4F4F4; }',
'.updates-region .t-Region-header { border-bottom-color: transparent; }',
'.t-StatusList-itemTitle { font-size: 14px; }',
'.file-icon.fa-file-powerpoint-o,',
'.file-icon.fa-file-excel-o,',
'.file-icon.fa-file-word-o,',
'.file-icon.fa-file-pdf-o,',
'.file-icon.fa-file-image-o,',
'.file-icon.fa-file-o { padding: 4px 8px; text-align: center; color: #FFF; border-radius: 2px; }',
'.file-icon.fa-file-powerpoint-o { background-color: #D24726; }',
'.file-icon.fa-file-excel-o { background-color: #217345; }',
'.file-icon.fa-file-word-o { background-color: #2A579A; }',
'.file-icon.fa-file-pdf-o { background-color: #F40700; }',
'.file-icon.fa-file-image-o { background-color: #F6BB32; }',
'.file-icon.fa-file-o { Background-color: #A5ADB8; }',
'td[headers=ICON] { padding-right: 0; padding-left: 8px; }',
'.t-StatusList-itemTitle { margin-right: 48px; }',
'.small-profile-photo { display: block; width: 32px; height: 32px; background-size: cover; background-repeat: no-repeat; border-radius: 100%; box-shadow: 0 0 0 1px rgba(0, 0, 0, .1) inset; }',
'.t-Comments-userIcon.comment-user-has-photo {',
'    border-width: 0;',
'}',
'.t-Body-title-shrink span.project-key-badge { padding: 4px 8px; line-height: 16px; font-weight: normal; font-size: 10px; margin: 0 0 0 4px; }',
'span.project-key-badge { box-shadow: 0 0 0 1px rgba(0, 0, 0, .15) inset; background-color: rgba(0, 0, 0, .05); font-size: 14px; display: inline-block; line-height: 20px; vertical-align: top; padding: 4px 8px; border-radius: 2px; color: #707070; margi'
||'n: 2px 0; }',
'',
'.t-Badge.is-hidden {',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_imp.id(6672329631813369836)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'&P200_HELP_TEXT.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6061426488572532855)
,p_name=>'Status Reports'
,p_region_name=>'projectStatusReports'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-dynamicHideShowRegion'
,p_region_sub_css_classes=>'t-Report--cleanBorders'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    u.status_title,',
'    eba_proj_fw.format_status_report( dbms_lob.substr(u.status_update,450,1), ''Y'',:APP_ID,:APP_SESSION,u.project_id, ''N'', 400, u.id ) note_text,',
'    lower(u.update_owner) created_by,',
'    to_char(u.update_date,:APP_DATE_FORMAT) created_on,',
'    u.id,',
'    u.update_date,',
'    (select us.id from eba_proj_status_users us where upper(u.update_owner) = upper(us.username)) as user_id',
'from eba_proj_status_rpts u,',
'     eba_proj_status p',
'where u.project_id = p.id',
'  AND (  u.update_owner = lower(:APP_USER)',
'         OR',
'         (u.viewable_by = ''Submitter and Project Members''',
'               and exists ( select null',
'                            from eba_proj_user_ref rf,',
'                                eba_proj_status_users usr',
'                            where rf.project_id = p.id',
'                                and rf.user_id = usr.id',
'                                and lower(usr.username) = lower(:APP_USER)',
'                                and eba_proj_fw.is_edit_authorized( usr.username, rf.project_id ) = ''Y'' )',
'         )',
'         OR',
'         u.viewable_by = ''All''',
'      )',
'  AND ( u.project_id = :P200_ID ',
'       /* or (nvl(:P200_INC_CHILD,''N'') = ''Y''',
'            and u.project_id in (select s.id ',
'                                 from EBA_PROJ_STATUS s',
'                                 where s.parent_project_id = :P200_ID)) */',
'      )',
'order by u.update_date desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
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
 p_id=>wwv_flow_imp.id(6064280501444564810)
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
 p_id=>wwv_flow_imp.id(6061426997041532864)
,p_query_column_id=>2
,p_column_alias=>'NOTE_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Status Report'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6061427798543532865)
,p_query_column_id=>3
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>3
,p_column_heading=>'Submitted By'
,p_column_html_expression=>'<a href="f?p=&APP_ID.:137:&APP_SESSION.:::137:P137_ID:#USER_ID#">#CREATED_BY#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6061427510832532865)
,p_query_column_id=>4
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>4
,p_column_heading=>'Submitted'
,p_column_format=>'SINCE'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_report_column_width=>180
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6061692290092636504)
,p_query_column_id=>5
,p_column_alias=>'ID'
,p_column_display_sequence=>6
,p_column_heading=>'Id'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6061427690629532865)
,p_query_column_id=>6
,p_column_alias=>'UPDATE_DATE'
,p_column_display_sequence=>5
,p_column_heading=>'Update Date'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17204379665896832126)
,p_query_column_id=>7
,p_column_alias=>'USER_ID'
,p_column_display_sequence=>7
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6064037399786433706)
,p_plug_name=>'Project Content'
,p_region_name=>'projectContentActions'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-LinksList--showIcons:t-LinksList--actions'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_list_id=>wwv_flow_imp.id(6064035707985433696)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6672372065359369922)
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6064098393532904176)
,p_name=>'Project Validations'
,p_region_name=>'view_validations'
,p_template=>wwv_flow_imp.id(6672356708893369886)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'REGION_POSITION_04'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(verified_by ) verified_by, created ver_date, created, verification_comment',
'from eba_proj_status_verifications',
'where project_id = :P200_ID',
'order by created desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no validations have been recorded'
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
,p_required_patch=>wwv_flow_imp.id(6064816709620137382)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6064098589291904182)
,p_query_column_id=>1
,p_column_alias=>'VERIFIED_BY'
,p_column_display_sequence=>1
,p_column_heading=>'Verified By'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6064098899286904183)
,p_query_column_id=>2
,p_column_alias=>'VER_DATE'
,p_column_display_sequence=>3
,p_column_heading=>'Date'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6064098693889904183)
,p_query_column_id=>3
,p_column_alias=>'CREATED'
,p_column_display_sequence=>2
,p_column_heading=>'Verified'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6064098782752904183)
,p_query_column_id=>4
,p_column_alias=>'VERIFICATION_COMMENT'
,p_column_display_sequence=>4
,p_column_heading=>'Comment'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6066430401544758672)
,p_name=>'Child Projects'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-dynamicHideShowRegion'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--displayInitials:t-Cards--4cols:t-Cards--desc-2ln:u-colors:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lvl,',
'   project card_title,',
'    target card_link,',
'   is_current_list_entry,',
'   image,',
'   image_attrib,',
'   image_alt,',
'   attribute1 card_text,',
'   attribute2,',
'   attribute3 card_initials,',
'   null card_subtext',
'from (',
'select  null lvl,',
'        project,',
'        apex_util.prepare_url(''f?p=&APP_ID.:200:''||:APP_SESSION',
'                              ||''::::PROJECT_CAME_FROM,P200_ID:200,''||s.id) target,',
'        null is_current_list_entry,',
'        null image,',
'        null image_attrib,',
'        null image_alt,',
'        ''Status: ''||nvl(c.status_short_desc,''unknown'')||'', Owners: ''||',
'               (   select listagg(eba_proj_fw.get_name_from_email_address(u.username),'', '') within group',
'                       (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'                   from eba_proj_user_ref rf,',
'                       eba_proj_status_users u,',
'                       eba_proj_roles r',
'                   where rf.project_id = s.id',
'                       and rf.user_id = u.id',
'                       and rf.role_id = r.id',
'                       and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' )',
'         as attribute1,',
'       null attribute2,',
'       NVL(upper(',
'          decode(instr(s.PROJECT,'' ''),',
'                 0, ',
'                 substr(s.PROJECT,1,2),',
'                 substr(s.PROJECT,1,1)||substr(s.PROJECT,instr(s.PROJECT,'' '')+1,1)',
'           )),''CP'')  attribute3',
'from eba_proj_status s,',
'    eba_proj_status_codes c',
'where parent_project_id = :P200_ID',
'    and c.id = s.PROJECT_STATUS',
'    and ( :P200_SHOW_CLOSED_CHILDREN = ''ALL''',
'        or c.is_closed_status = ''N'' )',
'order by lower(project)',
') x'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P200_SHOW_CLOSED_CHILDREN'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6726044247164908098)
,p_query_num_rows=>1500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'This project has no child projects.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from eba_proj_status s',
'where parent_project_id = :P200_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12662986262881699030)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>1
,p_column_heading=>'Lvl'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12662986406010699031)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Card title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12662986433830699032)
,p_query_column_id=>3
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>3
,p_column_heading=>'Card link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12662986535255699033)
,p_query_column_id=>4
,p_column_alias=>'IS_CURRENT_LIST_ENTRY'
,p_column_display_sequence=>4
,p_column_heading=>'Is current list entry'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12662986710798699034)
,p_query_column_id=>5
,p_column_alias=>'IMAGE'
,p_column_display_sequence=>5
,p_column_heading=>'Image'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12662986728759699035)
,p_query_column_id=>6
,p_column_alias=>'IMAGE_ATTRIB'
,p_column_display_sequence=>6
,p_column_heading=>'Image attrib'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12662986882360699036)
,p_query_column_id=>7
,p_column_alias=>'IMAGE_ALT'
,p_column_display_sequence=>7
,p_column_heading=>'Image alt'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12662986925983699037)
,p_query_column_id=>8
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>8
,p_column_heading=>'Card text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12662987105910699038)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE2'
,p_column_display_sequence=>9
,p_column_heading=>'Attribute2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12662987228227699040)
,p_query_column_id=>10
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>10
,p_column_heading=>'Card initials'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12662987375693699041)
,p_query_column_id=>11
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>11
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6629871324091806479)
,p_plug_name=>'RDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'NO')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6750648344639550606)
,p_plug_name=>'Action Items'
,p_region_name=>'projectActionItems'
,p_region_css_classes=>'js-dynamicHideShowRegion timeline-edit-links'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    x.id,',
'    x.action title,',
'    --',
'    case when x.ACTION_STATUS in (''Closed'',''Not Applicable'') then',
'            ''Black''',
'        when trunc(x.due_date) < trunc(sysdate) then',
'            ''Red''',
'        when trunc(x.due_date) = trunc(sysdate) then',
'            ''Yellow''',
'        else',
'            ''Green''',
'    end as color,',
'    --',
'    case when x.link_url is not null and x.link_text is not null and exists (select null',
'                 from apex_application_build_options',
'                where application_id = :APP_ID',
'                  and build_option_name = ''Action Item Links''',
'                  and build_option_status = ''Include'') then',
'        ''<small><a href="'' || link_url || ''" target="_blank">'' || x.link_text || ''</a></small>''',
'    end as link_text,',
'    --',
'    case when x.ACTION_STATUS in (''Closed'',''Not Applicable'') then',
'            ''Closed or N/A''',
'        when trunc(x.due_date) < trunc(sysdate) then',
'            ''Past Due''',
'        when trunc(x.due_date) = trunc(sysdate) then',
'            ''Due Today''',
'        else',
'            ''Due In The Future''',
'    end as color_label,',
'    --',
'    case when x.ACTION_STATUS = ''Closed'' then',
'            x.completed_date',
'        else',
'            x.due_date',
'    end as calendar_icon_date,',
'    --',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':78:''||:APP_SESSION',
'                ||'':::78:LAST_VIEW,P78_ACTION_ITEM_ID,P55_ID,P200_ID:200,''',
'                ||x.id||'',''||:P200_ID||'',''||:P200_ID) link,',
'    --',
'    decode(x.milestone_id,null,null,(select milestone_name m from eba_proj_status_ms j where j.id = x.milestone_id)) milestone,',
'    x.project,',
'    x.action_description,',
'    x.ACTION_STATUS status,',
'    x.due_date due_date,',
'    apex_util.get_since(x.completed_date) as completed,',
'    --',
'    case when apex_util.get_build_option_status (',
'        p_application_id => :APP_ID, ',
'        p_build_option_name => ''Mandatory Action Item Resolution'') = ''INCLUDE'' and resolution is not null then',
'        ''Resolution: '' || x.resolution',
'    else',
'        null',
'    end resolution,',
'    --',
'    apex_util.get_since(x.due_date) display_due_date,',
'    --',
'    case when x.owner_role_id is null then',
'        eba_proj_fw.get_name_from_email_address(x.action_owner_01)',
'            ||decode(x.action_owner_02,null,null,'', ''||eba_proj_fw.get_name_from_email_address(x.action_owner_02))',
'            ||decode(x.action_owner_03,null,null,'', ''||eba_proj_fw.get_name_from_email_address(x.action_owner_03))',
'            ||decode(x.action_owner_04,null,null,'', ''||eba_proj_fw.get_name_from_email_address(x.action_owner_04))',
'    else',
'        nvl(',
'          (select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),',
'                decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), ',
'                  initcap(u.first_name || '' '' || u.last_name))),'', '')',
'                within group (order by lower(u.username)) owner',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.role_id = x.owner_role_id',
'                and rf.project_id = x.project_id',
'                and u.id = rf.user_id',
'                and r.id = rf.role_id',
'            group by r.name',
'        ), (select ''No ''||r.name||'' defined''',
'            from eba_proj_roles r',
'            where r.id = x.owner_role_id)',
'        )',
'    end as owner,',
'    --',
'    row_key,',
'    ''Project'' project_label,',
'    ''Status'' status_label,',
'    case when eba_proj_fw.is_edit_authorized(',
'        p_username   => upper(:APP_USER),',
'        p_project_id => :P200_ID ) = ''Y'' then',
'        ''<a href="''',
'          ||apex_util.prepare_url(',
'              p_url => ''f?p=''||:APP_ID||'':73:''||:APP_SESSION||'':::73:P73_ID:''||id,',
'              p_triggering_element => ''$(''''#projectActionItems'''')'')||''"',
'         class="t-StatusList-editLink">Edit</a>''',
'    else',
'        null',
'    end as edit_link',
'from',
'(',
'select a.id,',
'       a.row_key,',
'       a.action,',
'       a.action_description,',
'       a.due_date,',
'       a.link_url,',
'       a.link_text,',
'       a.ACTION_STATUS,',
'       a.completed_date,',
'       a.milestone_id,',
'       s.project,',
'       a.resolution,',
'       a.action_owner_01,',
'       a.action_owner_02,',
'       a.action_owner_03,',
'       a.action_owner_04,',
'       a.OWNER_ROLE_ID,',
'       a.project_id',
'from eba_proj_status_ais a,',
'     eba_proj_status s,',
'     eba_proj_status_codes c',
'where a.project_id = s.id',
'    and s.project_status = c.id(+)',
'    and ( ',
'           (',
'               :P200_SHOW_CLOSED_AIS = ''OPEN''',
'               and ',
'               upper(a.action_status) = :P200_SHOW_CLOSED_AIS',
'           )',
'        or',
'           (',
'               :P200_SHOW_CLOSED_AIS = ''ALL''',
'               and ',
'               upper(a.action_status) in (''OPEN'',''CLOSED'',''NOT APPLICABLE'')',
'           )',
'        )',
'    and (',
'            a.project_id = :P200_ID',
'            or ',
'            (a.project_id in (select ps.id from EBA_PROJ_STATUS ps where ps.parent_project_id = :P200_ID))',
'        )',
'order by a.due_date, a.action',
') x',
'where rownum < 100'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_plug_query_num_rows=>5000
,p_plug_query_no_data_found=>'No open Action Items found.'
,p_required_patch=>wwv_flow_imp.id(11756699376794143132)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'DUE_DATE',
  'attribute_02', 'COLOR',
  'attribute_03', 'TITLE',
  'attribute_04', 'LINK',
  'attribute_05', 'DISPLAY_DUE_DATE',
  'attribute_06', 'PROJECT',
  'attribute_07', 'MILESTONE',
  'attribute_08', 'OWNER',
  'attribute_09', 'ACTION_DESCRIPTION',
  'attribute_10', 'RESOLUTION',
  'attribute_11', 'EDIT_LINK',
  'attribute_12', 'D',
  'attribute_13', 'STATUS',
  'attribute_14', 'COLOR_LABEL',
  'attribute_15', 'LINK_TEXT')).to_clob
,p_plug_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 x',
'from eba_proj_status_ais a,',
'    eba_proj_status s,',
'    eba_proj_status_codes c',
'where a.project_id = s.id',
'    and s.project_status = c.id(+)',
'    and (a.action_status = ''Open''',
'        or a.due_date > (sysdate - 90) )',
'    and ( a.project_id = :P200_ID',
'        or (a.project_id in (select ps.id from EBA_PROJ_STATUS ps where ps.parent_project_id = :P200_ID)))'))
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6750648473971550607)
,p_name=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6750648512729550608)
,p_name=>'TITLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Title'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760416489827200359)
,p_name=>'COLOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760416584834200360)
,p_name=>'LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Link'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760416807199200362)
,p_name=>'PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project'
,p_display_sequence=>60
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760416956066200363)
,p_name=>'ACTION_DESCRIPTION'
,p_data_type=>'CLOB'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Action description'
,p_display_sequence=>70
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760417001551200364)
,p_name=>'STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>80
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760417175499200365)
,p_name=>'DUE_DATE'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Due date'
,p_display_sequence=>90
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760417264907200366)
,p_name=>'OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Owner'
,p_display_sequence=>100
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6760417311639200367)
,p_name=>'ROW_KEY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Row key'
,p_display_sequence=>110
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12662989445927699062)
,p_name=>'PROJECT_LABEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Project label'
,p_display_sequence=>120
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12662989526944699063)
,p_name=>'STATUS_LABEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status label'
,p_display_sequence=>130
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12742813558369434515)
,p_name=>'EDIT_LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_display_sequence=>140
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15213096247337322340)
,p_name=>'COLOR_LABEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Color label'
,p_display_sequence=>150
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15464076893305166317)
,p_name=>'DISPLAY_DUE_DATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Due'
,p_display_sequence=>160
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18067128450840239733)
,p_name=>'RESOLUTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Resolution'
,p_display_sequence=>170
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18296373809601442055)
,p_name=>'LINK_TEXT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Link text'
,p_display_sequence=>180
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19204382283474214130)
,p_name=>'MILESTONE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Milestone'
,p_display_sequence=>190
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19204383370820214141)
,p_name=>'CALENDAR_ICON_DATE'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Calendar icon date'
,p_display_sequence=>200
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19204384005674214147)
,p_name=>'COMPLETED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Completed'
,p_display_sequence=>210
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6768224839468250765)
,p_name=>'Milestones'
,p_region_name=>'projectMilestones'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-dynamicHideShowRegion timeline-edit-links'
,p_region_sub_css_classes=>'t-Report--cleanBorders'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n, row_type, row_type_label, row_type_icon, name, start_date, end_date, completed_date, owner,',
'    ''<span class="t-Badge t-Badge--basic t-Badge--xsmall is-''',
'        ||apex_escape.html(color_code)||'' w100p">''||apex_escape.html(status)||''</span>'' status,',
'    disp_link, edit_link, add_link, ai_link',
'from ( ',
'         select mn.milestone_number||''.0'' n,',
'            ''<strong>''||apex_escape.html(m.milestone_name)||''</strong>'' name,',
'            ''Milestone'' row_type_label,',
'            ''milestone'' row_type,',
'            case when upper(m.milestone_status) = ''OPEN'' then ''fa-flag-o''',
'                 else ''fa-flag'' end as row_type_icon,',
'            m.milestone_start_date start_date,',
'            m.milestone_date end_date,',
'            m.completed_date completed_date,',
'            case when m.owner_role_id is null then',
'                eba_proj_fw.get_name_from_email_address(m.milestone_owner)',
'            else',
'                nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))'
||'),'', '')',
'                        within group (order by lower(u.username)) owner',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u,',
'                        eba_proj_roles r',
'                    where rf.role_id = m.owner_role_id',
'                        and rf.project_id = m.project_id',
'                        and u.id = rf.user_id',
'                        and r.id = rf.role_id',
'                    group by r.name',
'                ), (select ''No ''||r.name||'' defined''',
'                    from eba_proj_roles r',
'                    where r.id = m.owner_role_id)',
'                )',
'            end as owner,',
'            m.milestone_status status,',
'            m.project_id pj_id,',
'            m.id ms_id,',
'            null ai_id,',
'            case when upper(m.milestone_status) = ''OPEN'' and trunc(m.milestone_date) > trunc(sysdate) then ''success''',
'                when upper(m.milestone_status) = ''OPEN'' and trunc(m.milestone_date) = trunc(sysdate) then ''warning''',
'                when upper(m.milestone_status) = ''OPEN'' /* past due */ then ''danger''',
'                else ''complete'' end as color_code,',
'            mn.milestone_number o1,',
'            0                   o2,',
'            apex_util.prepare_url(''f?p=''||:APP_ID||'':107:''||:APP_SESSION||'':::107:P107_ID,P107_PROJECT_ID,P200_ID:''',
'                ||m.id||'',''||m.project_id||'',''||m.project_id) disp_link,',
'            apex_util.prepare_url(''f?p=''||:APP_ID||'':48:''||:APP_SESSION||'':::48:P48_ID:''||m.id) edit_link,',
'            case when eba_proj_fw.are_ms_ai_restricted( p_application_id => :APP_ID,',
'                                                        p_username   => upper(:APP_USER),',
'                                                        p_project_id => :P200_ID ) = ''N''',
'                    and eba_proj_stat_ui.get_authorization_level( p_username => upper(:APP_USER) ) >= 2 then',
'                ''<button type="button" class="t-Button t-Button--small t-Button--simple u-pullRight" onClick="''',
'                    ||apex_util.prepare_url(''f?p=''||:APP_ID||'':73:''||:APP_SESSION||'':::73:P73_PROJECT_ID,P73_MILESTONE_ID:''',
'                                            ||:P200_ID||'',''||m.id)||''">Add Action Item</button>''',
'             end as add_link,',
'             null as ai_link',
'        from eba_proj_status_ms m,',
'            eba_proj_status_ms_no_v mn',
'        where mn.project_id = m.project_id',
'            and mn.milestone_id = m.id',
'            and ( :P200_SHOW_CLOSED_MSS = ''ALL''',
'                or upper(m.milestone_status) = :P200_SHOW_CLOSED_MSS )',
'            and m.project_id = :P200_ID',
'    union all',
'        select mn.milestone_number||''.''||an.action_item_number n,',
'            apex_escape.html(a.action) name,',
'            ''Action Item'' row_type_label,',
'            ''action-item'' row_type,',
'            case when upper(a.action_status) = ''OPEN'' then ''icon-action-item''',
'                 else ''fa fa-check icon-action-item'' end as row_type_icon,',
'            null start_date,',
'            a.due_date end_date,',
'            a.completed_date completed_date,',
'            case when a.owner_role_id is null then',
'                eba_proj_fw.get_name_from_email_address(a.action_owner_01)',
'                    ||nvl2(a.action_owner_02,'', ''||eba_proj_fw.get_name_from_email_address(a.action_owner_02),null)',
'                    ||nvl2(a.action_owner_03,'', ''||eba_proj_fw.get_name_from_email_address(a.action_owner_03),null)',
'                    ||nvl2(a.action_owner_04,'', ''||eba_proj_fw.get_name_from_email_address(a.action_owner_04),null)',
'            else',
'                nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))'
||'),'', '')',
'                        within group (order by lower(u.username)) owner',
'                    from eba_proj_user_ref rf,',
'                        eba_proj_status_users u,',
'                        eba_proj_roles r',
'                    where rf.role_id = a.owner_role_id',
'                        and rf.project_id = a.project_id',
'                        and u.id = rf.user_id',
'                        and r.id = rf.role_id',
'                    group by r.name',
'                ), (select ''No ''||r.name||'' defined''',
'                    from eba_proj_roles r',
'                    where r.id = a.owner_role_id)',
'                )',
'            end as owner,',
'            a.action_status status,',
'            a.project_id pj_id,',
'            a.milestone_id ms_id,',
'            a.id ai_id,',
'            case when upper(a.action_status) = ''OPEN'' and trunc(a.due_date) > trunc(sysdate) then ''success''',
'                when upper(a.action_status) = ''OPEN'' and trunc(a.due_date) = trunc(sysdate) then ''warning''',
'                when upper(a.action_status) = ''OPEN'' /* past due */ then ''danger''',
'                else ''complete'' end as color_code,',
'            mn.milestone_number   o1,',
'            an.action_item_number o2,',
'            apex_util.prepare_url(''f?p=''||:APP_ID||'':78:''||:APP_SESSION||'':::107:LAST_VIEW,P78_GOTO,P78_ACTION_ITEM_ID,P55_ID,P200_ID:200,MS,''',
'                ||a.id||'',''||a.project_id||'',''||a.project_id) disp_link,',
'            apex_util.prepare_url(''f?p=''||:APP_ID||'':73:''||:APP_SESSION||'':::73:P73_ID:''||a.id) edit_link,',
'            null add_link,',
'            case when a.link_url is null then null',
'                else ''<a href="'' ||apex_escape.html(a.link_url)|| ''" target="_blank">''',
'                    ||apex_escape.html(a.link_text)|| ''</a>'' ',
'            end as ai_link',
'        from eba_proj_status_ais a,',
'            eba_proj_status_ms m,',
'            eba_proj_status_ms_no_v mn,',
'            eba_proj_status_ai_no_tbl an',
'        where mn.project_id = a.project_id',
'            and mn.milestone_id = a.milestone_id',
'            and an.project_id = a.project_id',
'            and an.action_item_id = a.id',
'            and m.project_id = a.project_id',
'            and m.id = a.milestone_id',
'            and apex_util.get_build_option_status( p_application_id => :APP_ID,',
'                                                   p_build_option_name => ''Project Action Items'') = ''INCLUDE''',
'            and ( :P200_SHOW_CLOSED_MSS = ''ALL''',
'                or (upper(m.milestone_status) = :P200_SHOW_CLOSED_MSS',
'                   and upper(a.action_status) = :P200_SHOW_CLOSED_MSS)',
'            )',
'            and nvl(:P200_HIDE_ASSOC_AIS,''N'') = ''N''',
'            and a.project_id = :P200_ID -- mike',
'    )',
'where pj_id = :P200_ID',
'    /* ( pj_id = :P200_ID',
'        or pj_id in (select ps.id from eba_proj_status ps where ps.parent_project_id = :P200_ID )',
'    ) */',
'order by o1, o2'))
,p_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-StatusList-legend" style="padding: 8px; border-top: 1px solid rgba(0,0,0,.05); font-size: 11px;">',
'    <strong>Status Color Coding:</strong>',
'    <span class="t-Badge t-Badge--basic t-Badge--small is-complete">Closed</span>',
'    <span class="t-Badge t-Badge--basic t-Badge--small is-danger">Past Due</span>',
'    <span class="t-Badge t-Badge--basic t-Badge--small is-warning">Due Today</span>',
'    <span class="t-Badge t-Badge--basic t-Badge--small is-success">Due in the Future</span>',
'</div>'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>50000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(11756681878669227855)
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'    case when m.milestone_status = ''Closed'' then',
'            ''Closed''',
'        when trunc(m.milestone_date) < trunc(sysdate) then',
'            ''Past Due''',
'        when trunc(m.milestone_date) = trunc(sysdate) then',
'            ''Due Today''',
'        else',
'            ''Due In The Future''',
'    end as color_label,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':107:''||:APP_SESSION',
'        ||'':::107:P107_ID,P107_PROJECT_ID,P200_ID:''',
'        ||m.id||'',''||m.project_id||'',''||:P200_ID) link,',
'    case when :P200_INC_CHILD = ''Y'' and m.project_id <> :P200_ID then',
'            ( select p.project from eba_proj_status p where p.id = m.project_id )',
'        else',
'            null',
'    end as child_project,',
'    m.milestone_description,',
'    m.milestone_date,',
'    m.milestone_status,',
'    m.milestone_start_date,',
'    case when m.owner_role_id is null then',
'        (select ''<a href="''||apex_util.prepare_url(''f?p='' || :APP_ID || '':137:'' || :APP_SESSION || '':::137:P137_ID:'' || u.id) || ''">'' || m.milestone_owner || ''</a>''',
'           from eba_proj_status_users u',
'          where instr(upper(m.milestone_owner),upper(u.username)) > 0',
'    else',
'        nvl((select r.name||'': ''||listagg(''<a href="''||apex_util.prepare_url(''f?p='' || :APP_ID || '':137:'' || :APP_SESSION || '':::137:P137_ID:'' || u.id) || ''">'' || lower(u.username) || ''</a>'','', '')',
'                within group (order by ''<a href="''||apex_util.prepare_url(''f?p='' || :APP_ID || '':137:'' || :APP_SESSION || '':::137:P137_ID:'' || u.id) || ''">'' || lower(u.username) || ''</a>'') owner',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.role_id = m.owner_role_id',
'                and rf.project_id = m.project_id',
'                and u.id = rf.user_id',
'                and r.id = rf.role_id',
'            group by r.name',
'        ),  (select ''No ''||r.name||'' defined''',
'            from eba_proj_roles r',
'            where r.id = m.owner_role_id)',
'        )',
'    end as milestone_owner,',
'    nvl((select count(*) from eba_proj_status_ais a where a.milestone_id = m.id and a.action_status = ''Open''),0)',
'        ||'' Open Action Items'' ai_open,',
'    case when eba_proj_fw.is_edit_authorized(',
'        p_username   => upper(:APP_USER),',
'        p_project_id => :P200_ID ) = ''Y'' then',
'        decode(nvl(is_major_yn,''N''),''Y'',''<b>MAJOR MILESTONE</b>'',null) || ',
'        ''<a href="''',
'          ||apex_util.prepare_url(',
'              p_url => ''f?p=''||:APP_ID||'':48:''||:APP_SESSION||'':::48:P48_ID:''||m.id,',
'              p_triggering_element => ''$(''''#projectMilestones'''')'')||''"',
'         class="t-StatusList-editLink">Edit</a>''',
'    else',
'        decode(nvl(is_major_yn,''N''),''Y'',''<b>MAJOR MILESTONE</b>'',null)',
'    end as description3',
'from eba_proj_status_ms m',
'where ( m.project_id = :P200_ID ',
'        or (nvl(:P200_INC_CHILD,''N'') = ''Y'' and ',
'            m.project_id in (select id ',
'                             from eba_proj_status s',
'                             where parent_project_id = :P200_ID))',
'      )',
'  and ( ',
'           (',
'               :P200_SHOW_CLOSED_MSS = ''OPEN''',
'               and ',
'               upper(m.milestone_status) = :P200_SHOW_CLOSED_MSS',
'           )',
'        or',
'           (',
'               :P200_SHOW_CLOSED_MSS = ''ALL''',
'               and ',
'               upper(m.milestone_status) in (''OPEN'',''CLOSED'')',
'               and',
'               m.milestone_date > (sysdate - 90)',
'           )',
'      )',
'order by milestone_date, milestone_name, id'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369285311342583854)
,p_query_column_id=>1
,p_column_alias=>'N'
,p_column_display_sequence=>2
,p_column_heading=>'Item #'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369285410252583855)
,p_query_column_id=>2
,p_column_alias=>'ROW_TYPE'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369285547114583856)
,p_query_column_id=>3
,p_column_alias=>'ROW_TYPE_LABEL'
,p_column_display_sequence=>13
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369285667909583857)
,p_query_column_id=>4
,p_column_alias=>'ROW_TYPE_ICON'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369285727547583858)
,p_query_column_id=>5
,p_column_alias=>'NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Name'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-MediaBlock row-#ROW_TYPE#">',
'  <div class="a-MediaBlock-graphic">',
'    <span class="t-Icon milestones-icon fa #ROW_TYPE_ICON#" aria-hidden="true"></span><span class="u-VisuallyHidden">#ROW_TYPE_LABEL#</span> ',
'  </div>',
'  <div class="a-MediaBlock-content">',
'    <a href="#DISP_LINK#">#NAME#</a>',
'    #ADD_LINK#',
'  </div>',
'</div>'))
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369285813700583859)
,p_query_column_id=>6
,p_column_alias=>'START_DATE'
,p_column_display_sequence=>6
,p_column_heading=>'Start'
,p_column_format=>'DD-MON-YYYY'
,p_column_css_class=>'nowrap'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369285939298583860)
,p_query_column_id=>7
,p_column_alias=>'END_DATE'
,p_column_display_sequence=>7
,p_column_heading=>'End'
,p_column_format=>'DD-MON-YYYY'
,p_column_css_class=>'nowrap'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369286046775583861)
,p_query_column_id=>8
,p_column_alias=>'COMPLETED_DATE'
,p_column_display_sequence=>8
,p_column_heading=>'Completed'
,p_column_format=>'DD-MON-YYYY'
,p_column_css_class=>'nowrap'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369286124336583862)
,p_query_column_id=>9
,p_column_alias=>'OWNER'
,p_column_display_sequence=>5
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369286236524583863)
,p_query_column_id=>10
,p_column_alias=>'STATUS'
,p_column_display_sequence=>9
,p_column_heading=>'Status'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369286349325583864)
,p_query_column_id=>11
,p_column_alias=>'DISP_LINK'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369286432334583865)
,p_query_column_id=>12
,p_column_alias=>'EDIT_LINK'
,p_column_display_sequence=>1
,p_column_link=>'#EDIT_LINK#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_display_when_condition2=>'PLSQL'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369286517861583866)
,p_query_column_id=>13
,p_column_alias=>'ADD_LINK'
,p_column_display_sequence=>12
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1369286685379583867)
,p_query_column_id=>14
,p_column_alias=>'AI_LINK'
,p_column_display_sequence=>14
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(19136719722975969919)
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7563813384782283372)
,p_name=>'Issues'
,p_region_name=>'projectIssues'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-dynamicHideShowRegion'
,p_region_sub_css_classes=>'t-Report--cleanBorders'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--noBorders:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select i.id,',
'    i.project_id,',
'    i.cat_id as category,',
'    i.ref_num as reference_number,',
'    i.issue,',
'    case when i.owner_role_id is null then',
'        eba_proj_fw.get_name_from_email_address(i.issue_owner)',
'    else',
'        nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '')',
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
'    i.issue_level,',
'    (select u.id from eba_proj_status_users u where upper(i.created_by) = upper(u.username)) as user_id,',
'    decode(i.is_open,''Y'',''Open'',''N'',''Closed'',i.is_open) status,',
'    decode(i.link_01,null,'' '',',
'           ''<a href="''||apex_escape.html(i.link_01)',
'           ||''" target="_blank" class="t-Button t-Button--icon t-Button--small" title="''',
'           ||apex_escape.html(nvl(i.link_name_01,''Open Issue Link''))||''">''',
'           ||''<span class="t-Icon fa fa-external-link"></span></a>'') link,',
'    lower(i.created_by) created_by,',
'    i.updated,',
'    (   select project',
'        from eba_proj_status x',
'        where x.id = i.project_id) project',
'from eba_proj_status_issues i',
'where ( i.project_id = :P200_ID ',
'   /*     or (nvl(:P200_INC_CHILD,''N'') = ''Y'' and ',
'            i.project_id in (select s.id ',
'                             from eba_proj_status s',
'                             where s.parent_project_id = :P200_ID)) */',
'      )',
'  and ( ',
'           (',
'               :P200_SHOW_CLOSED_ISSUES = ''OPEN''',
'               and ',
'               i.is_open = ''Y''',
'           )',
'        or',
'           (',
'               :P200_SHOW_CLOSED_ISSUES = ''ALL''',
'               and ',
'               i.is_open in (''Y'',''N'')',
'           )',
'      )',
'order by issue_level, upper(issue), i.updated desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>1500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No open Issues found.'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
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
 p_id=>wwv_flow_imp.id(7564546541654477914)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_column_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24:P24_ID,P24_PROJECT_ID:#ID#,#PROJECT_ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_alignment=>'CENTER'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_display_when_condition2=>'PLSQL'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7563813699390283380)
,p_query_column_id=>2
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Project ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836569462050064476)
,p_query_column_id=>3
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>5
,p_column_heading=>'Category'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(3927737161011692001)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(3927734266816599065)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836569512041064477)
,p_query_column_id=>4
,p_column_alias=>'REFERENCE_NUMBER'
,p_column_display_sequence=>6
,p_column_heading=>'Reference Identifier'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(3927734495895610134)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7563899768695295164)
,p_query_column_id=>5
,p_column_alias=>'ISSUE'
,p_column_display_sequence=>4
,p_column_heading=>'Issue'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7563900278131295165)
,p_query_column_id=>6
,p_column_alias=>'ISSUE_OWNER'
,p_column_display_sequence=>7
,p_column_heading=>'Owner'
,p_column_html_expression=>'<a href="f?p=&APP_ID.:137:&APP_SESSION.:::137:P137_ID:#USER_ID#">#ISSUE_OWNER#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7563900617697295165)
,p_query_column_id=>7
,p_column_alias=>'ISSUE_LEVEL'
,p_column_display_sequence=>8
,p_column_heading=>'Level'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(119940043013899858)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17204379457808832124)
,p_query_column_id=>8
,p_column_alias=>'USER_ID'
,p_column_display_sequence=>13
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19865313272991670917)
,p_query_column_id=>9
,p_column_alias=>'STATUS'
,p_column_display_sequence=>9
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12742876717169434547)
,p_query_column_id=>10
,p_column_alias=>'LINK'
,p_column_display_sequence=>12
,p_column_heading=>'<span class="u-VisuallyHidden">Issue Link</span>'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7563814867928283382)
,p_query_column_id=>11
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7565339632840855753)
,p_query_column_id=>12
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>11
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_report_column_width=>180
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7563816038158283383)
,p_query_column_id=>13
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'P200_INC_CHILD'
,p_display_when_condition2=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7741899995204725141)
,p_name=>'Project Header'
,p_template=>wwv_flow_imp.id(6672346928802369862)
,p_display_sequence=>100
,p_region_css_classes=>'flex_projects'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.project,',
'    s.id,',
'    s.project_start_date,',
'    s.project_customer as customer,',
'    s.parent_project_id,',
'    s.deal_type_id as deal_type,',
'    nvl(s.restrict_ms_ai_management,''N'') as prevent_changes,',
'    decode(s.parent_project_id,null,null,',
'        (   select project',
'            from eba_proj_status p',
'            where p.id = s.parent_project_id )) parent_project_name,',
'    (   select count(*)',
'        from eba_proj_status p',
'        where p.parent_project_id = s.id ) child_projects,',
'    s.tags,',
'    ''<a href="''||apex_escape.html(url)||''">''||apex_escape.html(substr(s.url,1,120))||''</a>'' url,',
'    replace(apex_escape.html(s.description),chr(10),''<br>'') as description,',
'    --',
'    (   select category',
'        from eba_proj_status_cats pc',
'        where s.cat_id = pc.id ) category,',
'    replace(apex_escape.html(trim(s.goal)),chr(10),''<br>'') as goal,',
'    apex_escape.html(nvl((  select status_short_desc',
'                            from eba_proj_status_codes c',
'                            where c.id = s.project_status),',
'                        ''unknown'')) project_status,',
'    apex_escape.html(nvl((  select cc.color_code',
'                            from eba_proj_color_codes cc',
'                            where c.color_code_id = cc.id),',
'                        ''#777'')) project_color,',
'    s.project_flex_n01,',
'    s.project_flex_n02,',
'    s.project_flex_n03,',
'    s.project_flex_n04,',
'    s.project_flex_d01,',
'    s.project_flex_d02,',
'    s.project_flex_d03,',
'    s.project_flex_d04,',
'    s.project_flex_d05,',
'    s.project_flex_d06,',
'    s.project_flex_d07,',
'    s.project_flex_d08,',
'    s.project_flex_d09,',
'    s.project_flex_d10,',
'    s.project_flex_d11,',
'    s.project_flex_d12,',
'    s.project_flex_01,',
'    s.project_flex_02,',
'    s.project_flex_03,',
'    s.project_flex_04,',
'    s.project_flex_05,',
'    s.project_flex_06,',
'    s.project_flex_07,',
'    s.project_flex_08,',
'    s.project_flex_clob,',
'    s.acl_status_level,',
'    ( select sz.project_size from eba_proj_status_sizes sz where sz.id = s.size_id ) project_size,',
'    s.updated,',
'    eba_proj_fw.get_name_from_email_address(s.updated_by) updated_by,',
'    s.headline,',
'    s.requesting_team,',
'    s.impacted_environment,',
'    s.created,',
'    eba_proj_fw.get_name_from_email_address(s.created_by) created_by',
'from eba_proj_status s, eba_proj_status_codes c',
'where s.id = :P200_ID',
'    and c.id = s.project_status(+)',
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
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5987999593626606385)
,p_query_column_id=>1
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>1
,p_column_heading=>'Project'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741900197868725142)
,p_query_column_id=>2
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4294092374850891487)
,p_query_column_id=>3
,p_column_alias=>'PROJECT_START_DATE'
,p_column_display_sequence=>13
,p_column_heading=>'Project Start Date'
,p_column_format=>'DD-MON-YYYY'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from eba_proj_status s',
'where s.id = :P200_ID and project_start_date is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741900300131725144)
,p_query_column_id=>4
,p_column_alias=>'CUSTOMER'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741900400745725144)
,p_query_column_id=>5
,p_column_alias=>'PARENT_PROJECT_ID'
,p_column_display_sequence=>18
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18296373473815442052)
,p_query_column_id=>6
,p_column_alias=>'DEAL_TYPE'
,p_column_display_sequence=>5
,p_column_heading=>'Deal Type'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_proj_status',
' where id = :P200_ID',
'   and deal_type_id is not null',
'   and exists (select null ',
'                 from eba_proj_deal_types',
'                where is_active_yn = ''Y'')',
'   and exists (select null',
'                 from apex_application_build_options',
'                where application_id = :APP_ID',
'                  and build_option_name = ''Project Deal Types''',
'                  and build_option_status = ''Include'')'))
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(19158512130599850300)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17526767082326169946)
,p_query_column_id=>7
,p_column_alias=>'PREVENT_CHANGES'
,p_column_display_sequence=>9
,p_column_heading=>'Prevent Changes'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_proj_status',
' where id = :P200_ID',
'   and RESTRICT_MS_AI_MANAGEMENT = ''Y'''))
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8910494933283350717)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741900506706725144)
,p_query_column_id=>8
,p_column_alias=>'PARENT_PROJECT_NAME'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'ITEM_IS_NOT_NULL'
,p_display_when_condition=>'P200_PARENT_PROJECT_ID'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741900582863725144)
,p_query_column_id=>9
,p_column_alias=>'CHILD_PROJECTS'
,p_column_display_sequence=>19
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741900806388725144)
,p_query_column_id=>10
,p_column_alias=>'TAGS'
,p_column_display_sequence=>16
,p_column_heading=>'Tags'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from eba_proj_status s',
'where s.id = :P200_ID and tags is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5981960210823219260)
,p_query_column_id=>11
,p_column_alias=>'URL'
,p_column_display_sequence=>20
,p_column_heading=>'URL'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from eba_proj_status s',
'where s.id = :P200_ID and url is not null'))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5749882808472663508)
,p_query_column_id=>12
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>11
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from eba_proj_status s',
'where s.id = :P200_ID and description is not null'))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741900913343725144)
,p_query_column_id=>13
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>4
,p_column_heading=>'&CAT_TITLE.'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null from eba_proj_status s',
'where s.id = :P200_ID and cat_id is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741901182717725144)
,p_query_column_id=>14
,p_column_alias=>'GOAL'
,p_column_display_sequence=>12
,p_column_heading=>'Goal'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from eba_proj_status s',
'where s.id = :P200_ID and goal is not null'))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741901301203725144)
,p_query_column_id=>15
,p_column_alias=>'PROJECT_STATUS'
,p_column_display_sequence=>7
,p_column_heading=>'Status'
,p_column_html_expression=>'<span class="proj-status-color" style="background-color: #PROJECT_COLOR#"></span><span class="proj-status-label">#PROJECT_STATUS#</span>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6067474595539926165)
,p_query_column_id=>16
,p_column_alias=>'PROJECT_COLOR'
,p_column_display_sequence=>21
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146503111113032921)
,p_query_column_id=>17
,p_column_alias=>'PROJECT_FLEX_N01'
,p_column_display_sequence=>22
,p_column_heading=>'abc'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_N01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146503197481032926)
,p_query_column_id=>18
,p_column_alias=>'PROJECT_FLEX_N02'
,p_column_display_sequence=>23
,p_column_heading=>'Quantity On Hand'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_N02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_inline_lov=>'STATIC2(~,*):1*1~2*2'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146503285864032926)
,p_query_column_id=>19
,p_column_alias=>'PROJECT_FLEX_N03'
,p_column_display_sequence=>24
,p_column_heading=>'Project Flex N03'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_N03''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146503395825032926)
,p_query_column_id=>20
,p_column_alias=>'PROJECT_FLEX_N04'
,p_column_display_sequence=>25
,p_column_heading=>'Project Flex N04'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_N04''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146503484454032926)
,p_query_column_id=>21
,p_column_alias=>'PROJECT_FLEX_D01'
,p_column_display_sequence=>26
,p_column_heading=>'Completed ETA'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146503585202032926)
,p_query_column_id=>22
,p_column_alias=>'PROJECT_FLEX_D02'
,p_column_display_sequence=>27
,p_column_heading=>'hhhh'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146503700924032926)
,p_query_column_id=>23
,p_column_alias=>'PROJECT_FLEX_D03'
,p_column_display_sequence=>28
,p_column_heading=>'yyyy'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146503796625032926)
,p_query_column_id=>24
,p_column_alias=>'PROJECT_FLEX_D04'
,p_column_display_sequence=>29
,p_column_heading=>'ssss'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4004125287775779559)
,p_query_column_id=>25
,p_column_alias=>'PROJECT_FLEX_D05'
,p_column_display_sequence=>30
,p_column_heading=>'Project flex d05'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_D05''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4004125332099779560)
,p_query_column_id=>26
,p_column_alias=>'PROJECT_FLEX_D06'
,p_column_display_sequence=>31
,p_column_heading=>'Project flex d06'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_D06''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4004125456901779561)
,p_query_column_id=>27
,p_column_alias=>'PROJECT_FLEX_D07'
,p_column_display_sequence=>32
,p_column_heading=>'Project flex d07'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_D07''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4004125578529779562)
,p_query_column_id=>28
,p_column_alias=>'PROJECT_FLEX_D08'
,p_column_display_sequence=>33
,p_column_heading=>'Project flex d08'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_D08''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4004125702220779563)
,p_query_column_id=>29
,p_column_alias=>'PROJECT_FLEX_D09'
,p_column_display_sequence=>34
,p_column_heading=>'Project flex d09'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_D09''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4004125719546779564)
,p_query_column_id=>30
,p_column_alias=>'PROJECT_FLEX_D10'
,p_column_display_sequence=>35
,p_column_heading=>'Project flex d10'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_D10''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4004125816899779565)
,p_query_column_id=>31
,p_column_alias=>'PROJECT_FLEX_D11'
,p_column_display_sequence=>36
,p_column_heading=>'Project flex d11'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_D11''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4004125973269779566)
,p_query_column_id=>32
,p_column_alias=>'PROJECT_FLEX_D12'
,p_column_display_sequence=>37
,p_column_heading=>'Project flex d12'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_D12''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146504007663034446)
,p_query_column_id=>33
,p_column_alias=>'PROJECT_FLEX_01'
,p_column_display_sequence=>38
,p_column_heading=>'Cloud-Related?'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_inline_lov=>'STATIC2(~,*):Yes*Yes~No*No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146504107271034448)
,p_query_column_id=>34
,p_column_alias=>'PROJECT_FLEX_02'
,p_column_display_sequence=>39
,p_column_heading=>'DG Test'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146504191436034448)
,p_query_column_id=>35
,p_column_alias=>'PROJECT_FLEX_03'
,p_column_display_sequence=>40
,p_column_heading=>'Project Flex 03'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_03''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146504301038034448)
,p_query_column_id=>36
,p_column_alias=>'PROJECT_FLEX_04'
,p_column_display_sequence=>41
,p_column_heading=>'Project Flex 04'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_04''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146504410133034448)
,p_query_column_id=>37
,p_column_alias=>'PROJECT_FLEX_05'
,p_column_display_sequence=>42
,p_column_heading=>'Project Flex 05'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_05''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146504489009034448)
,p_query_column_id=>38
,p_column_alias=>'PROJECT_FLEX_06'
,p_column_display_sequence=>43
,p_column_heading=>'Project Flex 06'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_06''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146504585880034448)
,p_query_column_id=>39
,p_column_alias=>'PROJECT_FLEX_07'
,p_column_display_sequence=>44
,p_column_heading=>'Project Flex 07'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_07''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146504699016034448)
,p_query_column_id=>40
,p_column_alias=>'PROJECT_FLEX_08'
,p_column_display_sequence=>45
,p_column_heading=>'Project Flex 08'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_08''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6146504807731034448)
,p_query_column_id=>41
,p_column_alias=>'PROJECT_FLEX_CLOB'
,p_column_display_sequence=>46
,p_column_heading=>'Project Flex Clob'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS''',
'    and flexible_column = ''PROJECT_FLEX_CLOB''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11746158858183167415)
,p_query_column_id=>42
,p_column_alias=>'ACL_STATUS_LEVEL'
,p_column_display_sequence=>8
,p_column_heading=>'Access Control'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(11045413827346451385)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984497338100778552)
,p_query_column_id=>43
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>17
,p_column_heading=>'Project Size'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status prj',
'where prj.id = :P200_ID',
'    and prj.size_id is not null',
'    and exists (select null',
'                from apex_application_build_options',
'                where application_id = :APP_ID',
'                    and build_option_name = ''Project Sizes''',
'                    and build_option_status = ''Include'')'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16932116087657253133)
,p_query_column_id=>44
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>48
,p_column_heading=>'Last Updated'
,p_column_format=>'SINCE'
,p_column_html_expression=>'#UPDATED# by #UPDATED_BY# <button type="button" class="t-Button t-Button--icon t-Button--small t-Button--iconRight" onclick="f?p=&APP_ID.:202:&APP_SESSION.:::RP:P202_ID:#ID#"><span class="t-Button-label">View Recent History</span><span class="t-Icon '
||'t-Icon--right fa fa-external-link" aria-hidden="true"></span></button>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16932116128911253134)
,p_query_column_id=>45
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>49
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2651406167363494563)
,p_query_column_id=>46
,p_column_alias=>'HEADLINE'
,p_column_display_sequence=>10
,p_column_heading=>'Headline'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null from eba_proj_status s',
'where s.id = :P200_ID and headline is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(2661826592516005471)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2651406218104494564)
,p_query_column_id=>47
,p_column_alias=>'REQUESTING_TEAM'
,p_column_display_sequence=>14
,p_column_heading=>'Requesting Team'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null from eba_proj_status s',
'where s.id = :P200_ID and requesting_team is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(2661828693770016772)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2651406326896494565)
,p_query_column_id=>48
,p_column_alias=>'IMPACTED_ENVIRONMENT'
,p_column_display_sequence=>15
,p_column_heading=>'Impacted Environment'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null from eba_proj_status s',
'where s.id = :P200_ID and impacted_environment is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(2661829296087027741)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836566883116064450)
,p_query_column_id=>49
,p_column_alias=>'CREATED'
,p_column_display_sequence=>47
,p_column_heading=>'Created'
,p_column_format=>'SINCE'
,p_column_html_expression=>'#CREATED# by #CREATED_BY# '
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836566977182064451)
,p_query_column_id=>50
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7741902314397725148)
,p_name=>'Links'
,p_region_name=>'projectLinks'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-dynamicHideShowRegion'
,p_region_sub_css_classes=>'t-Report--cleanBorders'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_region_attributes=>'style="display: none;"'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    ilv.edit,',
'    ilv.project_id,',
'    nvl(ilv.link_text, ilv.LINK_TARGET) link_text,',
'    decode( nvl(ilv.gold_yn, ''N''), ''N'', null, ''Y'', ''Gold'') as gold_label,',
'    decode( nvl(ilv.gold_yn, ''N''), ''N'', ''is-hidden'', ''Y'', ''is-warning'') as gold_class,',
'    ilv.LINK_TARGET,',
'    eba_proj_fw.get_name_from_email_address(ilv.created_by) created_by,',
'    ilv.created,',
'    ilv.link_comments,',
'    null link,',
'    --',
'    (   select project',
'        from eba_proj_status x',
'        where x.id = project_id) project,',
'    --',
'    apex_util.prepare_url( eba_proj_fw.profile_url(created_by) ) as profile_url',
'from ',
'(',
'select',
'    l.id edit,',
'    l.project_id,',
'    l.LINK_TEXT,',
'    l.LINK_TARGET,',
'    l.gold_yn,',
'    created_by,',
'    l.created,',
'    l.link_comments',
'from eba_proj_status_links l',
'where l.project_id = :P200_ID',
'order by nvl(l.gold_yn, ''N'') desc, l.created desc',
') ilv',
'where rownum <= 50'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No links'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
,p_required_patch=>wwv_flow_imp.id(11756752007201202936)
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from EBA_PROJ_STATUS_LINKS l',
'where ( l.project_id = :P200_ID ',
'        or (nvl(:P200_INC_CHILD,''N'') = ''Y'' and ',
'            l.project_id in (select s.id ',
'                             from EBA_PROJ_STATUS s',
'                             where s.parent_project_id = :P200_ID))',
'    )'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12631791638975609888)
,p_query_column_id=>1
,p_column_alias=>'EDIT'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::P3_ID:#EDIT#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_alignment=>'CENTER'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_display_when_condition2=>'PLSQL'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741902506708725149)
,p_query_column_id=>2
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>3
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741902603068725149)
,p_query_column_id=>3
,p_column_alias=>'LINK_TEXT'
,p_column_display_sequence=>4
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17998256182122869022)
,p_query_column_id=>4
,p_column_alias=>'GOLD_LABEL'
,p_column_display_sequence=>11
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17998256276506869023)
,p_query_column_id=>5
,p_column_alias=>'GOLD_CLASS'
,p_column_display_sequence=>12
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741902687309725149)
,p_query_column_id=>6
,p_column_alias=>'LINK_TARGET'
,p_column_display_sequence=>5
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741902806395725149)
,p_query_column_id=>7
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>8
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741902906722725149)
,p_query_column_id=>8
,p_column_alias=>'CREATED'
,p_column_display_sequence=>9
,p_column_heading=>'Added'
,p_column_format=>'Since'
,p_column_html_expression=>'#CREATED# by<br><a href="#PROFILE_URL#">#CREATED_BY#</a>'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_report_column_width=>140
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741902995129725149)
,p_query_column_id=>9
,p_column_alias=>'LINK_COMMENTS'
,p_column_display_sequence=>6
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12742813894708434518)
,p_query_column_id=>10
,p_column_alias=>'LINK'
,p_column_display_sequence=>7
,p_column_heading=>'Link'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK_TARGET#" target="_blank">#LINK_TEXT#</a> <span class="t-Badge t-Badge--orb t-Badge--small #GOLD_CLASS#">#GOLD_LABEL#</span>',
'<div class="link-comments">#LINK_COMMENTS#</div>'))
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741903090807725149)
,p_query_column_id=>11
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>2
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'P200_INC_CHILD'
,p_display_when_condition2=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17204379335844832123)
,p_query_column_id=>12
,p_column_alias=>'PROFILE_URL'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7741903602560725149)
,p_name=>'Attachments'
,p_region_name=>'projectAttachments'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-dynamicHideShowRegion'
,p_region_sub_css_classes=>'t-Report--cleanBorders'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select f.id,',
'    ''<span class="t-Icon file-icon fa ''',
'        ||decode(substr(upper(f.filename),-4),',
'            ''.PPT'', ''fa-file-powerpoint-o'',',
'            ''.XLS'', ''fa-file-excel-o'',',
'            ''.DOC'', ''fa-file-word-o'',',
'            ''.PDF'', ''fa-file-pdf-o'',',
'            ''.GIF'', ''fa-file-image-o'',',
'            ''.PNG'', ''fa-file-image-o'',',
'            ''.JPG'', ''fa-file-image-o'',',
'            decode(substr(upper(f.filename),-5),',
'                ''.PPTX'', ''fa-file-powerpoint-o'',',
'                ''.XLSX'', ''fa-file-excel-o'',',
'                ''.DOCX'', ''fa-file-word-o'',',
'                ''.TIFF'', ''fa-file-image-o'',',
'                    ''fa-file-o''))',
'        ||''"></span>'' as icon,',
'    f.filename,',
'    apex_util.prepare_url( eba_proj_fw.profile_url(f.created_by) ) as profile_url,',
'    apex_util.get_blob_file_src(''P43_FILE_BLOB'',f.id) as file_link,',
'    f.file_mimetype,',
'    f.file_charset,',
'    apex_util.filesize_mask(dbms_lob.getlength(file_blob)) f_len,',
'    decode(sign(length(f.file_comments)-100),',
'                1, substr(f.file_comments,1,100)||''...'',',
'                f.file_comments) file_comments,',
'    decode( nvl(f.gold_yn, ''N''), ''N'', null, ''Y'', ''Gold'') as gold_label,',
'    decode( nvl(f.gold_yn, ''N''), ''N'', ''is-hidden'', ''Y'', ''is-warning'') as gold_class,',
'    f.created,',
'    f.updated,',
'    eba_proj_fw.get_name_from_email_address(f.created_by) created_by,',
'    (   select project',
'        from eba_proj_status s',
'        where s.id = f.project_id ) project,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':106:''||:APP_SESSION||'':::106:P106_ID,P106_PROJECT_ID:''||f.id||'',''||f.project_id) doc_link,',
'    null edit,',
'    null download_button',
'from',
'(',
'select ',
'    ID,',
'    PROJECT_ID,',
'    FILENAME,',
'    file_comments,',
'    file_blob,',
'    file_charset,',
'    file_mimetype,',
'    gold_yn,',
'    created_by,',
'    created,',
'    updated',
'from EBA_PROJ_STATUS_FILES ',
'where project_id = :P200_ID ',
'order by nvl(gold_yn, ''N'') desc, created desc',
') f',
'where rownum <= 50'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No attachments'
,p_query_row_count_max=>20
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
,p_required_patch=>wwv_flow_imp.id(11756682088337229718)
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from EBA_PROJ_STATUS_FILES f',
'where ( f.project_id = :P200_ID ',
'        or ( nvl(:P200_INC_CHILD,''N'') = ''Y''',
'            and  f.project_id in (select s.id ',
'                                  from EBA_PROJ_STATUS s',
'                                  where s.parent_project_id = :P200_ID))',
'    )'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741903787909725150)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>3
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12742876619429434546)
,p_query_column_id=>2
,p_column_alias=>'ICON'
,p_column_display_sequence=>2
,p_column_heading=>'<span class="u-VisuallyHidden">File Icon</span>'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741903895658725150)
,p_query_column_id=>3
,p_column_alias=>'FILENAME'
,p_column_display_sequence=>6
,p_column_heading=>'Name'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:106:&APP_SESSION.::::P106_ID,P106_PROJECT_ID:#ID#,&P200_ID.">#FILENAME#</a> <span class="t-Badge t-Badge--orb t-Badge--small #GOLD_CLASS#">#GOLD_LABEL#</span>',
'<div class="link-comments">#FILE_COMMENTS#</div>'))
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17204379202733832121)
,p_query_column_id=>4
,p_column_alias=>'PROFILE_URL'
,p_column_display_sequence=>17
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741904514197725150)
,p_query_column_id=>5
,p_column_alias=>'FILE_LINK'
,p_column_display_sequence=>14
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741904007533725150)
,p_query_column_id=>6
,p_column_alias=>'FILE_MIMETYPE'
,p_column_display_sequence=>7
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741904095451725150)
,p_query_column_id=>7
,p_column_alias=>'FILE_CHARSET'
,p_column_display_sequence=>8
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741904207587725150)
,p_query_column_id=>8
,p_column_alias=>'F_LEN'
,p_column_display_sequence=>9
,p_column_heading=>'Size'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741904311006725150)
,p_query_column_id=>9
,p_column_alias=>'FILE_COMMENTS'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17998256346085869024)
,p_query_column_id=>10
,p_column_alias=>'GOLD_LABEL'
,p_column_display_sequence=>18
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17849133324500449232)
,p_query_column_id=>11
,p_column_alias=>'GOLD_CLASS'
,p_column_display_sequence=>5
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741904387217725150)
,p_query_column_id=>12
,p_column_alias=>'CREATED'
,p_column_display_sequence=>12
,p_column_heading=>'Added'
,p_column_format=>'Since'
,p_column_html_expression=>'#CREATED# by<br><a href="#PROFILE_URL#">#CREATED_BY#</a>'
,p_heading_alignment=>'LEFT'
,p_report_column_width=>180
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6157509606025356460)
,p_query_column_id=>13
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>13
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741904685058725150)
,p_query_column_id=>14
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>11
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5844652505260157610)
,p_query_column_id=>15
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>4
,p_column_heading=>'Project'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'P200_INC_CHILD'
,p_display_when_condition2=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5978027299446782673)
,p_query_column_id=>16
,p_column_alias=>'DOC_LINK'
,p_column_display_sequence=>15
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12742813809945434517)
,p_query_column_id=>17
,p_column_alias=>'EDIT'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_column_link=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:RP:P43_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_alignment=>'CENTER'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_display_when_condition2=>'PLSQL'
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12742876157727434541)
,p_query_column_id=>18
,p_column_alias=>'DOWNLOAD_BUTTON'
,p_column_display_sequence=>16
,p_column_heading=>'<span class="u-VisuallyHidden">Download</a>'
,p_column_link=>'#FILE_LINK#'
,p_column_linktext=>'<span class="t-Icon fa fa-download"></span>'
,p_column_link_attr=>'class="t-Button t-Button--icon t-Button--small" title="Download #FILENAME#"'
,p_column_alignment=>'CENTER'
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7741905183586725150)
,p_name=>'Updates'
,p_region_name=>'projectUpdates'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-dynamicHideShowRegion updates-region'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Comments--chat'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    case when upper(username) = upper(:APP_USER) then ''is-active'' else '' '' end comment_modifiers,',
'    status_update_type||decode(is_active_yn,''Y'','''','' (inactive)'') note_type,',
'    regexp_replace(nvl(formatted_update,status_update),',
'                   ''##BREAK##.*'',''<br />...<a href="''||apex_util.prepare_url(''f?p=''||:APP_ID||'':129:''||:APP_SESSION',
'                                            ||''::NO:129:P200_ID,P129_ID,P129_PROJECT_ID:''',
'                                            ||project_id||'',''||update_id||'',''||project_id)||''">View More</a>'',',
'                  1,0,''n'') comment_text,',
'    '''' attribute_1,',
'    '''' attribute_2,',
'    '''' attribute_3,',
'    '''' attribute_4,',
'    decode(first_name,null,lower(username),decode(last_name, null, lower(username), initcap(first_name || '' '' || last_name))) user_name,',
'    apex_util.get_since(update_date) comment_date,',
'    case',
'    when dbms_lob.getlength(photo_blob) > 0 then',
'        ''comment-user-has-photo''',
'    else',
'        ''u-color-''||(ora_hash(created_by,44) + 1)',
'    end icon_modifier,',
'    case',
'        when dbms_lob.getlength(photo_blob) > 0 then',
'            ''<span class="small-profile-photo" style="background-image: url(''''''',
'              ||apex_util.prepare_url(''f?p=''||:APP_ID||'':IMAGE:''||:APP_SESSION||''::::GET_ID:''||apex_escape.html(username))',
'              ||'''''');"></span>''',
'        else',
'            upper(decode(instr(replace(created_by,''.'','' ''),'' ''),',
'                         0, ',
'                         substr(created_by,1,2),',
'                         substr(created_by,1,1)||substr(created_by,instr(replace(created_by,''.'','' ''),'' '')+1,1)',
'                  ))',
'    end user_icon,',
'    case when (eba_proj_fw.is_edit_authorized( p_username => upper(:APP_USER),',
'                                              p_project_id => project_id ) = ''Y''',
'               and',
'               created_by = :APP_USER',
'              )',
'            then ''Edit''',
'        else ''''',
'    end as actions,',
'    decode(gold_yn, null, '' '', ''N'', null, ''Y'', ''Gold'') as gold_label,',
'    decode(gold_yn, null, '' '', ''N'', ''is-hidden'', ''Y'', ''is-warning'') as gold_class,',
'    update_id,',
'    update_date,',
'    apex_util.prepare_url(eba_proj_fw.profile_url(update_owner)) as profile_url',
'from',
'(',
'select ',
'       (select status_update_type from eba_proj_status_update_types t where x.update_type = t.id) status_update_type,',
'       (select is_active_yn from eba_proj_status_update_types t where x.update_type = t.id) is_active_yn,',
'       x.formatted_update,',
'       x.status_update,',
'       x.gold_yn,',
'       x.project_id,',
'       x.id update_id,',
'       x.created_by,',
'       x.update_date,',
'       x.update_owner,',
'       us.first_name,',
'       us.last_name,',
'       us.photo_blob,',
'       us.username',
'from eba_proj_status_updates$ x,',
'     eba_proj_status_users us',
'where x.upper_update_owner = us.username and',
'      x.id in ',
'(',
'select j.id from',
'(',
'select u.id',
'from eba_proj_status_updates$ u',
'where exists (select null from eba_proj_status ps where ps.id = u.project_id and ps.id = :P200_ID)',
'      and u.project_id = :P200_ID',
'      and ((''ALL'' = ''GOLD'' and nvl(u.gold_yn,''N'') = ''Y'') or ''ALL'' = ''ALL'')',
'order by u.updated desc',
') j',
'where rownum < 10',
') ',
') order by update_date desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364136973369904)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No project updates found.'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
,p_required_patch=>wwv_flow_imp.id(11756704262311161627)
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 x',
'from EBA_PROJ_STATUS_UPDATES u,',
'    EBA_PROJ_STATUS_UPDATE_TYPES t',
'where u.update_type = t.id(+)',
'    and ( u.project_id = :P200_ID ',
'        or (nvl(:P200_INC_CHILD,''N'') = ''Y''',
'            and u.project_id in (select s.id ',
'                                 from EBA_PROJ_STATUS s',
'                                 where s.parent_project_id = :P200_ID))',
'    )',
'union all',
'select 1 x',
'from eba_proj_history f',
'where component_id = :P200_ID ',
'union all',
'select 1 x',
'from eba_proj_history f,',
'    eba_proj_status_ais ai',
'where f.table_name = ''STATUS_AIS''',
'    and f.component_id = ai.id',
'    and ai.project_id = :P200_ID ',
'union all',
'select 1 x',
'from eba_proj_history f,',
'    eba_proj_status_ms ms',
'where f.table_name = ''STATUS_MS''',
'    and f.component_id = ms.id',
'    and ms.project_id = :P200_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6690531913709856672)
,p_query_column_id=>1
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>14
,p_column_heading=>'Comment modifiers'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741905602390725152)
,p_query_column_id=>2
,p_column_alias=>'NOTE_TYPE'
,p_column_display_sequence=>1
,p_column_heading=>'Note Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6629871530114806481)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>8
,p_column_heading=>'Comment Text'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741905800137725152)
,p_query_column_id=>4
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741905886346725152)
,p_query_column_id=>5
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741905983285725152)
,p_query_column_id=>6
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741906101090725152)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6629871656689806482)
,p_query_column_id=>8
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>9
,p_column_heading=>'Username'
,p_column_html_expression=>'<a href="#PROFILE_URL#">#USER_NAME#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6629871752527806483)
,p_query_column_id=>9
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>10
,p_column_heading=>'Comment Date'
,p_column_html_expression=>'#COMMENT_DATE# <span class="t-Badge t-Badge--orb t-Badge--small #GOLD_CLASS#">#GOLD_LABEL#</span>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6629871810196806484)
,p_query_column_id=>10
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>11
,p_column_heading=>'Icon modifier'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6629871889314806485)
,p_query_column_id=>11
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>12
,p_column_heading=>'User icon'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6629871985118806486)
,p_query_column_id=>12
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>13
,p_column_heading=>'Actions'
,p_column_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_ID:#UPDATE_ID#'
,p_column_linktext=>'#ACTIONS#'
,p_heading_alignment=>'LEFT'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17998256513867869025)
,p_query_column_id=>13
,p_column_alias=>'GOLD_LABEL'
,p_column_display_sequence=>16
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17998256602533869026)
,p_query_column_id=>14
,p_column_alias=>'GOLD_CLASS'
,p_column_display_sequence=>17
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7741905393987725151)
,p_query_column_id=>15
,p_column_alias=>'UPDATE_ID'
,p_column_display_sequence=>6
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7743331604650584146)
,p_query_column_id=>16
,p_column_alias=>'UPDATE_DATE'
,p_column_display_sequence=>7
,p_column_heading=>'Update Date'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17204379287481832122)
,p_query_column_id=>17
,p_column_alias=>'PROFILE_URL'
,p_column_display_sequence=>15
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7741927106200819128)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_imp.id(7773323213676108049)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>90
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11466362807655344417)
,p_name=>'People'
,p_region_name=>'projectPeople'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-dynamicHideShowRegion'
,p_region_sub_css_classes=>'t-Report--cleanBorders'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--noBorders:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rf.id,',
'    u.id as person_id,',
'    case',
'        when dbms_lob.getlength(u.photo_blob) > 0 then',
'            apex_util.prepare_url(''f?p=''||:APP_ID||'':IMAGE:''||:APP_SESSION||''::::GET_ID:''||apex_escape.html(u.username))',
'        else',
'            ''#APP_IMAGES#no-photo.png''',
'    end user_photo,',
'    r.name role,',
'    decode(u.first_name,null,lower(u.username),decode(u.last_name, null, lower(u.username), initcap(u.first_name || '' '' || u.last_name))) person,',
'    rf.created,',
'    lower(rf.created_by) created_by,',
'    rf.updated,',
'    lower(rf.updated_by) updated_by,',
'    case',
'        when 1 = (select acl_status_level from eba_proj_status p where p.id = :P200_ID) then',
'            -- Open; show P-Track access level',
'            (   select apex_escape.html(access_level)',
'                from eba_proj_status_access_levels pal',
'                where pal.id = u.access_level_id )',
'        else',
'            -- Restricted. Show project access level',
'            case',
'                when nvl(rf.acl_status_level,r.default_acl_status_level) = 1 and u.access_level_id >= 1 then',
'                    ''Read Only''',
'                when nvl(rf.acl_status_level,r.default_acl_status_level) = 2 and u.access_level_id > 1 then',
'                    ''Edit''',
'                when nvl(rf.acl_status_level,r.default_acl_status_level) = 3 and u.access_level_id > 1 then',
'                    ''Full Access''',
'                when nvl(rf.acl_status_level,r.default_acl_status_level) in (2,3) and u.access_level_id = 1 then',
'                    ''<a href="'' || apex_util.prepare_url( ''f?p='' || :APP_ID || '':201:'' || :APP_SESSION || '':::201:P201_USER_ID,P201_APP_ROLE,P201_PROJ_ROLE:'' || u.id || '',Reader,'' || decode(nvl(rf.acl_status_level,r.default_acl_status_level),2,''Read '
||'/ Write'',3,''Read / Write (with Admin)'',''Read / Write'') ) || ''"><span class="t-Badge t-Badge--orb is-danger">Read</span></a>''',
'                when nvl(rf.acl_status_level,r.default_acl_status_level) in (2,3) and u.access_level_id < 1 then',
'                    ''<a href="'' || apex_util.prepare_url( ''f?p='' || :APP_ID || '':201:'' || :APP_SESSION || '':::201:P201_USER_ID,P201_APP_ROLE,P201_PROJ_ROLE:'' || u.id || '',No Access,'' || decode(nvl(rf.acl_status_level,r.default_acl_status_level),2,''Re'
||'ad / Write'',3,''Read / Write (with Admin)'',''Read / Write'') ) || ''"><span class="t-Badge t-Badge--orb is-danger">No Access</span></a>''',
'            end',
'    end as access_level,',
'    (   select  involvement_level||decode(PERCENTAGE ,null,null,'' - ''||PERCENTAGE ||''%'') x',
'        from eba_proj_involvement_levels il',
'        where il.id = rf.involvement_level_id',
'    ) involvement,',
'    substr(notes,1,100) notes',
'from eba_proj_user_ref rf,',
'    eba_proj_roles r,',
'    eba_proj_status_users u',
'where rf.project_id = :P200_ID',
'    and rf.user_id = u.id',
'    and rf.role_id = r.id',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>2000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984497222203778551)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_column_link=>'f?p=&APP_ID.:150:&SESSION.::&DEBUG.:RP,150:P150_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_alignment=>'CENTER'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID,',
'    p_min_auth   => 3 ) = ''Y'''))
,p_display_when_condition2=>'PLSQL'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15059387264178948150)
,p_query_column_id=>2
,p_column_alias=>'PERSON_ID'
,p_column_display_sequence=>12
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15213096984014322347)
,p_query_column_id=>3
,p_column_alias=>'USER_PHOTO'
,p_column_display_sequence=>2
,p_column_heading=>'<span class="u-VisuallyHidden">Photo</span>'
,p_column_html_expression=>'<span class="small-profile-photo" style="background-image: url(#USER_PHOTO#);"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11466362840310344418)
,p_query_column_id=>4
,p_column_alias=>'ROLE'
,p_column_display_sequence=>4
,p_column_heading=>'Role'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11466363012734344419)
,p_query_column_id=>5
,p_column_alias=>'PERSON'
,p_column_display_sequence=>3
,p_column_heading=>'Name'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:137:&APP_SESSION.::::P137_ID:#PERSON_ID#">#PERSON#</a>',
'<div class="person-notes">#NOTES#</div>'))
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>2
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11466363089930344420)
,p_query_column_id=>6
,p_column_alias=>'CREATED'
,p_column_display_sequence=>6
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11466363158993344421)
,p_query_column_id=>7
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>7
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11466363309646344422)
,p_query_column_id=>8
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>10
,p_column_heading=>'Updated'
,p_column_format=>'Since'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_report_column_width=>120
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11466363396015344423)
,p_query_column_id=>9
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>8
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11466363517986344425)
,p_query_column_id=>10
,p_column_alias=>'ACCESS_LEVEL'
,p_column_display_sequence=>11
,p_column_heading=>'Access'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984495934474778538)
,p_query_column_id=>11
,p_column_alias=>'INVOLVEMENT'
,p_column_display_sequence=>5
,p_column_heading=>'Involvement'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_default_sort_dir=>'desc'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'    p_application_id => :APP_ID,',
'    p_build_option_name => ''Project User Involvement''',
') = ''INCLUDE'''))
,p_display_when_condition2=>'PLSQL'
,p_report_column_width=>120
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14004621805917638566)
,p_query_column_id=>12
,p_column_alias=>'NOTES'
,p_column_display_sequence=>9
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11984453835517778517)
,p_name=>'Resources'
,p_region_name=>'projectResources'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-dynamicHideShowRegion'
,p_region_sub_css_classes=>'t-Report--cleanBorders'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rs.id,',
'    rs.project_id,',
'    rs.resource_name,',
'    t.resource_type,',
'    rs.notes notes,',
'    eba_proj_fw.get_name_from_email_address(rs.created_by) created_by,',
'    rs.updated,',
'    (   select project',
'        from eba_proj_status x',
'        where x.id = rs.project_id) project,',
'    apex_util.prepare_url( eba_proj_fw.profile_url(rs.created_by) ) as profile_url',
'from eba_proj_resources rs,',
'     eba_proj_resource_types t',
'where ( rs.project_id = :P200_ID ',
'   /*     or (nvl(:P200_INC_CHILD,''N'') = ''Y'' and ',
'            rs.project_id in (select s.id ',
'                              from EBA_PROJ_STATUS s',
'                              where s.parent_project_id = :P200_ID)) */',
'      )',
'  and t.id = rs.resource_type_id',
'order by lower(rs.resource_name);'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>1500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No Issues'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
,p_required_patch=>wwv_flow_imp.id(12021369465070232745)
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_resources rs,',
'    eba_proj_resource_types t',
'where ( rs.project_id = :P200_ID ',
'        or (nvl(:P200_INC_CHILD,''N'') = ''Y'' and ',
'            rs.project_id in (select s.id ',
'                              from EBA_PROJ_STATUS s',
'                              where s.parent_project_id = :P200_ID))',
'    )',
'    and t.id = rs.resource_type_id;'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984454648620778525)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_link=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:RP,170:P170_ID,P170_PROJECT_ID:#ID#,#PROJECT_ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_display_when_condition2=>'PLSQL'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984454750146778526)
,p_query_column_id=>2
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>2
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984455271070778531)
,p_query_column_id=>3
,p_column_alias=>'RESOURCE_NAME'
,p_column_display_sequence=>5
,p_column_heading=>'Resource'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984455323228778532)
,p_query_column_id=>4
,p_column_alias=>'RESOURCE_TYPE'
,p_column_display_sequence=>6
,p_column_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984455442374778533)
,p_query_column_id=>5
,p_column_alias=>'NOTES'
,p_column_display_sequence=>7
,p_column_heading=>'Notes'
,p_column_html_expression=>'#NOTES#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984455028609778529)
,p_query_column_id=>6
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>3
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984454602728778524)
,p_query_column_id=>7
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>8
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_column_html_expression=>'#UPDATED# by<br><a href="#PROFILE_URL#">#CREATED_BY#</a>'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_report_column_width=>180
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984455212344778530)
,p_query_column_id=>8
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>4
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'P200_INC_CHILD'
,p_display_when_condition2=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17204379570571832125)
,p_query_column_id=>9
,p_column_alias=>'PROFILE_URL'
,p_column_display_sequence=>9
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397088254133832142)
,p_plug_name=>'History'
,p_region_css_classes=>'history-region'
,p_icon_css_classes=>'fa-clock-o'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--customIcons:t-Alert--info:t-Alert--accessibleHeading'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672345091278369856)
,p_plug_display_sequence=>140
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_history varchar2(4000);',
'begin',
'    for c1 in',
'    (',
'        select',
'            ''<p class="project-audit-info">Project last updated <strong>''||apex_util.get_since(s.updated)',
'                ||''</strong> by <strong><a href="'' || ',
'                apex_util.prepare_url( eba_proj_fw.profile_url(s.updated_by) ) || ''">'' ||',
'                apex_escape.html(lower(s.updated_by))||''</a></strong>.',
'             <br />Project created ''||apex_util.get_since(s.created) ||'' by ''||apex_escape.html(lower(s.created_by))',
'                ||''.</span>'' as history',
'          from eba_proj_status s, eba_proj_status_codes c',
'         where s.id = :P200_ID',
'           and c.id = s.project_status(+)',
'    )',
'    loop',
'        l_history := c1.history;',
'    end loop;',
'    sys.htp.p( l_history );',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12580564645631523378)
,p_plug_name=>'More'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672353576565369876)
,p_plug_display_sequence=>150
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17597562084771067547)
,p_plug_name=>'Content Completeness'
,p_parent_plug_id=>wwv_flow_imp.id(12580564645631523378)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--stacked'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with build_opts as (',
'    select build_option_name',
'    from apex_application_build_options',
'    where application_id = :APP_ID',
'        and build_option_status = ''Include''',
')',
'select',
'    metric,',
'/*    case',
'        when the_score < 0 then',
'            0',
'    else',
'*/        the_score/*',
'    end the_score*/,',
'    max_value ',
'from',
'    (',
'        select  ''Project has an owner'' metric,',
'            case when exists (select null',
'                              from eba_proj_user_ref rf,',
'                                  eba_proj_status_users u',
'                              where rf.project_id = p.id',
'                                  and rf.user_id = u.id',
'                                  and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'                             )',
'                    then 20 else 0 end as the_score,',
'                20 max_value',
'        from eba_proj_status p where id = :P200_ID',
'        union all ',
'        select  ''Project has a URL'' metric, ',
'                decode(url,null,0,10) the_score,',
'                10 max_value',
'        from eba_proj_status where id = :P200_ID',
'        union all ',
'        select  ''Project has a goal'' metric, ',
'                decode(goal,null,0,20) the_score,',
'                20 max_value',
'        from eba_proj_status where id = :P200_ID',
'        union all',
'        select  ''Project has a goal longer then 200 characters'' metric, ',
'                decode(goal,null,0,10) the_score,',
'                10 max_value',
'        from eba_proj_status where id = :P200_ID and nvl(length(goal),0) >= 200',
'        union all ',
'        select  ''Project has description longer then 200 characters'' metric, ',
'                decode(description,null,0,10) the_score,',
'                10 max_value ',
'        from eba_proj_status where id = :P200_ID and nvl(length(description),0) >= 200',
'        union all ',
'        select  ''Project has tags'' metric, ',
'                decode(s.tags,null,0,10) the_score,',
'                10 max_value ',
'        from eba_proj_status s where id = :P200_ID',
'        union all ',
'        select  ''Project has description'' metric, ',
'                decode(description,null,0,20) the_score,',
'                20 max_value ',
'        from eba_proj_status where id = :P200_ID',
'        union all',
'        select  nvl(max(''Project has milestones''),''Project has milestones'') metric, ',
'                decode(count(*),0,0,20) the_score,',
'                nvl(max(20),20) max_value ',
'        from eba_proj_status_ms m,',
'            build_opts bo',
'        where  m.project_id = :P200_ID',
'            and bo.build_option_name = ''Project Milestones''',
'        union all',
'        select  nvl(max(''Project has milestones past due (deduction)''),''Project has milestones past due (deduction)'') metric, ',
'                decode(count(*),0,0,-50) the_score,',
'                nvl(max(0),0) max_value ',
'        from eba_proj_status_ms m,',
'            build_opts bo',
'        where  m.project_id = :P200_ID',
'            and m.milestone_status = ''Open''',
'            and m.milestone_date < current_date',
'            and bo.build_option_name = ''Project Milestones''',
'        union all',
'        select  nvl(max(''Project has links''),''Project has links'') metric, ',
'                decode(count(*),0,0,10) the_score,',
'                nvl(max(10),10) max_value ',
'        from eba_proj_status_links l,',
'            build_opts bo',
'        where l.project_id = :P200_ID ',
'            and bo.build_option_name = ''Project Links''',
'        union all',
'        select  nvl(max(''Project has action items''),''Project has action items'') metric, ',
'                decode(count(*),0,0,20) the_score,',
'                nvl(max(20),20) max_value ',
'        from eba_proj_status_ais a,',
'            build_opts bo',
'        where a.project_id = :P200_ID',
'            and bo.build_option_name = ''Project Action Items''',
'        union all',
'        select  nvl(max(''Project has action items past due (deduction)''),''Project has action items pastdue (deduction)'') metric, ',
'                decode(count(*),0,0,-50) the_score,',
'                nvl(max(0),0) max_value ',
'        from eba_proj_status_ais a,',
'            build_opts bo',
'        where a.project_id = :P200_ID',
'            and a.action_status = ''Open''',
'            and a.due_date < current_date',
'            and bo.build_option_name = ''Project Action Items''',
'        union all',
'        select  nvl(max(''Project has project updates''),''Project has project updates'') metric, ',
'                decode(count(*),0,0,10) the_score,',
'                nvl(max(10),10) max_value ',
'        from eba_proj_status_updates u,',
'            build_opts bo',
'        where  u.project_id = :P200_ID ',
'            and bo.build_option_name = ''Project Updates''',
'        union all',
'        select  nvl(max(''Project has project updates in last week''),''Project has project updates in last week'') metric, ',
'                decode(count(*),0,0,10) the_score,',
'                nvl(max(10),10) max_value ',
'        from eba_proj_status_updates u,',
'            build_opts bo',
'        where  u.project_id = :P200_ID',
'            and u.update_date > (sysdate - 7)',
'            and bo.build_option_name = ''Project Updates''',
'        union all',
'        select  nvl(max(''Project has attachments''),''Project has attachments'') metric, ',
'                decode(count(*),0,0,5) the_score,',
'                nvl(max(5),5) max_value ',
'        from eba_proj_status_files u,',
'            build_opts bo',
'        where  u.project_id = :P200_ID ',
'            and bo.build_option_name = ''Project Attachments''',
'        union all',
'        select  nvl(max(''Project has status reports''),''Project has status reports'') metric, ',
'                decode(count(*),0,0,10) the_score,',
'                nvl(max(10),10) max_value ',
'        from eba_proj_status_rpts u,',
'            build_opts bo',
'        where u.project_id = :P200_ID',
'            and bo.build_option_name = ''Project Status Reports''',
'        union all',
'        select  nvl(max(''Project status is not desirable''),''Project status is not desirable'') metric, ',
'                decode(count(*),0,0,-20) the_score,',
'                nvl(max(0),0) max_value ',
'        from eba_proj_status s , EBA_PROJ_STATUS_CODES c',
'        where s.id = :P200_ID and s.PROJECT_STATUS = c.id and nvl(c.is_desirable_yn,''Y'') = ''N''',
'        union all',
'        select  nvl(max(''Project has been validated''),''Project has been validated'') metric, ',
'                decode(max((',
'                    select count(*)',
'                    from eba_proj_status_verifications v',
'                    where v.project_id = :P200_ID )),0,0,20) the_score,',
'                nvl(max(20),20) max_value ',
'        from eba_proj_status ps,',
'            build_opts bo',
'        where ps.id = :P200_ID',
'            and bo.build_option_name = ''Project Validations''',
'        union all',
'        select  nvl(max(''Project has been validated in last week''),''Project has been validated in last week'') metric, ',
'                decode(max((select count(*) from eba_proj_status_verifications v',
'        where v.project_id = :P200_ID and v.created > (sysdate - 7))),0,0,30) the_score,',
'                nvl(max(30),30) max_value ',
'        from eba_proj_status ps,',
'            build_opts bo',
'        where ps.id = :P200_ID',
'            and bo.build_option_name = ''Project Validations''',
'        union all',
'        select ''Project has been validated in last week by project owner'' metric, ',
'            case when exists (  select null',
'                                from eba_proj_user_ref rf,',
'                                    eba_proj_status_users u,',
'                                    eba_proj_roles r,',
'                                    eba_proj_status_verifications v',
'                                where rf.project_id = p.id',
'                                    and rf.user_id = u.id',
'                                    and rf.role_id = r.id',
'                                    and nvl(rf.acl_status_level,r.default_acl_status_level) >= 2',
'                                    and v.project_id = p.id',
'                                    and v.created > (sysdate-7)',
'                                    and upper(v.verified_by) = upper(u.username)',
'                             )',
'                then 30 else 0 end as the_score,',
'            30 max_value ',
'        from eba_proj_status p,',
'            build_opts bo',
'        where p.id = :P200_ID',
'            and bo.build_option_name = ''Project Validations''',
'    ) x',
'order by 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.COMPLETENESS'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from eba_proj_status s, eba_proj_status_codes c',
'where s.id = :P200_ID',
'    and c.id = s.project_status(+)',
'   and is_closed_status = ''Y'''))
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_required_patch=>wwv_flow_imp.id(6064815400599095991)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', '66',
  'attribute_02', 'Strong',
  'attribute_03', '33',
  'attribute_04', 'Moderate',
  'attribute_05', '10',
  'attribute_06', 'Weak',
  'attribute_07', 'Very Weak',
  'attribute_08', 'Completeness Score Details')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17597567781972189679)
,p_plug_name=>'Usage Last 90 Days'
,p_parent_plug_id=>wwv_flow_imp.id(12580564645631523378)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with x as (',
'select',
'    count(*) c,',
'    count(distinct app_username) u',
'from',
'    eba_proj_status_clicks',
'where',
'    project_id = :P200_ID ',
'and',
'    view_timestamp > sysdate - 90',
'    )',
'select',
'     c,',
'    ''Views'' l,',
'    1 disp',
'from',
'    x',
'UNION',
'select',
'    u  c,',
'    ''Users'' l,',
'    2 disp',
'from',
'    x',
'order by disp    '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'L',
  'attribute_02', 'C',
  'attribute_04', 'f?p=&APP_ID.:127:&APP_SESSION.:::127:P127_ID:&P200_ID.',
  'attribute_05', '2',
  'attribute_06', 'L',
  'attribute_07', 'DOT',
  'attribute_08', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17597568395740212578)
,p_plug_name=>'Validations'
,p_parent_plug_id=>wwv_flow_imp.id(12580564645631523378)
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow:t-Region--stacked'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    verified_by,',
'    created',
'from',
'    eba_proj_status_verifications ',
'where',
'    project_id = :P200_ID',
'order by',
'    created desc',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.VALIDATOR'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from eba_proj_status s,',
'       eba_proj_status_codes c',
' where s.id = :P200_ID',
'   and c.id = s.project_status(+)',
'   and is_closed_status = ''Y''',
'union all',
'select 1',
'  from dual',
' where eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''N'''))
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_required_patch=>wwv_flow_imp.id(6064816709620137382)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'f?p=&APP_ID.:122:&SESSION.::&DEBUG.:RP,122:P122_ID,LAST_VIEW:&P200_ID.,200')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(18828134232604403030)
,p_name=>'Countries'
,p_region_name=>'projectCountries'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-dynamicHideShowRegion'
,p_region_sub_css_classes=>'t-Report--cleanBorders'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--noBorders:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rf.id,',
'    c.region_id,',
'    c.country_code,',
'    rf.country_id,',
'    eba_proj_fw.get_name_from_email_address(rf.created_by) created_by,',
'    rf.created,',
'    eba_proj_fw.get_name_from_email_address(rf.updated_by) updated_by,',
'    rf.updated',
'from eba_proj_status_country_ref rf,',
'    eba_proj_countries c',
'where rf.project_id = :P200_ID',
'    and rf.country_id = c.id',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_num_rows=>2000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(18882216890018093962)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18828135597103403043)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_column_link=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:RP,210:P210_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_alignment=>'CENTER'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID,',
'    p_min_auth   => 2 ) = ''Y'''))
,p_display_when_condition2=>'PLSQL'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18828135798005403045)
,p_query_column_id=>2
,p_column_alias=>'REGION_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Region'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(18874496462088660444)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18828145875766403046)
,p_query_column_id=>3
,p_column_alias=>'COUNTRY_CODE'
,p_column_display_sequence=>3
,p_column_heading=>'Country Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18828146000429403047)
,p_query_column_id=>4
,p_column_alias=>'COUNTRY_ID'
,p_column_display_sequence=>4
,p_column_heading=>'Country'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>2
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(18879629845899629495)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18828135283631403040)
,p_query_column_id=>5
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>6
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18828135167284403039)
,p_query_column_id=>6
,p_column_alias=>'CREATED'
,p_column_display_sequence=>5
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18828135445174403042)
,p_query_column_id=>7
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>8
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18828135318253403041)
,p_query_column_id=>8
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>7
,p_column_heading=>'Updated'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_report_column_width=>120
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5754133401529167212)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'Follow'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Follow'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Followed''',
'from eba_proj_status_favorites',
'where user_name = upper(:APP_USER)',
'    and content_id = :P200_ID',
'    and content_type = ''PROJECT'''))
,p_button_condition_type=>'NOT_EXISTS'
,p_button_cattributes=>'title="Click to follow"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5757751593680111489)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'Unfollow'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Followed'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Followed''',
'from eba_proj_status_favorites',
'where user_name = upper(:APP_USER)',
'    and content_id = :P200_ID',
'    and content_type = ''PROJECT'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'title="Click to unfollow"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7741898390220725138)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'EDIT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edit Project'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:P2_ID:&P200_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID,',
'    p_min_auth   => 3 ) = ''Y'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(417232188021456688)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11466362807655344417)
,p_button_name=>'EMAIL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Email Project Members'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_proj_user_ref rf,',
'       eba_proj_roles r,',
'       eba_proj_status_users u',
' where rf.project_id = :P200_ID',
'   and rf.user_id = u.id',
'   and rf.role_id = r.id',
'   and (',
'           instr(u.username,''@'') > 0',
'           or',
'           (',
'               instr(u.username,''@'') = 0',
'               and',
'               u.email_address is not null',
'           )',
'        )'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-envelope-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7741902110145725148)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6750648344639550606)
,p_button_name=>'ADDACTIONITEM'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Add Action Item'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_PROJECT_ID,LAST_VIEW:&P200_ID.,200'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''N'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11984453958105778518)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11984453835517778517)
,p_button_name=>'ADD_RESOURCE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Add Resource'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:RP,170:P170_PROJECT_ID:&P200_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18067126591334239714)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6768224839468250765)
,p_button_name=>'CALENDAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Calendar View'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_PROJECT:&P200_ID.'
,p_icon_css_classes=>'fa-calendar'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18828134375334403031)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(18828134232604403030)
,p_button_name=>'VIEWCOUNTRIES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'View Countries'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:209:&SESSION.::&DEBUG.:RP,RIR,209:P209_ID,LAST_VIEW:&P200_ID.,200'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6740352473427894030)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6768224839468250765)
,p_button_name=>'GANTT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Gantt'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.:RP,68:P68_PROJECT:&P200_ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7741901888348725146)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6750648344639550606)
,p_button_name=>'VIEWACTIONITEMS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'View Action Items'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.:55:P55_ID,LAST_VIEW:&P200_ID.,200'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11466363503752344424)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11466362807655344417)
,p_button_name=>'ADD_PERSON'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Add Person'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:150:&SESSION.::&DEBUG.:RP,24:P150_ID,P150_PROJECT_ID:,&P200_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID,',
'    p_min_auth   => 3 ) = ''Y'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11984454104403778519)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11984453835517778517)
,p_button_name=>'VIEW_RESOURCES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'View Resources'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:169:&SESSION.::&DEBUG.:RP,RIR,169:P169_PROJECT_ID,LAST_VIEW:&P200_ID.,200'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18828134447635403032)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(18828134232604403030)
,p_button_name=>'ADD_COUNTRY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Add Country'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:RP,210:P210_ID,P210_PROJECT_ID:,&P200_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID,',
'    p_min_auth   => 2 ) = ''Y'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7741907104810725154)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6768224839468250765)
,p_button_name=>'ADDMILESTONE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Add Milestone'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:RP,48:P48_PROJECT_ID,LAST_VIEW:&P200_ID.,200'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''N'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11466363976042344429)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11466362807655344417)
,p_button_name=>'VIEWPEOPLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'View People'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.:159:P159_PROJECT_ID,LAST_VIEW:&P200_ID.,200'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7741907295271725154)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6768224839468250765)
,p_button_name=>'VIEWMILESTONES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'View Milestones'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:34:P34_ID,LAST_VIEW:&P200_ID.,200'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7741906494690725152)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(7741905183586725150)
,p_button_name=>'ADDSTATUSUPDATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Add Project Update'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_PROJECT_ID:&P200_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7741906698762725152)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(7741905183586725150)
,p_button_name=>'VIEWSTATUSUPDATES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'View Project Updates'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:75:&SESSION.::&DEBUG.:RP,75:P75_PROJECT,LAST_VIEW:&P200_ID.,200'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7563816446250283385)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(7563813384782283372)
,p_button_name=>'ADD_ISSUE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Add Issue'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24:P24_PROJECT_ID:&P200_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7741903407171725149)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(7741902314397725148)
,p_button_name=>'ADD_LINK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Add Link'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:P3_PROJECT_ID:&P200_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7741903208041725149)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(7741902314397725148)
,p_button_name=>'VIEWLINKS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'View Links'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:67:P67_ID,LAST_VIEW:&P200_ID.,200'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7563816901000283386)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(7563813384782283372)
,p_button_name=>'VIEWISSUES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'View Issues'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.:92:P92_ID,LAST_VIEW:&P200_ID.,200'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7741904990891725150)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(7741903602560725149)
,p_button_name=>'ADDATTACHMENT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Add Attachment'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:RP,43:P43_PROJECT_ID:&P200_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6061427905026532865)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_imp.id(6061426488572532855)
,p_button_name=>'ADDSTATUSUPDATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Add Status Report'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:116:&SESSION.::&DEBUG.:116:P116_PROJECT_ID,LAST_VIEW:&P200_ID.,200'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7741904797368725150)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_imp.id(7741903602560725149)
,p_button_name=>'VIEWATTACHMENTS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'View Attachments'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:66:P66_ID,LAST_VIEW:&P200_ID.,200'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6061428084265532865)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_imp.id(6061426488572532855)
,p_button_name=>'VIEWSTATUSUPDATES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'View Status Reports'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:RP,162:P162_ID,LAST_VIEW:&P200_ID.,200'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5750166990249771649)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_imp.id(6066430401544758672)
,p_button_name=>'ADD_PROJECT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Add Project'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:300, 301, 302:P300_PARENT_PROJECT_ID:&P200_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID,',
'    p_min_auth   => 3 ) = ''Y'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7795348501009859170)
,p_branch_action=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 30-APR-2012 13:01 by CBCHO'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3356097906716512984)
,p_name=>'P200_HIDE_ASSOC_AIS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6768224839468250765)
,p_item_default=>'N'
,p_prompt=>'Hide Associated Action Items'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Hide Associated Action Items;Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status_ms m',
'where ( m.project_id = :P200_ID ',
'        or (nvl(:P200_INC_CHILD,''N'') = ''Y'' and ',
'            m.project_id in (select id ',
'                             from eba_proj_status s',
'                             where parent_project_id = :P200_ID))',
'      )'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5752600408854784200)
,p_name=>'P200_ROW_KEY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7741927106200819128)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select row_key',
'from eba_proj_status',
'where id = :P200_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5797900398876004987)
,p_name=>'P200_INC_CHILD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7741927106200819128)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'U'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6730449303981242922)
,p_name=>'P200_LAST_UPD_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7741927106200819128)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7741899601874725140)
,p_name=>'P200_SHOW'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7741927106200819128)
,p_item_default=>'PARENT'
,p_source=>'PARENT'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7741899783880725141)
,p_name=>'P200_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7741927106200819128)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7741927605292828346)
,p_name=>'P200_PROJECT_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7741927106200819128)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ps.project',
'from eba_proj_status ps',
'where ps.id = :P200_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7791698188398614941)
,p_name=>'P200_PARENT_PROJECT_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7741927106200819128)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select parent_project_id',
'from eba_proj_status s',
'where id = :P200_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15302913257688743053)
,p_name=>'P200_SHOW_CLOSED_MSS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6768224839468250765)
,p_item_default=>'OPEN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Show All Milestones (Open and Closed);ALL'
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status_ms m',
'where ( m.project_id = :P200_ID ',
'        or (nvl(:P200_INC_CHILD,''N'') = ''Y'' and ',
'            m.project_id in (select id ',
'                             from eba_proj_status s',
'                             where parent_project_id = :P200_ID))',
'      )'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15325340535274947552)
,p_name=>'P200_SHOW_CLOSED_AIS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6750648344639550606)
,p_item_default=>'OPEN'
,p_prompt=>'Show All Action Items'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Show All Action Items (Open and Closed);ALL'
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_proj_status_ais a,',
'       eba_proj_status s,',
'       eba_proj_status_codes c',
' where a.project_id = s.id',
'   and s.project_status = c.id(+)',
'   and (',
'            a.project_id = :P200_ID',
'            or ',
'            (a.project_id in (select ps.id from EBA_PROJ_STATUS ps where ps.parent_project_id = :P200_ID))',
'       )'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18023882316537252015)
,p_name=>'P200_SHOW_CLOSED_CHILDREN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6066430401544758672)
,p_item_default=>'OPEN'
,p_prompt=>'Show All Child Projects'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Show All Child Projects (Open and Closed);ALL'
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status s,',
'    eba_proj_status_codes c',
'where s.parent_project_id = :P200_ID'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19058731352822337560)
,p_name=>'P200_SHOW_CLOSED_ISSUES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7563813384782283372)
,p_item_default=>'OPEN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Show All Issues (Open and Closed);ALL'
,p_cattributes_element=>'style="padding-left:15px;"'
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status_issues i',
'where (i.project_id = :P200_ID ',
'        or (nvl(:P200_INC_CHILD,''N'') = ''Y'' and ',
'            i.project_id in (select id ',
'                             from eba_proj_status s',
'                             where parent_project_id = :P200_ID))',
'      )'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19741811952635499818)
,p_name=>'P200_SHOW_ONLY_GOLD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7741905183586725150)
,p_item_default=>'ALL'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Show Only "Gold" Updates;GOLD'
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_proj_status_updates u,',
'       eba_proj_status s,',
'       eba_proj_status_codes c',
' where u.project_id = s.id',
'   and s.project_status = c.id(+)',
'   and u.gold_yn = ''Y''',
'   and (',
'            u.project_id = :P200_ID',
'            or ',
'            (u.project_id in (select ps.id from EBA_PROJ_STATUS ps where ps.parent_project_id = :P200_ID))',
'       )'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21048394876662075557)
,p_name=>'P200_MS_CNT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7741927106200819128)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21048394948627075558)
,p_name=>'P200_AI_CNT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7741927106200819128)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21312448092653686814)
,p_name=>'P200_ISS_CNT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7741927106200819128)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(3356098310050512988)
,p_computation_sequence=>10
,p_computation_item=>'P200_HIDE_ASSOC_AIS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
,p_compute_when=>'P200_HIDE_ASSOC_AIS'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(7741928610748848888)
,p_computation_sequence=>10
,p_computation_item=>'P200_PROJECT_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ps.project||'' - ''|| nvl(eba_proj_fw.get_project_rowkey(p_project_id => :P200_ID), ps.row_key) x',
'from eba_proj_status ps',
'where ps.id = :P200_ID'))
,p_computation_error_message=>'Unable to determine project name'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(15358145077559283827)
,p_computation_sequence=>10
,p_computation_item=>'P200_SHOW_CLOSED_MSS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'OPEN'
,p_compute_when=>'P200_SHOW_CLOSED_MSS'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(15358145213182283828)
,p_computation_sequence=>10
,p_computation_item=>'P200_SHOW_CLOSED_AIS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'OPEN'
,p_compute_when=>'P200_SHOW_CLOSED_AIS'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(19741812332751499822)
,p_computation_sequence=>10
,p_computation_item=>'P200_SHOW_ONLY_GOLD'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'ALL'
,p_compute_when=>'P200_SHOW_ONLY_GOLD'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(19865313135464670916)
,p_computation_sequence=>10
,p_computation_item=>'P200_SHOW_CLOSED_ISSUES'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'OPEN'
,p_compute_when=>'P200_SHOW_CLOSED_ISSUES'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(21048395033599075559)
,p_computation_sequence=>10
,p_computation_item=>'P200_AI_CNT'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'  from eba_proj_status_ais',
' where project_id = :P200_ID'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(21048395162275075560)
,p_computation_sequence=>10
,p_computation_item=>'P200_MS_CNT'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'  from eba_proj_status_ms',
' where project_id = :P200_ID'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(21312448181293686815)
,p_computation_sequence=>10
,p_computation_item=>'P200_ISS_CNT'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'  from eba_proj_status_issues',
' where project_id = :P200_ID'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(7741907982742725156)
,p_computation_sequence=>20
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12080854635669900415)
,p_name=>'Go To People'
,p_event_sequence=>40
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'location.hash == ''#projectPeople'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12080854796022900416)
,p_event_id=>wwv_flow_imp.id(12080854635669900415)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href="#projectPeople"]'').click();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18828146073117403048)
,p_name=>'Go To Countries'
,p_event_sequence=>50
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'location.hash == ''#projectCountries'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18828146197751403049)
,p_event_id=>wwv_flow_imp.id(18828146073117403048)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href="#projectCountries"]'').click();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12080855112369900419)
,p_name=>'Go To Resources'
,p_event_sequence=>60
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'location.hash == ''#projectResources'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12080855121223900420)
,p_event_id=>wwv_flow_imp.id(12080855112369900419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href="#projectResources"]'').click();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12080854861744900417)
,p_name=>'Go To Issues'
,p_event_sequence=>70
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'location.hash == ''#projectIssues'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12080854962564900418)
,p_event_id=>wwv_flow_imp.id(12080854861744900417)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href="#projectIssues"]'').click();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12080855325210900422)
,p_name=>'Go To Milestones'
,p_event_sequence=>80
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'location.hash == ''#projectMilestones'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12080855509168900423)
,p_event_id=>wwv_flow_imp.id(12080855325210900422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href="#projectMilestones"]'').click();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12080855523482900424)
,p_name=>'Go To Action Items'
,p_event_sequence=>90
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'location.hash == ''#projectActionItems'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12080855693523900425)
,p_event_id=>wwv_flow_imp.id(12080855523482900424)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href="#projectActionItems"]'').click();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12080855719823900426)
,p_name=>'Go To Links'
,p_event_sequence=>100
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'location.hash == ''#projectLinks'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12080855876483900427)
,p_event_id=>wwv_flow_imp.id(12080855719823900426)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href="#projectLinks"]'').click();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12080856399261900432)
,p_name=>'Go To Updates'
,p_event_sequence=>110
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'location.hash == ''#projectUpdates'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12080856441278900433)
,p_event_id=>wwv_flow_imp.id(12080856399261900432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href="#projectUpdates"]'').click();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12080855981595900428)
,p_name=>'Go To Attachments'
,p_event_sequence=>120
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'location.hash == ''#projectAttachments'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12080856036641900429)
,p_event_id=>wwv_flow_imp.id(12080855981595900428)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href="#projectAttachments"]'').click();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12080856177133900430)
,p_name=>'Go To Status Reports'
,p_event_sequence=>130
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'location.hash == ''#projectStatusReports'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12080856307674900431)
,p_event_id=>wwv_flow_imp.id(12080856177133900430)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href="#projectStatusReports"]'').click();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11646585744167978342)
,p_name=>'Refresh Updates'
,p_event_sequence=>140
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#projectUpdates, #projectContentActions'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId == "12"'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11646585892684978343)
,p_event_id=>wwv_flow_imp.id(11646585744167978342)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741905183586725150)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3736361888933595981)
,p_event_id=>wwv_flow_imp.id(11646585744167978342)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741899995204725141)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11646586072196978345)
,p_name=>'Refresh Links'
,p_event_sequence=>150
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#projectLinks, #projectContentActions'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId == "3"'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11646586210026978346)
,p_event_id=>wwv_flow_imp.id(11646586072196978345)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741902314397725148)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3736361771291595980)
,p_event_id=>wwv_flow_imp.id(11646586072196978345)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741899995204725141)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12662975617093699024)
,p_name=>'Refresh Attachments'
,p_event_sequence=>160
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#projectAttachments, #projectContentActions'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId == "43"'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12662975756209699025)
,p_event_id=>wwv_flow_imp.id(12662975617093699024)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741903602560725149)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3736361952113595982)
,p_event_id=>wwv_flow_imp.id(12662975617093699024)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741899995204725141)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11646586730864978352)
,p_name=>'Refresh Action Items'
,p_event_sequence=>170
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'(this.data && this.data.dialogPageId == "73") || (this.data && this.data.P87_CASCADE_AI === ''Yes'' && this.data.dialogPageId == "87")'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11646586902610978353)
,p_event_id=>wwv_flow_imp.id(11646586730864978352)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6750648344639550606)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19865315688376670941)
,p_event_id=>wwv_flow_imp.id(11646586730864978352)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768224839468250765)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3736362041264595983)
,p_event_id=>wwv_flow_imp.id(11646586730864978352)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741899995204725141)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12662975404559699021)
,p_name=>'Refresh Milestones'
,p_event_sequence=>180
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#projectMilestones, #projectContentActions'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && (this.data.dialogPageId == "48" || this.data.dialogPageId == "87")'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12662975512633699022)
,p_event_id=>wwv_flow_imp.id(12662975404559699021)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768224839468250765)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3736362113973595984)
,p_event_id=>wwv_flow_imp.id(12662975404559699021)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741899995204725141)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11646587572750978360)
,p_name=>'Refresh People'
,p_event_sequence=>190
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#projectPeople, #projectContentActions'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId == "150"'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11646587637369978361)
,p_event_id=>wwv_flow_imp.id(11646587572750978360)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11466362807655344417)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3736362286309595985)
,p_event_id=>wwv_flow_imp.id(11646587572750978360)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741899995204725141)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18828146299243403050)
,p_name=>'Refresh Countries'
,p_event_sequence=>200
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#projectCountries, #projectContentActions'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId == "210"'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18828146319112403051)
,p_event_id=>wwv_flow_imp.id(18828146299243403050)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(18828134232604403030)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3736362355720595986)
,p_event_id=>wwv_flow_imp.id(18828146299243403050)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741899995204725141)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12662975012935699017)
,p_name=>'Refresh Issues'
,p_event_sequence=>210
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#projectIssues, #projectContentActions'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId == "24"'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12662975092730699018)
,p_event_id=>wwv_flow_imp.id(12662975012935699017)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7563813384782283372)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3736362482182595987)
,p_event_id=>wwv_flow_imp.id(12662975012935699017)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741899995204725141)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12662975141311699019)
,p_name=>'Refresh Resources'
,p_event_sequence=>220
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#projectResources, #projectContentActions'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId == "170"'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12662975246395699020)
,p_event_id=>wwv_flow_imp.id(12662975141311699019)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11984453835517778517)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3736362518978595988)
,p_event_id=>wwv_flow_imp.id(12662975141311699019)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741899995204725141)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12662985833149699026)
,p_name=>'Refresh Status Reports'
,p_event_sequence=>230
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#projectStatusReports, #projectContentActions'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId == "116"'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12662985921010699027)
,p_event_id=>wwv_flow_imp.id(12662985833149699026)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6061426488572532855)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3736362675627595989)
,p_event_id=>wwv_flow_imp.id(12662985833149699026)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741899995204725141)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11646587723686978362)
,p_name=>'Handle Show / Hide Content Regions'
,p_event_sequence=>240
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11646587902313978363)
,p_event_id=>wwv_flow_imp.id(11646587723686978362)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function() {',
'  function toggleRegion() {',
'      var $region = $(this)',
'        showIssuesRegion = $region.find(''#projectIssues_heading'').length === 1 && Number($v(''P200_ISS_CNT'')) > 0;',
'        showMilestonesRegion = $region.find(''#projectMilestones_heading'').length === 1 && Number($v(''P200_MS_CNT'')) > 0;',
'        showActionItemsRegion = $region.find(''#projectActionItems_heading'').length === 1 && Number($v(''P200_AI_CNT'')) > 0;',
'        noDataFound = $region.find(''.nodatafound'').length === 1;',
'      ',
'      //triggering after hide/show because that what the RDS response to',
'      if (noDataFound && !showIssuesRegion && !showMilestonesRegion && !showActionItemsRegion) {',
'        $region.hide();',
'        $region.trigger(''apexafterhide'');',
'      } else {',
'        $region.show();',
'        $region.trigger(''apexaftershow'');',
'      }',
'  }',
'  ',
'  function initHIdeShowRegions() {',
'    var $regions = $(''.js-dynamicHideShowRegion''),',
'        $rds = $(''.apex-rds'');',
'',
'    $regions',
'      .each(toggleRegion)',
'      .on(''apexafterrefresh'', toggleRegion);',
' ',
'    //using visiblity over display to avoid DOM movement issues',
'    $rds.css(''visibility'', ''visible'');',
'',
'    if ($v(''P200_SHOW_CLOSED_MSS'') == ''ALL''){',
'        $(''span.completed-milestones'').show();',
'    }',
'    else{',
'       $(''span.completed-milestones'').hide();',
'    }',
'  } ',
'',
'  //using load because document.ready here goes before the RDS has added its listeners',
'  $(window).on(''theme42ready'',initHIdeShowRegions);',
'}())'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15302912774054743048)
,p_name=>'Toggle Action Items'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P200_SHOW_CLOSED_AIS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15302912907862743049)
,p_event_id=>wwv_flow_imp.id(15302912774054743048)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P200_SHOW_CLOSED_AIS := nvl(:P200_SHOW_CLOSED_AIS,''OPEN'');'
,p_attribute_02=>'P200_SHOW_CLOSED_AIS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15302912988650743050)
,p_event_id=>wwv_flow_imp.id(15302912774054743048)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6750648344639550606)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15302913338268743054)
,p_name=>'Toggle Milestones'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P200_SHOW_CLOSED_MSS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15302913433685743055)
,p_event_id=>wwv_flow_imp.id(15302913338268743054)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P200_SHOW_CLOSED_MSS := nvl(:P200_SHOW_CLOSED_MSS,''OPEN'');'
,p_attribute_02=>'P200_SHOW_CLOSED_MSS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15302913534160743056)
,p_event_id=>wwv_flow_imp.id(15302913338268743054)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768224839468250765)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15302914093164743061)
,p_name=>'refresh on close after add ai'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7741902110145725148)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15302914204264743062)
,p_event_id=>wwv_flow_imp.id(15302914093164743061)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6750648344639550606)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21312448327953686817)
,p_event_id=>wwv_flow_imp.id(15302914093164743061)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function() {',
'  function toggleRegion() {',
'      var $region = $(this)',
'        showIssuesRegion = $region.find(''#projectIssues_heading'').length === 1 && Number($v(''P200_ISS_CNT'')) > 0;',
'        showMilestonesRegion = $region.find(''#projectMilestones_heading'').length === 1 && Number($v(''P200_MS_CNT'')) > 0;',
'        showActionItemsRegion = $region.find(''#projectActionItems_heading'').length === 1 && Number($v(''P200_AI_CNT'')) > 0;',
'        noDataFound = $region.find(''.nodatafound'').length === 1;',
'      ',
'      //triggering after hide/show because that what the RDS response to',
'      if (noDataFound && !showIssuesRegion && !showMilestonesRegion && !showActionItemsRegion) {',
'        $region.hide();',
'        $region.trigger(''apexafterhide'');',
'      } else {',
'        $region.show();',
'        $region.trigger(''apexaftershow'');',
'      }',
'  }',
'  ',
'  function initHIdeShowRegions() {',
'    var $regions = $(''.js-dynamicHideShowRegion''),',
'        $rds = $(''.apex-rds'');',
'',
'    $regions',
'      .each(toggleRegion)',
'      .on(''apexafterrefresh'', toggleRegion);',
' ',
'    //using visiblity over display to avoid DOM movement issues',
'    $rds.css(''visibility'', ''visible'');',
'',
'    if ($v(''P200_SHOW_CLOSED_MSS'') == ''ALL''){',
'        $(''span.completed-milestones'').show();',
'    }',
'    else{',
'       $(''span.completed-milestones'').hide();',
'    }',
'  } ',
'',
'  //using load because document.ready here goes before the RDS has added its listeners',
'  $(window).on(''theme42ready'',initHIdeShowRegions);',
'}())'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15302914280284743063)
,p_name=>'refresh on close after add ms'
,p_event_sequence=>280
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7741907104810725154)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21312448422118686818)
,p_event_id=>wwv_flow_imp.id(15302914280284743063)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function() {',
'  function toggleRegion() {',
'      var $region = $(this)',
'        showIssuesRegion = $region.find(''#projectIssues_heading'').length === 1 && Number($v(''P200_ISS_CNT'')) > 0;',
'        showMilestonesRegion = $region.find(''#projectMilestones_heading'').length === 1 && Number($v(''P200_MS_CNT'')) > 0;',
'        showActionItemsRegion = $region.find(''#projectActionItems_heading'').length === 1 && Number($v(''P200_AI_CNT'')) > 0;',
'        noDataFound = $region.find(''.nodatafound'').length === 1;',
'      ',
'      //triggering after hide/show because that what the RDS response to',
'      if (noDataFound && !showIssuesRegion && !showMilestonesRegion && !showActionItemsRegion) {',
'        $region.hide();',
'        $region.trigger(''apexafterhide'');',
'      } else {',
'        $region.show();',
'        $region.trigger(''apexaftershow'');',
'      }',
'  }',
'  ',
'  function initHIdeShowRegions() {',
'    var $regions = $(''.js-dynamicHideShowRegion''),',
'        $rds = $(''.apex-rds'');',
'',
'    $regions',
'      .each(toggleRegion)',
'      .on(''apexafterrefresh'', toggleRegion);',
' ',
'    //using visiblity over display to avoid DOM movement issues',
'    $rds.css(''visibility'', ''visible'');',
'',
'    if ($v(''P200_SHOW_CLOSED_MSS'') == ''ALL''){',
'        $(''span.completed-milestones'').show();',
'    }',
'    else{',
'       $(''span.completed-milestones'').hide();',
'    }',
'  } ',
'',
'  //using load because document.ready here goes before the RDS has added its listeners',
'  $(window).on(''theme42ready'',initHIdeShowRegions);',
'}())'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331869760579223514)
,p_event_id=>wwv_flow_imp.id(15302914280284743063)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768224839468250765)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18023882492764252016)
,p_name=>'Refresh Child Projects'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P200_SHOW_CLOSED_CHILDREN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18023882545718252017)
,p_event_id=>wwv_flow_imp.id(18023882492764252016)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6066430401544758672)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18067128896966239737)
,p_name=>'Adjust landing for location.hash'
,p_event_sequence=>300
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'location.hash > '''''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18067128992741239738)
,p_event_id=>wwv_flow_imp.id(18067128896966239737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''li.apex-rds-item apex-rds-selected a'').click();',
'location.hash = '''';',
'location.href = location.href;'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19058731512400337561)
,p_name=>'Toggle Issues'
,p_event_sequence=>310
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P200_SHOW_CLOSED_ISSUES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19058731700996337563)
,p_event_id=>wwv_flow_imp.id(19058731512400337561)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P200_SHOW_CLOSED_ISSUES := nvl(:P200_SHOW_CLOSED_ISSUES,''OPEN'');'
,p_attribute_02=>'P200_SHOW_CLOSED_ISSUES'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19058731536453337562)
,p_event_id=>wwv_flow_imp.id(19058731512400337561)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7563813384782283372)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19741812080178499819)
,p_name=>'Toggle Updates'
,p_event_sequence=>320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P200_SHOW_ONLY_GOLD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19741812145216499820)
,p_event_id=>wwv_flow_imp.id(19741812080178499819)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P200_SHOW_ONLY_GOLD := nvl(:P200_SHOW_ONLY_GOLD,''ALL'');'
,p_attribute_02=>'P200_SHOW_ONLY_GOLD'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19741812311876499821)
,p_event_id=>wwv_flow_imp.id(19741812080178499819)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7741905183586725150)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19741816263322499861)
,p_name=>'Refresh MS & AI regions after AI edit close'
,p_event_sequence=>330
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6750648344639550606)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19741816359207499862)
,p_event_id=>wwv_flow_imp.id(19741816263322499861)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6750648344639550606)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19741816423071499863)
,p_event_id=>wwv_flow_imp.id(19741816263322499861)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768224839468250765)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21312448266362686816)
,p_event_id=>wwv_flow_imp.id(19741816263322499861)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function() {',
'  function toggleRegion() {',
'      var $region = $(this)',
'        showIssuesRegion = $region.find(''#projectIssues_heading'').length === 1 && Number($v(''P200_ISS_CNT'')) > 0;',
'        showMilestonesRegion = $region.find(''#projectMilestones_heading'').length === 1 && Number($v(''P200_MS_CNT'')) > 0;',
'        showActionItemsRegion = $region.find(''#projectActionItems_heading'').length === 1 && Number($v(''P200_AI_CNT'')) > 0;',
'        noDataFound = $region.find(''.nodatafound'').length === 1;',
'      ',
'      //triggering after hide/show because that what the RDS response to',
'      if (noDataFound && !showIssuesRegion && !showMilestonesRegion && !showActionItemsRegion) {',
'        $region.hide();',
'        $region.trigger(''apexafterhide'');',
'      } else {',
'        $region.show();',
'        $region.trigger(''apexaftershow'');',
'      }',
'  }',
'  ',
'  function initHIdeShowRegions() {',
'    var $regions = $(''.js-dynamicHideShowRegion''),',
'        $rds = $(''.apex-rds'');',
'',
'    $regions',
'      .each(toggleRegion)',
'      .on(''apexafterrefresh'', toggleRegion);',
' ',
'    //using visiblity over display to avoid DOM movement issues',
'    $rds.css(''visibility'', ''visible'');',
'',
'    if ($v(''P200_SHOW_CLOSED_MSS'') == ''ALL''){',
'        $(''span.completed-milestones'').show();',
'    }',
'    else{',
'       $(''span.completed-milestones'').hide();',
'    }',
'  } ',
'',
'  //using load because document.ready here goes before the RDS has added its listeners',
'  $(window).on(''theme42ready'',initHIdeShowRegions);',
'}())'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20124884276619729648)
,p_name=>'Refresh MS & AI regions after MS edit close'
,p_event_sequence=>340
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6768224839468250765)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20124884331920729649)
,p_event_id=>wwv_flow_imp.id(20124884276619729648)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768224839468250765)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20124884505860729650)
,p_event_id=>wwv_flow_imp.id(20124884276619729648)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6750648344639550606)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21312448520957686819)
,p_event_id=>wwv_flow_imp.id(20124884276619729648)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function() {',
'  function toggleRegion() {',
'      var $region = $(this)',
'        showIssuesRegion = $region.find(''#projectIssues_heading'').length === 1 && Number($v(''P200_ISS_CNT'')) > 0;',
'        showMilestonesRegion = $region.find(''#projectMilestones_heading'').length === 1 && Number($v(''P200_MS_CNT'')) > 0;',
'        showActionItemsRegion = $region.find(''#projectActionItems_heading'').length === 1 && Number($v(''P200_AI_CNT'')) > 0;',
'        noDataFound = $region.find(''.nodatafound'').length === 1;',
'      ',
'      //triggering after hide/show because that what the RDS response to',
'      if (noDataFound && !showIssuesRegion && !showMilestonesRegion && !showActionItemsRegion) {',
'        $region.hide();',
'        $region.trigger(''apexafterhide'');',
'      } else {',
'        $region.show();',
'        $region.trigger(''apexaftershow'');',
'      }',
'  }',
'  ',
'  function initHIdeShowRegions() {',
'    var $regions = $(''.js-dynamicHideShowRegion''),',
'        $rds = $(''.apex-rds'');',
'',
'    $regions',
'      .each(toggleRegion)',
'      .on(''apexafterrefresh'', toggleRegion);',
' ',
'    //using visiblity over display to avoid DOM movement issues',
'    $rds.css(''visibility'', ''visible'');',
'',
'    if ($v(''P200_SHOW_CLOSED_MSS'') == ''ALL''){',
'        $(''span.completed-milestones'').show();',
'    }',
'    else{',
'       $(''span.completed-milestones'').hide();',
'    }',
'  } ',
'',
'  //using load because document.ready here goes before the RDS has added its listeners',
'  $(window).on(''theme42ready'',initHIdeShowRegions);',
'}())'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3356098078467512985)
,p_name=>'Hide MS AAIs'
,p_event_sequence=>350
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P200_HIDE_ASSOC_AIS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3356098150368512986)
,p_event_id=>wwv_flow_imp.id(3356098078467512985)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P200_HIDE_ASSOC_AIS := nvl(:P200_HIDE_ASSOC_AIS,''N'');'
,p_attribute_02=>'P200_HIDE_ASSOC_AIS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3356098236857512987)
,p_event_id=>wwv_flow_imp.id(3356098078467512985)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6768224839468250765)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(406493222192338859)
,p_name=>'Email everybody in this project'
,p_event_sequence=>360
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(417232188021456688)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(406493323012338860)
,p_event_id=>wwv_flow_imp.id(406493222192338859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var spinner$ = apex.util.showSpinner( $( "#projectPeople" ) );',
'// generateEmails is an Ajax Callback defined on this page that returns an JSON object.',
'apex.server.process( "generateEmails", {',
'    x01: $v( ''P200_ID'' )',
'}, {',
'    success: function(pData) {',
'        var list = pData.emails.join( ''; '' );',
'        window.location.href = encodeURI(''mailto:'' + list + ''?subject='') + encodeURIComponent( $v( ''P200_PROJECT_NAME'' ) );',
'        spinner$.remove();',
'    },',
'    error: function(pData) {',
'        console.log(pData);',
'    }',
'});',
''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5754133510131170173)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'follow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'merge into eba_proj_status_favorites dest',
'using (',
'    select upper(:APP_USER) user_name, :P200_ID content_id, ''PROJECT'' content_type',
'    from dual',
'    ) src',
'on ( dest.user_name = src.user_name and dest.content_id = src.content_id and dest.content_type = src.content_type )',
'when not matched then',
'    insert (dest.user_name, dest.content_id, dest.content_type)',
'    values (src.user_name, src.content_id, src.content_type);'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5754133401529167212)
,p_process_success_message=>'Following project.'
,p_internal_uid=>5754133510131170173
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5757751891993114508)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'unfollow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from eba_proj_status_favorites',
'where user_name = upper(:APP_USER)',
'    and content_id = :P200_ID',
'    and content_type = ''PROJECT'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5757751593680111489)
,p_process_success_message=>'No longer following project.'
,p_internal_uid=>5757751891993114508
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12179264158799588928)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enforce ACL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_found boolean := false;',
'begin',
'    for c1 in ( select null',
'                from eba_proj_status',
'                where id = :P200_ID ) loop',
'        l_found := true;',
'    end loop;',
'    if l_found = false then',
'        owa_util.redirect_url(',
'            apex_util.prepare_url(''f?p=''||:APP_ID||'':HOME:''||:APP_SESSION)',
'        );',
'        apex_application.stop_apex_engine;',
'    end if;',
'end loop;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>12179264158799588928
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6061158101176183028)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'count clicks'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into EBA_PROJ_STATUS_CLICKS (project_id) values (:P200_ID);',
'delete from EBA_PROJ_STATUS_CLICKS where VIEW_TIMESTAMP < (sysdate - 90);',
'commit;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>6061158101176183028
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(406493433060338861)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'generateEmails'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'  apex_json.open_object;',
'  apex_json.open_array(''emails'');',
'  ',
'    for c1 in (select',
'       case',
'           when instr(u.username,''@'') > 0 then',
'               u.username',
'           when instr(u.username,''@'') = 0 and u.email_address is not null then',
'               u.email_address',
'       end as email',
'    from eba_proj_user_ref rf,',
'       eba_proj_roles r,',
'       eba_proj_status_users u',
'    where rf.project_id = apex_application.g_x01',
'       and rf.user_id = u.id',
'       and rf.role_id = r.id )',
'',
'    LOOP',
'      apex_json.write( c1.email );',
'    END LOOP;',
'',
'    apex_json.close_all;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>406493433060338861
);
wwv_flow_imp.component_end;
end;
/
