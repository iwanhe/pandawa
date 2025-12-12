prompt --application/shared_components/logic/application_items/cnt_02
begin
--   Manifest
--     APPLICATION ITEM: CNT_02
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
 p_id=>wwv_flow_imp.id(6061137793509696796)
,p_name=>'CNT_02'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>39567366590858
);
wwv_flow_imp.component_end;
end;
/
