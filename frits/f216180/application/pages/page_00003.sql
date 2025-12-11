prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
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
 p_id=>3
,p_name=>'Form Permintaan IT'
,p_alias=>'FORM-PERMINTAAN-IT'
,p_step_title=>'Form Permintaan IT'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30537651782232534194)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30537653118996534277)
,p_plug_name=>'Form Permintaan IT'
,p_region_name=>'form_permintaan_it'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(30016878494109567695)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'NTI_FORM_REQUEST_IT_TBL'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(30537673368674534290)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P3_ID_1'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(30537672339154534290)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(30537673757954534290)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(30016952178321567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Request'
,p_button_position=>'CREATE'
,p_confirm_message=>'Anda Yakin ?'
,p_button_condition=>'P3_ID_1'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(30537672968325534290)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P3_ID_1'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(30537674085729534290)
,p_branch_name=>'Go To Page 1'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537653467313534277)
,p_name=>'P3_ID_1'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id 1'
,p_source=>'ID_1'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(30016949596162567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537653830827534278)
,p_name=>'P3_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537654220363534278)
,p_name=>'P3_TICKET_NUM'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Ticket Number'
,p_source=>'TICKET_NUM'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(30016949413018567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_inline_help_text=>'Isi dengan nomor Ticket (jika ada)'
,p_attribute_03=>'left'
,p_attribute_04=>'numeric'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537654681047534279)
,p_name=>'P3_NO_URUT_FORM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'No Urut Form'
,p_source=>'NO_URUT_FORM'
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
 p_id=>wwv_flow_imp.id(30537655098000534279)
,p_name=>'P3_TGL_PERMINTAAN'
,p_source_data_type=>'DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Tanggal Permintaan'
,p_source=>'TGL_PERMINTAAN'
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
 p_id=>wwv_flow_imp.id(30537655499341534279)
