prompt --application/deployment/install/install_proj_stat_ui_spec
begin
--   Manifest
--     INSTALL: INSTALL-proj_stat_ui spec
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
 p_id=>wwv_flow_imp.id(14141548451478067156)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'proj_stat_ui spec'
,p_sequence=>180
,p_script_type=>'INSTALL'
,p_script_option=>'PACKAGE_SPEC'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE PACKAGE "EBA_PROJ_STAT_UI" ',
'as',
'procedure create_rpt_by_status (',
'    p_app_id            in varchar2,',
'    p_app_session       in varchar2,',
'    p_image_prefix      in varchar2,',
'    p_target_page       in varchar2 default null,',
'    p_target_item       in varchar2 default null,',
'    p_target_page2      in varchar2 default null,',
'    p_target_item2      in varchar2 default null',
'    );',
'procedure top_status_by_code2 (',
'    p_max_rows          in number default 6,',
'    p_app_id            in varchar2,',
'    p_app_session       in varchar2,',
'    p_image_prefix      in varchar2,',
'    p_target_page       in varchar2 default null,',
'    p_target_item       in varchar2 default null,',
'    p_target_item2      in varchar2 default null);',
'function project_report_by_cat ( p_category_id in number ) return varchar2;',
'function project_report_by_owner ( p_owner in varchar2 ) return varchar2;',
'function is_project_open ( p_project_id in number ) return number;',
'function get_authorization_level ( p_username varchar2) return number;',
'function get_project_report_columns',
'(',
'  p_status   in     number   default 0,',
'  p_category in     number   default 0,',
'  p_owner    in     varchar2 default null,',
'  p_search   in     varchar2 default null',
') return varchar2;',
'function get_project_report_values',
'(',
'  p_status   in     number   default 0,',
'  p_category in     number   default 0,',
'  p_owner    in     varchar2 default null,',
'  p_search   in     varchar2 default null',
') return varchar2;',
'end eba_proj_stat_ui;',
'/',
'',
''))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(14141548534293067160)
,p_script_id=>wwv_flow_imp.id(14141548451478067156)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_PROJ_STAT_UI'
);
wwv_flow_imp.component_end;
end;
/
