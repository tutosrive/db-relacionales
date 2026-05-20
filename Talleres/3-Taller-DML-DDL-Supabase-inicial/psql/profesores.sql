CREATE TABLE IF NOT EXISTS profesores (
	cedula VARCHAR(15) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	direccion VARCHAR(100),
	titulo VARCHAR(80),
	cuota_hora NUMERIC(10, 2) NOT NULL
);


-- Constraints
ALTER TABLE profesores
ADD CONSTRAINT ck_cuota CHECK (cuota_hora > 0);


-- Restricción 3 PDF
ALTER TABLE profesores
ADD CONSTRAINT pk_profesor PRIMARY KEY (cedula);


-- Restricción 4 PDF
ALTER TABLE profesores
ADD COLUMN edad INTEGER;


-- Restricción 7 PDF
ALTER TABLE profesores
ADD CONSTRAINT uq_cedula UNIQUE (cedula);


-- Resticción 6 PDF
ALTER TABLE profesores
ADD CONSTRAINT ck_edad_prof CHECK (edad BETWEEN 18 AND 65);


-- Restricción 8.a PDF
ALTER TABLE profesores
ALTER COLUMN cuota_hora
DROP NOT NULL;


-- Restricción 10 PDF
-- Inserts
INSERT INTO
	profesores (
		cedula,
		nombre,
		apellido,
		direccion,
		titulo,
		cuota_hora,
		edad
	)
VALUES
	(
		'12345678',
		'Juan',
		'Perez',
		'Calle 10 #5-20',
		'Ingeniero de Sistemas',
		50.00,
		45
	),
	(
		'23456789',
		'Maria',
		'Gomez',
		'Carrera 15 #10-30',
		'Licenciada en Matematicas',
		45.50,
		32
	),
	(
		'34567890',
		'Luis',
		'Rodriguez',
		'Avenida Central 45',
		'Magister en Fisica',
		60.00,
		27
	);