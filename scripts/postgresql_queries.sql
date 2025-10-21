-- ===========================================================
-- 🔧 Consultas y transacciones distribuidas
-- ===========================================================

-- Consulta combinada PostgreSQL ↔ SQL Server
SELECT p.nombre, p.fecha_nacimiento, i.estado_facturacion
FROM pacientes_san_jose p
LEFT JOIN paciente_integracion i
ON p.id_paciente = i.id_paciente;

-- Inserción en PostgreSQL y actualización en MongoDB
INSERT INTO citas (id_paciente, fecha, id_medico, tipo_estudio, estado)
VALUES (1, '2025-10-18 10:00', 101, 'Radiografía', 'Pendiente');

INSERT INTO resultados_mongo (id_estudio, paciente, tipo, resultado, fecha, sucursal)
VALUES (101, 'José Pérez', 'Radiografía', '{"diagnostico":"Normal"}', '2025-10-18', 'San José');
