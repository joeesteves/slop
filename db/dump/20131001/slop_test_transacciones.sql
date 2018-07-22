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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (134,'2013-09-27',3000.00,2,'2013-09-27 18:35:16','2013-09-27 18:35:16',250,238,2,5,'Porbando cierre\r\n',1500.00,0),(135,'2013-09-27',1500.00,1,'2013-09-27 18:35:45','2013-09-27 18:35:45',238,237,3,5,'dsadasd',1500.00,0),(136,'2013-09-27',1500.00,2,'2013-09-27 18:40:50','2013-09-27 18:40:50',237,236,3,5,'dsadasda',750.00,0),(137,'2013-09-27',1500.00,3,'2013-09-27 18:41:30','2013-09-27 18:41:30',238,237,3,5,'kjkjkjh',500.00,0),(138,'2013-09-27',1000.00,4,'2013-09-27 19:08:11','2013-09-27 19:08:11',251,233,2,5,'Probando',250.00,0),(139,'2013-09-27',250.00,4,'2013-09-27 19:08:37','2013-09-27 19:09:10',233,237,3,5,'prbandoooo',62.50,0),(140,'2013-09-27',1000.00,1,'2013-09-27 21:36:04','2013-09-27 21:36:04',233,214,3,5,'adelanto de tarjeta',1000.00,0),(141,'2013-09-27',500.00,5,'2013-09-27 22:53:32','2013-09-27 22:53:32',251,234,2,5,'Cuotas del super',100.00,0),(142,'2013-09-27',300.00,1,'2013-09-27 22:53:53','2013-09-27 22:53:53',234,214,3,5,'adelanto de tarjeta',300.00,0),(143,'2013-09-27',750.00,20,'2013-09-27 23:04:30','2013-09-27 23:04:30',251,233,2,5,'jejejej',37.50,0),(144,'2013-09-27',400.00,1,'2013-09-27 23:34:13','2013-09-27 23:34:13',233,214,3,5,'cargar saldo',400.00,0),(145,'2013-10-15',1899.99,1,'2013-09-29 15:59:32','2013-09-29 15:59:32',251,217,2,5,'weqwe',1899.99,0),(146,'2013-09-30',15.00,1,'2013-09-29 16:59:06','2013-09-29 16:59:06',250,214,2,5,'dasdas',15.00,0),(147,'2013-09-29',9300.00,3,'2013-09-29 17:43:39','2013-09-29 17:43:39',41,29,2,6,'alq',3100.00,1),(148,'2013-09-29',3100.00,1,'2013-09-29 17:44:32','2013-09-29 17:44:32',29,24,3,6,'eddq',3100.00,0);
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

-- Dump completed on 2013-10-02 17:22:01
