-- MELANGGAR: PLS-801 (nilai digabung ke string SQL -> SQL injection),
-- PLS-802 (nama tabel tidak divalidasi DBMS_ASSERT).
-- Masukan p_status = 'x'' or ''1''=''1' akan menghitung semua baris.
create or replace function apx_prism_row_count_fnc (
   p_table_name in varchar2
  ,p_status     in varchar2
) return pls_integer
is
   l_count pls_integer;
begin
   execute immediate 'select count(*) from ' || p_table_name
                  || ' where status = ''' || p_status || ''''
      into l_count;
   return l_count;
end apx_prism_row_count_fnc;
/
