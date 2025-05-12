-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: mypro2
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `associator`
--

DROP TABLE IF EXISTS `associator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associator` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `verufy` int NOT NULL,
  `verufycode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associator`
--

LOCK TABLES `associator` WRITE;
/*!40000 ALTER TABLE `associator` DISABLE KEYS */;
INSERT INTO `associator` VALUES (1,'black','M','2025-06-19','aa@gmail.com','3d3f583ee3cf8547afab715006ca5e0248da718b7a925201c218d380ad4e6a23','0912345678','台中',0,'zv8yR');
/*!40000 ALTER TABLE `associator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add my message',7,'add_mymessage'),(26,'Can change my message',7,'change_mymessage'),(27,'Can delete my message',7,'delete_mymessage'),(28,'Can view my message',7,'view_mymessage'),(29,'Can add goods',8,'add_goods'),(30,'Can change goods',8,'change_goods'),(31,'Can delete goods',8,'delete_goods'),(32,'Can view goods',8,'view_goods'),(33,'Can add member',9,'add_member'),(34,'Can change member',9,'change_member'),(35,'Can delete member',9,'delete_member'),(36,'Can view member',9,'view_member'),(37,'Can add order model',10,'add_ordermodel'),(38,'Can change order model',10,'change_ordermodel'),(39,'Can delete order model',10,'delete_ordermodel'),(40,'Can view order model',10,'view_ordermodel'),(41,'Can add detail model',11,'add_detailmodel'),(42,'Can change detail model',11,'change_detailmodel'),(43,'Can delete detail model',11,'delete_detailmodel'),(44,'Can view detail model',11,'view_detailmodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$UUOkBcYacTp6awS4pFW0Yb$NgqliQ6h9P2G/eaWaMoiUuSwRc9qbpi+Tp4L0/eeem0=','2025-05-02 09:58:39.936394',1,'admin','','','admin@gmail.com',1,1,'2025-04-15 17:27:52.766436');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_detailmodel`
--

DROP TABLE IF EXISTS `cart_detailmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detailmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pname` varchar(100) NOT NULL,
  `unitprice` int NOT NULL,
  `quantity` int NOT NULL,
  `dtotal` int NOT NULL,
  `dorder_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_detailmodel_dorder_id_4a34f87f_fk_cart_ordermodel_id` (`dorder_id`),
  CONSTRAINT `cart_detailmodel_dorder_id_4a34f87f_fk_cart_ordermodel_id` FOREIGN KEY (`dorder_id`) REFERENCES `cart_ordermodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detailmodel`
--

LOCK TABLES `cart_detailmodel` WRITE;
/*!40000 ALTER TABLE `cart_detailmodel` DISABLE KEYS */;
INSERT INTO `cart_detailmodel` VALUES (1,'紅葡萄酒香巧克力',750,2,1500,1),(2,'紅葡萄酒香巧克力',750,2,1500,2),(3,'紅葡萄酒香巧克力',750,2,1500,3),(4,'紅葡萄酒香巧克力',750,2,1500,4);
/*!40000 ALTER TABLE `cart_detailmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_ordermodel`
--

DROP TABLE IF EXISTS `cart_ordermodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_ordermodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subtotal` int NOT NULL,
  `shipping` int NOT NULL,
  `grandtotal` int NOT NULL,
  `customname` varchar(50) NOT NULL,
  `customemail` varchar(100) NOT NULL,
  `customphone` varchar(15) NOT NULL,
  `customaddress` varchar(100) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `fivecode` varchar(10) DEFAULT NULL,
  `paytype` varchar(10) NOT NULL,
  `paymentype` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_ordermodel`
--

LOCK TABLES `cart_ordermodel` WRITE;
/*!40000 ALTER TABLE `cart_ordermodel` DISABLE KEYS */;
INSERT INTO `cart_ordermodel` VALUES (1,1500,120,1620,'黃先生','aa@gmail.com','01111111','台中市北區中正路101號','2025-05-06 10:22:05.734921',NULL,'信用卡',''),(2,0,120,120,'黃先生','aa@gmail.com','0911111111','台中市北區中正路101號','2025-05-06 10:24:01.391895',NULL,'信用卡',''),(3,1500,120,1520,'黃先生','aa@gmail.com','0911111111','台中市北區中正路101號','2025-05-06 10:25:25.273933',NULL,'信用卡',''),(4,1500,120,1520,'黃先生','aa@gmail.com','0911111111','台中市北區中正路101號','2025-05-06 10:26:21.465652',NULL,'貨到付款','');
/*!40000 ALTER TABLE `cart_ordermodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `content` longtext,
  `create_date` date NOT NULL,
  `response` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-05-02 08:12:00.841713','1','Goods object (1)',1,'[{\"added\": {}}]',8,1),(2,'2025-05-02 10:00:28.143388','2','Goods object (2)',1,'[{\"added\": {}}]',8,1),(3,'2025-05-02 10:05:10.121284','1','Goods object (1)',2,'[{\"changed\": {\"fields\": [\"Photo url\"]}}]',8,1),(4,'2025-05-02 10:05:18.272263','1','Goods object (1)',2,'[]',8,1),(5,'2025-05-02 10:05:21.778431','2','Goods object (2)',2,'[{\"changed\": {\"fields\": [\"Photo url\"]}}]',8,1),(6,'2025-05-02 10:18:42.250409','3','Goods object (3)',1,'[{\"added\": {}}]',8,1),(7,'2025-05-02 10:19:37.974946','3','Goods object (3)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'cart','detailmodel'),(10,'cart','ordermodel'),(7,'contact','mymessage'),(5,'contenttypes','contenttype'),(9,'member','member'),(8,'product','goods'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-15 17:24:05.060862'),(2,'auth','0001_initial','2025-04-15 17:24:05.584113'),(3,'admin','0001_initial','2025-04-15 17:24:05.720441'),(4,'admin','0002_logentry_remove_auto_add','2025-04-15 17:24:05.726416'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-15 17:24:05.730740'),(6,'contenttypes','0002_remove_content_type_name','2025-04-15 17:24:05.810535'),(7,'auth','0002_alter_permission_name_max_length','2025-04-15 17:24:05.870359'),(8,'auth','0003_alter_user_email_max_length','2025-04-15 17:24:05.934127'),(9,'auth','0004_alter_user_username_opts','2025-04-15 17:24:05.940422'),(10,'auth','0005_alter_user_last_login_null','2025-04-15 17:24:05.998469'),(11,'auth','0006_require_contenttypes_0002','2025-04-15 17:24:06.000474'),(12,'auth','0007_alter_validators_add_error_messages','2025-04-15 17:24:06.009412'),(13,'auth','0008_alter_user_username_max_length','2025-04-15 17:24:06.075284'),(14,'auth','0009_alter_user_last_name_max_length','2025-04-15 17:24:06.138412'),(15,'auth','0010_alter_group_name_max_length','2025-04-15 17:24:06.205414'),(16,'auth','0011_update_proxy_permissions','2025-04-15 17:24:06.210640'),(17,'auth','0012_alter_user_first_name_max_length','2025-04-15 17:24:06.307850'),(18,'sessions','0001_initial','2025-04-15 17:24:06.339103'),(19,'contact','0001_initial','2025-04-24 17:49:43.295897'),(20,'product','0001_initial','2025-04-27 06:02:42.412234'),(21,'member','0001_initial','2025-05-01 05:45:23.859697'),(22,'cart','0001_initial','2025-05-06 09:41:44.262185');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2xrgdt8vybu673b30ud3t4efoak9mvdp','.eJxVjEEOwiAQRe_C2hAGWwZcuu8ZCMOAVA0kpV0Z765NutDtf-_9l_BhW4vfelr8zOIiQJx-NwrxkeoO-B7qrcnY6rrMJHdFHrTLqXF6Xg_376CEXr61tSYjAyErx0gaYlSANI6YB6uJdDY6qXM0zhmO6CwPgNqCDUpzTk68P9naN4o:1u4caV:aa7wUMDVdomIeFR3ItEpbekaO5d194JCy7lCUJW6-vA','2025-04-29 17:28:15.779471'),('c9hw5x9r28hjsjus80kaw39xofkj2l3n','.eJxVjEEOwiAQRe_C2hAGWwZcuu8ZCMOAVA0kpV0Z765NutDtf-_9l_BhW4vfelr8zOIiQJx-NwrxkeoO-B7qrcnY6rrMJHdFHrTLqXF6Xg_376CEXr61tSYjAyErx0gaYlSANI6YB6uJdDY6qXM0zhmO6CwPgNqCDUpzTk68P9naN4o:1u8nSM:3LSYFCMiAK6j-D7AGnOvMwBXdJbAAmjsBMT4rBKA-eM','2025-05-11 05:53:06.891113'),('dw87zcnuytshd8vhlx80chzw1y60l6r9','.eJyrVkpOLCrJySwuUbKKjtVRyq10zU3MzFGyUkpMdEgHMfWS83OVdJQyix1zMstSlaxKikpTdZRykpOBatLz81OAclAjQCbUAgBhwxse:1uC80j:CX9yrm2CKH5oSUUs0GpltD1Nv9cMyQEDkG8YoCP_D2k','2025-05-20 10:26:21.472867'),('ge7a0vzwdv29ilye0gg93xqxhur25isa','.eJxVjEEOwiAQRe_C2hAGWwZcuu8ZCMOAVA0kpV0Z765NutDtf-_9l_BhW4vfelr8zOIiQJx-NwrxkeoO-B7qrcnY6rrMJHdFHrTLqXF6Xg_376CEXr61tSYjAyErx0gaYlSANI6YB6uJdDY6qXM0zhmO6CwPgNqCDUpzTk68P9naN4o:1u7up0:VACUhZvStP8okEK-tQ0WENwFbIT2v6gIxI3Xm25ywcM','2025-05-08 19:32:50.073025'),('hr0qnapw0q4ua6qhey7f8w1h5mx5vndo','.eJxVjEEOwiAQRe_C2hAGWwZcuu8ZCMOAVA0kpV0Z765NutDtf-_9l_BhW4vfelr8zOIiQJx-NwrxkeoO-B7qrcnY6rrMJHdFHrTLqXF6Xg_376CEXr61tSYjAyErx0gaYlSANI6YB6uJdDY6qXM0zhmO6CwPgNqCDUpzTk68P9naN4o:1uAffj:TrZlQcZ1xTwSXgPu5yRvbC-_ui7wDvr7hq13ebxk1tE','2025-05-16 09:58:39.941146'),('vras1xgai5pm0yzl2x5yfb5y38ou0fy6','.eJxVjksKwjAQQO-SdSlJbPNxpYJLz1CSmaSNpg00rSDi3U2hC90N89485k06sy5Dt2Y3dwHJkTBS_e6sgYebNoB3M_WphjQtc7D1ptQ7zfUtoYuX3f0LDCYP5Vop4SUyK5FqlJYzAMqkbVvpG8Wt5V5wRw8gtBYIUitsmOSKKUM5eqdLdHxdRxNiiRlz6rexPDMWEPI5hqcjx2VeXUUiQHH6lJB8viNQSL8:1uAfNi:7SrmrgUXKRZb1xQ10nxjyoG2gkb9RVOhoVaDikBAFks','2025-05-16 09:40:02.204492');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `platform` varchar(30) NOT NULL,
  `price` int NOT NULL,
  `discount` double NOT NULL,
  `photo_url` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `create_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Royal_Cacao 75% 黑巧克力','Royal_Cacao',450,408,'https://i.meee.com.tw/CiO61k8.jpg','成分： 可可膏、蔗糖、可可脂、大豆卵磷脂（乳化劑）、天然香草萃取  敘述： 來自精選產區的優質可可豆，Royal Cacao 70% 黑巧克力以完美比例調和濃郁可可與淡雅甜味。 低糖純粹、口感絲滑，散發出天然可可的果香與木質尾韻。 每一口都是尊貴的風味體驗，專為懂得品味的你而打造。','2025-05-02'),(2,'Royal_Cacao 80% 黑巧克力','Royal_Cacao',500,425,'https://i.meee.com.tw/CiO61k8.jpg','成分： 可可膏、可可脂、蔗糖、大豆卵磷脂（乳化劑）、天然香草萃取物  敘述： 以高比例可可含量呈現出原始可可豆的濃烈風味，Royal Cacao 80% 黑巧克力選用莊園級可可，打造絲滑口感與深邃層次。 入口帶有微苦果香、堅果與微焙木質調，餘韻悠長，是極致純粹與奢華風格的完美體現。 獻給鍾情真實可可本質的品味者。','2025-05-02'),(3,'紅葡萄酒香巧克力','Royal_Cacao',750,638,'https://meee.com.tw/8YAlcej.jpg','成分： 可可膏、蔗糖、可可脂、葡萄酒濃縮液（或葡萄酒粉）、大豆卵磷脂（乳化劑）、天然香草萃取敘述：物沉穩可可與迷人葡萄酒香氣交織出濃厚而不失優雅的韻味。 Royal Cacao 葡萄酒巧克力以70%黑巧克力為基底，加入葡萄酒濃縮精華，帶來微醺果韻與馥郁香氣，口感層次迷人，回甘悠長。 是一款為夜晚、紅酒與品味時刻而生的奢華甜點。','2025-05-02');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-07 14:52:59
