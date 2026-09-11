# 🚀 Workshop: Arquitectura de Microservicios Distribuidos con Spring Boot 3.x & MySQL

¡Bienvenido al repositorio central del Workshop! En este laboratorio práctico aprenderás a construir, integrar y desplegar un ecosistema distribuido compuesto por **dos aplicaciones backend e independientes**, cada una con su propia base de datos dedicada, aplicando patrones profesionales de comunicación HTTP, resiliencia defensiva, pruebas automatizadas, control de calidad y **observabilidad nativa de nivel corporativo (LGTM Stack + Grafana Alloy)**.

---

## 🏗️ 1. Arquitectura General y Topología de Red

El sistema implementa de forma estricta el patrón arquitectónico **Database-per-Microservice**. No existen llaves foráneas (`FOREIGN KEY`) cruzadas entre servidores MySQL independientes; la consistencia e integridad referencial de los datos distribuidos se gestiona en la capa de software a través de orquestación síncrona.

El ecosistema está completamente instrumentado de forma nativa (sin agentes pesados de transformación de bytecode) para enviar métricas, logs y trazas distribuidas hacia **Grafana Alloy**, el cual actúa como el recolector y distribuidor único hacia el stack de almacenamiento de Grafana.

```mermaid
graph TD
    %% =========================================================
    %% 💻 CAPA DE CLIENTE COLOFÓN (MÁQUINA REAL)
    %% =========================================================
    subgraph Host ["💻 Entorno Máquina Real Host"]
        UI[📱 Cliente HTTP / Resterm]
        GRAFANA_UI["📊 Grafana Dashboard (Puerto 3000)"]
    end

    %% =========================================================
    %% 🎛️ CAPA DE PERÍMETRO Y CONTROL (DOCKER SHARED NETWORK)
    %% =========================================================
    subgraph CapaControl ["🎛️ Capa de Perímetro, Control y Seguridad"]
        AppGateway[👑 API Gateway WebMVC <br> Puerto 8000]
        KeycloakServer[🔐 Keycloak Server <br> Puerto 8080]
    end

    %% =========================================================
    %% ⚙️ CAPA DE INFRAESTRUCTURA SPRING CLOUD
    %% =========================================================
    subgraph SpringCloud ["⚙️ Infraestructura Spring Cloud"]
        ConfigServer[☁️ Config Server <br> Puerto 9999]
        EurekaServer[📡 Eureka Server <br> Puerto 8761]
    end

    %% =========================================================
    %% 👥 CAPA DE MICROSERVICIOS DE NEGOCIO
    %% =========================================================
    subgraph SubUsers ["👥 Microservicio Usuarios (Puerto 8081)"]
        AppUsers[🍃 Spring Boot: users]
        DBUsers[(🐬 MySQL: usersdb)]
        AppUsers -->|localhost:3306| DBUsers
    end

    subgraph SubProducts ["📦 Microservicio Productos (Puerto 8080)"]
        AppProducts[🍃 Spring Boot: products]
        DBProducts[(🐬 MySQL: productsdb)]
        AppProducts -->|localhost:3306| DBProducts
    end

    %% =========================================================
    %% 🕵️‍♂️ CAPA DE TELEMETRÍA CENTRALIZADA (CORREGIDA CON ALTA LUMINOSIDAD)
    %% =========================================================
    subgraph TelemetryStack ["🕵️‍♂️ Stack de Observabilidad Centralizado LGTM"]
        ALLOY[⚙️ Grafana Alloy <br> OpenTelemetry Collector]
        PROM[(🔥 Prometheus)]
        LOKI[(🪵 Grafana Loki)]
        TEMPO[(⏱️ Grafana Tempo)]
    end

    %% =========================================================
    %% 🔄 FLUJOS LÓGICOS Y DIRECCIONAMIENTO DE TRÁFICO
    %% =========================================================
    UI ==>|"1a. POST /token"| KeycloakServer
    UI ==>|"1b. GET /api/... (Bearer JWT)"| AppGateway
    AppGateway ==>|"1c. Valida Criptografía JWKS"| KeycloakServer
    AppGateway -->|"2. Consulta Instancias"| EurekaServer
    AppGateway ==>|"3. Enruta lb://"| AppUsers
    AppGateway ==>|"3. Enruta lb://"| AppProducts
    AppUsers ==>|"4. Orquestación HTTP"| AppProducts

    AppUsers & AppProducts -.->|"Registra Instancia"| EurekaServer
    AppGateway & AppUsers & AppProducts -.->|"Descarga YAML"| ConfigServer

    AppGateway & AppUsers & AppProducts & KeycloakServer -.->|"Métricas, Logs y Trazas"| ALLOY
    ALLOY -->|Metrics| PROM
    ALLOY -->|Logs| LOKI
    ALLOY -->|Traces| TEMPO
    GRAFANA_UI -.->|Query| PROM & LOKI & TEMPO

    %% =========================================================
    %% 🎨 ESQUEMA DE COLORES E IDENTIDAD DE ALTO CONTRASTE (CORREGIDO)
    %% =========================================================
    style Host fill:#ffffff,stroke:#718093,stroke-width:2px,stroke-dasharray: 5 5
    style CapaControl fill:#fff2cc,stroke:#d67d00,stroke-width:3px
    style SpringCloud fill:#e2f0d9,stroke:#385723,stroke-width:3px
    style SubUsers fill:#fce4d6,stroke:#c65911,stroke-width:2px
    style SubProducts fill:#ddebf7,stroke:#2f5597,stroke-width:2px

    %% 🚀 FIX DE CONTRASTE: Fondo claro pastel con borde encendido de Grafana
    style TelemetryStack fill:#f5f6fa,stroke:#ff4a00,stroke-width:3px
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
    actor Cliente as 📱 Cliente / Resterm
    
    %% 🖥️ PARTICIPANTES DE LA ARQUITECTURA DISTRIBUIDA
    participant KC as 🔐 Keycloak (IdP)
    participant GW as 👑 API Gateway (WebMVC)
    participant CS as ☁️ Config Server
    participant EU as 📡 Eureka Server
    participant US as 👥 service-users (App)
    participant DB_U as 🐬 usersdb (MySQL)
    participant PS as 📦 service-products (App)
    participant DB_P as 🐬 productsdb (MySQL)

    %% =========================================================
    %% PHASE 1: ARRANQUE Y BOOTSTRAP (SEGUNDO PLANO)
    %% =========================================================
    Note over GW, PS: ⏳ Fase de Inicialización de Contenedores (Bootstrap)
    GW->>CS: GET /api-gateway/prod (Descarga Propiedades)
    US->>CS: GET /users/prod (Descarga Propiedades)
    PS->>CS: GET /products/prod (Descarga Propiedades)
    US->>EU: Registra Instancia: USERS (service-users)
    PS->>EU: Registra Instancia: PRODUCTS (service-products)

    %% =========================================================
    %% PHASE 2: AUTENTICACIÓN
    %% =========================================================
    rect rgb(255, 242, 204)
        Note over Cliente, KC: 🔐 Fase 1: Autenticación OAuth2 / OIDC
        Cliente->>KC: POST /protocol/openid-connect/token (Credentials)
        KC-->>Cliente: HTTP 200 OK (access_token JWT Firmado)
    end

    %% =========================================================
    %% PHASE 3: ORQUESTACIÓN PROTEGIDA DE NEGOCIO
    %% =========================================================
    rect rgb(226, 240, 217)
        Note over Cliente, DB_P: 🚀 Fase 2: Petición de Reporte Protegido vía Gateway
        Cliente->>GW: GET /api/users/usr-0001/report (Authorization: Bearer JWT)
        Note over GW: Interceptor de Seguridad:<br/>Extrae y verifica firma del JWT
        GW->>KC: GET /protocol/openid-connect/certs (Descarga JWKS Públicas)
        
        GW->>EU: Consulta ubicación de 'service-users'
        EU-->>GW: Responde IP: service-users:8081
        
        GW->>US: GET /api/users/usr-0001/report (Enruta Petición con Bearer JWT)
        Note over US: Micrometer Tracing:<br/>Inicializa y Propaga Trace ID Global
        
        %% Consulta Base de Datos Usuarios
        US->>DB_U: SQL: LEFT JOIN FETCH (users + users_products)
        Note over DB_U: Ejecuta Procedure local<br/>y mapea colección de IDs
        DB_U-->>US: Entidad User con lista de Claves Lógicas
        
        %% Consulta Inter-Servicio Balanceada usando Eureka
        Note over US: RestClient + @LoadBalanced:<br/>Busca 'products' en Eureka
        US->>EU: Consulta ubicación de 'products'
        EU-->>US: Responde IP: service-products:8080
        
        US->>PS: GET /api/products/{id} (Llamada HTTP síncrona)
        Note over PS: Recibe y mantiene Trace ID en Cabeceras W3C
        
        %% Consulta Base de Datos Productos
        PS->>DB_P: SQL: SELECT * FROM products WHERE id = ?
        DB_P-->>PS: Fila del Producto (Metadata)
        
        PS-->>US: HTTP 200 OK (ProductDTO JSON)
        
        Note over US: Mapea, une y compone el objeto final:<br/>UserAggregateReportDTO
        US-->>GW: HTTP 200 OK (JSON Enriquecido)
        GW-->>Cliente: HTTP 200 OK (JSON de Negocio Entregado)
    end
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

## 🧪 8. Pruebas de Integración y Seguridad Perimetral (Suite Curl)

Una vez que el entorno completo se encuentre arriba y Keycloak haya importado el Realm automatizado, puedes ejecutar las siguientes pruebas desde la terminal de tu máquina física para validar el circuito de seguridad OAuth2/OIDC.

### Paso 1: Autenticación Centralizada (Obtener Token JWT)

Solicita un token de acceso enviando las credenciales del usuario de laboratorio directamente a Keycloak:

```bash
curl -X POST "http://localhost:8082/realms/workshop-realm/protocol/openid-connect/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "grant_type=password" \
  -d "client_id=workshop-client" \
  -d "client_secret=KXEHeEXnT1VDTNkMKOKKPXTnvokF6mNZ" \
  -d "username=developer" \
  -d "password=security2026" | jq
```

> 💡 **Nota:** Copia el valor de la propiedad `"access_token"` que te devuelve el JSON de respuesta para usarlo en los siguientes comandos.

### Paso 2: Consultar Catálogo de Productos vía API Gateway

Envía la solicitud al puerto público unificado del Gateway (**Puerto 8001**), inyectando el token en la cabecera de autorización:

```bash
curl -v GET "http://localhost:8001/api/products/3d703247-54bc-47ef-a69d-7531a638022e" \
  -H "Accept: application/json" \
  -H "Authorization: Bearer <INSERTA_TU_TOKEN_AQUÍ>" \
  | jq
```

### Paso 3: Consultar Reporte Orquestado de Usuarios vía API Gateway

Valida la comunicación inter-servicio síncrona y balanceada enviando el mismo token de acceso perimetral:

```bash
curl -v GET "http://localhost:8001/api/users/usr-0001/report" \
  -H "Accept: application/json" \
  -H "Authorization: Bearer <INSERTA_TU_TOKEN_AQUÍ>" \
  | jq
```
