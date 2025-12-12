prompt --application/shared_components/user_interface/lovs/email_from_pref_opts
begin
--   Manifest
--     EMAIL_FROM_PREF_OPTS
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
 p_id=>wwv_flow_imp.id(4270242717959182203)
,p_lov_name=>'EMAIL_FROM_PREF_OPTS'
,p_lov_query=>'.'||wwv_flow_imp.id(4270242717959182203)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591276
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(4270243086531182209)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'From Requester'
,p_lov_return_value=>'0'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(4270243463087182216)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'From Defined Project Role'
,p_lov_return_value=>'-1'
);
wwv_flow_imp.component_end;
end;
/
