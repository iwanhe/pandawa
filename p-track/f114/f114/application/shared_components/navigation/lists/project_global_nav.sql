prompt --application/shared_components/navigation/lists/project_global_nav
begin
--   Manifest
--     LIST: Project Global Nav
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(5253713782518129683)
,p_name=>'Project Global Nav'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lvl,',
'    label,',
'    target,',
'    is_current_list_entry,',
'    image,',
'    image_attribute,',
'    image_alt_attribute',
'from eba_proj_nav_menu',
'order by attribute1, attribute2, attribute3, attribute4'))
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589692
);
wwv_flow_imp.component_end;
end;
/
