-- 1. Mostrar los nombres de todos los estudiantes.
-- pi nombre (estudiante)

-- 2. Mostrar nombre y ciudad de estudiantes de Sistemas.
-- pi nombre, ciudad (estudiante)

-- 3. Mostrar estudiantes de Manizales.
-- sigma ciudad = 'Manizales' (estudiante)

-- 4. Mostrar estudiantes con semestre mayor a 4.
-- sigma semestre > 4 (estudiante)

-- 5. Mostrar nombre y carrera de estudiantes de Pereira.
-- PereiraStudents = sigma ciudad = 'Pereira' (estudiante)
-- pi nombre, carrera (PereiraStudents)

-- 6. Mostrar cursos de 4 créditos.
-- sigma creditos = 4 (curso)

-- 7. Mostrar cursos del departamento Computación.
-- sigma departamento = 'Computacion' (curso)

-- 8. Mostrar profesores del departamento Electrónica.
-- sigma departamento = 'Electronica' (profesor)

-- 9. Mostrar electivas del departamento Civil.
-- sigma departamento = 'Civil' (electiva)

-- 10. Mostrar estudiantes cuyo semestre sea 3.
-- sigma semestre = 3 (estudiante)

-- # Nivel 2 — Operaciones de conjuntos
-- (∪ ∩ −)

-- 11. Mostrar todos los estudiantes activos y egresados.
estudiante ∪ egresado

-- 12. Mostrar todas las personas activas, egresadas e intercambio.
estudiante ∪ egresado ∪ intercambio

-- 13. Mostrar estudiantes que NO son egresados.
-- mal; debe ser diferencia, no unión
-- estudiante ∪ intercambio

-- 14. Mostrar personas de Sistemas entre estudiante y intercambio.
-- studentSystem = sigma carrera = 'Sistemas' (estudiante)
-- intChange = sigma carrera = 'Sistemas' (intercambio)
-- studentSystem ∪ intChange 

-- 15. Mostrar ciudades presentes tanto en estudiante como egresado.
-- studentCities = pi ciudad (estudiante)
-- egresCities = pi ciudad (egresado)
-- studentCities ∩ egresCities 

-- 16. Mostrar estudiantes que no están en intercambio.
-- NOTE: I Understand like "all students including 'egresado' but excluding 'interchange'
-- mal; otra vez usaste unión cuando era exclusión.
estudiante ∪ egresado

-- 17. Mostrar cursos obligatorios y electivas.
-- curso ∪ electiva

-- 18. Mostrar carreras presentes en estudiante pero no en egresado.
-- studentCarrier = pi carrera (estudiante)
-- egresCarrier = pi carrera (egresado)
-- studentCarrier - egresCarrier

-- 19. Mostrar estudiantes y egresados de Manizales.
-- studentManila = sigma ciudad = 'Manizales' (estudiante)
-- egresManila = sigma ciudad = 'Manizales' (egresado)
-- studentManila ∪ egresManila

-- 20. Mostrar estudiantes que no son de Bogotá.
-- sigma ciudad != 'Bogota' (estudiante)

-- # Nivel 3 — Join básico
-- (⨝)

-- 21. Mostrar nombres de estudiantes junto con cursos inscritos.
-- la idea está bien, pero quedó enredada de más.
-- iJ = pi E.nombre, I.cod (ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe))
-- preResult = (iJ) ⨝ iJ.cod = curso.cod (curso)
-- pi E.nombre, curso.nombre (preResult)

-- 22. Mostrar estudiantes inscritos en BasesDatos.
-- conceptualmente bien, aunque muy verbosas.
-- esInscritos = pi E.nombre, I.cod (ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe))
-- curInscritos = curso ⨝ inscribe
-- curFiltrado = pi cod (sigma nombre = 'BasesDatos' (curInscritos))
-- pi E.nombre ((esInscritos) ⨝ I.cod = curFiltrado.cod (curFiltrado))

-- 23. Mostrar estudiantes inscritos en IA.
-- conceptualmente bien, aunque muy verbosas.
-- esInscritos = pi E.nombre, I.cod (ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe))
-- curInscritos = curso ⨝ inscribe
-- curFiltrado = pi cod (sigma nombre = 'IA' (curInscritos))
-- pi E.nombre ((esInscritos) ⨝ I.cod = curFiltrado.cod (curFiltrado))

