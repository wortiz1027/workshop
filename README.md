# 🚀 Workshop: Arquitectura de Microservicios Distribuidos con Spring Boot 3.x & MySQL

¡Bienvenido al repositorio central del Workshop! En este laboratorio práctico aprenderás a construir, integrar y desplegar un ecosistema distribuido compuesto por **dos aplicaciones backend e independientes**, cada una con su propia base de datos dedicada, aplicando patrones profesionales de comunicación HTTP, resiliencia defensiva, pruebas automatizadas, control de calidad y **observabilidad nativa de nivel corporativo (LGTM Stack + Grafana Alloy)**.

---

## 🏗️ 1. Arquitectura General y Topología de Red

El sistema implementa de forma estricta el patrón arquitectónico **Database-per-Microservice**. No existen llaves foráneas (`FOREIGN KEY`) cruzadas entre servidores MySQL independientes; la consistencia e integridad referencial de los datos distribuidos se gestiona en la capa de software a través de orquestación síncrona.

El ecosistema está completamente instrumentado de forma nativa (sin agentes pesados de transformación de bytecode) para enviar métricas, logs y trazas distribuidas hacia **Grafana Alloy**, el cual actúa como el recolector y distribuidor único hacia el stack de almacenamiento de Grafana.

```mermaid
graph TD
    subgraph Host ["💻 Entorno Maquina Real Host"]
        UI[📱 Cliente HTTP / Resterm] -->|"1. Entrada Publica Puerto 8000"| AppGateway
        GRAFANA_UI["📊 Grafana Dashboard <br> Puerto 3000"]
    end

    subgraph DockerBridge ["🐳 Red Docker: workshop_shared_network Bridge"]
        subgraph SpringCloud ["⚙️ Infraestructura 🍃 Spring Cloud (Contenedores)"]
            ConfigServer[☁️ Config Server <br> Puerto 9999]
            EurekaServer[📡 Eureka Server <br> Puerto 8761]
            AppGateway[👑 API Gateway WebMVC <br> Puerto 8000]
        end

        subgraph SubUsers ["👥 Microservicio Usuarios Puerto 8081"]
            AppUsers[🍃 Spring Boot: users <br> Micrometer Tracing]
            DBUsers[(🐬 MySQL: usersdb)]
            AppUsers -->|localhost:3306| DBUsers
        end

        subgraph SubProducts ["📦 Microservicio Productos Puerto 8080"]
            AppProducts[🍃 Spring Boot: products <br> Micrometer Tracing]
            DBProducts[(🐬 MySQL: productsdb)]
            AppProducts -->|localhost:3306| DBProducts
        end

        subgraph TelemetryStack ["🕵️‍♂️ Stack de Observabilidad Centralizado LGTM"]
            ALLOY[⚙️ Grafana Alloy <br> OpenTelemetry Collector]
            PROM[(🔥 Prometheus <br> Metrics)]
            LOKI[(🪵 Grafana Loki <br> Logs)]
            TEMPO[(⏱️ Grafana Tempo <br> Traces)]
        end
    end

    %% Ciclo de Descarga de Propiedades Centralizadas
    AppGateway -.->|"2. Descarga YAML"| ConfigServer
    AppUsers -.->|"Descarga YAML"| ConfigServer
    AppProducts -.->|"Descarga YAML"| ConfigServer

    %% Ciclo de Descubrimiento de Servicios Dinámico
    AppGateway -->|"3. Consulta Rutas"| EurekaServer
    AppUsers -->|"Registra Instancia: USERS"| EurekaServer
    AppProducts -->|"Registra Instancia: PRODUCTS"| EurekaServer

    %% Enrutamiento Interno del API Gateway
    AppGateway -->|"4. Enruta lb://service-products"| AppProducts
    AppGateway -->|"4. Enruta lb://service-users"| AppUsers

    %% Comunicación de Negocio Inter-Servicio
    AppUsers -->|"Orquestación HTTP Síncrona"| AppProducts

    %% Flujos de Telemetría Unificados hacia Grafana Alloy
    AppGateway -->|"OTLP/HTTP"| ALLOY
    AppUsers -->|"OTLP/HTTP"| ALLOY
    AppProducts -->|"OTLP/HTTP"| ALLOY

    %% Distribución de Alloy hacia el Almacenamiento Core
    ALLOY -->|Metrics| PROM
    ALLOY -->|Logs| LOKI
    ALLOY -->|Traces| TEMPO

    %% Visualización
    GRAFANA_UI -->|Query Data| PROM
    GRAFANA_UI -->|Query Data| LOKI
    GRAFANA_UI -->|Query Data| TEMPO

    %% Aplicar estilos utilizando exclusivamente los IDs técnicos planos
    style SubUsers fill:#f9f,stroke:#333,stroke-width:2px
    style SubProducts fill:#bbf,stroke:#333,stroke-width:2px
    style SpringCloud fill:#cef,stroke:#048,stroke-width:2px
    style TelemetryStack fill:#eee,stroke:#ff6600,stroke-width:2px
```

