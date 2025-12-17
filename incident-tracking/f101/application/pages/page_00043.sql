prompt --application/pages/page_00043
begin
--   Manifest
--     PAGE: 00043
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
 p_id=>43
,p_name=>'Distribution of Tickets by Product and Version'
,p_step_title=>'Distribution of Tickets by Product and Version'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026850665033934)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page shows the number of incidents by product and version in a bar graph. Click the bar to drill down to more details. Change the "Open" and "Product" select lists to filter the results displayed on this page. Click the <strong>Reset</strong> bu'
||'tton to reset the page.'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1739586506673445382)
,p_plug_name=>'Products & Versions'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>20
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.product_name || '' - '' || VERSION_NAME d, ',
'       (select count(*) ',
'       from eba_intrack_incidents i, eba_intrack_status s',
'       where (i.product_version_id = v.id and ',
'             i.product_id = p.id and i.status_id = s.id) and',
'             ((nvl(:P43_OPEN,''0'')=''Y'' and s.status_type = ''OPEN'') or',
'    (nvl(:P43_OPEN,''0'')=''N'' and s.status_type = ''CLOSED'') or',
'    (nvl(:P43_OPEN,''0'')=''0''))',
'             )',
'       tickets,',
'       product_name,',
'    ''f?p=''||:APP_ID||'':2:''||:APP_SESSION||''::''||:DEBUG||'':2,RIR:IR_PRODUCT_NAME:''||PRODUCT_NAME the_link',
'from eba_intrack_version v, ',
'     eba_intrack_product p',
'where v.product_id = p.id and',
'(nvl(:P43_PRODUCT,0) = 0 or p.id = nvl(:P43_PRODUCT,0))',
'order by 2 desc, 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'INITIALS',
  'attribute_02', 'D',
  'attribute_03', '&THE_LINK.',
  'attribute_04', 'TICKETS',
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
 p_id=>wwv_flow_imp.id(2796719456829276266)
,p_plug_name=>'Distribution of Tickets by Product and Version'
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
 p_id=>wwv_flow_imp.id(2797487173899505849)
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
 p_id=>wwv_flow_imp.id(2808655555981306838)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2797487173899505849)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202304669052069)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:43,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2797567845418516559)
,p_name=>'P43_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2797487173899505849)
,p_item_default=>'0'
,p_prompt=>'Product'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select product_name, id',
'from eba_intrack_product',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Products -'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2808421342644265107)
,p_name=>'P43_OPEN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2797487173899505849)
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
,p_cHeight=>1
,p_begin_on_new_line=>'N'
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
