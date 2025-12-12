prompt --application/shared_components/logic/application_computations/cat_title
begin
--   Manifest
--     APPLICATION COMPUTATION: CAT_TITLE
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
 p_id=>wwv_flow_imp.id(2687626448386990463)
,p_computation_sequence=>10
,p_computation_item=>'CAT_TITLE'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'return replace(eba_proj_fw.get_preference_value(''CAT_TITLE''),''Preference does not exist'',''Category'');'
,p_version_scn=>39567366590860
);
wwv_flow_imp.component_end;
end;
/
