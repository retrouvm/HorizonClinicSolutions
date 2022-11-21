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
  `iddoctor` int NOT NULL,
  `idpatient` int NOT NULL,
  PRIMARY KEY (`idappointment`),
  KEY `iddoc_idx` (`iddoctor`),
  KEY `idpatients_idx` (`idpatient`),
  CONSTRAINT `iddoc` FOREIGN KEY (`iddoctor`) REFERENCES `doctor` (`iddoctor`),
  CONSTRAINT `idpatients` FOREIGN KEY (`idpatient`) REFERENCES `patient` (`idpatient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `idbill` int NOT NULL,
  `idpatient` int NOT NULL,
  `iddoctor` int NOT NULL,
  `numofdays` int NOT NULL,
  `medicinecost` int DEFAULT NULL,
  `idmedicine` int DEFAULT NULL,
  `billtotal` int NOT NULL,
  PRIMARY KEY (`idbill`),
  KEY `patientsid_idx` (`idpatient`),
  KEY `doctorsid_idx` (`iddoctor`),
  KEY `medicid_idx` (`idmedicine`),
  CONSTRAINT `doctorsid` FOREIGN KEY (`iddoctor`) REFERENCES `doctor` (`iddoctor`),
  CONSTRAINT `medicid` FOREIGN KEY (`idmedicine`) REFERENCES `medicine` (`idmedicine`),
  CONSTRAINT `patientsid` FOREIGN KEY (`idpatient`) REFERENCES `patient` (`idpatient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `iddoctor` int NOT NULL,
  `doctorName` varchar(60) NOT NULL,
  `departmentname` varchar(60) NOT NULL,
  `iddepartment` int NOT NULL,
  PRIMARY KEY (`iddoctor`),
  UNIQUE KEY `idDoctor_UNIQUE` (`iddoctor`),
  KEY `deptid_idx` (`iddepartment`),
  CONSTRAINT `deptid` FOREIGN KEY (`iddepartment`) REFERENCES `department` (`iddepartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `idnurse` int NOT NULL,
  `nurseName` varchar(60) NOT NULL,
  `department` varchar(45) NOT NULL,
  `idroom` int NOT NULL,
  PRIMARY KEY (`idnurse`),
  UNIQUE KEY `idnurse_UNIQUE` (`idnurse`),
  KEY `roomid_idx` (`idroom`),
  CONSTRAINT `roomid` FOREIGN KEY (`idroom`) REFERENCES `room` (`idroom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `idpatient` int NOT NULL,
  `patientname` varchar(60) NOT NULL,
  `patientsex` varchar(45) NOT NULL,
  `patientage` int NOT NULL,
  `patientemail` varchar(60) DEFAULT NULL,
  `patientCellphone` varchar(11) DEFAULT NULL,
  `iddoctor` int NOT NULL,
  `addressstreet` varchar(60) DEFAULT NULL,
  `addresscity` varchar(45) DEFAULT NULL,
  `addressstate` varchar(45) DEFAULT NULL,
  `addresszip` varchar(10) DEFAULT NULL,
  `idroom` int NOT NULL,
  PRIMARY KEY (`idpatient`),
  UNIQUE KEY `idpatient_UNIQUE` (`idpatient`),
  KEY `doctorid_idx` (`iddoctor`),
  KEY `idofdoctor_idx` (`iddoctor`),
  KEY `roomid_idx` (`idroom`),
  CONSTRAINT `idofdoctor` FOREIGN KEY (`iddoctor`) REFERENCES `doctor` (`iddoctor`),
  CONSTRAINT `idroom` FOREIGN KEY (`idroom`) REFERENCES `room` (`idroom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `idreport` int NOT NULL,
  `idpatient` int NOT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `idmedicine` int NOT NULL,
  `medecinename` varchar(60) DEFAULT NULL,
  `iddoctor` int NOT NULL,
  PRIMARY KEY (`idreport`),
  KEY `doctorid_idx` (`iddoctor`),
  KEY `patientid_idx` (`idpatient`),
  KEY `medid_idx` (`idmedicine`),
  CONSTRAINT `doctorid` FOREIGN KEY (`iddoctor`) REFERENCES `doctor` (`iddoctor`),
  CONSTRAINT `medicineid` FOREIGN KEY (`idmedicine`) REFERENCES `medicine` (`idmedicine`),
  CONSTRAINT `patientid` FOREIGN KEY (`idpatient`) REFERENCES `patient` (`idpatient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-20 11:42:41
