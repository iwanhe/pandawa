/*
Copyright (c) 2015 Oracle Corporation  - All rights reserved.

Detail page flow for a given u for the last 30 days
Login and Logout pages are filtered out for brevity
*/

set pagesize 1000
set linesize 200

col USERNAME format a15
col APPSNAME format a25
col RESPNAME format a25
col PAGENAME format a50
col DESCRIPTION format a15
col DAY format a11
col tech_stack format a10
col statuscode format a10

select 
	sessionid ,
	fu.user_name  as username,
	decode ( js.tech_stack, 'FORM', (select f.form_name from fnd_form_VL f where   f.form_id = js.pagename and  f.application_id = js.appid ) ,'JTF',jp.physical_page_description, pagename) pagename,
	tech_stack,
/*	decode(statusCode,-200,'Forward',-100,'FAILED','OK') statuscode, 
	(select application_name as appsname  FROM fnd_application_vl where fnd_application_vl.APPLICATION_ID=appId) as appsname,  */
	(select fnd_responsibility_vl.RESPONSIBILITY_NAME FROM fnd_responsibility_vl where fnd_responsibility_vl.RESPONSIBILITY_KEY=fr.responsibility_key) as respname,
	TO_CHAR(Day,'DD-MON-YYYY') Day
	/*,startT,
	execT,
	thinkT */
from JTF_PF_SES_ACTIVITY js,
		fnd_responsibility fr,
		jtf_dpf_physical_pages_vl jp,
		fnd_user fu
where   (upper(js.tech_stack)=  'OAF' or upper(js.tech_stack)='AUDIT' or upper(js.tech_stack)='JTF' or upper(js.tech_stack)='FORM')
	    and js.respId = fr.responsibility_id(+) 
	    and js.pagename = jp.physical_page_name(+)
		and fu.user_id=js.userid			
	    and js.pagename not in ('LOGIN','LOGOUT')
		and Day between SYSDATE-30 and SYSDATE 
		and fu.user_name = '&fnd_user'
order by sessionid,startT;																																																						