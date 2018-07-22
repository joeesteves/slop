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
-- Table structure for table `asientos`
--

DROP TABLE IF EXISTS `asientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `debe` decimal(12,2) DEFAULT NULL,
  `haber` decimal(12,2) DEFAULT NULL,
  `cuenta_id` int(11) DEFAULT NULL,
  `transaccion_id` int(11) DEFAULT NULL,
  `cuota_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `empresa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_asientos_on_transaccion_id` (`transaccion_id`),
  KEY `index_asientos_on_cuota_id` (`cuota_id`),
  KEY `index_asientos_on_empresa_id` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asientos`
--

LOCK TABLES `asientos` WRITE;
/*!40000 ALTER TABLE `asientos` DISABLE KEYS */;
INSERT INTO `asientos` VALUES (58,'2013-09-04',1909.00,NULL,4,7,NULL,'2013-09-04 22:19:16','2013-09-04 22:19:16','\r\n',7),(59,'2013-09-04',NULL,159.08,4,7,35,'2013-09-04 22:19:16','2013-09-04 22:19:16','CUOTA: 1 (\r\n)',7),(60,'2013-10-04',NULL,159.08,4,7,36,'2013-09-04 22:19:17','2013-09-04 22:19:17','CUOTA: 2 (\r\n)',7),(61,'2013-11-04',NULL,159.08,4,7,37,'2013-09-04 22:19:17','2013-09-04 22:19:17','CUOTA: 3 (\r\n)',7),(62,'2013-12-04',NULL,159.08,4,7,38,'2013-09-04 22:19:17','2013-09-04 22:19:17','CUOTA: 4 (\r\n)',7),(63,'2014-01-04',NULL,159.08,4,7,39,'2013-09-04 22:19:17','2013-09-04 22:19:17','CUOTA: 5 (\r\n)',7),(64,'2014-02-04',NULL,159.08,4,7,40,'2013-09-04 22:19:17','2013-09-04 22:19:17','CUOTA: 6 (\r\n)',7),(65,'2014-03-04',NULL,159.08,4,7,41,'2013-09-04 22:19:17','2013-09-04 22:19:17','CUOTA: 7 (\r\n)',7),(66,'2014-04-04',NULL,159.08,4,7,42,'2013-09-04 22:19:17','2013-09-04 22:19:17','CUOTA: 8 (\r\n)',7),(67,'2014-05-04',NULL,159.08,4,7,43,'2013-09-04 22:19:18','2013-09-04 22:19:18','CUOTA: 9 (\r\n)',7),(68,'2014-06-04',NULL,159.08,4,7,44,'2013-09-04 22:19:18','2013-09-04 22:19:18','CUOTA: 10 (\r\n)',7),(69,'2014-07-04',NULL,159.08,4,7,45,'2013-09-04 22:19:18','2013-09-04 22:19:18','CUOTA: 11 (\r\n)',7),(70,'2014-08-04',NULL,159.12,4,7,46,'2013-09-04 22:19:18','2013-09-04 22:19:18','CUOTA: 12 (\r\n)',7);
/*!40000 ALTER TABLE `asientos` ENABLE KEYS */;
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
