USE omnichannel_analytics_db;
GO

SELECT 
    channel, 
    COUNT(*) AS total_messages,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS DECIMAL(10,2)) AS percentage
FROM analytics.customer_interactions
GROUP BY channel
ORDER BY total_messages DESC;
GO