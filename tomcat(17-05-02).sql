-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: tomcat
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `num` int(11) NOT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `pageNum` int(11) DEFAULT NULL,
  `nick_name` varchar(20) DEFAULT NULL,
  `love` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'ghg','hgh',0,0,'2017-04-28 17:41:51',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_reply`
--

DROP TABLE IF EXISTS `board_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_reply` (
  `num` int(11) NOT NULL,
  `re_content` int(11) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_reply`
--

LOCK TABLES `board_reply` WRITE;
/*!40000 ALTER TABLE `board_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_code` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `info` varchar(3000) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`city_code`),
  KEY `country_code` (`country_code`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('busan','busan','부산','kr'),('cebu','cebu','세부','ph'),('jeju','jeju','제주','kr'),('manila','manila','마닐라','ph'),('osaca','osaca','오사카','jp'),('seoul','seoul','서울','kr'),('tokyo','tokyo','도쿄','jp');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_code` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `info` varchar(3000) DEFAULT NULL,
  `continent` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('jp','japan','일본','asia'),('kr','korea','대한민국','asia'),('ph','philippines','필리핀','asia');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gram`
--

DROP TABLE IF EXISTS `gram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gram` (
  `num` int(11) NOT NULL,
  `nick_name` varchar(20) NOT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `image1` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `g_nick_idx` (`nick_name`),
  CONSTRAINT `g_nick` FOREIGN KEY (`nick_name`) REFERENCES `member` (`nick`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram`
--

LOCK TABLES `gram` WRITE;
/*!40000 ALTER TABLE `gram` DISABLE KEYS */;
/*!40000 ALTER TABLE `gram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gram_reply`
--

DROP TABLE IF EXISTS `gram_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gram_reply` (
  `num` int(11) NOT NULL,
  `nick_name` varchar(20) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `gr_re_fk_idx` (`re_ref`),
  KEY `g_re_nick_idx` (`nick_name`),
  CONSTRAINT `g_re_nick` FOREIGN KEY (`nick_name`) REFERENCES `member` (`nick`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gr_re_fk` FOREIGN KEY (`re_ref`) REFERENCES `gram` (`num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram_reply`
--

LOCK TABLES `gram_reply` WRITE;
/*!40000 ALTER TABLE `gram_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `gram_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `nick` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `file` varchar(255) NOT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `city_code` varchar(20) DEFAULT NULL,
  `travel_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `img_info` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markers`
--

DROP TABLE IF EXISTS `markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markers`
--

LOCK TABLES `markers` WRITE;
/*!40000 ALTER TABLE `markers` DISABLE KEYS */;
INSERT INTO `markers` VALUES (1,'Love.Fish','580 Darling Street, Rozelle, NSW',-33.861034,151.171936,'restaurant'),(2,'Young Henrys','76 Wilford Street, Newtown, NSW',-33.898113,151.174469,'bar'),(3,'Hunter Gatherer','Greenwood Plaza, 36 Blue St, North Sydney NSW',-33.840282,151.207474,'bar'),(4,'The Potting Shed','7A, 2 Huntley Street, Alexandria, NSW',-33.910751,151.194168,'bar'),(5,'Nomad','16 Foster Street, Surry Hills, NSW',-33.879917,151.210449,'bar'),(6,'Three Blue Ducks','43 Macpherson Street, Bronte, NSW',-33.906357,151.263763,'restaurant'),(7,'Single Origin Roasters','60-64 Reservoir Street, Surry Hills, NSW',-33.881123,151.209656,'restaurant'),(8,'Red Lantern','60 Riley Street, Darlinghurst, NSW',-33.874737,151.215530,'restaurant');
/*!40000 ALTER TABLE `markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(30) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `gender` varchar(4) NOT NULL,
  `tel` varchar(40) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `auth` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('ghkdckdgk2@naver.com','c9fe854ea69fc0a252340e152864b539b116c36cf1ac419652e1826c3071d5ed','황창하2','qweqwe123','남','56679F87612622E091DF7006F09C6805','2017-04-21 13:54:27',NULL,0),('ghkdckdgk@naver.com','3cc849279ba298b587a34cabaeffc5ecb3a044bbf97c516fab7ede9d1af77cfa','황창하','비밀번호qweqwe','남','56679F87612622E091DF7006F09C6805','2017-04-21 13:52:53',NULL,0),('tdslakfjlkdsfj@nasdflkjdfk','54d5cb2d332dbdb4850293caae4559ce88b65163f1ea5d4e4b3ac49d772ded14','asdfasdf','adsffdsa','여','56679F87612622E091DF7006F09C6805','2017-04-21 17:23:09',NULL,0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myplans`
--

DROP TABLE IF EXISTS `myplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myplans` (
  `myplans_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `plan_nr` int(11) DEFAULT NULL,
  `travel_id` int(11) DEFAULT NULL,
  `item_nr` int(11) DEFAULT NULL,
  `firstday` date DEFAULT NULL,
  `lastday` date DEFAULT NULL,
  `day_nr` int(11) DEFAULT NULL,
  `day_night` char(2) DEFAULT NULL,
  `user_lat` float(10,6) DEFAULT NULL,
  `user_lng` float(10,6) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `memo` varchar(3000) DEFAULT NULL,
  `plan_done_nr` int(11) DEFAULT NULL,
  PRIMARY KEY (`myplans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myplans`
--

LOCK TABLES `myplans` WRITE;
/*!40000 ALTER TABLE `myplans` DISABLE KEYS */;
INSERT INTO `myplans` VALUES (1,'test1',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(2,'test1',1,3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(3,'test1',1,2,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(4,'test1',1,5,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(5,'test1',1,6,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(6,'test2',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(7,'test2',1,3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(8,'test2',1,2,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(9,'test2',1,5,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10,'test2',1,6,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(11,'test1',2,6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(12,'test1',2,5,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(13,'test1',2,4,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(14,'test1',2,3,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(15,'test1',2,2,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(16,'test1',2,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(17,'test2',2,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(18,'test2',2,4,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(19,'test2',2,3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(20,'test2',2,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(21,'test2',2,1,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `myplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel` (
  `travel_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `city_code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  `info` varchar(3000) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`travel_id`),
  KEY `country_code` (`country_code`),
  KEY `city_code` (`city_code`),
  CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country` (`country_code`),
  CONSTRAINT `travel_ibfk_2` FOREIGN KEY (`city_code`) REFERENCES `city` (`city_code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` VALUES (1,'p','kr','busan','자갈치',35.096706,129.030487,'부산 자갈치시장은 국제시장, 부평깡통시장과 함께 부산을 대표하는 전통시장이다. 자갈치 아지매로 상징되는 한국의 대표적인 어시장으로 부산의 관광 명소 중 하나이며, 회를 비롯한 다양한 해산물을 만날 수 있다.','부산광역시 중구 자갈치해안로 52'),(2,'p','kr','busan','용두산',35.100647,129.032623,'용두산공원은 부산광역시 중구에 있는 공원으로 부산시설공단에서 관리하고 있다. 용두산으로 불리는 언덕이 공원이고, 정상에는 부산타워가 있다. 부산 남부의 남포동에 인접하고, 공원으로 올라가는 길은 대청동에서 중앙성당으로 올라가는 길이 있고, 중앙동에서 부산호텔 근처에서 올라가는 계단이 있고, 광복동에서는 에스컬레이터로 올라갈 수 있다. 부산항이나 영도를 바라볼 수 있고 또 부산타워의 아래에는 이순신의 동상이 우뚝 솟아 있다.','부산광역시 중구 광복동 용두산길 37-55'),(3,'p','kr','busan','태종대',35.053280,129.087204,'태종대는 부산 영도구 동삼동에 있는 명승지이다. 영도의 남동쪽 끝에 위치하는 해발 고도 200m 이하의 구릉 지역으로, 부산 일대에서 보기 드문 울창한 숲과 기암 괴석으로 된 해식 절벽 및 푸른 바다 등이 조화를 이룬다. 맑은 날에는 일본 쓰시마섬도 볼 수 있다.','부산광역시 영도구 동삼2동 전망로 24'),(16,'h','kr','busan','조선비치호텔',35.156189,129.153976,'조선비치호텔임당','부산광역시 해운대구 우1동 동백로 67');
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather` (
  `city_code` varchar(20) NOT NULL,
  `january` int(11) DEFAULT NULL,
  `february` int(11) DEFAULT NULL,
  `march` int(11) DEFAULT NULL,
  `april` int(11) DEFAULT NULL,
  `may` int(11) DEFAULT NULL,
  `june` int(11) DEFAULT NULL,
  `july` int(11) DEFAULT NULL,
  `august` int(11) DEFAULT NULL,
  `september` int(11) DEFAULT NULL,
  `october` int(11) DEFAULT NULL,
  `november` int(11) DEFAULT NULL,
  `december` int(11) DEFAULT NULL,
  PRIMARY KEY (`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-02  9:21:35
