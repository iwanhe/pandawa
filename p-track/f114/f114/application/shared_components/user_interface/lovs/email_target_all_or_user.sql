prompt --application/shared_components/user_interface/lovs/email_target_all_or_user
begin
--   Manifest
--     EMAIL TARGET ALL OR USER
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
 p_id=>wwv_flow_imp.id(11876960261351330225)
,p_lov_name=>'EMAIL TARGET ALL OR USER'
,p_lov_query=>'.'||wwv_flow_imp.id(11876960261351330225)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591276
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11876960473323330231)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'All Users'
,p_lov_return_value=>'ALL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11876960857728330234)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Single User'
,p_lov_return_value=>'USER'
);
wwv_flow_imp.component_end;
end;
/
