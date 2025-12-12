prompt --application/shared_components/user_interface/lovs/home_page_icon_toggles
begin
--   Manifest
--     HOME_PAGE_ICON_TOGGLES
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
 p_id=>wwv_flow_imp.id(2705877618041227220)
,p_lov_name=>'HOME_PAGE_ICON_TOGGLES'
,p_lov_query=>'.'||wwv_flow_imp.id(2705877618041227220)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591415
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2705896965607400686)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Home Page'
,p_lov_return_value=>'HOME'
,p_lov_template=>'<a href="f?p=&APP_ID.:HOME:&APP_SESSION.:"><span class="t-Icon fa fa-home" title="#DISPLAY_VALUE#"></span><span class="u-VisuallyHidden">#DISPLAY_VALUE#</span></a>'
,p_lov_disp_cond_type=>'EXPRESSION'
,p_lov_disp_cond=>':APP_PAGE_ID != 64'
,p_lov_disp_cond2=>'PLSQL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2705877946962227222)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Projects Dashboard'
,p_lov_return_value=>'DASHBD'
,p_lov_template=>'<a href="f?p=&APP_ID.:DASHBD:&APP_SESSION.:"><span class="t-Icon fa fa-dial-gauge-chart" title="#DISPLAY_VALUE#"></span><span class="u-VisuallyHidden">#DISPLAY_VALUE#</span></a>'
,p_lov_disp_cond_type=>'EXPRESSION'
,p_lov_disp_cond=>':APP_PAGE_ID != 51'
,p_lov_disp_cond2=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(11807336118869114840)
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(2705878400633227222)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Projects Interactive Report'
,p_lov_return_value=>'REPORT'
,p_lov_template=>'<a href="f?p=&APP_ID.:1:&APP_SESSION.::::::"><span class="t-Icon fa fa-table" title="#DISPLAY_VALUE#"></span><span class="u-VisuallyHidden">#DISPLAY_VALUE#</span></a>'
,p_lov_disp_cond_type=>'EXPRESSION'
,p_lov_disp_cond=>':APP_PAGE_ID != 1'
,p_lov_disp_cond2=>'PLSQL'
);
wwv_flow_imp.component_end;
end;
/
