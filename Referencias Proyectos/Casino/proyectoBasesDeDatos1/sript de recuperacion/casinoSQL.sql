-- Crear esquema
CREATE SCHEMA CasinoDB;

-- Usar esquema
USE CasinoDB;

-- Crear tabla MetodoPago
CREATE TABLE MetodoPago (
    idMetodoPago INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Crear tabla Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    saldo DECIMAL(10, 2) DEFAULT 0.00,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla Token
CREATE TABLE Token (
    idToken INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL(10, 2) NOT NULL
);

-- Crear tabla Gerente
CREATE TABLE Gerente (
    idGerente INT PRIMARY KEY AUTO_INCREMENT,
    cedEmpleado INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    salario DECIMAL(8, 2) NOT NULL
);

-- Crear tabla Empleado
CREATE TABLE Empleado (
    idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
    cedEmpleado INT UNIQUE NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    salario DECIMAL(5, 2) NOT NULL,
    idGerente INT NOT NULL,
    KEY empleado_ibfk_1 (idGerente),
    CONSTRAINT empleado_ibfk_1 FOREIGN KEY (idGerente) REFERENCES Gerente (idGerente) ON UPDATE CASCADE
);

-- Crear tabla CompraToken
CREATE TABLE CompraToken (
    idCompraToken INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    idToken INT NOT NULL,
    cantidad INT NOT NULL,
    idMetodoPago INT NOT NULL,
    idEmpleado INT NOT NULL,
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY compratoken_ibfk_1 (idCliente),
    CONSTRAINT compratoken_ibfk_1 FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente) ON UPDATE CASCADE,
    KEY compratoken_ibfk_2 (idToken),
    CONSTRAINT compratoken_ibfk_2 FOREIGN KEY (idToken) REFERENCES Token (idToken) ON UPDATE CASCADE,
    KEY compratoken_ibfk_3 (idMetodoPago),
    CONSTRAINT compratoken_ibfk_3 FOREIGN KEY (idMetodoPago) REFERENCES MetodoPago (idMetodoPago) ON UPDATE CASCADE,
    KEY compratoken_ibfk_4 (idEmpleado),
    CONSTRAINT compratoken_ibfk_4 FOREIGN KEY (idEmpleado) REFERENCES Empleado (idEmpleado) ON UPDATE CASCADE
);

-- Crear tabla Casino
CREATE TABLE Casino (
    idCasino INT PRIMARY KEY AUTO_INCREMENT,
    nit VARCHAR(50) UNIQUE NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255) NOT NULL,
    capacidadClientes INT NOT NULL
);

-- Crear tabla Juego
CREATE TABLE Juego (
    idJuego INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    idCasino INT NOT NULL,
    KEY juego_ibfk_1 (idCasino),
    CONSTRAINT juego_ibfk_1 FOREIGN KEY (idCasino) REFERENCES Casino (idCasino) ON UPDATE CASCADE
);

-- Crear tabla Torneo
CREATE TABLE Torneo (
    idTorneo INT PRIMARY KEY AUTO_INCREMENT,
    premio DECIMAL(10, 2) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    fecha_inicio TIMESTAMP NOT NULL,
    fecha_fin TIMESTAMP NOT NULL,
    idCasino INT NOT NULL,
    KEY torneo_ibfk_1 (idCasino),
    CONSTRAINT torneo_ibfk_1 FOREIGN KEY (idCasino) REFERENCES Casino (idCasino) ON UPDATE CASCADE
);

-- Crear tabla SesionJuego
CREATE TABLE SesionJuego (
    idSesionJuego INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    idJuego INT NOT NULL,
    idEmpleado INT NOT NULL,
    idTorneo INT,
    fecha_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_fin TIMESTAMP NULL,
    KEY sesionjuego_ibfk_1 (idCliente),
    CONSTRAINT sesionjuego_ibfk_1 FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente) ON UPDATE CASCADE,
    KEY sesionjuego_ibfk_2 (idJuego),
    CONSTRAINT sesionjuego_ibfk_2 FOREIGN KEY (idJuego) REFERENCES Juego (idJuego) ON UPDATE CASCADE,
    KEY sesionjuego_ibfk_3 (idEmpleado),
    CONSTRAINT sesionjuego_ibfk_3 FOREIGN KEY (idEmpleado) REFERENCES Empleado (idEmpleado) ON UPDATE CASCADE,
    KEY sesionjuego_ibfk_4 (idTorneo),
    CONSTRAINT sesionjuego_ibfk_4 FOREIGN KEY (idTorneo) REFERENCES Torneo (idTorneo) ON UPDATE CASCADE
);

