-- Usar esquema
USE CasinoDB;

-- Insertar datos en MetodoPago
INSERT INTO MetodoPago (nombre, descripcion) VALUES
('Tarjeta de Crédito', 'Pago con tarjeta de crédito'),
('Efectivo', 'Pago en efectivo'),
('Transferencia Bancaria', 'Pago mediante transferencia bancaria');

-- Insertar datos en Cliente
INSERT INTO Cliente (nombre, correo, saldo) VALUES
('Juan Perez', 'juan.perez@example.com', 100.00),
('Maria Lopez', 'maria.lopez@example.com', 200.00),
('Carlos Garcia', 'carlos.garcia@example.com', 300.00);

-- Insertar datos en Token
INSERT INTO Token (valor) VALUES
(1.00),
(5.00),
(10.00);

-- Insertar datos en Gerente
INSERT INTO Gerente (cedEmpleado, nombre, apellido, correo, salario) VALUES
(123456, 'Ana', 'Gomez', 'ana.gomez@example.com', 500.00),
(654321, 'Luis', 'Martinez', 'luis.martinez@example.com', 600.00);

-- Insertar datos en Empleado
INSERT INTO Empleado (cedEmpleado, nombre, apellido, correo, salario, idGerente) VALUES
(111111, 'Pedro', 'Ruiz', 'pedro.ruiz@example.com', 50.00, 1),
(222222, 'Laura', 'Fernandez', 'laura.fernandez@example.com', 60.00, 2);

-- Insertar datos en Casino
INSERT INTO Casino (nit, nombre, ubicacion, capacidadClientes) VALUES
('123456789', 'Casino Royal', 'Av. Principal 123', 500),
('987654321', 'Gran Casino', 'Calle Secundaria 456', 300);

-- Insertar datos en Juego
INSERT INTO Juego (nombre, descripcion, idCasino) VALUES
('Poker', 'Juego de cartas', 1),
('Ruleta', 'Juego de azar con una rueda', 1),
('Blackjack', 'Juego de cartas', 2);

-- Insertar datos en Torneo
INSERT INTO Torneo (premio, nombre, fecha_inicio, fecha_fin, idCasino) VALUES
(1000.00, 'Torneo de Poker', '2024-07-01 10:00:00', '2024-07-01 18:00:00', 1),
(500.00, 'Torneo de Blackjack', '2024-08-01 10:00:00', '2024-08-01 18:00:00', 2);

-- Insertar datos en SesionJuego
INSERT INTO SesionJuego (idCliente, idJuego, idEmpleado, idTorneo, fecha_inicio, fecha_fin) VALUES
(1, 1, 1, 1, '2024-07-01 10:00:00', '2024-07-01 12:00:00'),
(2, 2, 2, NULL, '2024-07-01 14:00:00', '2024-07-01 15:00:00');

-- Insertar datos en Apuesta
INSERT INTO Apuesta (idSesionJuego, idToken, cantidad, resultado) VALUES
(1, 1, 10, 'ganado'),
(2, 2, 5, 'perdido');

-- Insertar datos en Parqueadero
INSERT INTO Parqueadero (nombre, ubicacion, tarifa) VALUES
('Parqueadero Principal', 'Subterraneo', 20.00),
('Parqueadero Secundario', 'Exterior', 15.00);

-- Insertar datos en CompraTicket
INSERT INTO CompraTicket (idCliente, idParqueadero, placa, idMetodoPago, idEmpleado) VALUES
(1, 1, 'ABC123', 1, 1),
(2, 2, 'XYZ789', 2, 2);

-- Insertar datos en Habitacion
INSERT INTO Habitacion (numero, tipo, tarifa) VALUES
('101', 'Suite', 150.00),
('102', 'Doble', 100.00);

-- Insertar datos en ReservaHabitacion
INSERT INTO ReservaHabitacion (idCliente, idHabitacion, fecha_inicio, fecha_fin, idMetodoPago, idEmpleado) VALUES
(1, 1, '2024-07-01', '2024-07-05', 1, 1),
(2, 2, '2024-07-03', '2024-07-06', 2, 2);

-- Insertar datos en ServicioHabitacion
INSERT INTO ServicioHabitacion (idReservaHabitacion, tarifa, descripcion) VALUES
(1, 50.00, 'Servicio de desayuno'),
(2, 30.00, 'Servicio de limpieza');

-- Insertar datos en MaquinaExpendedora
INSERT INTO MaquinaExpendedora (ubicacion, idCasino) VALUES
('Pasillo principal', 1),
('Entrada principal', 2);

-- Insertar datos en Operador
INSERT INTO Operador (cedula, nombre, empresa) VALUES
('1234567890', 'Juan', 'TechService'),
('0987654321', 'Maria', 'RepairCo');

-- Insertar datos en MantenimientoMaquina
INSERT INTO MantenimientoMaquina (fecha, costo, descripcion, idMaquinaExpendedora, idOperador) VALUES
('2024-07-01 10:00:00', 100.00, 'Reparación de pantalla', 1, 1),
('2024-07-02 11:00:00', 150.00, 'Reemplazo de teclado', 2, 2);

-- Insertar datos en CompraToken
INSERT INTO CompraToken (idCliente, idToken, cantidad, idMetodoPago, idEmpleado) VALUES
(1, 1, 10, 1, 1),
(2, 2, 5, 2, 2),
(3, 3, 3, 3, 1);