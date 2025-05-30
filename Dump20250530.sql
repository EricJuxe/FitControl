-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: fitcontrol
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `horario` time NOT NULL,
  `id_entrenador` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_entrenador` (`id_entrenador`),
  CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`id_entrenador`) REFERENCES `entrenador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (2,'crossfit','19:00:00',2),(4,'mobilidad','11:00:00',2);
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clase_cliente`
--

DROP TABLE IF EXISTS `clase_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase_cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_clase` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_clase` (`id_clase`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `clase_cliente_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id`),
  CONSTRAINT `clase_cliente_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase_cliente`
--

LOCK TABLES `clase_cliente` WRITE;
/*!40000 ALTER TABLE `clase_cliente` DISABLE KEYS */;
INSERT INTO `clase_cliente` VALUES (1,2,1),(2,2,3),(3,4,1),(4,4,2),(5,4,8),(6,4,9);
/*!40000 ALTER TABLE `clase_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `fecha_inactivo` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Charlie','hernandez','carlos@example.com','9514607586','2025-05-26','activo',NULL),(2,'Ana','Gómez','ana.gomez@example.com','5551000002','2025-05-26','activo',NULL),(3,'Luis','Fernández','luis.fernandez@example.com','5551000003','2025-05-26','activo',NULL),(4,'María','López','maria.lopez@example.com','5551000004','2025-05-26','activo',NULL),(5,'Jorge','Sánchez','jorge.sanchez@example.com','5551000005','2025-05-30','activo',NULL),(6,'Sofía','Martínez','sofia.martinez@example.com','5551000006','2025-05-26','activo',NULL),(7,'David','Torres','david.torres@example.com','5551000007','2025-05-26','activo',NULL),(8,'Lucía','Vargas','lucia.vargas@example.com','5551000008','2025-05-26','activo',NULL),(9,'Miguel','Rojas','miguel.rojas@example.com','5551000009','2025-05-26','activo',NULL),(11,'David Eduardo','Lopez','daviswduae@gmail.com','9512762290','2025-05-26','activo',NULL),(12,'ericotec','jux','eric.aaron.jf@gmail.com','914608433','2025-05-30','inactivo','2025-05-30'),(13,'Elenaaaaa','Morales','elena.morales@example.com','5551000010','2025-05-30','activo','2025-05-30'),(14,'aaron','fermandez','eric.aaron.jf@gmail.com','9513107656','2025-05-01','activo',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenador`
--

LOCK TABLES `entrenador` WRITE;
/*!40000 ALTER TABLE `entrenador` DISABLE KEYS */;
INSERT INTO `entrenador` VALUES (2,'AARON','FERNANDEZ','ZUMBA','AARON@GMAIL.COM','9514765298');
/*!40000 ALTER TABLE `entrenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `fecha_emision` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membresia`
--

DROP TABLE IF EXISTS `membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membresia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `membresia_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membresia`
--

LOCK TABLES `membresia` WRITE;
/*!40000 ALTER TABLE `membresia` DISABLE KEYS */;
/*!40000 ALTER TABLE `membresia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mensaje` text NOT NULL,
  `id_membresia` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_membresia` (`id_membresia`),
  CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`id_membresia`) REFERENCES `membresia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `precio` float NOT NULL,
  `stock` int DEFAULT '20',
  `estado` enum('activo','restringido') DEFAULT 'activo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Agua embotellada Bonafont 700ml',20,30,'activo'),(2,'Agua embotellada Epura 600ml',9,8,'activo'),(3,'Aminoácidos BCAA XTEND 30 serv.',450,16,'activo'),(4,'Aminoácidos BCAA EVLUTION 30 serv.',420,9,'activo'),(5,'Barra energética Nature Valley Avena y Miel',25,10,'activo'),(6,'Barra energética Quest Bar Chocolate Chip',38,20,'activo'),(7,'Bebida isotónica Gatorade 600ml',20,16,'activo'),(8,'Bebida isotónica Powerade 600ml',19,20,'activo'),(9,'Creatina monohidratada Muscletech 300g',350,19,'activo'),(10,'Creatina monohidratada Dymatize 300g',370,20,'activo'),(11,'Gel energético GU Energy Fresa',30,20,'activo'),(12,'Gel energético SIS GO Naranja',32,20,'activo'),(13,'Gomitas de proteína Optimum Nutrition',40,20,'activo'),(14,'Gomitas de proteína Goli Apple Cider',45,20,'activo'),(15,'Malteada Premier Protein Chocolate 325ml',60,20,'activo'),(16,'Malteada Labrada Lean Body Vainilla 500ml',70,20,'activo'),(17,'Pre-entreno C4 Cellucor 30 serv.',480,20,'activo'),(18,'Pre-entreno Animal Fury 20 serv.',520,20,'activo'),(19,'Proteína en polvo Gold Standard Whey 1kg',950,20,'activo'),(20,'Proteína en polvo Dymatize Elite Whey 1kg',990,20,'activo'),(21,'Proteína vegana Vega Sport Chocolate 1kg',1050,20,'activo'),(22,'Proteína vegana Rawfusion Natural 1kg',1020,20,'activo'),(23,'Shot de energía 5-hour Energy Uva',35,20,'activo'),(24,'Shot de energía Redline Extreme 90ml',38,20,'activo'),(25,'Suplemento quemagrasa Lipo-6 Black',500,20,'activo'),(26,'Suplemento quemagrasa Hydroxycut Hardcore',530,20,'activo'),(27,'Suplemento multivitamínico Centrum Hombre 60 tabs',300,20,'activo'),(28,'Suplemento multivitamínico Opti-Men 90 tabs',340,20,'activo'),(29,'Yogurt proteico Danone PRO 250g',28,20,'activo'),(30,'Yogurt proteico Chobani Fit 170g',30,20,'restringido'),(31,'gatorade',14,12,'activo');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenido` text,
  `fecha` date DEFAULT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `reporte_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `rol` enum('admin','recepcionista') NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Eric Juarez','eric.aaron.jf@gmail.com','9514608433','admin','$2a$10$O6QYc1xkpHpMzhz5lu4RquQs918hmuIKL8x5BhgHSEQ8dw8ZI9IA2'),(2,'Emilio','emiliosantiawo@gmail.com','951 607 0290','admin','$2a$10$7d.DYt/6CrSnBd6qWkj9aOl8/RmbGUmPoDrOgVBBzvoiRoRzlp/YS'),(3,'David ','daviswduae@gmail.com','951 276 2290','admin','$2a$10$/6vPcCjyHgkwAommlFCPP.pqJ6rdnciJeVdM5f4MNU.4XOiLlf3aG');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `id_cliente` int NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2025-05-27',11,75.00),(2,'2025-05-27',11,20.00),(3,'2025-05-27',11,75.00),(4,'2025-05-27',11,840.00),(5,'2025-05-27',11,40.00),(6,'2025-05-27',11,840.00),(7,'2025-05-27',11,450.00),(8,'2025-05-27',11,38.00),(9,'2025-05-27',11,38.00),(10,'2025-05-27',11,350.00),(11,'2025-05-27',11,50.00),(12,'2025-05-27',11,15.00),(13,'2025-05-27',11,15.00),(14,'2025-05-27',11,14.00),(15,'2025-05-27',11,450.00),(16,'2025-05-27',11,420.00),(17,'2025-05-27',11,20.00),(18,'2025-05-27',11,25.00),(19,'2025-05-27',11,14.00),(20,'2025-05-27',11,450.00),(21,'2025-05-27',11,450.00),(22,'2025-05-27',11,38.00),(23,'2025-05-27',11,25.00),(24,'2025-05-27',11,14.00),(25,'2025-05-27',11,420.00),(26,'2025-05-27',11,38.00),(27,'2025-05-29',11,2100.00);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-30 15:23:58
