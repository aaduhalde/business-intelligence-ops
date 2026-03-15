/*
==========================================================
Author: Alejandro Adrián Duhalde
Role: Data Engineer / BI Analyst
Description: SQL script to initialize analytics schema and star schema tables.
==========================================================
*/
SELECT @@VERSION;
USE omnichannel_analytics_db;
GO

-- 1. Crear Esquema Analytics
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'analytics')
BEGIN
    EXEC('CREATE SCHEMA analytics');
    PRINT 'SUCCESS: Esquema [analytics] creado.';
END
GO

-- 2. Tabla: Interacciones de Clientes
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
GO

-- 3. Dimensión: Channel
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'dim_channel' AND schema_id = SCHEMA_ID('analytics'))
BEGIN
    CREATE TABLE analytics.dim_channel (
        channel_id INT IDENTITY PRIMARY KEY,
        channel_name VARCHAR(50)
    );
    PRINT 'SUCCESS: Tabla [analytics.dim_channel] creada.';
END
GO

-- 4. Dimensión: Lead
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'dim_leads' AND schema_id = SCHEMA_ID('analytics'))
BEGIN
    CREATE TABLE analytics.dim_leads (
        lead_id INT PRIMARY KEY,
        customer_name VARCHAR(100),
        channel VARCHAR(50),
        lead_status VARCHAR(50),
        created_at DATETIME
    );
    PRINT 'SUCCESS: Tabla [analytics.dim_leads] creada con columna de estado.';
END
GO

-- 5. Tabla de Hechos: Sales
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'fact_sales' AND schema_id = SCHEMA_ID('analytics'))
BEGIN
    CREATE TABLE analytics.fact_sales (
        sale_id INT PRIMARY KEY,
        lead_id INT,
        amount DECIMAL(10,2),
        sale_date DATETIME,
        CONSTRAINT FK_LeadSales FOREIGN KEY (lead_id) REFERENCES analytics.dim_leads(lead_id)
    );
    PRINT 'SUCCESS: Tabla [analytics.fact_sales] creada.';
END
GO