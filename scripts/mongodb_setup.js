// ===========================================================
// 🔧 Configuración Base de Datos MongoDB
// ===========================================================
use analitica_medica;

// Colección de resultados de estudios
db.resultados_estudios.insertMany([
    {
        "id_estudio": 1,
        "paciente": "José Pérez",
        "tipo": "Ultrasonido",
        "resultado": {"descripcion":"Normal"},
        "fecha": "2025-10-07",
        "sucursal": "San José"
    },
    {
        "id_estudio": 2,
        "paciente": "María López",
        "tipo": "Radiografía",
        "resultado": {"descripcion":"Fractura leve"},
        "fecha": "2025-10-07",
        "sucursal": "Cartago"
    }
]);

// Colección de indicadores mensuales
db.indicadores_mensuales.insertOne({
    "mes": "2025-10",
    "pacientes_atendidos": 200,
    "ingresos_totales": 45000
});
