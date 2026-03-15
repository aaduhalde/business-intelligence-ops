/*
==========================================================
Author: Alejandro Adrián Duhalde
Role: Data Engineer / BI Analyst
Description: SQL lead funnel analysis using the Analytics Star Schema.
==========================================================
*/
USE omnichannel_analytics_db;
GO

SELECT
    lead_status AS status, 
    COUNT(*) AS volume,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS DECIMAL(10,2)) AS share_percentage,
    REPLICATE('█', CAST(COUNT(*) * 20.0 / NULLIF(SUM(COUNT(*)) OVER(), 0) AS INT)) AS visualization
FROM analytics.dim_leads
GROUP BY lead_status
ORDER BY 
    CASE lead_status 
        WHEN 'new' THEN 1 
        WHEN 'contacted' THEN 2 
        WHEN 'qualified' THEN 3 
        WHEN 'converted' THEN 4 
        WHEN 'lost' THEN 5 
        ELSE 6 
    END;
GO