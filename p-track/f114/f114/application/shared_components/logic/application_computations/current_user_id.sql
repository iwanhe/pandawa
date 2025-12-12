prompt --application/shared_components/logic/application_computations/current_user_id
begin
--   Manifest
--     APPLICATION COMPUTATION: CURRENT_USER_ID
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
 p_id=>wwv_flow_imp.id(16931418621077042454)
,p_computation_sequence=>10
,p_computation_item=>'CURRENT_USER_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select id from eba_proj_status_users where username = upper(:APP_USER)'
,p_version_scn=>39567366590860
);
wwv_flow_imp.component_end;
end;
/
