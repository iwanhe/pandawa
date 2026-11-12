package id.kcsi.contoh.supplier;

import org.springframework.data.jpa.repository.JpaRepository;

/** Repository hanya dipakai di paket supplier, jadi package-private (JSB-103). */
interface SupplierRepository extends JpaRepository<SupplierEntity, Long> {

  boolean existsByKode(String kode);
}