-- Crear tabla Apuesta
CREATE TABLE Apuesta (
    idApuesta INT PRIMARY KEY AUTO_INCREMENT,
    idSesionJuego INT NOT NULL,
    idToken INT NOT NULL,
    cantidad INT NOT NULL,
    resultado VARCHAR(255),
    fecha_apuesta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY apuesta_ibfk_1 (idSesionJuego),
    CONSTRAINT apuesta_ibfk_1 FOREIGN KEY (idSesionJuego) REFERENCES SesionJuego (idSesionJuego) ON UPDATE CASCADE,
    KEY apuesta_ibfk_2 (idToken),
    CONSTRAINT apuesta_ibfk_2 FOREIGN KEY (idToken) REFERENCES Token (idToken) ON UPDATE CASCADE
);

-- Crear tabla Parqueadero
CREATE TABLE Parqueadero (
    idParqueadero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255) NOT NULL,
    tarifa DECIMAL(10, 2) NOT NULL
);

-- Crear tabla compraTicket_ibfk
CREATE TABLE CompraTicket (
    idCompraTicket INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    idParqueadero INT NOT NULL,
    placa VARCHAR(10) NOT NULL,
    idMetodoPago INT NOT NULL,
    idEmpleado INT NOT NULL,
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY compraTicket_ibfk_1 (idCliente),
    CONSTRAINT compraTicket_ibfk_1 FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente) ON UPDATE CASCADE,
    KEY compraTicket_ibfk_2 (idParqueadero),
    CONSTRAINT compraTicket_ibfk_2 FOREIGN KEY (idParqueadero) REFERENCES Parqueadero (idParqueadero) ON UPDATE CASCADE,
    KEY compraTicket_ibfk_3 (idMetodoPago),
    CONSTRAINT compraTicket_ibfk_3 FOREIGN KEY (idMetodoPago) REFERENCES MetodoPago (idMetodoPago) ON UPDATE CASCADE,
    KEY compraTicket_ibfk_4 (idEmpleado),
    CONSTRAINT compraTicket_ibfk_4 FOREIGN KEY (idEmpleado) REFERENCES Empleado (idEmpleado) ON UPDATE CASCADE
);

-- Crear tabla Habitacion
CREATE TABLE Habitacion (
    idHabitacion INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(10) NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    tarifa DECIMAL(10, 2) NOT NULL
);

-- Crear tabla ReservaHabitacion
CREATE TABLE ReservaHabitacion (
    idReservaHabitacion INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    idHabitacion INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    idMetodoPago INT NOT NULL,
    idEmpleado INT NOT NULL,
    fecha_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY reservahabitacion_ibfk_1 (idCliente),
    CONSTRAINT reservahabitacion_ibfk_1 FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente) ON UPDATE CASCADE,
    KEY reservahabitacion_ibfk_2 (idHabitacion),
    CONSTRAINT reservahabitacion_ibfk_2 FOREIGN KEY (idHabitacion) REFERENCES Habitacion (idHabitacion) ON UPDATE CASCADE,
    KEY reservahabitacion_ibfk_3 (idMetodoPago),
    CONSTRAINT reservahabitacion_ibfk_3 FOREIGN KEY (idMetodoPago) REFERENCES MetodoPago (idMetodoPago) ON UPDATE CASCADE,
    KEY reservahabitacion_ibfk_4 (idEmpleado),
    CONSTRAINT reservahabitacion_ibfk_4 FOREIGN KEY (idEmpleado) REFERENCES Empleado (idEmpleado) ON UPDATE CASCADE
);

