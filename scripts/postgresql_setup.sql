-- ===========================================================
-- 🔧 Configuración Base de Datos PostgreSQL
-- ===========================================================

-- Crear tablas de pacientes (segmentación horizontal)
CREATE TABLE pacientes_san_jose (
    id_paciente SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_nacimiento DATE,
    direccion TEXT,
    telefono VARCHAR(15),
    correo VARCHAR(50)
);

CREATE TABLE pacientes_cartago (
    id_paciente SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_nacimiento DATE,
    direccion TEXT,
    telefono VARCHAR(15),
    correo VARCHAR(50)
);

-- Tabla de citas
CREATE TABLE citas (
    id_cita SERIAL PRIMARY KEY,
    id_paciente INT NOT NULL,
    fecha TIMESTAMP NOT NULL,
    id_medico INT,
    tipo_estudio VARCHAR(50),
    estado VARCHAR(20)
);
