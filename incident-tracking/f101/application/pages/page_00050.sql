prompt --application/pages/page_00050
begin
--   Manifest
--     PAGE: 00050
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_page.create_page(
 p_id=>50
,p_name=>'Ticket'
,p_alias=>'TICKET'
,p_step_title=>'Ticket'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026474429031351)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(1609146493940051929)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'The ticket details page shows all of the incident''s attributes and allows for end users to add attachments, links, and updates to incidents. Click the <strong>Edit Ticket</strong> button to edit the incident''s attributes. Click the <strong>Add Update'
||'</strong> button to add an update to the incident. Click the <strong>Add Link</strong> button to add a link to the incident. Click the <strong>Add Attachment</strong> button to add an attachment/upload a file to the incident. Click the <strong>Valida'
||'te</strong> button to validate that the project is still open and pertinent.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1461279956028747474)
,p_plug_name=>'Date Closed'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>210
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select date_closed, ''Date Closed'' label',
'from eba_intrack_incidents_view',
'where id = :P50_ID'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.MINICALENDAR'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_intrack_incidents_view',
'where id = :P50_ID',
'    and date_closed is not null'))
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'DATE_CLOSED',
  'attribute_02', 'LABEL')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1461281070507763274)
,p_plug_name=>'Date Created'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>200
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select created, ''Date Created'' label',
'from eba_intrack_incidents_view',
'where id = :P50_ID'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.MINICALENDAR'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_intrack_incidents_view',
'where id = :P50_ID',
'    and date_closed is not null'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'CREATED',
  'attribute_02', 'LABEL')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1536988045441878653)
,p_plug_name=>'Validations'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>160
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    verified_by,',
'    created',
'from',
'    eba_intrack_verifications',
'where',
'    view_id = :P50_ID',
'order by',
'    created desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.VALIDATOR'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_required_patch=>wwv_flow_imp.id(1539902050966954833)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP,64:P64_ID:&P50_ID.')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1536990054576890736)
,p_name=>'Ticket Validations'
,p_region_name=>'view_validations'
,p_template=>wwv_flow_imp.id(1609178879382051995)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'REGION_POSITION_04'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	lower(verified_by) as validated_by,',
'        created last_validated,',
'	created validation_date,',
'	verification_comment',
'from',
'	eba_intrack_verifications',
'where',
'	view_id = :P50_ID',
'order by',
'	created desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(1609189559365052032)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No validations have been recorded'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
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
 p_id=>wwv_flow_imp.id(1536990347296890737)
