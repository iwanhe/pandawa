prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'FORM REQUEST IT'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Kontak IT Jikalau menemui kesulitan</p>',
'<p>Dapat dilakukan dengan submit ticket di link berikut <a href="http://bit.ly/ntisupport" target="_blank" rel="noopener noreferrer">bit.ly/ntisupport</a></p>'))
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28715630540169003206)
,p_plug_name=>'Page Navigation'
,p_icon_css_classes=>'fa-forms'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--featured t-Cards--block force-fa-lg:t-Cards--displayIcons:t-Cards--4cols:t-Cards--hideBody:t-Cards--animColorFill'
,p_plug_template=>wwv_flow_imp.id(30016811567756567664)
,p_plug_display_sequence=>10
,p_location=>null
,p_list_id=>wwv_flow_imp.id(30936172962807411914)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(30016927888021567720)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30017076897580567851)
,p_plug_name=>'FORM REQUEST IT'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(30016844998144567680)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(46470524381009849914)
,p_plug_name=>'Chat'
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script>',
'  function initFreshChat() {',
'    window.fcWidget.init({',
'      	 token: "d48b3e62-3630-4691-ad69-ab214251859f",',
'	 host: "https://nti-support.freshchat.com"',
'    });',
'  }',
'  function initialize(i,t){var e;i.getElementById(t)?',
'  initFreshChat():((e=i.createElement("script")).id=t,e.async=!0,',
'  e.src="https://nti-support.freshchat.com/js/widget.js",e.onload=initFreshChat,i.head.appendChild(e))}',
'  function initiateCall(){initialize(document,"Freshchat-js-sdk")}',
'  window.addEventListener?window.addEventListener("load",initiateCall,!1):',
'  window.attachEvent("load",initiateCall,!1);',
'</script>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp.component_end;
end;
/
