prompt --application/shared_components/user_interface/lovs/lockdown
begin
--   Manifest
--     LOCKDOWN
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
 p_id=>wwv_flow_imp.id(8943243225432347945)
,p_lov_name=>'LOCKDOWN'
,p_lov_query=>'.'||wwv_flow_imp.id(8943243225432347945)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591418
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8943243421186347955)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Yes; Edit restricted to Owners, Read Only to others'
,p_lov_return_value=>'Y'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8943243623187347965)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'No; Available to All'
,p_lov_return_value=>'N'
);
wwv_flow_imp.component_end;
end;
/
