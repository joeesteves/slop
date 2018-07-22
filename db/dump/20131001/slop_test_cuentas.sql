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
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cierre` int(11) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cuentas_on_empresa_id` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (1,'1','ACTIVO',0,NULL,NULL,NULL,6),(2,'1.1','ACTIVO CORRIENTE',0,NULL,NULL,NULL,6),(3,'1.1.1','CAJA',0,NULL,NULL,NULL,6),(5,'1.1.1.1','CAJA GENERAL $',1,NULL,NULL,NULL,6),(6,'1.1.2','BANCOS',0,NULL,NULL,NULL,6),(7,'1.1.2.3','GALICIA CA',1,NULL,NULL,NULL,6),(8,'1.1.2.2','BBVA CA',1,NULL,NULL,NULL,6),(9,'1.1.2.1','BBVA CTA CTE',1,NULL,NULL,NULL,6),(10,'1.1.2.4','PROV CA',1,NULL,NULL,NULL,6),(11,'1.1.3','CREDITOS',0,NULL,NULL,NULL,6),(12,'1.1.3.1','POR COBRAR',2,NULL,NULL,NULL,6),(13,'1.1.4','AHORROS',0,NULL,NULL,NULL,6),(14,'1.1.4.1','CAJA GRIS $',1,NULL,NULL,NULL,6),(15,'1.1.4.2','CAJA GRIS U$S',1,NULL,NULL,NULL,6),(16,'1.1.4.3','CAJA GRIS UY',1,NULL,NULL,NULL,6),(17,'1.1.4.4','CAJA GRIS REAIS',1,NULL,NULL,NULL,6),(18,'1.2','ACTIVO NO CORRIENTE',0,NULL,NULL,NULL,6),(19,'1.2.1','BIENES DE USO',0,NULL,NULL,NULL,6),(20,'1.2.1.1','RODADOS',4,NULL,'2013-09-11 23:46:48',NULL,6),(21,'2','PASIVO',0,NULL,NULL,NULL,6),(22,'2.1','PASIVO CORRIENTE',0,NULL,NULL,NULL,6),(23,'2.1.2','DEUDAS',0,NULL,NULL,NULL,6),(24,'2.1.2.1','BBVA VISA',3,NULL,'2013-09-15 23:23:59',25,6),(25,'2.1.2.2','BBVA MASTER',3,NULL,'2013-09-11 23:45:46',NULL,6),(26,'2.1.2.3','GALICIA VISA',3,NULL,'2013-09-11 23:45:58',NULL,6),(27,'2.1.2.4','PROV VISA',3,NULL,'2013-09-11 23:46:08',NULL,6),(28,'2.1.2.5','HSBC VISA',3,NULL,'2013-09-11 23:46:19',NULL,6),(29,'2.1.2.5','SERVICIOS A PAGAR',3,NULL,'2013-09-11 23:46:28',NULL,6),(30,'3','PATRIMONIO',0,NULL,NULL,NULL,6),(31,'3.1.0.1','CAPITAL',5,NULL,'2013-09-12 01:00:08',NULL,6),(32,'4','INGRESOS',0,NULL,NULL,NULL,6),(33,'4.1.1.1','SUELDO JOSE',6,NULL,'2013-09-11 23:49:06',NULL,6),(34,'4.1.1.2','SUELDO FLO',6,NULL,'2013-09-11 23:49:22',NULL,6),(35,'4.1.1.3','VET',6,NULL,'2013-09-11 23:49:33',NULL,6),(36,'4.1.1.4','SLOP',6,NULL,'2013-09-11 23:49:45',NULL,6),(37,'4.1.1.5','BENDITO CAMINO',6,NULL,'2013-09-11 23:49:59',NULL,6),(38,'4.1.1.6','REGALOS',6,NULL,'2013-09-11 23:50:08',NULL,6),(39,'5','EGRESOS',0,NULL,NULL,NULL,6),(40,'5.1','CASA',0,NULL,NULL,NULL,6),(41,'5.1.1.1','ALQUILER',7,NULL,NULL,NULL,6),(42,'5.1.1.2','SUPERMERCADO',7,NULL,NULL,NULL,6),(43,'5.1.1.3','SERVICIOS',7,NULL,NULL,NULL,6),(44,'5.2','AUTO',0,NULL,NULL,NULL,6),(45,'5.2.1.1','AUTO',7,NULL,'2013-09-11 23:47:32',NULL,6),(46,'5.3','GENERALES',0,NULL,NULL,NULL,6),(47,'5.3.1.1','VIAJES',7,NULL,NULL,NULL,6),(48,'5.3.1.2','REGALOS',7,NULL,NULL,NULL,6),(49,'5.3.1.3','GENERALES',7,NULL,NULL,NULL,6),(50,'5.3.1.5','ALMUERZOS',7,NULL,NULL,NULL,6),(51,'5.3.1.6','EDUCACION',7,NULL,NULL,NULL,6),(52,'5.3.1.7','EXTRA ORDINARIOS',7,NULL,NULL,NULL,6),(53,'5.3.1.8','ENTRETENIMIENTO',7,NULL,NULL,NULL,6),(54,'2.1.2.6','BBVA VISA A PAGAR',3,'2013-09-14 18:15:27','2013-09-14 19:37:08',NULL,6),(55,'1','ACTIVO',0,'2013-09-22 23:21:24','2013-09-22 23:21:24',NULL,2),(56,'1.1','ACTIVO CORRIENTE',0,'2013-09-22 23:21:24','2013-09-22 23:21:24',NULL,2),(57,'1.1.1','CAJA',0,'2013-09-22 23:21:24','2013-09-22 23:21:24',NULL,2),(58,'1.1.1.1','CAJA GENERAL $',1,'2013-09-22 23:21:24','2013-09-22 23:21:24',NULL,2),(59,'1.1.2','BANCOS',0,'2013-09-22 23:21:24','2013-09-22 23:21:24',NULL,2),(60,'1.1.2.3','GALICIA CA',1,'2013-09-22 23:21:24','2013-09-22 23:21:24',NULL,2),(61,'1.1.2.2','BBVA CA',1,'2013-09-22 23:21:24','2013-09-22 23:21:24',NULL,2),(62,'1.1.2.1','BBVA CTA CTE',1,'2013-09-22 23:21:25','2013-09-22 23:21:25',NULL,2),(63,'1.1.2.4','PROV CA',1,'2013-09-22 23:21:25','2013-09-22 23:21:25',NULL,2),(64,'1.1.3','CREDITOS',0,'2013-09-22 23:21:25','2013-09-22 23:21:25',NULL,2),(65,'1.1.3.1','POR COBRAR',2,'2013-09-22 23:21:25','2013-09-22 23:21:25',NULL,2),(66,'1.1.4','AHORROS',0,'2013-09-22 23:21:25','2013-09-22 23:21:25',NULL,2),(67,'1.1.4.1','CAJA GRIS $',1,'2013-09-22 23:21:25','2013-09-22 23:21:25',NULL,2),(68,'1.1.4.2','CAJA GRIS U$S',1,'2013-09-22 23:21:25','2013-09-22 23:21:25',NULL,2),(69,'1.1.4.3','CAJA GRIS UY',1,'2013-09-22 23:21:25','2013-09-22 23:21:25',NULL,2),(70,'1.1.4.4','CAJA GRIS REAIS',1,'2013-09-22 23:21:25','2013-09-22 23:21:25',NULL,2),(71,'1.2','ACTIVO NO CORRIENTE',0,'2013-09-22 23:21:25','2013-09-22 23:21:25',NULL,2),(72,'1.2.1','BIENES DE USO',0,'2013-09-22 23:21:25','2013-09-22 23:21:25',NULL,2),(73,'1.2.1.1','RODADOS',4,'2013-09-22 23:21:25','2013-09-22 23:21:25',NULL,2),(74,'2','PASIVO',0,'2013-09-22 23:21:26','2013-09-22 23:21:26',NULL,2),(75,'2.1','PASIVO CORRIENTE',0,'2013-09-22 23:21:26','2013-09-22 23:21:26',NULL,2),(76,'2.1.2','DEUDAS',0,'2013-09-22 23:21:26','2013-09-22 23:21:26',NULL,2),(77,'2.1.2.1','BBVA VISA',3,'2013-09-22 23:21:26','2013-09-22 23:21:26',NULL,2),(78,'2.1.2.2','BBVA MASTER',3,'2013-09-22 23:21:26','2013-09-22 23:21:26',NULL,2),(79,'2.1.2.3','GALICIA VISA',3,'2013-09-22 23:21:26','2013-09-22 23:21:26',NULL,2),(80,'2.1.2.4','PROV VISA',3,'2013-09-22 23:21:26','2013-09-22 23:21:26',NULL,2),(81,'2.1.2.5','HSBC VISA',3,'2013-09-22 23:21:26','2013-09-22 23:21:26',NULL,2),(82,'2.1.2.5','SERVICIOS A PAGAR',3,'2013-09-22 23:21:26','2013-09-22 23:21:26',NULL,2),(83,'3','PATRIMONIO',0,'2013-09-22 23:21:26','2013-09-22 23:21:26',NULL,2),(84,'3.1.0.1','CAPITAL',5,'2013-09-22 23:21:26','2013-09-22 23:21:26',NULL,2),(85,'4','INGRESOS',0,'2013-09-22 23:21:27','2013-09-22 23:21:27',NULL,2),(86,'4.1.1.1','SUELDO JOSE',6,'2013-09-22 23:21:27','2013-09-22 23:21:27',NULL,2),(87,'4.1.1.2','SUELDO FLO',6,'2013-09-22 23:21:27','2013-09-22 23:21:27',NULL,2),(88,'4.1.1.3','VET',6,'2013-09-22 23:21:27','2013-09-22 23:21:27',NULL,2),(89,'4.1.1.4','SLOP',6,'2013-09-22 23:21:27','2013-09-22 23:21:27',NULL,2),(90,'4.1.1.5','BENDITO CAMINO',6,'2013-09-22 23:21:27','2013-09-22 23:21:27',NULL,2),(91,'4.1.1.6','REGALOS',6,'2013-09-22 23:21:27','2013-09-22 23:21:27',NULL,2),(92,'5','EGRESOS',0,'2013-09-22 23:21:27','2013-09-22 23:21:27',NULL,2),(93,'5.1','CASA',0,'2013-09-22 23:21:27','2013-09-22 23:21:27',NULL,2),(94,'5.1.1.1','ALQUILER',7,'2013-09-22 23:21:28','2013-09-22 23:21:28',NULL,2),(95,'5.1.1.2','SUPERMERCADO',7,'2013-09-22 23:21:28','2013-09-22 23:21:28',NULL,2),(96,'5.1.1.3','SERVICIOS',7,'2013-09-22 23:21:28','2013-09-22 23:21:28',NULL,2),(97,'5.2','AUTO',0,'2013-09-22 23:21:28','2013-09-22 23:21:28',NULL,2),(98,'5.2.1.1','AUTO',7,'2013-09-22 23:21:28','2013-09-22 23:21:28',NULL,2),(99,'5.3','GENERALES',0,'2013-09-22 23:21:28','2013-09-22 23:21:28',NULL,2),(100,'5.3.1.1','VIAJES',7,'2013-09-22 23:21:28','2013-09-22 23:21:28',NULL,2),(101,'5.3.1.2','REGALOS',7,'2013-09-22 23:21:29','2013-09-22 23:21:29',NULL,2),(102,'5.3.1.3','GENERALES',7,'2013-09-22 23:21:29','2013-09-22 23:21:29',NULL,2),(103,'5.3.1.5','ALMUERZOS',7,'2013-09-22 23:21:29','2013-09-22 23:21:29',NULL,2),(104,'5.3.1.6','EDUCACION',7,'2013-09-22 23:21:29','2013-09-22 23:21:29',NULL,2),(105,'5.3.1.7','EXTRA ORDINARIOS',7,'2013-09-22 23:21:29','2013-09-22 23:21:29',NULL,2),(106,'5.3.1.8','ENTRETENIMIENTO',7,'2013-09-22 23:21:29','2013-09-22 23:21:29',NULL,2),(107,'1','ACTIVO',0,'2013-09-22 23:25:29','2013-09-22 23:25:29',NULL,4),(108,'1.1','ACTIVO CORRIENTE',0,'2013-09-22 23:25:29','2013-09-22 23:25:29',NULL,4),(109,'1.1.1','CAJA',0,'2013-09-22 23:25:29','2013-09-22 23:25:29',NULL,4),(110,'1.1.1.1','CAJA GENERAL $',1,'2013-09-22 23:25:29','2013-09-22 23:25:29',NULL,4),(111,'1.1.2','BANCOS',0,'2013-09-22 23:25:29','2013-09-22 23:25:29',NULL,4),(112,'1.1.2.3','GALICIA CA',1,'2013-09-22 23:25:29','2013-09-22 23:25:29',NULL,4),(113,'1.1.2.2','BBVA CA',1,'2013-09-22 23:25:29','2013-09-22 23:25:29',NULL,4),(114,'1.1.2.1','BBVA CTA CTE',1,'2013-09-22 23:25:29','2013-09-22 23:25:29',NULL,4),(115,'1.1.2.4','PROV CA',1,'2013-09-22 23:25:29','2013-09-22 23:25:29',NULL,4),(116,'1.1.3','CREDITOS',0,'2013-09-22 23:25:29','2013-09-22 23:25:29',NULL,4),(117,'1.1.3.1','POR COBRAR',2,'2013-09-22 23:25:29','2013-09-22 23:25:29',NULL,4),(118,'1.1.4','AHORROS',0,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(119,'1.1.4.1','CAJA GRIS $',1,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(120,'1.1.4.2','CAJA GRIS U$S',1,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(121,'1.1.4.3','CAJA GRIS UY',1,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(122,'1.1.4.4','CAJA GRIS REAIS',1,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(123,'1.2','ACTIVO NO CORRIENTE',0,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(124,'1.2.1','BIENES DE USO',0,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(125,'1.2.1.1','RODADOS',4,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(126,'2','PASIVO',0,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(127,'2.1','PASIVO CORRIENTE',0,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(128,'2.1.2','DEUDAS',0,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(129,'2.1.2.1','BBVA VISA',3,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(130,'2.1.2.2','BBVA MASTER',3,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(131,'2.1.2.3','GALICIA VISA',3,'2013-09-22 23:25:30','2013-09-22 23:25:30',NULL,4),(132,'2.1.2.4','PROV VISA',3,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(133,'2.1.2.5','HSBC VISA',3,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(134,'2.1.2.5','SERVICIOS A PAGAR',3,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(135,'3','PATRIMONIO',0,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(136,'3.1.0.1','CAPITAL',5,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(137,'4','INGRESOS',0,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(138,'4.1.1.1','SUELDO JOSE',6,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(139,'4.1.1.2','SUELDO FLO',6,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(140,'4.1.1.3','VET',6,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(141,'4.1.1.4','SLOP',6,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(142,'4.1.1.5','BENDITO CAMINO',6,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(143,'4.1.1.6','REGALOS',6,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(144,'5','EGRESOS',0,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(145,'5.1','CASA',0,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(146,'5.1.1.1','ALQUILER',7,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(147,'5.1.1.2','SUPERMERCADO',7,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(148,'5.1.1.3','SERVICIOS',7,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(149,'5.2','AUTO',0,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(150,'5.2.1.1','AUTO',7,'2013-09-22 23:25:31','2013-09-22 23:25:31',NULL,4),(151,'5.3','GENERALES',0,'2013-09-22 23:25:32','2013-09-22 23:25:32',NULL,4),(152,'5.3.1.1','VIAJES',7,'2013-09-22 23:25:32','2013-09-22 23:25:32',NULL,4),(153,'5.3.1.2','REGALOS',7,'2013-09-22 23:25:32','2013-09-22 23:25:32',NULL,4),(154,'5.3.1.3','GENERALES',7,'2013-09-22 23:25:32','2013-09-22 23:25:32',NULL,4),(155,'5.3.1.5','ALMUERZOS',7,'2013-09-22 23:25:32','2013-09-22 23:25:32',NULL,4),(156,'5.3.1.6','EDUCACION',7,'2013-09-22 23:25:32','2013-09-22 23:25:32',NULL,4),(157,'5.3.1.7','EXTRA ORDINARIOS',7,'2013-09-22 23:25:32','2013-09-22 23:25:32',NULL,4),(158,'5.3.1.8','ENTRETENIMIENTO',7,'2013-09-22 23:25:32','2013-09-22 23:25:32',NULL,4),(211,'1','ACTIVO',0,'2013-09-26 20:23:04','2013-09-26 20:23:04',NULL,5),(212,'1.1','ACTIVO CORRIENTE',0,'2013-09-26 20:23:04','2013-09-26 20:23:04',NULL,5),(213,'1.1.1','CAJA',0,'2013-09-26 20:23:04','2013-09-26 20:23:04',NULL,5),(214,'1.1.1.1','CAJA GENERAL $',1,'2013-09-26 20:23:04','2013-09-26 20:23:04',NULL,5),(215,'1.1.2','BANCOS',0,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(216,'1.1.2.3','GALICIA CA',1,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(217,'1.1.2.2','BBVA CA',1,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(218,'1.1.2.1','BBVA CTA CTE',1,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(219,'1.1.2.4','PROV CA',1,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(220,'1.1.3','CREDITOS',0,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(221,'1.1.3.1','POR COBRAR',2,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(222,'1.1.4','AHORROS',0,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(223,'1.1.4.1','CAJA GRIS $',1,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(224,'1.1.4.2','CAJA GRIS U$S',1,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(225,'1.1.4.3','CAJA GRIS UY',1,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(226,'1.1.4.4','CAJA GRIS REAIS',1,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(227,'1.2','ACTIVO NO CORRIENTE',0,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(228,'1.2.1','BIENES DE USO',0,'2013-09-26 20:23:05','2013-09-26 20:23:05',NULL,5),(229,'1.2.1.1','RODADOS',4,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(230,'2','PASIVO',0,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(231,'2.1','PASIVO CORRIENTE',0,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(232,'2.1.2','DEUDAS',0,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(233,'2.1.2.1','BBVA VISA',3,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(234,'2.1.2.2','BBVA MASTER',3,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(235,'2.1.2.3','GALICIA VISA',3,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(236,'2.1.2.4','PROV VISA',3,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(237,'2.1.2.5','HSBC VISA',3,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(238,'2.1.2.5','SERVICIOS A PAGAR',3,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(239,'3','PATRIMONIO',0,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(240,'3.1.0.1','CAPITAL',5,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(241,'4','INGRESOS',0,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(242,'4.1.1.1','SUELDO JOSE',6,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(243,'4.1.1.2','SUELDO FLO',6,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(244,'4.1.1.3','VET',6,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(245,'4.1.1.4','SLOP',6,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(246,'4.1.1.5','BENDITO CAMINO',6,'2013-09-26 20:23:06','2013-09-26 20:23:06',NULL,5),(247,'4.1.1.6','REGALOS',6,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(248,'5','EGRESOS',0,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(249,'5.1','CASA',0,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(250,'5.1.1.1','ALQUILER',7,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(251,'5.1.1.2','SUPERMERCADO',7,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(252,'5.1.1.3','SERVICIOS',7,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(253,'5.2','AUTO',0,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(254,'5.2.1.1','AUTO',7,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(255,'5.3','GENERALES',0,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(256,'5.3.1.1','VIAJES',7,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(257,'5.3.1.2','REGALOS',7,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(258,'5.3.1.3','GENERALES',7,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(259,'5.3.1.5','ALMUERZOS',7,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(260,'5.3.1.6','EDUCACION',7,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(261,'5.3.1.7','EXTRA ORDINARIOS',7,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5),(262,'5.3.1.8','ENTRETENIMIENTO',7,'2013-09-26 20:23:07','2013-09-26 20:23:07',NULL,5);
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
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