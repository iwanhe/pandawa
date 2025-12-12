prompt --application/deployment/install/upgrade_eba_proj_status_clicks_view
begin
--   Manifest
--     INSTALL: UPGRADE-EBA_PROJ_STATUS_CLICKS view
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
 p_id=>wwv_flow_imp.id(12633536933386928706)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'EBA_PROJ_STATUS_CLICKS view'
,p_sequence=>830
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace view eba_proj_status_clicks as',
'select id, ',
'    project_id, ',
'    app_username, ',
'    view_timestamp, ',
'    app_session ',
'from eba_proj_status_clicks$ c',
'where exists ( select null from eba_proj_status ps where ps.id = c.project_id );'))
);
wwv_flow_imp.component_end;
end;
/
