#!/bin/bash
# ==========================================================
# Author: Alejandro Adrián Duhalde
# Role: Data Engineer / BI Analyst
# Description: Execute staging SQL scripts using external credentials
# Created: 2026-03-13
# Contact: aaduhalde@outlook.es
# ==========================================================

# 1. RUTA DEL ARCHIVO DE PASSWORD (Fuera del repo)
PASS_FILE="/home/aadm/GIT/aaduhalde/secrets/mssql.txt"

# 2. VALIDACIÓN: Comprobar si el archivo existe
if [ ! -f "$PASS_FILE" ]; then
    echo "ERROR: No se encontró el archivo de password en $PASS_FILE"
    exit 1
fi

# 3. LEER PASSWORD (Eliminando espacios o saltos de línea accidentales)
DB_PASS=$(cat "$PASS_FILE" | tr -d '\r\n' | xargs)

# 4. INFO SERVER
cat /etc/lsb-release
echo "************** USER: $USER"

# 5. TIME START
now1=$(date)
echo "************** START time: $now1"

# 6. CREATE DATABASE AND TABLES
sqlcmd -S localhost -U sa -P "$DB_PASS" -N -C < /home/aadm/GIT/aaduhalde/PUBLIC/business-intelligence-ops/staging/staging_tables.sql
sqlcmd -S localhost -U sa -P "$DB_PASS" -N -C < /home/aadm/GIT/aaduhalde/PUBLIC/business-intelligence-ops/analytics/analytics_tables.sql


# Crear carpeta de carga si no existe
# sudo mkdir -p /var/opt/mssql/data/sample-data
# Copiar tus archivos CSV 
# sudo cp /home/aadm/GIT/aaduhalde/PUBLIC/business-intelligence-ops/sample-data/*.csv /var/opt/mssql/data/sample-data/
# Darle la propiedad al usuario de SQL Server
# sudo chown -R mssql:mssql /var/opt/mssql/data/sample-data/


# 7. LOAD TABLES
sqlcmd -S localhost -U sa -P "$DB_PASS" -N -C < /home/aadm/GIT/aaduhalde/PUBLIC/business-intelligence-ops/staging/load_staging.sql
sqlcmd -S localhost -U sa -P "$DB_PASS" -N -C < /home/aadm/GIT/aaduhalde/PUBLIC/business-intelligence-ops/analytics/load_analytics_data.sql


# 7. TIME END
now2=$(date)
echo "*********** finished time: $now2"