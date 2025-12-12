prompt --application/shared_components/user_interface/lovs/email_schedule_options
begin
--   Manifest
--     EMAIL SCHEDULE OPTIONS
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
 p_id=>wwv_flow_imp.id(16037919235537104348)
,p_lov_name=>'EMAIL SCHEDULE OPTIONS'
,p_lov_query=>'.'||wwv_flow_imp.id(16037919235537104348)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591254
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16037919529439104350)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Quarterly'
,p_lov_return_value=>'QUARTERLY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16037920373595104353)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Monthly'
,p_lov_return_value=>'MONTHLY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16037919946119104352)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Bi-Monthly'
,p_lov_return_value=>'BIMONTHLY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16037920780490104353)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Weekly'
,p_lov_return_value=>'WEEKLY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16059807281615286097)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Daily'
,p_lov_return_value=>'DAILY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(16959205050029646085)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Never (Opted-Out)'
,p_lov_return_value=>'NEVER'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17973889190675923504)
,p_lov_disp_sequence=>16
,p_lov_disp_value=>'No preference set'
,p_lov_return_value=>'UNSET'
,p_lov_disp_cond_type=>'EXPRESSION'
,p_lov_disp_cond=>'eba_proj_stat_ui.get_authorization_level(:APP_USER) >= 3'
,p_lov_disp_cond2=>'PLSQL'
);
wwv_flow_imp.component_end;
end;
/
