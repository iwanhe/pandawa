prompt --application/shared_components/user_interface/lovs/number_of_rows
begin
--   Manifest
--     NUMBER OF ROWS
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
 p_id=>wwv_flow_imp.id(6837380404471503108)
,p_lov_name=>'NUMBER OF ROWS'
,p_lov_query=>'.'||wwv_flow_imp.id(6837380404471503108)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591708
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6837380696941503109)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'5'
,p_lov_return_value=>'5'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6837380911585503110)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'10'
,p_lov_return_value=>'10'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6837381084510503110)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'20'
,p_lov_return_value=>'20'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6726962722975619235)
,p_lov_disp_sequence=>3.5
,p_lov_disp_value=>'30'
,p_lov_return_value=>'30'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6837381294506503110)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'50'
,p_lov_return_value=>'50'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6837381498193503110)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'100'
,p_lov_return_value=>'100'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6837381687292503110)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'500'
,p_lov_return_value=>'500'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6715040057580130484)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'1000'
,p_lov_return_value=>'1000'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6837381892499503110)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'- All Rows -'
,p_lov_return_value=>'50000'
);
wwv_flow_imp.component_end;
end;
/
