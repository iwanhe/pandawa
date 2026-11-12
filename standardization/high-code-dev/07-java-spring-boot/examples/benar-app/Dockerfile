# JSB-906: image runtime JRE (bukan JDK), user non-root, base image dikunci.
# Jar dibangun lebih dulu di CI (`mvn verify`), lalu image dibuat dari jar itu.
# Saat dipakai, tambahkan digest ke tag: eclipse-temurin:21-jre-noble@sha256:...
# lalu pindai dengan Trivy; build gagal bila ada temuan CRITICAL/HIGH yang sudah ada perbaikannya.
ARG JRE_IMAGE=eclipse-temurin:21-jre-noble

FROM ${JRE_IMAGE} AS ekstrak
WORKDIR /bangun
COPY target/contoh-supplier-*.jar aplikasi.jar
# Pisahkan jar per lapisan agar lapisan dependency jarang berubah dan cache build efektif.
RUN java -Djarmode=tools -jar aplikasi.jar extract --layers --launcher --destination hasil

FROM ${JRE_IMAGE}
RUN useradd --system --uid 10001 --no-create-home aplikasi
WORKDIR /app
COPY --from=ekstrak /bangun/hasil/dependencies/ ./
COPY --from=ekstrak /bangun/hasil/spring-boot-loader/ ./
COPY --from=ekstrak /bangun/hasil/snapshot-dependencies/ ./
COPY --from=ekstrak /bangun/hasil/application/ ./
USER 10001
EXPOSE 8080
# JSB-806: batas heap mengikuti batas memori container.
ENV JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=75 -XX:+ExitOnOutOfMemoryError"
ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]
