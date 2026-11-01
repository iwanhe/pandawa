--------------------------------------------------------------------------------
-- Script       : apx_prism_vendor_pkg.pks
-- Author       : Tim PANDAWA
-- Date         : 2026-11-01
-- Purpose      : API vendor untuk aplikasi PRISM (contoh standar PL/SQL)
-- Ticket       : CR-2026-000
-- Dependencies : apx_prism_vendor, logger
--------------------------------------------------------------------------------
-- Contoh ini menunjukkan: PLS-102, PLS-103, PLS-201, PLS-202, PLS-203,
-- PLS-301, PLS-302, PLS-304, PLS-307, PLS-308, PLS-402, PLS-704.
create or replace package apx_prism_vendor_pkg
authid definer
is
   -- Kode error aplikasi (PLS-704)
   k_err_vendor_not_found constant pls_integer := -20101;
   k_msg_vendor_not_found constant varchar2(100 char) := 'Vendor tidak ditemukan';

   /**
    * Mengembalikan versi package.
    *
    * @return versi dengan format XX.YY.ZZ
    */
   function package_version
      return varchar2;

   /**
    * Mengambil nama vendor berdasarkan ID.
    *
    * @param p_vendor_id ID vendor
    * @return nama vendor
    * @throws k_err_vendor_not_found bila vendor tidak ada
    */
   function vendor_name_by_id (
      p_vendor_id in apx_prism_vendor.vendor_id%type
   ) return apx_prism_vendor.vendor_name%type;

   /**
    * Menonaktifkan semua vendor satu perusahaan.
    *
    * @example
    * apx_prism_vendor_pkg.deactivate_vendors(
    *    p_company_code => 'KDK'
    *   ,x_row_count    => l_count
    * );
    *
    * @param p_company_code kode perusahaan
    * @param x_row_count    jumlah vendor yang dinonaktifkan
    */
   procedure deactivate_vendors (
      p_company_code in  apx_prism_vendor.company_code%type
     ,x_row_count    out pls_integer
   );
end apx_prism_vendor_pkg;
/
