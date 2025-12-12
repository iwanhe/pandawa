prompt --application/shared_components/logic/application_computations/p200_help_text
begin
--   Manifest
--     APPLICATION COMPUTATION: P200_HELP_TEXT
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
 p_id=>wwv_flow_imp.id(1810049171376473973)
,p_computation_sequence=>10
,p_computation_item=>'P200_HELP_TEXT'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'eba_proj_help.get_project_details_help_text(p_app_id => :APP_ID);'
,p_version_scn=>39567366590860
);
wwv_flow_imp.component_end;
end;
/
