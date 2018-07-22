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
-- Table structure for table `cat_tipos_tipo_accs`
--

DROP TABLE IF EXISTS `cat_tipos_tipo_accs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_tipos_tipo_accs` (
  `cat_tipo_id` int(11) DEFAULT NULL,
  `tipo_acc_id` int(11) DEFAULT NULL,
  KEY `index_catTipo_tipoAcc_on_catTipo_id_and_tipoAcc_id` (`cat_tipo_id`,`tipo_acc_id`),
  KEY `index_catTipo_tipoAcc_on_tipoAcc_id_and_catTipo_id` (`tipo_acc_id`,`cat_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_tipos_tipo_accs`
--

LOCK TABLES `cat_tipos_tipo_accs` WRITE;
/*!40000 ALTER TABLE `cat_tipos_tipo_accs` DISABLE KEYS */;
INSERT INTO `cat_tipos_tipo_accs` VALUES (1,1),(1,3),(1,4),(1,5),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(2,1),(2,2),(2,4),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(3,1),(3,4),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(4,1),(4,4),(4,8),(4,9),(4,10),(4,11),(4,12),(4,13);
/*!40000 ALTER TABLE `cat_tipos_tipo_accs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-31 11:57:25
