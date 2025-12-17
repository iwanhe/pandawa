prompt --application/deployment/install/install_incidents_view
begin
--   Manifest
--     INSTALL: INSTALL-Incidents view
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
 p_id=>wwv_flow_imp.id(2777701665571370726)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Incidents view'
,p_sequence=>320
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace view eba_intrack_incidents_view',
'as',
'select',
'     i.id,',
'     i.ROW_VERSION_NUMBER as ROW_VERSION_NUMBER,',
'     i."INCIDENT_NUMBER" as "INCIDENT_NUMBER",',
'     i."SUBJECT" as "SUBJECT",',
'     i."BUG_NUMBER" as "BUG_NUMBER",',
'     i."CATEGORY_ID" as "CATEGORY_ID",',
'     i."ASSIGNED_TO_ID" as "ASSIGNED_TO_ID",',
'     i."ASSIGNED_ON" as "ASSIGNED_ON",',
'     i."DATE_CLOSED" as "DATE_CLOSED",',
'     i."DESCRIPTION" as "DESCRIPTION",',
'     i."PRODUCT_ID" as "PRODUCT_ID",',
'     i."PRODUCT_VERSION_ID" as "PRODUCT_VERSION_ID",',
'     i."ADDITIONAL_PRODUCT_INFO" as "ADDITIONAL_PRODUCT_INFO",',
'     i."CUSTOMER_ID" as "CUSTOMER_ID",',
'     i."CUSTOMER_DEPARTMENT" as "CUSTOMER_DEPARTMENT",',
'     i."SEVERITY_ID" as "SEVERITY_ID",',
'     i."STATUS_ID" as "STATUS_ID",',
'     i.status_code,',
'     i."URGENCY_ID" as "URGENCY_ID",',
'     i."ASSIGNED_TO_GROUP_ID" as "ASSIGNED_TO_GROUP_ID",',
'     i."TAGS" as "TAGS",',
'     i."CREATED" as "CREATED",',
'     i."CREATED_BY" as "CREATED_BY",',
'     i."UPDATED" as "UPDATED",',
'     i."UPDATED_BY" as "UPDATED_BY",',
'     (select email from eba_intrack_customer_contact cc where cc.id = i.customer_contact_id) customer_contact_email,',
'     (select last_Name||'', ''||first_name n from eba_intrack_customer_contact cc where cc.id = i.customer_contact_id) customer_contact_name,',
'     (select customer_name from eba_intrack_customers c where c.id = i.customer_id) customer,',
'    decode(i.ASSIGNED_TO_ID,null,null,(select assignee_name from eba_intrack_assignees u where u.id = i.ASSIGNED_TO_ID)) assignee,',
'     (select count(*) from eba_intrack_inc_followup f where f.incident_id = i.id) follow_ups,',
'     (select status_type from eba_intrack_status s where i.STATUS_ID = s.id) status_type,',
'     (select status_name from eba_intrack_status s where i.STATUS_ID = s.id) status_name,',
'     (select product_name from EBA_INTRACK_PRODUCT p where i."PRODUCT_ID" = p."ID") product_name,',
'     (select version_name from EBA_INTRACK_VERSION v where v."PRODUCT_ID" = i."ID" and i.PRODUCT_VERSION_ID = v.id) product_version,',
'     (select URGENCY_NAME from EBA_INTRACK_URGENCY u where i."URGENCY_ID" = u."ID") URGENCY_NAME,',
'     (select SEVERITY_NAME from EBA_INTRACK_SEVERITY sev where i."SEVERITY_ID" = sev."ID") SEVERITY_NAME,',
'     (select SEVERITY_CODE from EBA_INTRACK_SEVERITY sev where i."SEVERITY_ID" = sev."ID") SEVERITY_CODE',
' from',
'     "EBA_INTRACK_INCIDENTS" i;',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
