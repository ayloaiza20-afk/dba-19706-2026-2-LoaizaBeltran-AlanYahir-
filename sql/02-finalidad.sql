-- LAB-03 | Actividad 3: separación por finalidad
-- Consultas agregadas para analítica; no exponen identificadores directos.

SELECT ciudad, COUNT(*) AS cantidad_clientes
FROM clientes
GROUP BY ciudad
ORDER BY cantidad_clientes DESC, ciudad;

SELECT
    CASE
        WHEN edad IS NULL THEN 'Sin dato'
        WHEN edad < 18 THEN 'Menor de 18'
        WHEN edad BETWEEN 18 AND 29 THEN '18-29'
        WHEN edad BETWEEN 30 AND 44 THEN '30-44'
        WHEN edad BETWEEN 45 AND 59 THEN '45-59'
        ELSE '60 o más'
    END AS rango_edad,
    COUNT(*) AS cantidad
FROM clientes
GROUP BY 1
ORDER BY 1;

-- Vista con datos limitados para analítica.
CREATE OR REPLACE VIEW v_analitica_clientes AS
SELECT
    ciudad,
    CASE
        WHEN edad IS NULL THEN 'Sin dato'
        WHEN edad < 18 THEN 'Menor de 18'
        WHEN edad BETWEEN 18 AND 29 THEN '18-29'
        WHEN edad BETWEEN 30 AND 44 THEN '30-44'
        WHEN edad BETWEEN 45 AND 59 THEN '45-59'
        ELSE '60 o más'
    END AS rango_edad
FROM clientes;

SELECT ciudad, rango_edad, COUNT(*) AS cantidad
FROM v_analitica_clientes
GROUP BY ciudad, rango_edad
ORDER BY ciudad, rango_edad;


-- Actividad 6: ejemplo técnico para localizar los datos de un titular.
-- En un caso real, utilizar el identificador verificado por el procedimiento autorizado.
SELECT id, nombre, correo, telefono, rfc, edad, ciudad, codigo_postal, fecha_alta
FROM clientes
WHERE correo = 'ana@example.com';

-- Actividad 7: ejemplo de rectificación.
-- Ejecutar únicamente tras autorización y validación del titular.
-- Este ejemplo usa datos ficticios y una transacción para poder revisar el cambio.
BEGIN;
UPDATE clientes
SET correo = 'ana.actualizado@example.com'
WHERE id = 1;
SELECT id, nombre, correo FROM clientes WHERE id = 1;
-- Si el resultado es correcto, ejecutar COMMIT; si no, ejecutar ROLLBACK.
-- No ejecutes COMMIT y ROLLBACK a la vez.
