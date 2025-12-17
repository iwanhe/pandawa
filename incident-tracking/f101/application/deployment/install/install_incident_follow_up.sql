prompt --application/deployment/install/install_incident_follow_up
begin
--   Manifest
--     INSTALL: INSTALL-incident follow up
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
 p_id=>wwv_flow_imp.id(2771874058339152859)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'incident follow up'
,p_sequence=>290
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_intrack_inc_followup (',
'    id                      number primary key,',
'    incident_id             number references EBA_INTRACK_INCIDENTS(id) on delete cascade,',
'    row_key                 varchar2(50),',
'    row_version_number      number,',
'    follow_up               clob,',
'    follow_up_type          varchar2(30) constraint eba_intrack_inc_follow_t_cc ',
'                            check (follow_up_type in (',
'                            ''TEXT'',',
'                            ''CLOSE_DATE_CHANGE'',',
'                            ''STATUS_CHANGE'',',
'                            ''ASSIGNEE_CHANGE'',',
'                            ''URGENCY_CHANGE'',',
'                            ''SEVERITY_CHANGE'',',
'                            ''CATEGORY_CHANGE'',',
'                            ''GROUP_CHANGE'',',
'                            ''PRODUCT_CHANGE'',',
'                            ''PRODUCT_VERSION_CHANGE'',',
'                            ''SUBJECT_CHANGE'',',
'                            ''TAG_CHANGE'',',
'                            ''BUG_CHANGE'',',
'                            ''CUSTOMER_CHANGE'')),',
'    status_column           varchar2(255),',
'    status_old_val          varchar2(4000),',
'    status_new_val          varchar2(4000),',
'    status_old_disp_val     varchar2(4000),',
'    status_new_disp_val     varchar2(4000),',
'    --',
'    created_by          varchar2(255),',
'    created             timestamp with time zone,',
'    updated_by          varchar2(255),',
'    updated             timestamp with time zone',
');',
'',
'create index eba_intrack_inc_fup_i1 on eba_intrack_inc_followup (incident_id);',
'',
'create or replace trigger eba_intrack_inc_follup_biu',
'before insert or update on eba_intrack_inc_followup',
'    for each row',
'begin',
'    if inserting and :new.id is null then',
'        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'')',
'        into :new.id',
'        from dual;',
'    end if;',
'    if inserting then',
'        :new.created_by := nvl(v(''APP_USER''),USER);',
'        :new.created := current_timestamp;',
'        :new.row_version_number := 1;',
'    end if;',
'    if updating then',
'        :new.updated_by := nvl(v(''APP_USER''),USER);',
'        :new.updated := current_timestamp;',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'    if :new.follow_up_type is null then',
'        :new.follow_up_type := ''TEXT'';',
'    end if;',
'    if :new.row_key is null then',
'       for c1 in (select eba_intrack_seq.nextval s from dual) loop',
'           :new.row_key := eba_intrack_fw.compress_int(c1.s);',
'       end loop;',
'    end if;',
'end;',
'/',
'alter trigger eba_intrack_inc_follup_biu enable;',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
