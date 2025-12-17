prompt --application/pages/page_00029
begin
--   Manifest
--     PAGE: 00029
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
 p_id=>29
,p_name=>'New Incidents Time Line'
,p_step_title=>'New Incidents Time Line'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026850665033934)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'div.ebaTimeline{border-bottom:1px solid #DDD;clear:both;position:relative;}',
'div.ebaTimeline:last-child{border-bottom:none;}',
'div.ebaTimeline h3{font:bold 11px/12px Arial,sans-serif;margin:0;padding:9px 10px;width:80px;color:#333;position:absolute;top:0;left:0;}',
'div.ebaTimeline h3 + ul{margin:0;list-style:none;padding:0;margin:0 0 0 80px;}',
'div.ebaTimeline ul li{display:table;width:100%;position:relative;}',
'div.ebaTimeline ul.ebaNoHover li:hover span.eS,',
'div.ebaTimeline ul.ebaNoHover li:hover span.eL{background:transparent;}',
'div.ebaTimeline ul li:hover span.eS{background-color:#F8F8F8;}',
'div.ebaTimeline ul li:hover span.eL{background:#F8F8F8;}',
'div.ebaTimeline ul li:hover span.eL a.eN span{text-decoration:underline;}',
'div.ebaTimeline ul li span.eD,',
'div.ebaTimeline ul li span.eS,',
'div.ebaTimeline ul li span.eL{display:table-cell;vertical-align:top;}',
'div.ebaTimeline ul li span.eD{width:20px;padding:0 10px 0 0;font:normal 11px/30px Arial,sans-serif;border-right:1px solid #EEE;text-align:right;color:#666;}',
'div.ebaTimeline ul li span.eS{padding:5px;width:20px;border-bottom:1px dotted #EEE;;}',
'div.ebaTimeline ul li:last-child span.eS,',
'div.ebaTimeline ul li:last-child span.eL{border-bottom:none;}',
'div.ebaTimeline ul li span.eS span{display:block;width:12px;height:12px;border-radius:10px;-moz-border-radius:10px;-webkit-box-shadow:0 1px 1px rgba(255,255,255,.75),0 0 2px rgba(0,0,0,.5) inset;-moz-box-shadow:0 1px 1px rgba(255,255,255,.75),0 0 2px'
||' rgba(0,0,0,.5) inset;box-shadow:0 1px 1px rgba(255,255,255,.75),0 0 2px rgba(0,0,0,.5) inset;background:-webkit-gradient(linear,0 0,0 100%,from(transparent),to(rgba(0,0,0,.25)));background:-moz-linear-gradient(top,transparent,rgba(0,0,0,.25));margin'
||':4px;}',
'div.ebaTimeline ul li span.eS span.ebaRed{background-color:#F00;}',
'div.ebaTimeline ul li span.eS span.ebaYellow{background-color:#FCE709;}',
'div.ebaTimeline ul li span.eS span.ebaGreen{background-color:#22C615;}',
'div.ebaTimeline ul li span.eS span.ebaBlack{background-color:#444;}',
'div.ebaTimeline ul li span.eS span.ebaNull{background-color:#CCC;}',
'div.ebaTimeline ul li span.eL{border-bottom:1px dotted #EEE;}',
'div.ebaTimeline ul li a.eN{display:block;padding:7px 0;text-decoration:none;}',
'div.ebaTimeline ul li a.eN span{display:block;font:bold 12px/16px Arial,sans-serif;color:#333;}',
'div.ebaTimeline ul li a.eN em,',
'div.ebaTimeline ul li span.eL em{display:block;font:normal 11px/16px Arial,sans-serif;color:#666;}',
'div.ebaTimeline ul li a.ebaEditLink{position:absolute;right:0;top:0;display:block;margin:7px 7px 0 0;font:normal 11px/12px Arial,sans-serif;text-decoration:none;color:#666;padding:2px 10px;border-radius:4px;-moz-border-radius:4px;border:1px solid #EE'
||'E;-webkit-transition:background .2s linear,border .2s linear,color .2s linear;}',
'div.ebaTimeline ul li a.ebaEditLink:hover{border:1px solid #BBB;background:#FFF;color:#333;}',
'</style>'))
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This timeline report can be sorted by whether the incident is open and/or closed by changing the value of the "Open" drop-down select list. Click the <strong>Reset</strong> button to reset the report.'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2443502067886728478)
,p_plug_name=>'Timeline'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   id,',
'   apex_util.prepare_url(''f?p=''||:APP_ID||'':28:''||:APP_SESSION||'':::28:P28_ID:''||apex_escape.html(id)) the_link,',
'   INCIDENT_NUMBER     incident,',
'   SUBJECT     primary_label,',
'   status_code||''. ''||STATUS_NAME status,',
'   CREATED_BY,',
'   created',
'from eba_intrack_incidents_view',
'where (nvl(:P29_OPEN,''0'') = ''0'' or ',
'   (nvl(:P29_OPEN,''0'')  = ''Y'' and status_type = ''OPEN'') or',
'   (nvl(:P29_OPEN,''0'')  = ''N'' and status_type = ''CLOSED'')',
'    )',
'order by CREATED desc',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'CREATED',
  'attribute_03', 'PRIMARY_LABEL',
  'attribute_04', 'THE_LINK',
  'attribute_05', 'INCIDENT',
  'attribute_06', 'CREATED_BY',
  'attribute_12', 'D',
  'attribute_13', 'STATUS')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(2443502159560728479)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'ID'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(2443502288501728480)
,p_name=>'THE_LINK'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'THE_LINK'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'The link'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(2443502478538728482)
,p_name=>'PRIMARY_LABEL'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'PRIMARY_LABEL'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Primary label'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(2443503117655728488)
,p_name=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'CREATED'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Created'
,p_display_sequence=>70
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(2559340107652695242)
,p_name=>'INCIDENT'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'INCIDENT'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Incident'
,p_display_sequence=>80
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(2559340172208695243)
,p_name=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'STATUS'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>90
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(2559340276961695244)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'CREATED_BY'
,p_session_state_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Created By'
,p_display_sequence=>100
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2777448545787339606)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2780602773074683227)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(1609169348961051977)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3259563447156983683)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2780602773074683227)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:RP,29::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2780633752773686760)
,p_name=>'P29_OPEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2780602773074683227)
,p_item_default=>'Y'
,p_prompt=>'Open'
,p_source=>'Y'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov_language=>'PLSQL'
,p_lov=>'.'||wwv_flow_imp.id(2754272554244105957)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'REDIRECT_SET_VALUE')).to_clob
);
wwv_flow_imp.component_end;
end;
/
