
/*
Copyright (c) 2015 Oracle Corporation  - All rights reserved.

Session query showing current responsibilities and functions, joining in relevant Login rows
*/

set pagesize 1000
set linesize 200

col USER_NAME format a10
col FIRST_CONNECT format a20
col LAST_CONNECT format a20
col RESPONSIBILITY_NAME format a30
column function_name for a20 wrap
col user_function_name for a35 


select 
    USR.USER_NAME
,   SES.SESSION_ID 
,   to_char(SES.FIRST_CONNECT, 'YYYY/MM/DD HH24:MI:SS') FIRST_CONNECT
,   to_char(SES.LAST_CONNECT, 'YYYY/MM/DD HH24:MI:SS') LAST_CONNECT
,   SES.COUNTER
,   SES.DISABLED_FLAG 
,   to_char(FUL.START_TIME, 'YYYY/MM/DD HH24:MI:SS') START_TIME
,   to_char(FUL.END_TIME, 'YYYY/MM/DD HH24:MI:SS') END_TIME
,   RSP.RESPONSIBILITY_NAME
,	FFF.USER_FUNCTION_NAME
from
    ICX_SESSIONS SES
,   FND_USER USR
,   FND_LOGINS FUL
,   FND_RESPONSIBILITY_TL RSP
,   FND_FORM_FUNCTIONS_VL FFF
where 1=1
/* joins */
AND    SES.LOGIN_ID  = FUL.LOGIN_ID (+)
AND    SES.RESPONSIBILITY_ID = RSP.RESPONSIBILITY_ID (+)
AND    SES.RESPONSIBILITY_APPLICATION_ID = RSP.APPLICATION_ID (+) 
AND    SES.FUNCTION_ID = FFF.FUNCTION_ID (+)
AND    USR.USER_ID (+) = SES.USER_ID
AND    RSP.LANGUAGE (+) = USERENV('LANG') 
/* filters */
and    USR.USER_NAME like nvl(upper('&USER_NAME_FILTER'), '%')
and    SES.FIRST_CONNECT > SYSDATE-61 /* two month history */
order by LAST_CONNECT
/