prompt --application/shared_components/user_interface/lovs/feedback_statuses
begin
--   Manifest
--     FEEDBACK STATUSES
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
 p_id=>wwv_flow_imp.id(16934638707484071171)
,p_lov_name=>'FEEDBACK STATUSES'
,p_lov_query=>'.'||wwv_flow_imp.id(16934638707484071171)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591276
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16934638917453071176)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'In Progress'
,p_lov_return_value=>'IN_PROGRESS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16934639395701071177)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No Action'
,p_lov_return_value=>'NO_ACTION'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16934639736324071177)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Open'
,p_lov_return_value=>'OPEN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16934640161257071178)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Resolved'
,p_lov_return_value=>'RESOLVED'
);
wwv_flow_imp.component_end;
end;
/
