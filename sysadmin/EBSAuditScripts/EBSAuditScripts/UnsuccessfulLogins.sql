/*
Copyright (c) 2015 Oracle Corporation  - All rights reserved.

Query showing unsuccessful logins for local users in E-Business Suite
*/

set pagesize 1000
set linesize 200

select u.user_name,
ful.user_id, 
to_char(attempt_time,'DD-MON-RRRR HH24:MI:SS') attempt_time
from fnd_unsuccessful_logins ful,
fnd_user u
where ful.user_id = u.user_id (+)
order by attempt_time;

