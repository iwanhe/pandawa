# Standarisasi Development Oracle APEX dan Oracle EBS

**Versi:** 1.0  
**Tanggal:** November 2025  
**Referensi:** Insum PL/SQL & SQL Coding Guidelines v1.1

---

## 1. KONVENSI PENAMAAN (Naming Conventions)

### 1.1 Prinsip Umum
- Gunakan **lowercase** untuk semua nama objek
- Hindari nama yang diawali karakter numerik
- Pilih nama yang **meaningful dan spesifik**
- Hindari singkatan kecuali sudah umum digunakan
- Buat glossary untuk singkatan yang digunakan
- **JANGAN** gunakan Oracle reserved words
- Gunakan satu bahasa konsisten (misal: Bahasa Inggris)

### 1.2 PL/SQL Variables & Constants

| Identifier | Prefix | Suffix | Contoh |
|------------|--------|--------|---------|
| Global Variable | `g_` | - | `g_version` |
| Local Variable | `l_` | - | `l_employee_name` |
| Constants | `k_` | - | `k_max_salary` |
| Record | `r_` | - | `r_employee` |
| Array/Table | `t_` | - | `t_employees` |
| Object | `o_` | - | `o_employee` |
| Cursor Parameter | `p_` | - | `p_dept_id` |
| In Parameter | `p_` atau `in_` | - | `p_employee_id` |
| Out Parameter | `x_` atau `out_` | - | `x_total_salary` |
| In/Out Parameter | `x_` atau `io_` | - | `io_employee_data` |
| Record Type | `r_` | `_type` | `r_employee_type` |
| Array/Table Type | `t_` | `_type` | `t_employee_type` |
| Exception | `e_` | - | `e_invalid_data` |
| Subtypes | - | `_type` | `employee_id_type` |
| Cursor | - | `_cur` | `employee_cur` |

**Contoh:**
```sql
declare
   k_max_retry constant pls_integer := 3;
   l_employee_name employee.full_name%type;
   r_employee employee%rowtype;
   t_employees employee_api.t_employee_type;
   e_invalid_status exception;
begin
   null;
end;
```

### 1.3 Database Objects

#### Tables
- Nama **singular** (bukan plural)
- Contoh: `employee` (BUKAN `employees`)
- Tambahkan comment di DD untuk setiap tabel dan kolom
- Optional: prefix dengan kode proyek

**Alasan singular:**
- Konsisten dengan Entity-Relationship modeling
- Tidak perlu tahu apakah tabel berisi 1 atau banyak row
- Menghindari kompleksitas plural (news, lotus, knife, cactus)
- Lebih mudah untuk non-native speaker
- SQL statement lebih natural

#### Columns
- Nama singular untuk data yang disimpan
- Surrogate key: `{table_name}_id`
  - Contoh: `employee_id`, `department_id`
- Alasan: Memungkinkan penggunaan `USING` clause dalam JOIN

**Contoh:**
```sql
-- BAD
select e.id as employee_id
      ,d.id as department_id
  from employee e
  join department d on (e.department_id = d.id);

-- GOOD
select employee_id
      ,department_id
  from employee emp
  join department dept using (department_id);
```

#### Primary Key Constraint
- Format: `{table_name}_pk`
- Contoh: `employee_pk`, `department_pk`

#### Foreign Key Constraint
- Format: `{table}_{referenced_table}_fk[n]`
- Contoh: `employee_department_fk`

#### Unique Key Constraint
- Format: `{table}_{column_role}_uk[n]`
- Contoh: `employee_email_uk`

#### Index
- Constraint index: ikuti nama constraint
- Other index: `{table}_{columns/purpose}_idx`
- Contoh: `employee_last_name_idx`

#### Sequences (Pre-12c)
- **Oracle 12c+: Gunakan IDENTITY columns**
- Format: `{table}_seq`
- Contoh: `employee_seq`

