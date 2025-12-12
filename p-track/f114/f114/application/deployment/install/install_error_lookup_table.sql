prompt --application/deployment/install/install_error_lookup_table
begin
--   Manifest
--     INSTALL: INSTALL-error lookup table
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
 p_id=>wwv_flow_imp.id(7840724002278500122)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'error lookup table'
,p_sequence=>40
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE TABLE  EBA_PROJ_ERROR_LOOKUP',
'   (    CONSTRAINT_NAME VARCHAR2(30) NOT NULL ENABLE,',
'    MESSAGE VARCHAR2(4000) NOT NULL ENABLE,',
'    LANGUAGE_CODE VARCHAR2(30) NOT NULL ENABLE,',
'    CONSTRAINT EBA_PROJ_ERROR_LOOKUP_PK PRIMARY KEY (CONSTRAINT_NAME) ENABLE',
'   )',
'/'))
);
wwv_flow_imp.component_end;
end;
/
