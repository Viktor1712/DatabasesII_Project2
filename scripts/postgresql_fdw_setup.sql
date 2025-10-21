-- ===========================================================
-- 🔧 Configuración FDW para comunicación distribuida
-- ===========================================================

-- Extensiones
CREATE EXTENSION IF NOT EXISTS tds_fdw;
CREATE EXTENSION IF NOT EXISTS mongo_fdw;

-- ==== Servidor SQL Server ====
CREATE SERVER sqlserver_srv
FOREIGN DATA WRAPPER tds_fdw
OPTIONS (servername 'sqlserver_medico', port '1433', database 'IntegracionExterna');

CREATE USER MAPPING FOR admin
SERVER sqlserver_srv
OPTIONS (username 'sa', password 'AdminPass123!');

IMPORT FOREIGN SCHEMA dbo
LIMIT TO (paciente_integracion)
FROM SERVER sqlserver_srv INTO public;

-- ==== Servidor MongoDB ====
CREATE SERVER mongo_srv
FOREIGN DATA WRAPPER mongo_fdw
OPTIONS (address 'mongodb_medico', port '27017');

CREATE USER MAPPING FOR admin
SERVER mongo_srv
OPTIONS (username '', password '');

CREATE FOREIGN TABLE resultados_mongo (
    id_estudio INT,
    paciente TEXT,
    tipo TEXT,
    resultado JSONB,
    fecha DATE,
    sucursal TEXT
)
SERVER mongo_srv
OPTIONS (database 'analitica_medica', collection 'resultados_estudios');
