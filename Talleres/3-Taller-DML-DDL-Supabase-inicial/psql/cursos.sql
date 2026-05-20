CREATE TABLE IF NOT EXISTS cursos (
	codcurso INTEGER NOT NULL,
	nombrecurso VARCHAR(50) NOT NULL,
	cedprofesor VARCHAR(15) NOT NULL,
	max_alumnos INTEGER,
	titulo VARCHAR(80),
	fecha_inicio date,
	fecha_fin date,
	num_horas NUMERIC(5, 2)
);


-- Contraints
ALTER TABLE cursos
ADD CONSTRAINT pk_curso PRIMARY KEY (codcurso);


-- Restricción 4 PDF
ALTER TABLE cursos
ADD CONSTRAINT fk_profesor_curso FOREIGN key (cedprofesor) REFERENCES profesores (cedula);


-- Restricción 6 PDF
ALTER TABLE cursos
ADD CONSTRAINT ck_minimo_alumnos_requeridos CHECK (max_alumnos >= 10);


-- Restricción 8.b PDF
ALTER TABLE cursos
ADD CONSTRAINT ck_minimo_num_horas CHECK (num_horas > 100);


-- Restricción 8.c PDF
ALTER TABLE cursos
ALTER COLUMN fecha_inicio
SET NOT NULL;


-- Restricción 11 PDF
-- Inserts
INSERT INTO
	cursos (
		codcurso,
		nombrecurso,
		cedprofesor,
		max_alumnos,
		titulo,
		fecha_inicio,
		fecha_fin,
		num_horas
	)
VALUES
	(
		101,
		'Base de Datos I',
		'12345678',
		30,
		'Certificación SQL Essentials',
		'2026-03-01',
		'2026-06-01',
		100.1
	),
	(
		102,
		'Programacion Web',
		'23456789',
		25,
		'Desarrollo Fullstack Junior',
		'2026-04-15',
		'2026-07-15',
		150
	),
	(
		103,
		'Redes de Datos',
		'34567890',
		20,
		'Admin de Redes Cisco',
		'2026-05-10',
		'2026-08-10',
		105
	);