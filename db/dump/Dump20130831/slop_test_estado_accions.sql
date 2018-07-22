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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-31 11:57:25
