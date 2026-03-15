# Business Intelligence & Operations Hub

![Data Modeling](https://img.shields.io/badge/Data_Modeling-Star_Schema-blue)
![Data Quality](https://img.shields.io/badge/Data_Quality-Validated-green)

[![Data Driven](https://img.shields.io/badge/Strategy-Data--Driven-blueviolet?style=flat)](#)
[![Analytics](https://img.shields.io/badge/Analytics-Real--time-0088CC?style=flat&logo=google-analytics)](#)
[![Integrations](https://img.shields.io/badge/Stack-APIs%20%7C%20Webhooks%20%7C%20BI-orange?style=flat)](#)


## Data Modeling | Data Pipeline | Analytics

This repository implements a **Business Intelligence and Operational Analytics platform** designed to transform omnichannel communication data into structured datasets for performance analysis and decision making.

The project demonstrates a **production-style data workflow**, including data ingestion, staging, transformation, analytics modeling, and KPI generation.

It simulates how businesses can transform conversations from platforms such as **Instagram, Facebook, and WhatsApp** into actionable insights.

---

# Architecture Overview

The system follows a simplified **data warehouse pipeline** architecture.
```text
Customer Messages (Instagram / Facebook / WhatsApp)
↓
Data Capture (API / Webhook simulation)
↓
Staging Tables
↓
Data Transformation (SQL)
↓
Analytics Tables
↓
Business KPIs
```

The objective is to convert **unstructured conversational data** into **structured analytical datasets**.

---

# Repository Structure

```text
business-intelligence-ops
│
├── analytics
│   ├── kpi
│   │   ├── conversion_rate.sql
│   │   ├── lead_funnel.sql
│   │   ├── messages_by_channel.sql
│   │   └── revenue_metrics.sql
│   │
│   └── load_analytics_data.sql
│
├── architecture
│   └── system_architecture.md
│
├── data-model
│   ├── analytics_tables.sql
│   └── staging_tables.sql
│
├── staging
│   └── load_staging.sql
│
├── etl
│   └──  capture_messages.py
│
├── sample-data
│   ├── conversations.csv
│   ├── leads.csv
│   └── sales.csv
│
├── bootstrap.sh
└── README.md
```

---

# Data Pipeline Layers

### 1. Staging Layer

Raw data ingestion from CSV files simulating messaging platforms.

Tables:

- `staging.conversations`
- `staging.leads`
- `staging.sales`

Purpose:

- preserve raw data
- enable reproducible transformations

---

### 2. Transformation Layer

SQL transformations clean and structure the staging data before loading it into the analytics model.

Examples:

- lead normalization
- sales aggregation
- message classification

---

### 3. Analytics Layer

Structured datasets optimized for analysis.

Example tables:
- analytics.customer_interactions
- analytics.fact_sales
- analytics.dim_leads


These tables power KPI calculations and reporting queries.

---

# Key Business Metrics (KPIs)

The repository includes several analytical queries that simulate business dashboards.

### Channel Message Distribution

Measures interaction volume by channel.

Example output:

| Channel | Messages | % |
|-------|-------|------|
| Instagram | 45 | 45% |
| WhatsApp | 35 | 35% |
| Facebook | 20 | 20% |

---

### Conversion Rate

Measures the percentage of leads that become customers.

---

### Revenue Metrics

Calculates:

- total revenue
- average order value
- revenue trends

---

### Lead Funnel

Tracks customer progression through the sales funnel.

---

# Sample Data

The repository includes synthetic datasets to simulate a real operational environment.

```text
sample-data
├── conversations.csv
├── leads.csv
└── sales.csv
```


These datasets allow the full pipeline to run without external dependencies.

---

# Database

The project is designed to run on:

- **Microsoft SQL Server 2022**

Compatible with:

- Linux
- Local development environments
- Cloud deployments such as Azure SQL.

---

# Use Case

This project demonstrates how companies can:

- centralize omnichannel communication data
- track customer engagement
- monitor sales performance
- build operational dashboards

Typical industries include:

- marketing automation
- customer service analytics
- digital sales operations
- CRM intelligence systems

---

# Learning Goals

This repository demonstrates practical skills in:

- Data Engineering
- SQL Data Modeling
- ETL Pipelines
- Business Intelligence
- Analytics Architecture