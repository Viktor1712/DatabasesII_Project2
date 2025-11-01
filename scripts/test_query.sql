SELECT p.id_paciente, p.id_aseguradora, s.estado_facturacion

FROM paciente_integracion p

LEFT JOIN resultados_estudios s ON p.id_paciente = s.id_estudio;