#### Views
- Nama singular sesuai isi view
- Optional suffix: `_v` atau `_vw` (kecuali editioning views)
- Contoh: `active_employee`, `employee_v`

#### Packages
- Nama berdasarkan konten dalam package
- Optional: prefix dengan kode proyek
- Contoh: `employee_api`, `logger`, `constants`, `types`

#### Procedures
- Format: **verb + noun**
- Contoh: `calculate_salary`, `set_hiredate`, `validate_employee`

#### Functions
- Nama menjawab: "What is the outcome?"
- Contoh: `employee_by_id`, `total_salary`

#### Triggers
- DML Trigger: `{table}_{timing}_{event}_trg`
  - Contoh: `employee_br_iud` (Before Row Insert Update Delete)
- System Trigger: `{event}_{activity}_trg`
  - Contoh: `ddl_audit_trg`, `logon_trg`

#### Global Temporary Tables
- Suffix: `_gtt`
- Contoh: `employee_staging_gtt`

#### Object Types
- Suffix: `_ot`
- Contoh: `employee_ot`

---

## 2. CODING STYLE

### 2.1 Format Umum
1. Semua code ditulis dalam **lowercase**
2. Indentasi **3 spasi**
3. Satu command per baris
4. Keywords `loop`, `else`, `elsif`, `end if`, `when` pada baris baru
5. Koma di depan elemen yang dipisahkan
6. Parameter, operator, dan value di-align
7. SQL keywords right-aligned dalam SQL command
8. Gunakan `--` untuk line comment dalam program unit
9. Gunakan brackets ketika diperlukan atau membantu clarity

**Contoh:**
```sql
procedure set_salary(in_employee_id in employee.employee_id%type)
is
   cursor c_employee(p_employee_id in employee.employee_id%type) is
      select last_name
            ,first_name
            ,salary
        from employee
       where employee_id = p_employee_id
       order by last_name
               ,first_name;
   r_employee c_employee%rowtype;
   l_new_salary employee.salary%type;
begin
   open c_employee(p_employee_id => in_employee_id);
   fetch c_employee into r_employee;
   close c_employee;
   
   new_salary(in_employee_id => in_employee_id
             ,out_salary     => l_new_salary);
   
   -- Check whether salary has changed
   if r_employee.salary <> l_new_salary then
      update employee
         set salary = l_new_salary
       where employee_id = in_employee_id;
   end if;
end set_salary;
```

### 2.2 Package Version Function
Setiap package harus memiliki `package_version` function:

**Package Spec:**
```sql
-- Returns package version number
function package_version return varchar2;
```

**Package Body:**
```sql
function package_version return varchar2
is
begin
   -- Version History:
   -- 01.00.00 2024-01-15 John Doe Initial Version
   -- 01.00.01 2024-02-20 Jane Smith Fixed Jira #123
   -- 01.01.00 2024-03-10 John Doe Added new procedure
   return '01.01.00';
end package_version;
```

**Aturan Versioning:**
- Major change (multi-package): `03.05.09 → 04.00.00`
- Package spec change: `03.02.05 → 03.03.00`
- Package body only: `03.02.05 → 03.02.06`
- Work in progress: tambah `WIP` → `01.00.01 WIP`

### 2.3 Comments & Documentation

#### JavaDoc Style
```sql
/**
 * Calculate employee total compensation
 * 
 * @example
 * l_total := employee_api.total_compensation(
 *    in_employee_id => 100
 * );
 * 
 * @param in_employee_id Employee ID
 * @param in_year Calculation year
 * @return Total compensation amount
 * @throws no_data_found Employee not found
 */
function total_compensation(
   in_employee_id in employee.employee_id%type
  ,in_year        in number default extract(year from sysdate)
) return number;
```

