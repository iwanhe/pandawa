prompt --application/shared_components/user_interface/lovs/project_template_ais
begin
--   Manifest
--     PROJECT TEMPLATE AIS
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
 p_id=>wwv_flow_imp.id(13548167419292788510)
,p_lov_name=>'PROJECT TEMPLATE AIS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from eba_proj_template_ai',
'order by lower(name)'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366592593
);
wwv_flow_imp.component_end;
end;
/
