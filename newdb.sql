-- MySQL dump 10.13  Distrib 5.5.15, for osx10.7 (i386)
--
-- Host: localhost    Database: ruby
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Table structure for table `accounts`
--

use ruby;

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `date_reg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (3,'almas','34f2b13feb0c844f249534260632cf85','be5n4','2011-10-15 13:01:02'),(1,'darik','b321546f7a7be2d7a177e909e7178cac','12345','2011-10-15 12:56:44'),(4,'robrob','295b9eaf4706aa19563c8eb647a4450a','zcphy','2011-10-22 15:37:40'),(5,'marina','104c8c3938537534ba0cd8a06db15c29','zl4vt','2011-10-25 10:24:40');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `pic_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'',1,1,'0000-00-00 00:00:00'),(2,'',1,1,'0000-00-00 00:00:00'),(3,'first comment',1,1,'0000-00-00 00:00:00'),(4,'fdafdafda',1,1,'0000-00-00 00:00:00'),(5,'fdajfdjaklfjldal',1,1,'0000-00-00 00:00:00'),(6,'hello, world!!!',1,1,'0000-00-00 00:00:00'),(7,'hello, world!!!',1,1,'0000-00-00 00:00:00'),(8,'hello, world!!!',1,11,'0000-00-00 00:00:00'),(9,'reqreqreq',1,11,'0000-00-00 00:00:00'),(10,'Rar',1,11,'0000-00-00 00:00:00'),(11,'blah',1,11,'0000-00-00 00:00:00'),(12,'blah\r\n',1,11,'0000-00-00 00:00:00'),(13,'first)))',1,12,'0000-00-00 00:00:00'),(14,'Beautiful!',1,11,'0000-00-00 00:00:00'),(15,'cool!',1,11,'0000-00-00 00:00:00'),(16,'acc',1,11,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `tags` text NOT NULL,
  `date` datetime NOT NULL,
  `category` int(11) NOT NULL DEFAULT '1',
  `name` varchar(32) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (10,'first','lya-lya, bla-bla','ferrumlogin, first','0000-00-00 00:00:00',4,'jzotvn8vjhsi5c13kzy6o3jub',1),(11,'Something','lya-lya-lya','Dummy','0000-00-00 00:00:00',4,'mtop56ucdizk6mtp9p5o8jrop.jpg',1),(12,'marinas jupload','something for testing','upload, marina','0000-00-00 00:00:00',4,'wlcddzyeyaa6zn53jqyko2mjw.jpg',1),(13,'uploadpictures','About upload','userstory1','0000-00-00 00:00:00',2,'h5ddevauqzyyurap2cddeokyq.jpg',1),(14,'hhkjh','hkjhkjhk','hkjhk','0000-00-00 00:00:00',4,'owwpsq76jq51z34wmi9v9qjmb.jpg',1),(15,'uploadpictures','about uploading photos','userstory','0000-00-00 00:00:00',2,'bbvqwwll2qet73e3bjurduiro.jpg',1),(16,'bl','ag','fa','0000-00-00 00:00:00',1,'nym4osq44hlzoilhb8jkzk4o6.jpg',1),(17,'da','dadada','dada','0000-00-00 00:00:00',3,'f2a724fms9te93t2nbrz7zzql.jpg',4);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` varchar(2) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `rank` varchar(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-10-27 17:34:05
