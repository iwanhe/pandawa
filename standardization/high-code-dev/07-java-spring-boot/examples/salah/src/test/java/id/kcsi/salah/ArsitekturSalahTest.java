package id.kcsi.salah;

import static com.tngtech.archunit.lang.syntax.ArchRuleDefinition.noClasses;

import com.tngtech.archunit.core.importer.ImportOption;
import com.tngtech.archunit.junit.AnalyzeClasses;
import com.tngtech.archunit.junit.ArchTest;
import com.tngtech.archunit.lang.ArchRule;
import com.tngtech.archunit.library.GeneralCodingRules;
import jakarta.persistence.Entity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RestController;

/** Aturan yang sama dengan ArsitekturTest di benar-app. Di modul ini HARUS gagal. */
@AnalyzeClasses(packages = "id.kcsi.salah", importOptions = ImportOption.DoNotIncludeTests.class)
class ArsitekturSalahTest {

  @ArchTest
  static final ArchRule CONTROLLER_TANPA_ENTITY =
      noClasses()
          .that()
          .areAnnotatedWith(RestController.class)
          .should()
          .dependOnClassesThat()
          .areAnnotatedWith(Entity.class);

  @ArchTest
  static final ArchRule CONTROLLER_TANPA_TRANSAKSI =
      noClasses().that().areAnnotatedWith(RestController.class).should().beAnnotatedWith(Transactional.class);

  @ArchTest
  static final ArchRule TANPA_INJEKSI_FIELD = GeneralCodingRules.NO_CLASSES_SHOULD_USE_FIELD_INJECTION;

  @ArchTest
  static final ArchRule TANPA_STANDARD_STREAM = GeneralCodingRules.NO_CLASSES_SHOULD_ACCESS_STANDARD_STREAMS;
}
