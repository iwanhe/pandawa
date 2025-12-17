prompt --application/shared_components/user_interface/lovs/product_version
begin
--   Manifest
--     PRODUCT VERSION
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
 p_id=>wwv_flow_imp.id(2771342570825957712)
,p_lov_name=>'PRODUCT VERSION'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VERSION_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_VERSION',
' order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567690152427
);
wwv_flow_imp.component_end;
end;
/
