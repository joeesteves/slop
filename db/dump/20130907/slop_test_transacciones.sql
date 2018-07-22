CREATE DATABASE  IF NOT EXISTS `slop_test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `slop_test`;
-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: slop_test
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (5,'2013-09-04',100.00,3,'2013-09-04 12:09:02','2013-09-06 00:16:31',4,4,2,5,'sarlanda',33.33,0),(6,'2013-09-04',200.00,3,'2013-09-04 12:14:54','2013-09-06 00:16:19',4,4,2,5,'chau',66.67,0),(7,'2013-09-04',100.00,3,'2013-09-04 12:15:33','2013-09-06 00:16:06',4,4,2,5,'hola',33.33,1),(8,'2013-09-04',1000.00,3,'2013-09-04 12:15:50','2013-09-05 22:56:05',4,4,2,5,'dadqs',333.33,1),(9,'2013-09-05',50.00,2,'2013-09-05 23:09:49','2013-09-05 23:09:49',4,4,2,5,'BLA',25.00,0),(10,'2013-09-05',100.00,1,'2013-09-06 00:22:09','2013-09-06 00:22:09',4,4,3,5,'',100.00,0);
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

-- Dump completed on 2013-09-07 10:56:54
