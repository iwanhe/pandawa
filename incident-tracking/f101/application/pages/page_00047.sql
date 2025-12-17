prompt --application/pages/page_00047
begin
--   Manifest
--     PAGE: 00047
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
 p_id=>47
,p_name=>'Contact Details'
,p_step_title=>'Contact Details'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026543046031745)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page displays all of a customer contact''s details.'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2801162344091304999)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2801185662526306806)
,p_plug_name=>'button bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(1609169348961051977)
,p_plug_display_sequence=>10
,p_plug_new_grid_column=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2801208853999313853)
,p_name=>'P47_CONTACT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2801185662526306806)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2801299861403325387)
,p_name=>'P47_CONTACT_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2801185662526306806)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Contact Name:'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_name||'', ''||first_name n',
'from eba_intrack_customer_contact',
'where id = :P47_CONTACT_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
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
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
