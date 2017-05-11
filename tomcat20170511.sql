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
INSERT INTO `board` VALUES (1,'ghg','hgh',0,0,'2017-04-28 17:41:51',NULL,NULL,NULL,NULL),(2,'3123','123',0,0,'2017-05-04 09:17:17',NULL,NULL,NULL,NULL),(3,'gfg','fgfg',0,0,'2017-05-04 09:46:04',NULL,NULL,NULL,NULL),(4,'123123','123',0,0,'2017-05-04 12:09:59',NULL,NULL,NULL,NULL),(5,'3123123','12312312',0,0,'2017-05-04 12:10:04',NULL,NULL,NULL,NULL),(6,'1231123','123213',0,0,'2017-05-04 12:10:07',NULL,NULL,NULL,NULL),(7,'asd','asd',0,0,'2017-05-08 10:05:56',NULL,NULL,NULL,NULL),(8,'sdf','sdf',0,0,'2017-05-08 10:30:55',NULL,NULL,NULL,NULL),(9,'sdfsdsd','fsdf',0,0,'2017-05-08 10:30:58',NULL,NULL,NULL,NULL),(10,'fsd','fsdf',0,0,'2017-05-08 10:31:00',NULL,NULL,NULL,NULL),(11,'sdfsdfsd','fsdfsdf',0,0,'2017-05-08 11:48:23',NULL,NULL,NULL,NULL),(12,'fsdfsdf','dfsdfsd',0,0,'2017-05-08 11:48:27',NULL,NULL,NULL,NULL),(13,'sdfsd','sdfsd',0,0,'2017-05-08 11:48:30',NULL,NULL,NULL,NULL),(14,'asdfsdaf','sdfasdf',0,0,'2017-05-08 11:50:14',NULL,NULL,NULL,NULL),(15,'sdfsdfsdf','fsdfsdf',0,0,'2017-05-08 11:53:36',NULL,NULL,NULL,NULL),(16,'sdfsdfsadfasdf','',0,0,'2017-05-08 11:53:47',NULL,NULL,NULL,NULL),(17,'','',0,0,'2017-05-08 11:53:49',NULL,NULL,NULL,NULL),(18,'','',0,0,'2017-05-08 11:53:51',NULL,NULL,NULL,NULL),(19,'','',0,0,'2017-05-08 11:53:58',NULL,NULL,NULL,NULL),(20,'','',0,0,'2017-05-08 11:54:06',NULL,NULL,NULL,NULL),(21,'','',0,0,'2017-05-08 12:00:15',NULL,NULL,NULL,NULL);
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
  `en_name` varchar(30) DEFAULT NULL,
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
INSERT INTO `city` VALUES ('busan','부산','부산','kr','busan'),('cebu','세부','세부','ph','cebu'),('jeju','제주','제주','kr','jeju'),('manila','마닐라','마닐라','ph','manila'),('osaca','오사카','오사카','jp','osaka'),('seoul','서울','서울','kr','seoul'),('tokyo','도쿄','도쿄','jp','tokyo');
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
  `en_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('jp','일본','일본','asia','japan'),('kr','대한민국','대한민국','asia','korea'),('ph','필리핀','필리핀','asia','philippines');
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
  `nick` varchar(20) NOT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `image1` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `fk_gram_nick_idx` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram`
--