#### Logging menggunakan Logger
Gunakan Logger framework dari OraOpenSource:
```sql
procedure verify_valid_auth
is
   l_scope logger_logs.scope%type := k_scope_prefix || 'verify_valid_auth';
begin
   logger.log('BEGIN', l_scope);
   
   if is_token_expired then
      logger.log('Renewing expired token', l_scope);
      renew_token;
   else
      logger.log('Token is valid', l_scope);
   end if;
   
   logger.log('END', l_scope);
exception
   when others then
      logger.log_error('Unhandled Exception', l_scope);
      raise;
end verify_valid_auth;
```

---

## 3. LANGUAGE USAGE - BEST PRACTICES

### 3.1 General Guidelines

#### G-1010: Label Sub-blocks
```sql
-- GOOD
<<main_processing>>
begin
   <<prepare_data>>
   begin
      null;
   end prepare_data;
   
   <<process_data>>
   begin
      null;
   end process_data;
end main_processing;
```

#### G-1020: Match Loop/Block Labels
```sql
-- GOOD
<<process_employees>>
for i in 1..10
loop
   sys.dbms_output.put_line(i);
end loop process_employees;
```

#### G-1030: Hindari Unused Variables
```sql
-- BAD
declare
   l_unused varchar2(100); -- tidak digunakan
   l_used number;
begin
   l_used := 100;
end;
```

#### G-1040: Hindari Dead Code
```sql
-- BAD
if 1=2 then
   null; -- dead code
end if;

-- GOOD
-- Hapus kode yang tidak akan pernah dieksekusi
```

#### G-1050: Hindari Literals, Gunakan Constants
```sql
-- BAD
if l_status = 'ACTIVE' then

-- GOOD
if l_status = constants.k_status_active then
```

#### G-1060: Hindari Store ROWID di Tables
Gunakan primary key, bukan ROWID untuk referensi row.

### 3.2 Variables & Types

#### G-2110: Gunakan Anchored Declarations
```sql
-- BAD
l_last_name varchar2(30);

-- GOOD
l_last_name employee.last_name%type;
r_employee employee%rowtype;
```

#### G-2120: Single Location untuk Type Definitions
Buat package `types` untuk semua type definitions:
```sql
create or replace package types is
   subtype big_string_type is varchar2(4000 char);
   subtype id_type is number;
   subtype flag_type is varchar2(1 char);
end types;
```

#### G-2140: Jangan Initialize dengan NULL
```sql
-- BAD
l_name varchar2(100) := null;

-- GOOD
l_name varchar2(100);
```

#### G-2150: Gunakan IS [NOT] NULL
```sql
-- BAD
if l_value = null then

-- GOOD
if l_value is null then
```

#### G-2160: Hindari Function Call di Declaration
```sql
-- BAD
declare
   l_dept_name dept.name%type := get_dept_name(10);

-- GOOD
declare
   l_dept_name dept.name%type;
begin
   <<initialize>>
   begin
      l_dept_name := get_dept_name(10);
   exception
      when others then
         l_dept_name := 'UNKNOWN';
   end initialize;
end;
```

#### G-2220: Gunakan PLS_INTEGER untuk Integer Arithmetic
```sql
-- BAD
k_count constant number := 100;

-- GOOD
k_count constant pls_integer := 100;
```

#### G-2230: Gunakan SIMPLE_INTEGER (11g+)
```sql
-- GOOD untuk nilai yang tidak akan NULL
k_max constant simple_integer := 1000;
```

#### G-2310: Hindari CHAR datatype
```sql
-- BAD
l_code char(10);

-- GOOD
l_code varchar2(10 char);
```

#### G-2340: Gunakan CHAR SEMANTIC untuk VARCHAR2
```sql
-- BAD
subtype name_type is varchar2(100);

-- GOOD
subtype name_type is varchar2(100 char);
```

### 3.3 DML & SQL

#### G-3110: Specify Target Columns untuk INSERT
```sql
-- BAD
insert into employee values (100, 'John', 'Doe');

-- GOOD
insert into employee (
   employee_id
  ,first_name
  ,last_name
) values (
   100
  ,'John'
  ,'Doe'
);
```

