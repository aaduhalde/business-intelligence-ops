# ==========================================================
# Author: Alejandro Adrián Duhalde
# Role: Data Engineer / BI Analyst
# Description: Script to clean message data and detect bot response failure
# Created: 2026-03-13
# Contact: aaduhalde@outlook.es
# ==========================================================

import pandas as pd

# 1. Extracción
PATH = "/var/opt/mssql/data/sample-data/conversations.csv"
df = pd.read_csv(PATH)

# 2. Limpieza y Normalización
# Quitamos espacios en blanco y estandarizamos formatos
df['customer_name'] = df['customer_name'].str.strip().str.title()
df['channel'] = df['channel'].str.lower().str.strip()
df['message_text'] = df['message_text'].str.replace('"', '').str.strip()

# 3. Clasificación de Mensajes
# Separamos las consultas de clientes de las respuestas del bot
clientes_df = df[df['message_type'] == 'customer'].copy()
bot_df = df[df['message_type'] == 'agent'].copy()

# 4. Identificación de Fallos (Fricción)
# Filtramos respuestas donde el bot admite no entender o no tener stock
palabras_error = ['no entiendo', 'no comprendo', 'disculpa', 'no tenemos', 'no vendemos']
fallos_bot = bot_df[bot_df['message_text'].str.lower().str.contains('|'.join(palabras_error))]

# --- RESULTADOS ---
print("=== REPORTE DE LIMPIEZA DE DATOS ===")
print(f"Total de registros procesados: {len(df)}")
print(f"Mensajes de Clientes: {len(clientes_df)}")
print(f"Mensajes del Bot: {len(bot_df)}")

print("\n--- Distribución por Canal ---")
print(df['channel'].value_counts())

print("\n--- Alertas: Consultas no resueltas por el Bot ---")
if not fallos_bot.empty:
    # Mostramos el nombre del cliente y lo que el bot no pudo responder
    print(fallos_bot[['customer_name', 'message_text']].head(10))
else:
    print("No se detectaron fallos en las respuestas del bot.")

# Opcional: Guardar el resultado limpio
# df.to_csv("conversaciones_limpias.csv", index=False)