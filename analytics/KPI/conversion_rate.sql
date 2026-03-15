/*
==========================================================
Author: Alejandro Adrián Duhalde
Role: Data Engineer / BI Analyst
Description: SQL KPI for conversion rates using the Analytics Star Schema.
==========================================================
*/
USE omnichannel_analytics_db;
GO

SELECT
    l.channel,
    COUNT(DISTINCT l.lead_id) AS total_leads,
    COUNT(DISTINCT s.sale_id) AS total_sales,
    CAST(
        ISNULL(COUNT(DISTINCT s.sale_id), 0) * 1.0 / 
        NULLIF(COUNT(DISTINCT l.lead_id), 0) 
    AS DECIMAL(10,4)) AS conversion_rate
FROM analytics.dim_leads l
LEFT JOIN analytics.fact_sales s ON l.lead_id = s.lead_id
GROUP BY l.channel
ORDER BY conversion_rate DESC;