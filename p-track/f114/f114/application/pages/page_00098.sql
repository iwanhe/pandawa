prompt --application/pages/page_00098
begin
--   Manifest
--     PAGE: 00098
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
 p_id=>98
,p_name=>'Project Creation Date Calendar'
,p_step_title=>'Project Creation Date Calendar'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'a.statusRed,',
'a.statusGreen,',
'a.statusYellow,',
'a.statusComplete,',
'a.statusUnknown {',
'border-left: 3px solid #CCC;',
'background-color: #EEE;',
'padding: 0 3px !important;',
'margin: 5px 0 0 0;',
'-webkit-border-top-right-radius: 3px;',
'-webkit-border-bottom-right-radius: 3px;',
'-moz-border-radius-topright: 3px;',
'-moz-border-radius-bottomright: 3px;',
'border-top-right-radius: 3px;',
'border-bottom-right-radius: 3px;',
'color: rgba(0,0,0,.8);',
'}',
'a.statusRed {border-color: #EA0000; background-color: #FDBFC1}',
'a.statusGreen {border-color: #0B0; background-color: #BBE1A9}',
'a.statusYellow {border-color: #DD0; background-color: #EEEBB4}',
'a.statusComplete {border-color: #111; background-color: #CCC}',
'a.statusAccomplishment {',
'background: url(data:image/gif;base64,R0lGODlhCgAIALMIAGDVUDGoIVzRTFXLRTivKE7EPj+1L0e9N////wAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAAAgALAAAAAAKAAgAAAQaEMkpAaUiXzS6LFMhSkeJlAdlrOtGvJsUbBEAOw==) transparent 3px 5px no-repeat;',
'padding-left: 18px !important;',
'background-color: #F8F8F8;',
'border: 1px solid #DDD !important;',
'-webkit-border-radius: 3px;',
'-moz-border-radius: 3px; ',
'margin: 5px 0 0 0;',
'}',
'span.ebaToolTip {',
'	display: none !important;',
'	}',
'div.ebaStatusListLegend ul li.ebaAccomplishment {',
'background: url(data:image/gif;base64,R0lGODlhCgAIALMIAGDVUDGoIVzRTFXLRTivKE7EPj+1L0e9N////wAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAAAgALAAAAAAKAAgAAAQaEMkpAaUiXzS6LFMhSkeJlAdlrOtGvJsUbBEAOw==) transparent 3px 5px no-repeat;',
'}',
'',
'table.formlayout label {display: block; line-height:18px; }',
'table.formlayout label a {font: bold 11px/18px Arial, sans-serif; color: #333;}',
'table.formlayout label + br {display: none;}',
'#main-sb-left > div {margin-left: 10px;}',
'</style>'))
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This is a monthly calendar of project creation activity. Click on a project to navigate to that project''s details page. Click the <strong><</strong> button to go to the previous month and the <strong>></strong> button to go forward a month. Switch be'
||'tween the calendar view to the list view by clicking the <strong>list</strong> button.'
,p_page_component_map=>'08'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5847591096896579442)
,p_plug_name=>'Action Items'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select   ',
'   p.id project_id, ',
'   p.PROJECT, ',
'   decode(p.cat_id,null,null,(select CATEGORY from EBA_PROJ_STATUS_CATS x where x.id = p.cat_id)) proj_cat,',
'   s.status_short_desc status_text,',
'   ''apex-cal-''|| lower(c.color_name) css_color,',
'   p.description,',
'    (   select listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '') within group',
'            (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'        from eba_proj_user_ref rf,',
'            eba_proj_status_users u,',
'            eba_proj_roles r',
'        where rf.project_id = p.id',
'            and rf.user_id = u.id',
'            and rf.role_id = r.id',
'            and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' ) as owners,',
'    p.CREATED',
'  from EBA_PROJ_STATUS p,',
'       EBA_PROJ_STATUS_CODES s,',
'       EBA_PROJ_COLOR_CODES c',
'  where s.id = PROJECT_STATUS(+)',
'  and   s.color_code_id = c.id'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'calendar_views_and_navigation', 'month:week:day:list:navigation',
  'css_class', 'CSS_COLOR',
  'display_column', 'PROJECT',
  'drag_and_drop', 'N',
  'event_sorting', 'AUTOMATIC',
  'first_hour', '9',
  'maximum_events_day', '10',
  'multiple_line_event', 'Y',
  'show_time', 'Y',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'CREATED',
  'supplemental_information', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Project: &PROJECT.',
    'Status: &STATUS_TEXT.',
    'Owner(s): &OWNERS.')),
  'time_format', '24',
  'view_edit_link', 'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:&PROJECT_ID.')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5847594705276579451)
,p_plug_name=>'Legend'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_imp.id(5847595103142579455)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5847597090666579460)
,p_branch_action=>'f?p=&FLOW_ID.:98:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(5847595484563579457)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'62'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(13084278739497234157)
,p_computation_sequence=>20
,p_computation_item=>'PROJECT_CAME_FROM'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5847595603873579457)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Monthly'
,p_process_sql_clob=>' apex_util.month_calendar(''P98_CALENDAR_TYPE'');'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error changing calendar date.'
,p_internal_uid=>5847595603873579457
,p_process_comment=>'Generated 10/31/2010'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5847595794328579457)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' apex_util.increment_calendar;'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error changing calendar date.'
,p_internal_uid=>5847595794328579457
,p_process_comment=>'Generated 10/31/2010'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5847596000712579457)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' apex_util.decrement_calendar;'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error changing calendar date.'
,p_internal_uid=>5847596000712579457
,p_process_comment=>'Generated 10/31/2010'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5847596196783579459)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' apex_util.today_calendar;'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error changing calendar date.'
,p_internal_uid=>5847596196783579459
,p_process_comment=>'Generated 10/31/2010'
);
wwv_flow_imp.component_end;
end;
/
