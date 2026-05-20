CREATE TABLE IF NOT EXISTS alumnos (
	cedula VARCHAR(15) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	direccion VARCHAR(100),
	sexo VARCHAR(1),
	fecha_nacimiento date
);


-- Constraints
ALTER TABLE alumnos
ADD CONSTRAINT pk_alumno PRIMARY KEY (cedula);


-- Restricción 4 PDF
ALTER TABLE alumnos
ADD CONSTRAINT ck_sexo CHECK (sexo IN ('H', 'M'));


-- Restricción 5 PDF
-- Inserts
INSERT INTO
	alumnos (
		cedula,
		nombre,
		apellido,
		direccion,
		sexo,
		fecha_nacimiento
	)
VALUES
	(
		'10000001',
		'Ana',
		'Soto',
		'Calle 1 #2-3',
		'M',
		'2005-03-15'
	),
	(
		'10000002',
		'Pedro',
		'Duran',
		'Carrera 4 #5-6',
		'H',
		'2004-10-20'
	),
	(
		'10000003',
		'Carla',
		'Mendoza',
		'Avenida 7 #8-9',
		'M',
		'2006-01-12'
	);