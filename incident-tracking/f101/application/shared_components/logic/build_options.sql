prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(1074673254616582769)
,p_build_option_name=>'Inline page help'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567690154883
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show informational text on top of key pages that explain how to use the page and components on the page.  Enabling this help for new deployments can make it easier to use however the added text clutters the page and can be a distraction to experience'
||'d users.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(1539901858299951452)
,p_build_option_name=>'Content Completeness Widget'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567690154883
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'This build option controls whether the "Content Completeness" plugin region is displayed on the Ticket details page or not.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(1539902050966954833)
,p_build_option_name=>'Validations Widget'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567690154883
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'This build option controls whether the "Validations" plugin region is displayed on the Ticket details page or not.'
);
wwv_flow_imp.component_end;
end;
/