,p_query_column_id=>1
,p_column_alias=>'VALIDATED_BY'
,p_column_display_sequence=>1
,p_column_heading=>'Validated By'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1537102457384656190)
,p_query_column_id=>2
,p_column_alias=>'LAST_VALIDATED'
,p_column_display_sequence=>2
,p_column_heading=>'Last Validated'
,p_column_format=>'since'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1536990454247890738)
,p_query_column_id=>3
,p_column_alias=>'VALIDATION_DATE'
,p_column_display_sequence=>3
,p_column_heading=>'Validation Date'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1536990558748890738)
,p_query_column_id=>4
,p_column_alias=>'VERIFICATION_COMMENT'
,p_column_display_sequence=>4
,p_column_heading=>'Comment'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1537288163309969594)
,p_plug_name=>'Content Completeness'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>170
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    metric,',
'    the_score,',
'    max_value ',
'from',
'    (',
'        select  ''Ticket is not closed'' metric, ',
'                decode(date_closed,null,0,20) the_score,',
'                20 max_value',
'        from eba_intrack_incidents_view where id = :P50_ID',
'        union all ',
'        select  ''Ticket has description longer then 200 characters'' metric, ',
'                decode(dbms_lob.getlength(i.description),0,0,10) the_score,',
'                10 max_value ',
'        from eba_intrack_incidents_view v, eba_intrack_incidents i',
'        where v.id = :P50_ID ',
'        and v.incident_number = i.incident_number',
'        and nvl(dbms_lob.getlength(i.description),0) >= 200',
'        union all ',
'        select  ''Ticket has tags'' metric, ',
'                decode(i.tags,null,0,10) the_score,',
'                10 max_value ',
'        from eba_intrack_incidents_view v, eba_intrack_incidents i',
'        where v.id = :P50_ID ',
'        and v.incident_number = i.incident_number',
'        union all ',
'        select  ''Ticket has description'' metric, ',
'                decode(dbms_lob.getlength(i.description),0,0,20) the_score,',
'                20 max_value ',
'        from eba_intrack_incidents_view v, eba_intrack_incidents i',
'        where v.id = :P50_ID ',
'        and v.incident_number = i.incident_number',
'        union all',
'        select  nvl(max(''Ticket has links''),''Ticket has links'') metric, ',
'                decode(count(*),0,0,10) the_score,',
'                nvl(max(10),10) max_value ',
'        from eba_intrack_incidents_view v, eba_intrack_incidents i, eba_intrack_links l',
'        where v.id = :P50_ID ',
'        and v.incident_number = i.incident_number',
'        and l.incident_id = i.id',
'        union all',
'        select  nvl(max(''Ticket has updates''),''Ticket has updates'') metric, ',
'                decode(count(*),0,0,10) the_score,',
'                nvl(max(10),10) max_value ',
'        from eba_intrack_incidents_view v, eba_intrack_incidents i, eba_intrack_notes n',
'        where v.id = :P50_ID ',
'        and v.incident_number = i.incident_number',
'        and n.incident_id = i.id',
'        union all',
'        select  nvl(max(''Ticket has Ticket updates in last week''),''Ticket has Ticket updates in last week'') metric, ',
'                decode(count(*),0,0,10) the_score,',
'                nvl(max(10),10) max_value ',
'        from eba_intrack_incidents_view v, eba_intrack_incidents i, eba_intrack_notes n',
'        where v.id = :P50_ID ',
'        and v.incident_number = i.incident_number',
'        and n.incident_id = i.id',
'        and n.updated > (sysdate - 7)',
'        union all',
'        select  nvl(max(''Ticket has attachments''),''Ticket has attachments'') metric, ',
'                decode(count(*),0,0,5) the_score,',
'                nvl(max(5),5) max_value ',
'        from eba_intrack_incidents_view v, eba_intrack_incidents i, eba_intrack_files f',
'        where v.id = :P50_ID ',
'        and v.incident_number = i.incident_number',
'        and f.incident_id = i.id',
'        union all',
'        select  nvl(max(''Ticket verifications exist''),''Ticket verifications exist'') metric, ',
'                decode(max((select count(*) from eba_intrack_verifications v',
'        where v.view_id = :P50_ID )),0,0,20) the_score,',
'                nvl(max(20),20) max_value ',
'        from eba_intrack_incidents_view where id = :P50_ID',
'        union all',
'        select  nvl(max(''Ticket verifications exist in last week''),''Ticket verifications exist in last week'') metric, ',
'                decode(max((select count(*) from eba_intrack_verifications v',
'        where v.view_id = :P50_ID and v.created > (sysdate - 7))),0,0,30) the_score,',
'                nvl(max(30),30) max_value ',
'        from eba_intrack_incidents_view where id = :P50_ID',
'        union all',
'        select  nvl(max(''Ticket verifications exist in last week by Ticket filer''),''Ticket verifications exist in last week by Ticket filer'') metric, ',
'                decode(max((select count(*) from eba_intrack_verifications v',
'        where v.view_id = :P50_ID and v.created > (sysdate - 7) and (',
'        upper(:app_user) = upper(created_by)',
'        ))),0,0,30) the_score,',
'                nvl(max(30),30) max_value ',
'        from eba_intrack_incidents_view where id = :P50_ID',
'    ) x',
'order by',
'    1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.COMPLETENESS'
,p_required_patch=>wwv_flow_imp.id(1539901858299951452)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', '66',
  'attribute_02', 'Strong',
  'attribute_03', '33',
  'attribute_04', 'Moderate',
  'attribute_05', '5',
  'attribute_06', 'Weak',
  'attribute_07', 'Very Weak',
  'attribute_08', 'Completeness Score Details')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1937677042686631142)
,p_plug_name=>'Usage Metrics - 90 days'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>190
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    count(*) value,',
'    ''Views'' label',
'from',
'    eba_intrack_clicks',
'where',
'    view_id = :P50_ID ',
'and',
'    view_timestamp > sysdate - 90',
'union all',
'select',
'    count(distinct app_username) value,',
'    ''Users'' label',
'from',
'    eba_intrack_clicks',
'where',
'    view_id = :P50_ID ',
'and',
'    view_timestamp > sysdate - 90'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LABEL',
  'attribute_02', 'VALUE',
  'attribute_04', 'f?p=&APP_ID.:66:&APP_SESSION.:::66:P66_ID:&P50_ID.',
  'attribute_05', '2',
  'attribute_06', 'L',
  'attribute_07', 'DOT',
  'attribute_08', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2075750822313586850)
