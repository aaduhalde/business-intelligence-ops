/*
==========================================================
Author: Alejandro Adrián Duhalde
Role: Data Engineer / BI Analyst
Description: 
Created: 2026-03-13
Contact: aaduhalde@outlook.es
==========================================================
*/
SELECT @@VERSION;
USE omnichannel_analytics_db;
GO

-- 1. Limpieza de la tabla destino 
PRINT 'INFO: Limpiando capa de analytics...';
TRUNCATE TABLE analytics.customer_interactions;

-- 2. Inserción con Transformación básica
PRINT 'INFO: Cargando datos desde staging...';
INSERT INTO analytics.customer_interactions (
    conversation_id,
    customer_name,
    channel,
    message_type,
    created_at
)
SELECT 
    conversation_id,
    customer_name,
    LOWER(channel), 
    message_type,
    created_at
FROM staging.conversations
WHERE message_type = 'customer'; 

-- 3. Resumen de ejecución
PRINT '************** CARGA ANALYTICS FINALIZADA **************';
SELECT COUNT(*) AS registros_cargados FROM analytics.customer_interactions;
GO