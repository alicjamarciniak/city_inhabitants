-- MySQL dump 10.13  Distrib 5.7.11, for Linux (x86_64)
--
-- Host: localhost    Database: city_inhabitants
-- ------------------------------------------------------
-- Server version	5.7.11-0ubuntu6

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
-- Table structure for table `Doctors`
--

DROP TABLE IF EXISTS `Doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctors` (
  `DoctorID` int(11) NOT NULL AUTO_INCREMENT,
  `InhabitantID` int(11) DEFAULT NULL,
  `Secialization` varchar(255) NOT NULL,
  `HospitalID` int(11) NOT NULL,
  PRIMARY KEY (`DoctorID`),
  KEY `HospitalID` (`HospitalID`),
  KEY `doctorInhabitantID` (`InhabitantID`),
  CONSTRAINT `doctorInhabitantID` FOREIGN KEY (`InhabitantID`) REFERENCES `Inhabitants` (`InhabitantID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctors`
--

LOCK TABLES `Doctors` WRITE;
/*!40000 ALTER TABLE `Doctors` DISABLE KEYS */;
INSERT INTO `Doctors` VALUES (1,2,'Radiologist',1),(2,6,'Cardiologist',2);
/*!40000 ALTER TABLE `Doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FamilyMembers`
--

DROP TABLE IF EXISTS `FamilyMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FamilyMembers` (
  `Inhabitant1ID` int(11) NOT NULL,
  `FamilyRelationID` int(11) NOT NULL,
  `Inhabitant2ID` int(11) NOT NULL,
  `FamilyName` varchar(255) NOT NULL,
  KEY `Inhabitant2ID` (`Inhabitant2ID`),
  KEY `Inhabitabt1ID` (`Inhabitant1ID`),
  KEY `FamilyRelationID` (`FamilyRelationID`),
  KEY `Inhabitant1ID` (`Inhabitant1ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FamilyMembers`
--

LOCK TABLES `FamilyMembers` WRITE;
/*!40000 ALTER TABLE `FamilyMembers` DISABLE KEYS */;
INSERT INTO `FamilyMembers` VALUES (1,12,2,'Nowak'),(1,10,3,'Nowak'),(2,13,1,'Nowak'),(2,10,3,'Nowak'),(3,1,1,'Nowak'),(3,2,2,'Nowak'),(1,9,8,'Brown'),(8,9,1,'Brown'),(1,10,7,'Brown'),(7,2,1,'Brown'),(1,3,5,'Brown'),(5,3,1,'Brown'),(5,2,7,'Brown'),(4,14,5,''),(5,14,4,'');
/*!40000 ALTER TABLE `FamilyMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FamilyRelations`
--

DROP TABLE IF EXISTS `FamilyRelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FamilyRelations` (
  `FamilyRelationID` int(11) NOT NULL AUTO_INCREMENT,
  `Relation` varchar(255) NOT NULL,
  PRIMARY KEY (`FamilyRelationID`),
  UNIQUE KEY `Relation` (`Relation`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FamilyRelations`
--

LOCK TABLES `FamilyRelations` WRITE;
/*!40000 ALTER TABLE `FamilyRelations` DISABLE KEYS */;
INSERT INTO `FamilyRelations` VALUES (7,'Aunt'),(4,'Brother'),(10,'Child'),(9,'Cousin'),(2,'Father'),(11,'Grandchild'),(6,'Grandfather'),(5,'Grandmother'),(12,'Husband'),(1,'Mother'),(14,'Partner'),(3,'Sister'),(8,'Uncle'),(13,'Wife');
/*!40000 ALTER TABLE `FamilyRelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hospitals`
--

DROP TABLE IF EXISTS `Hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hospitals` (
  `HospitalID` int(11) NOT NULL AUTO_INCREMENT,
  `PlaceID` int(11) NOT NULL,
  `HospitalName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`HospitalID`),
  UNIQUE KEY `HospitalName` (`HospitalName`),
  KEY `Place` (`PlaceID`),
  CONSTRAINT `Hospitals_ibfk_1` FOREIGN KEY (`PlaceID`) REFERENCES `Places` (`PlaceID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hospitals`
--

LOCK TABLES `Hospitals` WRITE;
/*!40000 ALTER TABLE `Hospitals` DISABLE KEYS */;
INSERT INTO `Hospitals` VALUES (1,2,'St. Anna\'s Hospital'),(2,10,'General Hospital');
/*!40000 ALTER TABLE `Hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ilnesses`
--

DROP TABLE IF EXISTS `Ilnesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ilnesses` (
  `IlnessID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`IlnessID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ilnesses`
--

LOCK TABLES `Ilnesses` WRITE;
/*!40000 ALTER TABLE `Ilnesses` DISABLE KEYS */;
INSERT INTO `Ilnesses` VALUES (7,'Blood Diseases'),(11,'Cancer'),(2,'Cardiovascular and Circulatory Diseases'),(9,'Chronic Respiratory Diseases'),(5,'Diabetes Disorder'),(8,'Endocrine Diseases'),(10,'Injury'),(12,'Migraine'),(4,'Muscoloskeletal Disorder'),(3,'Neoplasm'),(1,'Neuropsychiatric Disorder'),(6,'Urogenital Disorder');
/*!40000 ALTER TABLE `Ilnesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inhabitants`
--

DROP TABLE IF EXISTS `Inhabitants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inhabitants` (
  `InhabitantID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `DateOfDeath` date DEFAULT NULL,
  `PlaceOfResidenceID` varchar(255) DEFAULT NULL,
  `ProfessionID` varchar(255) DEFAULT NULL,
  `LifeSentence` text,
  PRIMARY KEY (`InhabitantID`),
  KEY `PlaceOfResidence` (`PlaceOfResidenceID`),
  KEY `Profession` (`ProfessionID`),
  FULLTEXT KEY `LifeSentence` (`LifeSentence`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inhabitants`
--

LOCK TABLES `Inhabitants` WRITE;
/*!40000 ALTER TABLE `Inhabitants` DISABLE KEYS */;
INSERT INTO `Inhabitants` VALUES (1,'Anna','Nowak',57,'1960-12-09',NULL,'1','11','To be or not to be, that is the question'),(2,'Roman','Nowak',59,'1958-03-19',NULL,'2','3','\n\nWhat is in a name? That which we call a rose by any other name would smell as sweet'),(3,'Katarzyna','Nowak',18,'1999-04-29',NULL,'1',NULL,'\nListen to many, speak to a few'),(4,'John','Smith',37,'1980-11-01',NULL,'9','6','\nThe rest is silence'),(5,'Veronica','Landers',30,'1987-03-15',NULL,'6','13','\nAll’s well that ends well'),(6,'Alessandro','Verra',36,'1981-10-12',NULL,'9','3','\nA horse! A horse! My kingdom for a horse!'),(7,'Leonel','Brown',85,'1930-08-10','2015-03-20','7','9','\nSpeak low if you speak love'),(8,'Gregory','O\'Hara',32,'1985-02-20',NULL,'5','12','\nOne is loved because one is loved. No reason is needed for loving.'),(19,'aaa','kkk',28,'1000-10-09',NULL,NULL,NULL,'kk');
/*!40000 ALTER TABLE `Inhabitants` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `PopulationIncrease` AFTER INSERT ON `Inhabitants` FOR EACH ROW UPDATE Society SET Society.Population = Society.Population + 1 */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `PopulationDecrease` AFTER DELETE ON `Inhabitants` FOR EACH ROW UPDATE Society SET Society.Population = Society.Population - 1 */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `LifeSentenceFullSearchForLove`
--

DROP TABLE IF EXISTS `LifeSentenceFullSearchForLove`;
/*!50001 DROP VIEW IF EXISTS `LifeSentenceFullSearchForLove`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `LifeSentenceFullSearchForLove` AS SELECT 
 1 AS `InhabitantID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Age`,
 1 AS `DateOfBirth`,
 1 AS `DateOfDeath`,
 1 AS `PlaceOfResidenceID`,
 1 AS `ProfessionID`,
 1 AS `LifeSentence`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Pets`
--

DROP TABLE IF EXISTS `Pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pets` (
  `PetID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `SpeciesID` int(11) NOT NULL,
  PRIMARY KEY (`PetID`),
  KEY `SpeciesID` (`SpeciesID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pets`
--

LOCK TABLES `Pets` WRITE;
/*!40000 ALTER TABLE `Pets` DISABLE KEYS */;
INSERT INTO `Pets` VALUES (1,'Flufy',1),(2,'Puri',2),(3,'Mr. Gold',3),(4,'Shine',4),(5,'Bobby',1),(6,'Kitty',2),(7,'Fat Ben',5),(8,'Lady Blue',6),(9,'Jurek',12),(11,'Jan',13);
/*!40000 ALTER TABLE `Pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Pets$Owners`
--

DROP TABLE IF EXISTS `Pets$Owners`;
/*!50001 DROP VIEW IF EXISTS `Pets$Owners`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Pets$Owners` AS SELECT 
 1 AS `Name`,
 1 AS `FirstName`,
 1 AS `LastName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Places`
--

DROP TABLE IF EXISTS `Places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Places` (
  `PlaceID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(225) DEFAULT NULL,
  `Street` varchar(225) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  `Flat` int(11) DEFAULT NULL,
  `PlaceCategoryID` int(11) NOT NULL,
  PRIMARY KEY (`PlaceID`),
  KEY `PlaceCategoryID` (`PlaceCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Places`
--

LOCK TABLES `Places` WRITE;
/*!40000 ALTER TABLE `Places` DISABLE KEYS */;
INSERT INTO `Places` VALUES (1,NULL,'Abbey Road',11,NULL,1),(2,'St. Anna\'s Hospital','Oxford Street',1,NULL,6),(3,'Smart Sam','Abbey Road',1,NULL,7),(4,'The Origin\'s Bank','Downing Street',12,NULL,10),(5,NULL,'Downing Street',60,20,2),(6,NULL,'Downing Street',60,21,2),(7,NULL,'Downing Street',60,11,2),(8,'Secondary School','Downing Street',20,NULL,8),(9,NULL,'King Street',98,NULL,1),(10,'General Hospital','King Street',17,NULL,6);
/*!40000 ALTER TABLE `Places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlacesCategories`
--

DROP TABLE IF EXISTS `PlacesCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlacesCategories` (
  `PlaceCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`PlaceCategoryID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlacesCategories`
--

LOCK TABLES `PlacesCategories` WRITE;
/*!40000 ALTER TABLE `PlacesCategories` DISABLE KEYS */;
INSERT INTO `PlacesCategories` VALUES (5,'Agency'),(10,'Bank'),(1,'Detached house'),(4,'Factory'),(2,'Flat in block'),(7,'Grocery'),(6,'Hospital'),(9,'Library'),(3,'Office'),(8,'School');
/*!40000 ALTER TABLE `PlacesCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrivateProperties`
--

DROP TABLE IF EXISTS `PrivateProperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PrivateProperties` (
  `PrivatePropertyID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`PrivatePropertyID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrivateProperties`
--

LOCK TABLES `PrivateProperties` WRITE;
/*!40000 ALTER TABLE `PrivateProperties` DISABLE KEYS */;
INSERT INTO `PrivateProperties` VALUES (5,'Agency'),(1,'Detached house'),(4,'Factory'),(2,'Flat in block'),(3,'Office');
/*!40000 ALTER TABLE `PrivateProperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professions`
--

DROP TABLE IF EXISTS `Professions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Professions` (
  `ProffesionID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `WorkPlaceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProffesionID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `WorkPlaceID` (`WorkPlaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professions`
--

LOCK TABLES `Professions` WRITE;
/*!40000 ALTER TABLE `Professions` DISABLE KEYS */;
INSERT INTO `Professions` VALUES (1,'Baker',3),(2,'Dentist',2),(3,'Doctor',10),(4,'Banker',4),(5,'Economist',4),(6,'Tax collector',0),(7,'Cardiologist',2),(8,'Nurse',10),(9,'Principal',8),(10,'Teacher',8),(11,'Artist',0),(12,'Chef',0),(13,'Waiter',0);
/*!40000 ALTER TABLE `Professions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PublicPlaces`
--

DROP TABLE IF EXISTS `PublicPlaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PublicPlaces` (
  `PublicPlaceID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`PublicPlaceID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PublicPlaces`
--

LOCK TABLES `PublicPlaces` WRITE;
/*!40000 ALTER TABLE `PublicPlaces` DISABLE KEYS */;
INSERT INTO `PublicPlaces` VALUES (5,'Bank'),(2,'Grocery'),(1,'Hospital'),(4,'Library'),(6,'Restaurant'),(3,'School');
/*!40000 ALTER TABLE `PublicPlaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ShowIrishmen`
--

DROP TABLE IF EXISTS `ShowIrishmen`;
/*!50001 DROP VIEW IF EXISTS `ShowIrishmen`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ShowIrishmen` AS SELECT 
 1 AS `InhabitantID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Age`,
 1 AS `DateOfBirth`,
 1 AS `DateOfDeath`,
 1 AS `PlaceOfResidenceID`,
 1 AS `ProfessionID`,
 1 AS `LifeSentence`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ShowPeople&Ilnesses`
--

DROP TABLE IF EXISTS `ShowPeople&Ilnesses`;
/*!50001 DROP VIEW IF EXISTS `ShowPeople&Ilnesses`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ShowPeople&Ilnesses` AS SELECT 
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ShowWomen`
--

DROP TABLE IF EXISTS `ShowWomen`;
/*!50001 DROP VIEW IF EXISTS `ShowWomen`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ShowWomen` AS SELECT 
 1 AS `InhabitantID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Age`,
 1 AS `DateOfBirth`,
 1 AS `DateOfDeath`,
 1 AS `PlaceOfResidenceID`,
 1 AS `ProfessionID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Society`
--

DROP TABLE IF EXISTS `Society`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Society` (
  `Population` int(11) NOT NULL DEFAULT '0',
  `PreWorkAge` int(11) NOT NULL DEFAULT '0',
  `WorkAge` int(11) NOT NULL DEFAULT '0',
  `PostWorkAge` int(11) NOT NULL DEFAULT '0',
  `Deaths` int(11) NOT NULL DEFAULT '0',
  `Births` int(11) NOT NULL DEFAULT '0',
  `AverageAge` int(11) DEFAULT NULL,
  `MinAge` int(11) DEFAULT NULL,
  `MaxAge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Society`
--

LOCK TABLES `Society` WRITE;
/*!40000 ALTER TABLE `Society` DISABLE KEYS */;
INSERT INTO `Society` VALUES (8,1,6,1,1,8,44,18,85);
/*!40000 ALTER TABLE `Society` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Species`
--

DROP TABLE IF EXISTS `Species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Species` (
  `SpeciesID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Amount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpeciesID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `SpieciesID` (`SpeciesID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Species`
--

LOCK TABLES `Species` WRITE;
/*!40000 ALTER TABLE `Species` DISABLE KEYS */;
INSERT INTO `Species` VALUES (1,'Dog',2),(2,'Cat',2),(3,'Fish',1),(4,'Snake',1),(5,'Hamster',1),(6,'Parrot',1),(10,'Turtle',0),(12,'Hedgehog',1),(13,'Crocodile',1);
/*!40000 ALTER TABLE `Species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `__InhabitantID_DoctorID`
--

DROP TABLE IF EXISTS `__InhabitantID_DoctorID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__InhabitantID_DoctorID` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `InhabitantID` int(11) NOT NULL,
  `DoctorID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `InhabitantID` (`InhabitantID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__InhabitantID_DoctorID`
--

LOCK TABLES `__InhabitantID_DoctorID` WRITE;
/*!40000 ALTER TABLE `__InhabitantID_DoctorID` DISABLE KEYS */;
INSERT INTO `__InhabitantID_DoctorID` VALUES (1,1,1),(2,1,2),(3,2,2),(4,3,1),(5,4,2),(6,5,1),(7,5,2),(8,6,1),(9,7,1),(10,8,2);
/*!40000 ALTER TABLE `__InhabitantID_DoctorID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `__InhabitantID_IlnessID`
--

DROP TABLE IF EXISTS `__InhabitantID_IlnessID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__InhabitantID_IlnessID` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IlnessID` int(11) NOT NULL,
  `InhabitantID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IlnessID` (`IlnessID`),
  KEY `InhabitantID` (`InhabitantID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__InhabitantID_IlnessID`
--

LOCK TABLES `__InhabitantID_IlnessID` WRITE;
/*!40000 ALTER TABLE `__InhabitantID_IlnessID` DISABLE KEYS */;
INSERT INTO `__InhabitantID_IlnessID` VALUES (1,3,1),(2,11,1),(3,12,2),(4,2,2),(5,5,4),(6,12,5),(7,7,5),(8,1,6),(9,12,6),(10,6,6),(11,11,7),(12,3,8);
/*!40000 ALTER TABLE `__InhabitantID_IlnessID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `__InhabitantID_PetID`
--

DROP TABLE IF EXISTS `__InhabitantID_PetID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__InhabitantID_PetID` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `InhabitantID` int(11) NOT NULL,
  `PetId` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PetId` (`PetId`),
  KEY `InhabitantID` (`InhabitantID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__InhabitantID_PetID`
--

LOCK TABLES `__InhabitantID_PetID` WRITE;
/*!40000 ALTER TABLE `__InhabitantID_PetID` DISABLE KEYS */;
INSERT INTO `__InhabitantID_PetID` VALUES (1,1,1),(2,2,1),(3,3,1),(4,0,5),(5,1,2),(6,3,2),(7,2,2),(8,8,6),(9,8,3),(10,4,4),(11,1,8),(12,2,8),(13,3,8),(14,5,7);
/*!40000 ALTER TABLE `__InhabitantID_PetID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `LifeSentenceFullSearchForLove`
--

/*!50001 DROP VIEW IF EXISTS `LifeSentenceFullSearchForLove`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `LifeSentenceFullSearchForLove` AS select `Inhabitants`.`InhabitantID` AS `InhabitantID`,`Inhabitants`.`FirstName` AS `FirstName`,`Inhabitants`.`LastName` AS `LastName`,`Inhabitants`.`Age` AS `Age`,`Inhabitants`.`DateOfBirth` AS `DateOfBirth`,`Inhabitants`.`DateOfDeath` AS `DateOfDeath`,`Inhabitants`.`PlaceOfResidenceID` AS `PlaceOfResidenceID`,`Inhabitants`.`ProfessionID` AS `ProfessionID`,`Inhabitants`.`LifeSentence` AS `LifeSentence` from `Inhabitants` where (match `Inhabitants`.`LifeSentence` against ('love')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Pets$Owners`
--

/*!50001 DROP VIEW IF EXISTS `Pets$Owners`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Pets$Owners` AS select `P`.`Name` AS `Name`,`IH`.`FirstName` AS `FirstName`,`IH`.`LastName` AS `LastName` from (`Pets` `P` left join (`__InhabitantID_PetID` `__IN_P` left join `Inhabitants` `IH` on((`IH`.`InhabitantID` = `__IN_P`.`InhabitantID`))) on((`__IN_P`.`PetId` = `P`.`PetID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ShowIrishmen`
--

/*!50001 DROP VIEW IF EXISTS `ShowIrishmen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ShowIrishmen` AS select `Inhabitants`.`InhabitantID` AS `InhabitantID`,`Inhabitants`.`FirstName` AS `FirstName`,`Inhabitants`.`LastName` AS `LastName`,`Inhabitants`.`Age` AS `Age`,`Inhabitants`.`DateOfBirth` AS `DateOfBirth`,`Inhabitants`.`DateOfDeath` AS `DateOfDeath`,`Inhabitants`.`PlaceOfResidenceID` AS `PlaceOfResidenceID`,`Inhabitants`.`ProfessionID` AS `ProfessionID`,`Inhabitants`.`LifeSentence` AS `LifeSentence` from `Inhabitants` where (`Inhabitants`.`LastName` like 'O\'%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ShowPeople&Ilnesses`
--

/*!50001 DROP VIEW IF EXISTS `ShowPeople&Ilnesses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ShowPeople&Ilnesses` AS select `IH`.`FirstName` AS `FirstName`,`IH`.`LastName` AS `LastName`,`IL`.`Name` AS `Name` from ((`Inhabitants` `IH` left join `__InhabitantID_IlnessID` `__IN_IL` on((`IH`.`InhabitantID` = `__IN_IL`.`InhabitantID`))) left join `Ilnesses` `IL` on((`__IN_IL`.`IlnessID` = `IL`.`IlnessID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ShowWomen`
--

/*!50001 DROP VIEW IF EXISTS `ShowWomen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ShowWomen` AS select `Inhabitants`.`InhabitantID` AS `InhabitantID`,`Inhabitants`.`FirstName` AS `FirstName`,`Inhabitants`.`LastName` AS `LastName`,`Inhabitants`.`Age` AS `Age`,`Inhabitants`.`DateOfBirth` AS `DateOfBirth`,`Inhabitants`.`DateOfDeath` AS `DateOfDeath`,`Inhabitants`.`PlaceOfResidenceID` AS `PlaceOfResidenceID`,`Inhabitants`.`ProfessionID` AS `ProfessionID` from `Inhabitants` where (`Inhabitants`.`FirstName` like '%a') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-24  1:03:32
