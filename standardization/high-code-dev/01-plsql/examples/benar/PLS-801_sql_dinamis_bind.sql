-- PLS-801: nilai dikirim lewat bind variable.
-- PLS-802: identifier dinamis divalidasi DBMS_ASSERT.
-- PLS-803: teks SQL disusun di variabel sebelum dieksekusi.
create or replace function apx_prism_row_count_fnc (
   p_table_name in varchar2
  ,p_status     in varchar2
) return pls_integer
authid current_user
is
   l_sql   varchar2(4000 char);
   l_count pls_integer;
begin
   l_sql := 'select count(*) from '
         || dbms_assert.enquote_name(dbms_assert.simple_sql_name(p_table_name))
         || ' where status = :status';

   execute immediate l_sql into l_count using p_status;
   return l_count;
end apx_prism_row_count_fnc;
/