-- 24. Mostrar profesores que dictan cursos.
-- pi nombre (profesor ⨝ dicta)

-- 25. Mostrar cursos con su salón.
-- salones = curso ⨝ salon
-- pi curso.nombre, salon.aula (salones)

-- 26. Mostrar estudiantes y sus notas.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- pi E.nombre, I.nota (inscritos)

-- 27. Mostrar estudiantes y cursos con nota > 4.
-- solo si tu herramienta acepta esa condición en el join.
-- esInscritos = ρE(estudiante) ⨝ E.id = I.id_est AND I.nota > 4 ρI(inscribe)
-- curInscritos = ((esInscritos) ⨝ I.cod = C.cod ρC(curso))
-- pi E.nombre, I.nota, C.nombre (curInscritos)

-- 28. Mostrar estudiantes de Sistemas inscritos en Programacion.
-- mal; definiste esSistemas pero luego no lo usaste.
-- esSistemas = sigma carrera = 'Sistemas' (estudiante)
-- sistemasInsc = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- insProgramacion = sigma C.nombre = 'Programacion' ((sistemasInsc) ⨝ I.cod = C.cod ρC(curso))
-- pi E.nombre (insProgramacion)

-- 29. Mostrar estudiantes y profesores relacionados por curso.
-- profesoresDictan = ρD(dicta ⨝ curso) ⨝ D.id_prof = P.id_prof ρP(profesor)
-- esInscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- joinProfeEstudiantes = (profesoresDictan) ⨝ D.cod = I.cod (esInscritos)
-- pi P.nombre, E.nombre, D.nombre (joinProfeEstudiantes)

-- 30. Mostrar estudiantes que cursan asignaturas de su misma área.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- cursos = (inscritos) ⨝ I.cod = C.cod ρC(curso)
-- sistemas = sigma departamento = 'Computacion' AND E.carrera = 'Sistemas' (cursos)
-- MATH deberia ir? no esta asociada a ninguna carrera ... (explicitamente) ...
-- math = sigma departamento = 'Matematicas' (cursos)
-- electronica = sigma departamento = 'Electronica' AND E.carrera = 'Electronica' (cursos)
-- civil = sigma departamento = 'Civil' AND E.carrera = 'Civil' (cursos)
-- industrial = sigma departamento = 'Industrial' AND E.carrera = 'Industrial' (cursos)
-- pi E.nombre, E.carrera, C.nombre (sistemas ∪ electronica ∪ civil ∪ industrial)

-- # Nivel 4 — Join múltiple
-- (join de 3+ relaciones)

-- 31. Mostrar nombre estudiante + curso + profesor.
-- nombre del estudiante
-- nombre del curso que toma
-- nombre del profesor que dicta ese curso
-- esInscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- profeDicta = (profesor ⨝ dicta)
-- cursos = ((esInscritos) ⨝ I.cod = P.cod ρP(profeDicta)) ⨝ I.cod = C.cod ρC(curso)
-- pi E.nombre, C.nombre, P.nombre (cursos)

-- 32. Mostrar estudiantes de Manizales y los cursos que ven.
-- esManila = sigma E.ciudad = 'Manizales' (ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe))
-- curEstudiantes = (esManila) ⨝ I.cod = C.cod ρC(curso)
-- pi E.nombre, C.nombre (curEstudiantes)

-- 33. Mostrar estudiantes y aula donde reciben clases.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- salones = (inscritos) ⨝ I.cod = S.cod ρS(salon)
-- pi E.nombre, S.edificio, S.aula (salones)

-- 34. Mostrar profesores que dictan cursos tomados por Ana.
-- anaCursos = sigma E.nombre = 'Ana' (ρE(estudiante) ⋈ E.id = I.id_est ρI(inscribe))
-- profesoresAna = ρD(dicta ⋈ profesor) ⋈ D.cod = I.cod (anaCursos)
-- pi D.nombre (profesoresAna)

-- 35. Mostrar estudiantes que ven cursos de Computación.
-- cursos = ρE(estudiante) ⋈ E.id = I.id_est ρI(inscribe)
-- filtrado = sigma C.departamento = 'Computacion' ((cursos) ⋈ I.cod = C.cod ρC(curso))
-- pi E.nombre (filtrado)

