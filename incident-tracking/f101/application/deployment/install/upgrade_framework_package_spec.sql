prompt --application/deployment/install/upgrade_framework_package_spec
begin
--   Manifest
--     INSTALL: UPGRADE-Framework Package spec
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(1457215053527952639)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Framework Package spec'
,p_sequence=>5
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace',
'package eba_intrack_fw as',
'',
'    function conv_txt_html (',
'        p_txt_message in varchar2 )',
'        return varchar2;',
'',
'    function conv_urls_links (',
'        p_string in varchar2 )',
'        return varchar2;',
'',
'    function tags_cleaner (',
'        p_tags  in varchar2,',
'        p_case  in varchar2 default ''U'' )',
'        return varchar2;',
'',
'    procedure tag_sync (',
'        p_new_tags          in varchar2,',
'        p_old_tags          in varchar2,',
'        p_content_type      in varchar2,',
'        p_content_id        in number );',
'',
'    function selective_escape (',
'        p_text  in varchar2,',
'        p_tags  in varchar2 default ''<h2>,</h2>,<p>,</p>,<b>,</b>,<li>,</li>,<ul>,</ul>,<br />,<i>,</i>,<h3>,</h3>'' )',
'        return varchar2;',
'',
'    function get_preference_value (',
'        p_preference_name in varchar2 )',
'        return varchar2;',
'',
'    procedure set_preference_value (',
'        p_preference_name  in varchar2, ',
'        p_preference_value in varchar2 );',
'',
'    function compress_int (',
'        n in integer )',
'        return varchar2;',
'',
'    function apex_error_handling (',
'        p_error in apex_error.t_error )',
'        return apex_error.t_error_result;',
'',
'end eba_intrack_fw;',
'/',
'show errors',
''))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(1688767141753115665)
,p_script_id=>wwv_flow_imp.id(1457215053527952639)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_INTRACK_FW'
);
wwv_flow_imp.component_end;
end;
/
