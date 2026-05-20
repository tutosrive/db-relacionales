CREATE TABLE IF NOT EXISTS alumno_curso (
	cedula_alumno VARCHAR(15) NOT NULL,
	codcurso INTEGER NOT NULL
);


-- ALTER TABLE alumno_curso ADD CONSTRAINT ck_curso_existe CHECK (fk_alumno_curso_curso EXISTS)
-- Constraints
ALTER TABLE alumno_curso
ADD CONSTRAINT pk_alumno_curso PRIMARY KEY (cedula_alumno, codcurso);


-- Restricción 2 PDF, pk combinada permite N <-> N
ALTER TABLE alumno_curso
ADD CONSTRAINT fk_alumno_curso_curso FOREIGN key (codcurso) REFERENCES cursos (codcurso);


-- Restricción 1 PDF
ALTER TABLE alumno_curso
ADD CONSTRAINT fk_alumno_curso_alumno FOREIGN key (cedula_alumno) REFERENCES alumnos (cedula);


-- Inserts
INSERT INTO
	alumno_curso (cedula_alumno, codcurso)
VALUES
	('10000001', 101),
	('10000002', 101),
	('10000003', 102);


INSERT INTO
	alumno_curso (cedula_alumno, codcurso)
VALUES
	('10000001', 110);