-- 36. Mostrar estudiantes que toman cursos con 4 créditos.
-- inscritos = ρE(estudiante) ⋈ E.id = I.id_est ρI(inscribe)
-- filtrado = sigma C.creditos = 4 ((inscritos) ⋈ I.cod = C.cod ρC(curso))
-- pi E.nombre (filtrado)

-- 37. Mostrar estudiantes inscritos en cursos del profesor Ruiz.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- dictados = profesor ⨝ dicta
-- filtrado = sigma profesor.nombre = 'Ruiz' ((inscritos) ⨝ I.cod = dicta.cod (dictados))
-- pi E.nombre (filtrado)

-- 38. Mostrar estudiantes inscritos en cursos en BloqueA.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- filtrado = sigma S.edificio = 'BloqueA' ((inscritos) ⨝ I.cod = S.cod ρS(salon))
-- pi E.nombre (filtrado)

-- 39. Mostrar profesores que enseñan a estudiantes de Sistemas.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- dictan = profesor ⨝ dicta
-- filtrado = sigma C.departamento = 'Computacion' ((dictan) ⨝ dicta.cod = C.cod ρC(curso))
-- pi profesor.nombre (filtrado)

-- 40. Mostrar estudiantes y cursos con sus edificios.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- cursos = curso ⨝ salon
-- filtrado = ((inscritos) ⨝ I.cod = C.cod ρC(cursos))
-- pi E.nombre, C.nombre, C.edificio (filtrado)

-- # Nivel 5 — Diferencia real (−)

-- 41. Estudiantes que nunca han reprobado.
-- noReprobados = (pi id (estudiante)) -  (pi id_est (reprobado))
-- filtro = estudiante ⨝ noReprobados
-- pi estudiante.nombre (filtro)

-- 42. Estudiantes que nunca han aprobado.
-- noAprobados = (pi id (estudiante)) -  (pi id_est (aprobado))
-- filtro = estudiante ⨝ noAprobados
-- pi estudiante.nombre (filtro)

-- 43. Cursos que nadie ha inscrito.
-- noInscritos = (pi cod (curso)) - (pi cod (inscribe))
-- filtro = curso ⨝ noInscritos
-- pi curso.nombre (filtro)

-- 44. Profesores que no dictan cursos.
-- noDictan = (pi id_prof (profesor)) - (pi id_prof (dicta))
-- filtro = profesor ⨝ noDictan
-- pi profesor.nombre (filtro)

-- 45. Estudiantes que no han inscrito nada.
-- noInscrito = (pi id (estudiante)) - (pi id_est (inscribe))
-- filtro = estudiante ⨝ noInscrito
-- pi estudiante.nombre (filtro)

-- 46. Cursos que no tienen prerrequisitos.
-- noPre = (pi cod (curso)) - (pi curso (prerrequisito))
-- filtro = curso ⨝ noPre
-- pi curso.nombre (filtro)

-- 47. Cursos que no son dictados.
-- noDictados = (pi cod (curso)) - (pi cod (dicta))
-- filtro = curso ⨝ noDictados
-- pi curso.nombre (filtro)

-- 48. Estudiantes que no son de ninguna ciudad repetida.
-- NOTA: Me corchó acá! (explica como es brevemente ... solo escribe la query ...)
-- noCiuRepetida = (pi E1.ciudad ρE1(estudiante)) - (pi E2.ciudad ρE2(estudiante))
-- filtro = estudiante ⨝ noCiuRepetida
-- pi estudiante.nombre (filtro)

-- 49. Cursos no tomados por estudiantes de Sistemas.


-- 50. Estudiantes sin amistades registradas.
-- noAmistad = (pi id (estudiante)) - (pi id1 (amistad))
-- noAmistad2 = (pi id (estudiante)) - (pi id2 (amistad))
-- filtro = estudiante ⨝ (noAmistad ⨝ noAmistad2)
-- pi estudiante.nombre (filtro)

-- # Nivel 6 — Self join (ρ obligatorio)
-- Aquí sí te toca usar renombrado.