,p_name=>'P3_PEMINTA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Peminta'
,p_source=>'PEMINTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select employee_name',
'from nti_employee_tbl',
'order by 1 asc'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537655851637534280)
,p_name=>'P3_NIK_PEMINTA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'NIK Peminta'
,p_source=>'NIK_PEMINTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select employee_id',
'from nti_employee_tbl',
'where employee_name =:P3_PEMINTA'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537656295440534280)
,p_name=>'P3_JABATAN_PEMINTA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Jabatan Peminta'
,p_source=>'JABATAN_PEMINTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537656695968534280)
,p_name=>'P3_LOKASI_PEMINTA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Lokasi Peminta'
,p_source=>'LOKASI_PEMINTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Kudus;Kudus,Jakarta;Jakarta'
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537657077403534280)
,p_name=>'P3_PENGGUNA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Pengguna'
,p_source=>'PENGGUNA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select employee_name',
'from nti_employee_tbl',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537657468940534281)
,p_name=>'P3_NIK_PENGGUNA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'NIK Pengguna'
,p_source=>'NIK_PENGGUNA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select employee_id',
'from nti_employee_tbl',
'where employee_name = :P3_PENGGUNA'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537657849309534281)
,p_name=>'P3_JABATAN_PENGGUNA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Jabatan Pengguna'
,p_source=>'JABATAN_PENGGUNA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537658289481534281)
,p_name=>'P3_LOKASI_PENGGUNA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Lokasi Pengguna'
,p_source=>'LOKASI_PENGGUNA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Jakarta;Jakarta,Kudus;Kudus'
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537658655830534281)
,p_name=>'P3_MANDATORY_HD_SOFT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Mandatory Harddisk Software'
,p_source=>'MANDATORY_HD_SOFT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Notebook;Notebook,Mouse;Mouse,Mouse Pad;Mouse Pad,PC;PC,CPU;CPU,HRIS / HCM;HRIS / HCM,Email;Email'
,p_field_template=>wwv_flow_imp.id(30016949413018567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'3'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537659087829534282)
,p_name=>'P3_OPSIONAL_HD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Opsional Harddisk'
,p_source=>'OPSIONAL_HD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Memory;Memory,Harddisk;Harddisk,Monitor;Monitor,Keyboard;Keyboard,Printer;Printer,Flashdisk;Flashdisk,Processor;Processor,Motherboard;Motherboard,Casing;Casing'
,p_field_template=>wwv_flow_imp.id(30016949596162567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'4'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537659429642534282)
,p_name=>'P3_OPSIONAL_SOFT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Opsional Software'
,p_source=>'OPSIONAL_SOFT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Autocad;Autocad,Adobe Photoshop;Adobe Photoshop,Adobe Illustrator;Adobe Illustrator,Adobe Creative Cloud;Adobe Creative Cloud,Corel Draw;Corel Draw,Zoom;Zoom,Backup File;Backup File'
,p_field_template=>wwv_flow_imp.id(30016949413018567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'4'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537659859478534282)
,p_name=>'P3_HAK_AKSES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Hak Akses'
,p_source=>'HAK_AKSES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Oracle EBS;Oracle EBS,Tableau;Tableau,VPN;VPN,NextCloud;NextCloud'
,p_field_template=>wwv_flow_imp.id(30016949596162567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'3'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537660270139534282)
,p_name=>'P3_KETERANGAN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Keterangan'
,p_source=>'KETERANGAN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(30016949413018567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_inline_help_text=>'Diisi dengan keterangan tambahan sesuai dengan pilihan diatas ataupun jika belum ada pilihan'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537660648654534283)
,p_name=>'P3_APPROVER1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Approver Manager'
,p_source=>'APPROVER1'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537661067826534283)
,p_name=>'P3_EMAIL_APPROVER1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Email Manager'
,p_source=>'EMAIL_APPROVER1'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537661459851534283)
,p_name=>'P3_APPROVER2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Approver IT'
,p_source=>'APPROVER2'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537661836916534284)
,p_name=>'P3_EMAIL_APPROVER2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Email Approver IT'
,p_source=>'EMAIL_APPROVER2'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(30016950363870567731)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537662207765534284)
,p_name=>'P3_CREATED_BY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_source=>'CREATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537662643467534284)
,p_name=>'P3_CREATION_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_source=>'CREATION_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537663017195534284)
,p_name=>'P3_UPDATED_BY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_source=>'UPDATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537663487542534285)
,p_name=>'P3_UPDATED_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_source=>'UPDATED_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30537663832416534285)
,p_name=>'P3_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_item_source_plug_id=>wwv_flow_imp.id(30537653118996534277)
,p_prompt=>'Status'
,p_source=>'STATUS'
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35350711137485511749)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
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
'case when :P3_LOKASI_PEMINTA =''Kudus'' ',
'then select ''KDS'' into v_lokasi from dual;',
'else select ''JKT'' into v_lokasi from dual;',
'end case;',
'',
'case when :P3_LOKASI_PEMINTA =''Kudus'' ',
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
'select v_number||''/CSIT/''||v_lokasi||''/''||v_bulan||''/''||v_tahun into :P3_NO_URUT_FORM from dual;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35350711137485511749
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(30537674957580534292)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(30537653118996534277)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Submit Form Permintaan IT'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'NTI_FORM_REQUEST_IT_TBL'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Submission Gagal !'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(30537673757954534290)
,p_process_success_message=>'Submission berhasil !'
,p_internal_uid=>30537674957580534292
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(33669873582506552407)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Ambil Nama User Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select employee_name, employee_id,position_title, supervisor_name,email_supervisor,''SONGKY HARTANTO'',''SONGKY.HARTANTO@NOJORONO.COM'',''PENDING''',
'into :P3_PEMINTA, :P3_NIK_PEMINTA,:P3_JABATAN_PEMINTA,:P3_APPROVER1,:P3_EMAIL_APPROVER1,:P3_APPROVER2,:P3_EMAIL_APPROVER2,:P3_STATUS',
'from nti_employee_tbl',
'where 1=1',
'and email_employee = :APP_USER;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>33669873582506552407
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(30537674559968534291)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(30537653118996534277)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Form Permintaan IT'
,p_internal_uid=>30537674559968534291
);
wwv_flow_imp.component_end;
end;
/
