prompt --application/create_application
begin
--   Manifest
--     FLOW: 216180
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>30014105435788499543
,p_default_application_id=>216180
,p_default_id_offset=>0
,p_default_owner=>'WKSP_NTIAPPS'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'WKSP_NTIAPPS')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'FORM REQUEST IT SYSTEM (FRITS)')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'FORM-REQUEST-IT')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'21079D6DA8782BB2E9D54354A1631E522D4625663C1B7F9AC04CE717C4BF65D1'
,p_bookmark_checksum_function=>'SH512'
,p_on_max_session_timeout_url=>'https://sites.google.com/nojorono.com/ntimisportal/home'
,p_max_session_idle_sec=>1800
,p_on_max_idle_timeout_url=>'https://sites.google.com/nojorono.com/ntimisportal/home'
,p_compatibility_mode=>'21.2'
,p_accessible_read_only=>'N'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(30015774274970567639)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'FORM REQUEST IT'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.1 - Created by Iwan Herdian - Live June 2023'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_runtime_api_usage=>'T'
,p_security_scheme=>wwv_flow_imp.id(30017066994319567829)
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'FORM REQUEST IT'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>28
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'Y'
,p_pwa_manifest_description=>'Form Request IT System (FRITS) - Developed by Iwan Herdian NTI MIS'
,p_pwa_manifest_display=>'standalone'
,p_pwa_manifest_orientation=>'any'
,p_pwa_apple_status_bar_style=>'default'
,p_pwa_is_push_enabled=>'Y'
,p_pwa_push_credential_id=>wwv_flow_imp.id(30017295092714569002)
,p_pwa_vapid_contact_info=>'iwan.herdian.erp@gmail.com'
,p_copyright_banner=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Name: #APP_NAME#',
'Copyright (c) #YEAR#'))
);
wwv_flow_imp.component_end;
end;
/
