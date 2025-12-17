prompt --application/pages/page_00038
begin
--   Manifest
--     PAGE: 00038
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
 p_id=>38
,p_name=>'Distribution of Ticket Status Codes'
,p_step_title=>'Distribution of Ticket Status Codes'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026850665033934)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page shows the number of incidents by status in a bar graph. Click the bar to drill down to more details. Change the "Open" filter to filter the results displayed on this page. Click the <strong>Reset</strong> button to reset the page.'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1739586133317445378)
,p_plug_name=>'Status Codes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select status_code||''. ''||status_name d, ',
'       count(*) c, ',
'       status_code,',
'   ''f?p=''||:APP_ID||'':2:''||:APP_SESSION||''::''||:DEBUG||'':2,RIR:IR_STATUS_CODE:''||status_code the_link',
'from eba_intrack_incidents_view',
'where ((nvl(:P38_OPEN,''0'')=''Y'' and status_type = ''OPEN'') or',
'    (nvl(:P38_OPEN,''0'')=''N'' and status_type = ''CLOSED'') or',
'    (nvl(:P38_OPEN,''0'')=''0''))',
'group by status_code, status_name',
'order by 2 desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'INITIALS',
  'attribute_02', 'D',
  'attribute_03', '&THE_LINK.',
  'attribute_04', 'C',
  'attribute_05', '&THE_LINK.',
  'attribute_11', 'VALUE',
  'attribute_14', '50',
  'attribute_15', 'TEXT',
  'attribute_16', 'ABSOLUTE',
  'attribute_17', 'DEFAULT',
  'attribute_18', 'AROUND',
  'attribute_20', 'No data found.')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2796002368638082292)
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
 p_id=>wwv_flow_imp.id(2808090370040225724)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609169348961051977)
,p_plug_display_sequence=>10
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY_3'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2808259948269247793)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2808090370040225724)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202304669052069)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:38,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2808090572153225727)
,p_name=>'P38_OPEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2808090370040225724)
,p_item_default=>'0'
,p_prompt=>'Open'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov_language=>'PLSQL'
,p_lov=>'.'||wwv_flow_imp.id(2754272554244105957)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
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
