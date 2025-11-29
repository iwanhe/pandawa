/*
Copyright (c) 2015 Oracle Corporation  - All rights reserved.

Query demonstrating population of E-Business Suite connection tagging context in v$session
*/

set pagesize 1000
set linesize 200

 col STMT format a64
 
 SELECT        SID,
       replace(sql.sql_text,chr(10),'') stmt
  FROM v$session SES,   
       V$SQLtext_with_newlines SQL 
 where SES.SQL_ADDRESS    = SQL.ADDRESS (+)
   and SES.SQL_HASH_VALUE = SQL.HASH_VALUE (+)
   and SES.client_identifier = '&fnd_user'
 order by SID,sql.piece asc;