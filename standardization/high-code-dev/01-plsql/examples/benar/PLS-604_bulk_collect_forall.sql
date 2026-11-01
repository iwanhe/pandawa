-- PLS-604: lebih dari 4 baris diproses dengan BULK COLLECT ... LIMIT dan FORALL
-- ketika logika per baris tidak dapat ditulis sebagai satu perintah SQL.
declare
   cursor c_vendor_cur is
      select ven.vendor_id
        from apx_prism_vendor ven
       where ven.status = 'A';

   type t_vendor_id_type is table of apx_prism_vendor.vendor_id%type;

   k_batch_size constant pls_integer := 1000;
   t_vendor_ids t_vendor_id_type;
begin
   open c_vendor_cur;

   <<proses_batch>>
   loop
      fetch c_vendor_cur bulk collect into t_vendor_ids limit k_batch_size;
      exit when t_vendor_ids.count = 0;

      forall i in 1 .. t_vendor_ids.count
         update apx_prism_vendor ven
            set ven.last_review_date = sysdate
          where ven.vendor_id = t_vendor_ids(i);
   end loop proses_batch;

   close c_vendor_cur;
exception
   when others then
      if c_vendor_cur%isopen then
         close c_vendor_cur;   -- PLS-601
      end if;
      raise;
end;
/
