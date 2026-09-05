# -------------------------------------------------------------
# - DOCKERFILE
# - AUTOR: @DevSoft Team
# - FECHA: 01-septiembre-2026
# - DESCRIPCION: Dockerfile multi-etapa optimizado para el
# -              servicio independiente de usuarios (users)
# -------------------------------------------------------------
# -------------------------------------------------------------
# docker build \
#  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
#  --build-arg BUILD_VERSION="1.0.0" \
#  --build-arg BUILD_REVISION=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown") \
#  -t users-service:latest .
# -------------------------------------------------------------
# escape=\ (backslash)

# ==========================================
# FASE 1: Entorno de Compilación (Build Stage)
# ==========================================
FROM eclipse-temurin:21-jdk-alpine AS builder
WORKDIR /build

# Copiar el archivo de definición de dependencias y el wrapper de Maven
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

# Descargar dependencias en caché para acelerar construcciones futuras
RUN ./mvnw dependency:go-offline -B || true

# Copiar el código fuente y empaquetar aplicando el perfil 'prod' de Maven
COPY src/ src/
RUN ./mvnw clean package -DskipTests -B -Pprod

# 🚀 ESTRATEGIA DE EXTRACCIÓN INFALIBLE: Descomprimir el JAR nativamente para crear las capas
WORKDIR /build/extracted
RUN jar -xf /build/target/*.jar

# ==========================================
# FASE 2: Entorno de Ejecución (Runtime Stage)
# ==========================================
FROM eclipse-temurin:21-alpine AS runner
WORKDIR /app

# Crear el grupo, el usuario y preparar la estructura de carpetas
RUN addgroup -S spring && \
	adduser -S spring -G spring -h /app -s /sbin/nologin && \
	mkdir -p /app/logs && \
	chown -R spring:spring /app && \
	rm -rf /var/cache/apk/* /lib/apk/db/*

USER spring:spring

ARG BUILD_DATE
ARG BUILD_VERSION
ARG BUILD_REVISION

# Información de metadata de contenedores abiertos
LABEL org.opencontainers.image.created=$BUILD_DATE \
	org.opencontainers.image.authors="@DevSoft Team" \
	org.opencontainers.image.url="https://github.com" \
	org.opencontainers.image.documentation="" \
	org.opencontainers.image.source="https://github.com/wortiz1027/workshop" \
	org.opencontainers.image.version=$BUILD_VERSION \
	org.opencontainers.image.revision=$BUILD_REVISION \
	org.opencontainers.image.vendor="Develment Software Team | https://www.devsoft.com.co/" \
	org.opencontainers.image.licenses="" \
	org.opencontainers.image.title="Backend para la gestion de catalogo de usuarios" \
	org.opencontainers.image.description="Componente encargado de gestionar la informacion de usuarios y sus productos"

# Copia eficiente de las dependencias y clases descomprimidas
COPY --from=builder /build/extracted/BOOT-INF/lib /app/lib
COPY --from=builder /build/extracted/META-INF /app/META-INF
COPY --from=builder /build/extracted/BOOT-INF/classes /app

# Parámetros optimizados para ejecución en nube y Garbage Collector ZGC de Ultra Baja Latencia
ENV JAVA_OPTS="-XX:+UseZGC -XX:+ZGenerational -XX:+UnlockDiagnosticVMOptions -Dfile.encoding=UTF-8 -XX:+AlwaysPreTouch -Xss256k -Dlogging.config=file:/app/logback-spring.xml"

EXPOSE 8081

VOLUME ["/app/logs"]

# 🚀 ENTRYPOINT ORIENTADO A USUARIOS: Apunta de forma exacta a la clase principal de este microservicio
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -cp .:./lib/* co.com.netec.users.Application"]
