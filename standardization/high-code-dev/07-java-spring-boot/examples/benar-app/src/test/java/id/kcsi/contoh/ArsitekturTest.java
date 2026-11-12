package id.kcsi.contoh;

import static com.tngtech.archunit.lang.syntax.ArchRuleDefinition.noClasses;
import static com.tngtech.archunit.lang.syntax.ArchRuleDefinition.noMethods;
import static com.tngtech.archunit.library.dependencies.SlicesRuleDefinition.slices;

import com.tngtech.archunit.core.importer.ImportOption;
import com.tngtech.archunit.junit.AnalyzeClasses;
import com.tngtech.archunit.junit.ArchTest;
import com.tngtech.archunit.lang.ArchRule;
import com.tngtech.archunit.library.GeneralCodingRules;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import org.springframework.data.repository.Repository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RestController;

/** Uji arsitektur (JSB-903). Salin kelas ini ke setiap aplikasi dan sesuaikan nama paket. */
@AnalyzeClasses(packages = "id.kcsi.contoh", importOptions = ImportOption.DoNotIncludeTests.class)
class ArsitekturTest {

  /** JSB-202, JSB-302: controller tidak mengakses data langsung dan tidak memegang entity. */
  @ArchTest
  static final ArchRule CONTROLLER_TANPA_AKSES_DATA =
      noClasses()
          .that()
          .areAnnotatedWith(RestController.class)
          .should()
          .dependOnClassesThat()
          .areAssignableTo(Repository.class)
          .orShould()
          .dependOnClassesThat()
          .areAnnotatedWith(Entity.class)
          .orShould()
          .dependOnClassesThat()
          .areAssignableTo(EntityManager.class)
          .orShould()
          .dependOnClassesThat()
          .areAssignableTo(JdbcClient.class)
          .orShould()
          .dependOnClassesThat()
          .areAssignableTo(JdbcTemplate.class);

  /** JSB-203: transaksi dibuka di service, bukan di controller. */
  @ArchTest
  static final ArchRule CONTROLLER_TANPA_TRANSAKSI =
      noClasses().that().areAnnotatedWith(RestController.class).should().beAnnotatedWith(Transactional.class);

  @ArchTest
  static final ArchRule METHOD_CONTROLLER_TANPA_TRANSAKSI =
      noMethods()
          .that()
          .areDeclaredInClassesThat()
          .areAnnotatedWith(RestController.class)
          .should()
          .beAnnotatedWith(Transactional.class);

  /** JSB-105: tidak ada siklus antar paket fitur. */
  @ArchTest
  static final ArchRule TANPA_SIKLUS = slices().matching("id.kcsi.contoh.(*)..").should().beFreeOfCycles();

  /** JSB-201: dependency lewat constructor, bukan @Autowired pada field. */
  @ArchTest
  static final ArchRule TANPA_INJEKSI_FIELD = GeneralCodingRules.NO_CLASSES_SHOULD_USE_FIELD_INJECTION;

  /** JSB-801: log lewat SLF4J. */
  @ArchTest
  static final ArchRule TANPA_STANDARD_STREAM = GeneralCodingRules.NO_CLASSES_SHOULD_ACCESS_STANDARD_STREAMS;

  @ArchTest
  static final ArchRule TANPA_JAVA_UTIL_LOGGING = GeneralCodingRules.NO_CLASSES_SHOULD_USE_JAVA_UTIL_LOGGING;
}