-- Crear tabla ServicioHabitacion
CREATE TABLE ServicioHabitacion (
    idServicioHabitacion INT PRIMARY KEY AUTO_INCREMENT,
    idReservaHabitacion INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tarifa DECIMAL(10, 2) NOT NULL,
    descripcion TEXT,
    KEY serviciohabitacion_ibfk_1 (idReservaHabitacion),
    CONSTRAINT serviciohabitacion_ibfk_1 FOREIGN KEY (idReservaHabitacion) REFERENCES ReservaHabitacion (idReservaHabitacion) ON UPDATE CASCADE
);

-- Crear tabla MaquinaExpendedora
CREATE TABLE MaquinaExpendedora (
    idMaquinaExpendedora INT PRIMARY KEY AUTO_INCREMENT,
    ubicacion VARCHAR(255) NOT NULL,
    idCasino INT NOT NULL,
    KEY maquinaexpendedora_ibfk_1 (idCasino),
    CONSTRAINT maquinaexpendedora_ibfk_1 FOREIGN KEY (idCasino) REFERENCES Casino (idCasino) ON UPDATE CASCADE
);

-- Crear tabla Operador
CREATE TABLE Operador (
    idOperador INT PRIMARY KEY AUTO_INCREMENT,
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    empresa VARCHAR(255) NOT NULL
);

-- Crear tabla MantenimientoMaquina
CREATE TABLE MantenimientoMaquina (
    idMantenimientoMaquina INT PRIMARY KEY AUTO_INCREMENT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    costo DECIMAL(8, 2) NOT NULL,
    descripcion TEXT,
    idMaquinaExpendedora INT NOT NULL,
    idOperador INT NOT NULL,
    KEY mantenimientomaquina_ibfk_1 (idMaquinaExpendedora),
    CONSTRAINT mantenimientomaquina_ibfk_1 FOREIGN KEY (idMaquinaExpendedora) REFERENCES MaquinaExpendedora (idMaquinaExpendedora) ON UPDATE CASCADE,
    KEY mantenimientomaquina_ibfk_2 (idOperador),
    CONSTRAINT mantenimientomaquina_ibfk_2 FOREIGN KEY (idOperador) REFERENCES Operador (idOperador) ON UPDATE CASCADE
);

DELIMITER //

-- Trigger para actualizar el saldo del cliente después de una compra de fichas
CREATE TRIGGER ActualizarSaldoCompraToken
AFTER INSERT ON CompraToken
FOR EACH ROW
BEGIN
    DECLARE nuevo_saldo DECIMAL(10, 2);
    SET nuevo_saldo = (SELECT saldo FROM Cliente WHERE idCliente = NEW.idCliente) + (NEW.cantidad * (SELECT valor FROM Token WHERE idToken= NEW.idToken));

    UPDATE Cliente
    SET saldo = nuevo_saldo
    WHERE idCliente = NEW.idCliente;
END //

-- Trigger para actualizar el saldo del cliente después de realizar una apuesta
CREATE TRIGGER ActualizarSaldoApuesta
AFTER INSERT ON Apuesta
FOR EACH ROW
BEGIN
    DECLARE nuevo_saldo DECIMAL(10, 2);
    DECLARE resultado_apuesta VARCHAR(255);
    DECLARE valor_token DECIMAL(10, 2);
    DECLARE ajuste DECIMAL(10, 2);

    SET resultado_apuesta = NEW.resultado;
    SET valor_token = (SELECT valor FROM Token WHERE idToken= NEW.idToken);
    
    -- Restar la cantidad apostada del saldo
    SET nuevo_saldo = (SELECT saldo FROM Cliente WHERE idCliente = (SELECT idCliente FROM SesionJuego WHERE idSesionJuego = NEW.idSesionJuego)) - (NEW.cantidad * valor_token);

    -- Ajustar el saldo basado en el resultado de la apuesta
    IF resultado_apuesta = 'ganado' THEN
        SET ajuste = NEW.cantidad * valor_token * 2;  -- Asumiendo que el cliente gana el doble de su apuesta
        SET nuevo_saldo = nuevo_saldo + ajuste;
    END IF;

    UPDATE Cliente
    SET saldo = nuevo_saldo
    WHERE idCliente = (SELECT idCliente FROM SesionJuego WHERE idSesionJuego = NEW.idSesionJuego);
END //

DELIMITER ;