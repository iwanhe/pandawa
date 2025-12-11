prompt --workspace/credentials/app_216180_push_notifications_credentials
begin
--   Manifest
--     CREDENTIAL: App 216180 Push Notifications Credentials
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>30014105435788499543
,p_default_application_id=>216180
,p_default_id_offset=>0
,p_default_owner=>'WKSP_NTIAPPS'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(30017295092714569002)
,p_name=>'App 216180 Push Notifications Credentials'
,p_static_id=>'App_216180_Push_Notifications_Credentials'
,p_authentication_type=>'KEY_PAIR'
,p_prompt_on_install=>false
);
wwv_flow_imp.component_end;
end;
/
