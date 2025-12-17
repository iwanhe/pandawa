prompt --application/shared_components/logic/application_items/application_title
begin
--   Manifest
--     APPLICATION ITEM: APPLICATION_TITLE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(1334929348153283965)
,p_name=>'APPLICATION_TITLE'
,p_protection_level=>'S'
,p_escape_on_http_output=>'N'
,p_version_scn=>39567690152414
);
wwv_flow_imp.component_end;
end;
/
