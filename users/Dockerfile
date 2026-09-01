# -------------------------------------------------------------
# - DOCKERFILE
# - AUTOR: @DevSoft Team
# - FECHA: 31-agosto-2026
# - DESCRIPCION: Dockerfile multi-etapa optimizado para el
# -              servicio independiente de productos (products)
# -------------------------------------------------------------
# -------------------------------------------------------------
# docker build \
#  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
#  --build-arg BUILD_VERSION="1.0.0" \
#  --build-arg BUILD_REVISION=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown") \
#  -t products-service:latest .
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

# Copiar el código fuente y empaquetar el .jar omitiendo los tests
COPY src/ src/
RUN ./mvnw clean package -DskipTests -B

# 🚀 CORRECCIÓN CRÍTICA: Extracción moderna de capas Spring Boot usando jarmode=tools
WORKDIR /build/extracted
RUN java -Djarmode=tools -jar /build/target/*.jar extract --destination .

# ==========================================
# FASE 2: Entorno de Ejecución (Runtime Stage)
# ==========================================
FROM eclipse-temurin:21-alpine AS runner
WORKDIR /app

# Crear un usuario de sistema sin shell interactiva para mitigar exploits de terminal
RUN addgroup -S spring && adduser -S spring -G spring -h /app -s /sbin/nologin && rm -rf /var/cache/apk/* /lib/apk/db/*

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
	  org.opencontainers.image.title="Backend para la gestion de catalogo de productos" \
	  org.opencontainers.image.description="Componente encargado de gestionar la informacion de inventarios"

# Copiar las capas de la aplicación desde la fase de extracción de herramientas
COPY --from=builder /build/extracted/dependencies/ ./
COPY --from=builder /build/extracted/spring-boot-loader/ ./
COPY --from=builder /build/extracted/snapshot-dependencies/ ./
COPY --from=builder /build/extracted/application/ ./

# Parámetros optimizados para ejecución en nube y Garbage Collector ZGC de Ultra Baja Latencia
ENV JAVA_OPTS="-XX:+UseZGC -XX:+ZGenerational -XX:+UnlockDiagnosticVMOptions -Dfile.encoding=UTF-8 -XX:+AlwaysPreTouch -Xss256k"

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS org.springframework.boot.loader.launch.JarLauncher"]
