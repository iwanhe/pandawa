prompt --application/shared_components/user_interface/lovs/notification_type
begin
--   Manifest
--     NOTIFICATION TYPE
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
 p_id=>wwv_flow_imp.id(2891983752419659218)
,p_lov_name=>'NOTIFICATION TYPE'
,p_lov_query=>'.'||wwv_flow_imp.id(2891983752419659218)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567690152424
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2891984056069659221)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Yellow'
,p_lov_return_value=>'YELLOW'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2891984266814659222)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Red'
,p_lov_return_value=>'RED'
);
wwv_flow_imp.component_end;
end;
/
