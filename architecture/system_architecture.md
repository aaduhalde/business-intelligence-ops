# System Architecture

## Overview

This project implements a simplified **Business Intelligence and Data Analytics architecture** designed to transform omnichannel communication data into structured analytical datasets.

The system simulates how modern companies capture, process, and analyze customer interactions coming from messaging platforms such as:

- Instagram
- Facebook
- WhatsApp

The objective is to convert **unstructured conversations** into **structured business intelligence metrics**.

---

# High-Level Architecture

The system follows a layered data pipeline architecture.

Customer Messages  
(Instagram / Facebook / WhatsApp)

↓

Data Capture Layer  
(API / Webhook Simulation)

↓

Staging Layer  
(Raw Data Storage)

↓

Transformation Layer  
(Data Cleaning & Structuring)

↓

Analytics Layer  
(Optimized Data Model)

↓

Business Metrics (KPIs)

---

# Architecture Layers

## 1. Data Capture Layer

This layer represents the ingestion of customer interactions from messaging platforms.

In a real-world environment, this data would be collected using:

- Meta Webhooks
- Messaging APIs
- Event streaming services

In this project, the ingestion is simulated using CSV datasets.

Example sources:
- sample-data/conversations.csv
- sample-data/leads.csv
- sample-data/sales.csv


---

## 2. Staging Layer

The staging layer stores **raw ingested data** before any transformation occurs.

Purpose:

- Preserve original data
- Enable reproducible transformations
- Simplify debugging and auditing

Database schema:
-analytics.customer_interactions
-analytics.fact_sales
-analytics.dim_leads


These datasets allow efficient calculation of business metrics.

---

## 5. KPI Layer

The KPI layer contains analytical SQL queries used to generate business insights.

Examples include:

- message distribution by channel
- lead conversion rate
- revenue performance
- sales funnel metrics

These queries simulate the logic typically used by BI dashboards.

---

# Data Flow Summary

The complete pipeline operates as follows:

CSV Data Sources  
↓

Staging Tables  
↓

SQL Transformations  
↓

Analytics Tables  
↓

KPI Queries  
↓

Business Insights

---

# Technologies Used

This project is built using the following technologies:

Database:

- Microsoft SQL Server 2022

Data Processing:

- SQL
- Python (for ingestion simulation)

Environment:

- Linux development environment

---

# Design Principles

The architecture follows common **Data Engineering best practices**:

- Separation of staging and analytics layers
- Reproducible transformations
- Modular SQL scripts
- Structured repository organization

These practices mirror modern BI and analytics systems used in production environments.

---

# Potential Extensions

This architecture could be extended with:

- real-time ingestion pipelines
- cloud storage layers
- orchestration tools
- BI dashboards

Examples of potential integrations include Azure Data Factory, Power BI, or cloud-based data warehouses.

---

# Conclusion

This project demonstrates how omnichannel communication data can be transformed into structured analytics datasets that support business decision-making.

The architecture replicates the core components of modern **data engineering and business intelligence systems**.