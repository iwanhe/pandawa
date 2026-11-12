# Template `.mvn/`

Salin folder ini menjadi `.mvn/` di root proyek Maven (nama berawalan titik tidak dapat dikirim lewat alat sinkronisasi):

```bash
cp -r mvn.template .mvn   # Windows: xcopy mvn.template .mvn\ /E /I
```

- `maven.config` — opsi Maven bawaan (log unduhan tidak ditampilkan; berguna di CI).
- `jvm.config` — akses ke paket internal kompiler Java yang dibutuhkan google-java-format (Spotless) di JDK 16 ke atas.

Keberadaan `.mvn/` juga menandai root proyek, sehingga POM induk menemukan `config/checkstyle` dan `config/spotbugs` lewat `${maven.multiModuleProjectDirectory}` dari subfolder mana pun.
