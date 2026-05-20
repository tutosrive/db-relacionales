-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: casinohotel
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apuesta`
--

DROP TABLE IF EXISTS `apuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apuesta` (
  `idApuesta` int NOT NULL AUTO_INCREMENT,
  `idSesionJuego` int DEFAULT NULL,
  `montoApuesta` decimal(10,2) DEFAULT NULL,
  `fechaHora` datetime DEFAULT NULL,
  `resultado` varchar(50) DEFAULT NULL,
  `montoGanancia` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idApuesta`),
  KEY `apuesta_ibfk_1` (`idSesionJuego`),
  CONSTRAINT `apuesta_ibfk_1` FOREIGN KEY (`idSesionJuego`) REFERENCES `sesionjuego` (`idSesion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apuesta`
--

LOCK TABLES `apuesta` WRITE;
/*!40000 ALTER TABLE `apuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `apuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casino`
--

DROP TABLE IF EXISTS `casino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casino` (
  `nitCasino` int NOT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `capacidadClientes` int DEFAULT NULL,
  PRIMARY KEY (`nitCasino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casino`
--

LOCK TABLES `casino` WRITE;
/*!40000 ALTER TABLE `casino` DISABLE KEYS */;
/*!40000 ALTER TABLE `casino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `cedCliente` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `teléfono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compraticket`
--

DROP TABLE IF EXISTS `compraticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compraticket` (
  `idCompra` int NOT NULL AUTO_INCREMENT,
  `idCliente` int DEFAULT NULL,
  `idParqueadero` int DEFAULT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `tipoVehiculo` varchar(50) DEFAULT NULL,
  `tarifaxhora` decimal(10,2) DEFAULT NULL,
  `fechaHoraInicio` datetime DEFAULT NULL,
  `fechaHoraFinal` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `idMetodoPago` int DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `compraticket_ibfk_1` (`idCliente`),
  KEY `compraticket_ibfk_2` (`idMetodoPago`),
  KEY `compraticket_ibfk_3` (`idParqueadero`),
  KEY `compraticket_ibfk_4` (`idEmpleado`),
  CONSTRAINT `compraticket_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  CONSTRAINT `compraticket_ibfk_2` FOREIGN KEY (`idMetodoPago`) REFERENCES `metodopago` (`idPago`) ON UPDATE CASCADE,
  CONSTRAINT `compraticket_ibfk_3` FOREIGN KEY (`idParqueadero`) REFERENCES `parqueadero` (`idParqueadero`) ON UPDATE CASCADE,
  CONSTRAINT `compraticket_ibfk_4` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compraticket`
--

LOCK TABLES `compraticket` WRITE;
/*!40000 ALTER TABLE `compraticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `compraticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `cedEmpleado` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `teléfono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `idGerente` int DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `empleado_ibfk_1` (`idGerente`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idGerente`) REFERENCES `gerente` (`idGerente`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerente`
--

DROP TABLE IF EXISTS `gerente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerente` (
  `idGerente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `cedGerente` varchar(20) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idGerente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerente`
--

LOCK TABLES `gerente` WRITE;
/*!40000 ALTER TABLE `gerente` DISABLE KEYS */;
/*!40000 ALTER TABLE `gerente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitacion` (
  `idHabitacion` int NOT NULL AUTO_INCREMENT,
  `capacidad` int NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`idHabitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego`
--

DROP TABLE IF EXISTS `juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego` (
  `idJuego` int NOT NULL AUTO_INCREMENT,
  `tipoJuego` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `idCasino` int DEFAULT NULL,
  PRIMARY KEY (`idJuego`),
  KEY `juego_ibfk_1` (`idCasino`),
  CONSTRAINT `juego_ibfk_1` FOREIGN KEY (`idCasino`) REFERENCES `casino` (`nitCasino`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego`
--

LOCK TABLES `juego` WRITE;
/*!40000 ALTER TABLE `juego` DISABLE KEYS */;
/*!40000 ALTER TABLE `juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquinaexpendedora`
--

DROP TABLE IF EXISTS `maquinaexpendedora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquinaexpendedora` (
  `numSerie` int NOT NULL,
  `capacidad` int DEFAULT NULL,
  `montoDisponible` decimal(10,2) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`numSerie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquinaexpendedora`
--

LOCK TABLES `maquinaexpendedora` WRITE;
/*!40000 ALTER TABLE `maquinaexpendedora` DISABLE KEYS */;
/*!40000 ALTER TABLE `maquinaexpendedora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodopago`
--

DROP TABLE IF EXISTS `metodopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodopago` (
  `idPago` int NOT NULL AUTO_INCREMENT,
  `tipoPago` varchar(50) DEFAULT NULL,
  `datosPago` text,
  PRIMARY KEY (`idPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodopago`
--

LOCK TABLES `metodopago` WRITE;
/*!40000 ALTER TABLE `metodopago` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operador`
--

DROP TABLE IF EXISTS `operador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operador` (
  `idOperador` int NOT NULL AUTO_INCREMENT,
  `cedOperador` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nomEmpresa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idOperador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operador`
--

LOCK TABLES `operador` WRITE;
/*!40000 ALTER TABLE `operador` DISABLE KEYS */;
/*!40000 ALTER TABLE `operador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operadorxmaquina`
--

DROP TABLE IF EXISTS `operadorxmaquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operadorxmaquina` (
  `idOperadorMaquina` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `descripcion` text,
  `maquinaExp` int DEFAULT NULL,
  `idOperador` int DEFAULT NULL,
  PRIMARY KEY (`idOperadorMaquina`),
  KEY `operadorxmaquina_ibfk_1` (`maquinaExp`),
  KEY `operadorxmaquina_ibfk_2` (`idOperador`),
  CONSTRAINT `operadorxmaquina_ibfk_1` FOREIGN KEY (`maquinaExp`) REFERENCES `maquinaexpendedora` (`numSerie`) ON UPDATE CASCADE,
  CONSTRAINT `operadorxmaquina_ibfk_2` FOREIGN KEY (`idOperador`) REFERENCES `operador` (`idOperador`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operadorxmaquina`
--

LOCK TABLES `operadorxmaquina` WRITE;
/*!40000 ALTER TABLE `operadorxmaquina` DISABLE KEYS */;
/*!40000 ALTER TABLE `operadorxmaquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parqueadero`
--

DROP TABLE IF EXISTS `parqueadero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parqueadero` (
  `idParqueadero` int NOT NULL AUTO_INCREMENT,
  `motosLibre` int DEFAULT NULL,
  `carrosLibre` int DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  PRIMARY KEY (`idParqueadero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parqueadero`
--

LOCK TABLES `parqueadero` WRITE;
/*!40000 ALTER TABLE `parqueadero` DISABLE KEYS */;
/*!40000 ALTER TABLE `parqueadero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservahabitacion`
--

DROP TABLE IF EXISTS `reservahabitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservahabitacion` (
  `idReserva` int NOT NULL AUTO_INCREMENT,
  `idHabitacion` int DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  `idMetodoPago` int DEFAULT NULL,
  `fechaHoraInicio` datetime DEFAULT NULL,
  `fechaHoraFinal` datetime DEFAULT NULL,
  `descripción` text,
  `tarifaxproductoBarato` decimal(10,2) DEFAULT NULL,
  `tarifaxproductoMedio` decimal(10,2) DEFAULT NULL,
  `tarifaxproductoCaro` decimal(10,2) DEFAULT NULL,
  `tarifaXdia` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  `nProdBarato` int DEFAULT NULL,
  `nProdMedio` int DEFAULT NULL,
  `nProdCaro` int DEFAULT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `reservahabitacion_ibfk_1` (`idHabitacion`),
  KEY `reservahabitacion_ibfk_2` (`idCliente`),
  KEY `reservahabitacion_ibfk_3` (`idEmpleado`),
  KEY `reservahabitacion_ibfk_4` (`idMetodoPago`),
  CONSTRAINT `reservahabitacion_ibfk_1` FOREIGN KEY (`idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON UPDATE CASCADE,
  CONSTRAINT `reservahabitacion_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  CONSTRAINT `reservahabitacion_ibfk_3` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON UPDATE CASCADE,
  CONSTRAINT `reservahabitacion_ibfk_4` FOREIGN KEY (`idMetodoPago`) REFERENCES `metodopago` (`idPago`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservahabitacion`
--

LOCK TABLES `reservahabitacion` WRITE;
/*!40000 ALTER TABLE `reservahabitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservahabitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesionjuego`
--

DROP TABLE IF EXISTS `sesionjuego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesionjuego` (
  `idSesion` int NOT NULL AUTO_INCREMENT,
  `idJuego` int DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  `fechaHoraInicio` datetime DEFAULT NULL,
  `fechaHoraFinal` datetime DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  `idTorneo` int DEFAULT NULL,
  PRIMARY KEY (`idSesion`),
  KEY `sesionjuego_ibfk_1` (`idJuego`),
  KEY `sesionjuego_ibfk_2` (`idCliente`),
  KEY `sesionjuego_ibfk_3` (`idEmpleado`),
  KEY `sesionjuego_ibfk_4` (`idTorneo`),
  CONSTRAINT `sesionjuego_ibfk_1` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idJuego`) ON UPDATE CASCADE,
  CONSTRAINT `sesionjuego_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  CONSTRAINT `sesionjuego_ibfk_3` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON UPDATE CASCADE,
  CONSTRAINT `sesionjuego_ibfk_4` FOREIGN KEY (`idTorneo`) REFERENCES `torneo` (`idTorneo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesionjuego`
--

LOCK TABLES `sesionjuego` WRITE;
/*!40000 ALTER TABLE `sesionjuego` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesionjuego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `idToken` int NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) DEFAULT NULL,
  `tipoToken` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idToken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneo`
--

DROP TABLE IF EXISTS `torneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneo` (
  `idTorneo` int NOT NULL AUTO_INCREMENT,
  `premio` decimal(10,2) DEFAULT NULL,
  `fechaHoraInicio` datetime DEFAULT NULL,
  `fechaHoraFinal` datetime DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  `numParticipantes` int DEFAULT NULL,
  `idCasino` int DEFAULT NULL,
  PRIMARY KEY (`idTorneo`),
  KEY `torneo_ibfk_1` (`idCasino`),
  CONSTRAINT `torneo_ibfk_1` FOREIGN KEY (`idCasino`) REFERENCES `casino` (`nitCasino`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneo`
--

LOCK TABLES `torneo` WRITE;
/*!40000 ALTER TABLE `torneo` DISABLE KEYS */;
/*!40000 ALTER TABLE `torneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciontoken`
--

DROP TABLE IF EXISTS `transacciontoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciontoken` (
  `idTransaccion` int NOT NULL AUTO_INCREMENT,
  `idToken` int DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  `tipoTransaccion` varchar(50) DEFAULT NULL,
  `cobro` decimal(10,2) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fechaHora` datetime DEFAULT NULL,
  `idMetodoPago` int DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  PRIMARY KEY (`idTransaccion`),
  KEY `transacciontoken_ibfk_1` (`idToken`),
  KEY `transacciontoken_ibfk_2` (`idCliente`),
  KEY `transacciontoken_ibfk_3` (`idMetodoPago`),
  KEY `transacciontoken_ibfk_4` (`idEmpleado`),
  CONSTRAINT `transacciontoken_ibfk_1` FOREIGN KEY (`idToken`) REFERENCES `token` (`idToken`) ON UPDATE CASCADE,
  CONSTRAINT `transacciontoken_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  CONSTRAINT `transacciontoken_ibfk_3` FOREIGN KEY (`idMetodoPago`) REFERENCES `metodopago` (`idPago`) ON UPDATE CASCADE,
  CONSTRAINT `transacciontoken_ibfk_4` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciontoken`
--

LOCK TABLES `transacciontoken` WRITE;
/*!40000 ALTER TABLE `transacciontoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacciontoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-02 20:40:32
