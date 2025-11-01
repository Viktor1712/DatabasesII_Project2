import os



BASE_DIR = os.getcwd()



# ========= ESTRUCTURA DE CARPETAS =========

estructura = {

    "docker": ["mssql-data", "mongo-data"],

    "postgres": [],

    "scripts": [],

}



# ========= ARCHIVOS A CREAR =========

archivos = {

    "docker-compose.yml": """version: '3.8'

services:

  mssql:

    image: mcr.microsoft.com/mssql/server:2022-latest

    container_name: mssql-dev

    environment:

      ACCEPT_EULA: "Y"

      MSSQL_SA_PASSWORD: "MiP4ssw0rdSegura!"

      MSSQL_PID: "Developer"

    ports:

      - "1433:1433"

    volumes:

      - ./docker/mssql-data:/var/opt/mssql



  mongo:

    image: mongo:6.0

    container_name: mongo-dev

    ports:

      - "27017:27017"

    volumes:

      - ./docker/mongo-data:/data/db



  mongo-express:

    image: mongo-express

    container_name: mongo-express

    environment:

      ME_CONFIG_MONGODB_SERVER: mongo

    ports:

      - "8081:8081"

    depends_on:

      - mongo

""",



    "scripts/init_postgres.sql": """CREATE ROLE usr_fdw_pg_mssql LOGIN PASSWORD 'fdw_mssql_pw' NOSUPERUSER;

CREATE ROLE usr_fdw_pg_mongo LOGIN PASSWORD 'fdw_mongo_pw' NOSUPERUSER;

CREATE ROLE usr_api_web LOGIN PASSWORD 'api_web_pw' NOSUPERUSER;

CREATE ROLE usr_api_mobile LOGIN PASSWORD 'api_mobile_pw' NOSUPERUSER;



GRANT USAGE ON SCHEMA public TO usr_api_web, usr_api_mobile;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO usr_api_web, usr_api_mobile;

""",



    "scripts/test_query.sql": """SELECT p.id_paciente, p.id_aseguradora, s.estado_facturacion

FROM paciente_integracion p

LEFT JOIN resultados_estudios s ON p.id_paciente = s.id_estudio;

""",



    "postgres/install_fdw.sh": """#!/bin/bash

# Instalador de extensiones FDW para PostgreSQL



echo "🚀 Iniciando instalación de FDW..."



sudo apt update

sudo apt install -y postgresql-server-dev-all git make gcc



# ===============================

# Instalar tds_fdw (para SQL Server)

# ===============================

echo "🧩 Instalando tds_fdw..."

cd /tmp

git clone https://github.com/tds-fdw/tds_fdw.git

cd tds_fdw

make && sudo make install



# ===============================

# Instalar mongo_fdw (para MongoDB)

# ===============================

echo "🍃 Instalando mongo_fdw..."

cd /tmp

git clone https://github.com/EnterpriseDB/mongo_fdw.git

cd mongo_fdw

make && sudo make install



echo "✅ Instalación de FDW completada!"

""",



    "readme.md": (

        "# Proyecto Sistema de Gestión de Estudios Médicos Distribuido\n\n"

        "## Componentes principales\n"

        "- PostgreSQL: base transaccional principal\n"

        "- SQL Server: integración externa y facturación\n"

        "- MongoDB: capa analítica y reportes\n"

        "- FDW: tds_fdw y mongo_fdw\n\n"

        "## Comandos básicos\n"

        "1. Levantar contenedores: `docker compose up -d`\n"

        "2. Crear roles: `sudo -u postgres psql -f scripts/init_postgres.sql`\n"

        "3. Instalar FDW: `bash postgres/install_fdw.sh`\n"

    )

}



# ========= CREAR CARPETAS =========

print("📁 Creando estructura de carpetas...")

for carpeta, subcarpetas in estructura.items():

    os.makedirs(carpeta, exist_ok=True)

    for sub in subcarpetas:

        os.makedirs(os.path.join(carpeta, sub), exist_ok=True)



# ========= CREAR ARCHIVOS =========

print("📝 Creando archivos...")

for ruta, contenido in archivos.items():

    dir_name = os.path.dirname(ruta)

    if dir_name:

        os.makedirs(dir_name, exist_ok=True)

    with open(ruta, "w") as f:

        f.write(contenido)



# ========= MOSTRAR RESULTADO =========

print("\n✅ Proyecto creado con éxito!\n")

for root, dirs, files in os.walk(BASE_DIR):

    level = root.replace(BASE_DIR, "").count(os.sep)

    indent = " " * 4 * level

    print(f"{indent}{os.path.basename(root)}/")

    subindent = " " * 4 * (level + 1)

    for f in files:

        print(f"{subindent}{f}")



print("\n🎉 Todo listo para iniciar el proyecto.")

print("👉 Próximos pasos:")

print("  docker compose up -d")

print("  sudo service postgresql start")

print("  sudo -u postgres psql -f scripts/init_postgres.sql")

print("  bash postgres/install_fdw.sh")

