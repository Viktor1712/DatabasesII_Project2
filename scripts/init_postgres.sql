CREATE ROLE usr_fdw_pg_mssql LOGIN PASSWORD 'fdw_mssql_pw' NOSUPERUSER;

CREATE ROLE usr_fdw_pg_mongo LOGIN PASSWORD 'fdw_mongo_pw' NOSUPERUSER;

CREATE ROLE usr_api_web LOGIN PASSWORD 'api_web_pw' NOSUPERUSER;

CREATE ROLE usr_api_mobile LOGIN PASSWORD 'api_mobile_pw' NOSUPERUSER;



GRANT USAGE ON SCHEMA public TO usr_api_web, usr_api_mobile;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO usr_api_web, usr_api_mobile;

