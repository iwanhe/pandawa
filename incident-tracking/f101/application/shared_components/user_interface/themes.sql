prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(1609204123852052098)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'1.6'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_current_theme_style_id=>wwv_flow_imp.id(741007104687025803)
,p_default_page_template=>wwv_flow_imp.id(1609163135326051960)
,p_default_dialog_template=>wwv_flow_imp.id(1609153113324051937)
,p_error_template=>wwv_flow_imp.id(1609142962133051925)
,p_printer_friendly_template=>wwv_flow_imp.id(1609163135326051960)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(1609142962133051925)
,p_default_button_template=>wwv_flow_imp.id(1609202887990052072)
,p_default_region_template=>wwv_flow_imp.id(1609179910711051998)
,p_default_chart_template=>wwv_flow_imp.id(1609179910711051998)
,p_default_form_template=>wwv_flow_imp.id(1609179910711051998)
,p_default_reportr_template=>wwv_flow_imp.id(1609179910711051998)
,p_default_tabform_template=>wwv_flow_imp.id(1609179910711051998)
,p_default_wizard_template=>wwv_flow_imp.id(1609179910711051998)
,p_default_menur_template=>wwv_flow_imp.id(1609182514379052001)
,p_default_listr_template=>wwv_flow_imp.id(1609179910711051998)
,p_default_irr_template=>wwv_flow_imp.id(1609178411209051992)
,p_default_report_template=>wwv_flow_imp.id(1609189559365052032)
,p_default_label_template=>wwv_flow_imp.id(1609201974266052063)
,p_default_menu_template=>wwv_flow_imp.id(1609203084083052074)
,p_default_calendar_template=>wwv_flow_imp.id(1609203247128052076)
,p_default_list_template=>wwv_flow_imp.id(1609197146392052049)
,p_default_nav_list_template=>wwv_flow_imp.id(1609200189648052055)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(1609200189648052055)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(1609201022152052058)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(1609169348961051977)
,p_default_dialogr_template=>wwv_flow_imp.id(1609169123120051976)
,p_default_option_label=>wwv_flow_imp.id(1609201974266052063)
,p_default_header_template=>wwv_flow_imp.id(1609169123120051976)
,p_default_footer_template=>wwv_flow_imp.id(1609169123120051976)
,p_default_required_label=>wwv_flow_imp.id(1609202139053052065)
,p_default_navbar_list_template=>wwv_flow_imp.id(1609200763212052056)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.6/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
