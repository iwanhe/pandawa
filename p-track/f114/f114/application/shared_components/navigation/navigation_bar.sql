prompt --application/shared_components/navigation/navigation_bar
begin
--   Manifest
--     ICON BAR ITEMS: 114
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_icon_bar_item(
 p_id=>wwv_flow_imp.id(6696304807828932349)
,p_icon_sequence=>10
,p_icon_image=>'fa-question-circle'
,p_icon_subtext=>'Help'
,p_icon_target=>'f?p=&APP_ID.:help:&SESSION.::&DEBUG.:::'
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_imp_shared.create_icon_bar_item(
 p_id=>wwv_flow_imp.id(7748791102713181836)
,p_icon_sequence=>20
,p_icon_subtext=>'Logout'
,p_icon_target=>'&LOGOUT_URL.'
,p_nav_entry_is_feedback_yn=>'N'
,p_icon_bar_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_imp_shared.create_icon_bar_item(
 p_id=>wwv_flow_imp.id(7801582686046181431)
,p_icon_sequence=>30
,p_icon_subtext=>'Login'
,p_icon_target=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.::::'
,p_icon_image_alt=>'Login'
,p_nav_entry_is_feedback_yn=>'N'
,p_icon_bar_disp_cond_type=>'USER_IS_PUBLIC_USER'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_imp.component_end;
end;
/
