/*
==========================================================
Author: Alejandro Adrián Duhalde
Role: Data Engineer / BI Analyst
Description: Uploading CSV data to Staging with prior cleaning
Created: 2026-03-13
Contact: aaduhalde@outlook.es
==========================================================
*/

SELECT @@VERSION;
USE omnichannel_analytics_db;
GO

-- Limpiar datos previos
PRINT 'INFO: Limpiando tablas de staging...';
TRUNCATE TABLE staging.conversations;
TRUNCATE TABLE staging.leads;
TRUNCATE TABLE staging.sales;
GO

-- Carga de Conversaciones
PRINT 'INFO: Cargando [staging.conversations]...';
BULK INSERT staging.conversations
FROM '/var/opt/mssql/data/sample-data/conversations.csv'
WITH (
    FIRSTROW = 2,
    FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'  
);

-- Carga de Leads
PRINT 'INFO: Cargando [staging.leads]...';
BULK INSERT staging.leads
FROM '/var/opt/mssql/data/sample-data/leads.csv'
WITH (
    FIRSTROW = 2,
    FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);

-- Carga de Sales
PRINT 'INFO: Cargando [staging.sales]...';
BULK INSERT staging.sales
FROM '/var/opt/mssql/data/sample-data/sales.csv'
WITH (
    FIRSTROW = 2,
    FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);
GO

-- Validación
PRINT '************** RESUMEN DE CARGA **************';
SELECT 'Conversations' AS Tabla, COUNT(*) AS Total FROM staging.conversations
UNION ALL
SELECT 'Leads', COUNT(*) FROM staging.leads
UNION ALL
SELECT 'Sales', COUNT(*) FROM staging.sales;
GO