LOCK TABLES `gram` WRITE;
/*!40000 ALTER TABLE `gram` DISABLE KEYS */;
INSERT INTO `gram` VALUES (1,'김큐아','ㅎㅇ','ㅎㅇ','331.png','2017-05-02'),(2,'김큐아','2','2','14199613_1147716775274323_1897818334253246201_n3.jpg','2017-05-02'),(3,'김큐아','3','3','14199613_1147716775274323_1897818334253246201_n2.jpg','2017-05-02'),(4,'김큐아','5','5','14317496_1150321251680542_773070850393470059_n3.jpg','2017-05-02'),(5,'김큐아','6','6','332.png','2017-05-02'),(6,'김큐아','7','7','1111.png','2017-05-02'),(7,'김큐아','8','8','14291802_1150321191680548_9017500081015867354_n21.jpg','2017-05-02'),(8,'김큐아','10','10','appple.jpg','2017-05-02'),(9,'김큐아','11','11','banner1.jpg','2017-05-02'),(10,'김큐아','12','12','333.png','2017-05-02'),(12,'하이룽','헤헤','헤헤 안녕하세요 그냥 사진입니다.\r\n헤헤 안녕하세요 그냥 사진입니다.\r\n헤헤 안녕하세요 그냥 사진입니다.\r\n헤헤 안녕하세요 그냥 사진입니다.\r\n','heart3.png','2017-05-04'),(13,'김큐아','하이룽','하이룽하이룽하이룽하이룽','21.png','2017-05-04'),(14,'김큐아','zz','zz','14291802_1150321191680548_9017500081015867354_n.jpg','2017-05-10'),(16,'alswjd','냐냐냐냐111누눈','가가가가가가가가나나나나나ㅏㄴ낭ㄹ','2.jpg','2017-05-11'),(17,'큐아큐아','ㅎㅇ','ㅎㅇ','14291802_1150321191680548_9017500081015867354_n.jpg','2017-05-11');
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
  `nick` varchar(20) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `re_num` int(11) NOT NULL,
  PRIMARY KEY (`re_num`),
  KEY `fk_reply_nick_idx` (`nick`),
  KEY `fk_reply_num_idx` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram_reply`
--

LOCK TABLES `gram_reply` WRITE;
/*!40000 ALTER TABLE `gram_reply` DISABLE KEYS */;
INSERT INTO `gram_reply` VALUES (12,'김큐아','zz',23,0,0,'2017-05-04',23),(12,'김큐아','zzz',25,0,0,'2017-05-04',25),(13,'김큐아','ㅌㅌ',26,0,0,'2017-05-04',26),(13,'김큐아','ㅎㅎㅎㅎ',26,1,1,'2017-05-04',27),(15,'큐아큐아','안녕',28,0,0,'2017-05-11',28),(15,'큐아큐아','ㅋㅋㅋ',29,0,0,'2017-05-11',29),(15,'큐아큐아','대댓글이네',29,1,1,'2017-05-11',30),(15,'큐아큐아2','대대댓글',29,2,2,'2017-05-11',31),(15,'큐아큐아2','대댓글??',29,3,3,'2017-05-11',32),(15,'큐아큐아2','ㅎㅇㅎㅇ',33,0,0,'2017-05-11',33),(16,'큐아큐아','구민정',34,0,0,'2017-05-11',34),(16,'alswjd','123',34,1,1,'2017-05-11',35),(16,'큐아큐아','ㅎㅎ',36,0,0,'2017-05-11',36),(16,'큐아큐아','민정아안녕?',37,0,0,'2017-05-11',37),(16,'alswjd','',38,0,0,'2017-05-11',38),(16,'큐아큐아','바보야',37,1,5,'2017-05-11',39),(16,'alswjd','안녕못해여',37,1,2,'2017-05-11',40),(16,'큐아큐아','왜',37,2,3,'2017-05-11',41),(16,'큐아큐아','야이바보야',37,1,1,'2017-05-11',42),(16,'alswjd','언니바보\r\n',37,2,4,'2017-05-11',43),(16,'alswjd','삭제가안댑니다\r\n',44,0,0,'2017-05-11',44),(15,'큐아큐아','ㅋㅋ',45,0,0,'2017-05-11',45),(16,'큐아큐아','근데?',44,1,1,'2017-05-11',46),(15,'큐아큐아','ㅁㅎㅁㅎㅁㅎㅁㅎ',45,1,1,'2017-05-11',47),(17,'큐아큐아','zz',48,0,0,'2017-05-11',48),(17,'큐아큐아','gd',48,1,2,'2017-05-11',49),(17,'큐아큐아','gg',50,0,0,'2017-05-11',50),(17,'DELL','님 엑박이요.',51,0,0,'2017-05-11',51),(17,'DELL','엑박이요 2',51,1,1,'2017-05-11',52),(17,'DELL','tete test',48,2,4,'2017-05-11',53),(17,'DELL','tetetest',48,2,3,'2017-05-11',54),(17,'DELL','tetetest',48,1,1,'2017-05-11',55),(17,'DELL','test',51,2,3,'2017-05-11',56),(17,'DELL','tetetest',51,2,2,'2017-05-11',57),(17,'큐아큐아','누구?',51,3,4,'2017-05-11',58);
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
  `img_info` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('1','1','1',NULL,NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `love`
--

DROP TABLE IF EXISTS `love`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `love` (
  `num` int(20) NOT NULL,
  `nick` varchar(45) NOT NULL,
  `like_num` varchar(45) NOT NULL,
  PRIMARY KEY (`like_num`),
  KEY `fk_love_nick_idx` (`nick`),
  KEY `fk_love_num_idx` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `love`
--

LOCK TABLES `love` WRITE;
/*!40000 ALTER TABLE `love` DISABLE KEYS */;
INSERT INTO `love` VALUES (13,'김큐아','1'),(16,'DELL','10'),(12,'김큐아','2'),(10,'김큐아','3'),(16,'alswjd','5'),(16,'큐아큐아','6'),(15,'큐아큐아','7'),(17,'큐아큐아','8'),(17,'DELL','9');
/*!40000 ALTER TABLE `love` ENABLE KEYS */;
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
INSERT INTO `member` VALUES ('gnsgmlckdgk@naver.com','*D86533D15AD3FB652E16CE6E861706844E84714B','황창하','관리자1','남','56679F87612622E091DF7006F09C6805','2017-05-04 11:02:03','light-bulb-1173249_1920.jpg',0),('mdnnbm@gmail.com','*182EA09A38F1141B2D7916812BD097D51167C3E4','김형주','초천재','남','3C7D42044A9682CF20B24EA10620BF68','2017-05-04 13:51:54','남자 기본 프로필.png',0),('min8482@naver.com','*85489B5926D8DA80FC81B78DF27F7E87759E8C12','이승민','농부르기니','남','72F7809922636815ABB1795FF53A3B50','2017-05-10 16:45:04','남자 기본 프로필.png',0),('psw607me@naver.com','*76C16087B08659DDFC8458D7212500B660EA5C7A','박성우','DELL','남','42FCC8F524A9E5A4067437D8B1075AA6','2017-05-08 11:42:49','tumblr_n3d681N93e1r4s8who8_250.gif',0),('rbdk1219@gmail.com','*4F32438B891D61F56A23BB062801830BE6BC4F44','김규아','큐아큐아','남','B039F2E630F2431914BCC6E5CD9023AD','2017-05-11 09:44:34','남자 기본 프로필.png',1),('rbdk1219@hanmail.net','*4F32438B891D61F56A23BB062801830BE6BC4F44','김규아2','큐아큐아2','남','74168209CBF20BD172792846D72114D0','2017-05-11 09:57:45','남자 기본 프로필.png',1),('surulru44@naver.com','*ECCA27C55B58C1E5C95E2828653B1D1574BF3F33','su','susuu','여','BD233029E7E82A8A62981EC63A98751E','2017-05-08 20:07:55','남자 기본 프로필.png',0),('zlxl2723@naver.com','*2E9EDDA63BDD94510D729921B64E608409EFDFA9','구민정','alswjd','여','5269AA152A0B6B4CB078668FCD79C418','2017-05-11 11:11:45','여자 기본 프로필.png',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myplans`
--

