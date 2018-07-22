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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'ALFREDO','$2a$10$ZgsHR26Gs4ZxuudMnrhFvOgUp4vsB0mwpWfcqnVjDD/hpRTlHKI7.','2013-07-26 21:49:26','2013-07-26 21:50:18'),(6,'PONY','$2a$10$Pwv0C1w96fmVQykH0rD8t.Jq17wUXq6ymAyr6UjuCJEnULI3y3YwK','2013-07-31 12:55:50','2013-07-31 12:55:50');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_accs`
--

DROP TABLE IF EXISTS `tipo_accs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_accs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_accs`
--

LOCK TABLES `tipo_accs` WRITE;
/*!40000 ALTER TABLE `tipo_accs` DISABLE KEYS */;
INSERT INTO `tipo_accs` VALUES (1,'RECUENTO POSITIVO',1,'2013-04-02 15:33:44','2013-04-10 21:01:51'),(2,'NACIMIENTO',2,'2013-04-02 15:34:03','2013-04-02 15:34:03'),(3,'PARTO',0,'2013-04-02 15:34:20','2013-04-02 15:34:20'),(4,'MUERTE',-2,'2013-04-02 15:34:29','2013-04-10 21:14:18'),(5,'TACTO',15,'2013-04-02 15:35:05','2013-04-03 03:23:37'),(6,'YERRA',15,'2013-04-02 15:35:23','2013-04-03 03:23:31'),(7,'DESTETE',15,'2013-04-02 15:35:40','2013-04-03 03:23:24'),(8,'CAMBIO DE CATEGORIA',11,'2013-04-03 03:24:01','2013-04-03 03:24:01'),(9,'RECUENTO NEGATIVO',-1,'2013-04-10 21:01:31','2013-04-10 21:14:30'),(10,'RECEPCION',3,'2013-04-10 21:02:37','2013-04-10 21:02:37'),(11,'REC. TRASLADO INTERNO',4,'2013-04-10 21:03:32','2013-04-10 21:03:32'),(12,'DESPACHO',-3,'2013-04-10 21:03:53','2013-04-10 21:03:53'),(13,'DESP. TRASLADO INTERNO',-4,'2013-04-10 21:04:32','2013-04-10 21:04:32');
/*!40000 ALTER TABLE `tipo_accs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_accions`
--

DROP TABLE IF EXISTS `estado_accions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_accions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado_id` int(11) DEFAULT NULL,
  `tipo_acc_id` int(11) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_estado_accions_on_estado_id` (`estado_id`),
  KEY `index_estado_accions_on_tipo_acc_id` (`tipo_acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_accions`
--

LOCK TABLES `estado_accions` WRITE;
/*!40000 ALTER TABLE `estado_accions` DISABLE KEYS */;
INSERT INTO `estado_accions` VALUES (1,1,1,2,'2013-04-02 15:33:45','2013-04-02 15:33:45'),(2,2,1,2,'2013-04-02 15:33:45','2013-04-02 15:33:45'),(3,3,1,2,'2013-04-02 15:33:45','2013-04-02 15:33:45'),(4,4,1,2,'2013-04-02 15:33:45','2013-04-02 15:33:45'),(5,5,1,2,'2013-04-02 15:33:45','2013-04-02 15:33:45'),(6,6,1,2,'2013-04-02 15:33:45','2013-04-02 15:33:45'),(7,7,1,2,'2013-04-02 15:33:45','2013-04-02 15:33:45'),(8,8,1,2,'2013-04-02 15:33:45','2013-04-02 15:33:45'),(9,6,2,2,'2013-04-02 15:34:03','2013-04-02 15:34:03'),(10,2,2,1,'2013-04-02 15:34:03','2013-04-02 15:34:03'),(11,4,3,2,'2013-04-02 15:34:20','2013-04-02 15:34:20'),(12,1,4,2,'2013-04-02 15:34:29','2013-04-02 15:34:29'),(13,2,4,2,'2013-04-02 15:34:29','2013-04-02 15:34:29'),(14,3,4,2,'2013-04-02 15:34:29','2013-04-02 15:34:29'),(15,4,4,2,'2013-04-02 15:34:29','2013-04-02 15:34:29'),(16,5,4,2,'2013-04-02 15:34:29','2013-04-02 15:34:29'),(17,6,4,2,'2013-04-02 15:34:29','2013-04-02 15:34:29'),(18,7,4,2,'2013-04-02 15:34:29','2013-04-02 15:34:29'),(19,8,4,2,'2013-04-02 15:34:30','2013-04-02 15:34:30'),(20,2,5,2,'2013-04-02 15:35:05','2013-04-02 15:35:05'),(21,3,5,2,'2013-04-02 15:35:05','2013-04-02 15:35:05'),(22,1,5,1,'2013-04-02 15:35:05','2013-04-02 15:35:05'),(23,7,6,2,'2013-04-02 15:35:23','2013-04-02 15:35:23'),(24,6,6,1,'2013-04-02 15:35:23','2013-04-02 15:35:23'),(25,8,7,2,'2013-04-02 15:35:40','2013-04-02 15:35:40'),(26,7,7,1,'2013-04-02 15:35:40','2013-04-02 15:35:40'),(27,1,8,3,'2013-04-03 03:24:01','2013-04-03 03:24:01'),(28,2,8,3,'2013-04-03 03:24:01','2013-04-03 03:24:01'),(29,3,8,3,'2013-04-03 03:24:01','2013-04-03 03:24:01'),(30,4,8,3,'2013-04-03 03:24:01','2013-04-03 03:24:01'),(31,5,8,3,'2013-04-03 03:24:01','2013-04-03 03:24:01'),(32,6,8,3,'2013-04-03 03:24:01','2013-04-03 03:24:01'),(33,7,8,3,'2013-04-03 03:24:01','2013-04-03 03:24:01'),(34,8,8,3,'2013-04-03 03:24:01','2013-04-03 03:24:01'),(35,1,9,2,'2013-04-10 21:01:32','2013-04-10 21:01:32'),(36,2,9,2,'2013-04-10 21:01:32','2013-04-10 21:01:32'),(37,3,9,2,'2013-04-10 21:01:32','2013-04-10 21:01:32'),(38,4,9,2,'2013-04-10 21:01:32','2013-04-10 21:01:32'),(39,5,9,2,'2013-04-10 21:01:32','2013-04-10 21:01:32'),(40,6,9,2,'2013-04-10 21:01:32','2013-04-10 21:01:32'),(41,7,9,2,'2013-04-10 21:01:32','2013-04-10 21:01:32'),(42,8,9,2,'2013-04-10 21:01:32','2013-04-10 21:01:32'),(43,1,10,2,'2013-04-10 21:02:37','2013-04-10 21:02:37'),(44,2,10,2,'2013-04-10 21:02:37','2013-04-10 21:02:37'),(45,3,10,2,'2013-04-10 21:02:37','2013-04-10 21:02:37'),(46,4,10,2,'2013-04-10 21:02:37','2013-04-10 21:02:37'),(47,5,10,2,'2013-04-10 21:02:37','2013-04-10 21:02:37'),(48,6,10,2,'2013-04-10 21:02:37','2013-04-10 21:02:37'),(49,7,10,2,'2013-04-10 21:02:37','2013-04-10 21:02:37'),(50,8,10,2,'2013-04-10 21:02:37','2013-04-10 21:02:37'),(51,1,11,2,'2013-04-10 21:03:32','2013-04-10 21:03:32'),(52,2,11,2,'2013-04-10 21:03:32','2013-04-10 21:03:32'),(53,3,11,2,'2013-04-10 21:03:32','2013-04-10 21:03:32'),(54,4,11,2,'2013-04-10 21:03:32','2013-04-10 21:03:32'),(55,5,11,2,'2013-04-10 21:03:32','2013-04-10 21:03:32'),(56,6,11,2,'2013-04-10 21:03:32','2013-04-10 21:03:32'),(57,7,11,2,'2013-04-10 21:03:32','2013-04-10 21:03:32'),(58,8,11,2,'2013-04-10 21:03:32','2013-04-10 21:03:32'),(59,1,12,2,'2013-04-10 21:03:53','2013-04-10 21:03:53'),(60,2,12,2,'2013-04-10 21:03:53','2013-04-10 21:03:53'),(61,3,12,2,'2013-04-10 21:03:53','2013-04-10 21:03:53'),(62,4,12,2,'2013-04-10 21:03:53','2013-04-10 21:03:53'),(63,5,12,2,'2013-04-10 21:03:53','2013-04-10 21:03:53'),(64,6,12,2,'2013-04-10 21:03:53','2013-04-10 21:03:53'),(65,7,12,2,'2013-04-10 21:03:53','2013-04-10 21:03:53'),(66,8,12,2,'2013-04-10 21:03:53','2013-04-10 21:03:53'),(67,1,13,2,'2013-04-10 21:04:32','2013-04-10 21:04:32'),(68,2,13,2,'2013-04-10 21:04:32','2013-04-10 21:04:32'),(69,3,13,2,'2013-04-10 21:04:32','2013-04-10 21:04:32'),(70,4,13,2,'2013-04-10 21:04:32','2013-04-10 21:04:32'),(71,5,13,2,'2013-04-10 21:04:32','2013-04-10 21:04:32'),(72,6,13,2,'2013-04-10 21:04:32','2013-04-10 21:04:32'),(73,7,13,2,'2013-04-10 21:04:32','2013-04-10 21:04:32'),(74,8,13,2,'2013-04-10 21:04:32','2013-04-10 21:04:32'),(75,9,8,3,'2013-04-13 20:05:14','2013-04-13 20:05:14'),(76,10,8,3,'2013-04-13 20:05:14','2013-04-13 20:05:14'),(77,9,13,2,'2013-04-13 20:05:21','2013-04-13 20:05:21'),(78,10,13,2,'2013-04-13 20:05:21','2013-04-13 20:05:21'),(79,9,12,2,'2013-04-13 20:05:27','2013-04-13 20:05:27'),(80,10,12,2,'2013-04-13 20:05:27','2013-04-13 20:05:27'),(81,9,4,2,'2013-04-13 20:05:33','2013-04-13 20:05:33'),(82,10,4,2,'2013-04-13 20:05:33','2013-04-13 20:05:33'),(83,9,9,2,'2013-04-13 20:05:42','2013-04-13 20:05:42'),(84,10,9,2,'2013-04-13 20:05:42','2013-04-13 20:05:42'),(85,9,1,2,'2013-04-13 20:05:49','2013-04-13 20:05:49'),(86,10,1,2,'2013-04-13 20:05:49','2013-04-13 20:05:49'),(87,11,5,2,'2013-07-26 22:01:05','2013-07-26 22:01:05'),(88,11,12,2,'2013-07-31 22:46:24','2013-07-31 22:46:24'),(89,11,13,2,'2013-07-31 23:36:00','2013-07-31 23:36:00'),(90,11,4,2,'2013-07-31 23:36:11','2013-07-31 23:36:11'),(91,11,9,2,'2013-07-31 23:36:18','2013-07-31 23:36:18'),(92,11,1,2,'2013-07-31 23:36:28','2013-07-31 23:36:28'),(94,11,10,2,'2013-07-31 23:36:42','2013-07-31 23:36:42'),(95,9,11,2,'2013-07-31 23:36:56','2013-07-31 23:36:56'),(96,10,11,2,'2013-07-31 23:36:56','2013-07-31 23:36:56'),(97,11,11,2,'2013-07-31 23:36:56','2013-07-31 23:36:56'),(98,11,8,3,'2013-07-31 23:37:03','2013-07-31 23:37:03'),(99,12,13,2,'2013-08-01 00:24:05','2013-08-01 00:24:05'),(100,12,12,2,'2013-08-01 00:24:12','2013-08-01 00:24:12'),(101,12,4,2,'2013-08-01 00:24:17','2013-08-01 00:24:17'),(102,12,9,2,'2013-08-01 00:24:22','2013-08-01 00:24:22'),(103,12,1,2,'2013-08-01 00:24:32','2013-08-01 00:24:32'),(104,12,11,2,'2013-08-01 00:24:37','2013-08-01 00:24:37'),(105,12,8,3,'2013-08-01 00:24:44','2013-08-01 00:24:44'),(106,11,2,1,'2013-08-01 03:25:05','2013-08-01 03:25:05');
/*!40000 ALTER TABLE `estado_accions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rodeos`
--

DROP TABLE IF EXISTS `rodeos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rodeos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rodeos`
--

LOCK TABLES `rodeos` WRITE;
/*!40000 ALTER TABLE `rodeos` DISABLE KEYS */;
INSERT INTO `rodeos` VALUES (1,'RODEO 1','','2013-04-02 15:37:08','2013-04-02 15:37:08'),(2,'RODEO 2','','2013-04-13 21:00:48','2013-04-13 21:01:01');
/*!40000 ALTER TABLE `rodeos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `rodeo_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `kilos` int(11) DEFAULT NULL,
  `tipo_acc_id` int(11) DEFAULT NULL,
  `origen_id` int(11) DEFAULT NULL,
  `establecimiento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_movimientos_on_category_id` (`category_id`),
  KEY `index_movimientos_on_estado_id` (`estado_id`),
  KEY `index_movimientos_on_rodeo_id` (`rodeo_id`),
  KEY `index_movimientos_on_tipo_acc_id` (`tipo_acc_id`),
  KEY `index_movimientos_on_user_id` (`user_id`),
  KEY `index_movimientos_on_origen_id` (`origen_id`),
  KEY `index_movimientos_on_establecimiento_id` (`establecimiento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (167,'2013-04-01','LOTE 1 SALDO INICIAL',1,1,1,'2013-07-26 21:54:16','2013-07-26 21:54:16',NULL,128,450,1,NULL,10),(168,'2013-04-01','LOTE 2 SALDO INICIAL',1,1,1,'2013-07-26 21:54:46','2013-07-26 21:54:46',NULL,83,450,1,NULL,10),(169,'2013-04-01','SALDO INICIAL',1,2,2,'2013-07-26 21:55:31','2013-07-26 21:56:05',NULL,27,400,1,NULL,10),(170,'2013-04-01','SALDO INCIAL',1,2,6,'2013-07-26 21:55:56','2013-07-26 21:56:13',NULL,31,320,1,NULL,10),(171,'2013-04-15','LOTE 1',2,1,1,'2013-07-26 22:00:33','2013-07-26 22:00:33',NULL,110,450,5,NULL,10),(172,'2013-04-15','LOTE 1 PREÑADA VJ PARA VENTA',11,1,1,'2013-07-26 22:02:00','2013-07-26 22:02:12',NULL,6,450,5,NULL,10),(173,'2013-04-15','LOTE 2',2,1,1,'2013-07-26 22:03:14','2013-07-26 22:03:14',NULL,66,450,5,NULL,10),(174,'2013-04-15','LOTE 2 PREÑADA VJ PARA VENTA',11,1,1,'2013-07-26 22:03:38','2013-07-26 22:03:38',NULL,5,450,5,NULL,10),(175,'2013-04-15','LOTE 1',3,1,1,'2013-07-26 22:03:59','2013-07-26 22:04:25',NULL,12,450,5,NULL,10),(176,'2013-04-15','LOTE 2\r\n',3,1,1,'2013-07-26 22:04:19','2013-07-26 22:04:19',NULL,12,450,5,NULL,10),(177,'2013-04-15','',2,2,2,'2013-07-26 22:05:02','2013-07-26 22:05:02',NULL,23,400,5,NULL,10),(178,'2013-04-15','',3,2,2,'2013-07-26 22:05:31','2013-07-26 22:06:48',NULL,4,400,5,NULL,10),(179,'2013-04-15','',2,2,6,'2013-07-26 22:06:10','2013-07-26 22:06:10',NULL,19,320,5,NULL,10),(180,'2013-04-15','REPO',3,2,6,'2013-07-26 22:06:35','2013-07-26 22:06:35',NULL,11,320,5,NULL,10),(182,'2013-06-06','VACA VACIA',3,1,1,'2013-07-31 22:38:33','2013-07-31 22:38:33',NULL,11,NULL,12,NULL,10),(183,'2013-06-01','VACAS DE CHIQUITO',2,1,1,'2013-07-31 22:39:17','2013-07-31 22:39:17',NULL,7,NULL,9,NULL,10),(184,'2013-06-01','VACA DE CHIQUITO',3,1,1,'2013-07-31 22:39:38','2013-07-31 22:39:38',NULL,1,NULL,9,NULL,10),(185,'2013-06-06','',2,1,1,'2013-07-31 22:43:27','2013-07-31 22:43:27',NULL,3,NULL,12,NULL,10),(186,'2013-06-06','VENTA REMATE DE LALOR',11,1,1,'2013-07-31 22:46:51','2013-07-31 22:50:19',NULL,11,NULL,12,NULL,10),(187,'2013-04-01','HAY TERNERAS DE FELA Y ALFREDO',12,2,3,'2013-08-01 00:25:43','2013-08-01 00:25:43',NULL,72,280,1,NULL,10),(188,'2013-04-01','TERNERAS DE LOS LOPEZ',12,2,8,'2013-08-01 00:27:22','2013-08-01 00:27:52',NULL,3,280,1,NULL,10),(193,'2013-07-20','2 NEGROS\r\n2 COLORADOS',6,1,9,'2013-08-01 03:56:29','2013-08-01 03:57:02',NULL,4,50,2,NULL,10),(194,'2013-07-20',NULL,4,1,1,'2013-08-01 03:56:29','2013-08-01 03:56:29',NULL,4,NULL,3,NULL,10);
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimientos`
--

DROP TABLE IF EXISTS `establecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `establecimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimientos`
--

LOCK TABLES `establecimientos` WRITE;
/*!40000 ALTER TABLE `establecimientos` DISABLE KEYS */;
INSERT INTO `establecimientos` VALUES (10,'SJ','SAN JOSE','2013-07-26 21:49:57','2013-07-26 21:49:57'),(11,'EA','EL ALTILLO','2013-07-26 21:50:07','2013-07-26 21:50:07');
/*!40000 ALTER TABLE `establecimientos` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `animals_movimientos`
--

DROP TABLE IF EXISTS `animals_movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animals_movimientos` (
  `animal_id` int(11) DEFAULT NULL,
  `movimiento_id` int(11) DEFAULT NULL,
  KEY `index_animals_movimientos_on_animal_id_and_movimiento_id` (`animal_id`,`movimiento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals_movimientos`
--

LOCK TABLES `animals_movimientos` WRITE;
/*!40000 ALTER TABLE `animals_movimientos` DISABLE KEYS */;
INSERT INTO `animals_movimientos` VALUES (1324,167),(1324,171),(1324,185),(1325,167),(1325,171),(1325,185),(1326,167),(1326,171),(1326,185),(1327,167),(1327,171),(1327,194),(1328,167),(1328,171),(1328,194),(1329,167),(1329,171),(1329,194),(1330,167),(1330,171),(1330,194),(1331,167),(1331,171),(1332,167),(1332,171),(1333,167),(1333,171),(1334,167),(1334,171),(1335,167),(1335,171),(1336,167),(1336,171),(1337,167),(1337,171),(1338,167),(1338,171),(1338,183),(1339,167),(1339,171),(1339,183),(1340,167),(1340,171),(1340,183),(1341,167),(1341,171),(1341,183),(1342,167),(1342,171),(1342,183),(1343,167),(1343,171),(1343,183),(1344,167),(1344,171),(1344,183),(1345,167),(1345,171),(1346,167),(1346,171),(1347,167),(1347,171),(1348,167),(1348,171),(1349,167),(1349,171),(1350,167),(1350,171),(1351,167),(1351,171),(1352,167),(1352,171),(1353,167),(1353,171),(1354,167),(1354,171),(1355,167),(1355,171),(1356,167),(1356,171),(1357,167),(1357,171),(1358,167),(1358,171),(1359,167),(1359,171),(1360,167),(1360,171),(1361,167),(1361,171),(1362,167),(1362,171),(1363,167),(1363,171),(1364,167),(1364,171),(1365,167),(1365,171),(1366,167),(1366,171),(1367,167),(1367,171),(1368,167),(1368,171),(1369,167),(1369,171),(1370,167),(1370,171),(1371,167),(1371,171),(1372,167),(1372,171),(1373,167),(1373,171),(1374,167),(1374,171),(1375,167),(1375,171),(1376,167),(1376,171),(1377,167),(1377,171),(1378,167),(1378,171),(1379,167),(1379,171),(1380,167),(1380,171),(1381,167),(1381,171),(1382,167),(1382,171),(1383,167),(1383,171),(1384,167),(1384,171),(1385,167),(1385,171),(1386,167),(1386,171),(1387,167),(1387,171),(1388,167),(1388,171),(1389,167),(1389,171),(1390,167),(1390,171),(1391,167),(1391,171),(1392,167),(1392,171),(1393,167),(1393,171),(1394,167),(1394,171),(1395,167),(1395,171),(1396,167),(1396,171),(1397,167),(1397,171),(1398,167),(1398,171),(1399,167),(1399,171),(1400,167),(1400,171),(1401,167),(1401,171),(1402,167),(1402,171),(1403,167),(1403,171),(1404,167),(1404,171),(1405,167),(1405,171),(1406,167),(1406,171),(1407,167),(1407,171),(1408,167),(1408,171),(1409,167),(1409,171),(1410,167),(1410,171),(1411,167),(1411,171),(1412,167),(1412,171),(1413,167),(1413,171),(1414,167),(1414,171),(1415,167),(1415,171),(1416,167),(1416,171),(1417,167),(1417,171),(1418,167),(1418,171),(1419,167),(1419,171),(1420,167),(1420,171),(1421,167),(1421,171),(1422,167),(1422,171),(1423,167),(1423,171),(1424,167),(1424,171),(1425,167),(1425,171),(1426,167),(1426,171),(1427,167),(1427,171),(1428,167),(1428,171),(1429,167),(1429,171),(1430,167),(1430,171),(1431,167),(1431,171),(1432,167),(1432,171),(1433,167),(1433,171),(1434,167),(1434,172),(1434,186),(1435,167),(1435,172),(1435,186),(1436,167),(1436,172),(1436,186),(1437,167),(1437,172),(1437,186),(1438,167),(1438,172),(1438,186),(1439,167),(1439,172),(1439,186),(1440,167),(1440,173),(1441,167),(1441,173),(1442,167),(1442,173),(1443,167),(1443,173),(1444,167),(1444,173),(1445,167),(1445,173),(1446,167),(1446,173),(1447,167),(1447,173),(1448,167),(1448,173),(1449,167),(1449,173),(1450,167),(1450,173),(1451,167),(1451,173),(1452,168),(1452,173),(1453,168),(1453,173),(1454,168),(1454,173),(1455,168),(1455,173),(1456,168),(1456,173),(1457,168),(1457,173),(1458,168),(1458,173),(1459,168),(1459,173),(1460,168),(1460,173),(1461,168),(1461,173),(1462,168),(1462,173),(1463,168),(1463,173),(1464,168),(1464,173),(1465,168),(1465,173),(1466,168),(1466,173),(1467,168),(1467,173),(1468,168),(1468,173),(1469,168),(1469,173),(1470,168),(1470,173),(1471,168),(1471,173),(1472,168),(1472,173),(1473,168),(1473,173),(1474,168),(1474,173),(1475,168),(1475,173),(1476,168),(1476,173),(1477,168),(1477,173),(1478,168),(1478,173),(1479,168),(1479,173),(1480,168),(1480,173),(1481,168),(1481,173),(1482,168),(1482,173),(1483,168),(1483,173),(1484,168),(1484,173),(1485,168),(1485,173),(1486,168),(1486,173),(1487,168),(1487,173),(1488,168),(1488,173),(1489,168),(1489,173),(1490,168),(1490,173),(1491,168),(1491,173),(1492,168),(1492,173),(1493,168),(1493,173),(1494,168),(1494,173),(1495,168),(1495,173),(1496,168),(1496,173),(1497,168),(1497,173),(1498,168),(1498,173),(1499,168),(1499,173),(1500,168),(1500,173),(1501,168),(1501,173),(1502,168),(1502,173),(1503,168),(1503,173),(1504,168),(1504,173),(1505,168),(1505,173),(1506,168),(1506,174),(1506,186),(1507,168),(1507,174),(1507,186),(1508,168),(1508,174),(1508,186),(1509,168),(1509,174),(1509,186),(1510,168),(1510,174),(1510,186),(1511,168),(1511,175),(1511,182),(1512,168),(1512,175),(1512,182),(1513,168),(1513,175),(1513,182),(1514,168),(1514,175),(1514,182),(1515,168),(1515,175),(1515,182),(1516,168),(1516,175),(1516,182),(1517,168),(1517,175),(1517,182),(1518,168),(1518,175),(1518,182),(1519,168),(1519,175),(1519,182),(1520,168),(1520,175),(1520,182),(1521,168),(1521,175),(1521,182),(1522,168),(1522,175),(1522,184),(1523,168),(1523,176),(1524,168),(1524,176),(1525,168),(1525,176),(1526,168),(1526,176),(1527,168),(1527,176),(1528,168),(1528,176),(1529,168),(1529,176),(1530,168),(1530,176),(1531,168),(1531,176),(1532,168),(1532,176),(1533,168),(1533,176),(1534,168),(1534,176),(1535,169),(1535,177),(1536,169),(1536,177),(1537,169),(1537,177),(1538,169),(1538,177),(1539,169),(1539,177),(1540,169),(1540,177),(1541,169),(1541,177),(1542,169),(1542,177),(1543,169),(1543,177),(1544,169),(1544,177),(1545,169),(1545,177),(1546,169),(1546,177),(1547,169),(1547,177),(1548,169),(1548,177),(1549,169),(1549,177),(1550,169),(1550,177),(1551,169),(1551,177),(1552,169),(1552,177),(1553,169),(1553,177),(1554,169),(1554,177),(1555,169),(1555,177),(1556,169),(1556,177),(1557,169),(1557,177),(1558,169),(1558,178),(1559,169),(1559,178),(1560,169),(1560,178),(1561,169),(1561,178),(1562,170),(1562,179),(1563,170),(1563,179),(1564,170),(1564,179),(1565,170),(1565,179),(1566,170),(1566,179),(1567,170),(1567,179),(1568,170),(1568,179),(1569,170),(1569,179),(1570,170),(1570,179),(1571,170),(1571,179),(1572,170),(1572,179),(1573,170),(1573,179),(1574,170),(1574,179),(1575,170),(1575,179),(1576,170),(1576,179),(1577,170),(1577,179),(1578,170),(1578,179),(1579,170),(1579,179),(1580,170),(1580,179),(1581,170),(1581,180),(1582,170),(1582,180),(1583,170),(1583,180),(1584,170),(1584,180),(1585,170),(1585,180),(1586,170),(1586,180),(1587,170),(1587,180),(1588,170),(1588,180),(1589,170),(1589,180),(1590,170),(1590,180),(1591,170),(1591,180),(1592,170),(1593,187),(1594,187),(1595,187),(1596,187),(1597,187),(1598,187),(1599,187),(1600,187),(1601,187),(1602,187),(1603,187),(1604,187),(1605,187),(1606,187),(1607,187),(1608,187),(1609,187),(1610,187),(1611,187),(1612,187),(1613,187),(1614,187),(1615,187),(1616,187),(1617,187),(1618,187),(1619,187),(1620,187),(1621,187),(1622,187),(1623,187),(1624,187),(1625,187),(1626,187),(1627,187),(1628,187),(1629,187),(1630,187),(1631,187),(1632,187),(1633,187),(1634,187),(1635,187),(1636,187),(1637,187),(1638,187),(1639,187),(1640,187),(1641,187),(1642,187),(1643,187),(1644,187),(1645,187),(1646,187),(1647,187),(1648,187),(1649,187),(1650,187),(1651,187),(1652,187),(1653,187),(1654,187),(1655,187),(1656,187),(1657,187),(1658,187),(1659,187),(1660,187),(1661,187),(1662,187),(1663,187),(1664,187),(1665,188),(1666,188),(1667,188),(1675,193),(1676,193),(1677,193),(1678,193);
/*!40000 ALTER TABLE `animals_movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `establecimiento_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `permiso` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (2,10,4,1,'2013-07-26 21:49:57','2013-07-26 21:50:18'),(3,11,4,1,'2013-07-26 21:50:07','2013-07-26 21:50:18'),(4,10,5,1,'2013-07-29 23:33:37','2013-07-31 12:55:00'),(5,11,5,1,'2013-07-31 12:53:47','2013-07-31 12:55:00'),(6,10,6,1,'2013-07-31 12:56:03','2013-07-31 12:56:14'),(7,11,6,1,'2013-07-31 12:56:07','2013-07-31 12:56:14');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catTipo_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `pesoEstandard` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_categories_on_categoriasTipo_id` (`catTipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'VACA','',1,'2013-04-02 15:36:41','2013-07-23 23:39:11',450),(2,'VAQUILLONA 2S','',1,'2013-04-02 15:36:48','2013-07-26 21:51:27',400),(3,'TERNERAS RC','',4,'2013-04-02 15:36:55','2013-08-01 00:23:39',280),(5,'TORITO','',3,'2013-04-13 20:07:12','2013-07-26 21:51:48',350),(6,'VAQUILLONA 1S','',1,'2013-07-26 21:51:41','2013-07-26 21:51:41',320),(7,'TORO','',3,'2013-07-26 21:52:11','2013-07-26 21:52:11',650),(8,'TERNERAS LOPEZ','',4,'2013-08-01 00:26:38','2013-08-01 00:26:38',280),(9,'OREJANO','',2,'2013-08-01 03:25:50','2013-08-01 03:25:50',50);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_tipos`
--

DROP TABLE IF EXISTS `cat_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_tipos`
--

LOCK TABLES `cat_tipos` WRITE;
/*!40000 ALTER TABLE `cat_tipos` DISABLE KEYS */;
INSERT INTO `cat_tipos` VALUES (1,'REP. HEMBRA','','2013-04-02 15:36:12','2013-04-02 15:36:12'),(2,'TERNERO','','2013-04-02 15:36:26','2013-04-02 15:36:26'),(3,'REP. MACHO','','2013-04-13 20:04:33','2013-04-13 20:04:33'),(4,'RECRIA','','2013-08-01 00:23:08','2013-08-01 00:23:08');
/*!40000 ALTER TABLE `cat_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130311154400'),('20130311154427'),('20130311154546'),('20130311162100'),('20130311163043'),('20130311163132'),('20130311164612'),('20130311165201'),('20130311193656'),('20130311232700'),('20130311232851'),('20130311235259'),('20130312000539'),('20130312002506'),('20130312021857'),('20130312024643'),('20130312183552'),('20130317134029'),('20130317170149'),('20130317170728'),('20130317173302'),('20130325134044'),('20130325141014'),('20130325141230'),('20130325141808'),('20130327183540'),('20130327210824'),('20130328040839'),('20130401230238'),('20130402200540'),('20130414212635'),('20130720231713'),('20130720235935'),('20130721000001'),('20130721212953'),('20130722144458'),('20130722150720'),('20130723015140');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animals`
--

DROP TABLE IF EXISTS `animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rp` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1679 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
INSERT INTO `animals` VALUES (1324,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:43:27'),(1325,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:43:27'),(1326,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:43:27'),(1327,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:45:34'),(1328,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:45:34'),(1329,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:45:34'),(1330,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:45:34'),(1331,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:45:34'),(1332,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:45:34'),(1333,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:45:34'),(1334,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:45:34'),(1335,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:45:34'),(1336,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:45:34'),(1337,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:45:34'),(1338,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:11','2013-07-31 22:39:16'),(1339,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-31 22:39:16'),(1340,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-31 22:39:16'),(1341,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-31 22:39:16'),(1342,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-31 22:39:16'),(1343,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-31 22:39:16'),(1344,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-31 22:39:17'),(1345,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1346,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1347,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1348,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1349,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1350,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1351,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1352,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1353,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1354,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1355,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1356,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1357,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1358,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1359,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1360,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1361,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1362,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1363,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1364,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1365,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:12','2013-07-26 21:54:12'),(1366,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1367,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1368,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1369,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1370,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1371,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1372,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1373,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1374,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1375,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1376,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1377,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1378,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1379,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1380,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1381,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1382,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:13','2013-07-26 21:54:13'),(1383,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1384,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1385,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1386,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1387,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1388,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1389,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1390,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1391,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1392,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1393,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1394,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1395,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1396,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1397,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1398,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1399,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1400,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1401,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1402,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1403,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1404,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:14','2013-07-26 21:54:14'),(1405,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1406,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1407,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1408,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1409,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1410,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1411,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1412,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1413,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1414,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1415,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1416,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1417,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1418,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1419,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1420,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1421,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1422,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1423,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1424,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1425,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1426,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1427,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1428,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1429,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1430,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1431,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1432,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1433,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:15','2013-07-26 21:54:15'),(1434,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-31 22:46:51'),(1435,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-31 22:46:51'),(1436,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-31 22:46:51'),(1437,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-31 22:46:51'),(1438,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-31 22:46:51'),(1439,NULL,0,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-31 22:46:51'),(1440,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-26 21:54:16'),(1441,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-26 21:54:16'),(1442,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-26 21:54:16'),(1443,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-26 21:54:16'),(1444,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-26 21:54:16'),(1445,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-26 21:54:16'),(1446,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-26 21:54:16'),(1447,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-26 21:54:16'),(1448,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-26 21:54:16'),(1449,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-26 21:54:16'),(1450,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-26 21:54:16'),(1451,NULL,1,NULL,'Creado por el movimiento Origen','2013-07-26 21:54:16','2013-07-26 21:54:16'),(1452,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:42','2013-07-26 21:54:42'),(1453,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:42','2013-07-26 21:54:42'),(1454,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1455,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1456,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1457,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1458,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1459,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1460,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1461,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1462,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1463,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1464,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1465,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1466,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1467,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1468,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1469,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1470,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1471,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1472,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1473,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1474,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1475,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1476,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1477,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1478,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1479,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1480,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1481,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1482,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:43','2013-07-26 21:54:43'),(1483,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1484,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1485,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1486,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1487,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1488,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1489,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1490,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1491,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1492,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1493,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1494,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1495,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1496,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1497,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1498,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1499,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1500,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1501,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1502,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1503,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1504,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1505,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-26 21:54:44'),(1506,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:44','2013-07-31 22:46:51'),(1507,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:46:51'),(1508,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:46:51'),(1509,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:46:51'),(1510,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:46:51'),(1511,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:38:31'),(1512,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:38:31'),(1513,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:38:31'),(1514,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:38:32'),(1515,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:38:32'),(1516,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:38:32'),(1517,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:38:32'),(1518,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:38:32'),(1519,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:45','2013-07-31 22:38:32'),(1520,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-31 22:38:32'),(1521,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-31 22:38:32'),(1522,NULL,0,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-31 22:39:38'),(1523,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-26 21:54:46'),(1524,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-26 21:54:46'),(1525,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-26 21:54:46'),(1526,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-26 21:54:46'),(1527,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-26 21:54:46'),(1528,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-26 21:54:46'),(1529,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-26 21:54:46'),(1530,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-26 21:54:46'),(1531,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-26 21:54:46'),(1532,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-26 21:54:46'),(1533,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-26 21:54:46'),(1534,NULL,1,NULL,'Creado por el movimiento 168','2013-07-26 21:54:46','2013-07-26 21:54:46'),(1535,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1536,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1537,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1538,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1539,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1540,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1541,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1542,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1543,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1544,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1545,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1546,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1547,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1548,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1549,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1550,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1551,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1552,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1553,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1554,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1555,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1556,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1557,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1558,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1559,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1560,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:30','2013-07-26 21:55:30'),(1561,NULL,1,NULL,'Creado por el movimiento 169','2013-07-26 21:55:31','2013-07-26 21:55:31'),(1562,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:55','2013-07-26 21:55:55'),(1563,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:55','2013-07-26 21:55:55'),(1564,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:55','2013-07-26 21:55:55'),(1565,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:55','2013-07-26 21:55:55'),(1566,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:55','2013-07-26 21:55:55'),(1567,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:55','2013-07-26 21:55:55'),(1568,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:55','2013-07-26 21:55:55'),(1569,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:55','2013-07-26 21:55:55'),(1570,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:55','2013-07-26 21:55:55'),(1571,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1572,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1573,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1574,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1575,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1576,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1577,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1578,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1579,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1580,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1581,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1582,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1583,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1584,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1585,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1586,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1587,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1588,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1589,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1590,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1591,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1592,NULL,1,NULL,'Creado por el movimiento 170','2013-07-26 21:55:56','2013-07-26 21:55:56'),(1593,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:37','2013-08-01 00:25:37'),(1594,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:37','2013-08-01 00:25:37'),(1595,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:37','2013-08-01 00:25:37'),(1596,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:37','2013-08-01 00:25:37'),(1597,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:38','2013-08-01 00:25:38'),(1598,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:38','2013-08-01 00:25:38'),(1599,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:38','2013-08-01 00:25:38'),(1600,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:38','2013-08-01 00:25:38'),(1601,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:38','2013-08-01 00:25:38'),(1602,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:38','2013-08-01 00:25:38'),(1603,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:38','2013-08-01 00:25:38'),(1604,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:38','2013-08-01 00:25:38'),(1605,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:38','2013-08-01 00:25:38'),(1606,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:38','2013-08-01 00:25:38'),(1607,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:38','2013-08-01 00:25:38'),(1608,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:39','2013-08-01 00:25:39'),(1609,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:39','2013-08-01 00:25:39'),(1610,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:39','2013-08-01 00:25:39'),(1611,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:39','2013-08-01 00:25:39'),(1612,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:39','2013-08-01 00:25:39'),(1613,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:39','2013-08-01 00:25:39'),(1614,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:39','2013-08-01 00:25:39'),(1615,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:39','2013-08-01 00:25:39'),(1616,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:39','2013-08-01 00:25:39'),(1617,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:39','2013-08-01 00:25:39'),(1618,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:39','2013-08-01 00:25:39'),(1619,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:40','2013-08-01 00:25:40'),(1620,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:40','2013-08-01 00:25:40'),(1621,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:40','2013-08-01 00:25:40'),(1622,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:40','2013-08-01 00:25:40'),(1623,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:40','2013-08-01 00:25:40'),(1624,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:40','2013-08-01 00:25:40'),(1625,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:40','2013-08-01 00:25:40'),(1626,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:40','2013-08-01 00:25:40'),(1627,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:40','2013-08-01 00:25:40'),(1628,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:40','2013-08-01 00:25:40'),(1629,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:40','2013-08-01 00:25:40'),(1630,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:40','2013-08-01 00:25:40'),(1631,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1632,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1633,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1634,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1635,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1636,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1637,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1638,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1639,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1640,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1641,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1642,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1643,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1644,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:41','2013-08-01 00:25:41'),(1645,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:42','2013-08-01 00:25:42'),(1646,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:42','2013-08-01 00:25:42'),(1647,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:42','2013-08-01 00:25:42'),(1648,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:42','2013-08-01 00:25:42'),(1649,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:42','2013-08-01 00:25:42'),(1650,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:42','2013-08-01 00:25:42'),(1651,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:42','2013-08-01 00:25:42'),(1652,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:42','2013-08-01 00:25:42'),(1653,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:42','2013-08-01 00:25:42'),(1654,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:42','2013-08-01 00:25:42'),(1655,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:42','2013-08-01 00:25:42'),(1656,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:42','2013-08-01 00:25:42'),(1657,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:43','2013-08-01 00:25:43'),(1658,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:43','2013-08-01 00:25:43'),(1659,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:43','2013-08-01 00:25:43'),(1660,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:43','2013-08-01 00:25:43'),(1661,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:43','2013-08-01 00:25:43'),(1662,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:43','2013-08-01 00:25:43'),(1663,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:43','2013-08-01 00:25:43'),(1664,NULL,1,NULL,'Creado por el movimiento 187','2013-08-01 00:25:43','2013-08-01 00:25:43'),(1665,NULL,1,NULL,'Creado por el movimiento 188','2013-08-01 00:27:22','2013-08-01 00:27:22'),(1666,NULL,1,NULL,'Creado por el movimiento 188','2013-08-01 00:27:22','2013-08-01 00:27:22'),(1667,NULL,1,NULL,'Creado por el movimiento 188','2013-08-01 00:27:22','2013-08-01 00:27:22'),(1675,NULL,1,NULL,'Creado por el movimiento 189','2013-08-01 03:56:29','2013-08-01 03:56:29'),(1676,NULL,1,NULL,'Creado por el movimiento 189','2013-08-01 03:56:29','2013-08-01 03:56:29'),(1677,NULL,1,NULL,'Creado por el movimiento 189','2013-08-01 03:56:29','2013-08-01 03:56:29'),(1678,NULL,1,NULL,'Creado por el movimiento 189','2013-08-01 03:56:29','2013-08-01 03:56:29');
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movorigens`
--

DROP TABLE IF EXISTS `movorigens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movorigens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_ori` int(11) DEFAULT NULL,
  `est_ori` int(11) DEFAULT NULL,
  `rod_ori` int(11) DEFAULT NULL,
  `movimiento_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_movorigens_on_movimiento_id` (`movimiento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movorigens`
--

LOCK TABLES `movorigens` WRITE;
/*!40000 ALTER TABLE `movorigens` DISABLE KEYS */;
INSERT INTO `movorigens` VALUES (58,1,1,1,NULL,'2013-05-05 21:39:43','2013-05-05 21:39:43'),(59,1,1,1,NULL,'2013-05-05 21:42:44','2013-05-05 21:42:44'),(60,1,1,1,NULL,'2013-05-05 21:43:46','2013-05-05 21:43:46'),(61,1,1,1,NULL,'2013-05-05 21:47:18','2013-05-05 21:47:18'),(62,1,1,1,NULL,'2013-05-05 21:49:00','2013-05-05 21:49:00'),(63,1,1,1,NULL,'2013-05-05 21:50:31','2013-05-05 21:50:31'),(64,1,1,1,NULL,'2013-05-07 12:38:23','2013-05-07 12:38:23'),(65,1,1,1,NULL,'2013-05-07 12:39:29','2013-05-07 12:39:29'),(100,1,1,1,171,'2013-07-26 22:00:33','2013-07-26 22:00:33'),(101,1,1,1,172,'2013-07-26 22:02:00','2013-07-26 22:02:00'),(102,1,1,1,173,'2013-07-26 22:03:14','2013-07-26 22:03:14'),(103,1,1,1,174,'2013-07-26 22:03:38','2013-07-26 22:03:38'),(104,1,1,1,175,'2013-07-26 22:03:59','2013-07-26 22:03:59'),(105,1,1,1,176,'2013-07-26 22:04:19','2013-07-26 22:04:19'),(106,2,1,2,177,'2013-07-26 22:05:03','2013-07-26 22:05:03'),(107,2,1,2,178,'2013-07-26 22:05:32','2013-07-26 22:05:32'),(108,6,1,2,179,'2013-07-26 22:06:10','2013-07-26 22:06:10'),(109,6,1,2,180,'2013-07-26 22:06:35','2013-07-26 22:06:35'),(114,1,2,1,193,'2013-08-01 03:56:29','2013-08-01 03:56:29'),(115,1,2,1,194,'2013-08-01 03:56:29','2013-08-01 03:56:29');
/*!40000 ALTER TABLE `movorigens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_tipos_estados`
--

DROP TABLE IF EXISTS `cat_tipos_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_tipos_estados` (
  `cat_tipo_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  KEY `index_cat_tipos_estados_on_cat_tipo_id_and_estado_id` (`cat_tipo_id`,`estado_id`),
  KEY `index_cat_tipos_estados_on_estado_id_and_cat_tipo_id` (`estado_id`,`cat_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_tipos_estados`
--

LOCK TABLES `cat_tipos_estados` WRITE;
/*!40000 ALTER TABLE `cat_tipos_estados` DISABLE KEYS */;
INSERT INTO `cat_tipos_estados` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,11),(2,6),(2,7),(2,8),(3,1),(3,9),(3,10),(4,12);
/*!40000 ALTER TABLE `cat_tipos_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,' SERVICIO','','2013-04-02 15:32:17','2013-07-27 13:39:45'),(2,'PREÑADA','','2013-04-02 15:32:25','2013-04-02 15:32:25'),(3,'VACIA','','2013-04-02 15:32:31','2013-04-02 15:32:31'),(4,'CRIA AL PIE','','2013-04-02 15:32:40','2013-04-02 15:32:40'),(5,'SECA','','2013-04-02 15:32:49','2013-04-02 15:32:49'),(6,'AL PIE','','2013-04-02 15:32:57','2013-04-02 15:32:57'),(7,'SEÑALADO','','2013-04-02 15:33:03','2013-04-02 15:33:03'),(8,'DESTETADO','','2013-04-02 15:33:09','2013-04-02 15:33:09'),(9,'DESCARTE','','2013-04-13 20:01:27','2013-04-13 20:01:27'),(10,'DESCANSO','','2013-04-13 20:01:29','2013-04-13 20:02:15'),(11,'PREÑADA VENTA','','2013-07-26 21:50:39','2013-07-26 21:50:39'),(12,'RECRIA','','2013-08-01 00:23:19','2013-08-01 00:23:19');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-01 15:59:25
