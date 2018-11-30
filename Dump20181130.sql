CREATE DATABASE  IF NOT EXISTS `ras_demo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ras_demo`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: ras_demo
-- ------------------------------------------------------
-- Server version	5.6.14

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
-- Table structure for table `ras_department_master`
--

DROP TABLE IF EXISTS `ras_department_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_department_master` (
  `dept_id` int(11) NOT NULL,
  `dept_code` varchar(50) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `dept_short_name` varchar(50) DEFAULT NULL,
  `dept_owner_emp_code` int(11) NOT NULL,
  `dept_type` int(11) NOT NULL,
  `dept_alloc_flag` bit(1) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `rdm_dept_type_idx` (`dept_type`),
  KEY `rdm_org_id_idx` (`org_id`),
  CONSTRAINT `rdeptm_dept_type` FOREIGN KEY (`dept_type`) REFERENCES `ras_department_type` (`dept_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rdeptm_org_id` FOREIGN KEY (`org_id`) REFERENCES `ras_org_master` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_department_master`
--

LOCK TABLES `ras_department_master` WRITE;
/*!40000 ALTER TABLE `ras_department_master` DISABLE KEYS */;
INSERT INTO `ras_department_master` VALUES (1,'H001','Mechanical Engineering','ME',313102,1,'','\0',2),(2,'H002','Embedded Systems','ES',313098,1,'','\0',2),(3,'H003','Virtual Validation','VV',313099,1,'','\0',2),(4,'H004','Software Development','SD',313104,1,'','\0',2),(5,'H005','Manufacturing engineering','MAE',313643,1,'','\0',2),(6,'H006','Silicon Development','SILICON',0,1,'','\0',2),(7,'H007','Operations & Business Support Systems','OBSS',0,1,'','\0',2),(8,'H008','Industrial design and visualization','IDV',313102,1,'','\0',2),(9,'H009','Technical Publication','TP',313102,1,'','\0',2),(10,'V001','Automotive','AUTO',313075,2,'','\0',2),(11,'V002','Aerospace and Defense','ASD',312432,2,'','\0',2),(12,'V003','Consumer & Others','CPG',313074,2,'','\0',2),(13,'V004','Industrial & Electronics','IE',67539,2,'','\0',2),(14,'V005','Semicon','SEMI',79778,2,'','\0',2),(15,'V006','Telecom & Media','TEM',313070,2,'','\0',2),(16,'S001','Delivery Management','DM',0,4,'','\0',2),(17,'S002','Quality','QA',52554,4,'','\0',2),(18,'S003','Human Resources','HR',88123,4,'','\0',2),(19,'S004','Program & Innovation','PI',313068,4,'','\0',2),(20,'S005','Procurement','PROC',92032,4,'','\0',2),(21,'S006','Finance','FIN',307164,4,'','\0',2),(22,'S007','Administration','ADMIN',69890,4,'','\0',2),(23,'S008','Business Initiation Team','BIT',313638,4,'','\0',2),(24,'S009','Corporate Support','CS',302538,4,'','\0',2),(25,'S010','Vertical Head','VH',0,4,'','\0',2),(26,'S011','Business Development','BD',313070,4,'','\0',2),(27,'S012','Business Support','BS',0,4,'','\0',2),(28,'S013','Corporate Communication','CC',311225,4,'','\0',2),(29,'S014','Strategic Planning','STPL',95581,4,'','\0',2),(30,'S015','Systems and Networks','SN',97207,4,'','\0',2),(31,'S016','General Management','GM',302538,4,'','\0',2);
/*!40000 ALTER TABLE `ras_department_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ras_department_type`
--

DROP TABLE IF EXISTS `ras_department_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_department_type` (
  `dept_type_id` int(11) NOT NULL,
  `dept_type_name` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`dept_type_id`),
  KEY `rdt_org_id_idx` (`org_id`),
  CONSTRAINT `rdt_org_id` FOREIGN KEY (`org_id`) REFERENCES `ras_org_master` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_department_type`
--

LOCK TABLES `ras_department_type` WRITE;
/*!40000 ALTER TABLE `ras_department_type` DISABLE KEYS */;
INSERT INTO `ras_department_type` VALUES (1,'Horizontal','',2),(2,'Vertical','',2),(3,'Quality','',2),(4,'Support','',2);
/*!40000 ALTER TABLE `ras_department_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ras_designation_master`
--

DROP TABLE IF EXISTS `ras_designation_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_designation_master` (
  `emp_designation_id` int(11) NOT NULL,
  `emp_designation` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_designation_id`),
  KEY `rdm_org_id_idx` (`org_id`),
  CONSTRAINT `rdm_org_id` FOREIGN KEY (`org_id`) REFERENCES `ras_org_master` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_designation_master`
--

LOCK TABLES `ras_designation_master` WRITE;
/*!40000 ALTER TABLE `ras_designation_master` DISABLE KEYS */;
INSERT INTO `ras_designation_master` VALUES (1,'Trainee Engineer','',2),(2,'Graduate Engineer','',2),(3,'Engineer','',2),(4,'Advanced Engineer','',2),(5,'Project Manager','',2),(6,'Senior Manager','',2);
/*!40000 ALTER TABLE `ras_designation_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ras_employee_master`
--

DROP TABLE IF EXISTS `ras_employee_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_employee_master` (
  `emp_code` int(11) NOT NULL,
  `emp_type` int(11) NOT NULL,
  `emp_gender` enum('Male','Female') NOT NULL,
  `emp_fname` varchar(50) NOT NULL,
  `emp_mname` varchar(50) DEFAULT NULL,
  `emp_lname` varchar(50) NOT NULL,
  `emp_designation` int(11) NOT NULL,
  `emp_grade` int(11) NOT NULL,
  `emp_department` int(11) NOT NULL,
  `emp_doj` date NOT NULL,
  `emp_dor` date DEFAULT NULL,
  `emp_email_id` varchar(50) NOT NULL,
  `emp_pskill` varchar(50) DEFAULT NULL,
  `emp_sskill` varchar(50) DEFAULT NULL,
  `emp_work_type` int(11) NOT NULL,
  `emp_status` bit(1) NOT NULL,
  `emp_group` int(11) DEFAULT NULL,
  `emp_payroll_location` int(11) NOT NULL,
  `emp_location` int(11) NOT NULL,
  `emp_prev_exp` int(11) NOT NULL,
  `emp_exp_band` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_code`),
  KEY `rem_org_id_idx` (`org_id`),
  KEY `rem_work_type_idx` (`emp_work_type`),
  KEY `rem_emp_type_idx` (`emp_type`),
  KEY `rem_designation_idx` (`emp_designation`),
  KEY `rem_grade_idx` (`emp_grade`),
  KEY `rem_dept_id_idx` (`emp_department`),
  KEY `rem_emp_group_id_idx` (`emp_group`),
  KEY `rem_payroll_loc_id_idx` (`emp_payroll_location`),
  KEY `rem_loc_id_idx` (`emp_location`),
  KEY `rem_emp_band_exp_id_idx` (`emp_exp_band`),
  CONSTRAINT `rem_dept_id` FOREIGN KEY (`emp_department`) REFERENCES `ras_department_master` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rem_designation_id` FOREIGN KEY (`emp_designation`) REFERENCES `ras_designation_master` (`emp_designation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rem_emp_band_exp_id` FOREIGN KEY (`emp_exp_band`) REFERENCES `ras_experience_band_master` (`exp_band_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rem_emp_group_id` FOREIGN KEY (`emp_group`) REFERENCES `ras_group_master` (`emp_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rem_emp_type_id` FOREIGN KEY (`emp_type`) REFERENCES `ras_employee_type_master` (`emp_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rem_grade_id` FOREIGN KEY (`emp_grade`) REFERENCES `ras_grade_master` (`emp_grade_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rem_loc_id` FOREIGN KEY (`emp_location`) REFERENCES `ras_location_master` (`loc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rem_org_id` FOREIGN KEY (`org_id`) REFERENCES `ras_org_master` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rem_payroll_loc_id` FOREIGN KEY (`emp_payroll_location`) REFERENCES `ras_location_master` (`loc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rem_work_type_id` FOREIGN KEY (`emp_work_type`) REFERENCES `ras_work_type_master` (`emp_work_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_employee_master`
--

LOCK TABLES `ras_employee_master` WRITE;
/*!40000 ALTER TABLE `ras_employee_master` DISABLE KEYS */;
INSERT INTO `ras_employee_master` VALUES (313068,1,'Male','Binosh',NULL,'Balachandra',6,8,31,'2010-12-08',NULL,'binosh.balachandra@altran.com','Management',NULL,2,'',4,2,2,136,8,2),(313069,1,'Male','Nishanth',NULL,'Prabhakaran',6,7,17,'2011-06-06',NULL,'nishanth.prabhakaran@altran.com','Quality Manager',NULL,2,'',4,5,5,113,8,2),(313104,1,'Male','Siva Karthikeyan',NULL,'K',6,6,4,'2015-12-02',NULL,'sivakarthikeyan.k@altran.com','All Development',NULL,2,'',4,6,5,180,8,2),(313187,1,'Male','Hasan Jafferullah ',NULL,'Hoshmin',5,3,4,'2015-06-01',NULL,'hasanjafferullah.hoshmin@altran.com','Web Development','PHP,MySQL,HTML,CSS,JQury,Ajax',1,'',2,5,5,74,5,2),(313348,1,'Male','Sriguru',NULL,'V',3,1,4,'2015-06-01',NULL,'sriguru.v@altran.com','Web Development','PHP,MySQL,HTML,CSS,JQury,Ajax',1,'',1,5,5,12,3,2),(313479,1,'Male','Sarathkumar',NULL,'S',3,1,4,'2016-10-12',NULL,'sarathkumar.s2@altran.com','Web Development','PHP,MySQL,HTML,CSS,JQury,Ajax',1,'',1,5,5,13,3,2),(313652,1,'Female','Vidhya',NULL,'S',4,4,18,'2014-07-06',NULL,'vidhya.s@altran.com','Human Resources',NULL,2,'',1,6,6,12,3,2);
/*!40000 ALTER TABLE `ras_employee_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ras_employee_type_master`
--

DROP TABLE IF EXISTS `ras_employee_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_employee_type_master` (
  `emp_type_id` int(11) NOT NULL,
  `emp_type_name` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_type_id`),
  KEY `retm_org_id_idx` (`org_id`),
  CONSTRAINT `retm_org_id` FOREIGN KEY (`org_id`) REFERENCES `ras_org_master` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_employee_type_master`
--

LOCK TABLES `ras_employee_type_master` WRITE;
/*!40000 ALTER TABLE `ras_employee_type_master` DISABLE KEYS */;
INSERT INTO `ras_employee_type_master` VALUES (1,'FULL TIME EMPLOYEE','',2),(2,'PART TIME EMPLOYEE','',2);
/*!40000 ALTER TABLE `ras_employee_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ras_experience_band_master`
--

DROP TABLE IF EXISTS `ras_experience_band_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_experience_band_master` (
  `exp_band_id` int(11) NOT NULL,
  `exp_band_name` varchar(50) NOT NULL,
  `exp_remarks` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`exp_band_id`),
  KEY `rebm_org_id_idx` (`org_id`),
  CONSTRAINT `rebm_org_id` FOREIGN KEY (`org_id`) REFERENCES `ras_org_master` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_experience_band_master`
--

LOCK TABLES `ras_experience_band_master` WRITE;
/*!40000 ALTER TABLE `ras_experience_band_master` DISABLE KEYS */;
INSERT INTO `ras_experience_band_master` VALUES (1,'0 - 23 Months','Exp_band1','',2),(2,'24 - 47 Months','Exp_band2','',2),(3,'48 - 71 Months','Exp_band3','',2),(4,'72 - 95 Months','Exp_band4','',2),(5,'96 - 119 Months','Exp_band5','',2),(6,'120 - 143 Months','Exp_band6','',2),(7,'144 - 179 Months','Exp_band7','',2),(8,'180 - 239 Months','Exp_band8','',2),(9,'240 - 299 Months','Exp_band9','',2),(10,'300 - 358 Months','Exp_band10','',2),(11,'> 359 Months','Exp_band11','',2);
/*!40000 ALTER TABLE `ras_experience_band_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ras_grade_master`
--

DROP TABLE IF EXISTS `ras_grade_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_grade_master` (
  `emp_grade_id` int(11) NOT NULL,
  `emp_grade_name` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_grade_id`),
  KEY `rgm_org_id_idx` (`org_id`),
  CONSTRAINT `rgm_org_id` FOREIGN KEY (`org_id`) REFERENCES `ras_org_master` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_grade_master`
--

LOCK TABLES `ras_grade_master` WRITE;
/*!40000 ALTER TABLE `ras_grade_master` DISABLE KEYS */;
INSERT INTO `ras_grade_master` VALUES (1,'L1','',2),(2,'L2','',2),(3,'L3','',2),(4,'L4','',2),(5,'L5','',2),(6,'L6','',2),(7,'L7','',2),(8,'L8','',2);
/*!40000 ALTER TABLE `ras_grade_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ras_group_master`
--

DROP TABLE IF EXISTS `ras_group_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_group_master` (
  `emp_group_id` int(11) NOT NULL,
  `emp_group_name` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_group_id`),
  KEY `rgm_org_id_idx` (`org_id`),
  CONSTRAINT `rgroupm_org_id` FOREIGN KEY (`org_id`) REFERENCES `ras_org_master` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_group_master`
--

LOCK TABLES `ras_group_master` WRITE;
/*!40000 ALTER TABLE `ras_group_master` DISABLE KEYS */;
INSERT INTO `ras_group_master` VALUES (1,'ENGG','',2),(2,'PM','',2),(3,'VH','',2),(4,'HH','',2);
/*!40000 ALTER TABLE `ras_group_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ras_location_master`
--

DROP TABLE IF EXISTS `ras_location_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_location_master` (
  `loc_id` int(11) NOT NULL,
  `parent_loc_id` int(11) NOT NULL,
  `loc_name` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`loc_id`),
  KEY `rlm_org_id_idx` (`org_id`),
  CONSTRAINT `rlc_org_id` FOREIGN KEY (`org_id`) REFERENCES `ras_org_master` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_location_master`
--

LOCK TABLES `ras_location_master` WRITE;
/*!40000 ALTER TABLE `ras_location_master` DISABLE KEYS */;
INSERT INTO `ras_location_master` VALUES (1,0,'India','',2),(2,0,'US','',2),(3,1,'Tamilnadu','',2),(4,1,'Karnataka','',2),(5,3,'Coimbatore','',2),(6,4,'Banglore','',2),(7,5,'Hanudev Info Park','',2),(8,5,'CDC2','',2),(9,6,'Pritech','',2);
/*!40000 ALTER TABLE `ras_location_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ras_org_master`
--

DROP TABLE IF EXISTS `ras_org_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_org_master` (
  `org_id` int(11) NOT NULL,
  `org_name` varchar(50) NOT NULL,
  `org_status` bit(1) NOT NULL,
  `org_remarks` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_org_master`
--

LOCK TABLES `ras_org_master` WRITE;
/*!40000 ALTER TABLE `ras_org_master` DISABLE KEYS */;
INSERT INTO `ras_org_master` VALUES (1,'Altran Technologies India','','Banglore'),(2,'Altran Technologies India Pvt Ltd','','Coimbatore');
/*!40000 ALTER TABLE `ras_org_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ras_system_config`
--

DROP TABLE IF EXISTS `ras_system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_system_config` (
  `rsc_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `rsc_org_display_name` varchar(50) DEFAULT NULL,
  `rsc_org_short_name` varchar(50) DEFAULT NULL,
  `rsc_logo` varchar(50) DEFAULT NULL,
  `rsc_business_hours` int(11) DEFAULT NULL,
  `rsc_smtp_from_email_id` varchar(50) DEFAULT NULL,
  `rsc_smtp_site_mode` bit(1) DEFAULT NULL,
  `rsc_smtp_port_no` int(11) DEFAULT NULL,
  `rsc_footer_content` varchar(50) DEFAULT NULL,
  `rsc_site_freeze` bit(1) DEFAULT NULL,
  `rsc_contact_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rsc_id`),
  KEY `rsc_org_id_idx` (`org_id`),
  CONSTRAINT `rsc_org_id` FOREIGN KEY (`org_id`) REFERENCES `ras_org_master` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_system_config`
--

LOCK TABLES `ras_system_config` WRITE;
/*!40000 ALTER TABLE `ras_system_config` DISABLE KEYS */;
INSERT INTO `ras_system_config` VALUES (1,1,'Altran Technologies India - Banglore','ATI-BANG','ATI',8,'ati@altran.com','',485,'Welcome To ATI','\0','sarathkumar.s2@altran.com'),(2,2,'Altran Technologies India Pvt Ltd - Coimbatore','ATIPL-CBE','ATIPL',8,'atipl@altran.com','',526,'Welcome To ATIPL','\0','sarathkumar.s2@altran.com');
/*!40000 ALTER TABLE `ras_system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ras_user_login`
--

DROP TABLE IF EXISTS `ras_user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_user_login` (
  `ras_login_id` int(11) NOT NULL,
  `ras_emp_code` int(11) NOT NULL,
  `ras_username` varchar(50) NOT NULL,
  `ras_password` varchar(50) NOT NULL,
  `ras_login_type` enum('ELOGIN','LDAP') NOT NULL,
  `ras_last_login` datetime NOT NULL,
  `ras_login_status` bit(1) NOT NULL,
  `ras_login_ip` varchar(50) NOT NULL,
  `ras_browser_details` varchar(250) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`ras_login_id`),
  KEY `rul_org_id_idx` (`org_id`),
  CONSTRAINT `rul_org_id` FOREIGN KEY (`org_id`) REFERENCES `ras_org_master` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_user_login`
--

LOCK TABLES `ras_user_login` WRITE;
/*!40000 ALTER TABLE `ras_user_login` DISABLE KEYS */;
INSERT INTO `ras_user_login` VALUES (1,313068,'313068','313068','ELOGIN','2018-11-30 12:06:34','\0','10.91.96.36','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',2),(2,313068,'313068','313068','ELOGIN','2018-11-30 12:06:34','','10.91.96.37','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',2),(3,313104,'313104','313104','ELOGIN','2018-11-30 12:06:34','\0','10.91.96.38','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',2),(4,313187,'313187','313187','ELOGIN','2018-11-30 12:06:34','\0','10.91.96.35','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',2),(5,313348,'313348','313348','ELOGIN','2018-11-30 12:06:34','','10.91.96.31','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',2),(6,313479,'313479','313479','ELOGIN','2018-11-30 12:06:34','','10.91.96.25','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',2),(7,313652,'313652','313652','ELOGIN','2018-11-30 12:06:34','\0','10.91.96.76','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',2);
/*!40000 ALTER TABLE `ras_user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ras_work_type_master`
--

DROP TABLE IF EXISTS `ras_work_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ras_work_type_master` (
  `emp_work_type_id` int(11) NOT NULL,
  `emp_work_type_name` varchar(50) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_work_type_id`),
  KEY `rwtm_org_id_idx` (`org_id`),
  CONSTRAINT `rwtm_org_id` FOREIGN KEY (`org_id`) REFERENCES `ras_org_master` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ras_work_type_master`
--

LOCK TABLES `ras_work_type_master` WRITE;
/*!40000 ALTER TABLE `ras_work_type_master` DISABLE KEYS */;
INSERT INTO `ras_work_type_master` VALUES (1,'Offshore','',2),(2,'Onsite','',2),(3,'India Onsite','',2);
/*!40000 ALTER TABLE `ras_work_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ras_demo'
--

--
-- Dumping routines for database 'ras_demo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-30 16:03:44
