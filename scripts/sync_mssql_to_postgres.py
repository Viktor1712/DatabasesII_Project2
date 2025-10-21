import pyodbc
import psycopg2

MSSQL_CONN = {
    "server": "localhost,1433",
    "database": "master",
    "username": "sa",
    "password": "AdminPass123!"
}

POSTGRES_CONN = {
    "host": "localhost",
    "dbname": "sistema_medico",
    "user": "admin",
    "password": "admin123"
}

try:
    mssql = pyodbc.connect(
        f"DRIVER={{ODBC Driver 17 for SQL Server}};"
        f"SERVER={MSSQL_CONN['server']};DATABASE={MSSQL_CONN['database']};"
        f"UID={MSSQL_CONN['username']};PWD={MSSQL_CONN['password']}"
    )
    pg = psycopg2.connect(**POSTGRES_CONN)

    m_cursor = mssql.cursor()
    p_cursor = pg.cursor()

    m_cursor.execute("SELECT id, nombre, edad FROM paciente_integracion")
    for row in m_cursor.fetchall():
        p_cursor.execute("""
            INSERT INTO mssql_pacientes (id, nombre, edad)
            VALUES (%s, %s, %s)
            ON CONFLICT (id) DO UPDATE SET
                nombre = EXCLUDED.nombre,
                edad = EXCLUDED.edad
        """, (row[0], row[1], row[2]))
    pg.commit()

    print("✅ Sincronización completada correctamente")

except Exception as e:
    print(f"❌ Error: {e}")

finally:
    m_cursor.close()
    p_cursor.close()
    mssql.close()
    pg.close()
