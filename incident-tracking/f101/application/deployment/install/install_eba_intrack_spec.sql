prompt --application/deployment/install/install_eba_intrack_spec
begin
--   Manifest
--     INSTALL: INSTALL-eba_intrack spec
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
 p_id=>wwv_flow_imp.id(3202511342692510729)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'eba_intrack spec'
,p_sequence=>3
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_intrack is ',
'    -------------------------------------------------------------------------',
'    -- Generates a unique Identifier',
'    -------------------------------------------------------------------------',
'    function gen_id return number;',
'',
'    -------------------------------------------------------------------------',
'    -- Gets the current user''s authorization level. Can depend on the following:',
'    --  * If access control is currently disabled, returns highest level of 3.',
'    --  * If access control is enabled, but user is not in list, returns 0',
'    --  * If access control is enabled and user is in list, returns their',
'    --    access level.',
'    -------------------------------------------------------------------------',
'    function get_authorization_level (',
'        p_username             varchar2)',
'        return number;',
'',
'    -------------------------------------------------------------------------',
'    -- Gets the set of links displayed on the mobile details summary page (301)',
'    -- for the passed-in type',
'    -------------------------------------------------------------------------',
'    function get_mobile_incident_details',
'    (',
'      p_type    in     varchar2,',
'      p_session in     number,',
'      p_app_id  in     varchar2  default ''7140'',',
'      p_page_id in     varchar2  default ''405''',
'    ) return varchar2;',
'',
'end eba_intrack ;'))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(1688766961882115655)
,p_script_id=>wwv_flow_imp.id(3202511342692510729)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_INTRACK'
);
wwv_flow_imp.component_end;
end;
/
