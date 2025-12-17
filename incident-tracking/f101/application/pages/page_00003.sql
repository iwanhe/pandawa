prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
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
 p_id=>3
,p_name=>'Reports'
,p_alias=>'REPORTS'
,p_step_title=>'Reports'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026850665033934)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page displays links to all of the app''s available reports.'
,p_page_component_map=>'06'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2777352443072417716)
,p_plug_name=>'Primary Reports'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors'
,p_region_attributes=>'data-grid="col_2" data-grid-start="yes"'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_imp.id(2777351942079417697)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2873548955253679940)
,p_plug_name=>'Additional Reports'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors'
,p_region_attributes=>'data-grid="col_2"'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_imp.id(2873527047980677846)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3340631169236685806)
,p_plug_name=>'Activity Reports'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors'
,p_region_attributes=>'data-grid="col_2" data-grid-start="yes"'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_imp.id(3340630669665685804)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_plug_required_role=>wwv_flow_imp.id(3204234956647058484)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4401604111427854834)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--showBreadcrumb:t-BreadcrumbRegion--useBreadcrumbTitle'
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