,p_plug_name=>'Region Display Selector'
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'SESSION')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2103462046594046130)
,p_plug_name=>'Actions'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-LinksList--showIcons:t-LinksList--actions'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>120
,p_plug_display_point=>'REGION_POSITION_03'
,p_list_id=>wwv_flow_imp.id(2103454868630036214)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(1609197146392052049)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3022733443138865062)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609169123120051976)
,p_plug_display_sequence=>200
,p_plug_display_point=>'REGION_POSITION_07'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3022733865532865067)
,p_plug_name=>'Ticket Number'
,p_plug_display_sequence=>110
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(3022734253789865068)
,p_name=>'Updates'
,p_template=>wwv_flow_imp.id(1609179910711051998)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Comments--chat'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'        '''' class, --use grayComment for gray look',
'        ''Note'' note_type,',
'        replace(apex_escape.html(dbms_lob.substr(note,2000,1)),chr(10),''<br />'') comment_text,',
'        '''' attribute_1,',
'        '''' attribute_2,',
'        '''' attribute_3,',
'        '''' attribute_4,',
'        lower(created_by) user_name,',
'        apex_util.get_since(created) comment_date,',
'        upper(',
'          decode(instr(replace(created_by,''.'','' ''),'' ''),',
'                 0, ',
'                 substr(created_by,1,2),',
'                 substr(created_by,1,1)||substr(created_by,instr(replace(created_by,''.'','' ''),'' '')+1,1)',
'           )) user_icon,',
'        ''Edit'' actions,',
'        id note_id',
'from EBA_INTRACK_NOTES ',
'where   INCIDENT_ID = :P50_ID ',
'union all',
'select ',
'        ''grayComment'' class, --use grayComment for gray look',
'        ''Update'' note_type,',
'        case  follow_up_type ',
'        when ''STATUS_CHANGE'' then',
'           ''Status changed from <strong>''||',
'           (select status_name from EBA_INTRACK_STATUS where id = status_old_val)||''</strong> to <strong>''||',
'           (select status_name from EBA_INTRACK_STATUS where id = status_new_val) ||''</strong>''',
'        when ''CLOSE_DATE_CHANGE'' then',
'           ''Close date changed from <strong>''||status_old_val||''</strong> to <strong>''||status_new_val||''</strong>''',
'        when ''ASSIGNEE_CHANGE'' then',
'           ''Assignee changed from <strong>''||(select assignee_name from EBA_INTRACK_ASSIGNEES where id = to_number(status_old_val))||''</strong> to <strong>''||(select assignee_name from EBA_INTRACK_ASSIGNEES where id = to_number(status_new_val))||''</s'
||'trong>''',
'        when ''URGENCY_CHANGE'' then',
'            ''Urgency changed from <strong>''||',
'            (select URGENCY_NAME from EBA_INTRACK_URGENCY where id = status_old_val)||''</strong> to <strong>''||',
'            (select URGENCY_NAME from EBA_INTRACK_URGENCY where id = status_new_val) ||''</strong>''',
'	    when ''SEVERITY_CHANGE'' then',
'	        ''Severity changed from <strong>''||',
'	        (select SEVERITY_NAME from EBA_INTRACK_SEVERITY where id = status_old_val)||''</strong> to <strong>''||',
'	        (select SEVERITY_NAME from EBA_INTRACK_SEVERITY where id = status_new_val) ||''</strong>''',
'		when ''CATEGORY_CHANGE'' then',
'		    ''Category changed from <strong>''||',
'		    (select CATEGORY_NAME from EBA_INTRACK_CATEGORY where id = status_old_val)||''</strong> to <strong>''||',
'		    (select CATEGORY_NAME from EBA_INTRACK_CATEGORY where id = status_new_val) ||''</strong>''',
'		when ''GROUP_CHANGE'' then',
'		    ''Group changed from <strong>''||',
'		    (select GROUP_NAME from EBA_INTRACK_GROUP where id = status_old_val)||''</strong> to <strong>''||',
'		    (select GROUP_NAME from EBA_INTRACK_GROUP where id = status_new_val) ||''</strong>''',
'		when ''PRODUCT_CHANGE'' then',
'		    ''Product changed from <strong>''||',
'		    (select PRODUCT_NAME from EBA_INTRACK_PRODUCT where id = status_old_val)||''</strong> to <strong>''||',
'		    (select PRODUCT_NAME from EBA_INTRACK_PRODUCT where id = status_new_val) ||''</strong>''',
'	    when ''PRODUCT_VERSION_CHANGE'' then',
'	        ''Product version changed from <strong>''||',
'	        (select VERSION_NAME from EBA_INTRACK_VERSION where id = status_old_val)||''</strong> to <strong>''||',
'	        (select VERSION_NAME from EBA_INTRACK_VERSION where id = status_new_val) ||''</strong>''',
'	    when ''CUSTOMER_CHANGE'' then',
'	        ''Customer changed from <strong>''||',
'	        (select CUSTOMER_NAME from EBA_INTRACK_CUSTOMERS where id = status_old_val)||''</strong> to <strong>''||',
'	        (select CUSTOMER_NAME from EBA_INTRACK_CUSTOMERS where id = status_new_val) ||''</strong>''',
'	    when ''BUG_CHANGE'' then',
'	       ''Bug changed from <strong>''||apex_escape.html(status_old_val)||''</strong> to <strong>''||apex_escape.html(status_new_val)||''</strong>''',
'	    when ''SUBJECT_CHANGE'' then',
'	       ''Subject changed from <strong>''||apex_escape.html(status_old_val)||''</strong> to <strong>''||apex_escape.html(status_new_val)||''</strong>''',
'	    when ''TAG_CHANGE'' then',
'	       ''Tags changed from <strong>''||apex_escape.html(status_old_val)||''</strong> to <strong>''||apex_escape.html(status_new_val)||''</strong>''	',
'        end comment_text,',
'        '''' attribute_1,',
'        '''' attribute_2,',
'        '''' attribute_3,',
'        '''' attribute_4,',
'        lower(created_by) user_name,',
'        apex_util.get_since(created) comment_date,',
'        upper(',
'          decode(instr(replace(created_by,''.'','' ''),'' ''),',
'                 0, ',
'                 substr(created_by,1,2),',
'                 substr(created_by,1,1)||substr(created_by,instr(replace(created_by,''.'','' ''),'' '')+1,1)',
'           )) user_icon,',
'        null actions,',
'        id note_id',
'from EBA_INTRACK_INC_FOLLOWUP ',
'where   INCIDENT_ID = :P50_ID ',
'order by 11 desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(1609188817617052028)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No updates'
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
 p_id=>wwv_flow_imp.id(3022735457573865070)
