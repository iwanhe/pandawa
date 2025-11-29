/*
Copyright (c) 2015 Oracle Corporation  - All rights reserved.

Query Summary of Page Access Tracking sessions by FND user
*/

set pagesize 1000
set linesize 200

col USER_NAME format a15
col FIRST_CONNECT format a20
col LAST_CONNECT format a20
col RESPONSIBILITY_NAME format a30
column function_name for a20 wrap
col user_function_name for a35 


select MAX(Day) Day,
sessionid,
user_name as user_name,
decode(SUM(DECODE(TECH_STACK, 'JTF', 1, 'OAF', 1, 'FORM', 1,'AUDIT',1, 0)),  
		0, '', 
		sum(decode(tech_stack, 'JTF', 1, 0)),'JTF', 
		sum(decode(tech_stack,  'OAF', 1, 0)), 'OAF', 
		sum(decode(tech_stack,'FORM', 1, 'AUDIT', 1, 0)),  'FORM', 
		sum(decode(tech_stack, 'JTF', 1, 'OAF', 1, 0)),  'JTF, OAF', 
		sum(decode(tech_stack, 'JTF', 1, 'FORM', 1, 'AUDIT', 1, 0)), 'JTF, FORM',  
		sum(decode(tech_stack, 'OAF', 1, 'FORM', 1,  'AUDIT', 1, 0)), 'OAF, FORM', 
		'JTF, OAF, FORM') tech_stacks,
SUM(DECODE(TECH_STACK, 'JTF', 1, 'OAF', 1, 'FORM', 1,'AUDIT',1, 0)) pages_all
/*,SUM(exect)/ COUNT(*)/1000 avg_execT,
to_date(Min(first_appearance),'HH:mm:ss') as first_appearance,
Max(last_appearance) as last_appearance */
from (select 
	JTF_PF_SESSION_SUMM.startt first_appearance,  
	JTF_PF_SESSION_SUMM.endt last_appearance,
	execT,
	decode(appid,null,-1,appid) as appId,
	JTF_PF_ALL_ACTIVITY_VL.sessionid as sessionid,  
	fnd_user.user_name as user_name,
	decode(JTF_PF_ALL_ACTIVITY_VL.userid,null,-1,JTF_PF_ALL_ACTIVITY_VL.userid) as userid,  
	decode(respid,null,-1,respid) as respid,decode(pagename,null,'-1','','-1',pagename) as pagename,
	tech_stack,decode(langid,null,  '-1','','-1',langid) as langid,JTF_PF_ALL_ACTIVITY_VL.day as day 
	from JTF_PF_ALL_ACTIVITY_VL,fnd_user,JTF_PF_SESSION_SUMM 
	where fnd_user.user_id(+)=  JTF_PF_ALL_ACTIVITY_VL.userid and JTF_PF_ALL_ACTIVITY_VL.sessionid = JTF_PF_SESSION_SUMM.sessionid(+) ) X  
where Day between sysdate-30
AND sysdate
and user_name = '&fnd_user'
group by sessionid,user_name  order by SESSIONID;
