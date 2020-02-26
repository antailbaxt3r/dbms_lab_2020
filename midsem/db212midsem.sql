DROP DATABASE IF EXISTS `db212midsem`;
CREATE DATABASE `db212midsem`;
connect `db212midsem`;


-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: db212midsem
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `BATTING`
--

DROP TABLE IF EXISTS `BATTING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BATTING` (
  `P_ID` varchar(15) NOT NULL,
  `RUNS` int(11) DEFAULT NULL,
  `BALLS` int(11) DEFAULT NULL,
  `FOURS` int(11) DEFAULT NULL,
  `SIXES` int(11) DEFAULT NULL,
  `DISMISSAL` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`P_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BATTING`
--

LOCK TABLES `BATTING` WRITE;
/*!40000 ALTER TABLE `BATTING` DISABLE KEYS */;
INSERT INTO `BATTING` VALUES ('1064812',0,2,0,0,'CAUGHT'),('230559',41,25,3,3,NULL),('234675',5,5,0,0,NULL),('28081',2,8,0,0,'RUN OUT'),('319439',0,2,0,0,'RUN OUT'),('33141',1,4,0,0,'CAUGHT'),('33335',8,14,0,0,'LBW'),('34102',15,14,1,1,'CAUGHT'),('379143',29,17,0,4,'CAUGHT'),('446507',15,17,1,0,'BOWLED'),('44828',26,13,3,1,'STUMPED'),('471342',7,7,0,0,'CAUGHT'),('475281',2,2,0,0,'LBW'),('51439',15,15,0,1,'CAUGHT'),('625371',16,10,1,1,'LBW'),('625383',0,0,0,0,NULL),('720471',23,26,3,0,'CAUGHT'),('8180',80,59,8,4,'RUN OUT');
/*!40000 ALTER TABLE `BATTING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOWLING`
--

DROP TABLE IF EXISTS `BOWLING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOWLING` (
  `P_ID` varchar(15) NOT NULL,
  `OVERS` int(11) DEFAULT NULL,
  `MAIDENS` int(11) DEFAULT NULL,
  `RUNS` int(11) DEFAULT NULL,
  `WICKETS` int(11) DEFAULT NULL,
  `DOTS` int(11) DEFAULT NULL,
  `WIDES` int(11) DEFAULT NULL,
  PRIMARY KEY (`P_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOWLING`
--

LOCK TABLES `BOWLING` WRITE;
/*!40000 ALTER TABLE `BOWLING` DISABLE KEYS */;
INSERT INTO `BOWLING` VALUES ('1064812',4,0,14,1,13,0),('234675',2,0,12,0,3,0),('29264',4,0,27,0,7,1),('319439',4,0,24,0,12,2),('40618',3,0,23,2,7,0),('447261',4,1,26,3,17,1),('471342',3,0,39,1,8,0),('475281',4,0,37,2,10,0),('49758',4,0,49,1,7,1),('51439',3,0,24,0,7,1),('625371',1,0,3,0,4,1),('625383',4,0,14,2,13,0);
/*!40000 ALTER TABLE `BOWLING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYERS`
--

DROP TABLE IF EXISTS `PLAYERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLAYERS` (
  `PLAYER_ID` varchar(15) NOT NULL,
  `PLAYER_NAME` varchar(50) NOT NULL,
  `NATIONALITY` varchar(20) DEFAULT NULL,
  `BAT` varchar(50) DEFAULT NULL,
  `BOWL` varchar(50) DEFAULT NULL,
  `TEAM` varchar(20) NOT NULL,
  `ROLE` varchar(20) NOT NULL,
  `DEBUT` date DEFAULT NULL,
  PRIMARY KEY (`PLAYER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYERS`
--

LOCK TABLES `PLAYERS` WRITE;
/*!40000 ALTER TABLE `PLAYERS` DISABLE KEYS */;
INSERT INTO `PLAYERS` VALUES ('1064812','RD Chahar','India','Right-hand bat','Legbreak googly','MI','Bowler','2017-04-08'),('230559','KA Pollard','West Indies','Right-hand bat','Right-arm medium','MI','Allrounder','2008-06-20'),('234675','RA Jadeja','India','Left-hand bat','Slow left-arm orthodox','CSK','Allrounder','2009-02-10'),('28081','MS Dhoni','India','Right-hand bat','Right-arm medium','CSK','Wicketkeeper','2006-12-01'),('29264','Harbhajan Singh','India','Right-hand bat','Right-arm offbreak','CSK','Bowler','2006-12-01'),('319439','MJ McClenaghan','New Zealend','Left-hand bat','Left-arm fast-medium','MI','Bowler','2012-12-21'),('33141','AT Rayudu','India','Right-hand bat','Right-arm offbreak','CSK','Batsman','2014-09-07'),('33335','SK Raina','India','Left-hand bat','Right-arm offbreak','CSK','Batsman','2006-12-01'),('34102','RG Sharma','India','Right-hand bat','Right-arm offbreak','MI','Batsman','2007-09-19'),('379143','Q de Kock','South Africa','Left-hand bat','Never bowled','MI','Wicketkeeper','2012-12-21'),('40618','Imran Tahir','South Africa','Right-hand bat','Legbreak googly','CSK','Bowler','2013-08-02'),('446507','SA Yadav','India','Right-hand bat','Right-arm medium','MI','Batsman','2010-03-13'),('447261','DL Chahar','India','Right-hand bat','Right-arm medium','CSK','Bowler','2018-07-08'),('44828','F du Plessis','South Africa','Right-hand bat','Legbreak','CSK','Batsman','2012-09-08'),('471342','KH Pandya','India','Left-hand bat','Slow left-arm','MI','Allrounder','2018-11-04'),('475281','SN Thakur','India','Right-hand bat','Right-arm medium','CSK','Bowler','2018-02-21'),('49758','SL Malinga','Sri Lanka','Right-hand bat','Right-arm fast','MI','Bowler','2006-06-15'),('51439','DJ Bravo','West Indies','Right-hand bat','Right-arm medium','CSK','Allrounder','2006-02-16'),('625371','HH Pandya','India','Right-hand bat','Right-arm medium-fast','MI','Allrounder','2016-01-26'),('625383','JJ Bumrah','India','Right-hand bat','Right-arm fast','MI','Bowler','2016-01-26'),('720471','Ishan Kishan','India','Left-hand bat','Never bowled','MI','Batsman','2016-04-11'),('8180','SR Watson','Australia','Right-hand bat','Right-arm fast-medium','CSK','Allrounder','2006-02-24');
/*!40000 ALTER TABLE `PLAYERS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-22 15:21:08
