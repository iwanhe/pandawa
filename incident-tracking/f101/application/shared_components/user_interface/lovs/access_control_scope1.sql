prompt --application/shared_components/user_interface/lovs/access_control_scope1
begin
--   Manifest
--     ACCESS CONTROL SCOPE1
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
 p_id=>wwv_flow_imp.id(326738208632330061)
,p_lov_name=>'ACCESS CONTROL SCOPE1'
,p_lov_query=>'.'||wwv_flow_imp.id(326738208632330061)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567690152421
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(326738588283330062)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Readers'
,p_lov_return_value=>'PUBLIC_READONLY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(326738997188330063)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Contributors'
,p_lov_return_value=>'PUBLIC_CONTRIBUTE'
);
wwv_flow_imp.component_end;
end;
/
