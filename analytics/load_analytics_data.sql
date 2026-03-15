/*
==========================================================
Author: Alejandro Adrián Duhalde
Description: Unified ETL
==========================================================
*/
USE omnichannel_analytics_db;
GO

-- 1. LIMPIEZA DE TABLAS ANALÍTICAS
PRINT 'INFO: Limpiando tablas de la capa analytics...';
TRUNCATE TABLE analytics.fact_sales;
DELETE FROM analytics.dim_leads; 
TRUNCATE TABLE analytics.customer_interactions;

-- 2. CARGA DE DIM_LEADS 
PRINT 'INFO: Cargando dim_leads con estados...';
INSERT INTO analytics.dim_leads (
    lead_id, 
    customer_name, 
    channel, 
    lead_status,
    created_at
)
SELECT 
    lead_id, 
    customer_name, 
    source_channel, 
    status,
    created_at
FROM staging.leads;

-- 3. CARGA DE FACT_SALES
PRINT 'INFO: Cargando fact_sales...';
INSERT INTO analytics.fact_sales (sale_id, lead_id, amount, sale_date)
SELECT sale_id, lead_id, amount, sale_date
FROM staging.sales;

-- 4. CARGA DE CUSTOMER_INTERACTIONS
PRINT 'INFO: Cargando customer_interactions...';
INSERT INTO analytics.customer_interactions (
    conversation_id, customer_name, channel, message_type, created_at
)
SELECT 
    conversation_id, customer_name, LOWER(channel), message_type, created_at
FROM staging.conversations
WHERE message_type = 'customer';

PRINT '************** PROCESO ANALYTICS FINALIZADO **************';
SELECT 
    (SELECT COUNT(*) FROM analytics.dim_leads) AS leads,
    (SELECT COUNT(*) FROM analytics.fact_sales) AS ventas,
    (SELECT COUNT(*) FROM analytics.customer_interactions) AS interacciones;
GO