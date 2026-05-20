-- Tabla Proveedor
CREATE TABLE Proveedor (
    idProveedor INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    CONSTRAINT PK_PROVEEDOR PRIMARY KEY (idProveedor) 
) AUTO_INCREMENT = 1001;

-- Tabla Insumo
CREATE TABLE Insumo (
    idInsumo INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    tipoInsumo VARCHAR(50),
    cantidad INT,
    unidadMedida VARCHAR(50),
    CONSTRAINT PK_INSUMO PRIMARY KEY (idInsumo) 
) AUTO_INCREMENT = 2001;

-- Tabla ProveedorxInsumo
CREATE TABLE ProveedorxInsumo (
    idProveedorxInsumo INT AUTO_INCREMENT,
    idProveedor INT not null,
    idInsumo INT,
    cantidad INT,
    fecha DATE,
    CONSTRAINT PK_PROVEEDORXINSUMO PRIMARY KEY (idProveedorxInsumo),
    CONSTRAINT FK_PXI_PROVEEDOR FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_PXI_INSUMO FOREIGN KEY (idInsumo) REFERENCES Insumo(idInsumo) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 3001;

-- Tabla Ips
CREATE TABLE Ips (
    idIps INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    CONSTRAINT PK_IPS PRIMARY KEY (idIps) 
) AUTO_INCREMENT = 4001;

-- Tabla InsumoxIps
CREATE TABLE InsumoxIps (
    idInsumoxIps INT AUTO_INCREMENT,
    idInsumo INT not null,
    idIps INT not null,
    fechaEntrega DATE,
    estadoEntrega VARCHAR(50),
    CONSTRAINT PK_INSUMOXIPS PRIMARY KEY (idInsumoxIps),
    CONSTRAINT FK_IXIPS_INSUMO FOREIGN KEY (idInsumo) REFERENCES Insumo(idInsumo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_IXIPS_IPS FOREIGN KEY (idIps) REFERENCES Ips(idIps) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 5001;

-- Tabla Eps
CREATE TABLE Eps (
    idEps INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    tipoEntidad VARCHAR(50),
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    CONSTRAINT PK_EPS PRIMARY KEY (idEps) 
) AUTO_INCREMENT = 6001;

-- Tabla IpsxEps
CREATE TABLE IpsxEps (
    idIpsxEps INT AUTO_INCREMENT,
    idIps INT not null,
    idEps INT not null,
    tipoConvenio VARCHAR(100),
    CONSTRAINT PK_IPSXEPS PRIMARY KEY (idIpsxEps),
    CONSTRAINT FK_IXE_IPS FOREIGN KEY (idIps) REFERENCES Ips(idIps) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_IXE_EPS FOREIGN KEY (idEps) REFERENCES Eps(idEps) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 7001;

-- Tabla Departamento
CREATE TABLE Departamento (
    idDepartamento INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    especialidad VARCHAR(100),
    descripcion TEXT,
    CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (idDepartamento)
) AUTO_INCREMENT = 8001;

-- Tabla Consultorio
CREATE TABLE Consultorio (
    idConsultorio INT AUTO_INCREMENT,
    idIps INT not null,
    idDepartamento INT not null,
    localizacion VARCHAR(255),
    CONSTRAINT PK_CONSULTORIO PRIMARY KEY (idConsultorio),
    CONSTRAINT FK_CONSULTORIO_IPS FOREIGN KEY (idIps) REFERENCES Ips(idIps) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT FK_CONSULTORIO_DEPARTAMENTO FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento) ON UPDATE CASCADE ON DELETE CASCADE
) AUTO_INCREMENT = 9001;

-- Tabla Medico
CREATE TABLE Medico (
    idMedico INT AUTO_INCREMENT,
    idConsultorio INT not null,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    especialidad VARCHAR(100),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    CONSTRAINT PK_MEDICO PRIMARY KEY (idMedico),
    CONSTRAINT FK_MEDICO_CONSULTORIO FOREIGN KEY (idConsultorio) REFERENCES Consultorio(idConsultorio) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 13001;

-- Tabla PlanSalud
CREATE TABLE PlanSalud (
    idPlanSalud INT AUTO_INCREMENT,
    precio INT,
    tipo VARCHAR(100),
    CONSTRAINT PK_PLANSALUD PRIMARY KEY (idPlanSalud)
) AUTO_INCREMENT = 19001;

-- Tabla Paciente
CREATE TABLE Paciente (
    idPaciente INT AUTO_INCREMENT,
    idEps INT not null,
    idPlanSalud INT not null,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    edad INT,
    genero VARCHAR(15),
    telefono VARCHAR(15),
    direccion VARCHAR(255),
    correo VARCHAR(100),
    CONSTRAINT PK_PACIENTE PRIMARY KEY (idPaciente),
    CONSTRAINT FK_PACIENTE_EPS FOREIGN KEY (idEps) REFERENCES Eps(idEps) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_PACIENTE_PLANSALUD FOREIGN KEY (idPlanSalud) REFERENCES PlanSalud(idPlanSalud) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 14001;

-- Tabla Cita
CREATE TABLE Cita (
    idCita INT AUTO_INCREMENT,
    idMedico INT not null,
    idPaciente INT not null,
    fecha DATE,
    hora TIME,
    motivo TEXT,
    CONSTRAINT PK_CITA PRIMARY KEY (idCita),
    CONSTRAINT FK_CITA_MEDICO FOREIGN KEY (idMedico) REFERENCES Medico(idMedico) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_CITA_PACIENTE FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 15001;

-- Tabla HistoriaClínica
CREATE TABLE HistoriaClinica (
    idHistoriaClinica INT AUTO_INCREMENT,
    idPaciente INT not null,
    fecha_creacion DATE,
    CONSTRAINT PK_HISTORIACLINICA PRIMARY KEY (idHistoriaClinica),
    CONSTRAINT FK_HC_PACIENTE FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 21001;


-- Tabla Diagnostico
CREATE TABLE Diagnostico (
    idDiagnostico INT AUTO_INCREMENT,
    idHistoriaClinica INT,
    idCita INT,
    descripcion TEXT,
    tratamiento TEXT,
    CONSTRAINT PK_DIAGNOSTICO PRIMARY KEY (idDiagnostico),
    CONSTRAINT FK_DIAGNOSTICO_HISTORIACLINICA FOREIGN KEY (idHistoriaClinica) REFERENCES HistoriaClinica(idHistoriaClinica) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_DIAGNOSTICO_CITA FOREIGN KEY (idCita) REFERENCES Cita(idCita) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 16001;

-- Tabla Medicamento
CREATE TABLE Medicamento (
    idMedicamento INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    cantidad_mg INT,
    viaAdministracion VARCHAR(100),
    CONSTRAINT PK_MEDICAMENTO PRIMARY KEY (idMedicamento)
) AUTO_INCREMENT = 17001;

-- Tabla Servicio
CREATE TABLE Servicio (
    idServicio INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    CONSTRAINT PK_SERVICIO PRIMARY KEY (idServicio)
) AUTO_INCREMENT = 18001;

-- Tabla DiagnosticoxMedicamento
CREATE TABLE DiagnosticoxMedicamento (
    idDiagnostico INT,
    idMedicamento INT,
    fecha DATE,
    cantidad INT,
    CONSTRAINT PK_DIAGNOSTICOXMEDICAMENTO PRIMARY KEY (idDiagnostico, idMedicamento, fecha),
    CONSTRAINT FK_DXM_DIAGNOSTICO FOREIGN KEY (idDiagnostico) REFERENCES Diagnostico(idDiagnostico) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_DXM_MEDICAMENTO FOREIGN KEY (idMedicamento) REFERENCES Medicamento(idMedicamento) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla DiagnosticoxServicio
CREATE TABLE DiagnosticoxServicio (
    idDiagnostico INT,
    idServicio INT,
    fecha DATE,
    descripcion TEXT,
    CONSTRAINT PK_DIAGNOSTICOXSERVICIO PRIMARY KEY (idDiagnostico, idServicio, fecha),
    CONSTRAINT FK_DXS_DIAGNOSTICO FOREIGN KEY (idDiagnostico) REFERENCES Diagnostico(idDiagnostico) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_DXS_SERVICIO FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla Vehículo
CREATE TABLE Vehiculo (
    placaVehiculo VARCHAR(20),
    equipamiento VARCHAR(255),
    CONSTRAINT PK_VEHICULO PRIMARY KEY (placaVehiculo)
);

-- Tabla Auxiliar
CREATE TABLE Auxiliar (
    idAuxiliar INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    CONSTRAINT PK_AUXILIAR PRIMARY KEY (idAuxiliar)
) AUTO_INCREMENT = 22001;

-- Tabla VisitaDomiciliaria
CREATE TABLE VisitaDomiciliaria (
    idVisita INT AUTO_INCREMENT,
    idPaciente INT,
    placaVehiculo VARCHAR(20),
    idAuxiliar INT,
    motivo TEXT,
    fecha DATE,
    reporte TEXT,
    CONSTRAINT PK_VISITADOMICILIARIA PRIMARY KEY (idVisita),
    CONSTRAINT FK_VD_VEHICULO FOREIGN KEY (placaVehiculo) REFERENCES Vehiculo(placaVehiculo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_VD_AUXILIAR FOREIGN KEY (idAuxiliar) REFERENCES Auxiliar(idAuxiliar) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_VD_PACIENTE FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente) ON DELETE CASCADE ON UPDATE CASCADE
)AUTO_INCREMENT = 23001;

-- Tabla Turno
CREATE TABLE Turno (
    idTurno INT AUTO_INCREMENT,
    horaInicio TIME,
    horaFin TIME,
    CONSTRAINT PK_TURNO PRIMARY KEY (idTurno)
) AUTO_INCREMENT = 24001;

-- Tabla MedicoxTurno
CREATE TABLE MedicoxTurno (
    idMedico INT,
    idTurno INT,
    fecha DATE,
    CONSTRAINT PK_MEDICOXTURNO PRIMARY KEY (idMedico, idTurno, fecha),
    CONSTRAINT FK_MXT_MEDICO FOREIGN KEY (idMedico) REFERENCES Medico(idMedico) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_MXT_TURNO FOREIGN KEY (idTurno) REFERENCES Turno(idTurno) ON DELETE CASCADE ON UPDATE CASCADE
);
