prompt --application/shared_components/user_interface/lovs/flex_tables
begin
--   Manifest
--     FLEX_TABLES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(6143618504990059768)
,p_lov_name=>'FLEX_TABLES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select f.display_name_plrl display_value,',
'    f.flexible_table return_value',
'from eba_proj_flex_registry f',
'where f.assigned_yn = ''N''',
'group by f.display_name_plrl, f.flexible_table',
'order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366591415
);
wwv_flow_imp.component_end;
end;
/
