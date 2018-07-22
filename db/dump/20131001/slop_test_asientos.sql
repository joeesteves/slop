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
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asientos`
--

LOCK TABLES `asientos` WRITE;
/*!40000 ALTER TABLE `asientos` DISABLE KEYS */;
INSERT INTO `asientos` VALUES (690,'2013-09-27',NULL,1500.00,238,134,NULL,'2013-09-27 18:35:17','2013-09-27 18:35:17','CUOTA: 1 (Porbando cierre\r\n)',5),(691,'2013-10-27',NULL,1500.00,238,134,NULL,'2013-09-27 18:35:17','2013-09-27 18:35:17','CUOTA: 2 (Porbando cierre\r\n)',5),(692,'2013-09-27',3000.00,NULL,250,134,NULL,'2013-09-27 18:35:17','2013-09-27 18:35:17','TRANSACCIÓN: 134 (Porbando cierre\r\n)',5),(693,'2013-09-27',NULL,1500.00,237,135,NULL,'2013-09-27 18:35:45','2013-09-27 18:35:45','CUOTA: 1 (dsadasd)',5),(694,'2013-09-27',1500.00,NULL,238,135,NULL,'2013-09-27 18:35:45','2013-09-27 18:35:45','TRANSACCIÓN: 135 (dsadasd)',5),(695,'2013-09-27',NULL,750.00,236,136,NULL,'2013-09-27 18:40:51','2013-09-27 18:40:51','CUOTA: 1 (dsadasda)',5),(696,'2013-10-27',NULL,750.00,236,136,NULL,'2013-09-27 18:40:51','2013-09-27 18:40:51','CUOTA: 2 (dsadasda)',5),(697,'2013-09-27',1500.00,NULL,237,136,NULL,'2013-09-27 18:40:51','2013-09-27 18:40:51','TRANSACCIÓN: 136 (dsadasda)',5),(698,'2013-09-27',NULL,500.00,237,137,NULL,'2013-09-27 18:41:30','2013-09-27 18:41:30','CUOTA: 1 (kjkjkjh)',5),(699,'2013-10-27',NULL,500.00,237,137,NULL,'2013-09-27 18:41:30','2013-09-27 18:41:30','CUOTA: 2 (kjkjkjh)',5),(700,'2013-11-27',NULL,500.00,237,137,NULL,'2013-09-27 18:41:30','2013-09-27 18:41:30','CUOTA: 3 (kjkjkjh)',5),(701,'2013-09-27',1500.00,NULL,238,137,NULL,'2013-09-27 18:41:30','2013-09-27 18:41:30','TRANSACCIÓN: 137 (kjkjkjh)',5),(702,'2013-09-27',NULL,250.00,233,138,NULL,'2013-09-27 19:08:12','2013-09-27 19:08:12','CUOTA: 1 (Probando)',5),(703,'2013-10-27',NULL,250.00,233,138,NULL,'2013-09-27 19:08:12','2013-09-27 19:08:12','CUOTA: 2 (Probando)',5),(704,'2013-11-27',NULL,250.00,233,138,NULL,'2013-09-27 19:08:12','2013-09-27 19:08:12','CUOTA: 3 (Probando)',5),(705,'2013-12-27',NULL,250.00,233,138,NULL,'2013-09-27 19:08:12','2013-09-27 19:08:12','CUOTA: 4 (Probando)',5),(706,'2013-09-27',1000.00,NULL,251,138,NULL,'2013-09-27 19:08:13','2013-09-27 19:08:13','TRANSACCIÓN: 138 (Probando)',5),(713,'2013-09-27',NULL,62.50,237,139,NULL,'2013-09-27 19:09:10','2013-09-27 19:09:10','CUOTA: 1 (prbandoooo)',5),(714,'2013-10-27',NULL,62.50,237,139,NULL,'2013-09-27 19:09:10','2013-09-27 19:09:10','CUOTA: 2 (prbandoooo)',5),(715,'2013-11-27',NULL,62.50,237,139,NULL,'2013-09-27 19:09:10','2013-09-27 19:09:10','CUOTA: 3 (prbandoooo)',5),(716,'2013-12-27',NULL,62.50,237,139,NULL,'2013-09-27 19:09:10','2013-09-27 19:09:10','CUOTA: 4 (prbandoooo)',5),(717,'2013-09-27',250.00,NULL,233,139,NULL,'2013-09-27 19:09:11','2013-09-27 19:09:11','TRANSACCIÓN: 139 (prbandoooo)',5),(718,'2013-09-27',1000.00,NULL,233,140,NULL,'2013-09-27 21:36:05','2013-09-27 21:36:05','TRANSACCIÓN: 140 (adelanto de tarjeta)',5),(719,'2013-09-27',NULL,1000.00,214,140,NULL,'2013-09-27 21:36:05','2013-09-27 21:36:05','TRANSACCIÓN: 140 (adelanto de tarjeta)',5),(720,'2013-09-27',NULL,100.00,234,141,NULL,'2013-09-27 22:53:33','2013-09-27 22:53:33','CUOTA: 1 (Cuotas del super)',5),(721,'2013-10-27',NULL,100.00,234,141,NULL,'2013-09-27 22:53:33','2013-09-27 22:53:33','CUOTA: 2 (Cuotas del super)',5),(722,'2013-11-27',NULL,100.00,234,141,NULL,'2013-09-27 22:53:33','2013-09-27 22:53:33','CUOTA: 3 (Cuotas del super)',5),(723,'2013-12-27',NULL,100.00,234,141,NULL,'2013-09-27 22:53:33','2013-09-27 22:53:33','CUOTA: 4 (Cuotas del super)',5),(724,'2014-01-27',NULL,100.00,234,141,NULL,'2013-09-27 22:53:33','2013-09-27 22:53:33','CUOTA: 5 (Cuotas del super)',5),(725,'2013-09-27',500.00,NULL,251,141,NULL,'2013-09-27 22:53:33','2013-09-27 22:53:33','TRANSACCIÓN: 141 (Cuotas del super)',5),(726,'2013-09-27',300.00,NULL,234,142,NULL,'2013-09-27 22:53:53','2013-09-27 22:53:53','TRANSACCIÓN: 142 (adelanto de tarjeta)',5),(727,'2013-09-27',NULL,300.00,214,142,NULL,'2013-09-27 22:53:53','2013-09-27 22:53:53','TRANSACCIÓN: 142 (adelanto de tarjeta)',5),(728,'2013-09-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:32','2013-09-27 23:04:32','CUOTA: 1 (jejejej)',5),(729,'2013-10-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:32','2013-09-27 23:04:32','CUOTA: 2 (jejejej)',5),(730,'2013-11-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 3 (jejejej)',5),(731,'2013-12-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 4 (jejejej)',5),(732,'2014-01-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 5 (jejejej)',5),(733,'2014-02-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 6 (jejejej)',5),(734,'2014-03-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 7 (jejejej)',5),(735,'2014-04-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 8 (jejejej)',5),(736,'2014-05-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 9 (jejejej)',5),(737,'2014-06-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 10 (jejejej)',5),(738,'2014-07-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 11 (jejejej)',5),(739,'2014-08-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 12 (jejejej)',5),(740,'2014-09-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 13 (jejejej)',5),(741,'2014-10-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 14 (jejejej)',5),(742,'2014-11-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:33','2013-09-27 23:04:33','CUOTA: 15 (jejejej)',5),(743,'2014-12-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:34','2013-09-27 23:04:34','CUOTA: 16 (jejejej)',5),(744,'2015-01-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:34','2013-09-27 23:04:34','CUOTA: 17 (jejejej)',5),(745,'2015-02-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:34','2013-09-27 23:04:34','CUOTA: 18 (jejejej)',5),(746,'2015-03-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:34','2013-09-27 23:04:34','CUOTA: 19 (jejejej)',5),(747,'2015-04-27',NULL,37.50,233,143,NULL,'2013-09-27 23:04:34','2013-09-27 23:04:34','CUOTA: 20 (jejejej)',5),(748,'2013-09-27',750.00,NULL,251,143,NULL,'2013-09-27 23:04:34','2013-09-27 23:04:34','TRANSACCIÓN: 143 (jejejej)',5),(749,'2013-09-27',400.00,NULL,233,144,NULL,'2013-09-27 23:34:14','2013-09-27 23:34:14','TRANSACCIÓN: 144 (cargar saldo)',5),(750,'2013-09-27',NULL,400.00,214,144,NULL,'2013-09-27 23:34:14','2013-09-27 23:34:14','TRANSACCIÓN: 144 (cargar saldo)',5),(751,'2013-10-15',1899.99,NULL,251,145,NULL,'2013-09-29 15:59:33','2013-09-29 15:59:33','TRANSACCIÓN: 145 (weqwe)',5),(752,'2013-10-15',NULL,1899.99,217,145,NULL,'2013-09-29 15:59:33','2013-09-29 15:59:33','TRANSACCIÓN: 145 (weqwe)',5),(753,'2013-09-30',15.00,NULL,250,146,NULL,'2013-09-29 16:59:06','2013-09-29 16:59:06','TRANSACCIÓN: 146 (dasdas)',5),(754,'2013-09-30',NULL,15.00,214,146,NULL,'2013-09-29 16:59:06','2013-09-29 16:59:06','TRANSACCIÓN: 146 (dasdas)',5),(755,'2013-09-29',NULL,3100.00,29,147,NULL,'2013-09-29 17:43:40','2013-09-29 17:43:40','CUOTA: 1 (alq)',6),(756,'2013-09-29',3100.00,NULL,41,147,NULL,'2013-09-29 17:43:40','2013-09-29 17:43:40','RESULTADO X CUOTA: 1 (alq)',6),(757,'2013-10-29',NULL,3100.00,29,147,NULL,'2013-09-29 17:43:40','2013-09-29 17:43:40','CUOTA: 2 (alq)',6),(758,'2013-10-29',3100.00,NULL,41,147,NULL,'2013-09-29 17:43:40','2013-09-29 17:43:40','RESULTADO X CUOTA: 2 (alq)',6),(759,'2013-11-29',NULL,3100.00,29,147,NULL,'2013-09-29 17:43:40','2013-09-29 17:43:40','CUOTA: 3 (alq)',6),(760,'2013-11-29',3100.00,NULL,41,147,NULL,'2013-09-29 17:43:41','2013-09-29 17:43:41','RESULTADO X CUOTA: 3 (alq)',6),(761,'2013-09-29',NULL,3100.00,24,148,NULL,'2013-09-29 17:44:33','2013-09-29 17:44:33','CUOTA: 1 (eddq)',6),(762,'2013-09-29',3100.00,NULL,29,148,NULL,'2013-09-29 17:44:33','2013-09-29 17:44:33','TRANSACCIÓN: 148 (eddq)',6);
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

-- Dump completed on 2013-10-02 17:22:01
