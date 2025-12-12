prompt --application/shared_components/user_interface/lovs/microsite_tag_types
begin
--   Manifest
--     MICROSITE TAG TYPES
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
 p_id=>wwv_flow_imp.id(6132353797603969327)
,p_lov_name=>'MICROSITE TAG TYPES'
,p_lov_query=>'.'||wwv_flow_imp.id(6132353797603969327)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591461
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6132353987023969327)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'paragraph'
,p_lov_return_value=>'paragraph'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6132354285582969328)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'list'
,p_lov_return_value=>'list'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6132354595382969328)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'table'
,p_lov_return_value=>'table'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6132354888716969328)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'link'
,p_lov_return_value=>'link'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6132355190862969328)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'code format'
,p_lov_return_value=>'code format'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6132355486815969328)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'other'
,p_lov_return_value=>'other'
);
wwv_flow_imp.component_end;
end;
/
