INSERT INTO `gerente` (`nombre`, `apellido`, `cedGerente`, `estado`) VALUES
('Carlos', 'Santana', '999888777', 'Activo'),
('Maria', 'Lopez', '666555444', 'Activo');

INSERT INTO `empleado` (`cedEmpleado`, `nombre`, `apellido`, `teléfono`, `correo`, `salario`, `idGerente`) VALUES
('111222333', 'Michael', 'Johnson', '555-1111', 'michael.johnson@example.com', 50000.00, 1),
('444555666', 'Emily', 'Davis', '555-2222', 'emily.davis@example.com', 45000.00, 1),
('777888999', 'David', 'Martinez', '555-3333', 'david.martinez@example.com', 47000.00, 2);

INSERT INTO `casino` (`nitCasino`, `ubicacion`, `capacidadClientes`) VALUES
(1, 'Las Vegas', 1000),
(2, 'Atlantic City', 750),
(3, 'Monte Carlo', 500);

INSERT INTO `cliente` (`cedCliente`, `nombre`, `apellido`, `teléfono`, `correo`, `edad`) VALUES
('123456789', 'John', 'Doe', '555-1234', 'john.doe@example.com', 30),
('987654321', 'Jane', 'Smith', '555-5678', 'jane.smith@example.com', 25),
('456789123', 'Alice', 'Brown', '555-8765', 'alice.brown@example.com', 35);

INSERT INTO `habitacion` (`capacidad`, `tipo`, `estado`) VALUES
(2, 'Suite', 'Disponible'),
(4, 'Double', 'Ocupado'),
(1, 'Single', 'Disponible');

INSERT INTO `juego` (`tipoJuego`, `nombre`, `descripcion`, `idCasino`) VALUES
('Slots', 'Mega Jackpot', 'High-stakes slot machines', 1),
('Poker', 'Texas Holdem', 'Poker game with high rewards', 2),
('Roulette', 'European Roulette', 'Classic casino game', 3);

INSERT INTO `maquinaexpendedora` (`numSerie`, `capacidad`, `montoDisponible`, `tipo`) VALUES
(1001, 50, 100.00, 'Snacks'),
(1002, 100, 200.00, 'Drinks'),
(1003, 30, 50.00, 'Tickets');

INSERT INTO `metodopago` (`tipoPago`, `datosPago`) VALUES
('Credit Card', 'Visa, MasterCard, Amex'),
('Cash', 'USD'),
('Cryptocurrency', 'Bitcoin, Ethereum');

INSERT INTO `operador` (`cedOperador`, `nombre`, `nomEmpresa`) VALUES
('555444333', 'Sam', 'OperatorCorp'),
('222111000', 'Alex', 'Vendomatic'),
('333222111', 'Jordan', 'SnackMaster');

INSERT INTO `parqueadero` (`motosLibre`, `carrosLibre`, `capacidad`) VALUES
(10, 20, 30),
(15, 25, 40),
(5, 15, 20);

INSERT INTO `reservahabitacion` (`idHabitacion`, `idCliente`, `idMetodoPago`, `fechaHoraInicio`, `fechaHoraFinal`, `descripción`, `tarifaxproductoBarato`, `tarifaxproductoMedio`, `tarifaxproductoCaro`, `tarifaXdia`, `total`, `idEmpleado`, `nProdBarato`, `nProdMedio`, `nProdCaro`) VALUES
(1, 1, 1, '2024-06-01 00:00:00', '2024-06-05 00:00:00', 'Suite reservation', 50.00, 100.00, 150.00, 200.00, 800.00, 1, 1, 2, 1),
(2, 2, 2, '2024-06-02 00:00:00', '2024-06-06 00:00:00', 'Double room reservation', 40.00, 80.00, 120.00, 150.00, 600.00, 2, 0, 1, 2);

INSERT INTO `sesionjuego` (`idJuego`, `idCliente`, `fechaHoraInicio`, `fechaHoraFinal`, `idEmpleado`, `idTorneo`) VALUES
(1, 1, '2024-06-01 14:00:00', '2024-06-01 16:00:00', 1, NULL),
(2, 2, '2024-06-02 18:00:00', '2024-06-02 20:00:00', 2, NULL),
(3, 3, '2024-06-03 12:00:00', '2024-06-03 14:00:00', 3, NULL);

INSERT INTO `token` (`valor`, `tipoToken`) VALUES
(10.00, 'Gold'),
(5.00, 'Silver'),
(1.00, 'Bronze');

INSERT INTO `torneo` (`premio`, `fechaHoraInicio`, `fechaHoraFinal`, `estado`, `capacidad`, `numParticipantes`, `idCasino`) VALUES
(10000.00, '2024-06-01 00:00:00', '2024-06-01 00:00:00', 'Upcoming', 50, 10, 1),
(5000.00, '2024-06-02 00:00:00', '2024-06-02 00:00:00', 'Ongoing', 30, 15, 2),
(2000.00, '2024-06-03 00:00:00', '2024-06-03 00:00:00', 'Completed', 20, 20, 3);

INSERT INTO `transacciontoken` (`idToken`, `idCliente`, `tipoTransaccion`, `cobro`, `cantidad`, `fechaHora`, `idMetodoPago`, `idEmpleado`) VALUES
(1, 1, 'Purchase', 100.00, 10, '2024-06-01 12:00:00', 1, 1),
(2, 2, 'Refund', 50.00, 5, '2024-06-02 13:00:00', 2, 2),
(3, 3, 'Purchase', 10.00, 10, '2024-06-03 14:00:00', 3, 3);

INSERT INTO `apuesta` (`idSesionJuego`, `montoApuesta`, `fechaHora`, `resultado`, `montoGanancia`) VALUES
(1, 100.00, '2024-06-01 14:00:00', 'Win', 150.00),
(2, 50.00, '2024-06-02 18:00:00', 'Loss', 0.00),
(3, 200.00, '2024-06-03 12:00:00', 'Win', 300.00);

INSERT INTO `compraticket` (`idCliente`, `idParqueadero`, `placa`, `tipoVehiculo`, `tarifaxhora`, `fechaHoraInicio`, `fechaHoraFinal`, `total`, `estado`, `idMetodoPago`, `idEmpleado`) VALUES
(1, 1, 'ABC123', 'Carro', 2.50, '2024-06-01 10:00:00', '2024-06-01 12:00:00', 5.00, 'Pagado', 1, 1),
(2, 2, 'XYZ987', 'Moto', 1.50, '2024-06-02 11:00:00', NULL, 3.00, 'Pendiente', 2, 2),
(3, 3, 'LMN456', 'Carro', 2.00, '2024-06-03 09:00:00', '2024-06-03 10:30:00', 3.00, 'Pagado', 3, 3);

INSERT INTO `operadorxmaquina` (`fecha`, `costo`, `descripcion`, `maquinaExp`, `idOperador`) VALUES
('2024-06-01', 100.00, 'Mantenimiento de rutina', 1001, 1),
('2024-06-02', 200.00, 'Reabastecimiento de productos', 1002, 2),
('2024-06-03', 150.00, 'Reparación técnica', 1003, 3);
