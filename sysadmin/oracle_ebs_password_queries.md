# Oracle EBS User Password Decryption Queries

## Package Creation

### Package Specification

```sql
CREATE OR REPLACE PACKAGE get_user_pwd
AS 
  FUNCTION decrypt (
    KEY   IN VARCHAR2,
    VALUE IN VARCHAR2
  ) RETURN VARCHAR2;
END get_user_pwd;
/
```

### Package Body

```sql
CREATE OR REPLACE PACKAGE BODY get_user_pwd
AS 
  FUNCTION decrypt (
    KEY   IN VARCHAR2,
    VALUE IN VARCHAR2
  ) RETURN VARCHAR2 
  AS LANGUAGE JAVA 
  NAME 'oracle.apps.fnd.security.WebSessionManagerProc.decrypt(java.lang.String,java.lang.String) return java.lang.String';
END get_user_pwd;
/
```

---

## Query 1: Get APPS User Password (Backend)

```sql
/******************************************************************/
/*          QUERY TO GET APPS USER PASSWORD FOR BACK END          */
/******************************************************************/

ALTER SESSION SET current_schema = apps;

SELECT (SELECT Get_User_Pwd.Decrypt(
                Fnd_Web_Sec.Get_Guest_Username_Pwd, 
                Usertable.Encrypted_Foundation_Password)
         FROM Dual) AS Apps_Password
  FROM Fnd_User Usertable
 WHERE Usertable.User_Name LIKE (
         SELECT SUBSTR(
                  Fnd_Web_Sec.Get_Guest_Username_Pwd,
                  1, 
                  INSTR(Fnd_Web_Sec.Get_Guest_Username_Pwd, '/') - 1) 
           FROM Dual);
```

---

## Query 2: Get Application User Password (R11i)

```sql
--Step 3. Query to get password for application user (R11i)

SELECT Usertable.User_Name, 
       (SELECT Get_User_Pwd.Decrypt(
                UPPER((SELECT
                        (SELECT Get_User_Pwd.Decrypt(
                                 UPPER((SELECT UPPER(Fnd_Profile.Value('Guest_User_Pwd'))
                                          FROM Dual)), 
                                 Usertable.Encrypted_Foundation_Password) 
                           FROM Dual) AS Apps_Password
                   FROM Fnd_User Usertable
                  WHERE Usertable.User_Name LIKE UPPER((
                          SELECT SUBSTR(
                                   Fnd_Profile.Value('Guest_User_Pwd'),
                                   1, 
                                   INSTR(Fnd_Profile.Value('Guest_User_Pwd'), '/') - 1) 
                            FROM Dual)))), 
                Usertable.Encrypted_User_Password)
          FROM Dual) AS Encrypted_User_Password 
  FROM Fnd_User Usertable 
 WHERE Usertable.User_Name LIKE UPPER('&Username');
```

---

## Query 3: Get Frontend User Login Password (R12)

```sql
/***************************************************************************/
/*          QUERY TO GET THE PASSWORD FOR THE FRONTEND USER LOGIN          */
/***************************************************************************/

ALTER SESSION SET current_schema = apps;

-- R12
SELECT Usr.User_Name, 
       Usr.Description,
       Get_User_Pwd.Decrypt(
         (SELECT (SELECT Get_User_Pwd.Decrypt(
                          Fnd_Web_Sec.Get_Guest_Username_Pwd, 
                          Usertable.Encrypted_Foundation_Password)
                    FROM Dual) AS Apps_Password
            FROM Fnd_User Usertable  
           WHERE Usertable.User_Name = (
                   SELECT SUBSTR(
                            Fnd_Web_Sec.Get_Guest_Username_Pwd,
                            1,
                            INSTR(Fnd_Web_Sec.Get_Guest_Username_Pwd, '/') - 1) 
                     FROM Dual)), 
         Usr.Encrypted_User_Password) AS Password
  FROM Fnd_User Usr
 WHERE Usr.User_Name = '&User_Name';
```

---

## Usage Notes

- **Query 1**: Retrieves the APPS schema password for backend operations
- **Query 2**: Retrieves application user passwords for Oracle EBS R11i
- **Query 3**: Retrieves frontend user login passwords for Oracle EBS R12

---

## Security Warning

⚠️ **IMPORTANT**: These queries decrypt sensitive password information. 

**Usage Guidelines:**
- Use only with appropriate security controls
- Execute only by authorized personnel
- Follow your organization's security policies
- Maintain audit logs of password access
- Consider security implications before sharing

---

## Prerequisites

1. Access to Oracle EBS database with appropriate privileges
2. APPS schema access
3. Java stored procedure support enabled
4. Proper authorization from database administrator

---

## Version Compatibility

- **R11i**: Use Query 2 for application user passwords
- **R12**: Use Query 3 for frontend user login passwords
- **Both**: Query 1 works for APPS password retrieval

---

*Document Date: December 2025*  
*For Oracle E-Business Suite Administration*