,p_query_column_id=>1
,p_column_alias=>'CLASS'
,p_column_display_sequence=>1
,p_column_heading=>'Class'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022734454301865069)
,p_query_column_id=>2
,p_column_alias=>'NOTE_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Note Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2103055474094804582)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>7
,p_column_heading=>'Comment Text'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022734663208865070)
,p_query_column_id=>4
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>3
,p_column_heading=>'Attribute 1'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022734774290865070)
,p_query_column_id=>5
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>5
,p_column_heading=>'Attribute 2'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022734845973865070)
,p_query_column_id=>6
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>4
,p_column_heading=>'Attribute 3'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022734948304865070)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>6
,p_column_heading=>'Attribute 4'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2103055879664804583)
,p_query_column_id=>8
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>8
,p_column_heading=>'User Name'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2103056281271804584)
,p_query_column_id=>9
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>9
,p_column_heading=>'Comment Date'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2103072342416816386)
,p_query_column_id=>10
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>10
,p_column_heading=>'User Icon'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2103072658140816389)
,p_query_column_id=>11
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>11
,p_column_heading=>'Actions'
,p_column_link=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.:55:P55_ID:#NOTE_ID#'
,p_column_linktext=>'#ACTIONS#'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2103213484959838259)
,p_query_column_id=>12
,p_column_alias=>'NOTE_ID'
,p_column_display_sequence=>12
,p_column_heading=>'Note Id'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(3022735960535865070)
,p_name=>'Attachments'
,p_template=>wwv_flow_imp.id(1609179910711051998)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    id,',
'    ''<a href="''||APEX_UTIL.GET_BLOB_FILE_SRC(''P54_FILE_BLOB'',id)||''">''||apex_escape.html(FILENAME)||''</a>'' FILE_NAME,',
'    FILE_MIMETYPE,',
'    FILE_CHARSET,',
'    apex_util.filesize_mask(dbms_lob.getlength(FILE_BLOB)) f_len,',
'    substr(FILE_COMMENTS,1,50)||decode(greatest(length(FILE_COMMENTS),50),50,'''',''...'') FILE_COMMENTS,',
'    case when instr(upper(FILENAME),''.PPT'') > 0or instr(upper(FILENAME),''.PPTX'') > 0 then',
'        ''uFileIcon powerpoint''',
'    when instr(upper(FILENAME),''.XLS'') > 0 or instr(upper(FILENAME),''.XLSX'') > 0 then',
'        ''uFileIcon excel''',
'    when instr(upper(FILENAME),''.DOC'') > 0 or instr(upper(FILENAME),''.DOCX'') > 0 then',
'        ''uFileIcon word''',
'    when instr(upper(FILENAME),''.PDF'') > 0 then',
'        ''uFileIcon pdf''',
'    when instr(upper(FILENAME),''.GIF'') > 0 or',
'         instr(upper(FILENAME),''.PNG'') > 0 or',
'         instr(upper(FILENAME),''.TIFF'') > 0 or',
'         instr(upper(FILENAME),''.JPG'') > 0 then',
'        ''uFileIcon image''',
'    else',
'        ''uFileIcon generic''',
'    end file_type,',
'    created,',
'    lower(created_by) created_by',
'from EBA_INTRACK_FILES f',
'where INCIDENT_ID = :P50_ID ',
'order by created desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(1609189559365052032)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No Attachments'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022736949992865071)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3023269561407952433)
,p_query_column_id=>2
,p_column_alias=>'FILE_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3023444159339027583)
,p_query_column_id=>3
,p_column_alias=>'FILE_MIMETYPE'
,p_column_display_sequence=>8
,p_column_heading=>'Mimetype'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3023444272977027583)
,p_query_column_id=>4
,p_column_alias=>'FILE_CHARSET'
,p_column_display_sequence=>9
,p_column_heading=>'Charset'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022736451565865070)
,p_query_column_id=>5
,p_column_alias=>'F_LEN'
,p_column_display_sequence=>4
,p_column_heading=>'Size'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022736573759865070)
,p_query_column_id=>6
,p_column_alias=>'FILE_COMMENTS'
,p_column_display_sequence=>5
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022736653399865071)
,p_query_column_id=>7
,p_column_alias=>'FILE_TYPE'
,p_column_display_sequence=>2
,p_column_html_expression=>'<img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="#FILE_TYPE#" />'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'NEVER'
,p_report_column_width=>16
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022736742020865071)
,p_query_column_id=>8
,p_column_alias=>'CREATED'
,p_column_display_sequence=>6
,p_column_heading=>'Date Added'
,p_column_format=>'SINCE'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022736867316865071)
,p_query_column_id=>9
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>7
,p_column_heading=>'Added By'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(3022737462731865071)
,p_name=>'Links'
,p_template=>wwv_flow_imp.id(1609179910711051998)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select link_text, ',
'       case when substr(link_target,1,4) != ''http'' then',
'           ''http://'' || link_target',
'       else',
'           link_target',
'       end link_target,',
'       lower(created_by) created_by,',
'       created,',
'       link_comments ',
'from EBA_INTRACK_LINKS ',
'where INCIDENT_ID = :P50_ID ',
'order by 4 desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(1609189559365052032)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No Links'
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
 p_id=>wwv_flow_imp.id(3022737661279865072)