#### G-3120: Gunakan Table Aliases
```sql
-- BAD
select last_name, department_name
  from employee, department
 where employee.dept_id = department.dept_id;

-- GOOD
select emp.last_name
      ,dept.department_name
  from employee emp
  join department dept using (department_id);
```

#### G-3130: Gunakan ANSI SQL-92 Join
```sql
-- BAD (Oracle syntax)
select e.name, d.name
  from employee e, department d
 where e.dept_id = d.dept_id;

-- GOOD (ANSI syntax)
select emp.name
      ,dept.name
  from employee emp
  join department dept using (department_id);
```

#### G-3140: Gunakan Anchored Records untuk Cursor
```sql
-- GOOD
declare
   cursor c_employee is
      select * from employee;
   r_employee c_employee%rowtype;
begin
   open c_employee;
   fetch c_employee into r_employee;
   close c_employee;
end;
```

#### G-3150: Gunakan Identity Columns (12c+)
```sql
-- GOOD
create table employee (
   employee_id number generated by default on null as identity
  ,first_name varchar2(50 char) not null
  ,constraint employee_pk primary key (employee_id)
);
```

#### G-3160: Virtual Columns sebaiknya INVISIBLE
```sql
-- GOOD
alter table employee
   add total_comp invisible generated always as 
      (salary + nvl(commission, 0));
```

#### G-3180: Gunakan Column Names di ORDER BY
```sql
-- BAD
order by 1, 3, 2

-- GOOD
order by hire_date
        ,last_name
        ,first_name
```

#### G-3190: Hindari NATURAL JOIN
```sql
-- BAD
select * from employee natural join department;

-- GOOD
select * from employee emp
  join department dept using (department_id);
```

#### G-3210: Gunakan BULK Operations (>4 rows)
```sql
-- GOOD untuk batch processing
declare
   type t_emp_ids is table of employee.employee_id%type;
   l_emp_ids t_emp_ids;
begin
   select employee_id
     bulk collect into l_emp_ids
     from employee
    where department_id = 10;
   
   forall i in 1..l_emp_ids.count
      update employee
         set salary = salary * 1.1
       where employee_id = l_emp_ids(i);
end;
```

### 3.4 Control Structures

#### G-4110: Gunakan %NOTFOUND (bukan NOT %FOUND)
```sql
-- GOOD
exit when c_employee%notfound;
```

#### G-4130: Selalu Close Cursor yang Dibuka
```sql
-- GOOD
declare
   cursor c_emp is select * from employee;
   r_emp c_emp%rowtype;
begin
   open c_emp;
   fetch c_emp into r_emp;
   close c_emp; -- WAJIB
end;
```

#### G-4210: Gunakan CASE daripada Multiple ELSIF
```sql
-- BAD
if l_status = 'A' then
   process_active;
elsif l_status = 'I' then
   process_inactive;
elsif l_status = 'P' then
   process_pending;
end if;

-- GOOD
case l_status
   when 'A' then process_active;
   when 'I' then process_inactive;
   when 'P' then process_pending;
   else null;
end case;
```

#### G-4220: Gunakan CASE daripada DECODE
```sql
-- BAD
select decode(status, 'A', 'Active', 'I', 'Inactive')
  from employee;

-- GOOD
select case status
          when 'A' then 'Active'
          when 'I' then 'Inactive'
       end status_desc
  from employee;
```

#### G-4230: Gunakan COALESCE daripada NVL
```sql
-- GOOD untuk function call di parameter 2
select coalesce(salary, get_default_salary())
  from employee;
```

#### G-4310: JANGAN Gunakan GOTO
```sql
-- BAD
goto end_processing;

-- GOOD
-- Gunakan structured control flow
```

#### G-4320: Selalu Label Loops
```sql
-- GOOD
<<process_records>>
for i in 1..10
loop
   -- processing
end loop process_records;
```

