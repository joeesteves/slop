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
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movorigens`
--

LOCK TABLES `movorigens` WRITE;
/*!40000 ALTER TABLE `movorigens` DISABLE KEYS */;
INSERT INTO `movorigens` VALUES (58,1,1,1,NULL,'2013-05-05 21:39:43','2013-05-05 21:39:43'),(59,1,1,1,NULL,'2013-05-05 21:42:44','2013-05-05 21:42:44'),(60,1,1,1,NULL,'2013-05-05 21:43:46','2013-05-05 21:43:46'),(61,1,1,1,NULL,'2013-05-05 21:47:18','2013-05-05 21:47:18'),(62,1,1,1,NULL,'2013-05-05 21:49:00','2013-05-05 21:49:00'),(63,1,1,1,NULL,'2013-05-05 21:50:31','2013-05-05 21:50:31'),(64,1,1,1,NULL,'2013-05-07 12:38:23','2013-05-07 12:38:23'),(65,1,1,1,NULL,'2013-05-07 12:39:29','2013-05-07 12:39:29'),(100,1,1,1,171,'2013-07-26 22:00:33','2013-07-26 22:00:33'),(101,1,1,1,172,'2013-07-26 22:02:00','2013-07-26 22:02:00'),(102,1,1,1,173,'2013-07-26 22:03:14','2013-07-26 22:03:14'),(103,1,1,1,174,'2013-07-26 22:03:38','2013-07-26 22:03:38'),(104,1,1,1,175,'2013-07-26 22:03:59','2013-07-26 22:03:59'),(105,1,1,1,176,'2013-07-26 22:04:19','2013-07-26 22:04:19'),(106,2,1,2,177,'2013-07-26 22:05:03','2013-07-26 22:05:03'),(107,2,1,2,178,'2013-07-26 22:05:32','2013-07-26 22:05:32'),(108,6,1,2,179,'2013-07-26 22:06:10','2013-07-26 22:06:10'),(109,6,1,2,180,'2013-07-26 22:06:35','2013-07-26 22:06:35'),(114,1,2,1,193,'2013-08-01 03:56:29','2013-08-01 03:56:29'),(115,1,2,1,194,'2013-08-01 03:56:29','2013-08-01 03:56:29'),(118,2,2,1,208,'2013-08-03 22:51:08','2013-08-03 22:51:08'),(119,2,2,1,209,'2013-08-03 22:51:08','2013-08-03 22:51:08'),(120,9,6,1,210,'2013-08-03 22:51:19','2013-08-03 22:51:19'),(121,9,7,1,211,'2013-08-03 22:51:25','2013-08-03 22:51:25'),(122,1,1,1,213,'2013-08-03 22:58:47','2013-08-03 22:58:47'),(123,1,1,1,214,'2013-08-03 22:58:55','2013-08-03 22:58:55'),(124,1,2,1,215,'2013-08-03 22:59:13','2013-08-03 22:59:13'),(125,1,2,1,216,'2013-08-03 22:59:13','2013-08-03 22:59:13'),(126,9,6,1,217,'2013-08-03 22:59:26','2013-08-03 22:59:26'),(127,1,1,2,220,'2013-08-06 17:00:20','2013-08-06 17:00:20'),(128,1,1,2,221,'2013-08-06 17:00:28','2013-08-06 17:00:28'),(129,1,1,1,222,'2013-08-09 18:56:17','2013-08-09 18:56:17'),(130,7,1,1,230,'2013-08-17 00:46:29','2013-08-17 00:46:29'),(131,5,1,1,231,'2013-08-17 00:47:19','2013-08-17 00:47:19'),(134,6,1,1,235,'2013-08-17 00:51:52','2013-08-17 00:51:52'),(135,6,1,1,236,'2013-08-17 00:53:06','2013-08-17 00:53:06'),(136,6,2,1,238,'2013-08-17 00:54:00','2013-08-17 00:54:00'),(137,6,2,1,239,'2013-08-17 00:54:00','2013-08-17 00:54:00'),(138,6,4,1,240,'2013-08-17 00:55:03','2013-08-17 00:55:03'),(139,6,2,1,241,'2013-08-17 00:56:13','2013-08-17 00:56:13'),(140,9,6,1,242,'2013-08-17 00:57:24','2013-08-17 00:57:24'),(141,6,4,1,245,'2013-08-17 01:00:27','2013-08-17 01:00:27'),(142,6,3,1,246,'2013-08-17 01:00:40','2013-08-17 01:00:40'),(143,7,10,1,247,'2013-08-17 01:02:23','2013-08-17 01:02:23'),(144,2,1,1,248,'2013-08-17 01:02:54','2013-08-17 01:02:54'),(145,2,1,1,249,'2013-08-17 01:03:08','2013-08-17 01:03:08'),(146,2,2,1,251,'2013-08-17 01:05:01','2013-08-17 01:05:01'),(147,2,2,1,252,'2013-08-17 01:05:01','2013-08-17 01:05:01'),(148,9,6,1,253,'2013-08-17 01:08:18','2013-08-17 01:08:18'),(150,9,6,1,255,'2013-08-17 01:09:10','2013-08-17 01:09:10'),(151,2,4,1,256,'2013-08-17 01:09:45','2013-08-17 01:09:45'),(152,1,2,1,258,'2013-08-21 21:24:15','2013-08-21 21:24:15'),(153,1,2,1,259,'2013-08-21 21:24:15','2013-08-21 21:24:15'),(154,2,2,2,260,'2013-08-21 21:25:53','2013-08-21 21:25:53'),(155,2,2,2,261,'2013-08-21 21:25:53','2013-08-21 21:25:53');
/*!40000 ALTER TABLE `movorigens` ENABLE KEYS */;
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
