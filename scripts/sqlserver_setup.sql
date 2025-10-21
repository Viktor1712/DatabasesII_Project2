-- ===========================================================
-- 🔧 Configuración Base de Datos SQL Server
-- ===========================================================

USE master;
GO
IF DB_ID('IntegracionExterna') IS NULL
BEGIN
    CREATE DATABASE IntegracionExterna;
END
GO

USE IntegracionExterna;
GO

-- Tabla de integración vertical
CREATE TABLE paciente_integracion (
    id_paciente INT PRIMARY KEY,
    id_aseguradora INT,
    codigo_externo VARCHAR(50),
    estado_facturacion VARCHAR(20)
);
GO

-- Tabla de facturas externas
CREATE TABLE facturas_externas (
    id_factura INT PRIMARY KEY,
    id_paciente INT,
    monto DECIMAL(10,2),
    fecha DATE
);
GO
