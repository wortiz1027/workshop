# =======================================================================
# ETAPA 1: COMPILACIÓN (BUILD STAGE)
# Usamos una imagen de Maven oficial con Java 21 para compilar el JAR
# =======================================================================
FROM maven:3.9.6-eclipse-temurin-21-alpine AS build

# Definimos el directorio de trabajo dentro del contenedor de compilación
WORKDIR /app

# Copiamos el archivo de configuración de dependencias (pom.xml)
COPY pom.xml .

# 🚀 TRUCO DE VELOCIDAD: Descarga las dependencias de Maven en caché.
# Si el pom.xml no cambia, Docker no volverá a descargar internet en cada compilación.
RUN mvn dependency:go-offline -B

# Copiamos el código fuente de la aplicación al contenedor
COPY src ./src

# Compilamos el proyecto saltándonos las pruebas (ya que JUnit corrió de forma local)
RUN mvn clean package -DskipTests

# =======================================================================
# ETAPA 2: EJECUCIÓN (RUN STAGE)
# Usamos una imagen JRE ligera de Java 21 para correr la app en producción
# =======================================================================
FROM eclipse-temurin:21-jre-alpine AS runtime

# Definimos el directorio de trabajo final seguro
WORKDIR /app

# 👥 PRÁCTICA SENIOR DE SEGURIDAD: Creamos un usuario de sistema sin privilegios de root
# para mitigar ataques perimetrales dentro del clúster de Kubernetes
RUN addgroup -S workshopgroup && adduser -S workshopuser -G workshopgroup

# Copiamos ÚNICAMENTE el archivo JAR resultante de la etapa anterior (Build)
# Esto reduce el tamaño de la imagen final de 600MB a menos de 180MB
COPY --from=build /app/target/simulator-*.jar ./app.jar

# Asignamos la propiedad del archivo JAR al usuario seguro que creamos
RUN chown workshopuser:workshopgroup app.jar

# Le ordenamos al contenedor operar bajo el usuario seguro no-root
USER workshopuser

# Exponemos el puerto de escucha oficial configurado en tu application.yaml
EXPOSE 8080

# 🪵 CONFIGURACIÓN DE OPTIMIZACIÓN DE MEMORIA DE LA JVM:
# Ajustamos los parámetros de la máquina virtual de Java para que respete 
# los límites estrictos que le impondremos en los pods de Kubernetes
ENTRYPOINT ["java", "-XX:+UseG1GC", "-XX:+UseContainerSupport", "-jar", "app.jar"]