,p_query_column_id=>1
,p_column_alias=>'LINK_TEXT'
,p_column_display_sequence=>1
,p_column_heading=>'Name'
,p_column_link=>'#LINK_TARGET#'
,p_column_linktext=>'#LINK_TEXT#'
,p_column_link_attr=>'target="_blank"'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3267688655530384618)
,p_query_column_id=>2
,p_column_alias=>'LINK_TARGET'
,p_column_display_sequence=>5
,p_column_heading=>'Link Target'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022737847158865072)
,p_query_column_id=>3
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>3
,p_column_heading=>'Added By'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022737955101865072)
,p_query_column_id=>4
,p_column_alias=>'CREATED'
,p_column_display_sequence=>4
,p_column_heading=>'Date Added'
,p_column_format=>'SINCE'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022738072142865072)
,p_query_column_id=>5
,p_column_alias=>'LINK_COMMENTS'
,p_column_display_sequence=>2
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(3022738549412865072)
,p_name=>'Summary'
,p_template=>wwv_flow_imp.id(1609179910711051998)
,p_display_sequence=>130
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'REGION_POSITION_03'
,p_item_display_point=>'BELOW'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Attachments'' v, count(*) c',
'  from EBA_INTRACK_FILES',
'  where INCIDENT_ID = :P50_ID',
'union all',
'select ''Attachments Size'' v, sum(dbms_lob.getlength(FILE_BLOB)) c',
'  from EBA_INTRACK_FILES',
'  where INCIDENT_ID = :P50_ID',
'union all',
'select ''Notes'' v, count(*) c',
'  from EBA_INTRACK_NOTES',
'  where INCIDENT_ID = :P50_ID',
'union all',
'select ''Links'' v, count(*) c',
'  from EBA_INTRACK_LINKS',
'  where INCIDENT_ID = :P50_ID',
'order by 1'))
,p_display_condition_type=>'NEVER'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(1609191321083052036)
,p_query_headings_type=>'QUERY_COLUMNS'
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
 p_id=>wwv_flow_imp.id(3022738761749865073)
