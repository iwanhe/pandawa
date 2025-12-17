prompt --application/deployment/install/install_product_version_function
begin
--   Manifest
--     INSTALL: INSTALL-product version function
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(2755421053289436888)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'product version function'
,p_sequence=>260
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace function EBA_INTRACK_GET_VERSIONS (',
'    p_product_id in number)',
'    return varchar2',
'is',
'    R VARCHAR2(4000) := NULL;',
'BEGIN',
'for c1 in (',
'        select VERSION_NAME',
'        from EBA_INTRACK_VERSION',
'        WHERE product_id = p_product_id) LOOP',
'          r := r||c1.version_name||'', ''; ',
'        END LOOP;',
'    RETURN rtrim(r,'', '');',
'END;',
'/',
'SHOW ERRORS'))
);
wwv_flow_imp.component_end;
end;
/
