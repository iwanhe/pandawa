prompt --application/shared_components/user_interface/lovs/mass_update_users
begin
--   Manifest
--     MASS_UPDATE_USERS
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
 p_id=>wwv_flow_imp.id(2716491233055480639)
,p_lov_name=>'MASS_UPDATE_USERS'
,p_lov_query=>'.'||wwv_flow_imp.id(2716491233055480639)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591440
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2716491544264480648)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Change Access Level'
,p_lov_return_value=>'CHANGE_ACL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2716494748008526703)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Change Background Check(s)'
,p_lov_return_value=>'CHANGE_BG_CHKS'
,p_required_patch=>wwv_flow_imp.id(2661830040094079007)
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2716491955355480650)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Change Country'
,p_lov_return_value=>'CHANGE_COUNTRY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2716492750346480650)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Change Home Timezone'
,p_lov_return_value=>'CHANGE_TZ'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2726438708490490244)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Change Locked Status'
,p_lov_return_value=>'CHANGE_LOCKED_STATUS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2716495097605531303)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Change Skillsets'
,p_lov_return_value=>'CHANGE_SKILLSETS'
,p_required_patch=>wwv_flow_imp.id(2661829854737059914)
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2716495475839534245)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'Change Team Group(s)'
,p_lov_return_value=>'CHANGE_TEAM_GRPS'
,p_required_patch=>wwv_flow_imp.id(2661829695961054886)
);
wwv_flow_imp.component_end;
end;
/
