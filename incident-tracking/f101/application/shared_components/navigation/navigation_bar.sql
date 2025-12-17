prompt --application/shared_components/navigation/navigation_bar
begin
--   Manifest
--     ICON BAR ITEMS: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_icon_bar_item(
 p_id=>wwv_flow_imp.id(3259571446996097196)
,p_icon_sequence=>10
,p_icon_subtext=>'Logout'
,p_icon_target=>'&LOGOUT_URL.'
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_imp.component_end;
end;
/
