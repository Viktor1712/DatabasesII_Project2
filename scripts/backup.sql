--
-- PostgreSQL database cluster dump
--

\restrict QGGMOXYm898wPYXBrFbgDKVdvbEaIlmSOdB959zy1lAIXPdgWedWoCPW3qetODm

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE mongo_fdw;
ALTER ROLE mongo_fdw WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:yrol/IMvllvc0G18ioXsRg==$ZYgondeZJt0G7SCkzArE1qATjH7eh0iKnYs7fNZLO54=:jbRuEe3j4IWj/5rsmglBvZPFYny2/XltIDnDotR+KI8=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:MdorCQcL0YN/+SDeV+OnOg==$902zPpfxNVOaaAjnjGaEmRQtMSa40I8g9a83fqfexX8=:K99gvduNfPm/V2W33+TZQ+yVGQobbSdTWeZlh3JFd0k=';
CREATE ROLE usr_api_mobile;
ALTER ROLE usr_api_mobile WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:hQ+B1NRsNOeiLcER/QXg2A==$N3FZwlQ8H17i6qCmYtbKMDPfv2bUucg+a9q1ilRx2hE=:UmnJ3gZMJANI1T2DwpcjL6LxzgwOaXQsaUR4SfQRFj8=';
CREATE ROLE usr_fdw_pg_mongo;
ALTER ROLE usr_fdw_pg_mongo WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:AySt08x54qvk/buEDnFB2g==$b9zM8701MM2k1HyUthQWghWV+lGvvGSJC583ANZMbvM=:cv5zr5B7cTBKUiKXXuNm0ed29ZdDtG02YysrSxAexCY=';
CREATE ROLE usr_fdw_pg_mssql;
ALTER ROLE usr_fdw_pg_mssql WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:4xOXoB7aUJPe28kAC52Icw==$UZNnD3dbi9dfkZPXvpQ++xO0yRFVdBwxcaysemmtkWo=:kf3AiE5JHwsZecrgOWLscwkps0BLKABtQKZQAtR02Z0=';

--
-- User Configurations
--








\unrestrict QGGMOXYm898wPYXBrFbgDKVdvbEaIlmSOdB959zy1lAIXPdgWedWoCPW3qetODm

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict YgqljovXrpUFfa8OS6SRjaiIveQgl1LoflORTyK5GWz2MUvM5BgSLqed93LPSRP

-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict YgqljovXrpUFfa8OS6SRjaiIveQgl1LoflORTyK5GWz2MUvM5BgSLqed93LPSRP

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict inqAai48jf7Y8a40vCDQV6ennLfqB0RJDLy2jM8kkSjfAxJY2jd5h7t5DZVPwDS

-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: mongo_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS mongo_fdw WITH SCHEMA public;


--
-- Name: EXTENSION mongo_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION mongo_fdw IS 'foreign data wrapper for MongoDB access';


--
-- Name: tds_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tds_fdw WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION tds_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tds_fdw IS 'Foreign data wrapper for querying a TDS database (Sybase or Microsoft SQL Server)';


--
-- Name: mongo_server; Type: SERVER; Schema: -; Owner: postgres
--

CREATE SERVER mongo_server FOREIGN DATA WRAPPER mongo_fdw OPTIONS (
    address 'mongo-dev',
    port '27017'
);


ALTER SERVER mongo_server OWNER TO postgres;

--
-- Name: USER MAPPING usr_fdw_pg_mongo SERVER mongo_server; Type: USER MAPPING; Schema: -; Owner: postgres
--

CREATE USER MAPPING FOR usr_fdw_pg_mongo SERVER mongo_server OPTIONS (
    password 'mongopass',
    username 'mongouser'
);


--
-- PostgreSQL database dump complete
--

\unrestrict inqAai48jf7Y8a40vCDQV6ennLfqB0RJDLy2jM8kkSjfAxJY2jd5h7t5DZVPwDS

--
-- Database "sistema_medico" dump
--

--
-- PostgreSQL database dump
--

\restrict XysvM3Zc4fIGVWwhVmpj2HQPyOGyoXrSSsfWwJ0W0jzIeE4PmZ70JQnknRGJbaU

