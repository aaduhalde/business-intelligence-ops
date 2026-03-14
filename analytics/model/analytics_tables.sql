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

-- 1. Esquema Analytics
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'analytics')
BEGIN
    EXEC('CREATE SCHEMA analytics');
    PRINT 'SUCCESS: Esquema [analytics] creado.';
END
GO

-- 2. Tabla de Hechos: Interacciones
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'customer_interactions' AND schema_id = SCHEMA_ID('analytics'))
BEGIN
    CREATE TABLE analytics.customer_interactions (
        conversation_id INT,
        customer_name VARCHAR(100),
        channel VARCHAR(50),
        message_type VARCHAR(50),
        created_at DATETIME
    );
    PRINT 'SUCCESS: Tabla [analytics.customer_interactions] creada.';
END
ELSE 
    PRINT 'INFO: La tabla [analytics.customer_interactions] ya existe.';
GO