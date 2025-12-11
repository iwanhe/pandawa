prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>30014105435788499543
,p_default_application_id=>216180
,p_default_id_offset=>0
,p_default_owner=>'WKSP_NTIAPPS'
);
wwv_flow_imp_page.create_page(
 p_id=>14
,p_name=>'Apply Form Request IT'
,p_alias=>'APPLY-FORM-REQUEST-IT'
,p_step_title=>'Apply Form Request IT'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(34915275483721187616)
,p_plug_name=>'New Form Request IT'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(30016878494109567695)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.empno, e.emp_name, m.emp_name as mgr_name',
'  from emp_1 e, emp_1 m',
' where m.empno(+)=e.mgr',
'   and e.empno=:P14_EMPNO'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35334678823450208085)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(30016890816650567701)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(30015774598384567639)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(30016953640354567734)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35350707553448511713)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(34915278758686187649)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_button_name=>'SUBMIT_REQUEST'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Request'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(35350708422422511722)
,p_branch_name=>'Go To Page 11'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915275622461187618)
,p_name=>'P14_EMPNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_item_source_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_source=>'EMPNO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915275750519187619)
,p_name=>'P14_EMP_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_item_source_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'Peminta'
,p_source=>'EMP_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915275852345187620)
,p_name=>'P14_MGR_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_item_source_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'Approver'
,p_source=>'MGR_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(30016949413018567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915276060384187622)
,p_name=>'P14_JABATAN_PEMINTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'Jabatan Peminta'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select distinct position_title from nti_employee_tbl'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>250
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Pilih jabatan atau ketik jika tidak ada'
,p_inline_help_text=>'Hindari special character ampersand &, asterisk *, braces, brackets, comma'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'2'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915276162434187623)
,p_name=>'P14_LOKASI_PEMINTA'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'Lokasi Peminta'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:KUDUS;KUDUS,JAKARTA;JAKARTA'
,p_field_template=>wwv_flow_imp.id(30016949596162567731)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915276222616187624)
,p_name=>'P14_PENGGUNA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'Pengguna'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select employee_name from nti_employee_tbl'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Isi dengan nama pengguna, pilih dari daftar, jika tidak maka diketik manual'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'1'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915276336745187625)
,p_name=>'P14_JABATAN_PENGGUNA'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'Jabatan Pengguna'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select distinct position_title from nti_employee_tbl'
,p_lov_display_null=>'YES'
,p_cSize=>50
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Pilih jabatan atau ketik jika tidak ada'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'1'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915276468519187626)
,p_name=>'P14_LOKASI_PENGGUNA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'Lokasi Pengguna'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:JAKARTA;JAKARTA,KUDUS;KUDUS'
,p_field_template=>wwv_flow_imp.id(30016949596162567731)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915276505544187627)
,p_name=>'P14_MANDATORY_HD_SOFT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'Mandatory Harddisk - Software'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:NOTEBOOK;NOTEBOOK,MOUSE;MOUSE,MOUSE PAD;MOUSE PAD,PC;PC,UNIT CPU;UNIT CPU,EMAIL;EMAIL,HRIS;HRIS'
,p_field_template=>wwv_flow_imp.id(30016949413018567731)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915276633659187628)
,p_name=>'P14_OPTIONAL_SOFT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'Optional Software - Hardware'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:AUTOCAD;AUTOCAD,ADOBE PHOTOSHOP;ADOBE PHOTOSHOP,ADOBE ILLUSTRATOR;ADOBE ILLUSTRATOR,ADOBE CREATIVE CLOUD;ADOBE CREATIVE CLOUD,COREL DRAW;COREL DRAW,ZOOM;ZOOM,BACKUP FILE;BACKUP FILE,MEMORY;MEMORY,HARDDISK;HARDDISK,MONITOR;MONITOR,KEYBOARD;KEY'
||'BOARD,PRINTER;PRINTER,FLASHDISK;FLASHDISK,PROCESSOR;PROCESSOR,MOTHERBOARD;MOTHERBOARD,CASING;CASING'
,p_field_template=>wwv_flow_imp.id(30016949413018567731)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'4'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915276799058187629)
,p_name=>'P14_OPTIONAL_HD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'Hak Akses'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:ORACLE EBS;ORACLE EBS,TABLEAU;TABLEAU,PAYROLL;PAYROLL,VPN;VPN,NEXTCLOUD;NEXTCLOUD'
,p_field_template=>wwv_flow_imp.id(30016949413018567731)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'4'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915276861274187630)
,p_name=>'P14_KETERANGAN'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'Keterangan'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(30016949413018567731)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Isi dengan keterangan lengkap jikalau belum ada pilihan dari beberapa field diatas'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34915276958847187631)
,p_name=>'P14_APPROVER_IT'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'IT Request Type'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:PEMBELIAN IT;PEMBELIAN IT,HR RECRUITMENT JAKARTA;HR RECRUITMENT JAKARTA,HR RECRUITMENT KUDUS;HR RECRUITMENT KUDUS'
,p_field_template=>wwv_flow_imp.id(30016949413018567731)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35350711200563511750)
,p_name=>'P14_NO_FORM'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(34915275483721187616)
,p_prompt=>'No Form'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(30016949596162567731)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(34915277134173187633)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CREATE_TASK'
,p_process_name=>'Submit Form Request'
,p_attribute_01=>wwv_flow_imp.id(35328024760311997467)
,p_attribute_05=>'P14_EMPNO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(34915278758686187649)
,p_process_success_message=>'Form Request IT berhasil dilakukan submission'
,p_internal_uid=>34915277134173187633
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915277293696187634)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330262585645573792)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_APPROVER_IT'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915277365042187635)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330262135561573792)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_MGR_NAME'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915277419027187636)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330258524331573790)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_JABATAN_PEMINTA'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915277500898187637)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330259745591573790)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_JABATAN_PENGGUNA'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915277684655187638)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330261742738573792)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_KETERANGAN'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915277757435187639)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330258989725573790)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_LOKASI_PEMINTA'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915277857458187640)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330260136647573791)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_LOKASI_PENGGUNA'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915277938687187641)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330260544156573791)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_MANDATORY_HD_SOFT'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915278083977187642)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330261382082573791)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_OPTIONAL_HD'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915278135916187643)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330260922518573791)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_OPTIONAL_SOFT'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915278255781187644)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330258151594573790)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_EMP_NAME'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915278357010187645)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330259312181573790)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_PENGGUNA'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915278403016187646)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330257733482573789)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(34915278529784187647)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(35330262960473573792)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'STATIC'
,p_value=>'PENDING'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(46462108007239630610)
,p_page_id=>14
,p_task_def_param_id=>wwv_flow_imp.id(46462107736567630608)
,p_page_process_id=>wwv_flow_imp.id(34915277134173187633)
,p_value_type=>'ITEM'
,p_value=>'P14_NO_FORM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35350707435529511712)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(34915275483721187616)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form New Form Request IT'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35350707435529511712
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35350708541469511723)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SEND_EMAIL'
,p_process_name=>'Send Email'
,p_attribute_01=>'&APP_EMAIL.'
,p_attribute_02=>'&P14_MGR_NAME.'
,p_attribute_03=>'&P14_EMP_NAME., nti-mis@nojorono.com'
,p_attribute_05=>'nti-mis@nojorono.com'
,p_attribute_10=>'Y'
,p_attribute_11=>wwv_flow_imp.id(43230812872246980790)
,p_attribute_12=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    "P14_APPROVER_IT": "&P14_APPROVER_IT.",',
'    "P14_NO_FORM": "&P14_NO_FORM.",',
'    "P14_LOKASI_PEMINTA": "&P14_LOKASI_PEMINTA.",',
'    "P14_PENGGUNA": "&P14_PENGGUNA.",',
'    "P14_MGR_NAME": "&P14_MGR_NAME.",',
'    "P14_EMP_NAME": "&P14_EMP_NAME.",',
'    "P14_JABATAN_PEMINTA": "&P14_JABATAN_PEMINTA.",',
'    "P14_LOKASI_PENGGUNA": "&P14_LOKASI_PENGGUNA.",',
'    "P14_MANDATORY_HD_SOFT": "&P14_MANDATORY_HD_SOFT.",',
'    "P14_OPTIONAL_SOFT": "&P14_OPTIONAL_SOFT.",',
'    "P14_OPTIONAL_HD": "&P14_OPTIONAL_HD.",',
'    "P14_KETERANGAN": "&P14_KETERANGAN."',
'}'))
,p_process_error_message=>'Email tidak terkirim'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'dan Email berhasil terkirim, Cek email Anda...'
,p_internal_uid=>35350708541469511723
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(46470523377864849904)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SEND_PUSH_NOTIFICATION'
,p_process_name=>'Send Push Notification'
,p_attribute_01=>'&P14_MGR_NAME.'
,p_attribute_02=>'Pesan dari &P14_APPROVER_IT. - Please Review'
,p_attribute_03=>'&P14_EMP_NAME. mengirimkan anda permintaan dengan Nomor Form &P14_NO_FORM. Mohon review dari email atau aplikasi FRITS untuk approval'
,p_attribute_04=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::P10_TASK_ID:&P10_TASK_ID.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>46470523377864849904
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(34915277010080187632)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Employee Details for User'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select empno',
'into :P14_EMPNO',
'  from emp_1 ',
' where emp_name=:APP_USER;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>34915277010080187632
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(34915275574221187617)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(34915275483721187616)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Apply Form Request IT'
,p_internal_uid=>34915275574221187617
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(46470523045373849901)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create No Form'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'v_number number;',
'v_lokasi varchar2(50);',
'v_bulan varchar2(50);',
'v_tahun varchar2(50);',
'begin',
'',
'case when :P14_LOKASI_PEMINTA =''KUDUS'' ',
'then select ''KDS'' into v_lokasi from dual;',
'else select ''JKT'' into v_lokasi from dual;',
'end case;',
'',
'case when :P14_LOKASI_PEMINTA =''KUDUS'' ',
'then select NO_FORM_SEQ_KDS.nextval into v_number from dual;',
'else select NO_FORM_SEQ_JKT.nextval into v_number from dual;',
'end case;',
'',
'',
'select to_char(sysdate,''RM'')',
'into v_bulan',
'from dual;',
'',
'select to_char(sysdate,''YY'') into v_tahun from dual;',
'',
'select v_number||''/CSIT/''||v_lokasi||''/''||v_bulan||''/''||v_tahun into :P14_NO_FORM from dual;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Gagal terbentuk nomor request'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Sukses terbentuk Nomor Request'
,p_internal_uid=>46470523045373849901
);
wwv_flow_imp.component_end;
end;
/
