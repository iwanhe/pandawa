prompt --application/shared_components/user_interface/lovs/enabled_or_disabled
begin
--   Manifest
--     ENABLED OR DISABLED
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
 p_id=>wwv_flow_imp.id(11984963079421995979)
,p_lov_name=>'ENABLED OR DISABLED'
,p_lov_query=>'.'||wwv_flow_imp.id(11984963079421995979)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591276
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11984963400566995982)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Enabled'
,p_lov_return_value=>'ENABLED'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11984963805612995984)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Disabled'
,p_lov_return_value=>'DISABLED'
);
wwv_flow_imp.component_end;
end;
/
