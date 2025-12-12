prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 114
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(114)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:home:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(5253713782518129683)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_imp.id(6672375935668369934)
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#pkgapp_ui/css/5.0#MIN#.css',
'#IMAGE_PREFIX#eba/css/eba_details_page.css',
'#IMAGE_PREFIX#eba/css/eba_file_types.css',
'#APP_IMAGES#Timeline.css'))
,p_include_legacy_javascript=>'PRE18:18'
,p_include_jquery_migrate=>true
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(6697897374937741941)
,p_nav_bar_list_template_id=>wwv_flow_imp.id(6672375693360369931)
);
wwv_flow_imp.component_end;
end;
/
