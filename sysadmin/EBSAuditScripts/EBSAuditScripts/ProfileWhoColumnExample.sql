
/*
Copyright (c) 2015 Oracle Corporation  - All rights reserved.

This script is intended to provide an example of how to query and join WHO 
columns with an E-Business Suite table.

This specific example queries the WHO columns for the profile values table - and 
reports on any changes to these tables in the last 10 days.  

The joins demonstrated here should be similar for most E-Business Suite tables.
*/

set pagesize 1000
set linesize 200

col Created format a15
col Updated format a15
col value format a35
col "Internal name" format a25

select p.profile_option_name "Internal name",
        fpv.PROFILE_OPTION_VALUE value,
        cr.user_name "Created",
        to_char(fpv.creation_date,'DD-MON-RRRR HH24:MI:SS') "Creation Date", 
        upd.user_name "Updated",
        to_char(fpv.last_update_date,'DD-MON-RRRR HH24:MI:SS') "Update Date",
        to_char(ll.start_time,'DD-MON-RRRR HH:MI:SS') "Login Time"
from fnd_profile_options p,
         fnd_profile_option_values fpv, 
     fnd_user upd, 
     fnd_user cr, 
     fnd_logins ll
where p.profile_option_id = fpv.profile_option_id (+)
and fpv.last_updated_by=upd.user_id (+)
and fpv.created_by=cr.user_id (+)
and fpv.last_update_login=ll.login_id (+)
and fpv.last_update_date > sysdate-10;
