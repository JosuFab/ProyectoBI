CREATE DATABASE ecommerce_plataforma;
USE ecommerce_plataforma;

-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_plataforma

-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- Table structure for table `campania`
--

DROP TABLE IF EXISTS `campania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campania` (
  `id_Campania` int NOT NULL AUTO_INCREMENT,
  `nombre_Campania` varchar(30) NOT NULL,
  `tipo_Campania` varchar(30) NOT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `fecha_Inicio` date NOT NULL,
  `fecha_Fin` date NOT NULL,
  PRIMARY KEY (`id_Campania`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campania`
--

LOCK TABLES `campania` WRITE;
/*!40000 ALTER TABLE `campania` DISABLE KEYS */;
/*!40000 ALTER TABLE `campania` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_Categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_Categoria` varchar(30) NOT NULL,
  `descripcion_Categoria` text,
  PRIMARY KEY (`id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_Cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `ciudad` varchar(25) DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  `fecha_Registro` date NOT NULL,
  PRIMARY KEY (`id_Cliente`),
  UNIQUE KEY `email` (`email`)
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
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_Detalle` int NOT NULL AUTO_INCREMENT,
  `id_Pedido` int NOT NULL,
  `id_Producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `costo_Unitario` decimal(10,2) NOT NULL,
  `precio_Unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_Detalle`),
  KEY `fk_detalle_pedido_pedido` (`id_Pedido`),
  KEY `fk_detalle_pedido_producto` (`id_Producto`),
  CONSTRAINT `fk_detalle_pedido_pedido` FOREIGN KEY (`id_Pedido`) REFERENCES `pedido` (`id_Pedido`),
  CONSTRAINT `fk_detalle_pedido_producto` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucion`
--

DROP TABLE IF EXISTS `devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucion` (
  `id_Devolucion` int NOT NULL AUTO_INCREMENT,
  `id_Detalle` int NOT NULL,
  `fecha_Devolucion` date NOT NULL,
  `motivo` varchar(50) NOT NULL,
  `cantidad_Devuelta` int NOT NULL,
  PRIMARY KEY (`id_Devolucion`),
  KEY `fk_devolucion_detalle` (`id_Detalle`),
  CONSTRAINT `fk_devolucion_detalle` FOREIGN KEY (`id_Detalle`) REFERENCES `detalle_pedido` (`id_Detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion`
--

LOCK TABLES `devolucion` WRITE;
/*!40000 ALTER TABLE `devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `id_envio` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_operador` int NOT NULL,
  `fecha_envio` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `region` varchar(30) NOT NULL,
  `estado_envio` varchar(20) NOT NULL,
  PRIMARY KEY (`id_envio`),
  KEY `fk_envio_pedido` (`id_pedido`),
  KEY `fk_envio_operador` (`id_operador`),
  CONSTRAINT `fk_envio_operador` FOREIGN KEY (`id_operador`) REFERENCES `operador_logistico` (`id_Operador`),
  CONSTRAINT `fk_envio_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_Marca` int NOT NULL AUTO_INCREMENT,
  `nombre_Marca` varchar(30) NOT NULL,
  `pais_Origen` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_Marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operador_logistico`
--

DROP TABLE IF EXISTS `operador_logistico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operador_logistico` (
  `id_Operador` int NOT NULL AUTO_INCREMENT,
  `nombre_Operador` varchar(20) NOT NULL,
  `tipo_Servicio` varchar(20) NOT NULL,
  PRIMARY KEY (`id_Operador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operador_logistico`
--

LOCK TABLES `operador_logistico` WRITE;
/*!40000 ALTER TABLE `operador_logistico` DISABLE KEYS */;
/*!40000 ALTER TABLE `operador_logistico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_Pedido` int NOT NULL AUTO_INCREMENT,
  `id_Cliente` int NOT NULL,
  `id_Campania` int DEFAULT NULL,
  `fecha_Pedido` datetime NOT NULL,
  `metodo_Pago` varchar(20) NOT NULL,
  `total_Pedido` decimal(10,2) NOT NULL,
  `estado_Pedido` varchar(20) NOT NULL,
  `dispositivo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_Pedido`),
  KEY `fk_pedido_cliente` (`id_Cliente`),
  KEY `fk_pedido_campania` (`id_Campania`),
  CONSTRAINT `fk_pedido_campania` FOREIGN KEY (`id_Campania`) REFERENCES `campania` (`id_Campania`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_Cliente`) REFERENCES `cliente` (`id_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_Producto` int NOT NULL AUTO_INCREMENT,
  `nombre_Producto` varchar(30) NOT NULL,
  `precio_Base` decimal(10,2) NOT NULL,
  `costo_Base` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `descripcion` text,
  `id_Marca` int NOT NULL,
  `id_Categoria` int NOT NULL,
  PRIMARY KEY (`id_Producto`),
  KEY `fk_producto_marca` (`id_Marca`),
  KEY `fk_producto_categoria` (`id_Categoria`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_Categoria`) REFERENCES `categoria` (`id_Categoria`),
  CONSTRAINT `fk_producto_marca` FOREIGN KEY (`id_Marca`) REFERENCES `marca` (`id_Marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-17 18:26:42

SHOW TABLES;

