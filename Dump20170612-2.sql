-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 192.168.2.17    Database: tomcat
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
  `location` varchar(45) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `fk_board_nick_idx` (`nick_name`),
  CONSTRAINT `fk_board_nick` FOREIGN KEY (`nick_name`) REFERENCES `member` (`nick`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'부산여행 같이가실분','이름:이승민\r\n나이:21\r\n여행지:부산\r\n꿀잼 부산 여행 아쿠아리움 ㄹㅇ 가고싶어요!\r\n		',0,0,'2017-06-07 19:36:26',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(2,'서울여행 같이가실분!','이름:이승만\r\n나이:22\r\n여행지:서울\r\n서울 여행 같이 가실분!! 숭례문 가보고싶어요~\r\n		',0,0,'2017-06-07 19:36:58',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(3,'안동여행가실분','이름:이승마이\r\n나이:213\r\n여행지:안동\r\n		안동찜닭 먹고싶어요~',0,0,'2017-06-07 19:37:24',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(4,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:30',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(5,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:33',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(6,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:36',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(7,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:37',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(8,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:39',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(9,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:40',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(10,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:42',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(11,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:43',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(12,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:45',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(13,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:47',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(14,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:48',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(15,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:50',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(16,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:51',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(17,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:53',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(18,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:54',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(19,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:56',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(20,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:37:58',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(21,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:00',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(22,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:02',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(23,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:03',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(24,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:06',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(25,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:15',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(26,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:17',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(27,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:19',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(28,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:21',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(29,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:22',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(30,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:24',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(32,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:27',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(33,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:28',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(34,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:30',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(35,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:32',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(36,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:34',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(37,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:35',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(38,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:37',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(39,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:40',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(40,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:41',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(41,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:43',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(42,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:45',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(43,'fgfg','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-07 19:38:46',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(44,'서울여행 같이가실분!','이름:이승민\r\n나이:21\r\n여행지:서울\r\n숭례문 가보고 싶어요 빠셍\r\n		',0,0,'2017-06-07 19:40:42',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(45,'부산여행 가실분~','이름:이승마이\r\n나이:22\r\n여행지:부산 \r\n		아쿠아리움 가서 상어들 보고싶네요 빠셍',0,0,'2017-06-07 19:41:07',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(46,'함께가요','이름:구민정\r\n나이:25\r\n여행지:런던\r\n~__________~	',0,0,'2017-06-07 19:41:28',NULL,NULL,'우히히',NULL,'35.1544453, 129.060646',NULL),(47,'미국여행가실분','이름:이승민이\r\n나이:23\r\n여행지:미국 로스산토스\r\n로스산토스에서 산뜻한 토스트 먹고싶어요~같이갈사람\r\n		',0,0,'2017-06-07 19:41:48',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL),(48,'부산에서 노실분~~','이름:김규아\r\n나이:27\r\n여행지:부산\r\n같이 여행해요~~\r\n		',0,0,'2017-06-07 19:42:34',NULL,NULL,'우히히',NULL,'35.1544453, 129.060646',NULL),(49,'','이름:\r\n나이:\r\n여행지:\r\n		',0,0,'2017-06-08 10:48:39',NULL,NULL,'농부르기니',NULL,'35.1544453, 129.060646',NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_reply`
--

DROP TABLE IF EXISTS `board_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_reply` (
  `num` int(11) DEFAULT NULL,
  `nick` varchar(11) DEFAULT NULL,
  `content` varchar(3000) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `re_num` int(11) NOT NULL,
  PRIMARY KEY (`re_num`),
  KEY `fk_board_reply_idx` (`nick`),
  CONSTRAINT `fk_board_reply_nick` FOREIGN KEY (`nick`) REFERENCES `member` (`nick`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_reply`
--

LOCK TABLES `board_reply` WRITE;
/*!40000 ALTER TABLE `board_reply` DISABLE KEYS */;
INSERT INTO `board_reply` VALUES (0,'농부르기니',NULL,1,0,0,'2017-06-12 02:12:44',1),(0,'농부르기니',NULL,2,0,0,'2017-06-12 02:13:52',2),(0,'농부르기니',NULL,3,0,0,'2017-06-12 02:13:56',3),(0,NULL,NULL,4,0,0,'2017-06-12 02:15:18',4),(0,NULL,NULL,5,0,0,'2017-06-12 02:43:16',5),(0,NULL,NULL,6,0,0,'2017-06-12 02:44:45',6),(0,NULL,NULL,7,0,0,'2017-06-12 02:45:00',7),(0,NULL,NULL,8,0,0,'2017-06-12 02:51:03',8),(0,NULL,NULL,9,0,0,'2017-06-12 02:53:14',9),(0,'농부르기니',NULL,10,0,0,'2017-06-12 02:54:39',10),(0,NULL,NULL,11,0,0,'2017-06-12 03:19:29',11),(0,NULL,NULL,12,0,0,'2017-06-12 03:22:23',12),(0,NULL,NULL,13,0,0,'2017-06-12 03:24:41',13),(55,'농부르기니',' ',14,0,0,'2017-06-12 04:54:14',14),(55,'농부르기니',' ',15,0,0,'2017-06-12 04:54:40',15),(55,'농부르기니',' ㅁㄴㅇㅁㄴㅇ',16,0,0,'2017-06-12 04:54:47',16),(55,'농부르기니',' ㄷㄹㅇㄹ',17,0,0,'2017-06-12 05:22:05',17),(55,'농부르기니',' ㅇㄹ',18,0,0,'2017-06-12 05:24:03',18),(55,'농부르기니','안녕하세요',19,0,0,'2017-06-12 05:24:49',19),(55,'농부르기니',' ㅇㄹㄴㅇㄹㄴㅇㄹ',20,0,0,'2017-06-12 05:31:58',20),(55,'농부르기니',' ㅇㅀㅀ',21,0,0,'2017-06-12 05:32:23',21),(55,'큐아큐아',' 안뇽?',22,0,0,'2017-06-12 05:40:40',22),(54,'큐아큐아',' 하이룽',23,0,0,'2017-06-12 05:40:59',23),(55,'농부르기니',' adfdaf',24,0,0,'2017-06-12 05:54:48',24),(55,'농부르기니',' ',25,0,0,'2017-06-12 05:59:48',25),(47,NULL,' ',26,0,0,'2017-06-12 06:13:36',26),(55,'큐아큐아',' gd',27,0,0,'2017-06-12 06:25:56',27),(55,'큐아큐아',' 하이룽~',28,0,0,'2017-06-12 06:52:00',28),(55,NULL,' ㅁㅁㅇㄻㅁㅇ',29,0,0,'2017-06-12 06:52:01',29),(55,NULL,' ',30,0,0,'2017-06-12 07:01:54',30),(55,NULL,' 댓글이 넘어오나 테스트.',31,0,0,'2017-06-12 07:05:17',31),(55,NULL,' ㅁㄴㅇㅁㄴㅇ',32,0,0,'2017-06-12 07:05:52',32),(55,NULL,' sdfsdf',33,0,0,'2017-06-12 07:07:44',33),(55,NULL,' adfdafdafadf\r\n',34,0,0,'2017-06-12 07:08:15',34),(55,'큐아큐아',' gd',35,0,0,'2017-06-12 07:12:32',35),(55,'큐아큐아',' gd',36,0,0,'2017-06-12 07:13:31',36),(55,NULL,' ghh',37,0,0,'2017-06-12 07:13:50',37),(55,NULL,' ㅠㅠ봐도 잘모르겠어요.. ',38,0,0,'2017-06-12 07:14:32',38),(55,NULL,' 하루종일 이것만 들여다보는데',39,0,0,'2017-06-12 07:15:02',39),(55,NULL,' ㅅㄷㄴㅅ',40,0,0,'2017-06-12 07:16:03',40),(55,NULL,' ',41,0,0,'2017-06-12 07:21:25',41),(55,NULL,' ',42,0,0,'2017-06-12 07:31:43',42),(55,NULL,' sdasdas',43,0,0,'2017-06-12 07:34:30',43),(55,NULL,' asaf',44,0,0,'2017-06-12 08:24:42',44);
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
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country` (`country_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('andong','안동','안동','kr','andong'),('busan','부산','부산~','kr','busan'),('cebu','세부','세부세부세부','ph','cebu'),('daegu','대구','대구대구대구','kr','daegu'),('jeju','제주','제주도 테스트\r<br>제주도 테스트\r<br>제주도 테스트\r<br>제주도 테스트\r<br>제주도 테스트\r<br>제주도 테스트\r<br>제주도 테스트\r<br>제주도 테스트\r<br>제주도 테스트','kr','jeju'),('london','런던','영국의 수도. 대체로 미국의 뉴욕, 일본의 도쿄와 더불어 2016년 현재 세계 3대 대도시로 손꼽힌다. 일본 모리 메모리얼 재단(MMF)의 도시 전략 연구소에서 세계 40대 도시를 대상으로 도시의 종합 능력을 평가한 \'파워 시티\' 랭킹을 매기는데 2012년~2015년 4년 연속으로 1위를 차지했다. 사실상 자본주의와 산업혁명의 발상지이기도 하며 뉴욕 월스트리트와 더불어 세계 금융의 심장 역할을 하고 있다. 전 세계 모든 외환 거래의 40%가 이뤄지는데 이러한 경제 규모를 내세워 세계 경제를 좌우하고 있다. 지리학적으로도 런던은 매우 중요한데 경도의 기준선인 0도선이 구 그리니치 천문대를 지나며 협정 세계시의 기준선이 된다. 말 그대로 세계 시간의 중심인 셈.','uk','london'),('newyork','뉴욕','뉴욕은 미국 북동부, 뉴욕 주의 남쪽 끝에 있는 도시이다. 미국에서 가장 인구가 많은 도시로, 세계에서 가장 인구가 많은 도시 중 하나이다. 세계적인 대도시인 뉴욕은 상업, 금융, 미디어, 예술, 패션, 연구, 기술, 교육, 엔터테인먼트 등 많은 분야에 걸쳐 큰 영향을 끼치고 있으며, 세계의 문화 수도로 불리기도 한다. 이 외에도 뉴욕은 국제 외교에서 중요한 도시이며, 국제 연합 본부가 위치하고 있다.\r\n하이룽','usa','newyork'),('nice','니스','니스','fr','nice'),('osaka','오사카','오사카','jp','osaka'),('paris','파리','파리','fr','paris'),('seoul','서울','한반도의 중서부에 자리하고 있다. 정치·경제·사회·문화와 도로·철도·항공 교통의 중심지이자 구심점이며 세계도시로 발돋움하고 있다. 면적은 605.25㎢로 인구밀도가 매우 높아 인구수가 1,019만 5,318명(2013 추계)에 달한다. ','kr','seoul'),('tokyo','도쿄','東京','jp','tokyo');
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
INSERT INTO `country` VALUES ('ca','캐나다','캐나다','north','canada'),('fi','피지','피지','oceania','fiji'),('fr','프랑스','프랑스 프상으','europe','france'),('ja','자메이카','자메이카','south','jameica'),('jp','일본','일본','asia','japan'),('kr','대한민국','대한민국 만세~','asia','korea'),('nz','뉴질랜드','뉴질랜드','oceania','new zealand'),('ph','필리핀','필리핀','asia','philippines'),('sp','스페인','스페인','europe','spain'),('tw','대만','대만','asia','taiwan'),('uk','영국','북해의 서쪽에 위치해 대서양으로 미국 및 캐나다 등 아메리카와 마주보고 있는 서유럽의 나라. 한때는 해가 지지 않는 나라라는 별명이 있었다.','europe','United Kingdom'),('usa','미국','미국','north','USA');
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
  `content` varchar(500) DEFAULT NULL,
  `image1` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `love` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram`
--

LOCK TABLES `gram` WRITE;
/*!40000 ALTER TABLE `gram` DISABLE KEYS */;
INSERT INTO `gram` VALUES (1,'큐아큐아','발리 쿠타비치','발리에 있는 쿠타비치에 다녀왔는데 쌔까맣게 탔어요\r\n그래도 추천합니다~','11.jpg','2017-06-12',0),(2,'큐아큐아','골드코스트','호주에 골드코스트에 다녀왔습니다.\r\n쌔까맣게 탔습니다.\r\n하지만 왕추천\r\n세계에서 가장 긴 해안 top 10안에 드는곳이라고하네요~','21.jpg','2017-06-12',0),(3,'큐아큐아','구민정','오늘 학원앞에서 커피를 마시고있는 북극곰을 발견했습니다.\r\n정말 귀여웠어요~','131.png','2017-06-12',0),(4,'큐아큐아','금문교(샌프란시스코)','샌프란시스코 금문교 갔다왔어요~\r\n거가대교만큼은 아니었지만 멋있었어요^^','81.png','2017-06-12',0),(5,'큐아큐아','베네치아','신혼여행으로 가 아닌! 배낭여행으로~ 베네치아^^\r\n왕추천~','111.png','2017-06-12',1),(6,'큐아큐아','스위스~','스위스에서 시계만들어 왔어요\r\n사실분?','51.jpg','2017-06-12',0);
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
  `nick` varchar(20) DEFAULT NULL,
  `content` varchar(3000) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `re_num` int(11) NOT NULL,
  PRIMARY KEY (`re_num`),
  KEY `fk_gr_num_idx` (`num`),
  CONSTRAINT `fk_gr_num` FOREIGN KEY (`num`) REFERENCES `gram` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION
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
  `num` int(11) NOT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `city_code` varchar(20) DEFAULT NULL,
  `travel_id` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `info` varchar(2000) DEFAULT NULL,
  `file` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (2,'fr','nice',0,NULL,'니스','니스의 사진','fr\\nice.jpg'),(3,'fr','paris',0,NULL,'파리','파리의 사진','fr\\paris.jpg'),(5,'kr','busan',0,NULL,'부산','부산','kr\\busan.jpg'),(6,'ph','cebu',0,NULL,'세부','세부','ph\\cebu.jpg'),(7,'kr','daegu',0,NULL,'대구','대구','kr\\daegu.jpg'),(8,'kr','jeju',0,NULL,'제주','제주','kr\\jeju.jpg'),(10,'usa','newyork',0,NULL,'뉴욕','뉴욕','usa\\newyork.jpg'),(12,'kr','seoul',0,NULL,'서울','서울','kr\\seoul.jpg'),(13,'jp','tokyo',0,NULL,'도쿄','도쿄','jp\\tokyo.jpg'),(14,'jp','osaka',0,NULL,'오사카','오사카','jp\\osaka.jpg'),(19,'kr','busan',1,'p','자갈치','자갈치 이미지','kr\\busan\\1.jpg'),(20,'kr','busan',2,'p','용두산','용두산 이미지','kr\\busan\\2.jpg'),(21,'kr','andong',0,NULL,'안동','안동의 사진','kr\\andong.jpg');
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
  `like_num` int(20) NOT NULL,
  PRIMARY KEY (`like_num`),
  KEY `fk_love_nick_idx` (`nick`),
  KEY `fk_num_love_idx` (`num`),
  CONSTRAINT `fk_num_gram` FOREIGN KEY (`num`) REFERENCES `gram` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `love`
--

LOCK TABLES `love` WRITE;
/*!40000 ALTER TABLE `love` DISABLE KEYS */;
INSERT INTO `love` VALUES (5,'큐아큐아',1);
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
  `gold` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('dohauzi@gmail.com','84c45e72ebff7042e000b2bfd67b22367b18ddcb723ce4c32f9f1b2064999e08','황창하','운영자친구3','남','56679F87612622E091DF7006F09C6805','2017-05-17 18:37:12','GIF테스트프로필.gif',1,0),('gnsgmlckdgk@naver.com','84c45e72ebff7042e000b2bfd67b22367b18ddcb723ce4c32f9f1b2064999e08','황창하','관리자임','남','56679F87612622E091DF7006F09C6805','2017-05-04 11:02:03','러시아의_버스.gif',0,1),('ksoksoksoksokso@daum.net','84c45e72ebff7042e000b2bfd67b22367b18ddcb723ce4c32f9f1b2064999e08','황창하','아휴','남','7D5F23D893370EE5B72A0F5A2269A4DF','2017-06-08 12:45:49','basic/man.png',1,0),('mdnnbm@gmail.com','84c45e72ebff7042e000b2bfd67b22367b18ddcb723ce4c32f9f1b2064999e08','김형주','빠샤','남','3C7D42044A9682CF20B24EA10620BF68','2017-05-17 15:18:40','e84Rk5.gif',0,0),('min8482@naver.com','fefd3020b493c1daf84b202323162bb0daf6bc9fed5fe02e0c5fca09374a77b7','이승민','농부르기니','남','72F7809922636815ABB1795FF53A3B50','2017-05-10 16:45:04','pl.png',0,1),('overtimearmy@gmail.com','0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c','김형주','이미사용중인아이디','남','3C7D42044A9682CF20B24EA10620BF68','2017-05-11 16:36:34','asian-1239271_1280.jpg',1,0),('psw607me@naver.com','76bab707d072fce30de610a3d66e6b4aa73a3bf87449af1a41418d3cda1326ed','박성우','DELL','남','42FCC8F524A9E5A4067437D8B1075AA6','2017-05-08 11:42:49','giphy1.gif',0,0),('rbdk1219@gmail.com','0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c','김규아','큐아큐아','남','B039F2E630F2431914BCC6E5CD9023AD','2017-05-11 09:44:34','man.png',0,0),('rbdk1219@hanmail.net','0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c','김규아2','큐아큐아2','남','74168209CBF20BD172792846D72114D0','2017-05-11 09:57:45','man.png',0,0),('surulru44@naver.com','0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c','su','susuu','여','BD233029E7E82A8A62981EC63A98751E','2017-05-08 20:07:55','woman.png',0,0),('zlxl2723@naver.com','0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c','구민정','우히히','여','5269AA152A0B6B4CB078668FCD79C418','2017-05-11 11:11:45','woman.png',0,0);
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
  `id` varchar(30) DEFAULT NULL,
  `plan_nr` varchar(2000) DEFAULT NULL,
  `travel_id` int(11) DEFAULT NULL,
  `item_nr` varchar(2000) DEFAULT NULL,
  `firstday` varchar(20) DEFAULT NULL,
  `lastday` varchar(20) DEFAULT NULL,
  `day_nr` varchar(2000) DEFAULT NULL,
  `day_night` char(2) DEFAULT NULL,
  `user_lat` float(10,6) DEFAULT NULL,
  `user_lng` float(10,6) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `memo` varchar(3000) DEFAULT NULL,
  `plan_done_nr` int(11) DEFAULT NULL,
  PRIMARY KEY (`myplans_id`),
  KEY `f_myplans_id_idx` (`id`),
  KEY `fk_myplans_travel_idx` (`travel_id`),
  CONSTRAINT `f_myplans_id` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_myplans_travel` FOREIGN KEY (`travel_id`) REFERENCES `travel` (`travel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myplans`
--

LOCK TABLES `myplans` WRITE;
/*!40000 ALTER TABLE `myplans` DISABLE KEYS */;
INSERT INTO `myplans` VALUES (97,'psw607me@naver.com','1@',8,'1@','2017-06-13','2017-06-13','1@',NULL,0.000000,0.000000,NULL,NULL,0),(98,'psw607me@naver.com',NULL,10,NULL,NULL,NULL,NULL,NULL,0.000000,0.000000,NULL,NULL,0),(99,'psw607me@naver.com','1@',9,'2@','2017-06-13','2017-06-13','1@',NULL,0.000000,0.000000,NULL,NULL,0),(107,'rbdk1219@gmail.com',NULL,4,'1',NULL,NULL,NULL,NULL,0.000000,0.000000,NULL,NULL,0),(108,'rbdk1219@gmail.com',NULL,37,'2',NULL,NULL,NULL,NULL,0.000000,0.000000,NULL,NULL,0),(109,'rbdk1219@gmail.com',NULL,36,'3',NULL,NULL,NULL,NULL,0.000000,0.000000,NULL,NULL,0),(110,'rbdk1219@gmail.com',NULL,35,'4',NULL,NULL,NULL,NULL,0.000000,0.000000,NULL,NULL,0),(113,'mdnnbm@gmail.com','1@',36,'1@','2017-06-12','2017-06-14','1@',NULL,0.000000,0.000000,NULL,NULL,0),(114,'mdnnbm@gmail.com','1@',35,'3@','2017-06-12','2017-06-14','1@',NULL,0.000000,0.000000,NULL,NULL,0),(115,'mdnnbm@gmail.com','1@1@',34,'2@1@','2017-06-12','2017-06-14','1@2@',NULL,0.000000,0.000000,NULL,NULL,0),(116,'mdnnbm@gmail.com','1@1@',11,'2@1@','2017-06-12','2017-06-14','2@3@',NULL,0.000000,0.000000,NULL,NULL,0),(117,'mdnnbm@gmail.com',NULL,37,'5',NULL,NULL,NULL,NULL,0.000000,0.000000,NULL,NULL,0),(138,'min8482@naver.com',NULL,37,'1',NULL,NULL,NULL,NULL,0.000000,0.000000,NULL,NULL,0),(146,'zlxl2723@naver.com','1@1@1@',20,'1@1@1@','2017-06-13','2017-06-15','1@2@3@',NULL,0.000000,0.000000,NULL,NULL,0),(147,'zlxl2723@naver.com','1@1@1@',18,'2@2@2@','2017-06-13','2017-06-15','1@2@3@',NULL,0.000000,0.000000,NULL,NULL,0),(148,'zlxl2723@naver.com','1@1@1@',19,'3@3@3@','2017-06-13','2017-06-15','1@2@3@',NULL,0.000000,0.000000,NULL,NULL,0),(149,'zlxl2723@naver.com',NULL,14,'4',NULL,NULL,NULL,NULL,0.000000,0.000000,NULL,NULL,0),(151,'gnsgmlckdgk@naver.com',NULL,35,'2',NULL,NULL,NULL,NULL,0.000000,0.000000,NULL,NULL,0),(152,'gnsgmlckdgk@naver.com','2@',36,'1@','2017-06-12','2017-06-13','1@',NULL,0.000000,0.000000,NULL,NULL,0),(153,'gnsgmlckdgk@naver.com','2@',34,'1@','2017-06-12','2017-06-13','2@',NULL,0.000000,0.000000,NULL,NULL,0),(154,'gnsgmlckdgk@naver.com','2@',11,'2@','2017-06-12','2017-06-13','2@',NULL,0.000000,0.000000,NULL,NULL,0);
/*!40000 ALTER TABLE `myplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nation_comment`
--

DROP TABLE IF EXISTS `nation_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nation_comment` (
  `num` int(11) NOT NULL,
  `nation` varchar(30) DEFAULT NULL,
  `nation_num` int(11) NOT NULL,
  `nick` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `eval` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `nick` (`nick`),
  CONSTRAINT `nation_comment_ibfk_1` FOREIGN KEY (`nick`) REFERENCES `member` (`nick`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nation_comment`
--

LOCK TABLES `nation_comment` WRITE;
/*!40000 ALTER TABLE `nation_comment` DISABLE KEYS */;
INSERT INTO `nation_comment` VALUES (1,'대한민국',1,'관리자임','2017-05-26 10:31:21',1,'테스트'),(2,'대한민국',2,'관리자임','2017-05-26 10:31:47',1,'테스트2'),(3,'대한민국',3,'관리자임','2017-05-26 10:33:33',1,'테스트3'),(4,'대한민국',4,'관리자임','2017-05-26 10:50:17',2,'ㅏㅏㅏ'),(5,'일본',1,'관리자임','2017-05-26 10:50:45',0,'테스트~'),(6,'대한민국',5,'관리자임','2017-05-26 12:44:10',0,'대한민국'),(7,'대한민국',6,'관리자임','2017-05-26 17:43:19',3,'헬조선~\n입니다'),(8,'대한민국',7,'운영자친구3','2017-05-29 11:07:02',1,'테스트~'),(9,'대한민국',8,'관리자임','2017-05-29 11:09:52',1,'테스트23'),(14,'대만',1,'농부르기니','2017-06-02 08:55:50',1,'sdafdafdaf'),(15,'대한민국',13,'DELL','2017-06-02 09:46:25',1,'승민이집 좋아요'),(16,'대한민국',14,'관리자임','2017-06-02 17:49:41',2,'aaa'),(17,'자메이카',1,'농부르기니','2017-06-05 11:23:48',1,'자메이카 통다리구이 개굳'),(18,'대한민국',15,'아휴','2017-06-08 12:46:26',1,'탈퇴 테스트\nforeign key no action');
/*!40000 ALTER TABLE `nation_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qanda`
--

DROP TABLE IF EXISTS `qanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qanda` (
  `num` int(11) NOT NULL,
  `nick` varchar(45) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `image1` varchar(200) DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `fk_qna_nick_idx` (`nick`),
  CONSTRAINT `fk_qna_nick` FOREIGN KEY (`nick`) REFERENCES `member` (`nick`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qanda`
--

LOCK TABLES `qanda` WRITE;
/*!40000 ALTER TABLE `qanda` DISABLE KEYS */;
INSERT INTO `qanda` VALUES (1,'큐아큐아','1',1,0,0,'2017-05-30','1',NULL,2),(2,'큐아큐아','2',2,0,0,'2017-05-30','2',NULL,4),(3,'큐아큐아','3',3,0,0,'2017-05-30','3',NULL,6),(4,'큐아큐아','2-1',2,1,2,'2017-05-30','2-1',NULL,1),(5,'큐아큐아','2-2',2,1,1,'2017-05-30','2-2',NULL,1),(6,'큐아큐아','2-1-1',2,2,3,'2017-05-30','2-1-1',NULL,2),(7,'DELL','댓글도 되나요',7,0,0,'2017-05-30','테테테테테테테테테테사다르','emoticons_2.png',7),(10,'우히히','아니요',7,1,1,'2017-05-30','글씁니다',NULL,2),(11,'우히히','답글',1,1,1,'2017-05-30','답글답글',NULL,0),(12,'농부르기니','jhjhj',12,0,0,'2017-06-01','h',NULL,22),(13,'큐아큐아','gdgdg',13,0,0,'2017-06-02','gdgd','AlphbetS.png',247),(14,'큐아큐아','gd',13,1,1,'2017-06-02','gd',NULL,4),(15,'큐아큐아','ㅎㅇㅎㅇ',15,0,0,'2017-06-05','ㅎㅇㅎㅇ','AlphbetE.png',57);
/*!40000 ALTER TABLE `qanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_comment`
--

DROP TABLE IF EXISTS `region_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_comment` (
  `num` int(11) NOT NULL,
  `region` varchar(30) DEFAULT NULL,
  `region_num` int(11) NOT NULL,
  `nick` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `eval` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `nick` (`nick`),
  CONSTRAINT `region_comment_ibfk_1` FOREIGN KEY (`nick`) REFERENCES `member` (`nick`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_comment`
--

LOCK TABLES `region_comment` WRITE;
/*!40000 ALTER TABLE `region_comment` DISABLE KEYS */;
INSERT INTO `region_comment` VALUES (1,'부산',1,'susuu','2017-05-30 09:48:16',1,'!!'),(2,'부산',2,'DELL','2017-05-30 10:48:22',1,'busaner'),(3,'런던',1,'관리자임','2017-06-02 11:48:33',1,'런던 좋아!!@#@!'),(4,'부산',3,'운영자친구3','2017-06-08 17:27:38',1,'굿');
/*!40000 ALTER TABLE `region_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `souvenir`
--

DROP TABLE IF EXISTS `souvenir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `souvenir` (
  `num` int(11) NOT NULL,
  `sou_name` varchar(45) NOT NULL,
  `city_code` varchar(45) NOT NULL,
  `sou_img` varchar(45) DEFAULT NULL,
  `ranking` int(11) NOT NULL,
  `info` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `sou_fk_idx` (`city_code`),
  CONSTRAINT `sou_fk` FOREIGN KEY (`city_code`) REFERENCES `city` (`city_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `souvenir`
--

LOCK TABLES `souvenir` WRITE;
/*!40000 ALTER TABLE `souvenir` DISABLE KEYS */;
INSERT INTO `souvenir` VALUES (1,'부산어묵','busan','10716521079_20161201194805.jpg',1,'부산어묵\r\n'),(2,'로이스','busan','%BF%C0%B7%B9.jpg',2,'로이스 초콜릿'),(3,'고등어인형','busan','DSC09154.jpg',3,'발달린 꼬등어');
/*!40000 ALTER TABLE `souvenir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spot_comment`
--

DROP TABLE IF EXISTS `spot_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spot_comment` (
  `num` int(11) NOT NULL,
  `spot` varchar(30) DEFAULT NULL,
  `spot_num` int(11) NOT NULL,
  `nick` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `eval` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `nick` (`nick`),
  CONSTRAINT `spot_comment_fk` FOREIGN KEY (`nick`) REFERENCES `member` (`nick`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spot_comment`
--

LOCK TABLES `spot_comment` WRITE;
/*!40000 ALTER TABLE `spot_comment` DISABLE KEYS */;
INSERT INTO `spot_comment` VALUES (1,'자연사 박물관',1,'우히히','2017-06-07 09:57:26',1,'테스트'),(2,'자연사 박물관',2,'우히히','2017-06-07 17:57:42',1,'조아요'),(3,'자연사 박물관',3,'우히히','2017-06-07 18:18:39',1,'ㄴㅇㄹ'),(4,'자연사 박물관',4,'우히히','2017-06-07 18:21:11',1,'테스트\n'),(5,'자연사 박물관',5,'우히히','2017-06-07 18:22:50',3,'별로에요'),(6,'자연사 박물관',6,'우히히','2017-06-07 18:22:56',3,'우히히'),(7,'자연사 박물관',7,'우히히','2017-06-07 18:23:04',3,'리뷰'),(8,'자연사 박물관',8,'우히히','2017-06-07 18:24:13',3,'별루');
/*!40000 ALTER TABLE `spot_comment` ENABLE KEYS */;
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
  KEY `travel_ibfk2_idx` (`city_code`),
  KEY `travel_ibfk1_idx` (`country_code`),
  CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country` (`country_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `travel_ibfk_2` FOREIGN KEY (`city_code`) REFERENCES `city` (`city_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` VALUES (1,'p','kr','busan','자갈치',35.096706,129.030487,'부산 자갈치시장은 국제시장, 부평깡통시장과 함께 부산을 대표하는 전통시장이다. 자갈치 아지매로 상징되는 한국의 대표적인 어시장으로 부산의 관광 명소 중 하나이며, 회를 비롯한 다양한 해산물을 만날 수 있다.~','부산광역시 중구 자갈치해안로 52',''),(2,'p','kr','busan','용두산',35.100647,129.032623,'용두산공원은 부산광역시 중구에 있는 공원으로 부산시설공단에서 관리하고 있다. 용두산으로 불리는 언덕이 공원이고, 정상에는 부산타워가 있다. 부산 남부의 남포동에 인접하고, 공원으로 올라가는 길은 대청동에서 중앙성당으로 올라가는 길이 있고, 중앙동에서 부산호텔 근처에서 올라가는 계단이 있고, 광복동에서는 에스컬레이터로 올라갈 수 있다. 부산항이나 영도를 바라볼 수 있고 또 부산타워의 아래에는 이순신의 동상이 우뚝 솟아 있다.','부산광역시 중구 광복동 용두산길 37-55',''),(3,'p','kr','busan','태종대',35.053280,129.087204,'태종대는 부산 영도구 동삼동에 있는 명승지이다. 영도의 남동쪽 끝에 위치하는 해발 고도 200m 이하의 구릉 지역으로, 부산 일대에서 보기 드문 울창한 숲과 기암 괴석으로 된 해식 절벽 및 푸른 바다 등이 조화를 이룬다. 맑은 날에는 일본 쓰시마섬도 볼 수 있다.','부산광역시 영도구 동삼2동 전망로 24',''),(4,'h','kr','busan','조선비치호텔',35.156189,129.153976,'조선비치호텔임당','부산광역시 해운대구 우1동 동백로 67',''),(5,'p','kr','busan','아이티윌',35.158409,129.062057,'컴퓨터','부산',''),(6,'p','kr','busan','부산시민공원',35.168442,129.057785,'부산시민공원은 대한민국 부산광역시 부산진구 범전동, 연지동 일원에 있는 공원이다. 면적은 528,278 ㎡이며, 기억, 문화, 즐거움, 자연, 참여의 5가지 테마로 구성되어 있다. 2010년 1월 27일 부산시청에서 주한 미군의 기지였던 캠프 하야리아의 부지를 반환받아 조성한 공원이다. 2011년 8월에 착공 하여 2014년 5월 1일 정식 개원하였다.','부산광역시 부산진구 범전동 시민공원로 73',''),(7,'p','kr','busan','이기대',35.117004,129.121750,'이기대도시자연공원은 장산봉과 바다로 이루어진 해상 자연공원이라 할 수 있다. 이기대라는 명칭이 불리어진 유래는 임진왜란 때 왜군들이 수영성을 함락하고 경치가 빼어난 이곳에서 잔치를 벌였는데 수영의 기생 두 사람이 잔치에 참가했다가 왜장에게\n술을 잔뜩 권해 술에 취한 왜장과 함께 물속에 빠져 죽었다고 전해지고, 그 두 기생의 시체가 이곳에 묻혀 있어 이 곳을 이기대라 불려지기 시작했다고 전해진다. 군사지역으로 통제되어오다가 1993년부터 일반시민에게 개방되었기 때문에 자연 생태 역시 아주 잘 보존되어 있다. 이기대는 거대한 바위들로 이루어져서 위험하게 보이지만 그 끝으로 잘 다듬어져 있는 공원산책길이 있다. 이 길이 있어 많은 사람들에게 안심을 하고 빼어난 절경을 감상할 수 있다','부산광역시 남구 용호3동 산25',''),(8,'p','kr','busan','해운대해수욕장',35.158726,129.160385,'해운대해수욕장은 대한민국 부산광역시 해운대구 우1동과 중1동에 걸쳐서 위치한 해수욕장이다. 모래사장의 총면적은 58,400㎡, 길이는 1.5 km, 폭은 30m ~ 50m 이다. 이 곳에는 300여개의 편의·숙박시설이 있고, 해수욕장의 가까운 부산조선비치호텔, 동백섬 누리마루 등이 있다. 개장기간은 6월초부터 9월말까지로, 피서객 인파가 2007년 1천 279만명이고, 2008년 1천 45만명으로 감소했다.','부산광역시 중동',''),(9,'p','kr','busan','오륙도 스카이워크',35.100594,129.124603,'오륙도 스카이워크의 옛 지명은 \'승두말\'이다. 승두말은 말안장처럼 생겼다고 「승두마」라고 부르는 것이 승두말로 되었으며 해녀들과 지역주민들은 「잘록개」라고 불렀다. 바다를 연모하는 승두말이 오륙도 여섯섬을 차례대로 순산하고 나서 승두말의 불룩했던 부분이 잘록하게 들어가 선창나루와 어귀의 언덕을 만들었다는 것이다. 동해와 남해의 경계지점이기도 한 이곳 승두말에 2012년 9월 12일에 착공하여 2013년 10월 18일 개장하면서 \'하늘위를 걷는다\'는 의미를 담아 \'오륙도 스카이워크\'라 이름하였다. 스카이워크는 35M 해안절벽 위에 철제빔을 설치하고 그 위에 유리판 24개를 말발굽형으로 이어놓은 15M의 유리다리이다. 바닥유리는 12mm유리판 4장에 방탄필름을 붙혀 특수 제작한 두께 55.49mm의 고하중 방탄유리로 \'안전하게 설계되었다.\' 발 아래 투명유리를 통해 파도가 절벽을 때리는 모습은 현기증이 날 정도로 아찔함을 느끼게 한다. 스카이워크 앞에 펼쳐진 바다는 시시때때로 아름답고 다채로운 색상을 연출하고 있어 사진촬영의 명소이며, 날씨가 좋은 날에는 대마도를 가장 가까이 볼 수 있는 곳이다.','부산광역시 남구 용호2동 오륙도로 137',''),(10,'p','kr','busan','어린이대공원',35.185322,129.042343,'1909년 성지곡수원지가 준공되고 1971년 5월 10일 백양산에 위치한 성지곡수원지 일대를 하나로 묶어 성지곡 유원지로 개장하였다. 1975년 6월 12일부터 12세 이상에게 입장료를 징수하기 시작하였다. 1978년 어린이날에 오늘날의 어린이대공원으로 이름을 바꾸었고, 1978년 9월 28일 정식으로 공원결정(건설부 제279호)이 내려졌다. 2005년 1월 1일부터 입장료가 무료화되었다. 2014년 4월 25일, 2004년 11월에 착수하였다가 2011년 9월에 일시 중단된 뒤 2012년 9월 삼정기업이 참여하여 공사가 재개된 동물원 리모델링 사업이 완료되어, 동물원이 삼정 더파크라는 이름으로 재개장하였다. 동물원의 입장료는 유료이다. 부산 어린이대공원은 자연의 조화와 더불어 부산시민들의 안식처가 되었다.','부산광역시 부산진구 초읍동 645-58',''),(11,'p','kr','busan','성지곡수원지',35.185959,129.041931,'구 성지곡수원지는 부산광역시 부산진구에 있는 저수지이다. 2008년 7월 3일 대한민국의 등록문화재 제376호로 지정되었다. 서울의 뚝도수원지에 이어 한국에서 두 번째로 설치된 수원시설이며 집수와 저수, 침전, 여과지로 향한 도수로 등이 거의 원형 그대로 보존되어 있다. 동천의 발원지이다','부산광역시 부산진구 초읍동 43',''),(12,'p','kr','jeju','한라산',33.361900,126.529160,'한라산은 제주특별자치도에 있는 해발 1,947m, 면적 약 1,820km²의 화산으로, 제주도의 면적 대부분을 차지하고 있다. 금강산, 지리산과 함께 삼신산이라 불러왔다. 예전엔 부악, 원산, 진산, 선산, 두무악, 부라산, 영주산, 혈망봉으로 다양하게 불렸다. 정상에 백록담이라는 화구호가 있다. 백록담은 흰 사슴이 물을 먹는 곳이라는 뜻 이다. 산자락 곳곳에 오름 또는 악이라 부르는 크고 작은 기생 화산들이 분포해 있다.','제주시 아라동',''),(13,'p','kr','jeju','성산일출봉',33.458225,126.942520,'성산 일출봉은 서귀포시 성산읍에 있는 산이다. 커다란 사발 모양의 분화구가 특징으로, 분화구 내부의 면적은 12, 774㎢이다. 높이는 182 m 이다. 성산 일출봉에서의 일출은 대한민국에서 가장 아름다운 해돋이로 꼽히며 영주십경 중 하나 이다. 일출봉 분화구와 주변 1 km 해역은 성산 일출봉 천연보호구역으로 대한민국의 천연기념물로 지정되어 있다.','서귀포시 성산읍 ',''),(14,'p','kr','jeju','용두암',33.516201,126.511856,'용두암은 잘 알려진 관광지로 제주시 담동 해안에 위치한다. 용두암 부근은 높은 절벽을 이루고 있고, 동쪽과 서쪽으로는 지형이 완만해지는 것으로 보아 두꺼운 용암이 흘렀을 것으로 추측된다. 용두암을 옆에서 보면 용머리 모양을 하고 있으나, 높은 곳에서 내려다보면 얇은 판을 길게 세워놓은 모양이다. 또한 용두암을 이루고 있는 암석의 표면에는 주먹 크기의 둥근 돌들이 박혀 있는데, 이들은 아아 용암이 흐를 때 생긴 클링커로서 먼 거리를 밀려 내려 오는 동안 크기가 작아지고 모양은 마모되었다.','제주특별자치도 제주시 용담2동 용두암길 15 ',''),(18,'p','kr','jeju','주상절리대',33.237766,126.425072,'제주 중문·대포 해안 주상절리대는 제주특별자치도 서귀포시 대포동에 있는 주상절리 해안으로, 그 가치가 높아 대한민국의 천연기념물 443호로 지정되어 있다.','제주특별자치도 서귀포시 중문동 ',''),(19,'p','kr','jeju','천지연폭포',33.246948,126.554413,'천지연폭포는 제주도 서귀포시 서귀동에 있는 폭포이다. ‘천지연’이란 이름은 ‘하늘과 땅이 만나서 이룬 연못’이라는 뜻이다. 폭포의 절벽은 화산활동으로 인해 생성된 조면질 안산암으로 이루어져있다. 폭포수의 폭은 약 12 m 높이는 22 m, 연못의 수심은 약 20 m이다. 계곡에는 아열대성·난대성의 각종 상록수와 양치식물 등이 밀생하는 울창한 숲을 이룬다.','서귀포시 천지동',''),(20,'p','kr','jeju','만장굴',33.528439,126.771484,'제주 김녕굴 및 만장굴은 대한민국의 천연기념물 98호이다. 김녕굴과 만장굴은 원래 하나의 굴이었으나 천장이 붕괴되면서 두 개로 나뉘었다. 만장굴은 제주시 구좌읍에 있는 용암 동굴이다. 주굴 8928m. 총 길이 13,268m. 지층은 신생대 제3기 말에서 제4기 초 사이에 형성된 표선리현무암층이다. 김녕사굴을 비롯해 해안까지 뻗어나온 김녕절굴 등 여러 개의 지굴이 같은 용암동굴 계열로 확인됨에 따라 세계에서 가장 긴 용암동굴로 기록되었다.','제주특별자치도 제주시 구좌읍 만장굴길 182 ',''),(29,'p','usa','newyork','자유의여신상',40.689251,-74.044495,'자유의 여신상이라는 이름으로 더 잘 알려져 있는 세계를 밝히는 자유는 프랑스가 19세기 말에 미국의 독립 100주년을 축하하기 위해 제작한 구리 조각상으로 미국 뉴욕 주 뉴욕의 리버티 섬에 있다.','미국 10004 뉴욕',''),(30,'p','usa','newyork','하이라인 파크',40.747952,-74.004745,'하이 라인은 뉴욕 시에 있는 길이 1마일 공원이다. 1993년 개장한 파리의 프롬나드 플랑테에서 영감을 얻어, 웨스트 사이드 노선으로 맨해튼의 로어 웨스트 사이드에서 운행되었던 1.45마일의 고가 화물 노선을 꽃과 나무를 심고 벤치를 설치해서 공원으로 재이용한 장소이다','미국 10011 뉴욕 ',''),(31,'p','usa','newyork','타임즈스퀘어',40.758884,-73.985100,'타임스 스퀘어는 미국 뉴욕 미드타운 맨해튼에 있는 유명한 상업적 교차로로, 웨스트 42번가와 웨스트 7번가가 합쳐져 만난 세븐스 에비뉴와 브로드웨이가 교차하는 일대를 말한다. 타임 스퀘어는 브로드웨이의 극장가가 환하게 빛나는 중심지이고, 세계에서 가장 붐비는 보행자용 교차로 중 한 곳이며, 세계 엔터테인먼트 산업의 중심지 로 \"세계의 교차로\"\", \"\"우주의 중심\"\", \"\"불야성의 거리\"\" 라는 별명으로도 잘 알려져 있다.\"','미국 10036 뉴욕 맨해튼',''),(32,'p','usa','newyork','첼시마켓',40.742134,-74.005112,'첼시 마켓은 뉴욕 첼시에 위치한 실내형 식료품 마켓이다','75 9th Ave, New York, NY 10011 미국 ',''),(33,'p','usa','newyork','엠파이어 스테이트 빌딩 전망대',40.748444,-73.985687,'엠파이어 스테이트 빌딩은 뉴욕 주 뉴욕 시 맨해튼 섬 5번가와 34블록의 모퉁이에 있는, 1931년에 지어진 울워스 고딕 양식의 건물이다. 지상 102층에 높이는 381m이며 1953년에 설치된 안테나 탑을 포함할 경우 443m이다. 86층의 콘크리트건물 위의 16층짜리 철탑은 본래 비행선의 계류탑을 목적으로 만들어졌으나 바람이 심해 비행선 정박이 위험하다는 이유로 거의 사용되지 않았으며 현재는 전망대와 방송용 안테나만이 위치해있다.','350 5th Ave, New York, NY 10118 미국 ',''),(34,'r','kr','busan','소문난 주문진 막국수',35.196178,129.059540,'사직야구장 앞 막국수 전문점','부산광역시 동래구 사직2동 92-1',''),(35,'r','kr','busan','쌍둥이돼지국밥',35.133583,129.092133,'전통 맛집','부산광역시 남구 대연1동 유엔평화로13번길 2 ',''),(36,'r','kr','busan','배비장보쌈',35.248554,129.091736,'배비장보쌈 구서본점. 사장이 배씨라서 배비장 보쌈.','부산광역시 금정구 구서1동 84-15',''),(37,'h','kr','busan','승민이 집',35.153419,129.070953,'막내 승민이 집','부산광역시 부산진구 전포3동 445-1','');
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

-- Dump completed on 2017-06-12 17:30:17
