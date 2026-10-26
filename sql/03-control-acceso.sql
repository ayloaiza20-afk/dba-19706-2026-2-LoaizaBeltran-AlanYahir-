-- LAB-03 | Actividad 4: control de acceso por finalidad
-- Ejecutar como usuario administrador/propietario de los objetos.
-- El rol se crea sin inicio de sesión; no se le asigna contraseña.

CREATE ROLE analista NOLOGIN;

GRANT USAGE ON SCHEMA public TO analista;
GRANT SELECT ON v_analitica_clientes TO analista;

-- No otorgar SELECT sobre la tabla completa clientes.
-- Comprobación de privilegios concedidos:
SELECT grantee, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE grantee = 'analista'
ORDER BY table_name, privilege_type;

-- Comprobaciones adicionales:
SELECT has_table_privilege('analista', 'public.v_analitica_clientes', 'SELECT')
       AS puede_consultar_vista,
       has_table_privilege('analista', 'public.clientes', 'SELECT')
       AS puede_consultar_tabla_completa;
