prompt --application/shared_components/user_interface/lovs/access_levels
begin
--   Manifest
--     ACCESS_LEVELS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(3204240753141134935)
,p_lov_name=>'ACCESS_LEVELS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select access_level d, id r',
'  from eba_intrack_access_levels',
' order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567690152421
);
wwv_flow_imp.component_end;
end;
/
