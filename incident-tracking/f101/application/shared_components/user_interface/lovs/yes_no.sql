prompt --application/shared_components/user_interface/lovs/yes_no
begin
--   Manifest
--     YES NO
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
 p_id=>wwv_flow_imp.id(2754272554244105957)
,p_lov_name=>'YES NO'
,p_lov_query=>'.'||wwv_flow_imp.id(2754272554244105957)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567690152430
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2754272745848105959)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'Y'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2754272956967105960)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'No'
,p_lov_return_value=>'N'
);
wwv_flow_imp.component_end;
end;
/
