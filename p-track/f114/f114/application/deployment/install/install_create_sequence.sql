prompt --application/deployment/install/install_create_sequence
begin
--   Manifest
--     INSTALL: INSTALL-create sequence
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
 p_id=>wwv_flow_imp.id(8903667620446918463)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'create sequence'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>'create sequence eba_proj_seq;'
);
wwv_flow_imp.component_end;
end;
/
