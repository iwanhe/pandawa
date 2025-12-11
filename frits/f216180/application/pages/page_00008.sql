prompt --application/pages/page_00008
begin
--   Manifest
--     PAGE: 00008
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
 p_id=>8
,p_name=>'Help Login'
,p_alias=>'HELP-LOGIN'
,p_page_mode=>'MODAL'
,p_step_title=>'Help Login'
,p_welcome_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Halo, selamat menggunakan aplikasi FRITS (Form Request IT System)</p>',
'<p>Aplikasi ini digunakan untuk beberapa hal berikut:</p>',
'<br/>',
'<ol>',
'    <li>Support Pembelian IT</li>',
'    <li>Registrasi user system (Oracle EBS, OPC)</li>',
'<li>HR Recruitment Jakarta dan Kudus untuk kebutuhan calon Pegawai terkait dengan IT</li>',
'<li>Akses Form Request IT System (FRITS)</li> ',
'</ol>',
'<p>Untuk login, dapat request user dari IT, dan setelah dapat user login dan password pertama kali, dapat melakukan perubahan lewat link berikut: <a data-fr-linked="true" href="https://apex.oracle.com/go/sign-in">https://apex.oracle.com/go/sign-in</a'
||'> dengan mengisi hal berikut:</p>',
'<ol>',
'    <li>Workspace = nti_apps</li>',
'    <li>Username = alamat email</li>',
'    <li>Password = isi dengan password pertama kali</li>',
'</ol>',
'<p>Untuk lebih jelasnya dapat menghubungi IT lewat klik tombol Help di kanan bawah atau submit lewat portal ticket di alamat url berikut: <a href="http://bit.ly/ntisupport" target="_blank" rel="noopener noreferrer">bit.ly/ntisupport</a></p>',
'<p>Regards,</p>',
'<p>IT NTI</p>'))
,p_footer_text=>'Copyright @2023 - Created by Iwan Herdian - NTI MIS'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>'<p><strong>Bagaimana cara login</strong></p>'
,p_step_template=>wwv_flow_imp.id(30015775364420567640)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_page_is_public_y_n=>'Y'
,p_help_text=>'TEST HELP'
,p_page_component_map=>'11'
);
wwv_flow_imp.component_end;
end;
/
