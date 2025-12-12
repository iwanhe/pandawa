prompt --application/pages/page_00133
begin
--   Manifest
--     PAGE: 00133
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
 p_id=>133
,p_name=>'People'
,p_step_title=>'People'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'span.report-profile-photo {',
'    display: inline-block;',
'    width: 32px;',
'    height: 32px;',
'    background-size: cover;',
'    border-radius: 100%;',
'    vertical-align: middle;',
'    margin-right: 8px;',
'    box-shadow: 0 0 0 1px rgba(0,0,0,.1) inset;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This is an interactive report of all people using the application. Click any link in the primary report to see more information. Click the "Dashboard" tab to see graphs and charts reflecting other user statistics. Click the <strong>Reset</strong> but'
||unistr('ton to reset the interactive report. Click the <strong>Actions \00BF</strong> button to define the number of rows displayed per page, filter, format, download, and/or save the interactive report.')
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5253673088505830366)
,p_plug_name=>'Owners Tabs'
,p_component_template_options=>'#DEFAULT#:t-Tabs--simple'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_list_id=>wwv_flow_imp.id(5253671747534830364)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(7039984001139713129)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6729338404754370755)
,p_plug_name=>'Users'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with prj as (',
'    select rf.user_id,',
'        rf.project_id,',
'        -- If the project is open, treat everyone as "full" access',
'        case when p.acl_status_level = 1 then 3',
'            else nvl(rf.acl_status_level,r.default_acl_status_level)',
'        end as acl_level,',
'        nvl(inv.percentage,0) involvement_level',
'    from eba_proj_user_ref rf,',
'        eba_proj_roles r,',
'        eba_proj_status p,',
'        eba_proj_involvement_levels inv,',
'        eba_proj_status_codes sc',
'    where rf.role_id = r.id',
'        and rf.project_id = p.id',
'        and rf.involvement_level_id = inv.id(+)',
'        and sc.id = p.project_status',
'        and sc.is_closed_status = ''N''',
')',
'select ',
'    u.username,',
'    eba_proj_fw.get_name_from_email_address(u.username) as irr_username,',
'    decode(u.first_name,null,lower(u.username),decode(u.last_name, null, lower(u.username), initcap(u.first_name || '' '' || u.last_name)))  project_owner,',
'    (   select count(distinct(prj.project_id))',
'        from prj',
'        where prj.user_id = u.id',
'            and prj.acl_level >= 2 ) projects,',
'    (   select count(*)',
'        from eba_proj_status_ais x',
'        where x.action_status = ''Open''',
'            and (( x.owner_role_id is null',
'                    and ( lower(x.action_owner_01) = lower(u.username)',
'                        or lower(x.action_owner_02) = lower(u.username)',
'                        or lower(x.action_owner_03) = lower(u.username)',
'                        or lower(x.action_owner_04) = lower(u.username) )',
'                )',
'                or ( x.owner_role_id is not null',
'                    and exists (select null',
'                                from eba_proj_user_ref rf',
'                                where rf.user_id = u.id',
'                                    and rf.project_id = x.project_id',
'                                    and rf.role_id = x.owner_role_id) ))',
'            ) acition_items,',
'    (   select count(*)',
'        from eba_proj_status_ms m',
'        where m.milestone_status = ''Open''',
'            and (( m.owner_role_id is null and lower(m.milestone_owner) = lower(u.username) )',
'                or ( m.owner_role_id is not null',
'                    and exists (select null',
'                                from eba_proj_user_ref rf',
'                                where rf.user_id = u.id',
'                                    and rf.project_id = m.project_id',
'                                    and rf.role_id = m.owner_role_id)))',
'            ) milestones,',
'    (   select count(*) c',
'        from eba_proj_status_rpts sr',
'        where lower(sr.update_owner) = lower(u.username)',
'            and (( sr.viewable_by = ''Submitter and Project Members''',
'                and exists ( select null',
'                             from eba_proj_user_ref rf,',
'                                 eba_proj_status_users usr',
'                             where rf.project_id = sr.project_id',
'                                 and rf.user_id = usr.id',
'                                 and lower(usr.username) = lower(:APP_USER)',
'                                 and eba_proj_fw.is_edit_authorized( usr.username, rf.project_id ) = ''Y'' ))',
'                or sr.viewable_by = ''All'' )) status_reports,',
'    (   select count(*)',
'        from eba_proj_status_issues i',
'        where i.is_open = ''Y''',
'            and (( i.owner_role_id is null and lower(i.issue_owner) = lower(u.username) )',
'                or ( i.owner_role_id is not null',
'                    and exists (select null',
'                                from eba_proj_user_ref rf',
'                                where rf.user_id = u.id',
'                                    and rf.project_id = i.project_id',
'                                    and rf.role_id = i.owner_role_id)))',
'            ) issues,',
'    (   select count(*) c',
'        from eba_proj_status_clicks',
'        where view_timestamp > sysdate - 1',
'            and upper(u.username) = app_username) project_views_1,',
'    (   select count(*) c',
'        from eba_proj_status_clicks',
'        where view_timestamp > sysdate - 7',
'            and upper(u.username) = app_username) project_views_7,',
'    (   select count(*) c',
'        from eba_proj_status_clicks',
'        where view_timestamp > sysdate - 30',
'            and upper(u.username) = app_username) project_views_30,',
'    nvl((select sum(prj.involvement_level) ',
'        from prj',
'        where prj.user_id = u.id),0) involvement_level,',
'    decode(dbms_lob.getlength(photo_blob),null,''No'',0,''No'',''Yes'') photo,',
'    u.id',
'from eba_proj_status_users u'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6729338535452370755)
,p_name=>'Project Owners'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'MIKE'
,p_internal_uid=>1533111853192753997
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6729339467066373113)
,p_db_column_name=>'PROJECT_OWNER'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Project Owner'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6729453473578417029)
,p_db_column_name=>'PROJECTS'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Open Projects'
,p_column_link=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP:P64_OWNER,P64_STATUS,P64_DISPLAY:#ID#,\&P133_OPEN_STATUS_IDS.\,REPORT'
,p_column_linktext=>'#PROJECTS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6729520008777495791)
,p_db_column_name=>'ACITION_ITEMS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Open Action Items'
,p_column_link=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:IRC_OWNER,IR_ACTION_STATUS:#IRR_USERNAME#,Open'
,p_column_linktext=>'#ACITION_ITEMS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'    p_application_id => :APP_ID,',
'    p_build_option_name => ''Project Action Items''',
') = ''INCLUDE'''))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6729520586107511336)
,p_db_column_name=>'MILESTONES'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Open Milestones'
,p_column_link=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:RP,63,CIR:IRC_MILESTONE_OWNER,IR_MILESTONE_STATUS:#IRR_USERNAME#,Open'
,p_column_linktext=>'#MILESTONES#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'    p_application_id => :APP_ID,',
'    p_build_option_name => ''Project Milestones''',
') = ''INCLUDE'''))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6729522997276566004)
,p_db_column_name=>'PROJECT_VIEWS_7'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Project Views (7 days)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6729523212834569000)
,p_db_column_name=>'PROJECT_VIEWS_30'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Project Views ( 30 days)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6729533624469881404)
,p_db_column_name=>'PROJECT_VIEWS_1'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Project Views (1 day)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11984497932550778558)
,p_db_column_name=>'INVOLVEMENT_LEVEL'
,p_display_order=>17
,p_column_identifier=>'J'
,p_column_label=>'Involvement (%)'
,p_column_link=>'f?p=&APP_ID.:95:&SESSION.::&DEBUG.:RP,95,RIR:IR_USERNAME,IR_IS_OPEN:#IRR_USERNAME#,Yes'
,p_column_linktext=>'#INVOLVEMENT_LEVEL#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'    p_application_id => :APP_ID,',
'    p_build_option_name => ''Project User Involvement''',
') = ''INCLUDE'''))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15183896633025578022)
,p_db_column_name=>'PHOTO'
,p_display_order=>18
,p_column_identifier=>'K'
,p_column_label=>'Photo'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15213084465190322322)
,p_db_column_name=>'ID'
,p_display_order=>28
,p_column_identifier=>'L'
,p_column_label=>'id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15213084526089322323)
,p_db_column_name=>'USERNAME'
,p_display_order=>38
,p_column_identifier=>'M'
,p_column_label=>'Username'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15010741383500268031)
,p_db_column_name=>'STATUS_REPORTS'
,p_display_order=>48
,p_column_identifier=>'N'
,p_column_label=>'Status Reports'
,p_column_link=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.:RP,117,RIR:P117_OWNER:#IRR_USERNAME#'
,p_column_linktext=>'#STATUS_REPORTS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'    p_application_id => :APP_ID,',
'    p_build_option_name => ''Project Status Reports''',
') = ''INCLUDE'''))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15711646988978245133)
,p_db_column_name=>'ISSUES'
,p_display_order=>58
,p_column_identifier=>'O'
,p_column_label=>'Open Issues'
,p_column_link=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP,22,RIR:IRC_ISSUE_OWNER,IR_IS_OPEN:#IRR_USERNAME#,Yes'
,p_column_linktext=>'#ISSUES#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'    p_application_id => :APP_ID,',
'    p_build_option_name => ''Project Issues''',
') = ''INCLUDE'''))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20043308963342787345)
,p_db_column_name=>'IRR_USERNAME'
,p_display_order=>68
,p_column_identifier=>'P'
,p_column_label=>'User'
,p_column_link=>'f?p=&APP_ID.:137:&SESSION.::&DEBUG.:RP,137:P137_ID:#ID#'
,p_column_linktext=>'#IRR_USERNAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6729338898228371020)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'15331123'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'IRR_USERNAME:PROJECTS:INVOLVEMENT_LEVEL:ACITION_ITEMS:MILESTONES:STATUS_REPORTS:ISSUES:'
,p_sort_column_1=>'PROJECTS'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'PROJECT_VIEWS_30'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'PROJECT_VIEWS_7'
,p_sort_direction_3=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6729523791507595531)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6729523534906591839)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6729338404754370755)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15302913902024743059)
,p_name=>'P133_OPEN_STATUS_IDS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6729338404754370755)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(15302913950260743060)
,p_computation_sequence=>10
,p_computation_item=>'P133_OPEN_STATUS_IDS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select listagg( id, '':'' ) within group (order by id) from eba_proj_status_codes where is_closed_status = ''N'''
,p_compute_when=>'P133_OPEN_STATUS_IDS'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp.component_end;
end;
/