LOCK TABLES `myplans` WRITE;
/*!40000 ALTER TABLE `myplans` DISABLE KEYS */;
INSERT INTO `myplans` VALUES (1,'kshing44@gmail.com',1,1,1,'1998-12-31','1998-12-31',1,'2',2.000000,3.000000,'1998-12-31','테스트 입력값들입니다.',0),(2,'kshing44@gmail.com',1,3,2,'1998-12-31','1998-12-31',2,'2',2.000000,3.000000,'1998-12-31','테스트 입력값들입니다.',0),(3,'kshing44@gmail.com',1,2,3,'1998-12-31','1998-12-31',3,'2',2.000000,3.000000,'1998-12-31','테스트 입력값들입니다.',0),(4,'kshing44@gmail.com',1,5,4,'1998-12-31','1998-12-31',4,'2',2.000000,3.000000,'1998-12-31','테스트 입력값들입니다.',0),(5,'kshing44@gmail.com',1,6,5,'1998-12-31','1998-12-31',5,'2',2.000000,3.000000,'1998-12-31','테스트 입력값들입니다.',0),(6,'mdnnbm@gmail.com',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(7,'mdnnbm@gmail.com',1,3,2,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,1),(8,'mdnnbm@gmail.com',1,2,3,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,1),(9,'mdnnbm@gmail.com',1,5,4,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,1),(10,'mdnnbm@gmail.com',1,6,5,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,1),(11,'kshing44@gmail.com',2,4,6,'1998-12-31','1998-12-31',1,'2',2.000000,3.000000,'1998-12-31','테스트 입력값들입니다.',0),(12,'kshing44@gmail.com',2,7,7,'1998-12-31','1998-12-31',2,'2',2.000000,3.000000,'1998-12-31','테스트 입력값들입니다.',0),(13,'kshing44@gmail.com',2,8,8,'1998-12-31','1998-12-31',3,'2',2.000000,3.000000,'1998-12-31','테스트 입력값들입니다.',0),(14,'kshing44@gmail.com',2,9,9,'1998-12-31','1998-12-31',4,'2',2.000000,3.000000,'1998-12-31','테스트 입력값들입니다.',0),(15,'kshing44@gmail.com',2,10,10,'1998-12-31','1998-12-31',5,'2',2.000000,3.000000,'1998-12-31','테스트 입력값들입니다.',0),(16,'kshing44@gmail.com',2,11,11,'1998-12-31','1998-12-31',6,'2',2.000000,3.000000,'1998-12-31','테스트 입력값들입니다.',0),(17,'mdnnbm@gmail.com',2,7,6,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0),(18,'mdnnbm@gmail.com',2,8,7,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,0),(19,'mdnnbm@gmail.com',2,9,8,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,0),(20,'mdnnbm@gmail.com',2,10,9,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,0),(21,'mdnnbm@gmail.com',2,11,10,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,0),(22,'mdnnbm@gmail.com',2,4,11,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(23,'psw607me@naver.com',0,11,1,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0),(24,'psw607me@naver.com',0,9,2,NULL,NULL,2,NULL,0.000000,0.000000,NULL,NULL,0),(25,'psw607me@naver.com',0,8,3,NULL,NULL,3,NULL,0.000000,0.000000,NULL,NULL,0),(26,'kshing44@gmail.com',0,10,12,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0),(27,'kshing44@gmail.com',0,11,13,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0),(28,'kshing44@gmail.com',0,8,14,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0),(29,'kshing44@gmail.com',0,9,15,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0),(30,'psw607me@naver.com',0,9,4,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0),(31,'psw607me@naver.com',0,10,5,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0),(32,'zlxl2723@naver.com',0,11,1,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0),(33,'zlxl2723@naver.com',0,10,2,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0),(34,'zlxl2723@naver.com',0,8,3,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0),(35,'surulru44@naver.com',0,11,1,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0),(36,'surulru44@naver.com',0,8,2,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0),(37,'surulru44@naver.com',0,6,3,NULL,NULL,0,NULL,0.000000,0.000000,NULL,NULL,0);
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
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`travel_id`),
  KEY `country_code` (`country_code`),
  KEY `city_code` (`city_code`),
  CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `temp`.`country` (`country_code`),
  CONSTRAINT `travel_ibfk_2` FOREIGN KEY (`city_code`) REFERENCES `temp`.`city` (`city_code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` VALUES (1,'p','kr','busan','자갈치',35.096706,129.030487,'부산 자갈치시장은 국제시장, 부평깡통시장과 함께 부산을 대표하는 전통시장이다. 자갈치 아지매로 상징되는 한국의 대표적인 어시장으로 부산의 관광 명소 중 하나이며, 회를 비롯한 다양한 해산물을 만날 수 있다.','부산광역시 중구 자갈치해안로 52',NULL),(2,'p','kr','busan','용두산',35.100647,129.032623,'용두산공원은 부산광역시 중구에 있는 공원으로 부산시설공단에서 관리하고 있다. 용두산으로 불리는 언덕이 공원이고, 정상에는 부산타워가 있다. 부산 남부의 남포동에 인접하고, 공원으로 올라가는 길은 대청동에서 중앙성당으로 올라가는 길이 있고, 중앙동에서 부산호텔 근처에서 올라가는 계단이 있고, 광복동에서는 에스컬레이터로 올라갈 수 있다. 부산항이나 영도를 바라볼 수 있고 또 부산타워의 아래에는 이순신의 동상이 우뚝 솟아 있다.','부산광역시 중구 광복동 용두산길 37-55',NULL),(3,'p','kr','busan','태종대',35.053280,129.087204,'태종대는 부산 영도구 동삼동에 있는 명승지이다. 영도의 남동쪽 끝에 위치하는 해발 고도 200m 이하의 구릉 지역으로, 부산 일대에서 보기 드문 울창한 숲과 기암 괴석으로 된 해식 절벽 및 푸른 바다 등이 조화를 이룬다. 맑은 날에는 일본 쓰시마섬도 볼 수 있다.','부산광역시 영도구 동삼2동 전망로 24',NULL),(4,'h','kr','busan','조선비치호텔',35.156189,129.153976,'조선비치호텔임당','부산광역시 해운대구 우1동 동백로 67',NULL),(5,'p','kr','busan','아이티윌',35.158409,129.062057,'컴퓨터','부산',NULL),(6,'p','kr','busan','부산시민공원',35.168442,129.057785,'부산시민공원은 대한민국 부산광역시 부산진구 범전동, 연지동 일원에 있는 공원이다. 면적은 528,278 ㎡이며, 기억, 문화, 즐거움, 자연, 참여의 5가지 테마로 구성되어 있다. 2010년 1월 27일 부산시청에서 주한 미군의 기지였던 캠프 하야리아의 부지를 반환받아 조성한 공원이다. 2011년 8월에 착공 하여 2014년 5월 1일 정식 개원하였다.','부산광역시 부산진구 범전동 시민공원로 73',NULL),(7,'p','kr','busan','이기대',35.117004,129.121750,'이기대도시자연공원은 장산봉과 바다로 이루어진 해상 자연공원이라 할 수 있다. 이기대라는 명칭이 불리어진 유래는 임진왜란 때 왜군들이 수영성을 함락하고 경치가 빼어난 이곳에서 잔치를 벌였는데 수영의 기생 두 사람이 잔치에 참가했다가 왜장에게\n술을 잔뜩 권해 술에 취한 왜장과 함께 물속에 빠져 죽었다고 전해지고, 그 두 기생의 시체가 이곳에 묻혀 있어 이 곳을 이기대라 불려지기 시작했다고 전해진다. 군사지역으로 통제되어오다가 1993년부터 일반시민에게 개방되었기 때문에 자연 생태 역시 아주 잘 보존되어 있다. 이기대는 거대한 바위들로 이루어져서 위험하게 보이지만 그 끝으로 잘 다듬어져 있는 공원산책길이 있다. 이 길이 있어 많은 사람들에게 안심을 하고 빼어난 절경을 감상할 수 있다','부산광역시 남구 용호3동 산25',NULL),(8,'p','kr','busan','해운대해수욕장',35.158726,129.160385,'해운대해수욕장은 대한민국 부산광역시 해운대구 우1동과 중1동에 걸쳐서 위치한 해수욕장이다. 모래사장의 총면적은 58,400㎡, 길이는 1.5 km, 폭은 30m ~ 50m 이다. 이 곳에는 300여개의 편의·숙박시설이 있고, 해수욕장의 가까운 부산조선비치호텔, 동백섬 누리마루 등이 있다. 개장기간은 6월초부터 9월말까지로, 피서객 인파가 2007년 1천 279만명이고, 2008년 1천 45만명으로 감소했다.','부산광역시 중동',NULL),(9,'p','kr','busan','오륙도 스카이워크',35.100594,129.124603,'오륙도 스카이워크의 옛 지명은 \'승두말\'이다. 승두말은 말안장처럼 생겼다고 「승두마」라고 부르는 것이 승두말로 되었으며 해녀들과 지역주민들은 「잘록개」라고 불렀다. 바다를 연모하는 승두말이 오륙도 여섯섬을 차례대로 순산하고 나서 승두말의 불룩했던 부분이 잘록하게 들어가 선창나루와 어귀의 언덕을 만들었다는 것이다. 동해와 남해의 경계지점이기도 한 이곳 승두말에 2012년 9월 12일에 착공하여 2013년 10월 18일 개장하면서 \'하늘위를 걷는다\'는 의미를 담아 \'오륙도 스카이워크\'라 이름하였다. 스카이워크는 35M 해안절벽 위에 철제빔을 설치하고 그 위에 유리판 24개를 말발굽형으로 이어놓은 15M의 유리다리이다. 바닥유리는 12mm유리판 4장에 방탄필름을 붙혀 특수 제작한 두께 55.49mm의 고하중 방탄유리로 \'안전하게 설계되었다.\' 발 아래 투명유리를 통해 파도가 절벽을 때리는 모습은 현기증이 날 정도로 아찔함을 느끼게 한다. 스카이워크 앞에 펼쳐진 바다는 시시때때로 아름답고 다채로운 색상을 연출하고 있어 사진촬영의 명소이며, 날씨가 좋은 날에는 대마도를 가장 가까이 볼 수 있는 곳이다.','부산광역시 남구 용호2동 오륙도로 137',NULL),(10,'p','kr','busan','어린이대공원',35.185322,129.042343,'1909년 성지곡수원지가 준공되고 1971년 5월 10일 백양산에 위치한 성지곡수원지 일대를 하나로 묶어 성지곡 유원지로 개장하였다. 1975년 6월 12일부터 12세 이상에게 입장료를 징수하기 시작하였다. 1978년 어린이날에 오늘날의 어린이대공원으로 이름을 바꾸었고, 1978년 9월 28일 정식으로 공원결정(건설부 제279호)이 내려졌다. 2005년 1월 1일부터 입장료가 무료화되었다. 2014년 4월 25일, 2004년 11월에 착수하였다가 2011년 9월에 일시 중단된 뒤 2012년 9월 삼정기업이 참여하여 공사가 재개된 동물원 리모델링 사업이 완료되어, 동물원이 삼정 더파크라는 이름으로 재개장하였다. 동물원의 입장료는 유료이다. 부산 어린이대공원은 자연의 조화와 더불어 부산시민들의 안식처가 되었다.','부산광역시 부산진구 초읍동 645-58',NULL),(11,'p','kr','busan','성지곡수원지',35.185959,129.041931,'구 성지곡수원지는 부산광역시 부산진구에 있는 저수지이다. 2008년 7월 3일 대한민국의 등록문화재 제376호로 지정되었다. 서울의 뚝도수원지에 이어 한국에서 두 번째로 설치된 수원시설이며 집수와 저수, 침전, 여과지로 향한 도수로 등이 거의 원형 그대로 보존되어 있다. 동천의 발원지이다','부산광역시 부산진구 초읍동 43',NULL);
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

-- Dump completed on 2017-05-11 12:21:57
