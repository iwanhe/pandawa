prompt --application/shared_components/logic/application_computations/nice_username
begin
--   Manifest
--     APPLICATION COMPUTATION: NICE_USERNAME
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
 p_id=>wwv_flow_imp.id(21154638266229923562)
,p_computation_sequence=>10
,p_computation_item=>'NICE_USERNAME'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'eba_proj_fw.get_name_from_email_address(:APP_USER);'
,p_version_scn=>39567366590859
);
wwv_flow_imp.component_end;
end;
/