-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: sistema_medico; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE sistema_medico WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE sistema_medico OWNER TO postgres;

\unrestrict XysvM3Zc4fIGVWwhVmpj2HQPyOGyoXrSSsfWwJ0W0jzIeE4PmZ70JQnknRGJbaU
\connect sistema_medico
\restrict XysvM3Zc4fIGVWwhVmpj2HQPyOGyoXrSSsfWwJ0W0jzIeE4PmZ70JQnknRGJbaU

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: fdw_ext; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA fdw_ext;


ALTER SCHEMA fdw_ext OWNER TO postgres;

--
-- Name: sistema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sistema;


ALTER SCHEMA sistema OWNER TO postgres;

--
-- Name: mongo_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS mongo_fdw WITH SCHEMA public;


--
-- Name: EXTENSION mongo_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION mongo_fdw IS 'foreign data wrapper for MongoDB access';


--
-- Name: tds_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tds_fdw WITH SCHEMA public;


--
-- Name: EXTENSION tds_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tds_fdw IS 'Foreign data wrapper for querying a TDS database (Sybase or Microsoft SQL Server)';


--
-- Name: registrar_estudio_distribuido(integer, character varying, integer, character varying, json, date, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.registrar_estudio_distribuido(p_id integer, p_nombre character varying, p_edad integer, p_tipo_estudio character varying, p_resultado json, p_fecha date, p_sucursal character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

DECLARE

    v_id_aseguradora INT;

    v_estado_facturacion VARCHAR(50);

BEGIN

    -- 1️⃣ Insertar en tabla local de PostgreSQL

    INSERT INTO pacientes_local (id, nombre, edad)

    VALUES (p_id, p_nombre, p_edad)

    ON CONFLICT (id) DO NOTHING;



    RAISE NOTICE '✅ Paciente registrado en PostgreSQL.';



    -- 2️⃣ Consultar datos de facturación desde SQL Server

    SELECT id_aseguradora, estado_facturacion

    INTO v_id_aseguradora, v_estado_facturacion

    FROM mssql_pacientes

    WHERE id = p_id;



    RAISE NOTICE '✅ Facturación obtenida desde SQL Server: %, %', v_id_aseguradora, v_estado_facturacion;



    -- 3️⃣ Insertar resumen en MongoDB

    INSERT INTO resumen_estudios (_id, id_estudio, paciente, tipo_estudio, resultado, fecha, sucursal)

    VALUES (

        gen_random_uuid(),  -- genera un UUID como _id

        p_id,

        p_nombre,

        p_tipo_estudio,

        p_resultado,

        p_fecha,

        p_sucursal

    );



    RAISE NOTICE '✅ Resumen enviado a MongoDB.';



END;

$$;


ALTER FUNCTION public.registrar_estudio_distribuido(p_id integer, p_nombre character varying, p_edad integer, p_tipo_estudio character varying, p_resultado json, p_fecha date, p_sucursal character varying) OWNER TO postgres;

--
-- Name: tds_fdw_handler(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tds_fdw_handler() RETURNS fdw_handler
    LANGUAGE c STRICT
    AS '/usr/lib/postgresql/18/lib/tds_fdw.so', 'tds_fdw_handler';


ALTER FUNCTION public.tds_fdw_handler() OWNER TO postgres;

--
-- Name: tds_fdw_validator(text[], oid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tds_fdw_validator(options text[], catalog oid) RETURNS void
    LANGUAGE c STRICT
    AS '/usr/lib/postgresql/18/lib/tds_fdw.so', 'tds_fdw_validator';


ALTER FUNCTION public.tds_fdw_validator(options text[], catalog oid) OWNER TO postgres;

--
-- Name: tds_fdw; Type: FOREIGN DATA WRAPPER; Schema: -; Owner: postgres
--

CREATE FOREIGN DATA WRAPPER tds_fdw HANDLER public.tds_fdw_handler VALIDATOR public.tds_fdw_validator;


ALTER FOREIGN DATA WRAPPER tds_fdw OWNER TO postgres;

--
-- Name: mongo_srv; Type: SERVER; Schema: -; Owner: postgres
--

CREATE SERVER mongo_srv FOREIGN DATA WRAPPER mongo_fdw OPTIONS (
    address 'mongo-dev',
    port '27017'
);


ALTER SERVER mongo_srv OWNER TO postgres;

--
-- Name: USER MAPPING postgres SERVER mongo_srv; Type: USER MAPPING; Schema: -; Owner: postgres
--

CREATE USER MAPPING FOR postgres SERVER mongo_srv OPTIONS (
    password 'strongpassword',
    username 'usr_fdw_pg_mongo'
);


--
-- Name: mssql_server; Type: SERVER; Schema: -; Owner: postgres
--

CREATE SERVER mssql_server FOREIGN DATA WRAPPER tds_fdw OPTIONS (
    database 'sistema_medico',
    port '1433',
    servername 'mssql-dev'
);


ALTER SERVER mssql_server OWNER TO postgres;

--
-- Name: mssql_srv; Type: SERVER; Schema: -; Owner: postgres
--

CREATE SERVER mssql_srv FOREIGN DATA WRAPPER tds_fdw OPTIONS (
    database 'test_fdw',
    port '1433',
    servername 'mssql-dev'
);


ALTER SERVER mssql_srv OWNER TO postgres;

--
-- Name: USER MAPPING postgres SERVER mssql_srv; Type: USER MAPPING; Schema: -; Owner: postgres
--

CREATE USER MAPPING FOR postgres SERVER mssql_srv OPTIONS (
    password 'YourStrong!Passw0rd',
    username 'sa'
);


--
-- Name: mssql_pacientes; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.mssql_pacientes (
    id integer,
    nombre character varying(100),
    edad integer,
    id_aseguradora integer,
    estado_facturacion character varying(50)
)
SERVER mssql_srv
OPTIONS (
    table_name 'pacientes'
);


ALTER FOREIGN TABLE public.mssql_pacientes OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: pacientes_local; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pacientes_local (
    id integer NOT NULL,
    nombre character varying(100),
    edad integer
);


ALTER TABLE public.pacientes_local OWNER TO postgres;

--
-- Name: resultados_estudios; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.resultados_estudios (
    id_estudio integer,
    paciente character varying(100),
    tipo character varying(50),
    resultado json,
    fecha date,
    sucursal character varying(50)
)
SERVER mongo_srv
OPTIONS (
    collection 'resultados',
    database 'medicos'
);


ALTER FOREIGN TABLE public.resultados_estudios OWNER TO postgres;

--
-- Name: resumen_estudios; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.resumen_estudios (
    _id name,
    id_estudio integer,
    paciente character varying(100),
    tipo_estudio character varying(50),
    resultado json,
    fecha date,
    sucursal character varying(50)
)
SERVER mongo_srv
OPTIONS (
    collection 'resumen_estudios',
    database 'medicos'
);


ALTER FOREIGN TABLE public.resumen_estudios OWNER TO postgres;

--
-- Name: vista_pacientes_facturacion; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_pacientes_facturacion AS
 SELECT p.id,
    p.nombre,
    p.edad,
    m.id_aseguradora,
    m.estado_facturacion
   FROM (public.pacientes_local p
     LEFT JOIN public.mssql_pacientes m ON ((p.id = m.id)));


ALTER VIEW public.vista_pacientes_facturacion OWNER TO postgres;

--
-- Data for Name: pacientes_local; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pacientes_local (id, nombre, edad) FROM stdin;
1	Ana López	28
2	Luis Fernández	35
\.


--
-- Name: pacientes_local pacientes_local_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes_local
    ADD CONSTRAINT pacientes_local_pkey PRIMARY KEY (id);


--
-- Name: FOREIGN SERVER mongo_srv; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON FOREIGN SERVER mongo_srv TO usr_fdw_pg_mongo;
GRANT ALL ON FOREIGN SERVER mongo_srv TO mongo_fdw;


--
-- Name: FOREIGN SERVER mssql_srv; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON FOREIGN SERVER mssql_srv TO usr_fdw_pg_mssql;


--
-- PostgreSQL database dump complete
--

\unrestrict XysvM3Zc4fIGVWwhVmpj2HQPyOGyoXrSSsfWwJ0W0jzIeE4PmZ70JQnknRGJbaU

--
-- PostgreSQL database cluster dump complete
--

