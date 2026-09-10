# -------------------------------------------------------------
# - DOCKERFILE
# - AUTOR: @DevSoft Team
# - FECHA: 09-septiembre-2026
# - DESCRIPCION: Dockerfile multi-etapa optimizado para el
# -              servidor de configuracion (config-server)
# -------------------------------------------------------------
# escape=\ (backslash)

# ==========================================
# FASE 1: Entorno de Compilación (Build Stage)
# ==========================================
FROM eclipse-temurin:21-jdk-alpine AS builder
WORKDIR /build

COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

RUN ./mvnw dependency:go-offline -B || true

COPY src/ src/
RUN ./mvnw clean package -DskipTests -B -Pprod

WORKDIR /build/extracted
RUN jar -xf /build/target/*.jar

# ==========================================
# FASE 2: Entorno de Ejecución (Runtime Stage)
# ==========================================
FROM eclipse-temurin:21-alpine AS runner
WORKDIR /app

RUN addgroup -S spring && \
	adduser -S spring -G spring -h /app -s /sbin/nologin && \
	mkdir -p /app/logs && \
	chown -R spring:spring /app && \
	rm -rf /var/cache/apk/* /lib/apk/db/*

USER spring:spring

ARG BUILD_DATE
ARG BUILD_VERSION
ARG BUILD_REVISION

LABEL org.opencontainers.image.created=$BUILD_DATE \
	org.opencontainers.image.authors="@DevSoft Team" \
	org.opencontainers.image.url="https://github.com" \
	org.opencontainers.image.source="https://github.com/wortiz1027/workshop" \
	org.opencontainers.image.version=$BUILD_VERSION \
	org.opencontainers.image.revision=$BUILD_REVISION \
	org.opencontainers.image.vendor="Develment Software Team | https://www.devsoft.com.co/" \
	org.opencontainers.image.title="Servidor de Configuracion Centralizada" \
	org.opencontainers.image.description="Componente encargado de distribuir archivos de propiedades via Spring Cloud Config native"

COPY --from=builder /build/extracted/BOOT-INF/lib /app/lib
COPY --from=builder /build/extracted/META-INF /app/META-INF
COPY --from=builder /build/extracted/BOOT-INF/classes /app

ENV JAVA_OPTS="-XX:+UseZGC -XX:+ZGenerational -XX:+UnlockDiagnosticVMOptions -Dfile.encoding=UTF-8 -XX:+AlwaysPreTouch -Xss256k"

# Puerto nativo del Config Server
EXPOSE 9999

# 🚀 ENTRYPOINT: Apunta exactamente a tu clase principal de configuracion
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -cp .:./lib/* co.com.netec.config_server.Application"]
