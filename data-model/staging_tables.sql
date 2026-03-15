/*
==========================================================
Author: Alejandro Adrián Duhalde
Role: Data Engineer / BI Analyst
Description: Create Staging Tables
==========================================================
*/

SELECT @@VERSION;
USE omnichannel_analytics_db;
GO

-- 1. Crear el esquema staging si no existe
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'staging')
BEGIN
    EXEC('CREATE SCHEMA staging');
    PRINT 'SUCCESS: Esquema [staging] creado.';
END
GO

-- 2. Tabla: staging.conversations
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'conversations' AND schema_id = SCHEMA_ID('staging'))
BEGIN
    CREATE TABLE staging.conversations (
        conversation_id INT,
        channel VARCHAR(50),
        customer_name VARCHAR(100),
        message_text VARCHAR(500),
        message_type VARCHAR(50),
        created_at DATETIME
    );
    PRINT 'SUCCESS: Tabla [staging.conversations] creada.';
END
ELSE PRINT 'INFO: La tabla [staging.conversations] ya existe.';

-- 3. Tabla: staging.leads
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'leads' AND schema_id = SCHEMA_ID('staging'))
BEGIN
    CREATE TABLE staging.leads (
        lead_id INT,
        customer_name VARCHAR(100),
        source_channel VARCHAR(50),
        status VARCHAR(50),
        created_at DATE
    );
    PRINT 'SUCCESS: Tabla [staging.leads] creada.';
END
ELSE PRINT 'INFO: La tabla [staging.leads] ya existe.';

-- 4. Tabla: staging.sales
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'sales' AND schema_id = SCHEMA_ID('staging'))
BEGIN
    CREATE TABLE staging.sales (
        sale_id INT,
        lead_id INT,
        amount DECIMAL(10,2),
        sale_date DATE
    );
    PRINT 'SUCCESS: Tabla [staging.sales] creada.';
END
ELSE PRINT 'INFO: La tabla [staging.sales] ya existe.';
GO