import os
import psycopg2
from pymongo import MongoClient
from psycopg2.extras import RealDictCursor

PG_HOST = os.getenv("PG_HOST", "postgres_medico")
PG_DB   = os.getenv("PG_DB", "sistema_medico")
PG_USER = os.getenv("PG_USER", "admin")
PG_PASS = os.getenv("PG_PASS", "admin123")
PG_PORT = int(os.getenv("PG_PORT", 5432))

MONGO_URI = os.getenv("MONGO_URI", "mongodb://mongodb_medico:27017")
MONGO_DB  = os.getenv("MONGO_DB", "analitica_medica")
MONGO_COLL = os.getenv("MONGO_COLL", "resultados_estudios")

def fetch_postgres_rows():
    conn = psycopg2.connect(host=PG_HOST, dbname=PG_DB, user=PG_USER, password=PG_PASS, port=PG_PORT)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute("SELECT id, nombre, apellido, edad FROM paciente_local;")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return rows

def upsert_mongo(rows):
    client = MongoClient(MONGO_URI)
    db = client[MONGO_DB]
    coll = db[MONGO_COLL]
    for r in rows:
        doc = {
            "id_paciente": int(r["id"]),
            "nombre": r["nombre"],
            "apellido": r["apellido"],
            "edad": r["edad"]
        }
        coll.update_one({"id_paciente": doc["id_paciente"]}, {"$set": doc}, upsert=True)
    client.close()

def main():
    rows = fetch_postgres_rows()
    if not rows:
        print("No hay filas para sincronizar.")
        return
    upsert_mongo(rows)
    print(f"Sincronizadas {len(rows)} filas a MongoDB.{MONGO_DB}.{MONGO_COLL}")

if __name__ == "__main__":
    main()
