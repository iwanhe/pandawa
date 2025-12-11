prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 216180
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>30014105435788499543
,p_default_application_id=>216180
,p_default_id_offset=>0
,p_default_owner=>'WKSP_NTIAPPS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(30017068631496567833)
,p_group_name=>'Administration'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(30017287866700568994)
,p_group_name=>'User Settings'
);
wwv_flow_imp.component_end;
end;
/
