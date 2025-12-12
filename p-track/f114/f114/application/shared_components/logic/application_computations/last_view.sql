prompt --application/shared_components/logic/application_computations/last_view
begin
--   Manifest
--     APPLICATION COMPUTATION: LAST_VIEW
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(8907618623197570866)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'10'
,p_version_scn=>39567366590860
);
wwv_flow_imp.component_end;
end;
/
