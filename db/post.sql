-- MySQL dump 10.13  Distrib 5.1.30, for Win32 (ia32)
--
-- Host: localhost    Database: post
-- ------------------------------------------------------
-- Server version	5.1.30-community

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
-- Table structure for table `huifu`
--

DROP TABLE IF EXISTS `huifu`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `huifu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `review_id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `to_ip` varchar(255) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `huifu`
--

LOCK TABLES `huifu` WRITE;
/*!40000 ALTER TABLE `huifu` DISABLE KEYS */;
/*!40000 ALTER TABLE `huifu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ping`
--

DROP TABLE IF EXISTS `ping`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL,
  `count_response` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ping`
--

LOCK TABLES `ping` WRITE;
/*!40000 ALTER TABLE `ping` DISABLE KEYS */;
/*!40000 ALTER TABLE `ping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tie`
--

DROP TABLE IF EXISTS `tie`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `post_ip` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `count_review` int(11) NOT NULL,
  `last_review` varchar(255) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tie`
--

LOCK TABLES `tie` WRITE;
/*!40000 ALTER TABLE `tie` DISABLE KEYS */;
INSERT INTO `tie` VALUES (1,'【Doge吧主】欢迎来到doge吧【吧规0.0】','<img src=\"http://192.168.48.40:8080/kindeditor/plugins/emoticons/images/face/f_0029.gif\" border=\"0\" alt=\"\" /><span>吧规是什么，嘿嘿嘿，这又不是常熟理工吧，你想发什么就发什么，别骂吧主就行，初来乍到doge吧，有没有一种心中千万只doge在奔腾</span>','1471937930596','Doge吧主','192.168.48.40',0,1,'1471939166845',0,1),(2,'eeeeee','xxxxx','1471939148321','','192.168.48.2',1,0,'1471939148321',1,1);
/*!40000 ALTER TABLE `tie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-23  8:18:34
