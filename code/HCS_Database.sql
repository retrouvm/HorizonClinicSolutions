-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_has_doc`
--

DROP TABLE IF EXISTS `app_has_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_has_doc` (
  `iddoctor` bigint NOT NULL,
  `idappointment` int NOT NULL,
  PRIMARY KEY (`iddoctor`,`idappointment`),
  KEY `appid_idx` (`idappointment`),
  CONSTRAINT `appid` FOREIGN KEY (`idappointment`) REFERENCES `appointment` (`idappointment`),
  CONSTRAINT `iddoctor` FOREIGN KEY (`iddoctor`) REFERENCES `doctors` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_has_doc`
--

LOCK TABLES `app_has_doc` WRITE;
/*!40000 ALTER TABLE `app_has_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_has_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `idappointment` int NOT NULL,
  `appointmentdate` date NOT NULL,
  `appointmenttime` varchar(45) DEFAULT NULL,
  `appointmentcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idappointment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `idbill` int NOT NULL,
  `numofdays` int NOT NULL,
  `medicinecost` int DEFAULT NULL,
  `billtotal` int NOT NULL,
  PRIMARY KEY (`idbill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `iddepartment` int NOT NULL,
  `departmentName` varchar(45) NOT NULL,
  PRIMARY KEY (`iddepartment`),
  UNIQUE KEY `iddepartment_UNIQUE` (`iddepartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_has_doc`
--

DROP TABLE IF EXISTS `dept_has_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_has_doc` (
  `iddoctor` bigint NOT NULL,
  `iddepartment` int NOT NULL,
  PRIMARY KEY (`iddoctor`,`iddepartment`),
  KEY `department_idx` (`iddepartment`),
  CONSTRAINT `department` FOREIGN KEY (`iddepartment`) REFERENCES `department` (`iddepartment`),
  CONSTRAINT `doctor` FOREIGN KEY (`iddoctor`) REFERENCES `doctor_treats_patient` (`idpatient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_has_doc`
--

LOCK TABLES `dept_has_doc` WRITE;
/*!40000 ALTER TABLE `dept_has_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept_has_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_has_nurses`
--

DROP TABLE IF EXISTS `dept_has_nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_has_nurses` (
  `iddepartment` int NOT NULL,
  `idnurses` bigint NOT NULL,
  PRIMARY KEY (`iddepartment`,`idnurses`),
  KEY `nurse_idx` (`idnurses`),
  CONSTRAINT `dept` FOREIGN KEY (`iddepartment`) REFERENCES `department` (`iddepartment`),
  CONSTRAINT `nurse` FOREIGN KEY (`idnurses`) REFERENCES `nurse` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_has_nurses`
--

LOCK TABLES `dept_has_nurses` WRITE;
/*!40000 ALTER TABLE `dept_has_nurses` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept_has_nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_treats_patient`
--

DROP TABLE IF EXISTS `doctor_treats_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_treats_patient` (
  `idpatient` bigint NOT NULL,
  `iddoctor` bigint NOT NULL,
  PRIMARY KEY (`idpatient`,`iddoctor`),
  UNIQUE KEY `idpatient_UNIQUE` (`idpatient`),
  UNIQUE KEY `iddoctor_UNIQUE` (`iddoctor`),
  CONSTRAINT `docid` FOREIGN KEY (`iddoctor`) REFERENCES `doctors` (`SSN`),
  CONSTRAINT `patient` FOREIGN KEY (`idpatient`) REFERENCES `patients` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_treats_patient`
--

LOCK TABLES `doctor_treats_patient` WRITE;
/*!40000 ALTER TABLE `doctor_treats_patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_treats_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `SSN` bigint NOT NULL,
  `Name` text NOT NULL,
  `Department` text NOT NULL,
  PRIMARY KEY (`SSN`),
  UNIQUE KEY `SSN_UNIQUE` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (36678030,'Tracy Allen','Skin'),(46750067,'Raymond Murphy','Renal'),(212608050,'Joanne Harrison','Cardiology'),(291874298,'William Lee','Paediatrics'),(336104096,'Eric Lawson','Plastic Surgery'),(364496902,'Victor Mejia','Obstetrics'),(431189883,'Tony Durham','Gynaecology'),(451796148,'Terri Thompson','Haematology'),(468234967,'Wesley Griffin','Infectious Disease'),(468993923,'Debra Turner','Gastroenterology'),(495740244,'Patricia Allen','Neurology'),(586057027,'Cory Browning','Orthopaedics'),(678472179,'Briana Boyd','Burn Center'),(764470731,'Thomas Miller','Surgery'),(844362626,'Erika Shaw','Psychiatry');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_has_dept`
--

DROP TABLE IF EXISTS `hospital_has_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_has_dept` (
  `idhospital` int NOT NULL,
  `iddeparment` int NOT NULL,
  PRIMARY KEY (`idhospital`,`iddeparment`),
  KEY `iddept_idx` (`iddeparment`),
  CONSTRAINT `iddept` FOREIGN KEY (`iddeparment`) REFERENCES `department` (`iddepartment`),
  CONSTRAINT `idhosp` FOREIGN KEY (`idhospital`) REFERENCES `hospitals` (`idhospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_has_dept`
--

LOCK TABLES `hospital_has_dept` WRITE;
/*!40000 ALTER TABLE `hospital_has_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital_has_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitalladdress`
--

DROP TABLE IF EXISTS `hospitalladdress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitalladdress` (
  `idhospitalladdress` int NOT NULL,
  `idhospital` int NOT NULL,
  `addressstreet` varchar(60) DEFAULT NULL,
  `addresscity` varchar(60) DEFAULT NULL,
  `addressstate` varchar(60) DEFAULT NULL,
  `addresszip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idhospitalladdress`),
  KEY `hospitalid_idx` (`idhospital`),
  CONSTRAINT `hospitalid` FOREIGN KEY (`idhospital`) REFERENCES `hospitals` (`idhospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitalladdress`
--

LOCK TABLES `hospitalladdress` WRITE;
/*!40000 ALTER TABLE `hospitalladdress` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospitalladdress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitals`
--

DROP TABLE IF EXISTS `hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitals` (
  `idhospital` int NOT NULL,
  `hospitalname` varchar(100) NOT NULL,
  `idaddress` int NOT NULL,
  PRIMARY KEY (`idhospital`),
  KEY `idaddresshospital_idx` (`idaddress`),
  CONSTRAINT `idaddresshospital` FOREIGN KEY (`idaddress`) REFERENCES `hospitalladdress` (`idhospitalladdress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitals`
--

LOCK TABLES `hospitals` WRITE;
/*!40000 ALTER TABLE `hospitals` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `idmedicine` int NOT NULL,
  `medicinename` varchar(60) NOT NULL,
  `medicinecost` varchar(45) NOT NULL,
  `medicinedescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmedicine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `SSN` bigint NOT NULL,
  `Name` text,
  `Department` text,
  PRIMARY KEY (`SSN`),
  UNIQUE KEY `SSN_UNIQUE` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (81609252,'Jeffrey Booth','Haematology'),(144692822,'Aaron Kelly II','Psychiatry'),(156131905,'Jennifer Baxter','Surgery'),(169815215,'Jared Baird','Haematology'),(214028542,'Rachael Todd','Orthopaedics'),(229408379,'Paul Conley','Infectious Disease'),(238238908,'Ariel Bradford','Infectious Disease'),(241405100,'Joshua Williamson','Gastroenterology'),(245030901,'Jean Smith','Cardiology'),(246155540,'Rodney Cunningham','Plastic Surgery'),(288514315,'Brad Horne','Gynaecology'),(294688110,'Theresa Benitez','Plastic Surgery'),(303528226,'Barbara Pennington','Paediatrics'),(353303382,'Paul Cole','Obstetrics'),(397615508,'Lori Cowan','Renal'),(405071206,'Gabriela Edwards','Gynaecology'),(415098033,'Jonathan Hunt','Neurology'),(431309457,'Anthony Mcconnell','Burn Center'),(467548022,'Jeremy Kelley','Gastroenterology'),(478915829,'Kathleen Mason','Surgery'),(480939093,'Louis Williamson','Obstetrics'),(513461284,'Julia Moore','Burn Center'),(584417383,'Susan Smith','Orthopaedics'),(629890285,'Sarah May','Skin'),(754052589,'Denise Thomas','Neurology'),(819477198,'Steven Melendez','Renal'),(825882413,'Walter Davis','Psychiatry'),(859033207,'David Matthews','Cardiology'),(878896018,'Jerry Brown','Skin'),(896465135,'Megan Bishop','Paediatrics');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse_has_room`
--

DROP TABLE IF EXISTS `nurse_has_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse_has_room` (
  `idnurse` bigint NOT NULL,
  `idroom` int NOT NULL,
  PRIMARY KEY (`idnurse`,`idroom`),
  KEY `roomid_idx` (`idroom`),
  CONSTRAINT `nurseid` FOREIGN KEY (`idnurse`) REFERENCES `nurse` (`SSN`),
  CONSTRAINT `roomid` FOREIGN KEY (`idroom`) REFERENCES `room` (`idroom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse_has_room`
--

LOCK TABLES `nurse_has_room` WRITE;
/*!40000 ALTER TABLE `nurse_has_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `nurse_has_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_has_app`
--

DROP TABLE IF EXISTS `patient_has_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_has_app` (
  `idpatient` bigint NOT NULL,
  `idappointment` int NOT NULL,
  PRIMARY KEY (`idpatient`,`idappointment`),
  KEY `apps_idx` (`idappointment`),
  CONSTRAINT `apps` FOREIGN KEY (`idappointment`) REFERENCES `appointment` (`idappointment`),
  CONSTRAINT `patients` FOREIGN KEY (`idpatient`) REFERENCES `patients` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_has_app`
--

LOCK TABLES `patient_has_app` WRITE;
/*!40000 ALTER TABLE `patient_has_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_has_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `SSN` bigint NOT NULL,
  `Name` text NOT NULL,
  `Street` text,
  `City` text,
  `State` text,
  `Zip` bigint NOT NULL,
  `Age` text,
  `Cell` text,
  `iddoctor` bigint NOT NULL,
  PRIMARY KEY (`SSN`),
  UNIQUE KEY `SSN_UNIQUE` (`SSN`),
  KEY `docident_idx` (`iddoctor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (19716863,'Christina Willis DDS','9682 Robin Inlet Suite 381','West Curtisland','NY',71062,'63','783-413-6687x335',0),(30604081,'William Little','40260 Patel Harbor Apt. 703','Parkertown','AK',25383,'63','447-214-4046x23497',0),(48912965,'Steven Rodriguez','34511 Hammond Light','East Richardside','OR',19755,'56','172-500-9574x97598',0),(59330375,'Taylor Turner','86383 Sara Turnpike','West Edwinville','WI',2588,'51','851-236-0060',0),(68405823,'Charles Baird','427 Campbell Street Suite 232','West Jaimemouth','AK',99508,'77','+1-403-391-8569x4315',0),(83778742,'Kristy Patterson','679 Amanda Union Suite 590','Port Katiestad','MP',61716,'31','+1-520-037-0478x303',0),(111766018,'Sharon Barker','86253 Howard Estates','North Lisastad','SC',89792,'72','256-153-5175',0),(116487686,'Ms. Brandi Mosley','594 Steven Lake Apt. 004','North Karenport','OH',4291,'33','001-970-096-1689x799',0),(130170030,'Catherine Vasquez','5502 Hernandez Roads Suite 889','Johnville','ID',38307,'62','001-416-514-1456x6114',0),(143807289,'Cassie Giles','692 Ryan Island','Nguyenside','IL',70005,'20','+1-111-511-4920x8625',0),(150341068,'Megan Kelly','22156 Hernandez Glens','North Kenneth','GU',21750,'46','+1-495-042-8646x524',0),(152444517,'Jason Elliott','030 Regina Freeway Suite 567','Williamschester','AK',36502,'61','(409)190-1144',0),(164981179,'Ashley Short','19308 Donna Summit Apt. 409','Lake Christina','AR',7745,'33','+1-268-454-9134x65847',0),(187893226,'Gina White','6254 Ali Lake Apt. 993','Ricebury','CO',32808,'53','769.129.3717x323',0),(256023551,'Lisa Jackson','27875 Ronald Plains Apt. 134','East Matthewside','MP',61613,'21','001-587-762-3459x37125',0),(314231282,'Brandon Nicholson','76012 Garcia Stravenue','Reynoldsburgh','VA',38455,'46','(674)228-7542x2606',0),(320885191,'John Gonzalez','5309 Morales Divide','East Josephville','WI',51971,'59','025.759.1174x551',0),(322268835,'Mary Conley','80860 Shirley Meadow Apt. 117','East Diana','NJ',78625,'67','826.235.8124',0),(340399882,'Gregory Pineda','2430 Kemp Key','South James','TX',20030,'24','+1-300-724-6469x7588',0),(349665942,'Elaine Bell','779 Dale Via','West Rickyland','IL',99780,'77','(121)750-4569x91207',0),(353665813,'Dan Robbins','1422 Jimenez Islands','Jamesmouth','SD',55979,'42','181-107-8737x4264',0),(370542720,'Donald Roberts','5067 Wu River Suite 577','Jacobtown','PA',99012,'46','508-813-0599x778',0),(375499479,'Peter White','7146 Anderson Plain','East Mario','NE',84571,'55','001-403-825-1965',0),(393390354,'Kara Ayala','1100 James Canyon','Robertland','KY',57019,'37','(174)972-7149',0),(418362984,'Toni Barker','05616 Williams Ville','Longtown','NC',59196,'69','679-862-3272',0),(444123416,'Edward Hunt','6155 Herman Mountain Suite 270','Rebeccaland','AZ',20017,'55','885.881.8976x396',0),(493612886,'Luis Mayer','30760 Jonathan Lodge Suite 400','Lake Eric','MO',20024,'54','001-997-999-9307x83153',0),(496210796,'Kimberly Nguyen','0509 Palmer Parkway','South Michaelland','AS',36583,'65','798.018.4155',0),(538337584,'Gregory Crane','18800 Brent Curve Suite 649','South Kathleenport','RI',45383,'37','+1-791-834-1941x646',0),(557149404,'Jason Thomas','6347 Kevin Alley Suite 947','South Zachary','MS',93027,'37','+1-141-644-7440',0),(601019765,'Thomas Thompson','0077 David Skyway Suite 473','Lake Kristinmouth','NJ',50317,'59','902-970-8775x03807',0),(638335875,'Amanda Yang','4766 Caitlin Green','West Justin','AS',68118,'32','961.848.5627x51709',0),(639261951,'Karen Kelley','2907 Lisa Shoal','Brooksville','PR',57410,'78','(266)870-3741x81873',0),(642205068,'Janet Nguyen','57789 Lauren Lane Apt. 189','Foleybury','MT',71617,'21','439-269-8714x60336',0),(665072570,'Felicia Clark','2447 Holmes Way Apt. 024','Sarahbury','KS',1304,'57','(929)058-1070',0),(695915537,'Joanna Diaz','30931 Buck Squares','North Stephanieberg','NY',56268,'25','322-836-1663',0),(714413028,'Blake Lambert','00889 Ayers Stravenue Apt. 371','Larsentown','GA',80547,'41','033.127.7774x810',0),(720701509,'Julie Moore','43488 Duran Turnpike','West Elizabeth','MT',38874,'22','630-674-2588x9679',0),(768466624,'Sharon Nelson','82913 Scott Knolls','Fitzgeraldburgh','WI',60623,'35','366-216-3326x7260',0),(774327573,'Gregory Bates','064 Lisa Light','Davidtown','TN',55622,'42','951-156-2550',0),(793282718,'Robert Kelly','7622 Diana Corner','Lauraland','NV',26575,'74','(098)418-5517x61231',0),(815898685,'David Curtis','4605 Vasquez Heights Apt. 701','North Kimshire','AK',38631,'50','001-397-001-1525',0),(839407877,'Ivan Nash','96407 Shawn Springs','Mcintoshbury','AR',96810,'75','+1-987-048-0260',0),(862027420,'Victoria Petty','3169 Joshua Park','South Patricia','MP',80581,'77','(420)826-1087',0),(881380601,'Tracey Pierce','148 Crystal Divide','West Patrick','OR',52330,'28','750-709-3444',0),(889996381,'Donald Harrison','91247 Isaac Ferry','Grayhaven','CO',40573,'50','+1-879-502-6497x88383',0),(890326239,'Christopher Watson','183 Russell Valley Suite 997','Gwendolynside','NH',68107,'68','811.910.1748',0),(893013432,'Kimberly Shaw','1834 Black Dale','West Kevin','AS',19787,'42','201-861-7613',0),(894224740,'Amanda Torres','18973 Mcdowell Neck','North Cynthia','AL',90606,'40','+1-811-866-1448x760',0),(898873356,'William Baldwin','96534 Arias Squares','Butlerchester','NC',85839,'19','7478984424',0);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `idreport` int NOT NULL,
  `idmedicine` int NOT NULL,
  KEY `reportid_idx` (`idreport`),
  KEY `medid_idx` (`idmedicine`),
  CONSTRAINT `medid` FOREIGN KEY (`idmedicine`) REFERENCES `medicine` (`idmedicine`),
  CONSTRAINT `reportid` FOREIGN KEY (`idreport`) REFERENCES `report` (`idreport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receptionist` (
  `idreceptionist` int NOT NULL,
  PRIMARY KEY (`idreceptionist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptionist`
--

LOCK TABLES `receptionist` WRITE;
/*!40000 ALTER TABLE `receptionist` DISABLE KEYS */;
/*!40000 ALTER TABLE `receptionist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `idreport` int NOT NULL,
  `idpatient` bigint NOT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `idmedicine` int NOT NULL,
  `medecinename` varchar(60) DEFAULT NULL,
  `iddoctor` bigint NOT NULL,
  PRIMARY KEY (`idreport`),
  KEY `medid_idx` (`idmedicine`),
  KEY `doctorid_idx` (`iddoctor`),
  KEY `patientid_idx` (`idpatient`),
  CONSTRAINT `doctorid` FOREIGN KEY (`iddoctor`) REFERENCES `doctors` (`SSN`),
  CONSTRAINT `medicineid` FOREIGN KEY (`idmedicine`) REFERENCES `medicine` (`idmedicine`),
  CONSTRAINT `patientid` FOREIGN KEY (`idpatient`) REFERENCES `patients` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_has_bill`
--

DROP TABLE IF EXISTS `report_has_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_has_bill` (
  `idreport` int NOT NULL,
  `idbill` int NOT NULL,
  PRIMARY KEY (`idreport`,`idbill`),
  KEY `bill_idx` (`idbill`),
  CONSTRAINT `bill` FOREIGN KEY (`idbill`) REFERENCES `bill` (`idbill`),
  CONSTRAINT `reportsidentification` FOREIGN KEY (`idreport`) REFERENCES `report` (`idreport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_has_bill`
--

LOCK TABLES `report_has_bill` WRITE;
/*!40000 ALTER TABLE `report_has_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_has_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_has_meds`
--

DROP TABLE IF EXISTS `report_has_meds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_has_meds` (
  `idreport` int NOT NULL,
  `idmedicine` int NOT NULL,
  PRIMARY KEY (`idreport`,`idmedicine`),
  KEY `medicine_idx` (`idmedicine`),
  CONSTRAINT `medicine` FOREIGN KEY (`idmedicine`) REFERENCES `medicine` (`idmedicine`),
  CONSTRAINT `report` FOREIGN KEY (`idreport`) REFERENCES `report` (`idreport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_has_meds`
--

LOCK TABLES `report_has_meds` WRITE;
/*!40000 ALTER TABLE `report_has_meds` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_has_meds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomnum` varchar(45) NOT NULL,
  `roomstatus` varchar(45) NOT NULL,
  `idroom` int NOT NULL,
  PRIMARY KEY (`idroom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_has_patients`
--

DROP TABLE IF EXISTS `room_has_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_has_patients` (
  `idroom` int NOT NULL,
  `idpatients` bigint NOT NULL,
  PRIMARY KEY (`idroom`,`idpatients`),
  KEY `patients_idx` (`idpatients`),
  CONSTRAINT `patientsidentification` FOREIGN KEY (`idpatients`) REFERENCES `patients` (`SSN`),
  CONSTRAINT `room` FOREIGN KEY (`idroom`) REFERENCES `room` (`idroom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_has_patients`
--

LOCK TABLES `room_has_patients` WRITE;
/*!40000 ALTER TABLE `room_has_patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_has_patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-25 18:38:46
