/*
==========================================================
Author: Alejandro Adrián Duhalde
Role: Data Engineer / BI Analyst
Description: SQL revenue metrics and channel performance using the Analytics Star Schema.
==========================================================
*/
USE omnichannel_analytics_db;
GO

-- 1. Métricas Globales (Basado en Hechos)
SELECT
    SUM(amount) AS total_revenue,
    AVG(amount) AS ticket_promedio,
    COUNT(sale_id) AS volumen_ventas,
    SUM(amount) * 0.30 AS estimated_profit 
FROM analytics.fact_sales;

-- 2. Desglose por Canal (Joins entre Dimensiones y Hechos)
SELECT 
    l.channel,
    SUM(s.amount) AS revenue_by_channel,
    COUNT(s.sale_id) AS sales_count,
    CAST(SUM(s.amount) * 100.0 / SUM(SUM(s.amount)) OVER() AS DECIMAL(10,2)) AS revenue_share_pct
FROM analytics.fact_sales s
JOIN analytics.dim_leads l ON s.lead_id = l.lead_id
GROUP BY l.channel
ORDER BY revenue_by_channel DESC;

-- 3. Análisis de Tendencia Temporal
SELECT 
    CAST(sale_date AS DATE) AS date,
    SUM(amount) AS daily_revenue,
    COUNT(*) AS daily_sales
FROM analytics.fact_sales
GROUP BY CAST(sale_date AS DATE)
ORDER BY date;