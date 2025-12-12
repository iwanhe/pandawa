prompt --application/shared_components/user_interface/lovs/flex_hdr_alignments
begin
--   Manifest
--     FLEX_HDR_ALIGNMENTS
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
 p_id=>wwv_flow_imp.id(6143623586916059780)
,p_lov_name=>'FLEX_HDR_ALIGNMENTS'
,p_lov_query=>'.'||wwv_flow_imp.id(6143623586916059780)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591396
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143623914693059780)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Left'
,p_lov_return_value=>'LEFT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143624193272059780)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Center'
,p_lov_return_value=>'CENTER'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143624494935059780)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Right'
,p_lov_return_value=>'RIGHT'
);
wwv_flow_imp.component_end;
end;
/
