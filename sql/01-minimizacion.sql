-- LAB-03 | Actividad 2: minimización de datos
-- Ejecutar después de 00-preparacion.sql.

CREATE TABLE IF NOT EXISTS clientes_soporte (
    id BIGINT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    telefono VARCHAR(20)
);

INSERT INTO clientes_soporte (id, nombre, correo, telefono)
SELECT id, nombre, correo, telefono
FROM clientes
ON CONFLICT (id) DO UPDATE
SET nombre = EXCLUDED.nombre,
    correo = EXCLUDED.correo,
    telefono = EXCLUDED.telefono;

SELECT * FROM clientes_soporte ORDER BY id;
