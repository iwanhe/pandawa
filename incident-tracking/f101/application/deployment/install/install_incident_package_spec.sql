prompt --application/deployment/install/install_incident_package_spec
begin
--   Manifest
--     INSTALL: INSTALL-incident package spec
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
 p_id=>wwv_flow_imp.id(2765212844396760599)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'incident package spec'
,p_sequence=>270
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package  eba_intrack_incident',
'as',
'function create_customer (',
'    p_customer_name           in varchar2 default null,',
'    p_customer_web_site       in varchar2 default null,',
'    p_customer_address        in varchar2 default null,',
'    p_customer_city           in varchar2 default null,',
'    p_customer_state          in varchar2 default null,',
'    p_customer_postal_code    in varchar2 default null,',
'    p_customer_country        in varchar2 default null',
'    ) return number',
'    ;',
'    ',
'function create_contact (',
'    p_customer_id             in number,',
'    p_new_contact_phone       in varchar2 default null,',
'    p_new_contact_email       in varchar2 default null,',
'    p_new_contact_phone_type  in varchar2 default null,',
'    p_new_contact_department  in varchar2 default null,',
'    --',
'    p_contact_first_name      in varchar2 default null,',
'    p_contact_last_name       in varchar2 default null,',
'    p_contact_email           in varchar2 default null,',
'    p_contact_department      in varchar2 default null,',
'    p_contact_phone           in varchar2 default null,',
'    p_contact_phone_type      in varchar2 default null,',
'    p_contact_country         in varchar2 default null',
'    ) return number',
'    ;',
'    ',
'function create_ticket (',
'    p_customer_id             in number   default null,',
'    p_customer_name           in varchar2 default null,',
'    p_customer_web_site       in varchar2 default null,',
'    p_customer_address        in varchar2 default null,',
'    p_customer_city           in varchar2 default null,',
'    p_customer_state          in varchar2 default null,',
'    p_customer_postal_code    in varchar2 default null,',
'    --                      ',
'    p_contact_id              in number   default null,',
'    p_contact_first_name      in varchar2 default null,',
'    p_contact_last_name       in varchar2 default null,',
'    p_contact_email           in varchar2 default null,',
'    p_contact_department      in varchar2 default null,',
'    p_contact_phone           in varchar2 default null,',
'    p_contact_phone_type      in varchar2 default null,',
'    p_contact_country         in varchar2 default null,',
'    --                      ',
'    p_product_id              in number   default null,',
'    p_product_version_id      in number   default null,',
'    p_product_additional_info in varchar2 default null,',
'    p_product_serial_num      in varchar2 default null,',
'    --',
'    p_urgency_id              in number   default null,',
'    p_severity_id             in number   default null,',
'    p_category_id             in number   default null,',
'    p_status_id               in number   default null,',
'    p_assignee_id             in number   default null,',
'    --',
'    p_subject                 in varchar2 default null,',
'    p_incident_description    in varchar2 default null,',
'    p_bug_number              in varchar2 default null,',
'    p_additional_info         in varchar2 default null,',
'    --',
'    p_tags                    in varchar2 default null,',
'    p_create_date_override    in timestamp with time zone default null)',
'    return varchar2;',
'end eba_intrack_incident;',
'/',
'show errors',
'',
'',
''))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(1688767482814115683)
,p_script_id=>wwv_flow_imp.id(2765212844396760599)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_INTRACK_INCIDENT'
);
wwv_flow_imp.component_end;
end;
/
