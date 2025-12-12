prompt --application/shared_components/user_interface/lovs/involvement_level
begin
--   Manifest
--     INVOLVEMENT LEVEL
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
 p_id=>wwv_flow_imp.id(15245943838308990666)
,p_lov_name=>'INVOLVEMENT LEVEL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select involvement_level||decode(PERCENTAGE,null,null,'' - ''||percentage||''%'') d, id r',
'from eba_proj_involvement_levels',
'order by display_sequence'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366591415
);
wwv_flow_imp.component_end;
end;
/
