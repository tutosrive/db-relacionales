# JOINs

Departamento(numerodepartamento, nombredepartamento, descripcion)
Empleados(codeempl, nombreempl, apellempl, cargo, salario, numerodepartamento)

---

| codeempl | nombreempl | apellempl | cargo    | salario | nrodepto | nroapto | nombreapto | descripcion |
| -------- | ---------- | --------- | -----    | ------- | -------- | ------- | ---------- | ----------  |
|   10     | Ariel      | Buitrag   | Contador | 1000    |   10     |    10   | Develop    | ~~---~~     |   
|   10     | Ariel      | Buitrag   | Contador | 1000    |   10     |    20   | AtencionCliente    | ~~---~~     |   
|   10     | Ariel      | Buitrag   | Contador | 1000    |   10     |    30   | Marketing    | ~~---~~     |
| more     | more       | more      |  more    |   more  | more     | more    | more         | more        |
| more     | more       | more      |  more    |   more  | more     | more    | more         | more        |
| more     | more       | more      |  more    |   more  | more     | more    | more         | more        |

## producto cruz (cartesiano):

`empleado.nombredepartamento = departamento.nombredepartamento;`

---

> SxP
- Query: `πciudad(S) x πciudad(P)`

```
"S.ciudad","P.ciudad"
"Londres","Londres"
"Londres","París"
"Londres","Roma"
"París","Londres"
"París","París"
"París","Roma"
"Atenas","Londres"
"Atenas","París"
"Atenas","Roma"
```

---

> S⨝P
- Query: `πciudad(S) ⨝ πciudad(P)`

```
"S.ciudad"
"Londres"
"París"
```

---

- Query: `ρ ciudadP (π ciudad (S) ) x ρ ciudadS (π ciudad (S) )`

```
"ciudadP.ciudad","ciudadS.ciudad"`
"Londres","Londres"
"Londres","París"
"Londres","Atenas"
"París","Londres"
"París","París"
"París","Atenas"
"Atenas","Londres"
"Atenas","París"
"Atenas","Atenas"
```

---

- Query: `S ⨝ S.s=SPJ.s SPJ`

```
"S.s","S.noms","S.estado","S.ciudad","SPJ.s","SPJ.p","SPJ.j","SPJ.cant"
"S1","Smith","20","Londres","S1","P1","J1","200"
"S1","Smith","20","Londres","S1","P1","J4","200"
"S1","Smith","20","Londres","S1","P1","J5","700"
"S1","Smith","20","Londres","S1","P3","J6","400"
"S1","Smith","20","Londres","S1","P3","J7","70"
"S1","Smith","20","Londres","S1","P3","J5","50"
"S1","Smith","20","Londres","S1","P3","J4","40"
"S1","Smith","20","Londres","S1","P3","J3","30"
"S1","Smith","20","Londres","S1","P3","J2","20"
"S2","Jones","10","París","S2","P3","J1","400"
"S2","Jones","10","París","S2","P3","J2","200"
"S2","Jones","10","París","S2","P3","J3","200"
"S2","Jones","10","París","S2","P3","J4","500"
"S2","Jones","10","París","S2","P3","J5","600"
"S2","Jones","10","París","S2","P3","J7","800"
"S2","Jones","10","París","S2","P5","J2","100"
"S3","Blake","30","París","S3","P3","J1","200"
"S3","Blake","30","París","S3","P4","J2","500"
"S4","Clark","20","Londres","S4","P6","J3","300"
"S4","Clark","20","Londres","S4","P6","J7","300"
```

---

- Query: `π S.ciudad, J.ciudad ((S ⨝ S.s = SPJ.s SPJ) ⨝ SPJ.j= J.j J)`

```
"S.ciudad","J.ciudad"
"Londres","París"
"Londres","Atenas"
"Londres","Londres"
"Londres","Madrid"
"Londres","Roma"
"París","París"
"París","Roma"
"París","Atenas"
"París","Londres"
```