prompt --application/shared_components/email/templates/form_req_it_email
begin
--   Manifest
--     EMAIL TEMPLATE: FORM REQ IT EMAIL
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
 p_id=>wwv_flow_imp.id(43230812872246980790)
,p_name=>'FORM REQ IT EMAIL'
,p_static_id=>'FORM_REQ_IT_EMAIL'
,p_version_number=>2
,p_subject=>'[#P14_APPROVER_IT#] #P14_NO_FORM# - LOKASI #P14_LOKASI_PEMINTA# - UNTUK #P14_PENGGUNA#'
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
'<body lang="en-US" dir="ltr"><p>Dear #P14_MGR_NAME#,</p>',
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
'<!--a href="mailto:me@me.com?subject=Me&body=%3Chtml%20xmlns%3D%22http:%2F%2Fwww.w3.org%2F1999%2Fxhtml%22%3E%3C%2Fhead%3E%3Cbody%3EPlease%20%3Ca%20href%3D%22http:%2F%2Fwww.w3.org%22%3Eclick%3C%2Fa%3E%20me%3C%2Fbody%3E%3C%2Fhtml%3E"><button>test</butt'
||'on></a-->',
'<a href="mailto:#P14_EMP_NAME#?cc=support@nti-support.freshdesk.com&subject=Re:%20[#P14_APPROVER_IT#]%20#P14_NO_FORM#%20-%20LOKASI%20#P14_LOKASI_PEMINTA#%20-%20UNTUK%20#P14_PENGGUNA#&body=Approved',
'%0a',
'Berikut ini permintaan kebutuhan baru, mohon direview oleh IT:',
'%0a',
'%0a',
'Nama Peminta: #P14_EMP_NAME#',
'%0a',
'Jabatan Peminta: #P14_JABATAN_PEMINTA#',
'%0a',
'Pengguna: #P14_PENGGUNA#',
'%0a',
'Lokasi: #P14_LOKASI_PENGGUNA#',
'%0a',
'Kebutuhan:',
'%0a',
'1. Mandatory Hardware / Software: #P14_MANDATORY_HD_SOFT#',
'%0a',
'2. Optional Hardware / Software: #P14_OPTIONAL_SOFT#',
'%0a',
'3. Hak Akses: #P14_OPTIONAL_HD#',
'%0a',
'4. Keterangan: #P14_KETERANGAN#',
'%0a',
'%0a',
'Regards,',
'%0a',
'#P14_MGR_NAME#"><button>Approve</button></a>',
'<a href="mailto:#P14_EMP_NAME#?cc=nti-mis@nojorono.com&subject=Re:%20[#P14_APPROVER_IT#]%20-%20LOKASI%20#P14_LOKASI_PEMINTA#%20-%20UNTUK%20#P14_PENGGUNA#&body=Rejected"><button>Reject</button></a>',
'</body>',
'</html>'))
,p_html_header=>'FORM REQUEST IT SYSTEM (FRITS) - #P14_APPROVER_IT#'
,p_html_footer=>'<a href="https://apex.oracle.com/pls/apex/f?p=216180:9999:&SESSION.::&DEBUG.::"><button>Login Aplikasi</button></a>'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
