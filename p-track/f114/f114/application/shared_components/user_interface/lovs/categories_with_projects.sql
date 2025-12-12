prompt --application/shared_components/user_interface/lovs/categories_with_projects
begin
--   Manifest
--     CATEGORIES WITH PROJECTS
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
 p_id=>wwv_flow_imp.id(6819646145482894312)
,p_lov_name=>'CATEGORIES WITH PROJECTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CATEGORY display_value, ID return_value ',
'from EBA_PROJ_STATUS_CATS c',
'where is_active_yn = ''Y'' and exists (select 1 from eba_proj_status p where p.cat_id = c.id)',
'order by display_sequence nulls last, 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366590997
);
wwv_flow_imp.component_end;
end;
/