### 📡 Lección Clave de Infraestructura: Redes en DevContainers

Durante el taller descubrimos que el uso de `network_mode: service:[db]` en los entornos de desarrollo DevContainer acopla las pilas de red del contenedor de Java y su base de datos local de la siguiente forma:

1. **Host `localhost` interno**: El microservicio y su MySQL local comparten la misma interfaz. Spring Boot se conecta de forma nativa a `localhost:3306`. Los puertos mapeados externos (como el `3308`) son **exclusivos para herramientas externas de la máquina física** y fallan si se intentan usar de forma interna.
2. **Descubrimiento de Servicios Externos**: Para romper el aislamiento de los proyectos, se utiliza la red común de Docker `workshop_shared_network`. La aplicación de usuarios localiza a la API de productos apuntando al nombre del contenedor que aloja su red compartida (`http://mysql_server_products:8080`).

---

## 🕵️‍♂️ 2. Arquitectura de Observabilidad Avanzada (Grafana LGTM Stack)

El ecosistema integra la especificación moderna de **Pruebas y Sistemas Observables** eludiendo el uso de agentes de alteración de bytecode en caliente, mitigando penalizaciones de CPU en pruebas de carga extremas de k6.

- **Grafana Alloy (Collector):** Actúa como el recolector centralizado de telemetría dentro de la red virtual de Docker. Oye en un único punto los datos formateados bajo el estándar **OpenTelemetry (OTLP)**.
- **Prometheus (Métricas):** Almacena las series temporales de consumo de memoria de la JVM, comportamiento de hilos de Tomcat y conteo de peticiones HTTP raspadas de forma eficiente por Alloy.
- **Grafana Loki (Logs):** Centraliza las trazas de consola e hilos de ejecución de Spring Boot inyectados dinámicamente mediante el appender de Logback.
- **Grafana Tempo (Trazas Distribuidas):** Reconstruye el viaje en cascada de una petición asignándole un identificador único global (`Trace ID`). Permite auditar visualmente los milisegundos exactos consumidos entre el orquestador de usuarios, la red de Docker y el catálogo de productos.

---

## 🗄️ 3. Diseño y Modelo de Datos Decentralizado

### Servidor de Productos (`productsdb`)

Contiene el catálogo e inventario general de objetos.

```mermaid
erDiagram
    PRODUCTS {
        VARCHAR_512 product_id PK "Restricción PK_IMG"
        VARCHAR_512 product_code UK "Indexado"
        VARCHAR_512 product_name
        VARCHAR_512 product_description
        DECIMAL_10_2 product_price
    }
```

### Servidor de Usuarios (`usersdb`)

Gestiona clientes y sus transacciones locales de compra de forma aislada.

```mermaid
erDiagram
    USERS {
        VARCHAR_512 user_id PK
        VARCHAR_512 user_name
        VARCHAR_512 user_email
        VARCHAR_128 user_role
    }
    USERS_PRODUCTS {
        VARCHAR_512 relation_id PK
        VARCHAR_512 user_id FK "ON DELETE CASCADE"
        VARCHAR_512 product_id "Clave Lógica Externa"
        DATETIME purchase_date
    }
    USERS ||--o{ USERS_PRODUCTS : "posee"
```

---

## 🔄 4. Diagrama de Secuencia: Consulta Unificada por ID

Este flujo describe la orquestación distribuida que es auditada en tiempo real por el stack de telemetría de Grafana Tempo cuando se genera tráfico masivo:

```mermaid
sequenceDiagram
    autonumber
    actor Terminal as Cliente / Resterm
    participant UC as UserController (users)
    participant US as UserService (users)
    participant UR as UserRepository (users)
    participant PC as ProductController (products)
    participant PS as ProductService (products)

    Terminal->>UC: GET /api/users/usr-0001/report
    Note over UC: Inicializa Trace ID Global
    UC->>US: getUserFullReport("usr-0001")
    US->>UR: findByIdWithProducts("usr-0001")
    Note over UR: Ejecuta consulta SQL optimizada<br/>usando LEFT JOIN FETCH
    UR-->>US: Entidad User con Colección de IDs
    Note over US: Propaga Trace ID en Cabeceras W3C
    US->>PC: GET /api/products/{id} (vía RestClient)
    PC->>PS: findById(id)
    PS-->>PC: ProductDTO
    PC-->>US: HTTP 200 OK (Metadata del Producto)
    Note over US: Mapea y compone UserAggregateReportDTO
    US-->>UC: Objeto de Agregación Completo
    UC-->>Terminal: HTTP 200 OK (JSON Enriquecido)
```

---

## ⚙️ 5. Guía de Configuración Global del Entorno

### Prerrequisito: Crear la Red Compartida en tu Computadora Real

