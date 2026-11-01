-- MELANGGAR: PLS-702 (WHEN OTHERS menelan error), PLS-202 (parameter tanpa prefix),
-- PLS-203 (tipe tidak di-anchor), PLS-704 (nomor error hardcode),
-- PLS-604 (update per baris dalam loop), APX-205 (commit di kode yang dipanggil APEX).
create or replace procedure apx_prism_deactivate_prc (company varchar2)
is
   v_count number := null;
begin
   for r in (select vendor_id from apx_prism_vendor where company_code = company)
   loop
      update apx_prism_vendor set status = 'I' where vendor_id = r.vendor_id;
      v_count := v_count + 1;
   end loop;
   if v_count = 0 then
      raise_application_error(-20001, 'Tidak ada data');
   end if;
   commit;
exception
   when others then
      null;
end;
/
