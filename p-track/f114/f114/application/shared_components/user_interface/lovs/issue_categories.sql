prompt --application/shared_components/user_interface/lovs/issue_categories
begin
--   Manifest
--     ISSUE CATEGORIES
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
 p_id=>wwv_flow_imp.id(3927737161011692001)
,p_lov_name=>'ISSUE CATEGORIES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from EBA_PROJ_ISSUE_CATS',
' where is_active_yn = ''Y''',
' order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366591415
);
wwv_flow_imp.component_end;
end;
/
