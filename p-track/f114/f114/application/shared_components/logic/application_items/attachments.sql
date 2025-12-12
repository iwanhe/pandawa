prompt --application/shared_components/logic/application_items/attachments
begin
--   Manifest
--     APPLICATION ITEM: ATTACHMENTS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(6726333019741652258)
,p_name=>'ATTACHMENTS'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>39567366590777
);
wwv_flow_imp.component_end;
end;
/
