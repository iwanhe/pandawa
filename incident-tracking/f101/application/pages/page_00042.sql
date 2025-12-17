prompt --application/pages/page_00042
begin
--   Manifest
--     PAGE: 00042
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
 p_id=>42
,p_name=>'Distribution of Tickets by Filer'
,p_step_title=>'Distribution of Tickets by Filer'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026850665033934)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page shows the number of incidents by the users that filed the incident (filers) in a bar graph. Click the bar to drill down to more details.'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1739586399162445381)
,p_plug_name=>'Filers'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select created_by d, ',
'       count(*) c, ',
'       created_by,',
'    ''f?p=''||:APP_ID||'':2:''||:APP_SESSION||''::''||:DEBUG||'':2,RIR:IR_CREATED_BY:''||CREATED_BY the_link',
'from eba_intrack_incidents_view',
'group by created_by',
'order by 2 desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'INITIALS',
  'attribute_02', 'D',
  'attribute_03', '&THE_LINK.',
  'attribute_04', 'C',
  'attribute_05', '&THE_LINK.',
  'attribute_11', 'VALUE',
  'attribute_14', '5',
  'attribute_15', 'TEXT',
  'attribute_16', 'ABSOLUTE',
  'attribute_17', 'DEFAULT',
  'attribute_18', 'AROUND',
  'attribute_20', 'No data found.')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2796514245292227396)
,p_plug_name=>'Distribution of Tickets by Filer'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
);
wwv_flow_imp.component_end;
end;
/
