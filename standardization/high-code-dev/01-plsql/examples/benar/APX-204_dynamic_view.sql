-- APX-105 dan APX-204: view per halaman yang membaca session state
-- lewat WITH ... /*+ MATERIALIZE */ sehingga get_session_state dipanggil sekali.
-- PLS-511: filter opsional null-safe.
create or replace force view apx_prism_p100_vendors_v
as
with x as (
   select /*+ materialize */
          apex_util.get_session_state('P100_COMPANY') as company
         ,apex_util.get_session_state('P100_STATUS')  as status
     from dual
)
select ven.vendor_id
      ,ven.vendor_name
      ,ven.company_code
      ,ven.status
  from apx_prism_vendor ven
  join x
    on (x.company is null or x.company = ven.company_code)
 where (x.status is null or x.status = ven.status);
