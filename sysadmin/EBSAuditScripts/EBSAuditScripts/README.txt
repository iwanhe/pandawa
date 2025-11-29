== EBS Audit Scripts README
== Version 1.2
== Copyright (c) 2015 - 2020 Oracle Corporation  - All rights reserved.
================================================================================

This README file describes the audit scripts included in the zip archive EBSAuditScripts.zip.  
The latest version can be found attached to
My Oracle Support Note 2069190.1 - Security Configuration and Auditing Scripts for Oracle E-Business Suite.

Documentation on the various auditing features that can be used in E-Business Suite and more 
information on these scripts can be found in the Oracle E-Business Suite Release 12.2, Security Administration Guide.

The EBSAuditScripts.zip contains a variety of scripts which provide guidance for configuring 
E-Business Suite to follow our auditing guidance.  It also contains example queries which show how 
to query various auditing records.

Configure DB Auditing
- SystemPrivAuditing.sql - configure System and Privilege auditing for the Database
- EBSObjectAuditing.sql - configure Object level auditing per E-Business Suite guidance

Check the Auditing and Logging Settings 
- EBSCheckAuditingSettings.sql - Check the E-Business Suite profiles against the recommended settings

Login and Session Queries
- SessLoginResponsibilites.sql - Session query showing current responsibilities and functions, joining in relevant Login rows
- LoginSessResponsibilites.sql - Login query showing current responsibilities and functions, joining in relevant Login rows (more verbose)
- v$sesssion_by_Fnd_User.sql - Query demonstrating population of E-Business Suite connection tagging context in v$session
- v$sesssion_last_sql_by_Fnd_User.sql - Query leveraging E-Business Suite connection tagging to pull the last SQL out of v$session by FND User

Page Access Tracking Queries
- PAT_sessions_by_date.sql - Query Summary of Page Access Tracking sessions by date
- PAT_sessions_by_user.sql - Query Summary of Page Access Tracking sessions by FND user
- PAT_session_flow.sql - Detail page flow for a given user's sessions for the last 30 days

Other Queries
- ProfileWhoColumnExample.sql - Example of WHO column joins against the profile values table
- UnsuccessfulLogins.sql - Query showing unsuccessful logins for local users in E-Business Suite


== Installing the SQL scripts
================================================================================

The EBSAuditScripts.zip archive file unzip all the scripts to a new 
directory EBSAuditScripts.

You can install them on either the database server or on the app-tier, they 
just need SQL*Net connection to the database.

If you downloaded the zip to your home directory you can simply unzip it 
right there and the run from the new directory

 $ unzip EBSAuditScripts.zip
 $ cd    EBSAuditScripts/


== Running the SQL scripts
================================================================================

All the scripts are designed to run as APPS against the database.  Alternatively, you 
can run them against a read-only account that has access to the associated tables.  
If you do so, you may need to alter the current schema context:

SQL> alter session set current_schema=APPS


== Revision Log:
================================================================================

 2015/10/28 Initial Release 1.0
 2017/09/08 1.1 - Added webusage.awk for R12.2.x Allowed Resources feature.
 2020/04/20 1.2 - Added webusage1213.awk for R12.1.3 Allowed Resources feature.



