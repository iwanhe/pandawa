prompt --application/shared_components/user_interface/lovs/action_item_types_irr
begin
--   Manifest
--     ACTION ITEM TYPES IRR
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
 p_id=>wwv_flow_imp.id(18916316741608990911)
,p_lov_name=>'ACTION ITEM TYPES IRR'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Not Set'' as ai_type, -1 as id',
'  from dual',
'union all',
'select AI_TYPE, id',
'from EBA_PROJ_STATUS_AIS_TYPES',
'where is_active_yn = ''Y''',
'order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366590997
);
wwv_flow_imp.component_end;
end;
/
