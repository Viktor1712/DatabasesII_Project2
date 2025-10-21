# Sistema de Gestión de Estudios Médicos Distribuido

**Autores:**  
Víctor Gabriel Mejías Salas  
Jonathan Sancho  
Angie Aguilar Alemán  
José Arrienta  

---

## 🔹 Guía Paso a Paso

Esta guía muestra cómo levantar y probar todo el proyecto desde cero, incluyendo los comandos, contenedores y resultados esperados.

| Paso | Contenedor / Sistema | Comando | Resultado Esperado / Verificación |
|------|--------------------|---------|----------------------------------|
| 1 | Docker | `docker compose up -d` | Levanta PostgreSQL, SQL Server y MongoDB simulados. Verifica con `docker ps`. |
| 2 | PostgreSQL | `docker exec -it postgres_medico psql -U admin -f scripts/init_postgres.sql` | Crea bases y tablas locales: `pacientes`, `citas`, `resultados`, `ordenes_medicas`. Verificar con `\dt`. |
| 3 | SQL Server | `docker exec -it sqlserver_medico /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'AdminPass123!' -i scripts/sqlserver_setup.sql` | Crea tablas `paciente_integracion` y `facturas_externas` con columnas relevantes. Verificar con `SELECT * FROM paciente_integracion;`. |
| 4 | MongoDB (simulado) | `docker exec -it mongo_medico mongo scripts/mongodb_setup.js` | Crea colección `resultados_estudios`. Verificar con `db.resultados_estudios.find().pretty()`. |
| 5 | PostgreSQL | `docker exec -it postgres_medico psql -U admin -f scripts/postgresql_fdw_setup.sql` | Configura FDW hacia SQL Server (`tds_fdw`) y crea tabla simulada MongoDB `resultados_mongo_fdw`. Verificar con `SELECT * FROM paciente_integracion_fdw LIMIT 5;`. |
| 6 | PostgreSQL | `docker exec -it postgres_medico psql -U admin -f scripts/postgresql_roles.sql` | Crea roles internos FDW (`usr_fdw_pg_mssql`, `usr_fdw_pg_mongo`) y externos (`usr_api_web`, `usr_api_mobile`). Verificar con `\du` y `\z`. |
| 7 | Python | `python scripts/sync_mssql_to_postgres.py` | Sincroniza datos desde SQL Server hacia PostgreSQL. Verificar con `SELECT * FROM paciente_integracion_fdw LIMIT 5;`. |
| 8 | Python | `python scripts/sync_postgres_to_mongo.py` | Sincroniza datos desde PostgreSQL hacia tabla simulada MongoDB. Verificar con `SELECT * FROM resultados_mongo_fdw LIMIT 5;`. |
| 9 | PostgreSQL | `docker exec -it postgres_medico psql -U admin -f scripts/postgresql_queries.sql` | Ejecuta consultas de prueba combinando tablas locales y federadas, así como vistas para web y móvil. Verificar con `SELECT * FROM vista_web_pacientes LIMIT 5;` y `SELECT * FROM vista_mobile_citas LIMIT 5;`. |
| 10 | Docker | `docker compose down` | Detiene y elimina contenedores, redes y volúmenes. |

---

## 🔹 Archivos del proyecto y su función

| Archivo | Función |
|---------|--------|
| `docker-compose.yml` | Levanta todos los contenedores, define redes y volúmenes. |
| `Dockerfile` | Configura la imagen de SQL Server. |
| `Dockerfile.postgres` | Configura la imagen de PostgreSQL. |
| `init_postgres.sql` | Inicializa PostgreSQL con bases y tablas locales. |
| `sqlserver_setup.sql` | Inicializa SQL Server con tablas de integración. |
| `mongodb_setup.js` | Inicializa MongoDB con datos simulados. |
| `postgresql_fdw_setup.sql` | Configura FDW y tablas federadas hacia SQL Server y tabla simulada MongoDB. |
| `postgresql_roles.sql` | Crea roles internos/externos y asigna permisos. |
| `postgresql_queries.sql` | Contiene consultas de prueba sobre tablas locales, federadas y vistas. |
| `sync_mssql_to_postgres.py` | Sincroniza datos desde SQL Server hacia PostgreSQL. |
| `sync_postgres_to_mongo.py` | Sincroniza datos desde PostgreSQL hacia tabla simulada MongoDB. |

---

> ⚠️ **Nota técnica sobre MongoDB:**  
> Debido a incompatibilidades y errores de `mongo_fdw`, no fue posible realizar una integración directa. La tabla `resultados_mongo_fdw` en PostgreSQL simula la funcionalidad que tendría la conexión real. Esto permite que las pruebas, vistas y sincronizaciones funcionen sin errores y mantiene la coherencia del proyecto. Intentar usar `mongo_fdw` causaba errores de conexión y formatos de fecha incompatibles, por lo que se optó por la simulación como solución estable y funcional.

---
