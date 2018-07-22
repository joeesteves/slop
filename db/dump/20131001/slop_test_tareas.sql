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
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tareas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `estado` int(11) DEFAULT NULL,
  `establecimiento_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tareas_on_establecimiento_id` (`establecimiento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (2,'2013-09-16','12321312','<ul>\r\n<li style=\"text-align: center;\">\r\n<h1>12321312</h1>\r\n</li>\r\n</ul>',2,11,'2013-09-16 16:19:09','2013-09-16 16:29:42'),(3,'2013-09-16','wqeqeqe','<p>qwewqeqweq</p>',0,11,'2013-09-16 16:42:08','2013-09-16 16:44:56'),(4,'2013-09-16','asdasdqasdsadasdsad','<p>sadsadsadasdsa</p>',1,11,'2013-09-16 16:42:22','2013-09-16 16:45:23'),(5,'2013-09-16','I.A.T.F. 2013','<h1>Se seleccionar&aacute;n las 120 madres paridas cabeza para realizar una IATF.&nbsp;</h1>\r\n<h1>Tareas a realizar:</h1>\r\n<ol>\r\n<li>\r\n<h1>Separar rodeo cabeza</h1>\r\n</li>\r\n<li>\r\n<h1>Chequear que la manga este ok</h1>\r\n</li>\r\n<li>\r\n<h1><strong>Que toros vamos a usar???</strong></h1>\r\n</li>\r\n<li>\r\n<h1>Cotizar pedido de insumos en villa y moreno&nbsp;</h1>\r\n</li>\r\n<li>\r\n<h1>Cotizar pedido de insumos en campo y asociados</h1>\r\n</li>\r\n<li>\r\n<h1>Hacer pedido&nbsp;</h1>\r\n</li>\r\n<li>\r\n<h1>Hablar con Nemi por si se quiere sumar</h1>\r\n</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<p>Calcular insumos&nbsp;</p>\r\n<p><code>&lt;a hfer=\"app.slop.com.ar/IATF\"&gt;Calcular&lt;/a&gt;</code></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>',0,10,'2013-09-16 17:35:47','2013-09-16 18:45:36'),(6,'2013-09-18','Esto es para facu','<h1 style=\"text-align: center;\"><strong>HOLAAA PUCHOOOOOOOOOOOOOOOOOONNNNNNNNNN</strong></h1>',0,11,'2013-09-18 20:30:20','2013-09-18 20:30:20');
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
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
