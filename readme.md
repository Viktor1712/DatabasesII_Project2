# Proyecto Sistema de Gestión de Estudios Médicos Distribuido

## Componentes principales
- PostgreSQL: base transaccional principal
- SQL Server: integración externa y facturación
- MongoDB: capa analítica y reportes
- FDW: tds_fdw y mongo_fdw

## Comandos básicos
1. Levantar contenedores: `docker compose up -d`
2. Crear roles: `sudo -u postgres psql -f scripts/init_postgres.sql`
3. Instalar FDW: `bash postgres/install_fdw.sh`

#Video
https://youtu.be/qpu8K_EAfVc