#### G-4330: Gunakan CURSOR FOR Loop
```sql
-- GOOD
for r_emp in (select * from employee)
loop
   process_employee(r_emp);
end loop;
```

#### G-4340: Gunakan NUMERIC FOR untuk Dense Array
```sql
-- GOOD
for i in 1..t_employees.count
loop
   process(t_employees(i));
end loop;
```

#### G-4375: Gunakan EXIT WHEN daripada IF-EXIT
```sql
-- BAD
loop
   if condition then
      exit;
   end if;
end loop;

-- GOOD
loop
   exit when condition;
end loop;
```

### 3.5 Exception Handling

#### G-5010: Gunakan Error/Logging Framework
Gunakan Logger framework untuk semua error logging.

#### G-5020: Jangan Handle Exception dengan Error Number
```sql
-- BAD
exception
   when others then
      if sqlcode = -1 then ...

-- GOOD
exception
   when dup_val_on_index then ...
```

#### G-5040: Hindari WHEN OTHERS tanpa Handler Lain
```sql
-- BAD
exception
   when others then
      null;

-- GOOD
exception
   when no_data_found then
      handle_no_data;
   when too_many_rows then
      handle_too_many;
   when others then
      logger.log_error('Unexpected error', l_scope);
      raise;
end;
```

#### G-5050: Hindari Hard-coded Error Numbers
```sql
-- BAD
raise_application_error(-20001, 'Invalid data');

-- GOOD
-- Definisikan di package constants
k_invalid_data_code constant pls_integer := -20001;
k_invalid_data_msg constant varchar2(100) := 'Invalid data';

raise_application_error(
   constants.k_invalid_data_code
  ,constants.k_invalid_data_msg
);
```

### 3.6 Dynamic SQL

#### G-6010: Gunakan Variable untuk Dynamic SQL
```sql
-- GOOD
declare
   l_sql varchar2(4000);
begin
   l_sql := 'select * from ' || p_table_name;
   execute immediate l_sql;
end;
```

#### G-6030: Validasi Parameters dengan DBMS_ASSERT
```sql
-- GOOD
declare
   l_table_name varchar2(128);
begin
   l_table_name := dbms_assert.simple_sql_name(p_table_name);
   l_sql := 'select * from ' || l_table_name;
end;
```

---

## 4. ORACLE APEX SPECIFIC GUIDELINES

### 4.1 Page Items & Application Items
- Format: `P{PAGE}_ITEM_NAME` atau `G_APP_ITEM_NAME`
- Contoh: `P10_EMPLOYEE_ID`, `G_USER_ID`

### 4.2 Page Processes
- Nama deskriptif dengan verb
- Contoh: "Fetch Employee Data", "Validate Input"

### 4.3 Dynamic Actions
- Nama jelas menggambarkan trigger dan action
- Contoh: "Show Details on Row Click"

### 4.4 Validations
- Nama menjelaskan apa yang divalidasi
- Contoh: "Employee ID Must Exist"

### 4.5 Branches & Computations
- Gunakan nama yang self-explanatory
- Hindari default names seperti "Branch 1"

### 4.6 PL/SQL dalam APEX
- Ikuti semua standar PL/SQL di atas
- Gunakan bind variable notation `:P10_ITEM_NAME`
- Validasi input dengan `apex_escape` untuk keamanan

---

## 5. ORACLE EBS SPECIFIC GUIDELINES

### 5.1 Custom Tables
- Prefix: `XX{ORG}_` 
- Contoh: `XXABC_EMPLOYEE`

### 5.2 Custom Packages
- Prefix: `XX{ORG}_`
- Suffix berdasarkan tipe: `_PKG`, `_API`
- Contoh: `XXABC_EMPLOYEE_API`

### 5.3 Concurrent Programs
- Nama jelas dan deskriptif
- Parameter names: gunakan uppercase
- Error handling: return status (SUCCESS, ERROR, WARNING)

