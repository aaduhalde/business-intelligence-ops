# Business Intelligence & Ops Hub

![Data Modeling](https://img.shields.io/badge/Data_Modeling-Star_Schema-blue)
![Data Quality](https://img.shields.io/badge/Data_Quality-Validated-green)

[![Data Driven](https://img.shields.io/badge/Strategy-Data--Driven-blueviolet?style=flat)](#)
[![Analytics](https://img.shields.io/badge/Analytics-Real--time-0088CC?style=flat&logo=google-analytics)](#)
[![Integrations](https://img.shields.io/badge/Stack-APIs%20%7C%20Webhooks%20%7C%20BI-orange?style=flat)](#)

Este repositorio es el núcleo de **Inteligencia de Negocios y Control Operativo**. Aquí se centralizan las soluciones diseñadas para transformar el flujo de comunicación omnicanal en activos de datos estructurados, permitiendo una toma de decisiones basada en evidencia y métricas de rendimiento (KPIs).

---

## Ecosistema de Datos y Análisis

El sistema funciona como un *pipeline* de datos que captura, procesa y visualiza la información crítica del negocio en tres niveles:

### 1. [Analytics: Tablero Inteligente de Ventas](management/sales-dashboard.md)
* **Enfoque:** Análisis financiero y proyecciones de ingresos.
* **KPIs Clave:** Ingresos brutos, ticket promedio, tasa de conversión y crecimiento mensual.
* **Valor:** Gráficos dinámicos en Google Sheets que detectan tendencias de venta y salud financiera.

### 2. [Data Capture: Organizador de Mensajes IG/FB](management/message-organizer.md)
* **Enfoque:** Estructuración de datos no organizados (Unstructured Data).
* **KPIs Clave:** Volumen de consultas por canal, estados del funnel (leads) y tiempos de respuesta.
* **Valor:** Convierte chats dispersos en una base de datos relacional para seguimiento comercial.

### 3. [Infrastructure: Conectividad Webhooks & APIs](integrations/webhooks-api.md)
* **Enfoque:** Integración y flujo de datos (Data Pipeline).
* **Función:** El motor técnico que garantiza la integridad de los datos desde las plataformas de Meta hacia los paneles de control en tiempo real.

---

## Flujo de Ingeniería de Datos

```mermaid
graph LR
    A[Fuentes: IG / FB / WA] --> B{Pipeline de Integración}
    B --> C[Almacenamiento Estructurado]
    C --> D[Capa de Análisis / BI]
    D --> E[Toma de Decisiones Estratégicas]
    
    style B fill:#f96,stroke:#333,stroke-width:2px
    style D fill:#0088CC,stroke:#fff,stroke-width:2px