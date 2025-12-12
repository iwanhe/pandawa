prompt --application/shared_components/user_interface/lovs/popularity_view_options_p139
begin
--   Manifest
--     POPULARITY VIEW OPTIONS P139
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
 p_id=>wwv_flow_imp.id(6878611200171571382)
,p_lov_name=>'POPULARITY VIEW OPTIONS P139'
,p_lov_query=>'.'||wwv_flow_imp.id(6878611200171571382)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592427
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6878611422408571385)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Bubbles'
,p_lov_return_value=>'B'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(3736356729912556600)
,p_lov_disp_sequence=>15
,p_lov_disp_value=>'Cards'
,p_lov_return_value=>'CARDS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6878611860155571394)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Interactive Report'
,p_lov_return_value=>'IR'
);
wwv_flow_imp.component_end;
end;
/
