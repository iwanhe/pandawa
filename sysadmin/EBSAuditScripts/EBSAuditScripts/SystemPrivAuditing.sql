REM ----------------------------------------------------------------------------
REM Copyright (c) 2015 Oracle Corporation  - Redwood Shores
REM All rights reserved.
REM run as SYS
REM
REM This script will configure System and Privilege auditing
REM per E-Business Suite guidance.
REM See the Auditing section of the E-Business Suite Security Admin Guide for more information
REM
REM ----------------------------------------------------------------------------


REM  Audit unsuccessful logins
AUDIT CREATE SESSION WHENEVER NOT SUCCESSFUL;

REM Audit create, alter, drop user
AUDIT USER;

REM  Audit statements themselves
AUDIT SYSTEM AUDIT;

REM  Audit alter system statements
AUDIT ALTER SYSTEM by ACCESS;

REM  Audit System grant privileges
AUDIT SYSTEM GRANT by ACCESS;

REM  Audit SYSDBA privileges
AUDIT SYSDBA by ACCESS;

REM  Audit SYSOPER privileges
AUDIT SYSOPER by ACCESS; 

REM  Audit create or drop database links
AUDIT DATABASE LINK;

REM  Audit create or drop public database links
AUDIT PUBLIC DATABASE LINK;

AUDIT DIRECTORY;


REM  Audit alter any role statements
AUDIT ALTER ANY ROLE by ACCESS; 

REM  Audit create role statements
AUDIT CREATE ROLE by ACCESS;

REM  Audit drop any role statements
AUDIT DROP ANY ROLE by ACCESS;

REM  Audit drop any role statements
AUDIT ALTER ANY ROLE by ACCESS;

 

REM  Audit create role statements
AUDIT CREATE USER by ACCESS;

REM  Audit drop any role statements
AUDIT DROP USER by ACCESS;

REM  Audit drop any role statements
AUDIT ALTER USER by ACCESS;
 

REM  Audit changes to profiles
AUDIT PROFILE by ACCESS;
