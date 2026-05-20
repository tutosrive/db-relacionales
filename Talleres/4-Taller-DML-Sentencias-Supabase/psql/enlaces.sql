-- Tabla de prueba para Supabase (PostgreSQL)
CREATE TABLE enlaces (
	id INTEGER PRIMARY KEY,
	url VARCHAR(80) NOT NULL,
	notas VARCHAR(1024),
	cuenta INTEGER,
	creado TIMESTAMPTZ DEFAULT NOW()
);


-- Insertar una fila completa
INSERT INTO
	enlaces
VALUES
	(
		101,
		'http://dev.fyicenter.com',
		NULL,
		0,
		'2009-04-30'
	);


-- Forma recomendada: listar columnas explicitamente
-- INSERT INTO enlaces (id, url, notas, cuenta, creado)
-- VALUES (101, 'http://dev.fyicenter.com', NULL, 0, '2009-04-30');
-- La columna 'creado' tomara el valor de now() automaticamente
INSERT INTO
	enlaces (id, url, notas, cuenta)
VALUES
	(102, 'http://dba.fyicenter.com', NULL, 0);


-- Tambien puedes usar DEFAULT explicitamente:
-- INSERT INTO enlaces
-- VALUES (102, 'http://dba.fyicenter.com', NULL, 0, DEFAULT);
-- Opcion A: multiples filas con VALUES (recomendada en Supabase)
INSERT INTO
	enlaces (id, url, notas, cuenta, creado)
VALUES
	(
		201,
		'http://sitio-a.com',
		'Primer sitio',
		10,
		NOW()
	),
	(
		202,
		'http://sitio-b.com',
		'Segundo sitio',
		20,
		NOW()
	),
	(203, 'http://sitio-c.com', NULL, 0, NOW())
	-- Actualizar varias columnas de una fila específica
UPDATE enlaces
SET
	cuenta = 999,
	notas = 'Buen sitio.'
WHERE
	id = 101;


SELECT
	*
FROM
	enlaces
WHERE
	id = 101;


-- Incrementar 'id' en 1000 y duplicar 'cuenta' usando los valores actuales
UPDATE enlaces
SET
	id = id + 1000,
	cuenta = cuenta * 2
WHERE
	id >= 250;


-- Sintaxis PostgreSQL: UPDATE ... FROM ... (no Oracle)
-- Supone que existe una tabla 'empleados' con apellido, fecha_ing, empleado_id
UPDATE enlaces
SET
	notas = empleados.apellido,
	creado = empleados.fecha_ing
FROM
	empleados
WHERE
	empleados.empleado_id = enlaces.id
	AND enlaces.id < 110;


-- NOTA: La sintaxis Oracle de subquery en SET no funciona en PostgreSQL:
-- UPDATE enlaces SET (notas, creado) = (SELECT ...) -- INCORRECTO en PG
-- Eliminar la fila con id = 301
DELETE FROM enlaces
WHERE
	id = 301;


-- Verificar que fue eliminada:
SELECT
	*
FROM
	enlaces
WHERE
	id = 301;


-- Eliminar todas las filas donde id >= 250
DELETE FROM enlaces
WHERE
	id >= 250;


-- Eliminar filas por rango de fechas
DELETE FROM enlaces
WHERE
	creado < '2020-01-01';


-- Opcion A: DELETE sin WHERE (elimina fila por fila, mas lento)
DELETE FROM enlaces;


-- Opcion B: TRUNCATE (vacia la tabla de forma inmediata, mucho mas eficiente)
TRUNCATE TABLE enlaces;


SELECT
	*
FROM
	enlaces;


-- Iniciar una transaccion
BEGIN;


INSERT INTO
	enlaces (id, url, cuenta)
VALUES
	(301, 'http://nuevo-sitio.com', 0);


UPDATE enlaces
SET
	cuenta = cuenta + 1
WHERE
	id = 101;


-- Si todo esta correcto, confirmar los cambios:
COMMIT;


-- Si algo sale mal, deshacer todos los cambios:
-- ROLLBACK;