,p_query_column_id=>1
,p_column_alias=>'V'
,p_column_display_sequence=>1
,p_column_heading=>'V'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022738863668865073)
,p_query_column_id=>2
,p_column_alias=>'C'
,p_column_display_sequence=>2
,p_column_heading=>'C'
,p_column_format=>'999G999G999G999G999G990'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(3022742163053865081)
,p_name=>'Ticket'
,p_template=>wwv_flow_imp.id(1609169123120051976)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	 product_name||'', ''|| (select nvl(v.version_name,''(no version provided)'') from EBA_INTRACK_VERSION v where v.id = product_version_id) "PRODUCT_NAME",',
'         customer ||'' - '' || customer_contact_name || ',
'            '' ( ''||       customer_contact_email||'' )'' customer,',
'         status_code||''. ''||status_name || '' ( ''||',
'            decode(status_type,''OPEN'',''Open'',''CLOSED'',',
'            ''Closed'',status_type) ||'' )'' status,',
'	 "SEVERITY_NAME",',
'	 "SUBJECT",',
'         nvl(assignee,''Unknown'')||'', assigned ''||apex_util.get_since(assigned_on) assignee,',
'	 apex_util.get_since(DATE_CLOSED)||'' - ''||to_char(DATE_CLOSED,''Day DD-MON-YYYY HH24:MI'') "DATE_CLOSED",',
'	 "DESCRIPTION",',
'	"URGENCY_NAME",',
'        apex_util.get_since(created)||'' - ''||to_char(created,''Day DD-MON-YYYY HH24:MI'') created',
' from eba_intrack_incidents_view',
'where id = :P50_ID',
'order by 1'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(1609191499082052037)
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
 p_id=>wwv_flow_imp.id(3022743545866865081)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Product'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022842543782873986)
