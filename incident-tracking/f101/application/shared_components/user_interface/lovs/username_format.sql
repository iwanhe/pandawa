prompt --application/shared_components/user_interface/lovs/username_format
begin
--   Manifest
--     USERNAME_FORMAT
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
 p_id=>wwv_flow_imp.id(1436190752646324025)
,p_lov_name=>'USERNAME_FORMAT'
,p_lov_query=>'.'||wwv_flow_imp.id(1436190752646324025)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567690152430
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1436191051876324027)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Email Address'
,p_lov_return_value=>'EMAIL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1436191360620324027)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Non-Email Address'
,p_lov_return_value=>'STRING'
);
wwv_flow_imp.component_end;
end;
/
