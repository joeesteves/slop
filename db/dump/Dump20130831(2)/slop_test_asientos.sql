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
-- Table structure for table `asientos`
--

DROP TABLE IF EXISTS `asientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `debe` decimal(8,2) DEFAULT NULL,
  `haber` decimal(8,2) DEFAULT NULL,
  `cuenta_id` int(11) DEFAULT NULL,
  `transaccion_id` int(11) DEFAULT NULL,
  `cuota_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_asientos_on_transaccion_id` (`transaccion_id`),
  KEY `index_asientos_on_cuota_id` (`cuota_id`)
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asientos`
--

LOCK TABLES `asientos` WRITE;
/*!40000 ALTER TABLE `asientos` DISABLE KEYS */;
INSERT INTO `asientos` VALUES (33,'2013-08-17',25.00,NULL,4,41,52,'2013-08-17 02:13:17','2013-08-17 02:16:58',NULL),(34,'2013-08-17',25.00,NULL,4,41,53,'2013-08-17 02:13:17','2013-08-17 02:16:58',NULL),(35,'2013-08-17',NULL,100.00,5,41,NULL,'2013-08-17 02:13:17','2013-08-17 02:13:17',NULL),(36,'2013-08-17',6.00,NULL,4,42,55,'2013-08-17 02:17:17','2013-08-17 02:17:23',NULL),(37,'2013-08-17',NULL,12.00,4,42,NULL,'2013-08-17 02:17:17','2013-08-17 02:17:17',NULL),(38,'2013-08-17',4.00,NULL,5,43,57,'2013-08-17 02:21:50','2013-08-17 02:22:10',NULL),(39,'2013-08-17',4.00,NULL,5,43,58,'2013-08-17 02:21:50','2013-08-17 02:22:11',NULL),(40,'2013-08-17',NULL,12.00,12,43,NULL,'2013-08-17 02:21:51','2013-08-17 02:21:51',NULL),(41,'2013-08-17',4.00,NULL,5,43,59,'2013-08-17 02:22:10','2013-08-17 02:22:10',NULL),(42,'2013-09-17',4.00,NULL,5,43,60,'2013-08-17 02:22:11','2013-08-17 02:22:11',NULL),(43,'2013-08-17',12.00,NULL,4,44,61,'2013-08-17 02:28:15','2013-08-17 02:31:44',NULL),(44,'2013-08-17',NULL,12.00,4,44,NULL,'2013-08-17 02:28:15','2013-08-17 02:28:15',NULL),(45,'2013-08-17',2.00,NULL,4,45,63,'2013-08-17 02:33:20','2013-08-17 02:33:27',NULL),(46,'2013-08-17',2.00,NULL,4,45,64,'2013-08-17 02:33:20','2013-08-17 02:33:27',NULL),(47,'2013-08-17',NULL,14.00,4,45,NULL,'2013-08-17 02:33:20','2013-08-17 02:33:20',NULL),(48,'2013-08-17',5.00,NULL,4,46,66,'2013-08-17 02:34:21','2013-08-17 02:36:06',NULL),(49,'2013-08-17',5.00,NULL,4,46,67,'2013-08-17 02:34:21','2013-08-17 02:36:06',NULL),(50,'2013-08-17',5.00,NULL,4,46,68,'2013-08-17 02:34:21','2013-08-17 02:36:07',NULL),(51,'2013-08-17',5.00,NULL,4,46,69,'2013-08-17 02:34:21','2013-08-17 02:36:07',NULL),(52,'2013-08-17',NULL,20.00,4,46,NULL,'2013-08-17 02:34:21','2013-08-17 02:34:21',NULL),(53,'2013-08-17',5.00,NULL,4,46,70,'2013-08-17 02:34:30','2013-08-17 02:36:07',NULL),(54,'2013-08-17',5.00,NULL,4,47,71,'2013-08-17 02:38:27','2013-08-17 02:38:27',NULL),(55,'2013-09-17',5.00,NULL,4,47,72,'2013-08-17 02:38:27','2013-08-17 02:38:27',NULL),(56,'2013-08-17',NULL,10.00,4,47,NULL,'2013-08-17 02:38:27','2013-08-17 02:38:27',NULL),(57,'2013-08-17',6.00,NULL,4,48,73,'2013-08-17 02:40:02','2013-08-17 02:40:02',NULL),(58,'2013-09-17',6.00,NULL,4,48,74,'2013-08-17 02:40:02','2013-08-17 02:40:02',NULL),(59,'2013-08-17',NULL,12.00,4,48,NULL,'2013-08-17 02:40:02','2013-08-17 02:40:02',NULL),(60,'2013-08-17',5.00,NULL,4,49,75,'2013-08-17 02:41:16','2013-08-17 02:41:16',NULL),(61,'2013-09-17',5.00,NULL,4,49,76,'2013-08-17 02:41:16','2013-08-17 02:41:16',NULL),(62,'2013-10-17',5.00,NULL,4,49,77,'2013-08-17 02:41:16','2013-08-17 02:41:16',NULL),(63,'2013-08-17',NULL,15.00,4,49,NULL,'2013-08-17 02:41:16','2013-08-17 02:41:16',NULL),(64,'2013-08-17',5.00,NULL,4,50,78,'2013-08-17 02:45:23','2013-08-17 02:46:07',NULL),(66,'2013-08-17',NULL,5.00,4,50,NULL,'2013-08-17 02:45:24','2013-08-17 02:45:24',NULL),(67,'2013-08-17',2.00,NULL,4,51,80,'2013-08-17 02:46:34','2013-08-17 02:46:40',NULL),(69,'2013-08-17',NULL,2.00,4,51,NULL,'2013-08-17 02:46:34','2013-08-17 02:46:34',NULL),(70,'2013-01-01',10.00,NULL,4,52,81,'2013-08-22 15:07:25','2013-08-22 15:07:25',NULL),(71,'2013-01-01',NULL,10.00,4,52,NULL,'2013-08-22 15:07:25','2013-08-22 15:07:25',NULL),(72,'2013-09-02',99.50,NULL,4,54,82,'2013-08-25 18:54:56','2013-08-25 18:54:56',NULL),(73,'2013-10-02',99.50,NULL,4,54,83,'2013-08-25 18:54:57','2013-08-25 18:54:57',NULL),(74,'2013-09-02',NULL,199.00,4,54,NULL,'2013-08-25 18:54:57','2013-08-25 18:54:57',NULL),(75,'2013-01-01',144000.00,NULL,8,55,84,'2013-08-30 20:08:40','2013-08-30 20:11:51',NULL),(76,'2013-01-01',144000.00,NULL,8,55,85,'2013-08-30 20:08:40','2013-08-30 20:11:51',NULL),(77,'2013-01-01',144000.00,NULL,8,55,86,'2013-08-30 20:08:40','2013-08-30 20:11:51',NULL),(78,'2013-01-01',144000.00,NULL,8,55,87,'2013-08-30 20:08:40','2013-08-30 20:11:51',NULL),(79,'2013-01-01',144000.00,NULL,8,55,88,'2013-08-30 20:08:40','2013-08-30 20:11:51',NULL),(80,'2013-01-01',144000.00,NULL,8,55,89,'2013-08-30 20:08:40','2013-08-30 20:11:52',NULL),(81,'2013-01-01',144000.00,NULL,8,55,90,'2013-08-30 20:08:40','2013-08-30 20:11:52',NULL),(82,'2013-01-01',144000.00,NULL,8,55,91,'2013-08-30 20:08:40','2013-08-30 20:11:52',NULL),(83,'2013-01-01',144000.00,NULL,8,55,92,'2013-08-30 20:08:40','2013-08-30 20:11:52',NULL),(84,'2013-01-01',144000.00,NULL,8,55,93,'2013-08-30 20:08:40','2013-08-30 20:11:52',NULL),(85,'2013-01-01',144000.00,NULL,8,55,94,'2013-08-30 20:08:40','2013-08-30 20:11:52',NULL),(86,'2013-01-01',144000.00,NULL,8,55,95,'2013-08-30 20:08:40','2013-08-30 20:11:52',NULL),(87,'2013-01-01',NULL,144000.00,33,55,NULL,'2013-08-30 20:08:40','2013-08-30 20:11:51',NULL),(88,'2014-01-01',1250.00,NULL,9,56,96,'2013-08-30 20:19:54','2013-08-30 20:20:55',NULL),(89,'2014-01-01',1250.00,NULL,9,56,97,'2013-08-30 20:19:54','2013-08-30 20:20:55',NULL),(90,'2014-01-01',1250.00,NULL,9,56,98,'2013-08-30 20:19:54','2013-08-30 20:20:55',NULL),(93,'2014-01-01',NULL,5000.00,33,56,NULL,'2013-08-30 20:19:54','2013-08-30 20:19:54',NULL),(175,'2015-01-01',300.00,NULL,29,58,175,'2013-08-31 13:49:58','2013-08-31 13:49:58',NULL),(176,'2015-02-01',300.00,NULL,29,58,176,'2013-08-31 13:49:58','2013-08-31 13:49:58',NULL),(177,'2015-03-01',300.00,NULL,29,58,177,'2013-08-31 13:49:58','2013-08-31 13:49:58',NULL),(178,'2015-04-01',300.00,NULL,29,58,178,'2013-08-31 13:49:58','2013-08-31 13:49:58',NULL),(179,'2015-05-01',300.00,NULL,29,58,179,'2013-08-31 13:49:58','2013-08-31 13:49:58',NULL),(180,'2015-06-01',300.00,NULL,29,58,180,'2013-08-31 13:49:59','2013-08-31 13:49:59',NULL),(181,'2015-07-01',300.00,NULL,29,58,181,'2013-08-31 13:49:59','2013-08-31 13:49:59',NULL),(182,'2015-08-01',300.00,NULL,29,58,182,'2013-08-31 13:49:59','2013-08-31 13:49:59',NULL),(183,'2015-09-01',300.00,NULL,29,58,183,'2013-08-31 13:49:59','2013-08-31 13:49:59',NULL),(184,'2015-10-01',300.00,NULL,29,58,184,'2013-08-31 13:49:59','2013-08-31 13:49:59',NULL),(185,'2015-11-01',300.00,NULL,29,58,185,'2013-08-31 13:49:59','2013-08-31 13:49:59',NULL),(186,'2015-12-01',300.00,NULL,29,58,186,'2013-08-31 13:49:59','2013-08-31 13:49:59',NULL),(187,'2015-01-01',NULL,3600.00,43,58,NULL,'2013-08-31 13:49:59','2013-08-31 13:49:59',NULL),(188,'0016-01-11',12000.00,NULL,4,59,NULL,'2013-08-31 14:16:07','2013-08-31 14:16:07','HOLA'),(228,'0016-01-11',12000.00,NULL,4,60,NULL,'2013-08-31 14:24:32','2013-08-31 14:24:32','HOLA'),(229,'0016-01-11',NULL,NULL,4,60,235,'2013-08-31 14:24:33','2013-08-31 14:24:33','CUOTA: 1(HOLA)'),(230,'0016-02-11',NULL,NULL,4,60,236,'2013-08-31 14:24:33','2013-08-31 14:24:33','CUOTA: 2(HOLA)'),(231,'0016-03-11',NULL,NULL,4,60,237,'2013-08-31 14:24:33','2013-08-31 14:24:33','CUOTA: 3(HOLA)'),(232,'0016-04-11',NULL,NULL,4,60,238,'2013-08-31 14:24:33','2013-08-31 14:24:33','CUOTA: 4(HOLA)'),(233,'0016-05-11',NULL,NULL,4,60,239,'2013-08-31 14:24:33','2013-08-31 14:24:33','CUOTA: 5(HOLA)'),(234,'0016-06-11',NULL,NULL,4,60,240,'2013-08-31 14:24:33','2013-08-31 14:24:33','CUOTA: 6(HOLA)'),(235,'0016-07-11',NULL,NULL,4,60,241,'2013-08-31 14:24:33','2013-08-31 14:24:33','CUOTA: 7(HOLA)'),(236,'0016-08-11',NULL,NULL,4,60,242,'2013-08-31 14:24:33','2013-08-31 14:24:33','CUOTA: 8(HOLA)'),(237,'0016-09-11',NULL,NULL,4,60,243,'2013-08-31 14:24:33','2013-08-31 14:24:33','CUOTA: 9(HOLA)'),(238,'0016-10-11',NULL,NULL,4,60,244,'2013-08-31 14:24:33','2013-08-31 14:24:33','CUOTA: 10(HOLA)'),(239,'0016-11-11',NULL,NULL,4,60,245,'2013-08-31 14:24:33','2013-08-31 14:24:33','CUOTA: 11(HOLA)'),(240,'0016-12-11',NULL,NULL,4,60,246,'2013-08-31 14:24:33','2013-08-31 14:24:33','CUOTA: 12(HOLA)'),(278,'2017-01-01',1200.00,NULL,4,61,NULL,'2013-08-31 14:52:38','2013-08-31 14:52:38','sarlabga'),(279,'2017-01-01',NULL,109.00,4,61,281,'2013-08-31 14:52:38','2013-08-31 14:52:38','CUOTA: 1 (sarlabga)'),(280,'2017-02-01',NULL,109.00,4,61,282,'2013-08-31 14:52:38','2013-08-31 14:52:38','CUOTA: 2 (sarlabga)'),(281,'2017-03-01',NULL,109.00,4,61,283,'2013-08-31 14:52:38','2013-08-31 14:52:38','CUOTA: 3 (sarlabga)'),(282,'2017-04-01',NULL,109.00,4,61,284,'2013-08-31 14:52:38','2013-08-31 14:52:38','CUOTA: 4 (sarlabga)'),(283,'2017-05-01',NULL,109.00,4,61,285,'2013-08-31 14:52:38','2013-08-31 14:52:38','CUOTA: 5 (sarlabga)'),(284,'2017-06-01',NULL,109.00,4,61,286,'2013-08-31 14:52:38','2013-08-31 14:52:38','CUOTA: 6 (sarlabga)'),(285,'2017-07-01',NULL,109.00,4,61,287,'2013-08-31 14:52:38','2013-08-31 14:52:38','CUOTA: 7 (sarlabga)'),(286,'2017-08-01',NULL,109.00,4,61,288,'2013-08-31 14:52:38','2013-08-31 14:52:38','CUOTA: 8 (sarlabga)'),(287,'2017-09-01',NULL,109.00,4,61,289,'2013-08-31 14:52:38','2013-08-31 14:52:38','CUOTA: 9 (sarlabga)'),(288,'2017-10-01',NULL,109.00,4,61,290,'2013-08-31 14:52:38','2013-08-31 14:52:38','CUOTA: 10 (sarlabga)'),(289,'2017-11-01',NULL,109.00,4,61,291,'2013-08-31 14:52:38','2013-08-31 14:52:38','CUOTA: 11 (sarlabga)');
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

-- Dump completed on 2013-08-31 11:59:37
