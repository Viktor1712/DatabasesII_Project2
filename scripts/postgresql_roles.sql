-- ===========================================================
-- 🔧 Configuración de Roles y Permisos
-- ===========================================================

-- Roles internos
CREATE ROLE usr_fdw_pg_mssql LOGIN PASSWORD 'fdw_pass';
GRANT USAGE ON FOREIGN SERVER sqlserver_srv TO usr_fdw_pg_mssql;

CREATE ROLE usr_fdw_pg_mongo LOGIN PASSWORD 'fdw_pass';
GRANT USAGE ON FOREIGN SERVER mongo_srv TO usr_fdw_pg_mongo;

-- Roles externos (aplicaciones)
CREATE ROLE usr_api_web LOGIN PASSWORD 'web_pass';
CREATE ROLE usr_api_mobile LOGIN PASSWORD 'mobile_pass';

-- Conceder permisos de lectura sobre vistas/tablas
GRANT SELECT ON ALL TABLES IN SCHEMA public TO usr_api_web;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO usr_api_mobile;
