prompt --application/shared_components/user_interface/shortcuts/delete_confirm_msg
begin
--   Manifest
--     SHORTCUT: DELETE_CONFIRM_MSG
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(2752021053096614954)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_version_scn=>39567690155036
,p_shortcut=>'Would you like to perform this delete action?'
);
wwv_flow_imp.component_end;
end;
/
