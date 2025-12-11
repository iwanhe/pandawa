prompt --application/pages/page_10060
begin
--   Manifest
--     PAGE: 10060
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>30014105435788499543
,p_default_application_id=>216180
,p_default_id_offset=>0
,p_default_owner=>'WKSP_NTIAPPS'
);
wwv_flow_imp_page.create_page(
 p_id=>10060
,p_name=>'About'
,p_alias=>'HELP'
,p_step_title=>'About'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(30017068631496567833)
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(30017064626046567827)
,p_protection_level=>'C'
,p_help_text=>'All application help text can be accessed from this page. The links in the "Documentation" region give a much more in-depth explanation of the application''s features and functionality.'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30017259049205568642)
,p_plug_name=>'About Page'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--padded:t-ContentBlock--h1:t-ContentBlock--lightBG'
,p_plug_template=>wwv_flow_imp.id(30016840383418567678)
,p_plug_display_sequence=>20
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Aplikasi ini ditujukan untuk kebutuhan pencatatan Form Request / Permintaan user terhadap IT di Kudus ataupun di Jakarta</p>',
'<p><br></p>',
'<p>Aplikasi ini dibuat oleh Iwan Herdian (IT NTI).</p>',
'<p><br></p>',
'<p>Jika ada masukkan atau bug yang terjadi selama digunakan bisa kontak email berikut: <a data-fr-linked="true" href="mailto:iwan.herdian@nojorono.com">iwan.herdian@nojorono.com</a></p>',
'<p><br></p>',
'<p>Copyright @2023</p>',
'<p><a href="http://bit.ly/ntisupport" target="_blank" rel="noopener noreferrer">Portal Ticket</a></p>',
'<p><a href="https://sites.google.com/nojorono.com/ntimisportal/home" target="_blank" rel="noopener noreferrer">Intranet IT NTI</a></p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp.component_end;
end;
/
