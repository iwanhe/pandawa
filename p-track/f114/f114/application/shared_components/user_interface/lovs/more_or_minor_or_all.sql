prompt --application/shared_components/user_interface/lovs/more_or_minor_or_all
begin
--   Manifest
--     MORE OR MINOR OR ALL
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
 p_id=>wwv_flow_imp.id(7615381259150706905)
,p_lov_name=>'MORE OR MINOR OR ALL'
,p_lov_query=>'.'||wwv_flow_imp.id(7615381259150706905)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591493
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(7615381474655706919)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'None'
,p_lov_return_value=>'none'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(7615381874089706925)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Major'
,p_lov_return_value=>'major'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(7615382246376706926)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'All'
,p_lov_return_value=>'all'
);
wwv_flow_imp.component_end;
end;
/
