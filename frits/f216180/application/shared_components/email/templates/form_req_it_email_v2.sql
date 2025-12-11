prompt --application/shared_components/email/templates/form_req_it_email_v2
begin
--   Manifest
--     EMAIL TEMPLATE: FORM REQ IT EMAIL V2
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>30014105435788499543
,p_default_application_id=>216180
,p_default_id_offset=>0
,p_default_owner=>'WKSP_NTIAPPS'
);
wwv_flow_imp_shared.create_email_template(
 p_id=>wwv_flow_imp.id(46611364439235912096)
,p_name=>'FORM REQ IT EMAIL V2'
,p_static_id=>'FORM_REQ_IT_EMAIL_V2'
,p_version_number=>2
,p_subject=>'Re: [#P14_APPROVER_IT#] - #P14_NO_FORM# - LOKASI #P14_LOKASI_PEMINTA# - UNTUK #P14_PENGGUNA#'
,p_html_body=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html>',
'<head>',
'	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>',
'	<title></title>',
'	<meta name="generator" content="LibreOffice 7.5.4.2 (Windows)"/>',
'	<meta name="created" content="2023-07-25T20:18:49.047000000"/>',
'	<meta name="changed" content="2023-07-25T21:02:48.392000000"/>',
'</head>',
'<body lang="en-US" dir="ltr"><p>Approved</p>',
'<p>Dear #P14_MGR_NAME#,</p>',
'<p>Berikut ini permintaan kebutuhan baru, mohon direview dan disetujui:</p>',
'<p>No Urut Form: #P14_NO_FORM# </p>',
'<p>Nama Peminta: #P14_EMP_NAME#</p>',
'<p>Jabatan Peminta: #P14_JABATAN_PEMINTA#</p>',
'<p>Pengguna: #P14_PENGGUNA#</p>',
'<p>Lokasi: #P14_LOKASI_PENGGUNA#</p>',
'<p>Kebutuhan:</p>',
'<p>1. Mandatory Hardware / Software: #P14_MANDATORY_HD_SOFT#</p>',
'<p>2. Optional Hardware / Software: #P14_OPTIONAL_SOFT#</p>',
'<p>3. Hak Akses: #P14_OPTIONAL_HD#</p>',
'<p>4. Keterangan:</p>',
'      <p>#P14_KETERANGAN#</p>',
'',
'<p>Regards,</p>',
'<p>#P14_EMP_NAME#</p>',
'',
'<br/>',
'<br/>',
'<!--a href="https://apex.oracle.com/pls/apex/f?p=216180:13:&SESSION.::&DEBUG.:OWNER,OUTCOME,INITIATOR:#P14_MGR_NAME#,Approved,#P14_EMP_NAME#" id="h1"><button>Approve</button></a--> ',
'<!--a href="https://apex.oracle.com/pls/apex/f?p=216180:13:&SESSION.::&DEBUG.:OWNER,OUTCOME,INITIATOR:#P14_MGR_NAME#,Rejected,#P14_EMP_NAME#" id="h1"><button>Reject</button></a-->',
'<!--a href="https://apex.oracle.com/pls/apex/f?p=216180:9999:&SESSION.::&DEBUG.::P9999_USERNAME,P9999_PASSWORD:IWAN.HERDIAN.ERP@GMAIL.COM,Tohnga1$"><button>Login</button></a-->',
'<a href="mailto:#P14_EMP_NAME#?cc=support@nti-support.freshdesk.com&subject=Re:%20[#P14_APPROVER_IT#]%20-%20LOKASI%20#P14_LOKASI_PEMINTA#%20-%20UNTUK%20#P14_PENGGUNA#&body=Approved',
'',
'Berikut ini permintaan kebutuhan baru, mohon direview oleh IT:',
'',
'Nama Peminta: #P14_EMP_NAME#',
'',
'Jabatan Peminta: #P14_JABATAN_PEMINTA#',
'',
'Pengguna: #P14_PENGGUNA#',
'',
'Lokasi: #P14_LOKASI_PENGGUNA#',
'',
'Kebutuhan:',
'1. Mandatory Hardware / Software: #P14_MANDATORY_HD_SOFT#',
'2. Optional Hardware / Software: #P14_OPTIONAL_SOFT#',
'3. Hak Akses: #P14_OPTIONAL_HD#',
'4. Keterangan: #P14_KETERANGAN#',
'',
'Regards,',
'#P14_MGR_NAME#"><button>Approve</button></a>',
'<a href="mailto:#P14_EMP_NAME#?cc=nti-mis@nojorono.com&subject=Re:%20[#P14_APPROVER_IT#]%20-%20LOKASI%20#P14_LOKASI_PEMINTA#%20-%20UNTUK%20#P14_PENGGUNA#&body=Rejected"><button>Reject</button></a>',
'</body>',
'</html>'))
,p_html_header=>'FORM REQUEST IT SYSTEM (FRITS) - #P14_APPROVER_IT# - #P14_NO_FORM#'
,p_html_footer=>'<a href="https://apex.oracle.com/pls/apex/f?p=216180:9999:&SESSION.::&DEBUG.::"><button>Login Aplikasi</button></a>'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