,p_query_column_id=>2
,p_column_alias=>'CUSTOMER'
,p_column_display_sequence=>4
,p_column_heading=>'Customer'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022842663304873986)
,p_query_column_id=>3
,p_column_alias=>'STATUS'
,p_column_display_sequence=>5
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022842743013873986)
,p_query_column_id=>4
,p_column_alias=>'SEVERITY_NAME'
,p_column_display_sequence=>6
,p_column_heading=>'Severity'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022742869568865081)
,p_query_column_id=>5
,p_column_alias=>'SUBJECT'
,p_column_display_sequence=>1
,p_column_heading=>'Subject'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022842965147873986)
,p_query_column_id=>6
,p_column_alias=>'ASSIGNEE'
,p_column_display_sequence=>8
,p_column_heading=>'Assignee'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022843360696873986)
,p_query_column_id=>7
,p_column_alias=>'DATE_CLOSED'
,p_column_display_sequence=>9
,p_column_heading=>'Date Closed'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022744052736865082)
,p_query_column_id=>8
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>2
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3022743065237865081)
,p_query_column_id=>9
,p_column_alias=>'URGENCY_NAME'
,p_column_display_sequence=>7
,p_column_heading=>'Resolution Urgency'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3340552264146085112)
,p_query_column_id=>10
,p_column_alias=>'CREATED'
,p_column_display_sequence=>10
,p_column_heading=>'Date Created'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3022744171268865082)
,p_plug_name=>'Ticket Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>100
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3025344651588066175)
,p_plug_name=>'Tags'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>220
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'sys.htp.p(''<div class="sideBadge">''||apex_escape.html(:P50_TAGS)||''</div>'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P50_TAGS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3022738367128865072)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(3022737462731865071)
,p_button_name=>'POP_LINK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Add Link'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49:P49_INCIDENT_ID:&P50_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3022735756224865070)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(3022734253789865068)
,p_button_name=>'POPNOTE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Add Update'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.:RP,55:P55_INCIDENT_ID:&P50_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3022737062133865071)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(3022735960535865070)
,p_button_name=>'POPATTACHMENT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Add Attachment'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:RP,54:P54_INCIDENT_ID:&P50_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3022738168112865072)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(3022737462731865071)
,p_button_name=>'VIEW_LINKS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'View Links'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:44:&SESSION.:::44:P44_ID:&P50_ID.'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3022735560211865070)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(3022734253789865068)
,p_button_name=>'GONOTES'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'View Updates'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:52:&SESSION.:::52:P52_ID:&P50_ID.'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3022737260657865071)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(3022735960535865070)
,p_button_name=>'VIEW_ATTACHMENTS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'View Attachments'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:53:&SESSION.:::53:P53_ID:&P50_ID.'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3022733071411865060)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(3022744171268865082)
,p_button_name=>'EDIT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edit Ticket'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP,28:P28_ID:&P50_ID.'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3022745466773865087)
,p_branch_action=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.::P50_ID:&P50_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 11-JAN-2012 16:02 by MIKE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1224930660524130811)
,p_name=>'P50_ROW_KEY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(3022733865532865067)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select INCIDENT_NUMBER',
'from EBA_INTRACK_INCIDENTS',
'where id = :P50_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1244478351431443379)
,p_name=>'P50_TAGS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(3022733443138865062)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tags',
'from EBA_INTRACK_INCIDENTS',
'where id = :P50_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3022733666830865062)
,p_name=>'P50_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(3022733443138865062)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(3022744655413865084)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'50'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1513770056085027461)
,p_name=>'Enable Add Link Button'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_LINK_TARGET'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P50_LINK_TARGET'') != '''' && $v(''P50_LINK_TARGET'') != ''http://'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1513771256216036957)
,p_name=>'Enable Add Note Button'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_NOTE'
,p_condition_element=>'P50_NOTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1513772243187042701)
,p_name=>'Enable Add File Button'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_FILE'
,p_condition_element=>'P50_FILE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1731398856915888165)
,p_name=>'Refresh Notes'
,p_event_sequence=>70
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId === 55'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731399199648888165)
,p_event_id=>wwv_flow_imp.id(1731398856915888165)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3022734253789865068)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731399683301888166)
,p_event_id=>wwv_flow_imp.id(1731398856915888165)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.showPageSuccess(''Action Processed.'');',
'console.log(''tet'');'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1731374966756779150)
,p_name=>'Refresh Links'
,p_event_sequence=>80
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId ===49'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731375117144779151)
,p_event_id=>wwv_flow_imp.id(1731374966756779150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3022737462731865071)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731375207193779152)
,p_event_id=>wwv_flow_imp.id(1731374966756779150)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.showPageSuccess(''Action Processed.'');',
'console.log(''tet'');'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1731375290658779153)
,p_name=>'Refresh Attachments'
,p_event_sequence=>90
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId ===54'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731375429332779154)
,p_event_id=>wwv_flow_imp.id(1731375290658779153)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3022735960535865070)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731375493440779155)
,p_event_id=>wwv_flow_imp.id(1731375290658779153)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.showPageSuccess(''Action Processed.'');',
'console.log(''tet'');'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1731376020998779160)
,p_name=>'Refresh Validate'
,p_event_sequence=>100
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId ===64'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731376121083779161)
,p_event_id=>wwv_flow_imp.id(1731376020998779160)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1536988045441878653)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1731376189503779162)
,p_event_id=>wwv_flow_imp.id(1731376020998779160)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.showPageSuccess(''Action Processed.'');',
'console.log(''tet'');'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1536591342396438535)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Count Clicks'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into eba_intrack_clicks (view_id) values (:P50_ID);',
'delete from eba_intrack_clicks where view_timestamp < (sysdate - 90);',
'commit;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1536591342396438535
);
wwv_flow_imp.component_end;
end;
/
