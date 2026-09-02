# 📚 Recursos Técnicos y Referencias del Workshop

Este archivo compila los enlaces oficiales, tutoriales de arquitectura y plantillas de infraestructura recomendadas para profundizar en los conceptos de observabilidad, patrones de diseño y despliegue del taller.

---

## 🏛️ 1. Código Fuente y Arquitectura Base

### 📦 Repositorio del Proyecto

> [**GitHub - Workshop Team Bancolombia**](https://github.com)

<details>
<summary>🔍 Ver previsualización del recurso</summary>

- **Tipo:** Repositorio Oficial de Código Fuente.
- **Descripción:** Contiene los microservicios distribuidos (`products` y `users`), configuraciones multi-perfil de Spring Boot, scripts SQL de base de datos distribuidas y la suite de rendimiento con k6.
</details>

### 💡 Teoría e Ingeniería de Software

> [**GeeksforGeeks - Portal de Aprendizaje All-in-One**](https://geeksforgeeks.org)

<details>
<summary>🔍 Ver previsualización del recurso</summary>

- **Tipo:** Plataforma Educativa y de Referencia Core.
- **Descripción:** Documentación técnica integral sobre estructuras de datos, configuración de microservicios, bases de datos y fundamentos de administración de redes de contenedores.
</details>

---

## 📐 2. Patrones de Diseño de Software (Design Patterns)

### 🎨 Catálogo de Refactoring Guru

> [**Refactoring Guru - Patrones de Diseño en Español**](https://refactoring.guru)

<details>
<summary>🔍 Ver previsualización del recurso</summary>

- **Tipo:** Guía Visual de Arquitectura.
- **Descripción:** Explicación detallada de los 22 patrones estructurales, creacionales y de comportamiento clásicos, incluyendo guías paso a paso con ejemplos de código en Java y técnicas de refactorización.
</details>

### ☕ Patrones de Diseño Nativos en Java

> [**Java Design Patterns - Colección de Arquitectura Abierta**](https://java-design-patterns.com)

<details>
<summary>🔍 Ver previsualización del recurso</summary>

- **Tipo:** Repositorio de Patrones Java.
- **Descripción:** Implementaciones formales y probadas en entornos reales de producción de patrones de software desarrollados por arquitectos expertos de la comunidad de código abierto.
</details>

---

## 📊 3. Observabilidad Core (Prometheus & Grafana)

### 🚀 Guías de Monitoreo de Spring Boot Actuator

> [**Masterspringboot - Spring Boot 3.x Monitoring Stack**](https://masterspringboot.com/spring-boot-actuator/spring-boot-monitoring-with-grafana-and-prometheus/)

<details>
<summary>🔍 Ver previsualización del recurso</summary>

- **Tipo:** Tutorial de Configuración Avanzada.
- **Descripción:** Guía paso a paso sobre el uso de la API Micrometer Observation unificada en Spring Boot 3.x, exposición de endpoints `/actuator/prometheus` y alertas con Alertmanager.
</details>

> [**Time4Digital - Setting up Prometheus, Grafana and Spring Boot**](https://www.time4digital.lu/en/article/setting-up-promethaus-grafana-and-spring-boot)

<details>
<summary>🔍 Ver previsualización del recurso</summary>

- **Tipo:** Artículo de Integración de Infraestructura.
- **Descripción:** Configuración del colector Prometheus utilizando el hostname interno de Docker `host.docker.internal` para extraer telemetría.
</details>

### 🖥️ Cuadros de Mando (Dashboards)

> [**Grafana Labs - Repositorio Oficial de Dashboards**](https://grafana.com/grafana/dashboards/)

<details>
<summary>🔍 Ver previsualización del recurso</summary>

- **Tipo:** Repositorio de Plantillas Visuales.
- **Descripción:** Catálogo oficial para importar cuadros de mando preconfigurados para JVM (Micrometer), uso de CPU, recolección de basura e hilos de Tomcat.
</details>

---

## 🐳 4. Orquestación y Despliegues con Docker & Kubernetes

### 🛠️ Plantillas de Docker Compose Multistack

> [**GitHub - ivangfr / Spring Boot ELK, Prometheus & Grafana Stack**](https://github.com/ivangfr/springboot-elk-prometheus-grafana/blob/master/docker-compose.yml)

<details>
<summary>🔍 Ver previsualización del recurso</summary>

- **Tipo:** Script de Configuración YAML de Producción.
- **Descripción:** Archivo de Docker Compose de referencia para levantar contenedores interconectados de bases de datos, APIs de Java, Prometheus y Grafana dentro de una red puente.
</details>

### 📚 Enlaces Adicionales de Monitoreo Distribuido

> [**Uptrace - Monitoring Spring Boot Microservices with Actuator and OpenTelemetry**](https://uptrace.dev/blog/spring-boot-microservices-monitoring)

<details>
<summary>🔍 Ver previsualización del recurso</summary>

- **Tipo:** Guía Técnica de Telemetría.
- **Descripción:** Análisis detallado para recopilar métricas y propagar el contexto de trazas mediante OpenTelemetry a través de las fronteras de los microservicios, correlacionando logs y latencias p99.
</details>

- [**Medium (S. N. Germiyanoglu) - Monitoring Spring Boot on Docker & Kubernetes**](https://sngermiyanoglu.medium.com/monitoring-spring-boot-with-prometheus-grafana-on-docker-and-kubernetes-942bd9bd0013) — Estrategias para despliegue de telemetría y sondas de salud en clústeres.
- [**Medium (Guru S.) - Setup for Spring Boot Applications**](https://medium.com) — Métricas de infraestructura base.
- [**DevGenius - Microservices Monitoring with Prometheus, Grafana & Zipkin**](https://devgenius.io) — Integración de trazabilidad distribuida.

---

## 🪵 5. Gestión de Logs Centralizada (Grafana Loki)

### 📝 Guías de Configuración de Loki

> [**Baeldung - Spring Boot Loki & Grafana Logging**](https://www.baeldung.com/spring-boot-loki-grafana-logging)

<details>
<summary>🔍 Ver previsualización del recurso</summary>

- **Tipo:** Guía Técnica de Referencia.
- **Descripción:** Implementación práctica del appender `loki-logback-appender` para enviar e indexar trazas de consola directamente hacia el agregador de Grafana Loki sin generar overhead.
</details>

> [**Medium (H. Himanshu) - Logging and Monitoring with Loki and Grafana**](https://medium.com/@bectorhimanshu/logging-and-monitoring-in-springboot-with-loki-and-visualizing-loki-logs-in-grafana-f15bad714996)

<details>
<summary>🔍 Ver previsualización del recurso</summary>

- **Tipo:** Tutorial de Configuración de Trazas.
- **Descripción:** Explicación técnica de cómo correlacionar excepciones en frío y logs de hilos con los paneles visuales de Grafana para auditorías SRE rápidos.
</details>

---

## 🎨 6. Diseño Visual para Ingenieros de Software

> [**Medium - Graphic Design for Software Engineers and Architects**](https://medium.com)

<details>
<summary>🔍 Ver previsualización del recurso</summary>

- **Tipo:** Artículo de Diseño y Comunicación Técnica.
- **Descripción:** Principios fundamentales de comunicación visual y diseño gráfico aplicados a la elaboración de diagramas de arquitectura, documentación y diagramas de secuencia profesionales.
</details>
