CREATE DATABASE  IF NOT EXISTS `slop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `slop`;
-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: slop
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transacciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `importe` decimal(12,2) DEFAULT NULL,
  `cuotascantidad` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ctaD_id` int(11) DEFAULT NULL,
  `ctaH_id` int(11) DEFAULT NULL,
  `transacciontipo_id` int(11) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `valorCuota` decimal(12,2) DEFAULT NULL,
  `rmensuales` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_transacciones_on_ctaD_id` (`ctaD_id`),
  KEY `index_transacciones_on_ctaH_id` (`ctaH_id`),
  KEY `index_transacciones_on_transacciontipo_id` (`transacciontipo_id`),
  KEY `index_transacciones_on_empresa_id` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (7,'2013-09-04',1909.00,12,'2013-09-04 22:19:14','2013-09-04 22:19:14',4,4,2,7,'\r\n',159.08,0),(22,'2013-10-01',6200.00,2,'2013-09-22 19:51:20','2013-09-22 19:51:20',220,208,2,10,'ALQUILER',3100.00,1),(23,'2013-10-05',21000.00,3,'2013-09-22 20:34:39','2013-09-22 20:39:21',184,212,1,10,'SUELDO FLOPPY',7000.00,1),(24,'2013-10-15',3000.00,1,'2013-09-22 20:35:24','2013-09-22 20:35:24',189,213,1,10,'TASA DE JUSTICIA',3000.00,0),(25,'2013-12-15',3500.00,1,'2013-09-22 20:36:05','2013-09-22 20:36:05',189,213,1,10,'SAC FLOPPY',3500.00,0),(26,'2013-10-01',21000.00,3,'2013-09-22 20:38:18','2013-09-22 21:44:22',187,212,1,10,'SUELDO JOSE',7000.00,0),(27,'2013-10-01',6000.00,3,'2013-09-22 20:38:50','2013-09-22 20:38:50',187,212,1,10,'BONOS',2000.00,0),(28,'2013-10-20',1920.00,3,'2013-09-22 21:04:16','2013-09-22 21:21:17',220,184,2,10,'SEGURO',640.00,1),(29,'2013-10-05',630.00,3,'2013-09-22 21:04:57','2013-09-22 21:05:11',220,184,2,10,'TELERED',210.00,1),(30,'2013-12-15',3500.00,1,'2013-09-22 21:05:47','2013-09-22 21:05:47',187,212,1,10,'SAC JOSE',3500.00,0),(31,'2013-12-01',4100.00,1,'2013-09-22 21:09:42','2013-09-22 21:09:42',220,208,2,10,'ALQUILER NUEVO IMPORTE',4100.00,0),(32,'2013-12-01',4100.00,1,'2013-09-22 21:10:18','2013-09-22 21:10:18',220,208,2,10,'COMISIÓN FINCAS',4100.00,0),(33,'2013-12-01',1500.00,1,'2013-09-22 21:11:32','2013-09-22 21:11:32',220,208,2,10,'DEPOSITO DE ALQUILER DIFERENCIA (4100-2600 =1500)',1500.00,0),(34,'2013-09-15',550.00,1,'2013-09-22 21:14:45','2013-09-22 21:14:45',205,187,5,10,'ADELANTO EN TARJETA QUEDA A CRÉDITO',550.00,0),(35,'2013-09-22',3300.00,1,'2013-09-22 21:26:09','2013-09-22 21:56:46',186,210,5,10,'SALDOS INICIALES',3300.00,0),(36,'2013-09-22',46.00,1,'2013-09-22 21:26:40','2013-09-22 21:26:40',186,210,5,10,'SALDOS INCIALES',46.00,0),(39,'2013-09-22',22000.00,1,'2013-09-22 21:57:38','2013-09-22 21:57:38',189,210,5,10,'SALDOS INICIALES FLOPPY',22000.00,0),(40,'2013-10-15',450.00,1,'2013-09-22 21:58:13','2013-09-22 21:58:13',231,208,2,10,'CURSO PARTO',450.00,0),(41,'2013-10-15',3000.00,1,'2013-09-22 21:59:11','2013-09-22 21:59:11',231,208,2,10,'TRINIDAD SAN ISIDRO',3000.00,0),(42,'2013-10-16',972.16,7,'2013-09-22 22:05:24','2013-09-22 22:09:10',231,203,2,10,'LAN SALTA CABALGATA',138.88,0),(43,'2013-09-23',166.00,8,'2013-09-22 22:06:36','2013-09-22 22:08:40',231,203,2,10,'CUOTA FRAVEGA',20.75,0),(44,'2013-09-29',1257.50,10,'2013-09-22 22:07:37','2013-09-22 22:07:37',227,203,2,10,'MAQUINA COSER',125.75,0),(45,'2013-10-05',125.00,1,'2013-09-22 22:08:16','2013-09-22 22:09:49',231,203,2,10,'ZAPATOS',125.00,0);
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-02 17:22:00
