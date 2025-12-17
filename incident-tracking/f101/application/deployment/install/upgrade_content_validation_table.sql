prompt --application/deployment/install/upgrade_content_validation_table
begin
--   Manifest
--     INSTALL: UPGRADE-Content Validation Table
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
 p_id=>wwv_flow_imp.id(1536977656083824958)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Content Validation Table'
,p_sequence=>110
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_INTRACK_VERIFICATIONS'';'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_intrack_verifications',
'(',
'    id                   number primary key,',
'    view_id              number,',
'    verified_by          varchar2(255) not null,',
'    verification_comment varchar2(4000),',
'    created              timestamp(6) with time zone,',
'    created_by           varchar2(255),',
'    updated              timestamp(6) with time zone,',
'    updated_by           varchar2(255)',
');',
'/',
'',
'create index eba_intrack_verify_idx1 on eba_intrack_verifications (view_id);',
'    ',
'create or replace trigger eba_intrack_verify_biu_fer',
'   before insert or update on eba_intrack_verifications',
'   for each row',
'begin',
'   if :new.id is null then',
'     :new.id := eba_intrack_seq.nextval;',
'   end if;',
'   if inserting then',
'       :new.created := current_timestamp;',
'       :new.created_by := nvl(apex_application.g_user,user);',
'   end if;',
'   if inserting or updating then',
'       :new.updated := current_timestamp;',
'       :new.updated_by := nvl(apex_application.g_user,user);',
'   end if;',
'end;',
'/',
'',
'alter trigger eba_intrack_verify_biu_fer enable;',
''))
);
wwv_flow_imp.component_end;
end;
/
