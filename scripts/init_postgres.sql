-- Extensiones
CREATE EXTENSION IF NOT EXISTS multicorn;
CREATE EXTENSION IF NOT EXISTS tds_fdw;

-- MSSQL FDW
CREATE SERVER mssql_server
  FOREIGN DATA WRAPPER tds_fdw
  OPTIONS (servername 'sqlserver_medico', port '1433', database 'master');

CREATE USER MAPPING FOR admin
  SERVER mssql_server
  OPTIONS (username 'sa', password 'AdminPass123!');

CREATE FOREIGN TABLE mssql_pacientes (
  id INT,
  nombre VARCHAR,
  edad INT
)
SERVER mssql_server
OPTIONS (query 'SELECT id, nombre, edad FROM paciente_integracion');

-- MongoDB FDW con Multicorn
CREATE SERVER mongo_server FOREIGN DATA WRAPPER multicorn
  OPTIONS (wrapper 'multicorn.mongo_fdw.MongoFDW');

CREATE FOREIGN TABLE mongo_pacientes (
  _id text,
  nombre text,
  edad int
)
SERVER mongo_server
OPTIONS (
  database 'medico_db',
  collection 'pacientes',
  host 'mongodb_medico',
  port '27017'
);
