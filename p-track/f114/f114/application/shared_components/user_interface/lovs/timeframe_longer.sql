prompt --application/shared_components/user_interface/lovs/timeframe_longer
begin
--   Manifest
--     TIMEFRAME - LONGER
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
 p_id=>wwv_flow_imp.id(6072479693769082825)
,p_lov_name=>'TIMEFRAME - LONGER'
,p_lov_query=>'.'||wwv_flow_imp.id(6072479693769082825)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366593075
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072484202362102208)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'1 Day'
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072484501068102782)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'2 Days'
,p_lov_return_value=>'2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072484798264104015)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'3 Days'
,p_lov_return_value=>'3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072485096539104911)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'4 Days'
,p_lov_return_value=>'4'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072485395029105551)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'5 Days'
,p_lov_return_value=>'5'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072485693735106159)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'6 Days'
,p_lov_return_value=>'6'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072479985979082826)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'1 Week'
,p_lov_return_value=>'7'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072480300864082827)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'2 Weeks'
,p_lov_return_value=>'14'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072480591119082827)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'3 Weeks'
,p_lov_return_value=>'21'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072480896324082828)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'4 Weeks'
,p_lov_return_value=>'28'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072522312134279990)
,p_lov_disp_sequence=>41
,p_lov_disp_value=>'5 Weeks'
,p_lov_return_value=>'35'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6086626503400926040)
,p_lov_disp_sequence=>42
,p_lov_disp_value=>'90 Days'
,p_lov_return_value=>'90'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072481201757082828)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'6 Months'
,p_lov_return_value=>'183'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6072481509004082828)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'1 Year'
,p_lov_return_value=>'365'
);
wwv_flow_imp.component_end;
end;
/
