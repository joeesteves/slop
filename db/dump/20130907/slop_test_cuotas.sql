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
-- Table structure for table `cuotas`
--

DROP TABLE IF EXISTS `cuotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuotas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `cuota` int(11) DEFAULT NULL,
  `importe` decimal(12,2) DEFAULT NULL,
  `transaccion_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `empresa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cuotas_on_transaccion_id` (`transaccion_id`),
  KEY `index_cuotas_on_empresa_id` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas`
--

LOCK TABLES `cuotas` WRITE;
/*!40000 ALTER TABLE `cuotas` DISABLE KEYS */;
INSERT INTO `cuotas` VALUES (62,'2013-09-04',1,333.33,8,'2013-09-05 23:11:52','2013-09-05 23:11:52','C-1: 333.33, dadqs',5),(63,'2013-10-04',2,333.33,8,'2013-09-05 23:11:52','2013-09-05 23:11:52','C-2: 333.33, dadqs',5),(64,'2013-11-04',3,333.34,8,'2013-09-05 23:11:52','2013-09-05 23:11:52','C-3: 333.33, dadqs',5),(65,'2013-09-04',1,33.33,7,'2013-09-06 00:16:07','2013-09-06 00:16:07','C-1: 33.33, hola',5),(66,'2013-10-04',2,33.33,7,'2013-09-06 00:16:07','2013-09-06 00:16:07','C-2: 33.33, hola',5),(67,'2013-11-04',3,33.34,7,'2013-09-06 00:16:07','2013-09-06 00:16:07','C-3: 33.33, hola',5),(68,'2013-09-04',1,66.67,6,'2013-09-06 00:16:19','2013-09-06 00:16:19','C-1: 66.67, chau',5),(69,'2013-10-04',2,66.67,6,'2013-09-06 00:16:19','2013-09-06 00:16:19','C-2: 66.67, chau',5),(70,'2013-11-04',3,66.66,6,'2013-09-06 00:16:19','2013-09-06 00:16:19','C-3: 66.67, chau',5),(71,'2013-09-04',1,33.33,5,'2013-09-06 00:16:31','2013-09-06 00:16:31','C-1: 33.33, sarlanda',5),(72,'2013-10-04',2,33.33,5,'2013-09-06 00:16:31','2013-09-06 00:16:31','C-2: 33.33, sarlanda',5),(73,'2013-11-04',3,33.34,5,'2013-09-06 00:16:31','2013-09-06 00:16:31','C-3: 33.33, sarlanda',5),(74,'2013-09-05',1,25.00,9,'2013-09-06 00:16:43','2013-09-06 00:16:43','C-1: 25.0, BLA',5),(75,'2013-10-05',2,25.00,9,'2013-09-06 00:16:44','2013-09-06 00:16:44','C-2: 25.0, BLA',5),(76,'2013-09-05',1,100.00,10,'2013-09-06 00:22:09','2013-09-06 00:22:09','C-1: 100.0, ',5);
/*!40000 ALTER TABLE `cuotas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-07 10:56:55
