prompt --application/deployment/install/upgrade_framework_package_spec
begin
--   Manifest
--     INSTALL: UPGRADE-Framework Package Spec
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(5871203814105690549)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Framework Package Spec'
,p_sequence=>210
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_proj_fw as ',
'',
'    -- New global added for permanently deleting projects on page 157 - Allan 4-DEC-2017',
'    g_project_deleted boolean := false;',
'',
'    function conv_txt_html ( ',
'        p_txt_message in varchar2 ) ',
'        return varchar2; ',
' ',
'    function conv_urls_links ( ',
'        p_string in varchar2 ) ',
'        return varchar2; ',
' ',
'    function format_status_report ( ',
'        p_string         in clob, ',
'        p_shorten_url    in varchar2, ',
'        p_app_id         in number, ',
'        p_session        in number, ',
'        p_project_id     in number, ',
'        p_show_all       in varchar2 default ''N'', ',
'        p_max_length     in number default 2500, ',
'        p_status_rpt_id  in number default null ',
'    ) return varchar2;',
'    ',
'    function save_formatted_status_update (',
'        p_status_update in clob',
'    ) return clob;',
' ',
'    function tags_cleaner ( ',
'        p_tags  in varchar2, ',
'        p_case  in varchar2 default ''U'' ) ',
'        return varchar2; ',
' ',
'    procedure tag_sync ( ',
'        p_new_tags          in varchar2, ',
'        p_old_tags          in varchar2, ',
'        p_content_type      in varchar2, ',
'        p_content_id        in number ); ',
' ',
'    function selective_escape ( ',
'        p_text  in varchar2, ',
'        p_tags  in varchar2 default ''<h2>,</h2>,<p>,</p>,<b>,</b>,<li>,</li>,<ul>,</ul>,<br />,<i>,</i>,<h3>,</h3>'' ) ',
'        return varchar2; ',
' ',
'    function get_preference_value ( ',
'        p_preference_name in varchar2 ) ',
'        return varchar2; ',
'',
'    procedure set_preference_value ( ',
'        p_preference_name  in varchar2,  ',
'        p_preference_value in varchar2 ); ',
'',
'    function compress_int ( ',
'        n in integer ) ',
'        return varchar2; ',
'',
'    function apex_error_handling ( ',
'        p_error in apex_error.t_error ) ',
'        return apex_error.t_error_result; ',
'',
'    function get_name_from_email_address( ',
'        p_email_address in varchar2 ',
'    ) return varchar2; ',
'',
'    function profile_url( p_username in varchar2 ) return varchar2;',
'',
'    function is_edit_authorized( p_username in varchar2, ',
'                                 p_project_id in number, ',
'                                 p_min_auth in number default 2 ) return varchar2; ',
' ',
'    function are_ms_ai_restricted ( p_application_id in number, ',
'                                    p_username in varchar2, ',
'                                    p_project_id in number ) return varchar2; ',
'                                     ',
'    function template_lock_yn ( p_application_id in number, ',
'                                p_username in varchar2, ',
'                                p_project_id in number default null, ',
'                                p_milestone_id in number default null, ',
'                                p_action_item_id in number default null ) return varchar2; ',
' ',
'    function get_project_rowkey ( p_project_id in number ) return varchar2; ',
'',
'    function get_statuses ( p_active_yn in varchar2 default ''Y'' ) return varchar2;',
'    ',
'    function check_url(p_url in varchar2) return boolean;',
'end eba_proj_fw; ',
'/',
'show errors'))
);
wwv_flow_imp.component_end;
end;
/
