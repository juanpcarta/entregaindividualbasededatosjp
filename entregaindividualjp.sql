CREATE DATABASE  IF NOT EXISTS `entregaindividualjp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `entregaindividualjp`;
-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: entregaindividual
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Cocina'),(2,'Cumpleaños'),(3,'Compras'),(4,'Trabajo'),(5,'Vacaciones'),(6,'Salud'),(7,'Universidad'),(8,'Familia'),(9,'Aniversarios'),(10,'Contraseñas');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_note`
--

DROP TABLE IF EXISTS `category_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_236444bc-eb43-4e59-bb80-9e71eee0afb4` (`note_id`),
  KEY `FK_7eb3eaf6-0db0-436c-a6de-1ec8da565168` (`category_id`),
  CONSTRAINT `FK_236444bc-eb43-4e59-bb80-9e71eee0afb4` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`),
  CONSTRAINT `FK_7eb3eaf6-0db0-436c-a6de-1ec8da565168` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_note`
--

LOCK TABLES `category_note` WRITE;
/*!40000 ALTER TABLE `category_note` DISABLE KEYS */;
INSERT INTO `category_note` VALUES (1,5,2),(2,6,7),(3,7,10),(4,8,6),(5,9,5),(6,10,4),(7,2,3),(8,3,6),(9,3,8),(10,8,8),(11,4,5),(12,3,3),(13,2,1),(14,1,9),(15,11,5),(16,12,10);
/*!40000 ALTER TABLE `category_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `last_modificated_at` datetime NOT NULL,
  `description` text NOT NULL,
  `can_be_removed` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d9bc0658-18bb-4ff5-9604-e45ff1bdbe4d` (`user_id`),
  CONSTRAINT `FK_d9bc0658-18bb-4ff5-9604-e45ff1bdbe4d` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'Casamiento','2020-12-03 18:45:05','2020-12-03 18:45:05','Aniversario de Casados el 23/02',0,4),(2,'Compras Super','2017-03-18 05:15:08','2017-03-19 15:18:08','Comprar Acelga y Huevo para hacer la Pascualina',1,6),(3,'Abuelo','2015-04-21 07:55:55','2015-04-21 07:55:55','Comprar remedios para el abuelo',1,8),(4,'Vacaciones 2018','2018-09-24 16:34:45','2018-09-24 16:34:45','Confirmar aéreo a Miami',1,10),(5,'Cumple Tio Claudio','2019-09-05 16:24:03','2019-09-05 16:24:03','Cumple tío Claudio el 15/10',0,1),(6,'Biología','2013-06-23 14:37:36','2013-06-23 14:37:36','El exámen de Biología es el 25/07',1,3),(7,'Netflix','2019-07-25 10:41:27','2020-07-25 19:34:19','La contraseña de Netflix es hola123',0,5),(8,'Odontólogo','2021-08-07 19:40:19','2021-08-07 19:40:19','Llevar a los chicos al odontólogo el 25/08',1,7),(9,'Vacaciones 2021','2021-07-04 18:43:24','2021-07-04 18:43:24','Reservar Hotel En Berlín',1,9),(10,'Cash Flow','2020-04-11 19:53:04','2020-04-11 19:53:04','Terminar el Cash Flow para el 14/04',1,2),(11,'Vacaciones 2017','2017-05-19 19:53:04','2017-06-01 21:47:09','Sacar pasaje tren a Roma',1,1),(12,'Amazon','2021-09-01 14:39:59','2021-09-01 14:39:59','La contraseña de Amazon es chau456',1,3);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juan Pablo','Carta','jcarta@gmail.com'),(2,'Ana','Lopez','alopez@gmail.com'),(3,'Jorge','Roca','jroca@hotmail.com'),(4,'Patricia','Rodriguez','prodriguez@gmail.com'),(5,'Claudio','Garcia','cgarcia@gmail.com'),(6,'Rubén','Tagliaferro','rtagliaferro@hotmail.com'),(7,'Esteban','Trotta','etrotta@gmail.com'),(8,'Agustina','Fernandez','afernandez@hotmail.com'),(9,'Florencia','Carrizo','fcarrizo@hotmail.com'),(10,'Marcos','Bernardez','mbernardez@yahoo.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'entregaindividual'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-31 23:39:02
