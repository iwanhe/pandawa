prompt --application/pages/page_00079
begin
--   Manifest
--     PAGE: 00079
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
 p_id=>79
,p_name=>'Attachments Dashboard'
,p_page_mode=>'MODAL'
,p_step_title=>'Attachments Dashboard'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486499525077695)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_help_text=>'This page gives an administrator a high-level view of just how much disk space your project attachments are using. If the attachment file size amount is getting too high, click the <strong>Manage Attachments</strong> button to remove older attachment'
||'s and regain free disk space.'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(416113371722061588)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672347163384369864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6799549617739247464)
,p_plug_name=>'Metrics'
,p_region_template_options=>'t-Region--noPadding:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    ''Attachments'' as label,',
'    to_char(count(*),''999G999G999G999G990'') as value,',
'    100      as percent',
'from eba_proj_status_files f',
'union all',
'select',
'    ''Total Size'' as label,',
'    to_char(',
'    decode(',
'         nvl(sum(dbms_lob.getlength(file_blob)),0),',
'         0,',
'         0,',
'         sum(dbms_lob.getlength(file_blob))/(1024*1024)',
'    ),',
'    ''999G999G999G999G990D99'') ||'' MB'' as value,',
'    100      as percent',
'from eba_proj_status_files f',
'union all',
'select',
'    ''Average Size'' as label,',
'    to_char(',
'    decode(',
'         nvl(avg(dbms_lob.getlength(file_blob)),0),',
'         0,',
'         0,',
'         avg(dbms_lob.getlength(file_blob))/(1024*1024)',
'    ),',
'    ''999G999G999G999G990D99'') || '' MB'' as value,',
'    100      as percent',
'from eba_proj_status_files f',
'union all',
'select',
'    ''Projects with Attachments'' as label,',
'    to_char(',
'    count(distinct project_id) ,',
'    ''999G999G999G999G990'')  as value,',
'    100      as percent',
'from eba_proj_status_files f',
'union all',
'select',
'    ''Size < 1 Week'' as label,',
'    to_char(',
'    decode(',
'         nvl(sum(dbms_lob.getlength(file_blob)),0),',
'         0,',
'         0,',
'         sum(dbms_lob.getlength(file_blob))/(1024*1024)',
'    ),',
'    ''999G999G999G999G990D99'') ||'' MB'' as value,',
'    100      as percent',
'from eba_proj_status_files f',
'where to_date(to_char(created,''YYYYMMDD''),''YYYYMMDD'') > sysdate - 7',
'union all',
'select',
'    ''Size < 4 Weeks'' as label,',
'    to_char(',
'    decode(',
'         nvl(sum(dbms_lob.getlength(file_blob)),0),',
'         0,',
'         0,',
'         sum(dbms_lob.getlength(file_blob))/(1024*1024)',
'    ),',
'    ''999G999G999G999G990D99'') ||'' MB'' as value,',
'    100      as percent',
'from eba_proj_status_files f',
'where to_date(to_char(created,''YYYYMMDD''),''YYYYMMDD'') > sysdate - 28',
'union all',
'select',
'    ''Size < 1 Year'' as label,',
'    to_char(',
'    decode(',
'         nvl(sum(dbms_lob.getlength(file_blob)),0),',
'         0,',
'         0,',
'         sum(dbms_lob.getlength(file_blob))/(1024*1024)',
'    ),',
'    ''999G999G999G999G990D99'') ||'' MB'' as value,',
'    100      as percent',
'from eba_proj_status_files f',
'where to_date(to_char(created,''YYYYMMDD''),''YYYYMMDD'') > sysdate - 365',
'union all',
'select',
'    ''Size >= 1 Year'' as label,',
'    to_char(',
'    decode(',
'         nvl(sum(dbms_lob.getlength(file_blob)),0),',
'         0,',
'         0,',
'         sum(dbms_lob.getlength(file_blob))/(1024*1024)',
'    ),',
'    ''999G999G999G999G990D99'') ||'' MB'' as value,',
'    100      as percent',
'from eba_proj_status_files f',
'where to_date(to_char(created,''YYYYMMDD''),''YYYYMMDD'') <= sysdate - 365'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LABEL',
  'attribute_02', 'VALUE',
  'attribute_03', 'PERCENT',
  'attribute_04', 'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:RP::',
  'attribute_05', '4',
  'attribute_07', 'BOX',
  'attribute_08', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6799549992343247478)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--showBreadcrumb:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6799550328088247480)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(416113371722061588)
,p_button_name=>'MANAGE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Manage Attachments'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23::'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(7468762215071916441)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(416113481835061589)
,p_name=>'Refresh on Delete'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6799550328088247480)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(416113528503061590)
,p_event_id=>wwv_flow_imp.id(416113481835061589)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6799549617739247464)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
