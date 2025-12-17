prompt --application/deployment/install/install_incidents_table
begin
--   Manifest
--     INSTALL: INSTALL-incidents table
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
 p_id=>wwv_flow_imp.id(2742610455575884154)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'incidents table'
,p_sequence=>250
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table  eba_intrack_incidents',
'   (',
'   id                      number,',
'   row_version_number      number,',
'   incident_number      varchar2(50),',
'   bug_number           varchar2(50),',
'   subject              varchar2(500) not null enable,',
'   submitted_on         timestamp with time zone,',
'   category_id          number,',
'   assigned_to_id       number,',
'   assigned_on          timestamp with time zone,',
'   DATE_CLOSED          timestamp with time zone,',
'   --',
'   description          clob,',
'   --',
'   product_id           number,',
'   product_version_id   number,',
'   additional_product_info varchar2(4000),',
'   product_serial_num   varchar2(255),',
'   --',
'   customer_id          number not null,',
'   customer_contact_id  number,',
'   customer_department  varchar2(500),',
'   found_version_id     number,',
'   status_id            number,',
'   status_code          varchar2(30),',
'   SEVERITY_id          number,',
'   urgency_id           number,',
'   assigned_to_group_id number,',
'   component            varchar2(4000),',
'  --',
'  flex_01     varchar2(4000),',
'  flex_02     varchar2(4000),',
'  flex_03     varchar2(4000),',
'  flex_04     varchar2(4000),',
'  flex_05     varchar2(4000),',
'  flex_06     varchar2(4000),',
'  flex_07     varchar2(4000),',
'  flex_08     varchar2(4000),',
'  --',
'  flex_num_01 number,',
'  flex_num_02 number,',
'  flex_num_03 number,',
'  flex_num_04 number,',
'  --',
'  flex_date_01 timestamp with time zone,',
'  flex_date_02 timestamp with time zone,',
'  flex_date_03 timestamp with time zone,',
'  flex_date_04 timestamp with time zone,',
'  --',
'  flex_clob_01 clob,',
'  flex_clob_02 clob,',
'  --',
'  tags         varchar2(4000),',
'  --',
'  created     timestamp with time zone not null,',
'  created_by  varchar2(255) not null,',
'  updated     timestamp with time zone,',
'  updated_by  varchar2(255),',
'  --',
'  constraint eba_intrack_incidents_pk primary key(id),',
'    --',
'    constraint eba_intrack_incid_cust_fk foreign key (customer_id)',
'    references  eba_intrack_customers (id) on delete cascade enable,',
'    --',
'    constraint eba_intrack_prob_cat_fk foreign key (category_id)',
'    references  eba_intrack_category (id) on delete set null enable,',
'    --',
'    constraint eba_intrack_incid_p_fk foreign key (product_id)',
'    references  eba_intrack_product (id) on delete cascade,',
'    --',
'    constraint eba_intrack_incidents_u_fk foreign key (urgency_id)',
'    references  eba_intrack_urgency (id) on delete set null enable,',
'    --',
'    constraint eba_intrack_prob_g_fk foreign key (assigned_to_group_id)',
'     references  eba_intrack_group (id) on delete set null enable',
'   )',
'/',
'',
'alter table eba_intrack_incidents add constraint eba_intrack_inc_uq_subj unique (product_id, product_version_id, subject);',
'',
'create index eba_intrack_incident_i2 on eba_intrack_incidents(customer_id);',
'create index eba_intrack_incident_i3 on eba_intrack_incidents(category_id);',
'create index eba_intrack_incident_i4 on eba_intrack_incidents(product_id);',
'create index eba_intrack_incident_i5 on eba_intrack_incidents(assigned_to_group_id);',
'create index eba_intrack_incident_i6 on eba_intrack_incidents(incident_number);',
'create index eba_intrack_incident_i7 on eba_intrack_incidents(URGENCY_ID);'))
);
wwv_flow_imp.component_end;
end;
/
