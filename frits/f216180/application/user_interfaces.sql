prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 216180
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>30014105435788499543
,p_default_application_id=>216180
,p_default_id_offset=>0
,p_default_owner=>'WKSP_NTIAPPS'
);
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(216180)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>true
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(30015775073844567640)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_imp.id(30016939848434567726)
,p_nav_list_template_options=>'#DEFAULT#:js-addActions:js-defaultCollapsed:js-navCollapsed--default:t-TreeNav--classic'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(30017061483194567816)
,p_nav_bar_list_template_id=>wwv_flow_imp.id(30016939494091567725)
,p_nav_bar_template_options=>'#DEFAULT#:js-menu-callout'
);
wwv_flow_imp.component_end;
end;
/
