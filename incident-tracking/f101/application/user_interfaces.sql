prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(101)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(1609261271728075635)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_imp.id(1609201022152052058)
,p_nav_list_template_options=>'#DEFAULT#:js-navCollapsed--hidden:t-TreeNav--styleA'
,p_css_file_urls=>'#IMAGE_PREFIX#pkgapp_ui/css/5.0#MIN#.css'
,p_include_legacy_javascript=>'PRE18:18'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(1223380859974761289)
,p_nav_bar_list_template_id=>wwv_flow_imp.id(1609200763212052056)
);
wwv_flow_imp.component_end;
end;
/
