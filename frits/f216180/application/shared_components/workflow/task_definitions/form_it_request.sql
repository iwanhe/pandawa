prompt --application/shared_components/workflow/task_definitions/form_it_request
begin
--   Manifest
--     TASK_DEF: Form IT Request
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>30014105435788499543
,p_default_application_id=>216180
,p_default_id_offset=>0
,p_default_owner=>'WKSP_NTIAPPS'
);
wwv_flow_imp_shared.create_task_def(
 p_id=>wwv_flow_imp.id(34327980652036036625)
,p_name=>'Form IT Request'
,p_static_id=>'FORM_IT_REQUEST'
,p_subject=>'&NO_URUT_FORM - Form Request IT untuk &PENGGUNA'
,p_task_type=>'APPROVAL'
,p_priority=>2
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_details_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_TASK_ID:&TASK_ID.'
,p_actions_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select employee_id, employee_name, email_employee, employee_id_spv, supervisor_name, email_supervisor',
'from nti_employee_tbl',
'where 1=1',
'and employee_id = :APEX$TASK_PK'))
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677490909701540324)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Request ID'
,p_static_id=>'ID'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>false
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677491233081540343)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Ticket Number'
,p_static_id=>'TICKET_NUM'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677491645514540343)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'No Urut Form'
,p_static_id=>'NO_URUT_FORM'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677492001770540343)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Peminta'
,p_static_id=>'PEMINTA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677492449370540343)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'NIK Peminta'
,p_static_id=>'NIK_PEMINTA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677492835700540344)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Jabatan Peminta'
,p_static_id=>'JABATAN_PEMINTA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677493213238540344)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Lokasi Peminta'
,p_static_id=>'LOKASI_PEMINTA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677493642364540344)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Pengguna'
,p_static_id=>'PENGGUNA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677494086325540344)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'NIK Pengguna'
,p_static_id=>'NIK_PENGGUNA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677494446198540344)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Jabatan Pengguna'
,p_static_id=>'JABATAN_PENGGUNA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677494889285540345)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Lokasi Pengguna'
,p_static_id=>'LOKASI_PENGGUNA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677495299752540345)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Mandatory Hardware Software'
,p_static_id=>'MANDATORY_HD_SOFT'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677495651780540345)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Opsional Hardware'
,p_static_id=>'OPSIONAL_HD'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677496091269540345)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Opsional Software'
,p_static_id=>'OPSIONAL_SOFT'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677496422180540345)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Hak Akses'
,p_static_id=>'HAK_AKSES'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677496804990540346)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Keterangan'
,p_static_id=>'KETERANGAN'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677497227505540346)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Approver Pertama'
,p_static_id=>'APPROVER1'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677497645783540346)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Email Approver Pertama'
,p_static_id=>'EMAIL_APPROVER1'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677498021763540346)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Approver Kedua'
,p_static_id=>'APPROVER2'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677498494431540346)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Email Approver Kedua'
,p_static_id=>'EMAIL_APPROVER2'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(34677498883472540347)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_label=>'Status'
,p_static_id=>'STATUS'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(34683122658156205242)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_name=>'CREATE_FORM_IT_REQUEST'
,p_execution_sequence=>10
,p_on_event=>'CREATE'
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_req_id varchar2(20);',
'begin',
'    if :APP_USER = :EMAIL_EMPLOYEE then --this is the original initiator',
'        l_req_id := :APEX$TASK_ID;',
'        -- create a new record in the Employee Travel Request table EMP_TRAVEL_REQUEST',
'        insert into NTI_FORM_REQUEST_IT_TBL values ',
'        (to_number(l_req_id),',
'        to_number(l_req_id),',
'        :TICKET_NUM,',
'        :NO_URUT_FORM,',
'        SYSDATE,',
'        :PEMINTA,',
'        :NIK_PEMINTA,',
'        :JABATAN_PEMINTA,',
'        :LOKASI_PEMINTA,',
'        :PENGGUNA,',
'        :NIK_PENGGUNA,',
'        :JABATAN_PENGGUNA,',
'        :LOKASI_PENGGUNA,',
'        :MANDATORY_HD_SOFT,',
'        :OPSIONAL_HD,',
'        :OPSIONAL_SOFT,',
'        :HAK_AKSES,',
'        :KETERANGAN,',
'        :APPROVER1,',
'        :EMAIL_APPROVER1,',
'        :APPROVER2,',
'        :EMAIL_APPROVER2,',
'        :APP_USER,',
'        SYSDATE,',
'        :APP_USER,',
'        SYSDATE,',
'       ''PENDING'');',
'    end if;',
'end;'))
,p_action_clob_language=>'PLSQL'
,p_attribute_10=>'N'
,p_attribute_14=>'HTML'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(34871185772154274458)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_name=>'NEXT_APPROVER_UPDATE_STATUS_FORM_REQUEST'
,p_execution_sequence=>20
,p_outcome=>'APPROVED'
,p_on_event=>'COMPLETE'
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_mgr varchar2(20);',
'    l_task_id number;',
'    l_request_id number;',
'    l_req_status varchar2(10) :=''PENDING'';',
'begin',
'',
'    select employee_id_spv into l_mgr from nti_employee_tbl where email_employee=:APP_USER;',
'    if :APP_USER = :EMAIL_SUPERVISOR then --this is the first approver',
'       -- set the request id to be the id of the task created when the request was submitted',
'       l_request_id := :APEX$TASK_ID; ',
'    else',
'       -- this is an intermediate approver, set the request id from the corresponding task parameter value',
'       l_request_id := :ID; ',
'    end if;',
'    if l_mgr = ''180319.02330B0'' then -- the approval is complete',
'',
'        update NTI_FORM_REQUEST_IT_TBL set status = ''APPROVED'', updated_by=updated_by||''->''||:APP_USER',
'         where id_1 = l_request_id and NIK_PEMINTA =:APEX$TASK_PK;',
'',
'        l_req_status := ''APPROVED'';',
'    else -- the request needs to go through another level of approval',
'        -- updated the request record with details of the current approver in the chain of approvers',
'        update NTI_FORM_REQUEST_IT_TBL set updated_by = updated_by||''->''||:APEX$TASK_OWNER ',
'         where id_1 = l_request_id ',
'           and NIK_PEMINTA =:APEX$TASK_PK;',
'        -- create a new task assigned to the manager of the current approver',
'        l_task_id := apex_approval.create_task(',
'            p_application_id => :APP_ID,',
'            p_task_def_static_id => ''FORM_IT_REQUEST'',',
'            p_initiator => :EMPLOYEE_ID, -- ensure initiator is the original requestor and not the current task owner',
'            p_parameters => apex_approval.t_task_parameters(',
'                1 => apex_approval.t_task_parameter(static_id => ''PEMINTA'',  string_value => :PEMINTA),',
'                2 => apex_approval.t_task_parameter(static_id => ''JABATAN_PEMINTA'', string_value => :JABATAN_PEMINTA),',
'                3 => apex_approval.t_task_parameter(static_id => ''ID'',      string_value => l_request_id),',
'                4 => apex_approval.t_task_parameter(static_id => ''STATUS'',      string_value => l_req_status),',
'                5 => apex_approval.t_task_parameter(static_id => ''LOKASI_PEMINTA'',      string_value => :LOKASI_PEMINTA),',
'                6 => apex_approval.t_task_parameter(static_id => ''PENGGUNA'',      string_value => :PENGGUNA),',
'                7 => apex_approval.t_task_parameter(static_id => ''NIK_PENGGUNA'',      string_value => :NIK_PENGGUNA),',
'                8 => apex_approval.t_task_parameter(static_id => ''JABATAN_PENGGUNA'',      string_value => :JABATAN_PENGGUNA),',
'                9 => apex_approval.t_task_parameter(static_id => ''LOKASI_PENGGUNA'',      string_value => :LOKASI_PENGGUNA),',
'               10 => apex_approval.t_task_parameter(static_id => ''APPROVER1'',      string_value => :APPROVER1),',
'               11 => apex_approval.t_task_parameter(static_id => ''APPROVER2'',      string_value => :APPROVER2),',
'               12 => apex_approval.t_task_parameter(static_id => ''NIK_PEMINTA'',      string_value => :NIK_PEMINTA)    ',
'        ),',
'        p_detail_pk => :APEX$TASK_PK',
'    );',
'end if;',
'end;'))
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(34350829490847016366)
,p_task_def_id=>wwv_flow_imp.id(34327980652036036625)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'SQL_QUERY'
,p_value=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select email_supervisor',
'from nti_employee_tbl',
'where 1=1',
'and email_employee = :APP_USER'))
);
wwv_flow_imp.component_end;
end;
/
