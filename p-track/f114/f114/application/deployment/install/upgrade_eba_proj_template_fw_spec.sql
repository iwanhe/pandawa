prompt --application/deployment/install/upgrade_eba_proj_template_fw_spec
begin
--   Manifest
--     INSTALL: UPGRADE-eba_proj_template_fw spec
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(13550170647416135228)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'eba_proj_template_fw spec'
,p_sequence=>480
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_proj_template_fw as',
'',
'    -- Recursive function to figure out when a template milestone starts',
'    function start_offset( p_milestone_id in number ) return number;',
'',
'end eba_proj_template_fw;'))
);
wwv_flow_imp.component_end;
end;
/