-- 51. Encontrar pares de amigos.
-- mal; ahí debías trabajar con amistad, pero usaste inscribe/estudiante.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- pares = ρE1(inscritos) ⨝ E1.id > E2.id ρE2(inscritos)
-- pi E1.nombre, E2.nombre (pares)

-- 52. Encontrar amigos que estudian la misma carrera.
-- mal; ahí debías trabajar con amistad, pero usaste inscribe/estudiante.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- filtro = ρE1(inscritos) ⨝ E1.carrera = E2.carrera AND E1.id > E2.id ρE2(inscritos)
-- pi E1.nombre, E2.nombre (filtro)

-- 53. Encontrar amigos del mismo semestre.
-- mal; ahí debías trabajar con amistad, pero usaste inscribe/estudiante.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- filtro = ρE1(inscritos) ⨝ E1.id > E2.id AND E1.semestre = E2.semestre ρE2(inscritos)
-- pi E1.nombre, E2.nombre, E1.semestre (filtro)

-- 54. Encontrar amigos de ciudades distintas.
-- mal; ahí debías trabajar con amistad, pero usaste inscribe/estudiante.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- filtro = ρE1(estudiante) ⨝ E1.id > E2.id AND E1.ciudad != E2.ciudad ρE2(inscritos)
-- pi E1.nombre, E2.nombre (filtro)

-- 55. Encontrar estudiantes que tienen amigos de otra carrera.
-- mal; ahí debías trabajar con amistad, pero usaste inscribe/estudiante.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- filtro = ρE1(inscritos) ⨝ E1.carrera != E2.carrera AND E1.id > E2.id ρE2(inscritos)
-- pi E1.nombre, E2.nombre (filtro)

-- 56. Encontrar cursos que comparten mismo departamento.
-- ρC1(curso) ⨝ C1.cod > C2.cod AND C1.departamento = C2.departamento ρC2(curso)

-- 57. Encontrar profesores del mismo departamento.
-- ρP1(profesor) ⨝ P1.departamento = P2.departamento AND P1.id_prof > P2.id_prof ρP2(profesor)

-- 58. Encontrar estudiantes del mismo semestre entre sí.
-- ρE1(estudiante) ⨝ E1.semestre = E2.semestre AND E1.id > E2.id ρE2(estudiante)

-- 59. Encontrar estudiantes de misma ciudad.
-- ρE1(estudiante) ⨝ E1.ciudad = E2.ciudad AND E1.id > E2.id ρE2(estudiante)

-- 60. Encontrar estudiantes con mismo nombre de carrera y semestre.
-- Le falta evitar el caso del mismo estudiante duplicado; usa una condición tipo E1.id > E2.id o E1.id != E2.id.
-- ρE1(estudiante) ⨝ E1.semestre = E2.semestre AND E1.carrera = E2.carrera ρE2(estudiante)

-- # Nivel 7 — Prerrequisitos
-- Muy buenos para practicar joins complejos.

-- 61. Mostrar curso y su prerrequisito.
-- cursos = ρC(curso) ⨝ C.cod = P.curso ρP(prerrequisito)
-- (cursos) ⨝ P.requisito = curso.cod (curso)

-- 62. Mostrar nombre del curso y nombre del requisito.
-- La idea está bien; solo cuida el alias del segundo curso.
-- cursos = ρC(curso) ⨝ C.cod = P.curso ρP(prerrequisito)
-- preReq = (cursos) ⨝ P.requisito = curso.cod (curso)
-- pi C.nombre, curso.nombre (preReq)

-- 63. Mostrar estudiantes inscritos en cursos con prerrequisito.
-- Sí funciona como idea general, pero sobra el segundo join con curso si ya usaste prerrequisito. Se puede simplificar
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- ((inscritos) ⨝ I.cod = P.curso ρP(prerrequisito)) ⨝ P.curso = C.cod ρC(curso)

-- 64. Mostrar estudiantes inscritos en IA.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- sigma C.nombre = 'IA' ((inscritos) ⨝ I.cod = C.cod ρC(curso))

-- 65. Mostrar estudiantes inscritos en cursos cuyo requisito sea Programacion.
-- Aquí filtraste por P.requisito = Programacion, pero lo que se pide es cursos cuyo prerrequisito sea Programacion; la condición está invertida.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- filtro = (((inscritos) ⨝ I.cod = P.requisito ρP(prerrequisito)) ⨝ I.cod = C.cod ρC(curso))
-- sigma C.nombre = 'Programacion' (filtro)