### 5.4 Database Triggers (EBS)
- Hindari trigger untuk business logic
- Jika harus: gunakan compound triggers (11g+)
- Format: `{table}_{timing}_{event}_TRG`

### 5.5 EBS API Usage
- Selalu gunakan Oracle-provided APIs ketika tersedia
- Contoh: `FND_USER_PKG`, `HR_EMPLOYEE_API`
- Set context dengan `FND_GLOBAL.APPS_INITIALIZE`

### 5.6 Multi-Org & Security
- Respect EBS security model
- Gunakan org_id filtering
- Validate user permissions

---

## 6. SECURITY BEST PRACTICES

### 6.1 SQL Injection Prevention
```sql
-- BAD
l_sql := 'select * from emp where name = ''' || p_name || '''';

-- GOOD
l_sql := 'select * from emp where name = :name';
execute immediate l_sql using p_name;
```

### 6.2 Privilege Management
- Gunakan definers rights untuk security-sensitive code
- Invokers rights untuk utility packages
- Grant minimal privileges yang diperlukan

### 6.3 Data Masking
- Mask sensitive data di logs
- Jangan log passwords atau credit card numbers

---

## 7. PERFORMANCE GUIDELINES

### 7.1 Bulk Operations
Gunakan BULK COLLECT dan FORALL untuk batch processing >4 rows

### 7.2 Result Cache
```sql
function get_dept_name(p_dept_id number) 
   return varchar2 
   result_cache
is
   -- implementation
end;
```

### 7.3 Deterministic Functions
```sql
function calculate_tax(p_amount number)
   return number
   deterministic
is
   -- implementation  
end;
```

### 7.4 Index Hints (hati-hati)
Gunakan hints hanya jika benar-benar diperlukan dan terdokumentasi dengan baik.

---

## 8. VERSION CONTROL & DEPLOYMENT

### 8.1 Script Organization
```
/database
  /packages
    /employee_api
      employee_api.pks
      employee_api.pkb
  /tables
    employee.sql
  /views
    employee_v.sql
```

### 8.2 Script Headers
```sql
--------------------------------------------------------------------------------
-- Script: employee_api.pkb
-- Author: John Doe
-- Date: 2024-11-25
-- Purpose: Employee management API
-- Ticket: JIRA-123
-- Dependencies: employee table, department table
--------------------------------------------------------------------------------
```

### 8.3 Deployment Scripts
- Gunakan idempotent scripts (create or replace)
- Include rollback scripts
- Test di development environment dulu

---

## 9. CODE REVIEW CHECKLIST

### Pre-commit Checklist:
- [ ] Mengikuti naming conventions
- [ ] Code formatting konsisten
- [ ] No hard-coded values
- [ ] Exception handling lengkap
- [ ] Comments dan documentation ada
- [ ] No dead code
- [ ] No unused variables
- [ ] Security considerations checked
- [ ] Performance reviewed
- [ ] Unit tests created (jika applicable)

---

## 10. TOOLS & UTILITIES RECOMMENDED

### Development Tools:
- **SQL Developer / PL/SQL Developer** untuk development
- **Logger** (OraOpenSource) untuk logging
- **utPLSQL** untuk unit testing
- **Code formatter** untuk consistent formatting

### Static Analysis:
- **SonarQube dengan PL/SQL plugin**
- **Trivadis PL/SQL Cop**

---

## REFERENCES

1. Insum PL/SQL & SQL Coding Guidelines v1.1
2. Oracle Database PL/SQL Language Reference
3. Oracle APEX Developer Guide
4. Oracle E-Business Suite Developer's Guide

---

## REVISION HISTORY

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2024-11-25 | [Your Name] | Initial version based on Insum guidelines |

---

**NOTES:**
- Standar ini adalah guideline yang dapat disesuaikan dengan kebutuhan organisasi
- Konsistensi lebih penting daripada kesempurnaan
- Code review dan pair programming membantu enforcement
- Update guidelines secara berkala berdasarkan lessons learned