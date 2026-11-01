--------------------------------------------------------------------------------
-- Script       : apx_prism_vendor_pkg.pkb
-- Author       : Tim PANDAWA
-- Date         : 2026-11-01
-- Purpose      : API vendor untuk aplikasi PRISM (contoh standar PL/SQL)
-- Ticket       : CR-2026-000
-- Dependencies : apx_prism_vendor, logger
--------------------------------------------------------------------------------
-- Contoh ini menunjukkan: PLS-203, PLS-302, PLS-304, PLS-306, PLS-402,
-- PLS-502, PLS-604, PLS-701, PLS-702, PLS-704, APX-205 (tanpa commit).
create or replace package body apx_prism_vendor_pkg
is
   k_scope_prefix constant varchar2(31 char) := lower($$plsql_unit) || '.';
   k_status_inactive constant apx_prism_vendor.status%type := 'I';

   function package_version
      return varchar2
   is
   begin
      -- Riwayat versi:
      -- 01.00.00 2026-11-01 Tim PANDAWA Versi awal
      return '01.00.00';
   end package_version;

   function vendor_name_by_id (
      p_vendor_id in apx_prism_vendor.vendor_id%type
   ) return apx_prism_vendor.vendor_name%type
   is
      l_scope       logger_logs.scope%type := k_scope_prefix || 'vendor_name_by_id';
      l_vendor_name apx_prism_vendor.vendor_name%type;
   begin
      select ven.vendor_name
        into l_vendor_name
        from apx_prism_vendor ven
       where ven.vendor_id = p_vendor_id;

      return l_vendor_name;
   exception
      when no_data_found then
         raise_application_error(k_err_vendor_not_found, k_msg_vendor_not_found);
      when others then
         logger.log_error('Unhandled exception', l_scope);
         raise;
   end vendor_name_by_id;

   procedure deactivate_vendors (
      p_company_code in  apx_prism_vendor.company_code%type
     ,x_row_count    out pls_integer
   )
   is
      l_scope logger_logs.scope%type := k_scope_prefix || 'deactivate_vendors';
   begin
      logger.log('BEGIN', l_scope);

      -- PLS-604: satu perintah set-based, bukan update per baris dalam loop
      update apx_prism_vendor ven
         set ven.status = k_status_inactive
       where ven.company_code = p_company_code
         and ven.status      <> k_status_inactive;

      x_row_count := sql%rowcount;
      logger.log('END rows=' || x_row_count, l_scope);
   exception
      when others then
         logger.log_error('Unhandled exception', l_scope);
         raise;
   end deactivate_vendors;
end apx_prism_vendor_pkg;
/
