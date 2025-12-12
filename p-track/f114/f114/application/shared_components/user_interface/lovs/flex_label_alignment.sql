prompt --application/shared_components/user_interface/lovs/flex_label_alignment
begin
--   Manifest
--     FLEX_LABEL_ALIGNMENT
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
 p_id=>wwv_flow_imp.id(6143619102610059772)
,p_lov_name=>'FLEX_LABEL_ALIGNMENT'
,p_lov_query=>'.'||wwv_flow_imp.id(6143619102610059772)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591414
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143619408146059775)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Right'
,p_lov_return_value=>'RIGHT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143619710666059776)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Right-Top'
,p_lov_return_value=>'RIGHT-TOP'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143619986431059776)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Right-Center'
,p_lov_return_value=>'RIGHT-CENTER'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143620283840059776)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Right-Bottom'
,p_lov_return_value=>'RIGHT-BOTTOM'
);
wwv_flow_imp.component_end;
end;
/
