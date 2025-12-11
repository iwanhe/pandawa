prompt --application/shared_components/workflow/task_definitions/form_request_it_trx
begin
--   Manifest
--     TASK_DEF: FORM_REQUEST_IT_TRX
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
 p_id=>wwv_flow_imp.id(35328024760311997467)
,p_name=>'FORM_REQUEST_IT_TRX'
,p_static_id=>'FORM_REQUEST_IT_TRX'
,p_subject=>'&NO_FORM. - LOKASI &LOKASI_PEMINTA. - TYPE PERMINTAAN &APPROVER_IT. - FORM REQUEST IT UNTUK &PENGGUNA. DARI &PEMINTA.'
,p_task_type=>'APPROVAL'
,p_priority=>2
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_details_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP,13:P13_TASK_ID:&TASK_ID.'
,p_actions_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.empno, e.emp_name, m.emp_name as mgr_name ',
'  from emp_1 e, emp_1 m ',
' where m.empno(+)=e.mgr',
'   and e.empno=:APEX$TASK_PK'))
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330257733482573789)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Request ID'
,p_static_id=>'REQ_ID'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>false
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330258151594573790)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Peminta'
,p_static_id=>'PEMINTA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330258524331573790)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Jabatan Peminta'
,p_static_id=>'JABATAN_PEMINTA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330258989725573790)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Lokasi Peminta'
,p_static_id=>'LOKASI_PEMINTA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330259312181573790)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Pengguna'
,p_static_id=>'PENGGUNA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330259745591573790)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Jabatan Pengguna'
,p_static_id=>'JABATAN_PENGGUNA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330260136647573791)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Lokasi Pengguna'
,p_static_id=>'LOKASI_PENGGUNA'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330260544156573791)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Mandatory Hd Soft'
,p_static_id=>'MANDATORY_HD_SOFT'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330260922518573791)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Optional Soft'
,p_static_id=>'OPTIONAL_SOFT'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330261382082573791)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Optional Hd'
,p_static_id=>'OPTIONAL_HD'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330261742738573792)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Keterangan'
,p_static_id=>'KETERANGAN'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330262135561573792)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Approver Mgr'
,p_static_id=>'APPROVER_MGR'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330262585645573792)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Approver It'
,p_static_id=>'APPROVER_IT'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(35330262960473573792)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'Status'
,p_static_id=>'STATUS'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(46462107736567630608)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_label=>'No Form'
,p_static_id=>'NO_FORM'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(35331881694456615989)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_name=>'CREATE_FORM_REQUEST_ENTRY'
,p_execution_sequence=>10
,p_on_event=>'CREATE'
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_req_id number;',
'begin',
'    if :APP_USER = :EMP_NAME then --this is the original initiator',
'        l_req_id := :APEX$TASK_ID;',
'        -- create a new record in the Form Request table FORM_REQUEST_IT_TRX',
'        insert into FORM_REQUEST_IT_TRX values ',
'        (to_number(l_req_id),',
'        :EMPNO,',
'        :PEMINTA,',
'        :JABATAN_PEMINTA,',
'        :LOKASI_PEMINTA,',
'        :PENGGUNA,',
'        :JABATAN_PENGGUNA,',
'        :LOKASI_PENGGUNA,',
'        :MANDATORY_HD_SOFT,',
'        :OPTIONAL_SOFT,',
'        :OPTIONAL_HD,',
'        :KETERANGAN,',
'        :APPROVER_MGR,',
'        :APPROVER_IT,',
'        '''',',
'       ''PENDING'',',
'       :NO_FORM);',
'    end if;',
'end;'))
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(35334490277405697120)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_name=>'NEXT_APPROVER_OR_UPDATE_STATUS'
,p_execution_sequence=>20
,p_outcome=>'APPROVED'
,p_on_event=>'COMPLETE'
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_mgr number;',
'    l_task_id number;',
'    l_request_id number;',
'    l_req_status varchar2(10) :=''PENDING'';',
'    p_to varchar2(50);',
'    p_template_static_id varchar2(50);',
'begin',
'',
'    select mgr into l_mgr from emp_1 where emp_name=:APP_USER;',
'    if :APP_USER = :MGR_NAME then --this is the first approver',
'       -- set the request id to be the id of the task created when the request was submitted',
'       l_request_id := :APEX$TASK_ID; ',
'    else',
'       -- this is an intermediate approver, set the request id from the corresponding task parameter value',
'       l_request_id := :REQ_ID; ',
'    end if;',
'    if l_mgr is null /*or :TRAVEL_COST < 50000*/ then -- the approval is complete',
'',
'        update FORM_REQUEST_IT_TRX set status = ''APPROVED'', updated_by=updated_by||''->''||:APP_USER',
'         where req_id = l_request_id and emp_no=:APEX$TASK_PK;',
'',
'        l_req_status := ''APPROVED'';',
'',
'        /*updated by iwan herdian*/',
'',
'        /*apex_mail.send(',
'            p_to => ''iwan.herdian.erp@gmail.com'',',
'            p_template_static_id => ''FORM_REQ_IT_EMAIL_V2'',',
'            p_placeholders       => ''',
'        {',
'            "CUSTOMER_NAME": "Steven King",',
'            "ORDER_NUMBER": 1234,',
'            "ORDER_DATE": "02-Feb-2018",',
'            "SHIP_TO": "Steven King",',
'            "SHIPPING_ADDRESS_LINE_1": "2004 Charade Rd",',
'            "SHIPPING_ADDRESS_LINE_2": "Seattle, Washinton",',
'            "ITEMS_ORDERED": 3,',
'            "ORDER_TOTAL": "$ 1,200.99",',
'            "ORDER_URL": "http://domain/apex/f?p=&APP_ID"        ',
'         }''',
'        );',
'        apex_mail.push_queue;*/',
'    else -- the request needs to go through another level of approval',
'        -- updated the request record with details of the current approver in the chain of approvers',
'        update FORM_REQUEST_IT_TRX set updated_by = updated_by||''->''||:APEX$TASK_OWNER ',
'         where req_id = l_request_id ',
'           and emp_no=:APEX$TASK_PK;',
'        -- create a new task assigned to the manager of the current approver',
'        l_task_id := apex_approval.create_task(',
'            p_application_id => :APP_ID,',
'            p_task_def_static_id => ''FORM_REQUEST_IT_TRX'',',
'            p_initiator => :EMP_NAME, -- ensure initiator is the original requestor and not the current task owner',
'            p_parameters => apex_approval.t_task_parameters(',
'                1 => apex_approval.t_task_parameter(static_id => ''PEMINTA'', string_value => :PEMINTA),',
'                2 => apex_approval.t_task_parameter(static_id => ''JABATAN_PEMINTA'',  string_value => :JABATAN_PEMINTA),',
'                3 => apex_approval.t_task_parameter(static_id => ''LOKASI_PEMINTA'', string_value => :LOKASI_PEMINTA),',
'                4 => apex_approval.t_task_parameter(static_id => ''PENGGUNA'', string_value => :PENGGUNA),',
'                5 => apex_approval.t_task_parameter(static_id => ''JABATAN_PENGGUNA'', string_value => :JABATAN_PENGGUNA),',
'                6 => apex_approval.t_task_parameter(static_id => ''LOKASI_PENGGUNA'', string_value => :LOKASI_PENGGUNA),',
'                7 => apex_approval.t_task_parameter(static_id => ''MANDATORY_HD_SOFT'', string_value => :MANDATORY_HD_SOFT),',
'                8 => apex_approval.t_task_parameter(static_id => ''OPTIONAL_SOFT'', string_value => :OPTIONAL_SOFT),',
'                9 => apex_approval.t_task_parameter(static_id => ''OPTIONAL_HD'', string_value => :OPTIONAL_HD),',
'               10 => apex_approval.t_task_parameter(static_id => ''KETERANGAN'', string_value => :KETERANGAN),',
'               11 => apex_approval.t_task_parameter(static_id => ''APPROVER_MGR'', string_value => :APPROVER_MGR),',
'               12 => apex_approval.t_task_parameter(static_id => ''APPROVER_IT'', string_value => :APPROVER_IT),',
'               13 => apex_approval.t_task_parameter(static_id => ''REQ_ID'',      string_value => l_request_id),',
'               14 => apex_approval.t_task_parameter(static_id => ''STATUS'',      string_value => l_req_status),',
'               15 => apex_approval.t_task_parameter(static_id => ''NO_FORM'',      string_value => :NO_FORM)',
'        ),',
'        p_detail_pk => :APEX$TASK_PK',
'    );',
'end if;',
'end;'))
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(35335104957531705325)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_name=>'UPDATE_REQUEST_STATUS'
,p_execution_sequence=>30
,p_outcome=>'REJECTED'
,p_on_event=>'COMPLETE'
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_mgr number;',
'    l_task_id number;',
'    l_request_id number;',
'    l_req_status varchar2(10) :=''PENDING'';',
'begin',
'',
'    select mgr into l_mgr from emp_1 where emp_name=:APP_USER;',
'    if :APP_USER = :MGR_NAME then --this is the first approver',
'        l_request_id := :APEX$TASK_ID;',
'    else',
'        l_request_id := :REQ_ID;',
'end if;',
' -- the request is complete and rejected',
'',
'update FORM_REQUEST_IT_TRX set status = ''REJECTED'', updated_by=updated_by||''->''||:APP_USER',
' where req_id = l_request_id and emp_no=:APEX$TASK_PK;',
'end;'))
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(35328529761653002634)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'SQL_QUERY'
,p_value=>'select emp_name from emp_1 where empno=(select mgr from emp_1 where empno=(select empno from emp_1 where emp_name=:APP_USER))'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(46018211628345129661)
,p_task_def_id=>wwv_flow_imp.id(35328024760311997467)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'nti-mis@nojorono.com'
);
wwv_flow_imp.component_end;
end;
/