-- 66. Mostrar cursos que requieren Calculo.
-- Tu consulta devuelve cursos que son prerrequisito de Calculo, no cursos que requieren Calculo.
-- pre = ρC(curso) ⨝ C.cod = P.requisito ρP(prerrequisito)
-- sigma C.nombre = 'Calculo' (pre)

-- 67. Mostrar cursos con más de un prerrequisito.
-- pre = ρC(curso) ⨝ C.cod = P.curso ρP(prerrequisito)
-- ρP1(pre) ⨝ P1.cod = P2.cod AND P1.requisito != P2.requisito ρP2(pre)

-- 68. Mostrar estudiantes inscritos en cursos avanzados.
-- No hay cursos avanzados ... (al menos no existe esa categoría)

-- 69. Mostrar estudiantes que cursan cursos sin prerrequisito.
-- inscritos = ρE(estudiante) ⨝ E.id = I.id_est ρI(inscribe)
-- noPre = (pi cod (curso)) - ((pi curso prerrequisito))
-- (inscritos) ⨝ I.cod = curso.cod (noPre)

-- 70. Mostrar prerrequisitos del curso IA.
-- pre = (ρC(curso) ⨝ C.cod = P.curso ρP(prerrequisito))
-- sigma C.nombre = 'IA' (pre)

-- # Nivel 8 — Razonamiento intermedio

-- 71. Estudiantes que aprobaron algún curso.
-- ρE(estudiante) ⨝ E.id = A.id_est ρA(aprobado)

-- 72. Estudiantes que reprobaron algún curso.-- 
-- ρE(estudiante) ⨝ E.id = R.id_est ρR(reprobado)

-- 73. Estudiantes que aprobaron y reprobaron.
-- both = (ρA(aprobado) ⨝ A.id_est = R.id_est ρR(reprobado))
-- pi E.nombre ((both) ⨝ A.id_est = E.id ρE(estudiante))

-- 74. Estudiantes que aprobaron pero nunca reprobaron.
-- soloAprobados = (pi id_est (aprobado)) - (pi id_est (reprobado))
-- (soloAprobados) ⨝ id_est = E.id ρE(estudiante)

-- 75. Estudiantes que tomaron más de un curso.



-- 76. Estudiantes que tomaron cursos de varios departamentos.



-- 77. Estudiantes que toman cursos en distintos edificios.



-- 78. Profesores que enseñan cursos con prerrequisitos.



-- 79. Cursos compartidos entre dos estudiantes.



-- 80. Estudiantes que comparten curso con Ana.



-- # Nivel 9 — Avanzado



-- Aquí ya parece parcial duro.



-- 81. Estudiantes que toman todos los cursos de Computación.



-- 82. Estudiantes que aprobaron todos los cursos que tomaron.



-- 83. Profesores que enseñan todos los cursos de su departamento.



-- 84. Estudiantes que comparten todos sus cursos con otro estudiante.



-- 85. Estudiantes que toman todos los cursos del profesor Ruiz.



-- 86. Cursos tomados por todos los estudiantes de Sistemas.



-- 87. Profesores cuyos cursos todos han sido aprobados.



-- 88. Estudiantes que cumplen todos los prerrequisitos de IA.



-- 89. Estudiantes que cursan todos los cursos de BloqueA.



-- 90. Estudiantes que tomaron todas las materias de su carrera disponibles.



-- # Nivel 10 — Tramposos (para dominar de verdad)



-- 91. Estudiantes cuyos amigos toman el mismo curso.



-- 92. Estudiantes cuyos amigos aprobaron IA.



-- 93. Cursos cuyos prerrequisitos también tienen prerrequisitos.



-- 94. Estudiantes que tienen amigos de otra ciudad y misma carrera.



-- 95. Profesores que enseñan cursos compartidos por amigos.



-- 96. Estudiantes que solo toman cursos de un edificio.



-- 97. Estudiantes que nunca comparten curso con nadie.



-- 98. Cursos tomados solo por una carrera.



-- 99. Estudiantes que toman curso y su prerrequisito al tiempo.



-- 100. Encontrar pares de estudiantes con exactamente mismos cursos.