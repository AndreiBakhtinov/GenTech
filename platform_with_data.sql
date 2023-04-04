CREATE DATABASE  IF NOT EXISTS `platform` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `platform`;
-- MariaDB dump 10.19  Distrib 10.10.3-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: platform
-- ------------------------------------------------------
-- Server version	10.10.3-MariaDB
-- Anatolii pravki
-- Pravki 04.04.2023 Anatolii Bezbakh
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
-- Table structure for table `donations`
--

DROP TABLE IF EXISTS `donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donations` (
  `donation_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT current_timestamp(),
  `donator_id` int(11) DEFAULT NULL,
  `stream_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL CHECK (`amount` > 0),
  PRIMARY KEY (`donation_id`),
  KEY `donator_id` (`donator_id`),
  KEY `stream_id` (`stream_id`),
  CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`donator_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `donations_ibfk_2` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`stream_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donations`
--

LOCK TABLES `donations` WRITE;
/*!40000 ALTER TABLE `donations` DISABLE KEYS */;
INSERT INTO `donations` VALUES
(1,'2023-03-24 15:04:06',1,1,300.00),
(2,'2023-03-24 15:04:06',2,1,200.00),
(3,'2023-03-24 15:04:06',3,3,15.00);
/*!40000 ALTER TABLE `donations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reactions` (
  `reaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `stream_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `value` int(11) DEFAULT NULL CHECK (`value` between 1 and 5),
  PRIMARY KEY (`reaction_id`),
  KEY `user_id` (`user_id`),
  KEY `stream_id` (`stream_id`),
  CONSTRAINT `reactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reactions_ibfk_2` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`stream_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reactions`
--

LOCK TABLES `reactions` WRITE;
/*!40000 ALTER TABLE `reactions` DISABLE KEYS */;
INSERT INTO `reactions` VALUES
(1,1,1,'2023-03-24 14:35:44',5),
(2,2,1,'2023-03-24 14:35:44',5),
(3,3,2,'2023-03-24 14:35:44',4),
(4,3,3,'2023-03-24 14:35:44',3);
/*!40000 ALTER TABLE `reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams`
--

DROP TABLE IF EXISTS `streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streams` (
  `stream_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(256) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_completed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`stream_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `streams_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams`
--

LOCK TABLES `streams` WRITE;
/*!40000 ALTER TABLE `streams` DISABLE KEYS */;
INSERT INTO `streams` VALUES
(1,1,'Sream from USA','2023-03-20 15:41:55',0),
(2,2,'Sream from Germany','2023-03-20 15:41:55',0),
(3,3,'Sream from France','2023-03-20 15:41:55',0);
/*!40000 ALTER TABLE `streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(128) NOT NULL,
  `country` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_blocked` tinyint(1) DEFAULT 0,
  `email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Ivanov Ivan','USA','2023-03-20 15:01:37',0,NULL),
(2,'Petr Petrov','Germany','2023-03-20 15:01:37',0,NULL),
(3,'Sidr Sidorov','France','2023-03-20 15:01:37',0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-24 17:49:33
