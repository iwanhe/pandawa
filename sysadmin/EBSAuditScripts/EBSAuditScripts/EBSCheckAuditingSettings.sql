REM ----------------------------------------------------------------------------
REM Copyright (c) 2015 Oracle Corporation  - All rights reserved.
REM run as APPS (really <FNDNAM>)
REM Usage: SQL> @EBSCheckAuditingSettings.sql
REM
REM This script will list areas where auditing configuration is different from the 
REM E-Business Suite guidance.
REM See the Auditing section of the E-Business Suite Security Admin Guide for more information
REM
REM ----------------------------------------------------------------------------

column "Internal Name" format A23
column "Profile Name" format A30
column "Profile Level" format a15
column "Profile Context" format a25
column "Value" format A10 wrap
column "Last Updated" format a12


select p.profile_option_name "Internal name",
n.user_profile_option_name "Profile name",
to_char(v.last_update_date,'DD-MON-RR') "Last Updated",
decode(v.level_id,
10001, 'Site',
10002, 'Application',
10003, 'Responsibility',
10004, 'User',
10005, 'Server',
10007, 'SERVRESP',
'UnDef') "Profile Level",
decode(to_char(v.level_id),
'10001', '',
'10002', app.application_short_name,
'10003', rsp.responsibility_key,
'10005', svr.node_name,
'10006', org.name,
'10004', usr.user_name,
'10007', 'Serv/resp',
'UnDef') "Profile Context",
v.profile_option_value "Value",
decode(p.profile_option_name,
'AFLOG_ENABLED','Debug Logging should be On at Site level',
'AFLOG_LEVEL','Logging should be set to at least Unexpected at Site level',
'SIGNONAUDIT:LEVEL','Sign-on audit should be set to Forms at Site level',
'') "Recommendation"
from fnd_profile_options p,
fnd_profile_option_values v,
fnd_profile_options_tl n,
fnd_user usr,
fnd_application app,
fnd_responsibility rsp,
fnd_nodes svr,
hr_operating_units org
where p.profile_option_id = v.profile_option_id (+)
and p.profile_option_name = n.profile_option_name
and n.language = 'US'
and ((p.profile_option_name = 'AFLOG_ENABLED' and v.level_id=10001 and v.profile_option_value !='Y') -- Recommend that logging is set to Unexpected at Site level
     or (p.profile_option_name = 'AFLOG_LEVEL' and v.level_id=10001 and v.profile_option_value > 6) -- Recommend that logging is set to at least Unexpected at Site level
	 or (p.profile_option_name = 'SIGNONAUDIT:LEVEL' and v.level_id=10001 and v.profile_option_value !='D') -- Recommend that sign-on audit be set to Forms at Site level
	 )
and usr.user_id (+) = v.level_value
and rsp.application_id (+) = v.level_value_application_id
and rsp.responsibility_id (+) = v.level_value
and app.application_id (+) = v.level_value
and svr.node_id (+) = v.level_value
and org.organization_id (+) = v.level_value
order by p.profile_option_name, "Profile Level";

REM ----------------------------------------------------------------------------
REM Check DB audit settings (traditional auditing)
REM ----------------------------------------------------------------------------

REM Check Audit Trail setting

select 'audit_trail be set to DB or FILE' "Recommendation" 
from v$parameter 
where name ='audit_trail' and value='NONE';      

REM Check Audit Sys Operations setting

select 'audit_sys_operations should be set to TRUE' "Recommendation" 
from v$parameter 
where name ='audit_sys_operations' and value != 'TRUE';      