Antes de inicializar los DevContainers en VS Code, debes crear de forma manual la red virtual en la terminal de tu sistema operativo principal para permitir la comunicación inter-servicio y el enganche de los contenedores de monitoreo:

```bash
docker network create workshop_shared_network
```

### Configuración del Entorno de Usuarios (`users/src/main/resources/application.yaml`)

El archivo base centralizado implementa el patrón **Multi-Document** estructurado con tres guiones (`---`) para aislar los entornos locales del perfil de contenedores en producción sin corromper el classpath de compilación:

```yaml
server:
  port: 8081
spring:
  application:
    name: users-service
  profiles:
    active: \${SPRING_PROFILES_ACTIVE:dev}
  jpa:
    show-sql: true
    properties:
      hibernate:
        physical_naming_strategy: org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl

# 🕵️‍♂️ Configuración Nativa de Observabilidad para Grafana Alloy via OTLP
management:
  tracing:
    sampling:
      probability: 1.0
  otlp:
    metrics:
      export:
        enabled: false
    tracing:
      endpoint: \${OTEL_EXPORTER_OTLP_ENDPOINT:http://localhost:4318/v1/traces}

---
# 🚀 PERFIL DE DESARROLLO LOCAL (dev)
spring:
  config:
    activate:
      on-profile: dev
  datasource:
    url: jdbc:mysql://localhost:3306/\${DB_NAME:usersdb}?useSSL=false&serverTimezone=UTC
    username: \${DB_USER:workshop}
    password: \${DB_PASSWORD:workshop2026}
api:
  products:
    url: http://localhost:8080/api/products

---
# 🐳 PERFIL DE CONTENEDORES EN PRODUCCIÓN (prod)
spring:
  config:
    activate:
      on-profile: prod
  datasource:
    url: jdbc:mysql://localhost:3306/\${DB_NAME:usersdb}?useSSL=false&serverTimezone=UTC
    username: \${DB_USER}
    password: \${DB_PASSWORD}
api:
  products:
    url: http://microservice_products_app:8080/api/products
```

---

## 🧪 6. Control de Calidad y Pruebas con Resterm

Hemos separado los archivos de pruebas funcionales interactivas para simular un ambiente de entrega continua real. Puedes ejecutarlos desde la consola integrada utilizando **Resterm**:

### Módulo de Productos (`products.http`)

- Validaciones básicas de endpoints REST de catálogos.
- Pruebas del cursor del Procedimiento Almacenado de nombres concatenados (`sp_listar_nombres_productos`).
- Inserciones masivas nativas eludiendo la caché de Hibernate.

### Módulo de Usuarios (`users.http`)

- Verificación del comportamiento del Procedimiento Almacenado local (`sp_obtener_metricas_usuario`).
- Pruebas de orquestación síncrona por ID con transformación dinámica de strings a JSON nativo (`JSON.parse(response.body)`).
- Simulación de fallos controlados por excepciones personalizadas de negocio (`UserBusinessException`) retornando códigos de error unificados **`HTTP 422 Unprocessable Content`**.

### Ejecución de Ciclo Completo en Java (JaCoCo Metrics)

Ambos microservicios cuentan con el plugin de JaCoCo configurado para romper la compilación si no se cumplen las políticas de pruebas automáticas (80% líneas / 70% ramas). Para correr los tests unitarios, integrales con Testcontainers y reportes en frío:

```bash
mvn clean verify
```

---

## 📦 7. Compilación de Imágenes Docker (Entorno de Producción)

Para empaquetar de forma segura y eficiente los microservicios utilizando los Dockerfiles multi-etapa basados en la extracción de descompresión nativa (`jar -xf`), ejecuta los siguientes comandos desde la terminal de tu máquina física (fuera de los DevContainers):

```bash
# 1. Compilar la imagen del Microservicio de Productos
cd ./products
docker build \
  --no-cache \
  --build-arg BUILD_DATE=\$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg BUILD_VERSION="1.0.0" \
    --build-arg BUILD_REVISION=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown") \
  -t workshop/products-service:latest .

# 2. Compilar la imagen del Microservicio de Usuarios
cd ../users
docker build \
  --no-cache \
  --build-arg BUILD_DATE=\$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg BUILD_VERSION="1.0.0" \
  --build-arg BUILD_REVISION=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown") \
  -t workshop/users-service:latest .

cd ../config-server
docker build \
  --no-cache \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg BUILD_VERSION="1.0.0" \
  --build-arg BUILD_REVISION=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown") \
  -t workshop/config-server:latest .

cd ../eureka-server
docker build \
  --no-cache \
  --build-arg BUILD_DATE=\$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg BUILD_VERSION="1.0.0" \
  --build-arg BUILD_REVISION=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown") \
  -t workshop/eureka-server:latest .

cd ../api-gateway
docker build \
  --no-cache \
  --build-arg BUILD_DATE=\$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg BUILD_VERSION="1.0.0" \
  --build-arg BUILD_REVISION=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown") \
  -t workshop/api-gateway:latest .
```
