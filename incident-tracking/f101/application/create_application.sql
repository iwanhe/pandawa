prompt --application/create_application
begin
--   Manifest
--     FLOW: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'WKSP_XTD')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Incident Tracking')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A101')
,p_application_group=>wwv_flow_imp.id(42447951871253761478)
,p_application_group_name=>'20.2 Productivity Apps'
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'910DB3741F34971B1AE6457704D85E1C6E13676CAA6C91691D382C61DE9CA94A'
,p_checksum_salt_last_reset=>'20150102072406'
,p_bookmark_checksum_function=>'SH1'
,p_max_session_length_sec=>28800
,p_compatibility_mode=>'19.2'
,p_accessible_read_only=>'N'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'0'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>wwv_flow_string.join(wwv_flow_t_varchar2(
'1.0.22 -> 1.0.23: Changed Notifications region(s) from plsql to report.',
'    Changed navigation bar to native APEX list.',
'1.0.23 -> 1.0.24: Changed Authentication scheme to use new "APEX_PACKAGED_APPLICATIONS" cookie',
'1.0.24 -> 1.0.25: Added confirm modal when enabling ACL',
'1.0.26 -> 1.0.27: Added "Rename Application" page and supporting application items, computations, substitution strings, item and region  changes on login pages, and UI Logo text replacement.',
'1.0.27 -> 1.0.28: Added Notifications to Mobile home page (400)',
'1.0.28 -> 1.0.29: Added "Bulk Add Users" functionality',
'1.0.31 -> 1.0.32: Error handling procedure updated to resolve bug 17516350',
'1.0.32 -> 1.0.33: Implemented redesigned administrative ACL controls',
'1.0.33 -> 1.0.34: Added Usage Metrics region plugin to page 50 (Ticket details)'))
,p_authentication_id=>wwv_flow_imp.id(4401190212302118222)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'&APPLICATION_TITLE.'
,p_favicons=>'<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-incident-tracking.ico"><link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-incident-tracking-16x16.png"><link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#'
||'apex_ui/img/favicons/app-incident-tracking-32x32.png"><link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-incident-tracking.png">'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'2.2.2'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_referrer_policy=>'strict-origin-when-cross-origin'
,p_deep_linking=>'Y'
,p_runtime_api_usage=>'T'
,p_pass_ecid=>'N'
,p_security_scheme=>wwv_flow_imp.id(3204234644270058484)
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'eba_intrack_fw.apex_error_handling'
,p_tokenize_row_search=>'N'
,p_substitution_string_01=>'GETTING_STARTED_URL'
,p_substitution_value_01=>'http://www.oracle.com/technetwork/developer-tools/apex/index.html'
,p_substitution_string_02=>'APP_NAME'
,p_substitution_value_02=>'Incident Tracking'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_version_scn=>39567690258992
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
);
wwv_flow_imp.component_end;
end;
/
