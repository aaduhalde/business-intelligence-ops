# Business Intelligence Ops
### BI Dashboards, KPI Tracking & Operational Analytics Platform

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Google Sheets](https://img.shields.io/badge/Google_Sheets-34A853?style=for-the-badge&logo=googlesheets&logoColor=white)

---

## Project Overview

This repository represents the **Business Intelligence layer** of a complete data platform.

It demonstrates how to transform raw data into:
- **Actionable insights**
- **Business KPIs**
- **Interactive dashboards**

The focus is not only technical, but also **business-driven analytics**.

---

## Objective

Enable companies to:
- Understand their performance through data
- Track key business metrics (KPIs)
- Make faster and better decisions

---

## Business Problem

Organizations often struggle with:

- Lack of visibility into key metrics  
- Manual and slow reporting processes  
- Disconnected data sources  
- Difficulty identifying trends and performance issues  

---

## Solution

A complete BI system that:

1. Connects multiple data sources (DW, APIs, Sheets)  
2. Transforms raw data into analytical datasets  
3. Defines and tracks business KPIs  
4. Builds interactive dashboards (Power BI)  
5. Enables real-time decision-making  

---

## Architecture

```text
Data Sources (DW / APIs / Sheets)
   ↓
Data Transformation (SQL / Python)
   ↓
Analytical Layer (Views / Models)
   ↓
Power BI Dashboards
```

---

## Repository Structure
```text
business-intelligence-ops/
├── assets/                         # El "escaparate" del repositorio
│   ├── images/                     # Capturas de pantalla de alta resolución
│   │   ├── lead_funnel_db.png
│   │   ├── market_intelligence_summary.png
│   │   └── operational_kpis.png
│   └── documentation/              # PDFs con Business Case o explicaciones de KPIs
├── dashboards/                     # Archivos fuente de BI
│   ├── powerbi/
│   │   ├── Market_Intelligence_v1.pbix
│   │   └── AutoLead_Analytics_v1.pbix
│   └── templates/                  # Archivos .pbit (plantillas sin datos)
├── reports/                        # Enlaces y resúmenes ejecutivos
│   ├── external_links.md           # Links a dashboards publicados (Looker, Web Publish)
│   └── executive_summaries/        # Markdown con insights clave por tablero
│       ├── summary_market_intel.md
│       └── summary_lead_ops.md
├── sql_logic/                      # Cómo transformaste los datos para BI
│   ├── views/                      # Vistas SQL de Azure SQL
│   │   ├── vw_fact_leads.sql
│   │   └── vw_skill_matching_metrics.sql
│   └── measures/                   # Fórmulas DAX documentadas
│       └── dax_kpis.txt
└── README.md                       # El documento principal (tu base corregida)
```

---

## Core Data Analyst Skills Demonstrated
# Business Data Analysis

What it means:
Understanding how a business performs through data.

What I do:

- Define KPIs
- Analyze trends
- Detect problems and opportunities

# Key metrics

- Revenue, Profit, Margin
- CAC, LTV, Churn
- Conversion Rate
- Average Ticket

Example:

Dashboard tracking:
- Revenue
- New customers
- Retention rate

# Descriptive Statistics

Used to understand and summarize data:

- Mean (average)
- Median
- Mode
- Standard deviation
- Percentiles
- Distribution analysis
- Outlier detection

Examples:

- Analyze average customer ticket
- Detect variability in sales
- Identify top 10% customers

## Dashboard Use Cases

- Operational Performance
- KPI tracking
- Workflow monitoring
- Process efficiency
- Sales & Marketing
- Funnel analysis
- Conversion rates
- Campaign performance
- Business Insights
- Trend analysis
- Performance comparison
- Decision support

## Case Study: Market Intelligence Analysis
** Business Problem
Companies lack visibility into:

- Job market trends
- In-demand skills
- Salary benchmarks

# KPIs & Metrics

- Average salary by country
- Demand growth rate (%)
- Top skills frequency
- Salary distribution (percentiles)

# Analysis Performed
Trend analysis (job demand over time)

Descriptive statistics:
- Mean salary
- Median vs Mean (skew detection)
- Standard deviation (market variability)
- Percentiles (top-paying roles)
- Distribution analysis
- Outlier detection

# Key Insights

- Salary distribution is highly skewed
- Demand for SQL + Python increased significantly
- Some markets show high variability (instability)
- Top 10% roles earn ~3x the average salary

# Business Decisions Enabled
- Focus hiring on high-demand skills
- Benchmark salaries competitively
- Identify emerging markets
- Optimize training investments

## Integration with Data Platform
This project is part of a larger ecosystem:

- Data Warehouse → structured datasets
- BI Layer (this repo) → dashboards & insights
- AI Agents → automation & data capture

# Business Impact

- Faster decision-making
- Reduced manual reporting
- Better visibility into operations
- Alignment between data and strategy

Ensures a complete flow from data generation → analysis → decision