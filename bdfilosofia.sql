-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: omp_filosofia
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_keys`
--

DROP TABLE IF EXISTS `access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_keys`
--

LOCK TABLES `access_keys` WRITE;
/*!40000 ALTER TABLE `access_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_settings`
--

LOCK TABLES `announcement_settings` WRITE;
/*!40000 ALTER TABLE `announcement_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_type_settings`
--

DROP TABLE IF EXISTS `announcement_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_type_settings`
--

LOCK TABLES `announcement_type_settings` WRITE;
/*!40000 ALTER TABLE `announcement_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_types`
--

DROP TABLE IF EXISTS `announcement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_types`
--

LOCK TABLES `announcement_types` WRITE;
/*!40000 ALTER TABLE `announcement_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sources` (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` smallint(6) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,'','country','MX'),(1,'','orcid',''),(1,'','url',''),(1,'es_ES','affiliation',''),(1,'es_ES','biography',''),(1,'es_ES','familyName','Rodríguez Sánchez'),(1,'es_ES','givenName','María Guadalupe'),(2,'','country','AR'),(2,'','orcid',''),(2,'','url',''),(2,'en_US','affiliation',''),(2,'en_US','biography',''),(2,'en_US','familyName',''),(2,'en_US','givenName',''),(2,'es_ES','affiliation',''),(2,'es_ES','biography',''),(2,'es_ES','familyName','Zárate'),(2,'es_ES','givenName','Camilo'),(3,'','country','MX'),(3,'','orcid','https://orcid.org/0000-0003-0325-9723'),(3,'','url',''),(3,'en_US','affiliation',''),(3,'en_US','biography',''),(3,'en_US','familyName',''),(3,'en_US','givenName',''),(3,'en_US','preferredPublicName',''),(3,'es_ES','affiliation','Universidad Atónoma Metropolitana Unidad Iztapalapa'),(3,'es_ES','biography',''),(3,'es_ES','familyName','Domínguez Miranda'),(3,'es_ES','givenName','Claudia Maribel'),(3,'es_ES','preferredPublicName',''),(4,'','country','MX'),(4,'','orcid',''),(4,'','url',''),(4,'en_US','affiliation',''),(4,'en_US','biography',''),(4,'en_US','familyName',''),(4,'en_US','givenName',''),(4,'en_US','preferredPublicName',''),(4,'es_ES','affiliation','UAM Iztapalapa'),(4,'es_ES','biography',''),(4,'es_ES','familyName','Catalogo catalogo'),(4,'es_ES','givenName','Prueba prueba'),(4,'es_ES','preferredPublicName',''),(5,'','country','MX'),(5,'','orcid',''),(5,'','url',''),(5,'en_US','affiliation',''),(5,'en_US','biography',''),(5,'en_US','familyName',''),(5,'en_US','givenName',''),(5,'en_US','preferredPublicName',''),(5,'es_ES','affiliation',''),(5,'es_ES','biography',''),(5,'es_ES','familyName',''),(5,'es_ES','givenName','Sergio Pérez Cortés'),(5,'es_ES','preferredPublicName',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','preferredPublicName',''),(6,'','country','MX'),(6,'','orcid',''),(6,'','url',''),(6,'en_US','affiliation',''),(6,'en_US','biography',''),(6,'en_US','familyName',''),(6,'en_US','givenName',''),(6,'en_US','preferredPublicName',''),(6,'es_ES','affiliation',''),(6,'es_ES','biography',''),(6,'es_ES','familyName',''),(6,'es_ES','givenName','Sergio Pérez Cortés'),(6,'es_ES','preferredPublicName',''),(6,'fr_CA','affiliation',''),(6,'fr_CA','biography',''),(6,'fr_CA','familyName',''),(6,'fr_CA','givenName',''),(6,'fr_CA','preferredPublicName',''),(7,'','country','MX'),(7,'','orcid',''),(7,'','url',''),(7,'en_US','affiliation',''),(7,'en_US','biography',''),(7,'en_US','familyName',''),(7,'en_US','givenName',''),(7,'en_US','preferredPublicName',''),(7,'es_ES','affiliation',''),(7,'es_ES','biography',''),(7,'es_ES','familyName',''),(7,'es_ES','givenName','Teresa Santiago'),(7,'es_ES','preferredPublicName',''),(7,'fr_CA','affiliation',''),(7,'fr_CA','biography',''),(7,'fr_CA','familyName',''),(7,'fr_CA','givenName',''),(7,'fr_CA','preferredPublicName',''),(8,'','country','MX'),(8,'','orcid',''),(8,'','url',''),(8,'en_US','affiliation',''),(8,'en_US','biography',''),(8,'en_US','familyName',''),(8,'en_US','givenName',''),(8,'en_US','preferredPublicName',''),(8,'es_ES','affiliation',''),(8,'es_ES','biography',''),(8,'es_ES','familyName',''),(8,'es_ES','givenName','Teresa Santiago'),(8,'es_ES','preferredPublicName',''),(8,'fr_CA','affiliation',''),(8,'fr_CA','biography',''),(8,'fr_CA','familyName',''),(8,'fr_CA','givenName',''),(8,'fr_CA','preferredPublicName','');
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint(6) NOT NULL DEFAULT 1,
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `user_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_publication_id` (`publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'pubf@xanum.uam.mx',1,1,0.00,13),(2,'cami_zarate@gmail.com',1,2,0.00,13),(3,'pubf@xanum.uam.mx',1,4,0.00,13),(4,'pcatalago@gmail.com',1,5,0.00,13),(5,'pubf@xanum.uam.mx',1,6,0.00,13),(6,'pubf@xanum.uam.mx',1,7,0.00,13),(7,'pubf@xanum.uam.mx',1,8,0.00,13),(8,'pubf@xanum.uam.mx',1,9,0.00,13);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,0,1,'cienciassociales','a:0:{}'),(2,1,1,10000,'historia','a:0:{}');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_settings`
--

DROP TABLE IF EXISTS `category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_settings` (
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
INSERT INTO `category_settings` VALUES (1,'','sortOption','datePublished-2','string'),(1,'es_ES','description','<p>hdjskjdslsslkfñlamalasnskld</p>','string'),(1,'es_ES','title','Ciencias Sociales','string'),(2,'','sortOption','datePublished-2','string'),(2,'en_US','description','','string'),(2,'en_US','title','','string'),(2,'es_ES','description','','string'),(2,'es_ES','title','Historia','string');
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_settings`
--

LOCK TABLES `citation_settings` WRITE;
/*!40000 ALTER TABLE `citation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citations`
--

DROP TABLE IF EXISTS `citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL DEFAULT 0,
  `raw_citation` text NOT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_payments`
--

DROP TABLE IF EXISTS `completed_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` varchar(16) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_payments`
--

LOCK TABLES `completed_payments` WRITE;
/*!40000 ALTER TABLE `completed_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entries`
--

DROP TABLE IF EXISTS `controlled_vocab_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (7,1,0.00),(1,2,1.00),(2,2,2.00),(3,2,3.00),(4,4,1.00),(5,7,1.00),(6,9,1.00),(71,17,1.00),(72,17,2.00),(73,18,1.00),(74,18,2.00),(75,18,3.00),(76,19,1.00),(77,20,1.00);
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'es_ES','submissionKeyword','Literatura medieval','string'),(2,'es_ES','submissionKeyword','Literatura áurea','string'),(3,'es_ES','submissionKeyword','Literatura virreinal','string'),(4,'es_ES','submissionDiscipline','Letras','string'),(5,'es_ES','submissionKeyword','Guerra México-Estados Unidos','string'),(6,'es_ES','submissionDiscipline','Historia','string'),(7,'','interest','Publicaciones','string'),(71,'es_ES','submissionKeyword','Feminismo','string'),(72,'es_ES','submissionKeyword','Feminista','string'),(73,'es_ES','submissionSubject','Castellanos, Rosario,1925-1974 -- Crítica e interpretación','string'),(74,'es_ES','submissionSubject','Mujeres intelectuales -- México','string'),(75,'es_ES','submissionSubject','Autoras mexicanas -- Siglo XX','string'),(76,'es_ES','submissionDiscipline','Literatura y retórica ','string'),(77,'es_ES','submissionLanguage','es','string');
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (1,'interest',0,0),(6,'submissionAgency',1048588,1),(11,'submissionAgency',1048588,2),(16,'submissionAgency',1048588,3),(21,'submissionAgency',1048588,4),(26,'submissionAgency',1048588,5),(31,'submissionAgency',1048588,6),(36,'submissionAgency',1048588,7),(41,'submissionAgency',1048588,8),(46,'submissionAgency',1048588,9),(4,'submissionDiscipline',1048588,1),(9,'submissionDiscipline',1048588,2),(14,'submissionDiscipline',1048588,3),(19,'submissionDiscipline',1048588,4),(24,'submissionDiscipline',1048588,5),(29,'submissionDiscipline',1048588,6),(34,'submissionDiscipline',1048588,7),(39,'submissionDiscipline',1048588,8),(44,'submissionDiscipline',1048588,9),(2,'submissionKeyword',1048588,1),(7,'submissionKeyword',1048588,2),(12,'submissionKeyword',1048588,3),(17,'submissionKeyword',1048588,4),(22,'submissionKeyword',1048588,5),(27,'submissionKeyword',1048588,6),(32,'submissionKeyword',1048588,7),(37,'submissionKeyword',1048588,8),(42,'submissionKeyword',1048588,9),(5,'submissionLanguage',1048588,1),(10,'submissionLanguage',1048588,2),(15,'submissionLanguage',1048588,3),(20,'submissionLanguage',1048588,4),(25,'submissionLanguage',1048588,5),(30,'submissionLanguage',1048588,6),(35,'submissionLanguage',1048588,7),(40,'submissionLanguage',1048588,8),(45,'submissionLanguage',1048588,9),(3,'submissionSubject',1048588,1),(8,'submissionSubject',1048588,2),(13,'submissionSubject',1048588,3),(18,'submissionSubject',1048588,4),(23,'submissionSubject',1048588,5),(28,'submissionSubject',1048588,6),(33,'submissionSubject',1048588,7),(38,'submissionSubject',1048588,8),(43,'submissionSubject',1048588,9);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

DROP TABLE IF EXISTS `data_object_tombstone_oai_set_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_oai_set_objects`
--

LOCK TABLES `data_object_tombstone_oai_set_objects` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_settings`
--

DROP TABLE IF EXISTS `data_object_tombstone_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_settings`
--

LOCK TABLES `data_object_tombstone_settings` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstones`
--

DROP TABLE IF EXISTS `data_object_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstones`
--

LOCK TABLES `data_object_tombstones` WRITE;
/*!40000 ALTER TABLE `data_object_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_decisions`
--

DROP TABLE IF EXISTS `edit_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` smallint(6) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `cc_recipients` text DEFAULT NULL,
  `bcc_recipients` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default`
--

DROP TABLE IF EXISTS `email_templates_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `can_disable` smallint(6) NOT NULL DEFAULT 0,
  `can_edit` smallint(6) NOT NULL DEFAULT 0,
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL,NULL),(4,'PASSWORD_RESET',0,1,NULL,NULL,NULL),(5,'USER_REGISTER',0,1,NULL,NULL,NULL),(6,'USER_VALIDATE',0,1,NULL,NULL,NULL),(7,'REVIEWER_REGISTER',0,1,NULL,NULL,NULL),(8,'PUBLISH_NOTIFY',0,1,NULL,NULL,NULL),(9,'SUBMISSION_ACK',1,1,NULL,65536,1),(10,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536,1),(11,'EDITOR_ASSIGN',1,1,16,16,1),(12,'REVIEW_CANCEL',1,1,16,4096,3),(13,'REVIEW_REINSTATE',1,1,16,4096,3),(14,'REVIEW_REQUEST',1,1,16,4096,3),(15,'REVIEW_REQUEST_ONECLICK',1,1,16,4096,3),(16,'REVIEW_REQUEST_REMIND_AUTO',0,1,NULL,4096,3),(17,'REVIEW_REQUEST_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),(18,'REVIEW_REQUEST_ATTACHED',0,1,16,4096,3),(19,'REVIEW_CONFIRM',1,1,4096,16,3),(20,'REVIEW_DECLINE',1,1,4096,16,3),(21,'REVIEW_ACK',1,1,16,4096,3),(22,'REVIEW_REMIND',0,1,16,4096,3),(23,'REVIEW_REMIND_AUTO',0,1,NULL,4096,3),(24,'REVIEW_REMIND_ONECLICK',0,1,16,4096,3),(25,'REVIEW_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),(26,'EDITOR_DECISION_ACCEPT',0,1,16,65536,3),(27,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,1,16,65536,3),(28,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,1,16,65536,5),(29,'EDITOR_DECISION_REVISIONS',0,1,16,65536,3),(30,'EDITOR_DECISION_RESUBMIT',0,1,16,65536,3),(31,'EDITOR_DECISION_DECLINE',0,1,16,65536,3),(32,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536,1),(33,'EDITOR_RECOMMENDATION',0,1,16,16,3),(34,'COPYEDIT_REQUEST',1,1,16,4097,4),(35,'LAYOUT_REQUEST',1,1,16,4097,5),(36,'LAYOUT_COMPLETE',1,1,4097,16,5),(37,'INDEX_REQUEST',1,1,16,4097,5),(38,'INDEX_COMPLETE',1,1,4097,16,5),(39,'EMAIL_LINK',0,1,1048576,NULL,NULL),(40,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17,NULL),(41,'ANNOUNCEMENT',0,1,16,1048576,NULL),(42,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL,NULL),(43,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `email_templates_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.','This email is sent when a new announcement is created.'),('ANNOUNCEMENT','es_ES','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisite nuestra página web para leer el <a href=\"{$url}\">aviso completo</a>.','Este correo electrónico se envía cuando se crea un aviso nuevo.'),('COPYEDIT_REQUEST','en_US','Copyediting Request','{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and click on the File that appears in Step 1.<br />\n3. Consult Copyediting Instructions posted on webpage.<br />\n4. Open the downloaded file and copyedit, while adding Author Queries as needed.<br />\n5. Save copyedited file, and upload to Step 1 of Copyediting.<br />\n6. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}','This email is sent by a Series Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),('COPYEDIT_REQUEST','es_ES','Solicitud de corrección de originales','{$copyeditorName}:<br />\n<br />\nSolicito que realice la corrección del original &quot;{$submissionTitle}&quot; para {$contextName} siguiendo los siguientes pasos.<br />\n1. Haga clic en la URL del envío que aparece debajo.<br />\n2. Inicie sesión en la publicación y haga clic en el archivo que aparece en el paso 1.<br />\n3. Consulte las Instrucciones de corrección publicadas en la página web.<br />\n4. Abra el archivo descargado, corríjalo y añada consultas al autor/a si es necesario.<br />\n5. Guarde el archivo corregido y súbalo al paso 1 de corrección.<br />\n6. Envíe el correo electrónico COMPLETO al editor/a.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL del envío: {$submissionCopyeditingUrl}<br />\nNombre de usuario/a: {$copyeditorUsername}','El editor/a de la serie envía este correo electrónico al corrector/a del envío para solicitar que se inicie el proceso de corrección. Proporciona información sobre el envío y cómo acceder al mismo.'),('COPYEDIT_REQUEST','fr_CA','Requête de révision','{$participantName}:<br />\n<br />\nJ\'aimerais que vous entamiez le processus de révision de l\'article &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez suivre les étapes suivantes.<br />\n<br />\n1. Cliquez sure le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et cliquez sur le fichier qui apparait à l\'étape 1.<br />\n3. Lisez les instructions de révision publiées sur la page Web.<br />\n4. Ouvrez le fichier téléchargé et débutez le processus de révision, tout en ajoutant des questions pour les auteurs, au besoin.<br />\n5. Sauvegardez le fichier révisé et téléchargez-le à l\'étape 1 de Révision.<br />\n6. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$participantUsername}','Ce courriel est envoyé par le rédacteur en chef d\'une série au réviseur de la soumission afin qu\'il entame de processus de révision, lorsque l\'évaluation par les pairs est terminée. Il explique comment accéder à la soumission.'),('EDITOR_ASSIGN','en_US','Editorial Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you,','This email notifies a Series Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the press site.'),('EDITOR_ASSIGN','es_ES','Tarea editorial','{$editorialContactName}:<br />\n<br />\nEl envío &quot;{$submissionTitle}&quot; a {$contextName} se le asignó para llevar a cabo el proceso editorial en calidad de editor/a.<br />\n<br />\nURL de envío: {$submissionUrl}<br />\nNombre de usuario/a: {$editorUsername}<br />\n<br />\nGracias,','Este correo electrónico notifica al editor/a de la serie que el editor/a le asignó la tarea de supervisar un envío a lo largo del proceso de edición. Proporciona información sobre el envío y sobre cómo acceder al sitio de la publicación.'),('EDITOR_ASSIGN','fr_CA','Travail éditorial','{$editorialContactName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$contextName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$editorUsername}<br />\n<br />\nMerci,','Ce courriel indique au rédacteur en chef d\'une série qu\'on lui a assigné la tâche de superviser une soumission tout au long de son processus éditorial. Il contient des renseignements sur la soumission et indique comment accéder au site de la presse.'),('EDITOR_DECISION_ACCEPT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_ACCEPT','es_ES','Decisión del coordinador','{$authorName}:<br />\n<br />\nHemos tomado una decisión con respecto al envío que realizó a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es:<br />\n<br />\nURL del manuscrito: {$submissionUrl}','El editor/a o el editor/a de la serie envía este correo electrónico a un autor/a para notificar la decisión final con respecto a su envío.'),('EDITOR_DECISION_ACCEPT','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_DECLINE','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_DECLINE','es_ES','Decisión del coordinador','{$authorName}:<br />\n<br />\nHemos tomado una decisión con respecto al envío que realizó a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es:<br />\n<br />\nURL del manuscrito: {$submissionUrl}','El editor/a o el editor/a de la serie envía este correo electrónico a un autor/a para notificar la decisión final con respecto a su envío.'),('EDITOR_DECISION_DECLINE','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Editor Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\nManuscript URL: {$submissionUrl}\n		','This email is send to the author if the editor declines his submission initially, before the review stage'),('EDITOR_DECISION_INITIAL_DECLINE','es_ES','Decisión del editor/a','\n			{$authorName}:<br />\n<br />\nHemos llegado a una decisión respecto de su presentación {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: rechazar la presentación<br />\n<br />\nURL del manuscripto: {$submissionUrl}\n		','Este correo electrónico se envía al autor si el editor rechaza inicialmente su presentación, antes de la etapa de revisión'),('EDITOR_DECISION_RESUBMIT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_RESUBMIT','es_ES','Decisión del coordinador','{$authorName}:<br />\n<br />\nHemos tomado una decisión con respecto al envío que realizó a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es:<br />\n<br />\nURL del manuscrito: {$submissionUrl}','El editor/a o el editor/a de la serie envía este correo electrónico a un autor/a para notificar la decisión final con respecto a su envío.'),('EDITOR_DECISION_RESUBMIT','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_REVISIONS','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_REVISIONS','es_ES','Decisión del coordinador','{$authorName}:<br />\n<br />\nHemos tomado una decisión con respecto al envío que realizó a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es:<br />\n<br />\nURL del manuscrito: {$submissionUrl}','El editor/a o el editor/a de la serie envía este correo electrónico a un autor/a para notificar la decisión final con respecto a su envío.'),('EDITOR_DECISION_REVISIONS','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to an external review.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','es_ES','Decisión del coordinador','{$authorName}:<br />\n<br />\nHemos tomado una decisión con respecto al envío que realizó a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es:<br />\n<br />\nURL del manuscrito: {$submissionUrl}','El editor/a o el editor/a de la serie envía este correo electrónico a un autor/a para notificar la remisión de su envío a una revisión externa.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour l\'informer que sa soumission sera envoyée à un évaluateur externe.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Editor Decision','{$authorName}:<br />\n<br />\nThe editing of your manuscript, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to production.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','es_ES','Decisión del coordinador','{$authorName}:<br />\n<br />\nLa edición de su manuscrito, &quot;{$submissionTitle},&quot; se ha completado.  Procedemos ahora a enviarlo a producción.<br />\n<br />\nURL del manuscrito: {$submissionUrl}','El editor/a o el editor/a de la serie envía este correo electrónico a un autor/a para notificar la remisión de su envío para producción.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nLa révision de votre manuscrit &quot;{$submissionTitle}&quot; est terminée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour l\'informer que sa soumission passera à l\'étape de production.'),('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}','This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),('EDITOR_RECOMMENDATION','es_ES','Recomendación del editor/a','{$editors}:<br />\n<br />\nLa recomendación respecto a la presentación {$contextName}, &quot;{$submissionTitle}&quot; es: {$recommendation}','Este correo electrónico del Editor o Editor de Sección recomendando a los Editores o Editores de Sección a quienes se les notifica una recomendación final con respecto a la presentación.'),('EMAIL_LINK','en_US','Manuscript of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$monographUrl}&quot;.','This email template provides a registered reader with the opportunity to send information about a monograph to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Press Manager in the Reading Tools Administration page.'),('EMAIL_LINK','es_ES','Manuscrito de posible interés','Quizá le interese consultar &quot;{$submissionTitle}&quot; de {$authorName} publicado en el vol. {$volume}, n.º {$number} ({$year}) de {$contextName} en &quot;{$monographUrl}&quot;.','Esta plantilla de correo electrónico da al lector/a registrado la oportunidad de enviar información sobre una monografía a alguien que pueda estar interesado. Está disponible en las Herramientas de lectura y debe ser habilitada por el jefe/a editorial en la página de Administración de herramientas de lectura.'),('EMAIL_LINK','fr_CA','Manuscrit susceptible d\'intéresser','Nous crayons que l\'article intitulé &quot;{$submissionTitle}&quot; par {$authorName} publié dans le Volume {$volume}, No {$number} ({$year}) de la presse {$contextName} au &quot;{$monographUrl}&quot; pourrait vous intéresser.','Ce modèle de courriel permet à un lecteur inscrit d\'envoyer des renseignements sur une monographie à une personne qui pourrait être intéressée. Il est disponible dans les Outils de lecture et peut être activé par le gestionnaire de la presse sur la page Administration des outils de lecture.'),('INDEX_COMPLETE','en_US','Index Galleys Complete','{$editorialContactName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}','This email from the Indexer to the Series Editor notifies them that the index creation process has been completed.'),('INDEX_COMPLETE','es_ES','Galeradas de índice completadas','{$editorialContactName}:<br />\n<br />\nLos índices para el manuscrito &quot;{$submissionTitle}&quot; para {$contextName} están preparados y listos para la corrección de pruebas.<br />\n<br />\nSi tiene alguna duda, puede ponerse en contacto conmigo.<br />\n<br />\n{$signatureFullName}','El indexador/a envía este correo electrónico al editor/a de la serie para notificar que el proceso de creación de índices se completó.'),('INDEX_COMPLETE','fr_CA','Indexage des épreuves en placard complété','{$editorialContactName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$contextName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}','Ce courriel est envoyé par l\'indexateur au rédacteur en chef d\'une série pour lui indiquer que l\'indexage est terminé.'),('INDEX_REQUEST','en_US','Request Index','{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$editorialContactSignature}','This email from the Series Editor to the Indexer notifies them that they have been assigned the task of creating indexes for a submission. It provides information about the submission and how to access it.'),('INDEX_REQUEST','es_ES','Solicitud de índice','{$indexerName}:<br />\n<br />\nEs necesario crear índices al envío &quot;{$submissionTitle}&quot; a {$contextName} siguiendo los siguientes pasos.<br />\n1. Haga clic en la URL del envío que aparece debajo.<br />\n2. Inicie sesión en la publicación y use el fichero Galeradas de la página para crear galeradas según los estándares de publicación.<br />\n3. Envíe el correo electrónico COMPLETO al editor/a.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL del envío: {$submissionUrl}<br />\nNombre de usuario/a: {$indexerUsername}<br />\n<br />\nSi no puede realizar esta tarea en este momento o tiene alguna duda, póngase en contacto conmigo. Gracias por su contribución a la publicación.<br />\n<br />\n{$editorialContactSignature}','El editor/a de la serie envía este correo electrónico al indexador/a para notificar que se les asignó la tarea de creación de índices para un envío. Proporciona información sobre el envío y cómo acceder al mismo.'),('INDEX_REQUEST','fr_CA','Requête d\'indexage','{$participantName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$contextName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d\'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$participantUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.<br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé à l\'indexateur par le rédacteur en chef d\'une série pour lui indiquer qu\'il devra créer les index de la soumission en question. Il contient des renseignements sur la soumission et explique comment y accéder.'),('LAYOUT_COMPLETE','en_US','Layout Galleys Complete','{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}','This email from the Layout Editor to the Series Editor notifies them that the layout process has been completed.'),('LAYOUT_COMPLETE','es_ES','Galeradas de maquetación completadas','{$editorialContactName}:<br />\n<br />\nLas galeradas para el manuscrito &quot;{$submissionTitle}&quot; para {$contextName} están preparadas y listas para la corrección de pruebas.<br />\n<br />\nSi tiene alguna duda, puede ponerse en contacto conmigo.<br />\n<br />\n{$signatureFullName}','El maquetador/a envía este correo electrónico al editor/a de la serie para notificar que el proceso de maquetación se completó.'),('LAYOUT_COMPLETE','fr_CA','Épreuves en placard complétées','{$editorialContactName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$contextName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}','Ce courriel est envoyé par le rédacteur metteur en page au rédacteur d\'une série pour l\'informer que la mise en page du manuscrit est terminée.'),('LAYOUT_REQUEST','en_US','Request Galleys','{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Layout Version file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.','This email from the Series Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),('LAYOUT_REQUEST','es_ES','Solicitud de galeradas','{$layoutEditorName}:<br />\n<br />\nEs necesario extraer galeradas del envío &quot;{$submissionTitle}&quot; a {$contextName} siguiendo los siguientes pasos.<br />\n1. Haga clic en la URL del envío que aparece debajo.<br />\n2. Inicie sesión en la publicación y use el archivo Versión para maquetar para crear las galeradas según los estándares de publicación.<br />\n3. Envíe el correo electrónico COMPLETO al editor/a.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL del envío: {$submissionUrl}<br />\nNombre de usuario/a: {$layoutEditorUsername}<br />\n<br />\nSi no puede realizar esta tarea en este momento o tiene alguna duda, póngase en contacto conmigo. Gracias por su contribución a la publicación.','El editor/a de la serie envía este correo electrónico al maquetador/a para notificar que se les asignó la tarea de llevar a cabo la maquetación de un envío. Proporciona información sobre el envío y cómo acceder al mismo.'),('LAYOUT_REQUEST','fr_CA','Requête des épreuves en placard','{$participantName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$participantUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.','Ce courriel est envoyé au rédacteur metteur en page par le rédacteur en chef de la série pour lui indiquer qu\'on lui a demandé de faire la mise en page de la soumission. Il contient des renseignements sur la soumission et explique comment y accéder.'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the press {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.','This email template is used to notify a press manager contact that a manual payment was requested.'),('MANUAL_PAYMENT_NOTIFICATION','es_ES','Notificación de pago manual','Es necesario procesar un pago manual para la editorial {$contextName} y el usuario/a {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nEl elemento por el que hay que pagar es &quot;{$itemName}&quot;.<br />\nEl coste es {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nEste correo electrónico ha sido generado por el módulo de pago manual de Open Monograph Press.','Esta plantilla de correo electrónico se usa para notificar al gestor/a de la revista de que se ha solicitado un pago manual.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\nThis is an automatically generated email; please do not reply to this message.<br />\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','es_ES','Nueva notificación de {$siteTitle}','Tiene una notificación nueva de {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nEnlace: {$url}<br />\n<br />\nEsto es un correo electrónico generado automáticamente; no responda a este mensaje.<br />\n{$principalContactSignature}','El correo electrónico se envía a los usuarios/as registrados que seleccionaron este tipo de notificación.'),('NOTIFICATION','fr_CA','Nouvelle notification de {$siteTitle}','Vous avez reçu une nouvelle notification de {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien: {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé aux utilisateurs qui ont demandé qu\'on leur envoie ce type de notification par courriel.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','es_ES','Mensaje sobre {$contextName}','Introduzca su mensaje.','El mensaje por defecto (en blanco) usado en el Creador de listas de mensajes del Centro de notificación.'),('NOTIFICATION_CENTER_DEFAULT','fr_CA','Un message à propos de la presse {$contextName}','Veuillez saisir votre message.','Le message (vierge) par défaut utilisé par le centre d\'alerte.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site.<br />\n<br />\nYour username: {$username}<br />\nYour new password: {$password}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','es_ES','Restablecer contraseña','La contraseña se restableció con éxito en la página web {$siteTitle}. Recuerde el nombre de usuario/a y contraseña, son necesarios para trabajar en la publicación.<br />\n<br />\nNombre de usuario/a: {$username}<br />\nNueva contraseña: {$password}<br />\n<br />\n{$principalContactSignature}','Este correo electrónico se envía a un usuario/a registrado cuando se restablece su contraseña con éxito tras seguir el proceso descrito en el correo RESTABLECER_CONTRASEÑA_CONFIRMACIÓN.'),('PASSWORD_RESET','fr_CA','Réinitialisation du mot de passe','Votre mot de passe vous permettant d\'avoir accès au site Web {$siteTitle} a été réinitialisé. Veuillez noter votre nom d\'utilisateur et mot de passe dans vos dossiers, car vous en aurez besoin pour vos travaux auprès de la presse.<br />\n<br />\nVotre nom d\'utilisateur: {$username}<br />\nVotre nouveau mot de passe: {$password}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à un utilisateur lorsque son mot de passe a été réinitialisé après avoir suivi les instructions du courriel \"PASSWORD_RESET_CONFIRM\".'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','es_ES','Confirmación para restablecer la contraseña','Se recibió una solicitud para restablecer su contraseña en la página web {$siteTitle}.<br />\n<br />\nSi no realizó esta solicitud, ignore este correo electrónico y su contraseña no se cambiará. Si desea restablecer su contraseña, haga clic en la dirección URL que aparece debajo.<br />\n<br />\nRestablecer contraseña: {$url}<br />\n<br />\n{$principalContactSignature}','Este correo electrónico se envía a un usuario/a registrado cuando indica que olvidó su contraseña o cuando no puede iniciar sesión. Proporciona una dirección URL con la que se puede restablecer la contraseña.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de réinitialisation du mot de passe','Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à un utilisateur lorsqu\'il a indiqué avoir oublié son mot de passe ou être incapable d\'ouvrir une session. On lui fournit une adresse URL sur laquelle il peut cliquer pour modifier son mot de passe.'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Monograph Press has encountered unusual activity relating to PayPal payment support for the press {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by the Open Monograph Press PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','This email template is used to notify the press\' primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),('PAYPAL_INVESTIGATE_PAYMENT','es_ES','Actividad inusual en PayPal','Open Monograph Press ha detectado una actividad inusual relacionada con el soporte de pago por PayPal de la editorial {$contextName}. Esta actividad podría requerir una investigación más detallada o una intervención manual.<br />\n                       <br />\nEste correo electrónico ha sido generado por el módulo de PayPal de Open Monograph Press.<br />\n<br />\nInformación completa de envío para la solicitud:<br />\n{$postInfo}<br />\n<br />\n Información adicional (si se proporciona):<br />\n{$additionalInfo}<br />\n<br />\nVariables de servidor:<br />\n{$serverVars}<br />\n','Esta plantilla de correo electrónico se utiliza para notificar al contacto principal de la editorial que el módulo de Paypal ha detectado una actividad sospechosa o que requiere una intervención manual.'),('PUBLISH_NOTIFY','en_US','New Book Published','Readers:<br />\n<br />\n{$contextName} has just published its latest book at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review monographs and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new book and invites them to visit the press at a supplied URL.'),('PUBLISH_NOTIFY','es_ES','Nuevo libro publicado','Lectores/as:<br />\n<br />\n{$contextName} acaba de publicar su último libro en {$contextUrl}. Les invitamos a revisar la tabla de contenidos que les proporcionamos y a visitar nuestra página web para ver monografías y elementos de interés.<br />\n<br />\nGracias por el interés mostrado en nuestro trabajo,<br />\n{$editorialContactSignature}','Este correo electrónico se envía a los lectores/as registrados a través del enlace \"Notificar a los usuarios/as\" en el área personal del editor/a. Notifica a los lectores/as que se publicó un nuevo libro y les invita a visitar la publicación mediante la URL proporcionada.'),('PUBLISH_NOTIFY','fr_CA','Nouveau livre publié','Chers lecteurs,<br />\n<br />\n{$contextName} a récemment publié son dernier livre au {$contextUrl}. Nous vous invitons à consulter la table des matières ici et à consulter notre site Web afin de lire les monographies et les articles qui vous intéressent.<br />\n<br />\nMerci de l\'intérêt que vous portez à nos publications.<br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé aux lecteurs par le lien d\'avis aux utilisateurs qui se trouve sur la page du rédacteur en chef. Il indique aux lecteurs que l\'on a récemment publié un nouveau livre et les invite à cliquer sur le lien URL de la presse.'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$contextName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),('REVIEWER_REGISTER','es_ES','Registro como revisor/a con {$contextName}','Dada su experiencia, nos hemos tomado la libertad de registrar su nombre en la base de datos de revisores/as para {$contextName}. Esto no implica ningún tipo de compromiso por su parte, simplemente permite que nos pongamos en contacto con usted si tenemos un envío que quizás pueda revisar. Si se le invita a realizar una revisión, tendrá la oportunidad de ver el título y el resumen de dicho trabajo y en todo momento podrá aceptar o rechazar la invitación. Asimismo, puede pedir que se elimine su nombre de la lista de revisores/as.<br />\n<br />\nLe proporcionamos un nombre de usuario/a y una contraseña que se utilizan para trabajar con la publicación a través de su página web. Si lo desea puede, por ejemplo, actualizar su perfil y sus preferencias de revisión.<br />\n<br />\nNombre de usuario/a: {$username}<br />\nContraseña: {$password}<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo electrónico se envía a un nuevo revisor/a registrado para darle la bienvenida al sistema y proporcionarle un documento con su nombre de usuario/a y contraseña.'),('REVIEWER_REGISTER','fr_CA','Inscription à titre d\'évaluateur pour la presse {$contextName}','En raison de votre expertise, nous avons ajouté votre nom à notre base de données d\'évaluateurs pour la presse {$contextName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d\'évaluation, vous aurez la possibilité de lire le titre et le résumé de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d\'intérêt en ce qui concerne l\'évaluation des articles.<br />\n<br />\n<br />\nNom d\'utilisateur: {$username}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un nouvel évaluateur pour lui souhaiter la bienvenue dans le système et lui fournir une confirmation écrite de son nom d\'utilisateur et de son mot de passe.'),('REVIEW_ACK','en_US','Manuscript Review Acknowledgement','{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.','This email is sent by a Series Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),('REVIEW_ACK','es_ES','Acuse de recibo de la revisión del manuscrito','{$reviewerName}:<br />\n<br />\nGracias por completar la revisión del envío &quot;{$submissionTitle}&quot; para {$contextName}. Agradecemos su aportación a la calidad de los trabajos que publicamos.','El editor/a de la serie envía este correo electrónico para confirmar la recepción de una revisión completada y dar las gracias al revisor/a por su contribución.'),('REVIEW_ACK','fr_CA','Accusé de réception pour l\'évaluation d\'un manuscrit','{$reviewerName}:<br />\n<br />\n<br />\nMerci d\'avoir terminé l\'évaluation de l\'article &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Grâce à vous, nous sommes en mesure de publier des articles de qualité.','Ce courriel est envoyé par le rédacteur en chef d\'une série pour confirmer qu\'il a reçu l\'évaluation finale de l\'article et pour le remercier de sa contribution.'),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Series Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_CANCEL','es_ES','Solicitud de revisión cancelada','{$reviewerName}:<br />\n<br />\nHemos decidido cancelar nuestra solicitud de que usted revise el envío &quot;{$submissionTitle}&quot; para {$contextName}. Pedimos disculpas por cualquier inconveniente que esta decisión pueda causar y esperamos poder contar con usted para participar en este proceso de revisión en el futuro.<br />\n<br />\nSi tiene alguna duda, puede ponerse en contacto conmigo.','El editor/a de la serie envía este correo al revisor/a que inició el proceso de revisión de un envío para notificarle que el mismo se canceló.'),('REVIEW_CANCEL','fr_CA','Annulation de la requête d\'évaluation','{$reviewerName}:<br />\n<br />\n<br />\nNous avons décidé d\'annuler notre requête d\'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$contextName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d\'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter.','Ce courriel est envoyé à un évaluateur qui a entamé le processus d\'évaluation d\'une soumission par le rédacteur en chef d\'une série afin d\'informer l\'évaluateur que la procédure d\'évaluation a été annulée.'),('REVIEW_CONFIRM','en_US','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been accepted and will be completed by the specified date.'),('REVIEW_CONFIRM','es_ES','Disponible para revisar','{$editorialContactName}:<br />\n<br />\nEstoy disponible y puedo revisar el envío &quot;{$submissionTitle}&quot; para {$contextName}. Gracias por pensar en mí. Tengo previsto completar la revisión en la fecha establecida, el {$reviewDueDate}, o antes.<br />\n<br />\n{$reviewerName}','El revisor/a envía este correo electrónico al editor/a de la serie como respuesta a la solicitud de revisión para notificar al editor/a de la serie que la solicitud se aceptó y que la revisión estará terminada en el plazo especificado.'),('REVIEW_CONFIRM','fr_CA','En mesure d\'évaluer','Éditeurs:<br />\n<br />\nJe peux et je souhaite évaluer la soumission &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Merci de m\'avoir invité à évaluer cet article. Je prévois terminer mon évaluation d\'ici le {$reviewDueDate}.<br />\n<br />\n{$reviewerName}','Ce courriel est envoyé au rédacteur en chef d\'une série pour répondre à la requête d\'évaluation. Il a pour but de permettre à l\'évaluateur d\'indiquer au rédacteur en chef qu\'il a accepté d\'évaluer l\'article et qu\'il aura terminé son évaluation dans les délais prescrits.'),('REVIEW_DECLINE','en_US','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been declined.'),('REVIEW_DECLINE','es_ES','No disponible para revisar','{$editorialContactName}:<br />\n<br />\nMe temo que en este momento no puedo revisar el envío &quot;{$submissionTitle}&quot; para {$contextName}. Gracias por pensar en mí, pueden contar conmigo en futuras ocasiones.<br />\n<br />\n{$reviewerName}','El revisor/a envía este correo electrónico al editor/a de la serie como respuesta a una solicitud de revisión para notificar al editor/a de la serie que la petición se rechazó.'),('REVIEW_DECLINE','fr_CA','Ne peux pas évaluer','Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Merci de m\'avoir invité à évaluer cet article et n\'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$reviewerName}','Ce courriel est envoyé par l\'évaluateur au rédacteur en chef d\'une série série pour indiquer qu\'il ne sera pas en mesure d\'évaluer l\'article en question.'),('REVIEW_REINSTATE','en_US','Request for Review Reinstated','{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal\'s review process.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_REINSTATE','es_ES','Solicitud de revisión restablecida','{$reviewerName}:<br />\n<br />\nNos gustaría restablecer la solicitud que le hicimos para revisar la presentación, &quot;{$submissionTitle},&quot; para {$contextName}. Esperamos que nos pueda ayudar en este proceso de revisión de la publicación.<br />\n<br />\nSi tiene cualquier pregunta no dude en contactarme.','Este correo electrónico es enviado por el Editor de Sección a un Revisor que tiene una revisión en curso para notificarle que la revisión ha sido cancelada.'),('REVIEW_REMIND','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Series Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND','es_ES','Recordatorio de revisión del envío','{$reviewerName}:<br />\n<br />\nEste es un pequeño recordatorio de que realizamos una solicitud para que revisara el envío &quot;{$submissionTitle}&quot; para {$contextName}. Esperábamos que la revisión estuviera lista para el {$reviewDueDate} y nos complacería recibirla tan pronto como la tenga preparada.<br />\n<br />\nEn caso de no tener nombre de usuario/a y contraseña para la página web, puede usar este enlace para restablecer su contraseña (posteriormente se le enviará por correo electrónico junto con el nombre de usuario/a). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nNombre de usuario/a: {$reviewerUserName}<br />\n<br />\nConfirme que puede completar esta fundamental contribución al trabajo de la editorial. Espero tener noticias suyas.<br />\n<br />\n{$editorialContactSignature}','El editor/a de la serie envía este correo electrónico para recordar al revisor/a que finaliza el plazo de revisión.'),('REVIEW_REMIND','fr_CA','Rappel d\'évaluation','{$reviewerName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNom d\'utilisateur: {$reviewerUserName}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé par le rédacteur en chef d\'une série pour rappeler à l\'évaluateur qu\'il doit envoyer sa soumission dès que possible.'),('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO','es_ES','Recordatorio automatizado de revisión del envío','{$reviewerName}:<br />\n<br />\nEsto es un amable recordatorio de la solicitud de revisión que le hicimos del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos que la revisión estuviera lista el {$reviewDueDate}. Este correo electrónico se ha generado y enviado automáticamente porque se ha sobrepasado dicha fecha. Aun así, todavía nos complacería recibirla tan pronto como pueda tenerla lista.<br />\n<br />\nEn caso de no tener nombre de usuario/a y contraseña para la página web, puede usar este enlace para restablecer su contraseña (posteriormente se le enviará por correo electrónico junto con su nombre de usuario/a). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nNombre de usuario/a: {$reviewerUserName}<br />\n<br />\nPor favor, confírmenos su disponibilidad para completar esta fundamental contribución para el trabajo de la publicación. Esperamos tener noticias suyas.<br />\n<br />\n{$editorialContactSignature}','Este correo electrónico se envía automáticamente cuando se supera el plazo indicado al revisor/a (véase Opciones de revisión en Gestión > Configuración > Circuito de publicación > Revisión) y el acceso al revisor/a con un solo clic está deshabilitado. Las tareas programadas se deben habilitar y configurar (véase el archivo de configuración del sitio).'),('REVIEW_REMIND_AUTO','fr_CA','Rappel automatique d\'évaluation d\'une soumission','{$reviewerName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé automatiquement lorsqu\'une évaluation est en retard (voir les options d\'évaluation à l\'étape 2 de la section Configuration de la presse) et que l\'accès de l\'évaluateur en un seul clic est désactivé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).'),('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','es_ES','Recordatorio automatizado de revisión del envío','{$reviewerName}:<br />\n<br />\nEste es un pequeño recordatorio de que realizamos una solicitud para que revisara el envío &quot;{$submissionTitle}&quot; para {$contextName}. Esperábamos que la revisión estuviera lista para el {$reviewDueDate}. Este correo electrónico se genera y envía automáticamente cuando se supera el plazo establecido. Aun así, nos complacería recibirla tan pronto como la tenga preparada.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nConfirme que puede completar esta contribución fundamental al trabajo de la editorial. Espero tener noticias suyas.<br />\n<br />\n{$editorialContactSignature}','Este correo se envía automáticamente cuando se supera el plazo indicado al revisor/a (véase Opciones de revisión en Gestión > Configuración > Circuito de publicación > Revisión) y el acceso al revisor/a con un solo clic está habilitado. Las tareas programadas se deben habilitar y configurar (véase el archivo de configuración del sitio).'),('REVIEW_REMIND_AUTO_ONECLICK','fr_CA','Rappel automatique d\'évaluation d\'une soumission','{$reviewerName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé automatiquement lorsqu\'une évaluation est en retard (voir les options d\'évaluation à l\'étape 2 de la section Configuration de la presse) et que l\'accès de l\'évaluateur en un seul clic est activé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).'),('REVIEW_REMIND_ONECLICK','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Series Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND_ONECLICK','es_ES','Recordatorio de revisión del envío','{$reviewerName}:<br />\n<br />\nEste es un pequeño recordatorio de que realizamos una solicitud para que revisara el envío &quot;{$submissionTitle}&quot; para {$contextName}. Esperábamos que la revisión estuviera lista para el {$reviewDueDate} y nos complacería recibirla tan pronto como la tenga preparada.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nConfirme que puede completar esta contribución fundamental al trabajo de la editorial. Espero tener noticias suyas.<br />\n<br />\n{$editorialContactSignature}','El editor/a de la serie envía este correo electrónico para recordar al revisor/a que finaliza el plazo de revisión.'),('REVIEW_REMIND_ONECLICK','fr_CA','Rappel d\'évaluation','{$reviewerName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé par le rédacteur en chef d\'une série pour rappeler à l\'évaluateur qu\'il doit envoyer sa soumission dès que possible.'),('REVIEW_REQUEST','en_US','Manuscript Review Request','Dear {$reviewerName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$editorialContactSignature}<br />\n','This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST','es_ES','Solicitud de revisión de manuscrito','Estimado/a {$reviewerName}:<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nInicie sesión en el sitio web de la publicación antes del {$responseDueDate} para indicar si llevará o no a cabo la revisión, así como para acceder al envío y registrar su revisión y recomendación.<br />\n<br />\nLa revisión debe estar preparada antes del {$reviewDueDate}.<br />\n<br />\nDirección URL de envío: {$submissionReviewUrl}<br />\n<br />\nNombre de usuario/a: {$reviewerUserName}<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n<br />\nUn saludo cordial,<br />\n{$editorialContactSignature}<br />\n','Este correo electrónico del editor/a de la serie para el revisor/a solicita que el revisor/a acepte o rechace la tarea de revisión de un envío. Proporciona información sobre el envío, como el título y el resumen, una fecha límite de revisión y cómo acceder al propio envío. Este mensaje se utiliza cuando se selecciona el proceso de revisión estándar en Gestión > Ajustes > Flujo de trabajo > Revisión. (Si no consulte REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST','fr_CA','Requête d\'évaluation d\'un manuscrit','Bonjour {$reviewerName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'évaluer l\'article ou non. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNom d\'utilisateur: {$reviewerUserName}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$editorialContactSignature}<br />\n','Ce courriel est envoyé à un évaluateur par le rédacteur en chef d\'une série afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il contient des informations sur la soumission comme le titre et le résumé de l\'article, il indique la date d\'échéance pour l\'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu\'on choisit l\'option Processus d\'évaluation standard à l\'étape 2 de la section Configuration de la presse. (Sinon, voir REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST_ATTACHED','en_US','Manuscript Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this press are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$weekLaterDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Series Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),('REVIEW_REQUEST_ATTACHED','es_ES','Solicitud de revisión de manuscrito','{$reviewerName}:<br />\n<br />\nCreo que puede ser un excelente revisor/a para el manuscrito &quot;{$submissionTitle}&quot; , por ese motivo le pido que considere llevar a cabo esta importante tarea para nosotros. Las indicaciones para la revisión de la publicación se incluyen más abajo y el envío se adjunta al presente correo electrónico. Debe mandarme por correo electrónico la revisión que haga del envío, junto con su recomendación, antes del {$reviewDueDate}.<br />\n<br />\nIndique mediante un correo electrónico antes del {$weekLaterDate} si puede y desea realizar la revisión.<br />\n<br />\nGracias por considerar la solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nDirectrices para la revisión<br />\n<br />\n{$reviewGuidelines}<br />\n','El editor/a de la serie envía este correo electrónico al revisor/a para solicitarle que acepte o rechace la tarea de revisión de un envío. Incluye el envío como archivo adjunto. Este mensaje se utiliza cuando se selecciona el proceso de revisión mediante archivos adjuntos a los correos electrónicos en Gestión > Ajustes > Flujo de trabajo > Revisión. (Si no consulte REVIEW_REQUEST.)'),('REVIEW_REQUEST_ATTACHED','fr_CA','Requête d\'évaluation d\'un manuscrit','{$reviewerName}:<br />\n<br />\nJe crois que vous seriez un excellent évaluateur pour le manuscrit &quot;{$submissionTitle}&quot; et nous vous serions reconnaissants si vous acceptiez cette tâche importante. Vous trouverez ci-dessous les lignes directrices de cette presse concernant l\'évaluation. Vous trouverez également la soumission en pièce jointe. Votre évaluation de la soumission et vos recommandations devraient nous parvenir par courriel d\'ici le {$reviewDueDate}.<br />\n<br />\nVeuillez répondre à ce courriel d\'ici le {$weekLaterDate} pour confirmer si vous acceptez d\'évaluer cet article.<br />\n<br />\n<br />\nNous vous remercions à l\'avance et espérons que vous accepterez cette requête.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nLignes directrices concernant l\'évaluation<br />\n<br />\n{$reviewGuidelines}<br />\n','Ce courriel est envoyé par le rédacteur en chef d\'une série à un évaluateur afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il contient la soumission en pièce jointe. Ce message est utilisé lorsque vous sélectionnez l\'option Processus d\'évaluation par courriel avec pièce jointe à l\'étape 2 de la Configuration de la presse. (Sinon, voir REVIEW_REQUEST.)'),('REVIEW_REQUEST_ONECLICK','en_US','Manuscript Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site by {$weekLaterDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK','es_ES','Solicitud de revisión de manuscrito','{$reviewerName}:<br />\n<br />\nCreo que puede ser un excelente revisor/a para el manuscrito &quot;{$submissionTitle}&quot; que se envió a {$contextName}. El resumen del envío se incluye debajo. Espero que considere llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nInicie sesión en la página web de la publicación antes del {$weekLaterDate} para indicar si podrá o no realizar la revisión, así como para acceder al envío y registrar su revisión y recomendación.<br />\n<br />\nLa revisión debe estar preparada antes del {$reviewDueDate}.<br />\n<br />\nDirección URL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','El editor/a de la serie envía este correo electrónico al revisor/a para solicitar a este último que acepte o rechace la tarea de revisión de un envío. Proporciona información sobre el envío, como el título y el resumen, una fecha límite para la revisión y cómo acceder al propio envío. Este mensaje se emplea cuando se selecciona el proceso de revisión estándar en Gestión > Configuración > Circuito de publicación > Revisión y el acceso al revisor/a con un solo clic está habilitado.'),('REVIEW_REQUEST_ONECLICK','fr_CA','Requête d\'évaluation d\'un manuscrit','{$reviewerName}:<br />\n<br />\nJe crois que vous seriez un excellent évaluateur pour le manuscrit &quot;{$submissionTitle}&quot; soumis à la presse {$contextName}. Vous trouverez ci-dessous le résumé de l\'article. J\'espère que vous accepterez cette tâche importante du processus de publication.<br />\n<br />\nVeuillez ouvrir une session sur le site Web d\'ici le {$weekLaterDate} pour indiquer si vous acceptez ou refusez d\'évaluer l\'article. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','Ce courriel est envoyé à un évaluateur par le rédacteur en chef d\'une série afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il fournit des informations sur la soumission comme le titre et le résumé de l\'article, il indique la date d\'échéance pour l\'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu\'on choisit l\'option Processus d\'évaluation standard à l\'étape 2 de la section Configuration de la presse, et que l\'on a activé l\'option permettant à l\'évaluateur d\'avoir accès à la soumission en un seul clic.'),('REVIEW_REQUEST_REMIND_AUTO','en_US','Manuscript Review Request','Dear {$reviewerName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$editorialContactSignature}<br />\n','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO','es_ES','Solicitud de revisión del manuscrito','Estimado/a {$reviewerName},<br />\nSólo un sutil recordatorio de nuestra solicitud de la  revisión de su presentación, &quot;{$submissionTitle},&quot; para {$contextName}. Esperamos tener una respuesta para el  {$responseDueDate}, y este correo electrónico ha sido generado y enviado automáticamente en tanto dicha fecha ya ha transcurrido.\n<br />\n{$messageToReviewer}<br />\n<br />\nInicie sesión en el sitio web de la editorial para indicar si realizará la revisión o no, así como para acceder a la presentación y registrar su revisión y recomendación..<br />\n<br />\nLa revisión en sí misma está prevista para el día {$reviewDueDate}.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nNombre de usuario: {$reviewerUserName}<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n<br />\nSinceramente,<br />\n{$editorialContactSignature}<br />\n','Este correo electrónico se envía automáticamente cuando transcurre la fecha de vencimiento de la confirmación de un revisor (consulte Opciones de revisión en Configuración > Flujo de trabajo > Revisar) y el acceso del revisor con un solo clic está deshabilitado. Las tareas programadas deben estar habilitadas y configuradas (consulte el archivo de configuración del sitio).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','en_US','Manuscript Review Request','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','es_ES','Solicitud de revisión del manuscrito','{$reviewerName}:<br />\nLe recordamos nuestra petición acerca de la revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperamos tener esta revisión como muy tarde para el {$responseDueDate}, por lo cual este correo electrónico se ha generado automáticamente y se ha enviado una vez pasada dicha fecha.\n<br />\nEl resumen del envío se ha insertado a continuación. Creemos que sería un excelente revisor para este artículo, por lo que esperamos que reconsidere llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, ingrese en la página web de la publicación para indicar si realizará o no la revisión; y en caso afirmativo, para acceder al envío y registrar su revisión y su recomendación.<br />\n<br />\nLa fecha límite para la revisión es el {$reviewDueDate}.<br />\n<br />\nURL de la propuesta: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta propuesta.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','Este correo electrónico se envía automáticamente cuando transcurre la fecha de vencimiento de la confirmación de un revisor (consulte Opciones de revisión en Configuración > Flujo de trabajo > Revisión) y se habilita el acceso de revisor con un solo clic. Las tareas programadas deben estar habilitadas y configuradas (consulte el archivo de configuración del sitio).'),('STATISTICS_REPORT_NOTIFICATION','en_US','Editorial activity for {$month}, {$year}','\n{$name}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}','This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),('STATISTICS_REPORT_NOTIFICATION','es_ES','Actividad editorial del {$month}, {$year}','\n{$name}, <br />\n<br />\nEl informe editorial al {$month}, {$year} ya está disponible. Las estadísticas fundamentales del mes son las siguientes.<br />\n<ul>\n	<li>Nuevas contribuciones del mes: {$newSubmissions}</li>\n	<li>Contribuciones rechazadas del mes: {$declinedSubmissions}</li>\n	<li>Contribuciones aceptadas del mes: {$acceptedSubmissions}</li>\n	<li>Contribuciones totales al sistema: {$totalSubmissions}</li>\n</ul>\nInicie sesión para obtener mayores detalles de sus <a href=\"{$editorialStatsLink}\">tendencias editoriales</a> y <a href=\"{$publicationStatsLink}\">estadísticas de artículos publicados</a>.  Se adjunta una copia completa de este informe correspondiente a este mes.<br />\n<br />\nSinceramente,<br />\n{$principalContactSignature}','Este correo electrónico se envía automáticamente cada mes a los editores/as y gestores/as de revistas para proporcionarles una visión general del estado de salud del sistema.'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the press. It provides information about tracking the submission through the process and thanks the author for the submission.'),('SUBMISSION_ACK','es_ES','Acuse de recibo del envío','{$authorName}:<br />\n<br />\nGracias por enviar el manuscrito &quot;{$submissionTitle}&quot; a {$contextName}. Con el sistema de gestión de publicaciones en línea que utilizamos podrá seguir el progreso a través del proceso editorial tras iniciar sesión en el sitio web de la publicación:<br />\n<br />\nURL del manuscrito: {$submissionUrl}<br />\nNombre de usuario/a: {$authorUsername}<br />\n<br />\nSi tiene alguna duda puede ponerse en contacto conmigo. Gracias por elegir esta editorial para mostrar su trabajo.<br />\n<br />\n{$editorialContactSignature}','Este correo electrónico, si está activado, se envía automáticamente a un autor/a cuando completa el proceso de envío de un manuscrito a la editorial. Proporciona información sobre el seguimiento del envío en el proceso y agradece al autor/a el envío.'),('SUBMISSION_ACK','fr_CA','Accusé de réception d\'une soumission','{$authorName}:<br />\n<br />\nMerci d\'avoir envoyé votre manuscrit &quot;{$submissionTitle}&quot; à la presse {$contextName}. Le système de gestion virtuel de la presse que nous utilisons vous permet de suivre les progrès de votre article tout au long du processus de publication. Il suffit d\'ouvrir une session sur le site Web:<br />\n<br />\nURL du manuscrit: {$submissionUrl}<br />\nNom d\'utilisateur: {$authorUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir envoyé votre article à cette presse.<br />\n<br />\n{$editorialContactSignature}','Lorsqu\'il est activé, ce courriel est envoyé automatiquement à l\'auteur lorsqu\'il soumet son manuscrit à la presse. Il fournit des renseignements sur le suivi de la soumission tout au long du processus de publication et remercie l\'auteur d\'avoir envoyé une soumission.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OMP specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','es_ES','Acuse de recibo del envío','Hola:<br />\n<br />\n{$submitterName} envió el manuscrito &quot;{$submissionTitle}&quot; a {$contextName}. <br />\n<br />\nSi tiene alguna duda, puede ponerse en contacto conmigo. Gracias por elegir esta editorial para mostrar su trabajo.<br />\n<br />\n{$editorialContactSignature}','Este correo electrónico, si está activado, se envía automáticamente a otros autores/as que no son usuarios/as de OMP según lo especificado en el proceso de envío.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception d\'une soumission','Bonjour,<br />\n<br />\n{$submitterName} a envoyé un manuscrit intitulé &quot;{$submissionTitle}&quot; à la presse {$contextName}. <br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir envoyé votre article à cette presse.<br />\n<br />\n{$editorialContactSignature}','Lorsqu\'il est activé, ce courriel est envoyé automatiquement aux autres auteurs qui ne font pas partie des utilisateurs d\'OMP identifiés pendant le processus de soumission.'),('USER_REGISTER','en_US','Press Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','es_ES','Registro en la publicación','{$userFullName}<br />\n<br />\nSe registró como usuario/a con {$contextName}. En este correo electrónico hemos incluido el nombre de usuario/a y contraseña que necesitará para trabajar con esta publicación a través de su página web. En cualquier momento puede contactarse conmigo para pedir que se le elimine de la lista de usuarios/as.<br />\n<br />\nNombre de usuario/a: {$username}<br />\nContraseña: {$password}<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo electrónico se envía a un nuevo usuario/a registrado para darle la bienvenida al sistema y proporcionarle un documento con su nombre de usuario/a y contraseña.'),('USER_REGISTER','fr_CA','Inscription à la presse','{$userFullName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$contextName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d\'utilisateur: {$username}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un nouvel utilisateur afin de lui souhaiter la bienvenue dans le système et lui fournir son nom d\'utilisateur et son mot de passe pour ses dossiers.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_VALIDATE','es_ES','Validar la cuenta','{$userFullName}<br />\n<br />\nCreó una cuenta con {$contextName}, pero antes de empezar a utilizarla es necesario que valide su cuenta de correo electrónico. Para hacerlo, haga clic en el enlace que aparece debajo:<br />\n<br />\n{$activateUrl}<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo electrónico se envía a un nuevo usuario/a registrado para darle la bienvenida al sistema y proporcionarle un documento con su nombre de usuario/a y contraseña.'),('USER_VALIDATE','fr_CA','Valider votre compte','{$userFullName}<br />\n<br />\nVous avez ouvert un compte chez {$contextName}. Mais avant de pouvoir l\'utiliser, vous devez confirmer votre adresse courriel. Il suffit de cliquer sur le lien ci-dessous.<br />\n<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un nouvel utilisateur pour lui souhaiter la bienvenue dans le système et lui fournir une confirmation écrite de son nom d\'utilisateur et de son mot de passe.');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_settings` (
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `email_settings_pkey` (`email_id`,`locale`,`setting_name`),
  KEY `email_settings_email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_settings`
--

LOCK TABLES `email_templates_settings` WRITE;
/*!40000 ALTER TABLE `email_templates_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_translated` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,2,'2022-10-05 12:21:28',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,2,'2022-10-05 12:21:29',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,2,'2022-10-05 12:22:01',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,2,'2022-10-05 12:22:02',1342177288,'submission.event.fileRevised',0),(5,515,1,2,'2022-10-05 12:22:10',1342177296,'submission.event.fileEdited',0),(6,1048585,1,2,'2022-10-05 12:22:10',1342177296,'submission.event.fileEdited',0),(7,1048585,1,2,'2022-10-05 12:29:50',268435458,'submission.event.general.metadataUpdated',0),(8,1048585,1,2,'2022-10-05 12:30:34',268435457,'submission.event.submissionSubmitted',0),(9,1048585,2,2,'2022-10-06 11:47:41',268435458,'submission.event.general.metadataUpdated',0),(10,1048585,2,2,'2022-10-06 11:47:41',268435458,'submission.event.general.metadataUpdated',0),(11,515,2,6,'2022-10-06 11:49:07',1342177281,'submission.event.fileUploaded',0),(12,1048585,2,2,'2022-10-06 11:49:07',1342177288,'submission.event.fileRevised',0),(13,515,2,6,'2022-10-06 11:49:32',1342177296,'submission.event.fileEdited',0),(14,1048585,2,2,'2022-10-06 11:49:32',1342177296,'submission.event.fileEdited',0),(15,1048585,2,2,'2022-10-06 11:52:12',268435458,'submission.event.general.metadataUpdated',0),(16,1048585,2,2,'2022-10-06 11:52:22',268435457,'submission.event.submissionSubmitted',0),(17,515,2,2,'2022-10-06 12:02:23',1342177288,'submission.event.revisionUploaded',0),(18,1048585,2,2,'2022-10-06 12:02:23',1342177288,'submission.event.revisionUploaded',0),(19,515,2,2,'2022-10-06 12:02:33',1342177282,'submission.event.fileDeleted',0),(20,1048585,4,1,'2022-10-14 16:45:30',268435474,'submission.event.publicationFormatCreated',0),(21,515,3,1,'2022-10-14 16:45:47',1342177281,'submission.event.fileUploaded',0),(22,1048585,4,1,'2022-10-14 16:45:47',1342177288,'submission.event.fileRevised',0),(23,515,4,1,'2022-10-14 16:46:52',1342177281,'submission.event.fileUploaded',0),(24,1048585,4,1,'2022-10-14 16:46:52',1342177288,'submission.event.fileRevised',0),(25,515,4,1,'2022-10-14 16:46:55',1342177296,'submission.event.fileEdited',0),(26,1048585,4,1,'2022-10-14 16:46:55',1342177296,'submission.event.fileEdited',0),(27,515,3,1,'2022-10-14 16:47:10',1342177282,'submission.event.fileDeleted',0),(28,1048585,4,1,'2022-10-14 16:47:32',268435458,'submission.event.general.metadataUpdated',0),(29,1048585,4,1,'2022-10-14 16:47:32',268435458,'submission.event.general.metadataUpdated',0),(30,1048585,4,1,'2022-10-14 16:50:35',268435474,'submission.event.publicationFormatCreated',0),(31,1048585,4,1,'2022-10-14 16:50:46',268435474,'submission.event.publicationFormatCreated',0),(32,1048585,4,1,'2022-10-14 16:50:55',268435474,'submission.event.publicationFormatCreated',0),(33,1048585,4,1,'2022-10-14 16:51:14',268435474,'submission.event.publicationFormatCreated',0),(34,1048585,4,1,'2022-10-14 16:51:28',268435474,'submission.event.publicationFormatCreated',0),(35,1048585,4,1,'2022-10-14 16:51:45',268435474,'submission.event.publicationFormatCreated',0),(36,515,5,1,'2022-10-14 16:51:56',1342177281,'submission.event.fileUploaded',0),(37,1048585,4,1,'2022-10-14 16:51:56',1342177288,'submission.event.fileRevised',0),(38,515,5,1,'2022-10-14 16:51:59',1342177296,'submission.event.fileEdited',0),(39,1048585,4,1,'2022-10-14 16:51:59',1342177296,'submission.event.fileEdited',0),(40,515,6,1,'2022-10-14 16:52:11',1342177281,'submission.event.fileUploaded',0),(41,1048585,4,1,'2022-10-14 16:52:11',1342177288,'submission.event.fileRevised',0),(42,515,6,1,'2022-10-14 16:52:14',1342177296,'submission.event.fileEdited',0),(43,1048585,4,1,'2022-10-14 16:52:14',1342177296,'submission.event.fileEdited',0),(44,515,7,1,'2022-10-14 16:52:25',1342177281,'submission.event.fileUploaded',0),(45,1048585,4,1,'2022-10-14 16:52:25',1342177288,'submission.event.fileRevised',0),(46,515,7,1,'2022-10-14 16:52:32',1342177296,'submission.event.fileEdited',0),(47,1048585,4,1,'2022-10-14 16:52:32',1342177296,'submission.event.fileEdited',0),(48,515,8,1,'2022-10-14 16:52:43',1342177281,'submission.event.fileUploaded',0),(49,1048585,4,1,'2022-10-14 16:52:43',1342177288,'submission.event.fileRevised',0),(50,515,8,1,'2022-10-14 16:52:45',1342177296,'submission.event.fileEdited',0),(51,1048585,4,1,'2022-10-14 16:52:46',1342177296,'submission.event.fileEdited',0),(52,515,9,1,'2022-10-14 16:52:59',1342177281,'submission.event.fileUploaded',0),(53,1048585,4,1,'2022-10-14 16:52:59',1342177288,'submission.event.fileRevised',0),(54,515,9,1,'2022-10-14 16:53:01',1342177296,'submission.event.fileEdited',0),(55,1048585,4,1,'2022-10-14 16:53:01',1342177296,'submission.event.fileEdited',0),(56,515,10,1,'2022-10-14 16:53:12',1342177281,'submission.event.fileUploaded',0),(57,1048585,4,1,'2022-10-14 16:53:12',1342177288,'submission.event.fileRevised',0),(58,515,10,1,'2022-10-14 16:53:15',1342177296,'submission.event.fileEdited',0),(59,1048585,4,1,'2022-10-14 16:53:15',1342177296,'submission.event.fileEdited',0),(60,1048585,4,1,'2022-10-14 16:53:22',268435464,'submission.event.publicationFormatPublished',0),(61,1048585,4,1,'2022-10-14 16:53:25',268435476,'submission.event.publicationFormatMadeAvailable',0),(62,515,4,1,'2022-10-14 16:53:28',1342177296,'submission.event.fileEdited',0),(63,1048585,4,1,'2022-10-14 16:53:28',1342177296,'submission.event.fileEdited',0),(64,515,4,1,'2022-10-14 16:53:28',1342177287,'submission.event.signoffSignoff',0),(65,1048585,4,1,'2022-10-14 16:53:36',268435464,'submission.event.publicationFormatPublished',0),(66,515,5,1,'2022-10-14 16:53:39',1342177296,'submission.event.fileEdited',0),(67,1048585,4,1,'2022-10-14 16:53:39',1342177296,'submission.event.fileEdited',0),(68,515,5,1,'2022-10-14 16:53:39',1342177287,'submission.event.signoffSignoff',0),(69,1048585,4,1,'2022-10-14 16:53:42',268435464,'submission.event.publicationFormatPublished',0),(70,515,6,1,'2022-10-14 16:53:45',1342177296,'submission.event.fileEdited',0),(71,1048585,4,1,'2022-10-14 16:53:45',1342177296,'submission.event.fileEdited',0),(72,515,6,1,'2022-10-14 16:53:45',1342177287,'submission.event.signoffSignoff',0),(73,1048585,4,1,'2022-10-14 16:53:47',268435464,'submission.event.publicationFormatPublished',0),(74,515,7,1,'2022-10-14 16:53:50',1342177296,'submission.event.fileEdited',0),(75,1048585,4,1,'2022-10-14 16:53:50',1342177296,'submission.event.fileEdited',0),(76,515,7,1,'2022-10-14 16:53:50',1342177287,'submission.event.signoffSignoff',0),(77,1048585,4,1,'2022-10-14 16:53:53',268435464,'submission.event.publicationFormatPublished',0),(78,515,8,1,'2022-10-14 16:53:57',1342177296,'submission.event.fileEdited',0),(79,1048585,4,1,'2022-10-14 16:53:57',1342177296,'submission.event.fileEdited',0),(80,515,8,1,'2022-10-14 16:53:57',1342177287,'submission.event.signoffSignoff',0),(81,1048585,4,1,'2022-10-14 16:54:00',268435464,'submission.event.publicationFormatPublished',0),(82,515,9,1,'2022-10-14 16:54:03',1342177296,'submission.event.fileEdited',0),(83,1048585,4,1,'2022-10-14 16:54:03',1342177296,'submission.event.fileEdited',0),(84,515,9,1,'2022-10-14 16:54:03',1342177287,'submission.event.signoffSignoff',0),(85,1048585,4,1,'2022-10-14 16:54:07',268435464,'submission.event.publicationFormatPublished',0),(86,515,10,1,'2022-10-14 16:54:10',1342177296,'submission.event.fileEdited',0),(87,1048585,4,1,'2022-10-14 16:54:10',1342177296,'submission.event.fileEdited',0),(88,515,10,1,'2022-10-14 16:54:10',1342177287,'submission.event.signoffSignoff',0),(89,1048585,4,1,'2022-10-14 16:54:14',268435476,'submission.event.publicationFormatMadeAvailable',0),(90,1048585,4,1,'2022-10-14 16:54:16',268435476,'submission.event.publicationFormatMadeAvailable',0),(91,1048585,4,1,'2022-10-14 16:54:19',268435476,'submission.event.publicationFormatMadeAvailable',0),(92,1048585,4,1,'2022-10-14 16:54:22',268435476,'submission.event.publicationFormatMadeAvailable',0),(93,1048585,4,1,'2022-10-14 16:54:26',268435476,'submission.event.publicationFormatMadeAvailable',0),(94,1048585,4,1,'2022-10-14 16:54:29',268435476,'submission.event.publicationFormatMadeAvailable',0),(95,1048585,4,1,'2022-10-14 16:56:37',268435458,'submission.event.general.metadataUpdated',0),(96,1048585,4,1,'2022-10-14 16:56:46',268435462,'publication.event.published',0),(97,1048585,4,1,'2022-10-14 16:57:09',268435463,'publication.event.unpublished',0),(98,1048585,4,1,'2022-10-14 16:58:10',268435458,'submission.event.general.metadataUpdated',0),(99,1048585,4,1,'2022-10-14 16:58:13',268435462,'publication.event.published',0),(100,1048585,4,1,'2022-10-14 17:00:30',268435463,'publication.event.unpublished',0),(101,1048585,4,1,'2022-10-14 17:01:18',268435458,'submission.event.general.metadataUpdated',0),(102,1048585,4,1,'2022-10-14 17:01:23',268435462,'publication.event.published',0),(103,1048585,4,1,'2022-10-14 17:02:33',268435463,'publication.event.unpublished',0),(104,1048585,4,1,'2022-10-14 17:06:58',268435462,'publication.event.published',0),(105,1048585,4,1,'2022-10-14 17:07:41',268435463,'publication.event.unpublished',0),(106,1048585,4,1,'2022-10-14 17:08:16',268435462,'publication.event.published',0),(107,1048585,4,1,'2022-10-14 18:27:28',268435463,'publication.event.unpublished',0),(108,1048585,4,1,'2022-10-14 18:27:39',268435458,'submission.event.general.metadataUpdated',0),(109,1048585,4,1,'2022-10-14 18:27:45',268435458,'submission.event.general.metadataUpdated',0),(110,1048585,4,1,'2022-10-14 18:27:49',268435462,'publication.event.published',0),(111,1048585,4,1,'2022-10-14 19:06:28',268435463,'publication.event.unpublished',0),(112,1048585,4,1,'2022-10-14 19:06:46',268435462,'publication.event.published',0),(113,1048585,4,1,'2022-10-14 19:07:03',268435463,'publication.event.unpublished',0),(114,1048585,4,1,'2022-10-14 19:07:27',268435477,'submission.event.publicationFormatMadeUnavailable',0),(115,1048585,4,1,'2022-10-14 19:07:35',268435477,'submission.event.publicationFormatMadeUnavailable',0),(116,1048585,4,1,'2022-10-14 19:07:47',268435462,'publication.event.published',0),(117,1048585,4,1,'2022-10-14 19:08:14',268435463,'publication.event.unpublished',0),(118,1048585,4,1,'2022-10-14 19:08:22',268435477,'submission.event.publicationFormatMadeUnavailable',0),(119,1048585,4,1,'2022-10-14 19:08:28',268435477,'submission.event.publicationFormatMadeUnavailable',0),(120,1048585,4,1,'2022-10-14 19:08:35',268435477,'submission.event.publicationFormatMadeUnavailable',0),(121,1048585,4,1,'2022-10-14 19:08:39',268435462,'publication.event.published',0),(122,1048585,4,1,'2022-10-14 19:08:56',268435463,'publication.event.unpublished',0),(123,1048585,4,1,'2022-10-14 19:09:06',268435476,'submission.event.publicationFormatMadeAvailable',0),(124,1048585,4,1,'2022-10-14 19:09:17',268435477,'submission.event.publicationFormatMadeUnavailable',0),(125,1048585,4,1,'2022-10-14 19:09:28',268435462,'publication.event.published',0),(126,1048585,4,1,'2022-10-17 10:24:21',268435463,'publication.event.unpublished',0),(127,1048585,4,1,'2022-10-17 10:24:52',268435458,'submission.event.general.metadataUpdated',0),(128,1048585,4,1,'2022-10-17 10:25:07',268435458,'submission.event.general.metadataUpdated',0),(129,1048585,4,1,'2022-10-17 10:25:51',268435458,'submission.event.general.metadataUpdated',0),(130,1048585,4,1,'2022-10-17 10:26:15',268435477,'submission.event.publicationFormatMadeUnavailable',0),(131,1048585,4,1,'2022-10-17 10:26:54',268435458,'submission.event.general.metadataUpdated',0),(132,1048585,4,1,'2022-10-17 10:26:58',268435462,'publication.event.published',0),(133,1048585,4,1,'2022-10-17 10:28:00',268435463,'publication.event.unpublished',0),(134,1048585,4,1,'2022-10-17 10:28:26',268435476,'submission.event.publicationFormatMadeAvailable',0),(135,1048585,4,1,'2022-10-17 10:28:36',268435458,'submission.event.general.metadataUpdated',0),(136,1048585,4,1,'2022-10-17 10:28:46',268435462,'publication.event.published',0),(137,1048585,4,1,'2022-10-17 10:29:12',268435463,'publication.event.unpublished',0),(138,1048585,4,1,'2022-10-17 10:29:17',268435477,'submission.event.publicationFormatMadeUnavailable',0),(139,1048585,4,1,'2022-10-17 10:37:29',268435462,'publication.event.published',0),(140,1048585,4,1,'2022-10-17 10:37:41',268435463,'publication.event.unpublished',0),(141,1048585,4,1,'2022-10-17 10:37:46',268435476,'submission.event.publicationFormatMadeAvailable',0),(142,1048585,4,1,'2022-10-17 10:37:50',268435462,'publication.event.published',0),(143,1048585,4,1,'2022-10-17 10:38:15',268435463,'publication.event.unpublished',0),(144,1048585,4,1,'2022-10-17 10:39:04',268435462,'publication.event.published',0),(145,1048585,4,1,'2022-10-17 10:39:38',268435463,'publication.event.unpublished',0),(146,1048585,4,1,'2022-10-17 10:40:21',268435474,'submission.event.publicationFormatCreated',0),(147,1048585,4,1,'2022-10-17 10:40:24',268435462,'publication.event.published',0),(148,1048585,4,1,'2022-10-17 10:40:34',268435463,'publication.event.unpublished',0),(149,1048585,4,1,'2022-10-17 10:40:38',268435464,'submission.event.publicationFormatPublished',0),(150,1048585,4,1,'2022-10-17 10:40:42',268435476,'submission.event.publicationFormatMadeAvailable',0),(151,1048585,4,1,'2022-10-17 10:40:47',268435462,'publication.event.published',0),(152,1048585,4,1,'2022-10-17 12:25:34',268435463,'publication.event.unpublished',0),(153,1048585,4,1,'2022-10-17 18:57:22',268435462,'publication.event.published',0),(154,1048585,4,1,'2022-11-13 17:27:48',268435463,'publication.event.unpublished',0),(155,1048585,4,1,'2022-11-13 17:28:19',268435458,'submission.event.general.metadataUpdated',0),(156,1048585,4,1,'2022-11-13 17:28:32',268435458,'submission.event.general.metadataUpdated',0),(157,1048585,4,1,'2022-11-13 17:28:36',268435462,'publication.event.published',0),(158,1048585,5,1,'2022-11-13 17:37:42',268435458,'submission.event.general.metadataUpdated',0),(159,1048585,5,1,'2022-11-13 17:37:55',268435474,'submission.event.publicationFormatCreated',0),(160,1048585,5,1,'2022-11-13 17:38:42',268435458,'submission.event.general.metadataUpdated',0),(161,1048585,5,1,'2022-11-13 17:38:42',268435458,'submission.event.general.metadataUpdated',0),(162,1048585,5,1,'2022-11-13 17:47:05',268435458,'submission.event.general.metadataUpdated',0),(163,1048585,5,1,'2022-11-13 17:48:14',268435462,'publication.event.published',0),(164,1048585,5,1,'2022-11-13 17:49:20',268435463,'publication.event.unpublished',0),(165,1048585,5,1,'2022-11-13 17:49:33',268435458,'submission.event.general.metadataUpdated',0),(166,1048585,5,1,'2022-11-13 17:50:24',268435458,'submission.event.general.metadataUpdated',0),(167,1048585,5,1,'2022-11-13 17:52:26',268435458,'submission.event.general.metadataUpdated',0),(168,1048585,5,1,'2022-11-13 17:52:34',268435462,'publication.event.published',0),(169,1048585,4,1,'2022-11-13 18:12:14',268435463,'publication.event.unpublished',0),(170,1048585,4,1,'2022-11-13 18:12:27',268435458,'submission.event.general.metadataUpdated',0),(171,1048585,4,1,'2022-11-13 18:12:31',268435462,'publication.event.published',0),(172,1048585,5,1,'2022-11-13 20:05:55',268435463,'publication.event.unpublished',0),(173,1048585,5,1,'2022-11-13 20:06:20',268435458,'submission.event.general.metadataUpdated',0),(174,1048585,5,1,'2022-11-13 20:06:24',268435462,'publication.event.published',0),(175,1048585,5,1,'2022-11-13 20:16:46',268435463,'publication.event.unpublished',0),(176,1048585,4,1,'2022-11-13 21:49:48',268435463,'publication.event.unpublished',0),(177,1048585,4,1,'2022-11-13 21:50:15',268435462,'publication.event.published',0),(178,1048585,4,1,'2022-11-14 13:06:39',268435463,'publication.event.unpublished',0),(179,1048585,4,1,'2022-11-14 13:06:53',268435458,'submission.event.general.metadataUpdated',0),(180,1048585,4,1,'2022-11-14 13:15:26',268435458,'submission.event.general.metadataUpdated',0),(181,1048585,4,1,'2022-11-14 13:15:31',268435462,'publication.event.published',0),(182,1048585,4,1,'2022-11-16 11:22:52',268435463,'publication.event.unpublished',0),(183,1048585,4,1,'2022-11-16 11:30:16',268435462,'publication.event.published',0),(184,1048585,4,1,'2022-11-16 11:51:29',268435463,'publication.event.unpublished',0),(185,1048585,4,1,'2022-11-16 11:52:02',268435458,'submission.event.general.metadataUpdated',0),(186,1048585,4,1,'2022-11-16 11:52:05',268435462,'publication.event.published',0),(187,1048585,4,1,'2022-11-16 11:52:43',268435463,'publication.event.unpublished',0),(188,1048585,4,1,'2022-11-16 11:52:47',268435458,'submission.event.general.metadataUpdated',0),(189,1048585,4,1,'2022-11-16 11:52:50',268435462,'publication.event.published',0),(190,1048585,5,1,'2022-11-17 10:43:41',268435462,'publication.event.published',0),(191,1048585,5,1,'2022-11-17 10:57:24',268435463,'publication.event.unpublished',0),(192,1048585,5,1,'2022-11-17 10:58:42',268435462,'publication.event.published',0),(193,1048585,5,1,'2022-11-17 11:01:41',268435463,'publication.event.unpublished',0),(194,1048585,6,1,'2022-11-29 16:02:14',268435458,'submission.event.general.metadataUpdated',0),(195,1048585,6,1,'2022-11-29 16:02:14',268435458,'submission.event.general.metadataUpdated',0),(196,1048585,7,1,'2022-11-29 16:06:27',268435474,'submission.event.publicationFormatCreated',0),(197,515,11,1,'2022-11-29 16:09:26',1342177281,'submission.event.fileUploaded',0),(198,1048585,7,1,'2022-11-29 16:09:26',1342177288,'submission.event.fileRevised',0),(199,515,11,1,'2022-11-29 16:10:17',1342177288,'submission.event.revisionUploaded',0),(200,1048585,7,1,'2022-11-29 16:10:17',1342177288,'submission.event.revisionUploaded',0),(201,515,11,1,'2022-11-29 16:11:09',1342177282,'submission.event.fileDeleted',0),(202,515,12,1,'2022-11-29 16:11:18',1342177281,'submission.event.fileUploaded',0),(203,1048585,7,1,'2022-11-29 16:11:18',1342177288,'submission.event.fileRevised',0),(204,515,12,1,'2022-11-29 16:11:36',1342177282,'submission.event.fileDeleted',0),(205,515,13,1,'2022-11-29 16:11:44',1342177281,'submission.event.fileUploaded',0),(206,1048585,7,1,'2022-11-29 16:11:44',1342177288,'submission.event.fileRevised',0),(207,515,13,1,'2022-11-29 16:12:09',1342177282,'submission.event.fileDeleted',0),(208,515,14,1,'2022-11-29 16:12:16',1342177281,'submission.event.fileUploaded',0),(209,1048585,7,1,'2022-11-29 16:12:16',1342177288,'submission.event.fileRevised',0),(210,515,14,1,'2022-11-29 16:12:19',1342177296,'submission.event.fileEdited',0),(211,1048585,7,1,'2022-11-29 16:12:19',1342177296,'submission.event.fileEdited',0),(212,515,14,1,'2022-11-29 16:12:37',1342177296,'submission.event.fileEdited',0),(213,1048585,7,1,'2022-11-29 16:12:37',1342177296,'submission.event.fileEdited',0),(214,1048585,7,1,'2022-11-29 16:12:43',268435458,'submission.event.general.metadataUpdated',0),(215,1048585,7,1,'2022-11-29 16:12:43',268435458,'submission.event.general.metadataUpdated',0),(216,1048585,7,1,'2022-11-29 16:18:29',268435474,'submission.event.publicationFormatCreated',0),(217,1048585,7,1,'2022-11-29 16:18:40',268435475,'submission.event.publicationFormatRemoved',0),(218,1048585,7,1,'2022-11-29 16:19:02',268435474,'submission.event.publicationFormatCreated',0),(219,1048585,7,1,'2022-11-29 16:19:26',268435474,'submission.event.publicationFormatCreated',0),(220,1048585,7,1,'2022-11-29 16:19:48',268435474,'submission.event.publicationFormatCreated',0),(221,1048585,7,1,'2022-11-29 16:19:49',268435474,'submission.event.publicationFormatCreated',0),(222,1048585,7,1,'2022-11-29 16:20:06',268435474,'submission.event.publicationFormatCreated',0),(223,1048585,7,1,'2022-11-29 16:20:26',268435474,'submission.event.publicationFormatCreated',0),(224,515,15,1,'2022-11-29 16:21:08',1342177281,'submission.event.fileUploaded',0),(225,1048585,7,1,'2022-11-29 16:21:08',1342177288,'submission.event.fileRevised',0),(226,515,15,1,'2022-11-29 16:21:13',1342177296,'submission.event.fileEdited',0),(227,1048585,7,1,'2022-11-29 16:21:13',1342177296,'submission.event.fileEdited',0),(228,515,16,1,'2022-11-29 16:21:28',1342177281,'submission.event.fileUploaded',0),(229,1048585,7,1,'2022-11-29 16:21:28',1342177288,'submission.event.fileRevised',0),(230,515,16,1,'2022-11-29 16:21:30',1342177296,'submission.event.fileEdited',0),(231,1048585,7,1,'2022-11-29 16:21:31',1342177296,'submission.event.fileEdited',0),(232,515,17,1,'2022-11-29 16:21:42',1342177281,'submission.event.fileUploaded',0),(233,1048585,7,1,'2022-11-29 16:21:42',1342177288,'submission.event.fileRevised',0),(234,515,17,1,'2022-11-29 16:21:44',1342177296,'submission.event.fileEdited',0),(235,1048585,7,1,'2022-11-29 16:21:44',1342177296,'submission.event.fileEdited',0),(236,1048585,7,1,'2022-11-29 16:21:57',268435475,'submission.event.publicationFormatRemoved',0),(237,515,18,1,'2022-11-29 16:22:08',1342177281,'submission.event.fileUploaded',0),(238,1048585,7,1,'2022-11-29 16:22:08',1342177288,'submission.event.fileRevised',0),(239,515,18,1,'2022-11-29 16:22:11',1342177296,'submission.event.fileEdited',0),(240,1048585,7,1,'2022-11-29 16:22:11',1342177296,'submission.event.fileEdited',0),(241,515,19,1,'2022-11-29 16:22:21',1342177281,'submission.event.fileUploaded',0),(242,1048585,7,1,'2022-11-29 16:22:21',1342177288,'submission.event.fileRevised',0),(243,515,19,1,'2022-11-29 16:22:23',1342177296,'submission.event.fileEdited',0),(244,1048585,7,1,'2022-11-29 16:22:23',1342177296,'submission.event.fileEdited',0),(245,1048585,7,1,'2022-11-29 16:22:48',268435464,'submission.event.publicationFormatPublished',0),(246,515,14,1,'2022-11-29 16:22:52',1342177296,'submission.event.fileEdited',0),(247,1048585,7,1,'2022-11-29 16:22:52',1342177296,'submission.event.fileEdited',0),(248,515,14,1,'2022-11-29 16:22:52',1342177287,'submission.event.signoffSignoff',0),(249,1048585,7,1,'2022-11-29 16:23:00',268435464,'submission.event.publicationFormatPublished',0),(250,515,15,1,'2022-11-29 16:23:08',1342177296,'submission.event.fileEdited',0),(251,1048585,7,1,'2022-11-29 16:23:08',1342177296,'submission.event.fileEdited',0),(252,515,15,1,'2022-11-29 16:23:08',1342177287,'submission.event.signoffSignoff',0),(253,1048585,7,1,'2022-11-29 16:23:11',268435464,'submission.event.publicationFormatPublished',0),(254,515,16,1,'2022-11-29 16:23:14',1342177296,'submission.event.fileEdited',0),(255,1048585,7,1,'2022-11-29 16:23:14',1342177296,'submission.event.fileEdited',0),(256,515,16,1,'2022-11-29 16:23:14',1342177287,'submission.event.signoffSignoff',0),(257,1048585,7,1,'2022-11-29 16:23:17',268435464,'submission.event.publicationFormatPublished',0),(258,515,17,1,'2022-11-29 16:23:20',1342177296,'submission.event.fileEdited',0),(259,1048585,7,1,'2022-11-29 16:23:20',1342177296,'submission.event.fileEdited',0),(260,515,17,1,'2022-11-29 16:23:20',1342177287,'submission.event.signoffSignoff',0),(261,1048585,7,1,'2022-11-29 16:23:23',268435464,'submission.event.publicationFormatPublished',0),(262,515,18,1,'2022-11-29 16:23:26',1342177296,'submission.event.fileEdited',0),(263,1048585,7,1,'2022-11-29 16:23:26',1342177296,'submission.event.fileEdited',0),(264,515,18,1,'2022-11-29 16:23:26',1342177287,'submission.event.signoffSignoff',0),(265,1048585,7,1,'2022-11-29 16:23:29',268435464,'submission.event.publicationFormatPublished',0),(266,515,19,1,'2022-11-29 16:23:32',1342177296,'submission.event.fileEdited',0),(267,1048585,7,1,'2022-11-29 16:23:32',1342177296,'submission.event.fileEdited',0),(268,515,19,1,'2022-11-29 16:23:32',1342177287,'submission.event.signoffSignoff',0),(269,1048585,7,1,'2022-11-29 16:25:59',268435462,'publication.event.published',0),(270,1048585,7,1,'2022-11-29 16:27:49',268435463,'publication.event.unpublished',0),(271,1048585,7,1,'2022-11-29 16:30:14',268435458,'submission.event.general.metadataUpdated',0),(272,1048585,7,1,'2022-11-29 16:30:20',268435462,'publication.event.published',0),(273,1048585,7,1,'2022-11-29 16:30:53',268435463,'publication.event.unpublished',0),(274,1048585,7,1,'2022-11-29 16:30:58',268435458,'submission.event.general.metadataUpdated',0),(275,1048585,7,1,'2022-11-29 16:31:02',268435462,'publication.event.published',0),(276,1048585,8,1,'2022-11-29 16:36:32',268435474,'submission.event.publicationFormatCreated',0),(277,515,20,1,'2022-11-29 16:37:58',1342177281,'submission.event.fileUploaded',0),(278,1048585,8,1,'2022-11-29 16:37:58',1342177288,'submission.event.fileRevised',0),(279,515,20,1,'2022-11-29 16:38:02',1342177296,'submission.event.fileEdited',0),(280,1048585,8,1,'2022-11-29 16:38:02',1342177296,'submission.event.fileEdited',0),(281,515,20,1,'2022-11-29 16:38:23',1342177296,'submission.event.fileEdited',0),(282,1048585,8,1,'2022-11-29 16:38:23',1342177296,'submission.event.fileEdited',0),(283,1048585,9,1,'2022-11-29 16:44:42',268435474,'submission.event.publicationFormatCreated',0),(284,515,21,1,'2022-11-29 16:44:52',1342177281,'submission.event.fileUploaded',0),(285,1048585,9,1,'2022-11-29 16:44:52',1342177288,'submission.event.fileRevised',0),(286,515,21,1,'2022-11-29 16:45:06',1342177282,'submission.event.fileDeleted',0),(287,515,22,1,'2022-11-29 16:45:13',1342177281,'submission.event.fileUploaded',0),(288,1048585,9,1,'2022-11-29 16:45:13',1342177288,'submission.event.fileRevised',0),(289,515,22,1,'2022-11-29 16:45:15',1342177296,'submission.event.fileEdited',0),(290,1048585,9,1,'2022-11-29 16:45:15',1342177296,'submission.event.fileEdited',0),(291,515,22,1,'2022-11-29 16:45:27',1342177296,'submission.event.fileEdited',0),(292,1048585,9,1,'2022-11-29 16:45:28',1342177296,'submission.event.fileEdited',0),(293,1048585,9,1,'2022-11-29 16:45:41',268435458,'submission.event.general.metadataUpdated',0),(294,1048585,9,1,'2022-11-29 16:45:41',268435458,'submission.event.general.metadataUpdated',0),(295,1048585,9,1,'2022-11-29 16:49:40',268435474,'submission.event.publicationFormatCreated',0),(296,1048585,9,1,'2022-11-29 16:49:56',268435474,'submission.event.publicationFormatCreated',0),(297,1048585,9,1,'2022-11-29 16:50:13',268435474,'submission.event.publicationFormatCreated',0),(298,1048585,9,1,'2022-11-29 16:50:27',268435474,'submission.event.publicationFormatCreated',0),(299,515,23,1,'2022-11-29 16:51:07',1342177281,'submission.event.fileUploaded',0),(300,1048585,9,1,'2022-11-29 16:51:07',1342177288,'submission.event.fileRevised',0),(301,515,23,1,'2022-11-29 16:51:10',1342177296,'submission.event.fileEdited',0),(302,1048585,9,1,'2022-11-29 16:51:10',1342177296,'submission.event.fileEdited',0),(303,515,24,1,'2022-11-29 16:51:21',1342177281,'submission.event.fileUploaded',0),(304,1048585,9,1,'2022-11-29 16:51:21',1342177288,'submission.event.fileRevised',0),(305,515,24,1,'2022-11-29 16:51:24',1342177296,'submission.event.fileEdited',0),(306,1048585,9,1,'2022-11-29 16:51:25',1342177296,'submission.event.fileEdited',0),(307,515,25,1,'2022-11-29 16:51:35',1342177281,'submission.event.fileUploaded',0),(308,1048585,9,1,'2022-11-29 16:51:35',1342177288,'submission.event.fileRevised',0),(309,515,25,1,'2022-11-29 16:51:37',1342177296,'submission.event.fileEdited',0),(310,1048585,9,1,'2022-11-29 16:51:37',1342177296,'submission.event.fileEdited',0),(311,515,26,1,'2022-11-29 16:51:52',1342177281,'submission.event.fileUploaded',0),(312,1048585,9,1,'2022-11-29 16:51:52',1342177288,'submission.event.fileRevised',0),(313,515,26,1,'2022-11-29 16:51:54',1342177296,'submission.event.fileEdited',0),(314,1048585,9,1,'2022-11-29 16:51:54',1342177296,'submission.event.fileEdited',0),(315,1048585,9,1,'2022-11-29 16:52:04',268435464,'submission.event.publicationFormatPublished',0),(316,515,22,1,'2022-11-29 16:52:06',1342177296,'submission.event.fileEdited',0),(317,1048585,9,1,'2022-11-29 16:52:06',1342177296,'submission.event.fileEdited',0),(318,515,22,1,'2022-11-29 16:52:07',1342177287,'submission.event.signoffSignoff',0),(319,1048585,9,1,'2022-11-29 16:52:09',268435464,'submission.event.publicationFormatPublished',0),(320,515,23,1,'2022-11-29 16:52:11',1342177296,'submission.event.fileEdited',0),(321,1048585,9,1,'2022-11-29 16:52:11',1342177296,'submission.event.fileEdited',0),(322,515,23,1,'2022-11-29 16:52:11',1342177287,'submission.event.signoffSignoff',0),(323,1048585,9,1,'2022-11-29 16:52:13',268435464,'submission.event.publicationFormatPublished',0),(324,515,24,1,'2022-11-29 16:52:16',1342177296,'submission.event.fileEdited',0),(325,1048585,9,1,'2022-11-29 16:52:16',1342177296,'submission.event.fileEdited',0),(326,515,24,1,'2022-11-29 16:52:16',1342177287,'submission.event.signoffSignoff',0),(327,1048585,9,1,'2022-11-29 16:52:19',268435464,'submission.event.publicationFormatPublished',0),(328,515,25,1,'2022-11-29 16:52:21',1342177296,'submission.event.fileEdited',0),(329,1048585,9,1,'2022-11-29 16:52:21',1342177296,'submission.event.fileEdited',0),(330,515,25,1,'2022-11-29 16:52:21',1342177287,'submission.event.signoffSignoff',0),(331,1048585,9,1,'2022-11-29 16:52:24',268435464,'submission.event.publicationFormatPublished',0),(332,515,26,1,'2022-11-29 16:52:26',1342177296,'submission.event.fileEdited',0),(333,1048585,9,1,'2022-11-29 16:52:26',1342177296,'submission.event.fileEdited',0),(334,515,26,1,'2022-11-29 16:52:26',1342177287,'submission.event.signoffSignoff',0),(335,1048585,9,1,'2022-11-29 16:58:53',268435458,'submission.event.general.metadataUpdated',0),(336,1048585,9,1,'2022-11-29 16:58:57',268435458,'submission.event.general.metadataUpdated',0),(337,1048585,9,1,'2022-11-29 16:59:01',268435462,'publication.event.published',0),(338,1048585,9,1,'2022-11-29 16:59:35',268435463,'publication.event.unpublished',0),(339,1048585,9,1,'2022-11-29 16:59:52',268435462,'publication.event.published',0),(340,1048585,7,1,'2022-11-29 17:00:11',268435463,'publication.event.unpublished',0),(341,1048585,7,1,'2022-11-29 17:00:38',268435458,'submission.event.general.metadataUpdated',0),(342,1048585,7,1,'2022-11-29 17:00:43',268435462,'publication.event.published',0),(343,1048585,7,1,'2022-11-29 17:01:16',268435463,'publication.event.unpublished',0),(344,1048585,7,1,'2022-11-29 17:04:34',268435458,'submission.event.general.metadataUpdated',0),(345,1048585,7,1,'2022-11-29 17:04:56',268435458,'submission.event.general.metadataUpdated',0),(346,1048585,7,1,'2022-11-29 17:05:03',268435462,'publication.event.published',0),(347,1048585,9,1,'2022-11-29 17:05:44',268435463,'publication.event.unpublished',0),(348,1048585,9,1,'2022-11-29 17:11:25',268435458,'submission.event.general.metadataUpdated',0),(349,1048585,9,1,'2022-11-29 17:11:27',268435458,'submission.event.general.metadataUpdated',0),(350,1048585,9,1,'2022-11-29 17:11:32',268435462,'publication.event.published',0),(351,1048585,9,1,'2022-11-29 17:13:34',268435463,'publication.event.unpublished',0),(352,1048585,9,1,'2022-11-29 17:13:40',268435458,'submission.event.general.metadataUpdated',0),(353,1048585,7,1,'2022-11-29 17:14:09',268435463,'publication.event.unpublished',0),(354,1048585,7,1,'2022-11-29 17:14:14',268435458,'submission.event.general.metadataUpdated',0),(355,1048585,7,1,'2022-11-29 17:14:18',268435458,'submission.event.general.metadataUpdated',0),(356,1048585,7,1,'2022-11-29 17:14:22',268435462,'publication.event.published',0),(357,1048585,9,1,'2022-11-29 17:14:35',268435462,'publication.event.published',0),(358,1048585,9,1,'2022-11-29 17:17:23',268435463,'publication.event.unpublished',0),(359,1048585,9,1,'2022-11-29 17:17:37',268435458,'submission.event.general.metadataUpdated',0),(360,1048585,9,1,'2022-11-29 17:17:43',268435462,'publication.event.published',0),(361,1048585,7,1,'2022-11-29 17:17:55',268435463,'publication.event.unpublished',0),(362,1048585,7,1,'2022-11-29 17:18:16',268435458,'submission.event.general.metadataUpdated',0),(363,1048585,7,1,'2022-11-29 17:18:21',268435462,'publication.event.published',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (3,'fileId','1','int'),(3,'fileStage','2','int'),(3,'originalFileName','De belleza y misoginia-FINAL (Revisado).docx','string'),(3,'sourceSubmissionFileId',NULL,'string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','dfilo','string'),(4,'fileId','1','int'),(4,'fileStage','2','int'),(4,'name','De belleza y misoginia-FINAL (Revisado).docx','string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','dfilo','string'),(5,'fileId','1','int'),(5,'fileStage','2','int'),(5,'originalFileName','De belleza y misoginia-FINAL (Revisado).docx','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','dfilo','string'),(6,'fileId','1','int'),(6,'fileStage','2','int'),(6,'name','De belleza y misoginia-FINAL (Revisado).docx','string'),(6,'originalFileName','De belleza y misoginia-FINAL (Revisado).docx','string'),(6,'sourceSubmissionFileId',NULL,'string'),(6,'submissionFileId','1','int'),(6,'submissionId','1','int'),(6,'username','dfilo','string'),(11,'fileId','2','int'),(11,'fileStage','2','int'),(11,'originalFileName','Guerrilla, violencia y racismo_para formar.rtf','string'),(11,'sourceSubmissionFileId',NULL,'string'),(11,'submissionFileId','2','int'),(11,'submissionId','2','int'),(11,'username','czarate','string'),(12,'fileId','2','int'),(12,'fileStage','2','int'),(12,'name','Guerrilla, violencia y racismo_para formar.rtf','string'),(12,'submissionFileId','2','int'),(12,'submissionId','2','int'),(12,'username','czarate','string'),(13,'fileId','2','int'),(13,'fileStage','2','int'),(13,'originalFileName','Guerrilla, violencia y racismo_para formar.rtf','string'),(13,'sourceSubmissionFileId',NULL,'string'),(13,'submissionFileId','2','int'),(13,'submissionId','2','int'),(13,'username','czarate','string'),(14,'fileId','2','int'),(14,'fileStage','2','int'),(14,'name','Guerrilla, violencia y racismo_para formar.rtf','string'),(14,'originalFileName','Guerrilla, violencia y racismo_para formar.rtf','string'),(14,'sourceSubmissionFileId',NULL,'string'),(14,'submissionFileId','2','int'),(14,'submissionId','2','int'),(14,'username','czarate','string'),(17,'fileId','3','int'),(17,'fileStage','2','int'),(17,'originalFileName','Guerrilla, violencia y racismo_CC.doc','string'),(17,'sourceSubmissionFileId',NULL,'string'),(17,'submissionFileId','2','int'),(17,'submissionId','2','int'),(17,'username','dfilo','string'),(18,'fileId','3','int'),(18,'fileStage','2','int'),(18,'name','Guerrilla, violencia y racismo_CC.doc','string'),(18,'originalFileName','Guerrilla, violencia y racismo_CC.doc','string'),(18,'sourceSubmissionFileId',NULL,'string'),(18,'submissionFileId','2','int'),(18,'submissionId','2','int'),(18,'username','dfilo','string'),(19,'fileStage','2','int'),(19,'sourceSubmissionFileId',NULL,'string'),(19,'submissionFileId','2','int'),(19,'submissionId','2','int'),(19,'username','dfilo','string'),(20,'formatName','Rosario Castellanos, intelectual mexicana.','string'),(21,'fileId','4','int'),(21,'fileStage','10','int'),(21,'originalFileName','Rosario Castellanos-COMPLETO.pdf','string'),(21,'sourceSubmissionFileId',NULL,'string'),(21,'submissionFileId','3','int'),(21,'submissionId','4','int'),(21,'username','admin','string'),(22,'fileId','4','int'),(22,'fileStage','10','int'),(22,'name','Rosario Castellanos-COMPLETO.pdf','string'),(22,'submissionFileId','3','int'),(22,'submissionId','4','int'),(22,'username','admin','string'),(23,'fileId','5','int'),(23,'fileStage','10','int'),(23,'originalFileName','Rosario Castellanos-COMPLETO.pdf','string'),(23,'sourceSubmissionFileId',NULL,'string'),(23,'submissionFileId','4','int'),(23,'submissionId','4','int'),(23,'username','admin','string'),(24,'fileId','5','int'),(24,'fileStage','10','int'),(24,'name','Rosario Castellanos-COMPLETO.pdf','string'),(24,'submissionFileId','4','int'),(24,'submissionId','4','int'),(24,'username','admin','string'),(25,'fileId','5','int'),(25,'fileStage','10','int'),(25,'originalFileName','Rosario Castellanos-COMPLETO.pdf','string'),(25,'sourceSubmissionFileId',NULL,'string'),(25,'submissionFileId','4','int'),(25,'submissionId','4','int'),(25,'username','admin','string'),(26,'fileId','5','int'),(26,'fileStage','10','int'),(26,'name','Rosario Castellanos-COMPLETO.pdf','string'),(26,'originalFileName','Rosario Castellanos-COMPLETO.pdf','string'),(26,'sourceSubmissionFileId',NULL,'string'),(26,'submissionFileId','4','int'),(26,'submissionId','4','int'),(26,'username','admin','string'),(27,'fileStage','10','int'),(27,'sourceSubmissionFileId',NULL,'string'),(27,'submissionFileId','3','int'),(27,'submissionId','4','int'),(27,'username','admin','string'),(30,'formatName','Capítulo 1','string'),(31,'formatName','Capítulo 2','string'),(32,'formatName','Capítulo 3','string'),(33,'formatName','Capítulo 4','string'),(34,'formatName','Capítulo 5','string'),(35,'formatName','Comprar','string'),(36,'fileId','6','int'),(36,'fileStage','10','int'),(36,'originalFileName','Capitulo 1.pdf','string'),(36,'sourceSubmissionFileId',NULL,'string'),(36,'submissionFileId','5','int'),(36,'submissionId','4','int'),(36,'username','admin','string'),(37,'fileId','6','int'),(37,'fileStage','10','int'),(37,'name','Capitulo 1.pdf','string'),(37,'submissionFileId','5','int'),(37,'submissionId','4','int'),(37,'username','admin','string'),(38,'fileId','6','int'),(38,'fileStage','10','int'),(38,'originalFileName','Capitulo 1.pdf','string'),(38,'sourceSubmissionFileId',NULL,'string'),(38,'submissionFileId','5','int'),(38,'submissionId','4','int'),(38,'username','admin','string'),(39,'fileId','6','int'),(39,'fileStage','10','int'),(39,'name','Capitulo 1.pdf','string'),(39,'originalFileName','Capitulo 1.pdf','string'),(39,'sourceSubmissionFileId',NULL,'string'),(39,'submissionFileId','5','int'),(39,'submissionId','4','int'),(39,'username','admin','string'),(40,'fileId','7','int'),(40,'fileStage','10','int'),(40,'originalFileName','Capitulo 2.pdf','string'),(40,'sourceSubmissionFileId',NULL,'string'),(40,'submissionFileId','6','int'),(40,'submissionId','4','int'),(40,'username','admin','string'),(41,'fileId','7','int'),(41,'fileStage','10','int'),(41,'name','Capitulo 2.pdf','string'),(41,'submissionFileId','6','int'),(41,'submissionId','4','int'),(41,'username','admin','string'),(42,'fileId','7','int'),(42,'fileStage','10','int'),(42,'originalFileName','Capitulo 2.pdf','string'),(42,'sourceSubmissionFileId',NULL,'string'),(42,'submissionFileId','6','int'),(42,'submissionId','4','int'),(42,'username','admin','string'),(43,'fileId','7','int'),(43,'fileStage','10','int'),(43,'name','Capitulo 2.pdf','string'),(43,'originalFileName','Capitulo 2.pdf','string'),(43,'sourceSubmissionFileId',NULL,'string'),(43,'submissionFileId','6','int'),(43,'submissionId','4','int'),(43,'username','admin','string'),(44,'fileId','8','int'),(44,'fileStage','10','int'),(44,'originalFileName','Capitulo 3.pdf','string'),(44,'sourceSubmissionFileId',NULL,'string'),(44,'submissionFileId','7','int'),(44,'submissionId','4','int'),(44,'username','admin','string'),(45,'fileId','8','int'),(45,'fileStage','10','int'),(45,'name','Capitulo 3.pdf','string'),(45,'submissionFileId','7','int'),(45,'submissionId','4','int'),(45,'username','admin','string'),(46,'fileId','8','int'),(46,'fileStage','10','int'),(46,'originalFileName','Capitulo 3.pdf','string'),(46,'sourceSubmissionFileId',NULL,'string'),(46,'submissionFileId','7','int'),(46,'submissionId','4','int'),(46,'username','admin','string'),(47,'fileId','8','int'),(47,'fileStage','10','int'),(47,'name','Capitulo 3.pdf','string'),(47,'originalFileName','Capitulo 3.pdf','string'),(47,'sourceSubmissionFileId',NULL,'string'),(47,'submissionFileId','7','int'),(47,'submissionId','4','int'),(47,'username','admin','string'),(48,'fileId','9','int'),(48,'fileStage','10','int'),(48,'originalFileName','Capitulo 4.pdf','string'),(48,'sourceSubmissionFileId',NULL,'string'),(48,'submissionFileId','8','int'),(48,'submissionId','4','int'),(48,'username','admin','string'),(49,'fileId','9','int'),(49,'fileStage','10','int'),(49,'name','Capitulo 4.pdf','string'),(49,'submissionFileId','8','int'),(49,'submissionId','4','int'),(49,'username','admin','string'),(50,'fileId','9','int'),(50,'fileStage','10','int'),(50,'originalFileName','Capitulo 4.pdf','string'),(50,'sourceSubmissionFileId',NULL,'string'),(50,'submissionFileId','8','int'),(50,'submissionId','4','int'),(50,'username','admin','string'),(51,'fileId','9','int'),(51,'fileStage','10','int'),(51,'name','Capitulo 4.pdf','string'),(51,'originalFileName','Capitulo 4.pdf','string'),(51,'sourceSubmissionFileId',NULL,'string'),(51,'submissionFileId','8','int'),(51,'submissionId','4','int'),(51,'username','admin','string'),(52,'fileId','10','int'),(52,'fileStage','10','int'),(52,'originalFileName','Capitulo 5.pdf','string'),(52,'sourceSubmissionFileId',NULL,'string'),(52,'submissionFileId','9','int'),(52,'submissionId','4','int'),(52,'username','admin','string'),(53,'fileId','10','int'),(53,'fileStage','10','int'),(53,'name','Capitulo 5.pdf','string'),(53,'submissionFileId','9','int'),(53,'submissionId','4','int'),(53,'username','admin','string'),(54,'fileId','10','int'),(54,'fileStage','10','int'),(54,'originalFileName','Capitulo 5.pdf','string'),(54,'sourceSubmissionFileId',NULL,'string'),(54,'submissionFileId','9','int'),(54,'submissionId','4','int'),(54,'username','admin','string'),(55,'fileId','10','int'),(55,'fileStage','10','int'),(55,'name','Capitulo 5.pdf','string'),(55,'originalFileName','Capitulo 5.pdf','string'),(55,'sourceSubmissionFileId',NULL,'string'),(55,'submissionFileId','9','int'),(55,'submissionId','4','int'),(55,'username','admin','string'),(56,'fileId','11','int'),(56,'fileStage','10','int'),(56,'originalFileName','Meta.html','string'),(56,'sourceSubmissionFileId',NULL,'string'),(56,'submissionFileId','10','int'),(56,'submissionId','4','int'),(56,'username','admin','string'),(57,'fileId','11','int'),(57,'fileStage','10','int'),(57,'name','Meta.html','string'),(57,'submissionFileId','10','int'),(57,'submissionId','4','int'),(57,'username','admin','string'),(58,'fileId','11','int'),(58,'fileStage','10','int'),(58,'originalFileName','Meta.html','string'),(58,'sourceSubmissionFileId',NULL,'string'),(58,'submissionFileId','10','int'),(58,'submissionId','4','int'),(58,'username','admin','string'),(59,'fileId','11','int'),(59,'fileStage','10','int'),(59,'name','Meta.html','string'),(59,'originalFileName','Meta.html','string'),(59,'sourceSubmissionFileId',NULL,'string'),(59,'submissionFileId','10','int'),(59,'submissionId','4','int'),(59,'username','admin','string'),(60,'publicationFormatName','Rosario Castellanos, intelectual mexicana.','string'),(61,'publicationFormatName','Rosario Castellanos, intelectual mexicana.','string'),(62,'fileId','5','int'),(62,'fileStage','10','int'),(62,'originalFileName','Rosario Castellanos-COMPLETO.pdf','string'),(62,'sourceSubmissionFileId',NULL,'string'),(62,'submissionFileId','4','int'),(62,'submissionId','4','int'),(62,'username','admin','string'),(63,'fileId','5','int'),(63,'fileStage','10','int'),(63,'name','Rosario Castellanos-COMPLETO.pdf','string'),(63,'originalFileName','Rosario Castellanos-COMPLETO.pdf','string'),(63,'sourceSubmissionFileId',NULL,'string'),(63,'submissionFileId','4','int'),(63,'submissionId','4','int'),(63,'username','admin','string'),(64,'file','Rosario Castellanos-COMPLETO.pdf','string'),(64,'name','admin admin','string'),(64,'username','admin','string'),(65,'publicationFormatName','Capítulo 1','string'),(66,'fileId','6','int'),(66,'fileStage','10','int'),(66,'originalFileName','Capitulo 1.pdf','string'),(66,'sourceSubmissionFileId',NULL,'string'),(66,'submissionFileId','5','int'),(66,'submissionId','4','int'),(66,'username','admin','string'),(67,'fileId','6','int'),(67,'fileStage','10','int'),(67,'name','Capitulo 1.pdf','string'),(67,'originalFileName','Capitulo 1.pdf','string'),(67,'sourceSubmissionFileId',NULL,'string'),(67,'submissionFileId','5','int'),(67,'submissionId','4','int'),(67,'username','admin','string'),(68,'file','Capitulo 1.pdf','string'),(68,'name','admin admin','string'),(68,'username','admin','string'),(69,'publicationFormatName','Capítulo 2','string'),(70,'fileId','7','int'),(70,'fileStage','10','int'),(70,'originalFileName','Capitulo 2.pdf','string'),(70,'sourceSubmissionFileId',NULL,'string'),(70,'submissionFileId','6','int'),(70,'submissionId','4','int'),(70,'username','admin','string'),(71,'fileId','7','int'),(71,'fileStage','10','int'),(71,'name','Capitulo 2.pdf','string'),(71,'originalFileName','Capitulo 2.pdf','string'),(71,'sourceSubmissionFileId',NULL,'string'),(71,'submissionFileId','6','int'),(71,'submissionId','4','int'),(71,'username','admin','string'),(72,'file','Capitulo 2.pdf','string'),(72,'name','admin admin','string'),(72,'username','admin','string'),(73,'publicationFormatName','Capítulo 3','string'),(74,'fileId','8','int'),(74,'fileStage','10','int'),(74,'originalFileName','Capitulo 3.pdf','string'),(74,'sourceSubmissionFileId',NULL,'string'),(74,'submissionFileId','7','int'),(74,'submissionId','4','int'),(74,'username','admin','string'),(75,'fileId','8','int'),(75,'fileStage','10','int'),(75,'name','Capitulo 3.pdf','string'),(75,'originalFileName','Capitulo 3.pdf','string'),(75,'sourceSubmissionFileId',NULL,'string'),(75,'submissionFileId','7','int'),(75,'submissionId','4','int'),(75,'username','admin','string'),(76,'file','Capitulo 3.pdf','string'),(76,'name','admin admin','string'),(76,'username','admin','string'),(77,'publicationFormatName','Capítulo 4','string'),(78,'fileId','9','int'),(78,'fileStage','10','int'),(78,'originalFileName','Capitulo 4.pdf','string'),(78,'sourceSubmissionFileId',NULL,'string'),(78,'submissionFileId','8','int'),(78,'submissionId','4','int'),(78,'username','admin','string'),(79,'fileId','9','int'),(79,'fileStage','10','int'),(79,'name','Capitulo 4.pdf','string'),(79,'originalFileName','Capitulo 4.pdf','string'),(79,'sourceSubmissionFileId',NULL,'string'),(79,'submissionFileId','8','int'),(79,'submissionId','4','int'),(79,'username','admin','string'),(80,'file','Capitulo 4.pdf','string'),(80,'name','admin admin','string'),(80,'username','admin','string'),(81,'publicationFormatName','Capítulo 5','string'),(82,'fileId','10','int'),(82,'fileStage','10','int'),(82,'originalFileName','Capitulo 5.pdf','string'),(82,'sourceSubmissionFileId',NULL,'string'),(82,'submissionFileId','9','int'),(82,'submissionId','4','int'),(82,'username','admin','string'),(83,'fileId','10','int'),(83,'fileStage','10','int'),(83,'name','Capitulo 5.pdf','string'),(83,'originalFileName','Capitulo 5.pdf','string'),(83,'sourceSubmissionFileId',NULL,'string'),(83,'submissionFileId','9','int'),(83,'submissionId','4','int'),(83,'username','admin','string'),(84,'file','Capitulo 5.pdf','string'),(84,'name','admin admin','string'),(84,'username','admin','string'),(85,'publicationFormatName','Comprar','string'),(86,'fileId','11','int'),(86,'fileStage','10','int'),(86,'originalFileName','Meta.html','string'),(86,'sourceSubmissionFileId',NULL,'string'),(86,'submissionFileId','10','int'),(86,'submissionId','4','int'),(86,'username','admin','string'),(87,'fileId','11','int'),(87,'fileStage','10','int'),(87,'name','Meta.html','string'),(87,'originalFileName','Meta.html','string'),(87,'sourceSubmissionFileId',NULL,'string'),(87,'submissionFileId','10','int'),(87,'submissionId','4','int'),(87,'username','admin','string'),(88,'file','Meta.html','string'),(88,'name','admin admin','string'),(88,'username','admin','string'),(89,'publicationFormatName','Comprar','string'),(90,'publicationFormatName','Capítulo 5','string'),(91,'publicationFormatName','Capítulo 4','string'),(92,'publicationFormatName','Capítulo 3','string'),(93,'publicationFormatName','Capítulo 2','string'),(94,'publicationFormatName','Capítulo 1','string'),(114,'publicationFormatName','Capítulo 2','string'),(115,'publicationFormatName','Capítulo 3','string'),(118,'publicationFormatName','Descargar','string'),(119,'publicationFormatName','Capítulo 5','string'),(120,'publicationFormatName','Comprar en Ediciones de Lirio','string'),(123,'publicationFormatName','Comprar en Ediciones de Lirio','string'),(124,'publicationFormatName','Capítulo 4','string'),(130,'publicationFormatName','Comprar en Ediciones de Lirio','string'),(134,'publicationFormatName','Comprar en Ediciones de Lirio','string'),(138,'publicationFormatName','Comprar en Ediciones de Lirio','string'),(141,'publicationFormatName','Comprar en Ediciones de Lirio','string'),(146,'formatName','Comprar en Casa de Libros Abiertos','string'),(149,'publicationFormatName','Comprar en Casa de Libros Abiertos','string'),(150,'publicationFormatName','Comprar en Casa de Libros Abiertos','string'),(159,'formatName','PDF','string'),(196,'formatName','Libro digital','string'),(197,'fileId','12','int'),(197,'fileStage','10','int'),(197,'originalFileName','Libro 1.pdf','string'),(197,'sourceSubmissionFileId',NULL,'string'),(197,'submissionFileId','11','int'),(197,'submissionId','7','int'),(197,'username','admin','string'),(198,'fileId','12','int'),(198,'fileStage','10','int'),(198,'name','Libro 1.pdf','string'),(198,'submissionFileId','11','int'),(198,'submissionId','7','int'),(198,'username','admin','string'),(199,'fileId','13','int'),(199,'fileStage','10','int'),(199,'originalFileName','Libro 1.pdf','string'),(199,'sourceSubmissionFileId',NULL,'string'),(199,'submissionFileId','11','int'),(199,'submissionId','7','int'),(199,'username','admin','string'),(200,'fileId','13','int'),(200,'fileStage','10','int'),(200,'name','Libro 1.pdf','string'),(200,'originalFileName','Libro 1.pdf','string'),(200,'sourceSubmissionFileId',NULL,'string'),(200,'submissionFileId','11','int'),(200,'submissionId','7','int'),(200,'username','admin','string'),(201,'fileStage','10','int'),(201,'sourceSubmissionFileId',NULL,'string'),(201,'submissionFileId','11','int'),(201,'submissionId','7','int'),(201,'username','admin','string'),(202,'fileId','14','int'),(202,'fileStage','10','int'),(202,'originalFileName','Libro 1.pdf','string'),(202,'sourceSubmissionFileId',NULL,'string'),(202,'submissionFileId','12','int'),(202,'submissionId','7','int'),(202,'username','admin','string'),(203,'fileId','14','int'),(203,'fileStage','10','int'),(203,'name','Libro 1.pdf','string'),(203,'submissionFileId','12','int'),(203,'submissionId','7','int'),(203,'username','admin','string'),(204,'fileStage','10','int'),(204,'sourceSubmissionFileId',NULL,'string'),(204,'submissionFileId','12','int'),(204,'submissionId','7','int'),(204,'username','admin','string'),(205,'fileId','15','int'),(205,'fileStage','10','int'),(205,'originalFileName','Libro 1.pdf','string'),(205,'sourceSubmissionFileId',NULL,'string'),(205,'submissionFileId','13','int'),(205,'submissionId','7','int'),(205,'username','admin','string'),(206,'fileId','15','int'),(206,'fileStage','10','int'),(206,'name','Libro 1.pdf','string'),(206,'submissionFileId','13','int'),(206,'submissionId','7','int'),(206,'username','admin','string'),(207,'fileStage','10','int'),(207,'sourceSubmissionFileId',NULL,'string'),(207,'submissionFileId','13','int'),(207,'submissionId','7','int'),(207,'username','admin','string'),(208,'fileId','16','int'),(208,'fileStage','10','int'),(208,'originalFileName','Libro 1.pdf','string'),(208,'sourceSubmissionFileId',NULL,'string'),(208,'submissionFileId','14','int'),(208,'submissionId','7','int'),(208,'username','admin','string'),(209,'fileId','16','int'),(209,'fileStage','10','int'),(209,'name','Libro 1.pdf','string'),(209,'submissionFileId','14','int'),(209,'submissionId','7','int'),(209,'username','admin','string'),(210,'fileId','16','int'),(210,'fileStage','10','int'),(210,'originalFileName','Libro 1.pdf','string'),(210,'sourceSubmissionFileId',NULL,'string'),(210,'submissionFileId','14','int'),(210,'submissionId','7','int'),(210,'username','admin','string'),(211,'fileId','16','int'),(211,'fileStage','10','int'),(211,'name','Libro 1.pdf','string'),(211,'originalFileName','Libro 1.pdf','string'),(211,'sourceSubmissionFileId',NULL,'string'),(211,'submissionFileId','14','int'),(211,'submissionId','7','int'),(211,'username','admin','string'),(212,'fileId','16','int'),(212,'fileStage','10','int'),(212,'originalFileName','LA CATEGORÍA DEL PODER EN LA FILOSOFÍA POLÍTICA DE NUESTROS DÍAS','string'),(212,'sourceSubmissionFileId',NULL,'string'),(212,'submissionFileId','14','int'),(212,'submissionId','7','int'),(212,'username','admin','string'),(213,'fileId','16','int'),(213,'fileStage','10','int'),(213,'name','LA CATEGORÍA DEL PODER EN LA FILOSOFÍA POLÍTICA DE NUESTROS DÍAS','string'),(213,'originalFileName','LA CATEGORÍA DEL PODER EN LA FILOSOFÍA POLÍTICA DE NUESTROS DÍAS','string'),(213,'sourceSubmissionFileId',NULL,'string'),(213,'submissionFileId','14','int'),(213,'submissionId','7','int'),(213,'username','admin','string'),(216,'formatName','Capítulo 1','string'),(217,'formatName','Capítulo 1','string'),(218,'formatName','Capítulo 1. LA JUSTICIA Y LA DEMOCRACIA: ¿CUÁL ES LA SITUACIÓN DE LA POLÍTICA EN EL MUNDO GLOBAL?','string'),(219,'formatName','Capítulo 2. ENTRE EL PODER Y LA POLÍTICA: EL INDIVIDUO Y LA LIBERTAD','string'),(220,'formatName','Capítulo 3. HANNAH ARENDT: EL ESPACIO INTERMEDIO DE LA POLÍTICA Y EL PODER DE LA ACCIÓN COMÚN*','string'),(221,'formatName','Capítulo 3. HANNAH ARENDT: EL ESPACIO INTERMEDIO DE LA POLÍTICA Y EL PODER DE LA ACCIÓN COMÚN*','string'),(222,'formatName','Capítulo 4. EL PODER: ENFOQUES EN CONTRASTE','string'),(223,'formatName','Capítulo 5. LA LOCURA Y EL PODER: UN FRAGMENTO DEL TRAYECTO DE MICHEL FOUCAULT','string'),(224,'fileId','17','int'),(224,'fileStage','10','int'),(224,'originalFileName','Capitulo 1.pdf','string'),(224,'sourceSubmissionFileId',NULL,'string'),(224,'submissionFileId','15','int'),(224,'submissionId','7','int'),(224,'username','admin','string'),(225,'fileId','17','int'),(225,'fileStage','10','int'),(225,'name','Capitulo 1.pdf','string'),(225,'submissionFileId','15','int'),(225,'submissionId','7','int'),(225,'username','admin','string'),(226,'fileId','17','int'),(226,'fileStage','10','int'),(226,'originalFileName','Capitulo 1.pdf','string'),(226,'sourceSubmissionFileId',NULL,'string'),(226,'submissionFileId','15','int'),(226,'submissionId','7','int'),(226,'username','admin','string'),(227,'fileId','17','int'),(227,'fileStage','10','int'),(227,'name','Capitulo 1.pdf','string'),(227,'originalFileName','Capitulo 1.pdf','string'),(227,'sourceSubmissionFileId',NULL,'string'),(227,'submissionFileId','15','int'),(227,'submissionId','7','int'),(227,'username','admin','string'),(228,'fileId','18','int'),(228,'fileStage','10','int'),(228,'originalFileName','Capitulo 2.pdf','string'),(228,'sourceSubmissionFileId',NULL,'string'),(228,'submissionFileId','16','int'),(228,'submissionId','7','int'),(228,'username','admin','string'),(229,'fileId','18','int'),(229,'fileStage','10','int'),(229,'name','Capitulo 2.pdf','string'),(229,'submissionFileId','16','int'),(229,'submissionId','7','int'),(229,'username','admin','string'),(230,'fileId','18','int'),(230,'fileStage','10','int'),(230,'originalFileName','Capitulo 2.pdf','string'),(230,'sourceSubmissionFileId',NULL,'string'),(230,'submissionFileId','16','int'),(230,'submissionId','7','int'),(230,'username','admin','string'),(231,'fileId','18','int'),(231,'fileStage','10','int'),(231,'name','Capitulo 2.pdf','string'),(231,'originalFileName','Capitulo 2.pdf','string'),(231,'sourceSubmissionFileId',NULL,'string'),(231,'submissionFileId','16','int'),(231,'submissionId','7','int'),(231,'username','admin','string'),(232,'fileId','19','int'),(232,'fileStage','10','int'),(232,'originalFileName','Capitulo 3.pdf','string'),(232,'sourceSubmissionFileId',NULL,'string'),(232,'submissionFileId','17','int'),(232,'submissionId','7','int'),(232,'username','admin','string'),(233,'fileId','19','int'),(233,'fileStage','10','int'),(233,'name','Capitulo 3.pdf','string'),(233,'submissionFileId','17','int'),(233,'submissionId','7','int'),(233,'username','admin','string'),(234,'fileId','19','int'),(234,'fileStage','10','int'),(234,'originalFileName','Capitulo 3.pdf','string'),(234,'sourceSubmissionFileId',NULL,'string'),(234,'submissionFileId','17','int'),(234,'submissionId','7','int'),(234,'username','admin','string'),(235,'fileId','19','int'),(235,'fileStage','10','int'),(235,'name','Capitulo 3.pdf','string'),(235,'originalFileName','Capitulo 3.pdf','string'),(235,'sourceSubmissionFileId',NULL,'string'),(235,'submissionFileId','17','int'),(235,'submissionId','7','int'),(235,'username','admin','string'),(236,'formatName','Capítulo 3. HANNAH ARENDT: EL ESPACIO INTERMEDIO DE LA POLÍTICA Y EL PODER DE LA ACCIÓN COMÚN*','string'),(237,'fileId','20','int'),(237,'fileStage','10','int'),(237,'originalFileName','Capitulo 4.pdf','string'),(237,'sourceSubmissionFileId',NULL,'string'),(237,'submissionFileId','18','int'),(237,'submissionId','7','int'),(237,'username','admin','string'),(238,'fileId','20','int'),(238,'fileStage','10','int'),(238,'name','Capitulo 4.pdf','string'),(238,'submissionFileId','18','int'),(238,'submissionId','7','int'),(238,'username','admin','string'),(239,'fileId','20','int'),(239,'fileStage','10','int'),(239,'originalFileName','Capitulo 4.pdf','string'),(239,'sourceSubmissionFileId',NULL,'string'),(239,'submissionFileId','18','int'),(239,'submissionId','7','int'),(239,'username','admin','string'),(240,'fileId','20','int'),(240,'fileStage','10','int'),(240,'name','Capitulo 4.pdf','string'),(240,'originalFileName','Capitulo 4.pdf','string'),(240,'sourceSubmissionFileId',NULL,'string'),(240,'submissionFileId','18','int'),(240,'submissionId','7','int'),(240,'username','admin','string'),(241,'fileId','21','int'),(241,'fileStage','10','int'),(241,'originalFileName','Capitulo 5.pdf','string'),(241,'sourceSubmissionFileId',NULL,'string'),(241,'submissionFileId','19','int'),(241,'submissionId','7','int'),(241,'username','admin','string'),(242,'fileId','21','int'),(242,'fileStage','10','int'),(242,'name','Capitulo 5.pdf','string'),(242,'submissionFileId','19','int'),(242,'submissionId','7','int'),(242,'username','admin','string'),(243,'fileId','21','int'),(243,'fileStage','10','int'),(243,'originalFileName','Capitulo 5.pdf','string'),(243,'sourceSubmissionFileId',NULL,'string'),(243,'submissionFileId','19','int'),(243,'submissionId','7','int'),(243,'username','admin','string'),(244,'fileId','21','int'),(244,'fileStage','10','int'),(244,'name','Capitulo 5.pdf','string'),(244,'originalFileName','Capitulo 5.pdf','string'),(244,'sourceSubmissionFileId',NULL,'string'),(244,'submissionFileId','19','int'),(244,'submissionId','7','int'),(244,'username','admin','string'),(245,'publicationFormatName','Libro digital','string'),(246,'fileId','16','int'),(246,'fileStage','10','int'),(246,'originalFileName','LA CATEGORÍA DEL PODER EN LA FILOSOFÍA POLÍTICA DE NUESTROS DÍAS','string'),(246,'sourceSubmissionFileId',NULL,'string'),(246,'submissionFileId','14','int'),(246,'submissionId','7','int'),(246,'username','admin','string'),(247,'fileId','16','int'),(247,'fileStage','10','int'),(247,'name','LA CATEGORÍA DEL PODER EN LA FILOSOFÍA POLÍTICA DE NUESTROS DÍAS','string'),(247,'originalFileName','LA CATEGORÍA DEL PODER EN LA FILOSOFÍA POLÍTICA DE NUESTROS DÍAS','string'),(247,'sourceSubmissionFileId',NULL,'string'),(247,'submissionFileId','14','int'),(247,'submissionId','7','int'),(247,'username','admin','string'),(248,'file','LA CATEGORÍA DEL PODER EN LA FILOSOFÍA POLÍTICA DE NUESTROS DÍAS','string'),(248,'name','admin admin','string'),(248,'username','admin','string'),(249,'publicationFormatName','Capítulo 1. LA JUSTICIA Y LA DEMOCRACIA: ¿CUÁL ES LA SITUACIÓN DE LA POLÍTICA EN EL MUNDO GLOBAL?','string'),(250,'fileId','17','int'),(250,'fileStage','10','int'),(250,'originalFileName','Capitulo 1.pdf','string'),(250,'sourceSubmissionFileId',NULL,'string'),(250,'submissionFileId','15','int'),(250,'submissionId','7','int'),(250,'username','admin','string'),(251,'fileId','17','int'),(251,'fileStage','10','int'),(251,'name','Capitulo 1.pdf','string'),(251,'originalFileName','Capitulo 1.pdf','string'),(251,'sourceSubmissionFileId',NULL,'string'),(251,'submissionFileId','15','int'),(251,'submissionId','7','int'),(251,'username','admin','string'),(252,'file','Capitulo 1.pdf','string'),(252,'name','admin admin','string'),(252,'username','admin','string'),(253,'publicationFormatName','Capítulo 2. ENTRE EL PODER Y LA POLÍTICA: EL INDIVIDUO Y LA LIBERTAD','string'),(254,'fileId','18','int'),(254,'fileStage','10','int'),(254,'originalFileName','Capitulo 2.pdf','string'),(254,'sourceSubmissionFileId',NULL,'string'),(254,'submissionFileId','16','int'),(254,'submissionId','7','int'),(254,'username','admin','string'),(255,'fileId','18','int'),(255,'fileStage','10','int'),(255,'name','Capitulo 2.pdf','string'),(255,'originalFileName','Capitulo 2.pdf','string'),(255,'sourceSubmissionFileId',NULL,'string'),(255,'submissionFileId','16','int'),(255,'submissionId','7','int'),(255,'username','admin','string'),(256,'file','Capitulo 2.pdf','string'),(256,'name','admin admin','string'),(256,'username','admin','string'),(257,'publicationFormatName','Capítulo 3. HANNAH ARENDT: EL ESPACIO INTERMEDIO DE LA POLÍTICA Y EL PODER DE LA ACCIÓN COMÚN*','string'),(258,'fileId','19','int'),(258,'fileStage','10','int'),(258,'originalFileName','Capitulo 3.pdf','string'),(258,'sourceSubmissionFileId',NULL,'string'),(258,'submissionFileId','17','int'),(258,'submissionId','7','int'),(258,'username','admin','string'),(259,'fileId','19','int'),(259,'fileStage','10','int'),(259,'name','Capitulo 3.pdf','string'),(259,'originalFileName','Capitulo 3.pdf','string'),(259,'sourceSubmissionFileId',NULL,'string'),(259,'submissionFileId','17','int'),(259,'submissionId','7','int'),(259,'username','admin','string'),(260,'file','Capitulo 3.pdf','string'),(260,'name','admin admin','string'),(260,'username','admin','string'),(261,'publicationFormatName','Capítulo 4. EL PODER: ENFOQUES EN CONTRASTE','string'),(262,'fileId','20','int'),(262,'fileStage','10','int'),(262,'originalFileName','Capitulo 4.pdf','string'),(262,'sourceSubmissionFileId',NULL,'string'),(262,'submissionFileId','18','int'),(262,'submissionId','7','int'),(262,'username','admin','string'),(263,'fileId','20','int'),(263,'fileStage','10','int'),(263,'name','Capitulo 4.pdf','string'),(263,'originalFileName','Capitulo 4.pdf','string'),(263,'sourceSubmissionFileId',NULL,'string'),(263,'submissionFileId','18','int'),(263,'submissionId','7','int'),(263,'username','admin','string'),(264,'file','Capitulo 4.pdf','string'),(264,'name','admin admin','string'),(264,'username','admin','string'),(265,'publicationFormatName','Capítulo 5. LA LOCURA Y EL PODER: UN FRAGMENTO DEL TRAYECTO DE MICHEL FOUCAULT','string'),(266,'fileId','21','int'),(266,'fileStage','10','int'),(266,'originalFileName','Capitulo 5.pdf','string'),(266,'sourceSubmissionFileId',NULL,'string'),(266,'submissionFileId','19','int'),(266,'submissionId','7','int'),(266,'username','admin','string'),(267,'fileId','21','int'),(267,'fileStage','10','int'),(267,'name','Capitulo 5.pdf','string'),(267,'originalFileName','Capitulo 5.pdf','string'),(267,'sourceSubmissionFileId',NULL,'string'),(267,'submissionFileId','19','int'),(267,'submissionId','7','int'),(267,'username','admin','string'),(268,'file','Capitulo 5.pdf','string'),(268,'name','admin admin','string'),(268,'username','admin','string'),(276,'formatName','Libro digital','string'),(277,'fileId','22','int'),(277,'fileStage','10','int'),(277,'originalFileName','Libro 2.pdf','string'),(277,'sourceSubmissionFileId',NULL,'string'),(277,'submissionFileId','20','int'),(277,'submissionId','8','int'),(277,'username','admin','string'),(278,'fileId','22','int'),(278,'fileStage','10','int'),(278,'name','Libro 2.pdf','string'),(278,'submissionFileId','20','int'),(278,'submissionId','8','int'),(278,'username','admin','string'),(279,'fileId','22','int'),(279,'fileStage','10','int'),(279,'originalFileName','Libro 2.pdf','string'),(279,'sourceSubmissionFileId',NULL,'string'),(279,'submissionFileId','20','int'),(279,'submissionId','8','int'),(279,'username','admin','string'),(280,'fileId','22','int'),(280,'fileStage','10','int'),(280,'name','Libro 2.pdf','string'),(280,'originalFileName','Libro 2.pdf','string'),(280,'sourceSubmissionFileId',NULL,'string'),(280,'submissionFileId','20','int'),(280,'submissionId','8','int'),(280,'username','admin','string'),(281,'fileId','22','int'),(281,'fileStage','10','int'),(281,'originalFileName','Justificar la guerra','string'),(281,'sourceSubmissionFileId',NULL,'string'),(281,'submissionFileId','20','int'),(281,'submissionId','8','int'),(281,'username','admin','string'),(282,'fileId','22','int'),(282,'fileStage','10','int'),(282,'name','Justificar la guerra','string'),(282,'originalFileName','Justificar la guerra','string'),(282,'sourceSubmissionFileId',NULL,'string'),(282,'submissionFileId','20','int'),(282,'submissionId','8','int'),(282,'username','admin','string'),(283,'formatName','Libro digital','string'),(284,'fileId','23','int'),(284,'fileStage','10','int'),(284,'originalFileName','Libro 2.pdf','string'),(284,'sourceSubmissionFileId',NULL,'string'),(284,'submissionFileId','21','int'),(284,'submissionId','9','int'),(284,'username','admin','string'),(285,'fileId','23','int'),(285,'fileStage','10','int'),(285,'name','Libro 2.pdf','string'),(285,'submissionFileId','21','int'),(285,'submissionId','9','int'),(285,'username','admin','string'),(286,'fileStage','10','int'),(286,'sourceSubmissionFileId',NULL,'string'),(286,'submissionFileId','21','int'),(286,'submissionId','9','int'),(286,'username','admin','string'),(287,'fileId','24','int'),(287,'fileStage','10','int'),(287,'originalFileName','Libro 2.pdf','string'),(287,'sourceSubmissionFileId',NULL,'string'),(287,'submissionFileId','22','int'),(287,'submissionId','9','int'),(287,'username','admin','string'),(288,'fileId','24','int'),(288,'fileStage','10','int'),(288,'name','Libro 2.pdf','string'),(288,'submissionFileId','22','int'),(288,'submissionId','9','int'),(288,'username','admin','string'),(289,'fileId','24','int'),(289,'fileStage','10','int'),(289,'originalFileName','Libro 2.pdf','string'),(289,'sourceSubmissionFileId',NULL,'string'),(289,'submissionFileId','22','int'),(289,'submissionId','9','int'),(289,'username','admin','string'),(290,'fileId','24','int'),(290,'fileStage','10','int'),(290,'name','Libro 2.pdf','string'),(290,'originalFileName','Libro 2.pdf','string'),(290,'sourceSubmissionFileId',NULL,'string'),(290,'submissionFileId','22','int'),(290,'submissionId','9','int'),(290,'username','admin','string'),(291,'fileId','24','int'),(291,'fileStage','10','int'),(291,'originalFileName','Justificar la guerra','string'),(291,'sourceSubmissionFileId',NULL,'string'),(291,'submissionFileId','22','int'),(291,'submissionId','9','int'),(291,'username','admin','string'),(292,'fileId','24','int'),(292,'fileStage','10','int'),(292,'name','Justificar la guerra','string'),(292,'originalFileName','Justificar la guerra','string'),(292,'sourceSubmissionFileId',NULL,'string'),(292,'submissionFileId','22','int'),(292,'submissionId','9','int'),(292,'username','admin','string'),(295,'formatName','Capítulo 1. LA TRADICIÓN DE LA GUERRA JUSTA','string'),(296,'formatName','Capítulo 2. GUERRA Y DERECHO SOBERANO','string'),(297,'formatName','Capítulo 3.RACIONALIDAD INTERNA Y EXTERNA DE LA GUERRA','string'),(298,'formatName','Capítulo 4. LOS PRINCIPIOS DE LA GUERRA JUSTA','string'),(299,'fileId','25','int'),(299,'fileStage','10','int'),(299,'originalFileName','Capitulo 1.pdf','string'),(299,'sourceSubmissionFileId',NULL,'string'),(299,'submissionFileId','23','int'),(299,'submissionId','9','int'),(299,'username','admin','string'),(300,'fileId','25','int'),(300,'fileStage','10','int'),(300,'name','Capitulo 1.pdf','string'),(300,'submissionFileId','23','int'),(300,'submissionId','9','int'),(300,'username','admin','string'),(301,'fileId','25','int'),(301,'fileStage','10','int'),(301,'originalFileName','Capitulo 1.pdf','string'),(301,'sourceSubmissionFileId',NULL,'string'),(301,'submissionFileId','23','int'),(301,'submissionId','9','int'),(301,'username','admin','string'),(302,'fileId','25','int'),(302,'fileStage','10','int'),(302,'name','Capitulo 1.pdf','string'),(302,'originalFileName','Capitulo 1.pdf','string'),(302,'sourceSubmissionFileId',NULL,'string'),(302,'submissionFileId','23','int'),(302,'submissionId','9','int'),(302,'username','admin','string'),(303,'fileId','26','int'),(303,'fileStage','10','int'),(303,'originalFileName','Capitulo 2.pdf','string'),(303,'sourceSubmissionFileId',NULL,'string'),(303,'submissionFileId','24','int'),(303,'submissionId','9','int'),(303,'username','admin','string'),(304,'fileId','26','int'),(304,'fileStage','10','int'),(304,'name','Capitulo 2.pdf','string'),(304,'submissionFileId','24','int'),(304,'submissionId','9','int'),(304,'username','admin','string'),(305,'fileId','26','int'),(305,'fileStage','10','int'),(305,'originalFileName','Capitulo 2.pdf','string'),(305,'sourceSubmissionFileId',NULL,'string'),(305,'submissionFileId','24','int'),(305,'submissionId','9','int'),(305,'username','admin','string'),(306,'fileId','26','int'),(306,'fileStage','10','int'),(306,'name','Capitulo 2.pdf','string'),(306,'originalFileName','Capitulo 2.pdf','string'),(306,'sourceSubmissionFileId',NULL,'string'),(306,'submissionFileId','24','int'),(306,'submissionId','9','int'),(306,'username','admin','string'),(307,'fileId','27','int'),(307,'fileStage','10','int'),(307,'originalFileName','Capitulo 3.pdf','string'),(307,'sourceSubmissionFileId',NULL,'string'),(307,'submissionFileId','25','int'),(307,'submissionId','9','int'),(307,'username','admin','string'),(308,'fileId','27','int'),(308,'fileStage','10','int'),(308,'name','Capitulo 3.pdf','string'),(308,'submissionFileId','25','int'),(308,'submissionId','9','int'),(308,'username','admin','string'),(309,'fileId','27','int'),(309,'fileStage','10','int'),(309,'originalFileName','Capitulo 3.pdf','string'),(309,'sourceSubmissionFileId',NULL,'string'),(309,'submissionFileId','25','int'),(309,'submissionId','9','int'),(309,'username','admin','string'),(310,'fileId','27','int'),(310,'fileStage','10','int'),(310,'name','Capitulo 3.pdf','string'),(310,'originalFileName','Capitulo 3.pdf','string'),(310,'sourceSubmissionFileId',NULL,'string'),(310,'submissionFileId','25','int'),(310,'submissionId','9','int'),(310,'username','admin','string'),(311,'fileId','28','int'),(311,'fileStage','10','int'),(311,'originalFileName','Capitulo 4.pdf','string'),(311,'sourceSubmissionFileId',NULL,'string'),(311,'submissionFileId','26','int'),(311,'submissionId','9','int'),(311,'username','admin','string'),(312,'fileId','28','int'),(312,'fileStage','10','int'),(312,'name','Capitulo 4.pdf','string'),(312,'submissionFileId','26','int'),(312,'submissionId','9','int'),(312,'username','admin','string'),(313,'fileId','28','int'),(313,'fileStage','10','int'),(313,'originalFileName','Capitulo 4.pdf','string'),(313,'sourceSubmissionFileId',NULL,'string'),(313,'submissionFileId','26','int'),(313,'submissionId','9','int'),(313,'username','admin','string'),(314,'fileId','28','int'),(314,'fileStage','10','int'),(314,'name','Capitulo 4.pdf','string'),(314,'originalFileName','Capitulo 4.pdf','string'),(314,'sourceSubmissionFileId',NULL,'string'),(314,'submissionFileId','26','int'),(314,'submissionId','9','int'),(314,'username','admin','string'),(315,'publicationFormatName','Libro digital','string'),(316,'fileId','24','int'),(316,'fileStage','10','int'),(316,'originalFileName','Justificar la guerra','string'),(316,'sourceSubmissionFileId',NULL,'string'),(316,'submissionFileId','22','int'),(316,'submissionId','9','int'),(316,'username','admin','string'),(317,'fileId','24','int'),(317,'fileStage','10','int'),(317,'name','Justificar la guerra','string'),(317,'originalFileName','Justificar la guerra','string'),(317,'sourceSubmissionFileId',NULL,'string'),(317,'submissionFileId','22','int'),(317,'submissionId','9','int'),(317,'username','admin','string'),(318,'file','Justificar la guerra','string'),(318,'name','admin admin','string'),(318,'username','admin','string'),(319,'publicationFormatName','Capítulo 1. LA TRADICIÓN DE LA GUERRA JUSTA','string'),(320,'fileId','25','int'),(320,'fileStage','10','int'),(320,'originalFileName','Capitulo 1.pdf','string'),(320,'sourceSubmissionFileId',NULL,'string'),(320,'submissionFileId','23','int'),(320,'submissionId','9','int'),(320,'username','admin','string'),(321,'fileId','25','int'),(321,'fileStage','10','int'),(321,'name','Capitulo 1.pdf','string'),(321,'originalFileName','Capitulo 1.pdf','string'),(321,'sourceSubmissionFileId',NULL,'string'),(321,'submissionFileId','23','int'),(321,'submissionId','9','int'),(321,'username','admin','string'),(322,'file','Capitulo 1.pdf','string'),(322,'name','admin admin','string'),(322,'username','admin','string'),(323,'publicationFormatName','Capítulo 2. GUERRA Y DERECHO SOBERANO','string'),(324,'fileId','26','int'),(324,'fileStage','10','int'),(324,'originalFileName','Capitulo 2.pdf','string'),(324,'sourceSubmissionFileId',NULL,'string'),(324,'submissionFileId','24','int'),(324,'submissionId','9','int'),(324,'username','admin','string'),(325,'fileId','26','int'),(325,'fileStage','10','int'),(325,'name','Capitulo 2.pdf','string'),(325,'originalFileName','Capitulo 2.pdf','string'),(325,'sourceSubmissionFileId',NULL,'string'),(325,'submissionFileId','24','int'),(325,'submissionId','9','int'),(325,'username','admin','string'),(326,'file','Capitulo 2.pdf','string'),(326,'name','admin admin','string'),(326,'username','admin','string'),(327,'publicationFormatName','Capítulo 3.RACIONALIDAD INTERNA Y EXTERNA DE LA GUERRA','string'),(328,'fileId','27','int'),(328,'fileStage','10','int'),(328,'originalFileName','Capitulo 3.pdf','string'),(328,'sourceSubmissionFileId',NULL,'string'),(328,'submissionFileId','25','int'),(328,'submissionId','9','int'),(328,'username','admin','string'),(329,'fileId','27','int'),(329,'fileStage','10','int'),(329,'name','Capitulo 3.pdf','string'),(329,'originalFileName','Capitulo 3.pdf','string'),(329,'sourceSubmissionFileId',NULL,'string'),(329,'submissionFileId','25','int'),(329,'submissionId','9','int'),(329,'username','admin','string'),(330,'file','Capitulo 3.pdf','string'),(330,'name','admin admin','string'),(330,'username','admin','string'),(331,'publicationFormatName','Capítulo 4. LOS PRINCIPIOS DE LA GUERRA JUSTA','string'),(332,'fileId','28','int'),(332,'fileStage','10','int'),(332,'originalFileName','Capitulo 4.pdf','string'),(332,'sourceSubmissionFileId',NULL,'string'),(332,'submissionFileId','26','int'),(332,'submissionId','9','int'),(332,'username','admin','string'),(333,'fileId','28','int'),(333,'fileStage','10','int'),(333,'name','Capitulo 4.pdf','string'),(333,'originalFileName','Capitulo 4.pdf','string'),(333,'sourceSubmissionFileId',NULL,'string'),(333,'submissionFileId','26','int'),(333,'submissionId','9','int'),(333,'username','admin','string'),(334,'file','Capitulo 4.pdf','string'),(334,'name','admin admin','string'),(334,'username','admin','string');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `features` (
  `submission_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  UNIQUE KEY `press_features_pkey` (`assoc_type`,`assoc_id`,`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES (4,512,1,1);
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'presses/1/monographs/1/633dbd39d8c92.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(5,'presses/1/monographs/4/6349d8cc6e86b.pdf','application/pdf'),(6,'presses/1/monographs/4/6349d9fc1ea21.pdf','application/pdf'),(7,'presses/1/monographs/4/6349da0b38b98.pdf','application/pdf'),(8,'presses/1/monographs/4/6349da18f1290.pdf','application/pdf'),(9,'presses/1/monographs/4/6349da2b7e6b2.pdf','application/pdf'),(10,'presses/1/monographs/4/6349da3b4fab6.pdf','application/pdf'),(11,'presses/1/monographs/4/6349da48a4be4.html','text/html'),(16,'presses/1/monographs/7/638683c07ef78.pdf','application/pdf'),(17,'presses/1/monographs/7/638685d476af9.pdf','application/pdf'),(18,'presses/1/monographs/7/638685e87d00d.pdf','application/pdf'),(19,'presses/1/monographs/7/638685f611555.pdf','application/pdf'),(20,'presses/1/monographs/7/638686105aa4c.pdf','application/pdf'),(21,'presses/1/monographs/7/6386861d99801.pdf','application/pdf'),(22,'presses/1/monographs/8/638689c6af43a.pdf','application/pdf'),(24,'presses/1/monographs/9/63868b79397d2.pdf','application/pdf'),(25,'presses/1/monographs/9/63868cdb01a27.pdf','application/pdf'),(26,'presses/1/monographs/9/63868ce9638ab.pdf','application/pdf'),(27,'presses/1/monographs/9/63868cf759116.pdf','application/pdf'),(28,'presses/1/monographs/9/63868d07e657d.pdf','application/pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'publicationFormat=>dc11','plugins.metadata.dc11.publicationFormatAdapter.displayName','plugins.metadata.dc11.publicationFormatAdapter.description','class::classes.publicationFormat.PublicationFormat','metadata::plugins.metadata.dc11.schema.Dc11Schema(PUBLICATION_FORMAT)'),(2,'monograph=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(3,'native-xml=>monograph','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(4,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(5,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Author[]'),(6,'publication-format=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publicationFormat.PublicationFormat','xml::schema(plugins/importexport/native/native.xsd)'),(7,'native-xml=>PublicationFormat','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publicationFormat.PublicationFormat[]'),(8,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(9,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionFile'),(10,'monograph=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission','xml::schema(plugins/importexport/native/ONIX_BookProduct_3.0_reference_notstrict.xsd)'),(11,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication'),(13,'chapter=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Chapter[]','xml::schema(plugins/importexport/native/native.xsd)'),(14,'native-xml=>chapter','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Chapter'),(15,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(16,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(17,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(18,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]'),(19,'monographs=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_settings`
--

LOCK TABLES `filter_settings` WRITE;
/*!40000 ALTER TABLE `filter_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint(20) NOT NULL DEFAULT 0,
  `context_id` bigint(20) NOT NULL DEFAULT 0,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint(6) NOT NULL DEFAULT 0,
  `parent_filter_id` bigint(20) NOT NULL DEFAULT 0,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) PublicationFormat','plugins.metadata.dc11.filter.Dc11SchemaPublicationFormatAdapter',0,0,0),(2,2,0,'Native XML submission export','plugins.importexport.native.filter.MonographNativeXmlFilter',0,0,0),(3,3,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlMonographFilter',0,0,0),(4,4,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(5,5,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(6,6,0,'Native XML representation export','plugins.importexport.native.filter.PublicationFormatNativeXmlFilter',0,0,0),(7,7,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlPublicationFormatFilter',0,0,0),(8,9,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlMonographFileFilter',0,0,0),(9,8,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(10,10,0,'ONIX 3.0 XML monograph export','plugins.importexport.onix30.filter.MonographONIX30XmlFilter',0,0,0),(11,11,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),(12,12,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0),(13,13,0,'Native XML chapter export','plugins.importexport.native.filter.ChapterNativeXmlFilter',0,0,0),(14,14,0,'Native XML Chapter import','plugins.importexport.native.filter.NativeXmlChapterFilter',0,0,0),(15,15,0,'User XML user export','lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter',0,0,0),(16,16,0,'User XML user import','lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter',0,0,0),(17,17,0,'Native XML user group export','lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter',0,0,0),(18,18,0,'Native XML user group import','lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter',0,0,0),(19,19,0,'ONIX 3.0 XML monograph export','plugins.importexport.onix30.filter.MonographONIX30XmlFilter',0,0,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES (1,'en_US','name','Appendix','string'),(1,'es_ES','name','Apéndice','string'),(2,'en_US','name','Bibliography','string'),(2,'es_ES','name','Bibliografía','string'),(3,'en_US','name','Book Manuscript','string'),(3,'es_ES','name','Manuscrito de libro','string'),(4,'en_US','name','Chapter Manuscript','string'),(4,'es_ES','name','Manuscrito de capítulo','string'),(5,'en_US','name','Glossary','string'),(5,'es_ES','name','Glosario','string'),(6,'en_US','name','Index','string'),(6,'es_ES','name','Índice','string'),(7,'en_US','name','Preface','string'),(7,'es_ES','name','Prefacio','string'),(8,'en_US','name','Prospectus','string'),(8,'es_ES','name','Documento de proyecto','string'),(9,'en_US','name','Table','string'),(9,'es_ES','name','Tabla','string'),(10,'en_US','name','Figure','string'),(10,'es_ES','name','Figura','string'),(11,'en_US','name','Photo','string'),(11,'es_ES','name','Foto','string'),(12,'en_US','name','Illustration','string'),(12,'es_ES','name','Ilustración','string'),(13,'en_US','name','Other','string'),(13,'es_ES','name','Otros','string'),(14,'en_US','name','Image','string'),(14,'es_ES','name','Imagen','string'),(15,'en_US','name','HTML Stylesheet','string'),(15,'es_ES','name','Hoja de estilo HTML','string'),(16,'en_US','name','','string'),(16,'es_ES','name','Mapa','string');
/*!40000 ALTER TABLE `genre_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genre_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  `category` bigint(20) NOT NULL DEFAULT 1,
  `dependent` smallint(6) NOT NULL DEFAULT 0,
  `supplementary` smallint(6) NOT NULL DEFAULT 0,
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,1,3,1,1,0,1,'APPENDIX'),(2,1,2,1,1,0,1,'BIBLIOGRAPHY'),(3,1,0,1,1,0,0,'MANUSCRIPT'),(4,1,1,1,1,0,0,'CHAPTER'),(5,1,5,1,1,0,1,'GLOSSARY'),(6,1,6,1,1,0,1,'INDEX'),(7,1,7,1,1,0,1,'PREFACE'),(8,1,8,1,3,0,1,'PROSPECTUS'),(9,1,9,1,2,0,1,'TABLE'),(10,1,10,1,2,0,1,'FIGURE'),(11,1,11,1,2,0,1,'PHOTO'),(12,1,12,1,2,0,1,'ILLUSTRATION'),(13,1,15,1,3,0,1,'OTHER'),(14,1,13,1,2,1,0,'IMAGE'),(15,1,14,1,1,1,0,'STYLE'),(16,1,4,1,2,1,0,'mapa');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identification_codes`
--

DROP TABLE IF EXISTS `identification_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identification_codes` (
  `identification_code_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint(20) NOT NULL,
  `code` varchar(40) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`identification_code_id`),
  KEY `identification_codes_key` (`identification_code_id`,`publication_format_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identification_codes`
--

LOCK TABLES `identification_codes` WRITE;
/*!40000 ALTER TABLE `identification_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `identification_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_views`
--

DROP TABLE IF EXISTS `item_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL,
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_views`
--

LOCK TABLES `item_views` WRITE;
/*!40000 ALTER TABLE `item_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_file_settings`
--

DROP TABLE IF EXISTS `library_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_file_settings`
--

LOCK TABLES `library_file_settings` WRITE;
/*!40000 ALTER TABLE `library_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_files`
--

DROP TABLE IF EXISTS `library_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` smallint(6) DEFAULT 0,
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_files`
--

LOCK TABLES `library_files` WRITE;
/*!40000 ALTER TABLE `library_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markets`
--

DROP TABLE IF EXISTS `markets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markets` (
  `market_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint(20) NOT NULL,
  `countries_included` text DEFAULT NULL,
  `countries_excluded` text DEFAULT NULL,
  `regions_included` text DEFAULT NULL,
  `regions_excluded` text DEFAULT NULL,
  `market_date_role` varchar(40) NOT NULL,
  `market_date_format` varchar(40) NOT NULL,
  `market_date` varchar(255) NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `price_type_code` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `tax_rate_code` varchar(255) DEFAULT NULL,
  `tax_type_code` varchar(255) DEFAULT NULL,
  `agent_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`market_id`),
  KEY `format_markets_pkey` (`market_id`,`publication_format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markets`
--

LOCK TABLES `markets` WRITE;
/*!40000 ALTER TABLE `markets` DISABLE KEYS */;
/*!40000 ALTER TABLE `markets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_description_settings`
--

DROP TABLE IF EXISTS `metadata_description_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_description_settings`
--

LOCK TABLES `metadata_description_settings` WRITE;
/*!40000 ALTER TABLE `metadata_description_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_description_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_descriptions`
--

DROP TABLE IF EXISTS `metadata_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_descriptions`
--

LOCK TABLES `metadata_descriptions` WRITE;
/*!40000 ALTER TABLE `metadata_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_load_id` (`load_id`),
  KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
INSERT INTO `metrics` VALUES ('usage_events_20220928.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20220928','202209',NULL,NULL,NULL,NULL,'omp::counter',3),('usage_events_20220929.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20220929','202209',NULL,NULL,NULL,NULL,'omp::counter',2),('usage_events_20220930.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20220930','202209',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221003.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221003','202210',NULL,NULL,NULL,NULL,'omp::counter',8),('usage_events_20221004.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221004','202210',NULL,NULL,NULL,NULL,'omp::counter',11),('usage_events_20221005.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221005','202210',NULL,NULL,NULL,NULL,'omp::counter',10),('usage_events_20221006.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221006','202210',NULL,NULL,NULL,NULL,'omp::counter',5),('usage_events_20221007.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221007','202210',NULL,NULL,NULL,NULL,'omp::counter',4),('usage_events_20221014.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221014','202210',NULL,NULL,NULL,NULL,'omp::counter',37),('usage_events_20221014.log',1,NULL,NULL,NULL,4,1,515,4,'20221014','202210',2,NULL,NULL,NULL,'omp::counter',3),('usage_events_20221014.log',1,NULL,NULL,NULL,4,2,515,5,'20221014','202210',2,NULL,NULL,NULL,'omp::counter',12),('usage_events_20221014.log',1,NULL,NULL,NULL,4,4,515,7,'20221014','202210',2,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221014.log',1,NULL,NULL,NULL,4,5,515,8,'20221014','202210',2,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221014.log',1,NULL,NULL,NULL,4,7,515,10,'20221014','202210',1,NULL,NULL,NULL,'omp::counter',5),('usage_events_20221014.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221014','202210',NULL,NULL,NULL,NULL,'omp::counter',52),('usage_events_20221017.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221017','202210',NULL,NULL,NULL,NULL,'omp::counter',8),('usage_events_20221017.log',1,NULL,NULL,NULL,4,7,515,10,'20221017','202210',1,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221017.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221017','202210',NULL,NULL,NULL,NULL,'omp::counter',11),('usage_events_20221018.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221018','202210',NULL,NULL,NULL,NULL,'omp::counter',3),('usage_events_20221018.log',1,NULL,NULL,NULL,4,2,515,5,'20221018','202210',2,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221018.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221018','202210',NULL,NULL,NULL,NULL,'omp::counter',6),('usage_events_20221019.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221019','202210',NULL,NULL,NULL,NULL,'omp::counter',9),('usage_events_20221019.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221019','202210',NULL,NULL,NULL,NULL,'omp::counter',5),('usage_events_20221020.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221020','202210',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221026.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221026','202210',NULL,NULL,NULL,NULL,'omp::counter',5),('usage_events_20221026.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221026','202210',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221027.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221027','202210',NULL,NULL,NULL,NULL,'omp::counter',8),('usage_events_20221027.log',1,NULL,NULL,NULL,4,2,515,5,'20221027','202210',2,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221027.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221027','202210',NULL,NULL,NULL,NULL,'omp::counter',3),('usage_events_20221028.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221028','202210',NULL,NULL,NULL,NULL,'omp::counter',12),('usage_events_20221103.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221103','202211',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221103.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221103','202211',NULL,NULL,NULL,NULL,'omp::counter',3),('usage_events_20221104.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221104','202211',NULL,NULL,NULL,NULL,'omp::counter',2),('usage_events_20221104.log',1,NULL,NULL,NULL,4,2,515,5,'20221104','202211',2,NULL,NULL,NULL,'omp::counter',3),('usage_events_20221104.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221104','202211',NULL,NULL,NULL,NULL,'omp::counter',7),('usage_events_20221109.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221109','202211',NULL,NULL,NULL,NULL,'omp::counter',3),('usage_events_20221110.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221110','202211',NULL,NULL,NULL,NULL,'omp::counter',2),('usage_events_20221112.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221112','202211',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221113.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221113','202211',NULL,NULL,NULL,NULL,'omp::counter',154),('usage_events_20221113.log',1,NULL,NULL,NULL,4,2,515,5,'20221113','202211',2,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221113.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221113','202211',NULL,NULL,NULL,NULL,'omp::counter',17),('usage_events_20221113.log',1,NULL,NULL,NULL,5,NULL,1048585,5,'20221113','202211',NULL,NULL,NULL,NULL,'omp::counter',2),('usage_events_20221114.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221114','202211',NULL,NULL,NULL,NULL,'omp::counter',17),('usage_events_20221114.log',1,NULL,NULL,NULL,4,2,515,5,'20221114','202211',2,NULL,NULL,NULL,'omp::counter',6),('usage_events_20221114.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221114','202211',NULL,NULL,NULL,NULL,'omp::counter',189),('usage_events_20221115.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221115','202211',NULL,NULL,NULL,NULL,'omp::counter',65),('usage_events_20221115.log',1,NULL,NULL,NULL,4,2,515,5,'20221115','202211',2,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221115.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221115','202211',NULL,NULL,NULL,NULL,'omp::counter',39),('usage_events_20221116.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221116','202211',NULL,NULL,NULL,NULL,'omp::counter',33),('usage_events_20221116.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221116','202211',NULL,NULL,NULL,NULL,'omp::counter',21),('usage_events_20221117.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221117','202211',NULL,NULL,NULL,NULL,'omp::counter',44),('usage_events_20221117.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221117','202211',NULL,NULL,NULL,NULL,'omp::counter',8),('usage_events_20221117.log',1,NULL,NULL,NULL,5,NULL,1048585,5,'20221117','202211',NULL,NULL,NULL,NULL,'omp::counter',5),('usage_events_20221118.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221118','202211',NULL,NULL,NULL,NULL,'omp::counter',3),('usage_events_20221121.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221121','202211',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221123.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221123','202211',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221124.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221124','202211',NULL,NULL,NULL,NULL,'omp::counter',4),('usage_events_20221124.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221124','202211',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221125.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221125','202211',NULL,NULL,NULL,NULL,'omp::counter',41),('usage_events_20221127.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221127','202211',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221128.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221128','202211',NULL,NULL,NULL,NULL,'omp::counter',69),('usage_events_20221128.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221128','202211',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221129.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221129','202211',NULL,NULL,NULL,NULL,'omp::counter',7),('usage_events_20221129.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221129','202211',NULL,NULL,NULL,NULL,'omp::counter',4),('usage_events_20221129.log',1,NULL,NULL,NULL,7,NULL,1048585,7,'20221129','202211',NULL,NULL,NULL,NULL,'omp::counter',14),('usage_events_20221129.log',1,NULL,NULL,NULL,9,NULL,1048585,9,'20221129','202211',NULL,NULL,NULL,NULL,'omp::counter',5),('usage_events_20221130.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221130','202211',NULL,NULL,NULL,NULL,'omp::counter',3),('usage_events_20221130.log',1,NULL,NULL,NULL,7,NULL,1048585,7,'20221130','202211',NULL,NULL,NULL,NULL,'omp::counter',3),('usage_events_20221130.log',1,NULL,NULL,NULL,9,NULL,1048585,9,'20221130','202211',NULL,NULL,NULL,NULL,'omp::counter',5),('usage_events_20221201.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221201','202212',NULL,NULL,NULL,NULL,'omp::counter',2),('usage_events_20221201.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221201','202212',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221207.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221207','202212',NULL,NULL,NULL,NULL,'omp::counter',5),('usage_events_20221207.log',1,NULL,NULL,NULL,7,NULL,1048585,7,'20221207','202212',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221207.log',1,NULL,NULL,NULL,9,NULL,1048585,9,'20221207','202212',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221208.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221208','202212',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221209.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221209','202212',NULL,NULL,NULL,NULL,'omp::counter',4),('usage_events_20221210.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221210','202212',NULL,NULL,NULL,NULL,'omp::counter',9),('usage_events_20221210.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221210','202212',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221210.log',1,NULL,NULL,NULL,7,NULL,1048585,7,'20221210','202212',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221210.log',1,NULL,NULL,NULL,9,NULL,1048585,9,'20221210','202212',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221211.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221211','202212',NULL,NULL,NULL,NULL,'omp::counter',2),('usage_events_20221213.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221213','202212',NULL,NULL,NULL,NULL,'omp::counter',7),('usage_events_20221213.log',1,NULL,NULL,NULL,7,NULL,1048585,7,'20221213','202212',NULL,NULL,NULL,NULL,'omp::counter',2),('usage_events_20221214.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221214','202212',NULL,NULL,NULL,NULL,'omp::counter',7),('usage_events_20221214.log',1,NULL,NULL,NULL,4,2,515,5,'20221214','202212',2,NULL,NULL,NULL,'omp::counter',2),('usage_events_20221214.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221214','202212',NULL,NULL,NULL,NULL,'omp::counter',5),('usage_events_20221214.log',1,NULL,NULL,NULL,7,NULL,1048585,7,'20221214','202212',NULL,NULL,NULL,NULL,'omp::counter',3),('usage_events_20221214.log',1,NULL,NULL,NULL,9,NULL,1048585,9,'20221214','202212',NULL,NULL,NULL,NULL,'omp::counter',2),('usage_events_20221215.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221215','202212',NULL,NULL,NULL,NULL,'omp::counter',53),('usage_events_20221215.log',1,NULL,NULL,NULL,4,2,515,5,'20221215','202212',2,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221215.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221215','202212',NULL,NULL,NULL,NULL,'omp::counter',8),('usage_events_20221215.log',1,NULL,NULL,NULL,9,NULL,1048585,9,'20221215','202212',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221216.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221216','202212',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221220.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221220','202212',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221221.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221221','202212',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221221.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20221221','202212',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20221227.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221227','202212',NULL,NULL,NULL,NULL,'omp::counter',5),('usage_events_20221228.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20221228','202212',NULL,NULL,NULL,NULL,'omp::counter',5),('usage_events_20230103.log',1,NULL,NULL,NULL,7,NULL,1048585,7,'20230103','202301',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20230103.log',1,NULL,NULL,NULL,9,NULL,1048585,9,'20230103','202301',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20230105.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20230105','202301',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20230110.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20230110','202301',NULL,NULL,NULL,NULL,'omp::counter',4),('usage_events_20230110.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20230110','202301',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20230111.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20230111','202301',NULL,NULL,NULL,NULL,'omp::counter',4),('usage_events_20230112.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20230112','202301',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20230113.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20230113','202301',NULL,NULL,NULL,NULL,'omp::counter',2),('usage_events_20230115.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20230115','202301',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20230116.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20230116','202301',NULL,NULL,NULL,NULL,'omp::counter',4),('usage_events_20230116.log',1,NULL,NULL,NULL,7,NULL,1048585,7,'20230116','202301',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20230116.log',1,NULL,NULL,NULL,9,NULL,1048585,9,'20230116','202301',NULL,NULL,NULL,NULL,'omp::counter',6),('usage_events_20230117.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20230117','202301',NULL,NULL,NULL,NULL,'omp::counter',5),('usage_events_20230118.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20230118','202301',NULL,NULL,NULL,NULL,'omp::counter',12),('usage_events_20230118.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20230118','202301',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20230119.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20230119','202301',NULL,NULL,NULL,NULL,'omp::counter',21),('usage_events_20230119.log',1,NULL,NULL,NULL,4,2,515,5,'20230119','202301',2,NULL,NULL,NULL,'omp::counter',1),('usage_events_20230119.log',1,NULL,NULL,NULL,4,NULL,1048585,4,'20230119','202301',NULL,NULL,NULL,NULL,'omp::counter',5),('usage_events_20230119.log',1,NULL,NULL,NULL,7,NULL,1048585,7,'20230119','202301',NULL,NULL,NULL,NULL,'omp::counter',3),('usage_events_20230119.log',1,NULL,NULL,NULL,9,NULL,1048585,9,'20230119','202301',NULL,NULL,NULL,NULL,'omp::counter',1),('usage_events_20230120.log',1,NULL,NULL,NULL,NULL,NULL,512,1,'20230120','202301',NULL,NULL,NULL,NULL,'omp::counter',2);
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignment_settings`
--

LOCK TABLES `navigation_menu_item_assignment_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignment_settings` VALUES (0,'en_US','title','Memory','string'),(0,'es_ES','title','Memoria','string');
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignments`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT 0,
  PRIMARY KEY (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

LOCK TABLES `navigation_menu_item_assignments` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignments` VALUES (1,1,1,0,0),(2,1,2,0,1),(3,1,3,0,2),(4,1,4,3,0),(5,1,5,3,1),(6,1,6,3,2),(7,1,7,3,3),(8,2,8,0,0),(9,2,9,0,1),(10,2,10,0,2),(11,2,11,10,0),(12,2,12,10,1),(13,2,13,10,2),(14,2,14,10,3),(23,3,15,0,0),(24,3,16,0,1),(25,3,17,0,2),(26,3,18,17,3),(27,3,19,17,4),(28,3,20,17,5),(29,3,21,17,6),(30,3,22,17,7),(31,3,8,0,8),(32,3,24,0,9);
/*!40000 ALTER TABLE `navigation_menu_item_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES (1,'','titleLocaleKey','navigation.register','string'),(2,'','titleLocaleKey','navigation.login','string'),(3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,'','titleLocaleKey','navigation.dashboard','string'),(5,'','titleLocaleKey','common.viewProfile','string'),(6,'','titleLocaleKey','navigation.admin','string'),(7,'','titleLocaleKey','user.logOut','string'),(8,'','titleLocaleKey','navigation.register','string'),(9,'','titleLocaleKey','navigation.login','string'),(10,'','titleLocaleKey','{$loggedInUsername}','string'),(11,'','titleLocaleKey','navigation.dashboard','string'),(12,'','titleLocaleKey','common.viewProfile','string'),(13,'','titleLocaleKey','navigation.admin','string'),(14,'','titleLocaleKey','user.logOut','string'),(15,'','titleLocaleKey','navigation.catalog','string'),(16,'','titleLocaleKey','manager.announcements','string'),(17,'','titleLocaleKey','navigation.about','string'),(18,'','titleLocaleKey','about.aboutContext','string'),(19,'','titleLocaleKey','about.submissions','string'),(20,'','titleLocaleKey','about.editorialTeam','string'),(21,'','titleLocaleKey','manager.setup.privacyStatement','string'),(22,'','titleLocaleKey','about.contact','string'),(23,'','titleLocaleKey','common.search','string'),(24,'en_US','content','','string'),(24,'en_US','remoteUrl','','string'),(24,'en_US','title','Memory','string'),(24,'es_ES','content','<div id=\"cleantext\" style=\"text-align: justify;\">EL DEPARTAMENTO DE FILOSOFÍA, parte integrante de la organización académica de la Universidad Autónoma Metropolitana, se encuentra dentro de la División de Ciencias Sociales y Humanidades de la Unidad Iztapalapa. Inició sus actividades en 1974, año de creación de la UAM-I, en oficinas provisionales de un edificio ubicado en Insurgentes Sur No. 2388. Antes de finalizar el año, la administración pasó a las instalaciones de la Unidad Iztapalapa, inaugurada el 30 de septiembre.<span class=\"markedContent\"><span dir=\"ltr\" style=\"left: 550.311px; top: 196.544px; font-size: 21.6667px; font-family: serif; transform: scaleX(1.03821);\" role=\"presentation\"><br><img src=\"https://pubfilosofia.izt.uam.mx/public/site/images/admin/f.jpg\" alt=\"\" width=\"780\" height=\"975\"><br></span></span><span dir=\"ltr\" role=\"presentation\"> La creación del Departamento fue aprobada el 1º de febrero de 1975 en la sesión número 2 del Consejo Académico de la Unidad. La iniciativa fue presentada por el doctor Luis Villoro, entonces Director de la División. De los académicos que empezaron a laborar entre abril y mayo de 1974 para el Departamento, aún están adscritos con nosotros el doctor Jorge Martínez, la doctora Luz Elena Zamudío y las maestras Laura Cázares y Leticia Villaseñor. Entre las primeras funciones del Departamento de Filosofía estuvieron: coordinar proyectos de investigación y docencia, impartir cursos en el tronco general de asignaturas de la División _ entre ellas, redacción, historia y doctrinas políticas y sociales-, programar la licenciatura en Humani- dades y organizar la Maestría en Filosofía de la Ciencia. Años más tarde, siguiendo las disposiciones reglamentarias de la Universidad, los académicos se organizaron en áreas de investigación: Historia, Filosofía de las Ciencias Sociales, Lógica y Filosofía de las Ciencias, Literatura y Lingüística. En cuanto a docencia, los profesores cubrieron las necesidades de la Licenciatura en Humanidades con las áreas de concentración en: Filosofía, Historia, Literatura y Lingüística. Gracias al nivel de posgrado de la planta académica se pudieron ofrecer los programas de Maestría en Historia y en Filosofía de la Ciencia. Actualmente, el Departamento de Filosofía, ubicado en el Edificio F, cuenta con una planta de 110 profesores de tiempo completo, la mayoría de ellos con estudios de posgrado. La actividad de investigación de los profesores se concentra, fundamentalmente, en nueve áreas y trece cuerpos académicos que se ocupan del desarrollo de proyectos por especialidades relacionadas con las disci- plinas, de acuerdo con los planes y programas de estudio aprobados por el Colegio Académico, y también imparten las unidades de enseñanza-aprendizaje del Tronco General de la División y los programas del actual posgrado en Humanidades. Aquellos capacitados para la enseñanza de len- guas extranjeras y adscritos a la Coordinación de Enseñanza de Lenguas Extranjeras (CELEX(, atienden los cursos que se requieren en la Unidad Iztapalapa. El Consejo Editorial del Departamento de Filosofía, desde 1999, se ha encargado de manera con- stante tanto de las publicaciones periódicas como de los textos que producen los profesores del Departamento. Tenemos 4 revistas semestrales: Signos (Históricos, Filosóficos, Literarios y Lingüísticos) y la colección Biblioteca de Signos, que hasta el momento ha publicado 60 volúmenes. Pero también tenemos una serie de libros que se encuentran fuera de la colección. Ahora estamos pensando en crear una nueva colección donde se publiquen ediciones facsimilares. Asimismo, contamos con ocho centros de documentación y cuatro laboratorios</span></div>','string'),(24,'es_ES','remoteUrl','','string'),(24,'es_ES','title','Memoria','string'),(24,'fr_CA','content','','string'),(24,'fr_CA','remoteUrl','','string');
/*!40000 ALTER TABLE `navigation_menu_item_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_items`
--

DROP TABLE IF EXISTS `navigation_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_items`
--

LOCK TABLES `navigation_menu_items` WRITE;
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT INTO `navigation_menu_items` VALUES (1,0,NULL,'NMI_TYPE_USER_REGISTER'),(2,0,NULL,'NMI_TYPE_USER_LOGIN'),(3,0,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,0,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,0,NULL,'NMI_TYPE_USER_PROFILE'),(6,0,NULL,'NMI_TYPE_ADMINISTRATION'),(7,0,NULL,'NMI_TYPE_USER_LOGOUT'),(8,1,NULL,'NMI_TYPE_USER_REGISTER'),(9,1,NULL,'NMI_TYPE_USER_LOGIN'),(10,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(11,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(12,1,NULL,'NMI_TYPE_USER_PROFILE'),(13,1,NULL,'NMI_TYPE_ADMINISTRATION'),(14,1,NULL,'NMI_TYPE_USER_LOGOUT'),(15,1,NULL,'NMI_TYPE_CATALOG'),(16,1,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(17,1,NULL,'NMI_TYPE_ABOUT'),(18,1,NULL,'NMI_TYPE_ABOUT'),(19,1,NULL,'NMI_TYPE_SUBMISSIONS'),(20,1,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(21,1,NULL,'NMI_TYPE_PRIVACY'),(22,1,NULL,'NMI_TYPE_CONTACT'),(23,1,NULL,'NMI_TYPE_SEARCH'),(24,1,'historia','NMI_TYPE_CUSTOM');
/*!40000 ALTER TABLE `navigation_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menus`
--

DROP TABLE IF EXISTS `navigation_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menus`
--

LOCK TABLES `navigation_menus` WRITE;
/*!40000 ALTER TABLE `navigation_menus` DISABLE KEYS */;
INSERT INTO `navigation_menus` VALUES (1,0,'user','User Navigation Menu'),(2,1,'user','User Navigation Menu'),(3,1,'primary','Primary Navigation Menu');
/*!40000 ALTER TABLE `navigation_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_releases`
--

DROP TABLE IF EXISTS `new_releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_releases` (
  `submission_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  UNIQUE KEY `new_releases_pkey` (`assoc_type`,`assoc_id`,`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_releases`
--

LOCK TABLES `new_releases` WRITE;
/*!40000 ALTER TABLE `new_releases` DISABLE KEYS */;
INSERT INTO `new_releases` VALUES (4,512,1),(7,512,1),(9,512,1);
/*!40000 ALTER TABLE `new_releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1048586,1,2,'2022-10-06 11:55:31','2022-10-06 11:57:08','Respecto a libro','<p>Faltan imágenes del libro</p>'),(4,1048586,2,6,'2022-10-06 12:05:48','2022-10-06 12:05:48',NULL,NULL);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_mail_list`
--

DROP TABLE IF EXISTS `notification_mail_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` smallint(6) NOT NULL DEFAULT 0,
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_mail_list`
--

LOCK TABLES `notification_mail_list` WRITE;
/*!40000 ALTER TABLE `notification_mail_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_mail_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
INSERT INTO `notification_settings` VALUES (87,'','contents','Esto es un amable recordatorio para que compruebe la salud de su revista a través del informe editorial.','string'),(88,'','contents','Esto es un amable recordatorio para que compruebe la salud de su revista a través del informe editorial.','string'),(127,'','contents','Esto es un amable recordatorio para que compruebe la salud de su revista a través del informe editorial.','string'),(128,'','contents','Esto es un amable recordatorio para que compruebe la salud de su revista a través del informe editorial.','string'),(157,'','contents','Esto es un amable recordatorio para que compruebe la salud de su revista a través del informe editorial.','string'),(159,'','contents','Esto es un amable recordatorio para que compruebe la salud de su revista a través del informe editorial.','string'),(167,'','contents','Esto es un amable recordatorio para que compruebe la salud de su revista a través del informe editorial.','string'),(168,'','contents','Esto es un amable recordatorio para que compruebe la salud de su revista a través del informe editorial.','string'),(169,'','contents','Esto es un amable recordatorio para que compruebe la salud de su revista a través del informe editorial.','string'),(170,'','contents','Esto es un amable recordatorio para que compruebe la salud de su revista a través del informe editorial.','string');
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_subscription_settings`
--

DROP TABLE IF EXISTS `notification_subscription_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (27,1,2,2,16777217,'2022-10-05 12:30:34',NULL,1048585,1),(28,1,2,2,16777217,'2022-10-05 12:30:34',NULL,1048585,1),(29,1,0,2,16777243,'2022-10-05 12:30:34',NULL,1048585,1),(30,1,0,2,16777245,'2022-10-05 12:30:34',NULL,1048585,1),(35,1,2,2,16777217,'2022-10-06 11:52:22',NULL,1048585,2),(36,1,2,2,16777217,'2022-10-06 11:52:22',NULL,1048585,2),(37,1,0,2,16777243,'2022-10-06 11:52:22',NULL,1048585,2),(38,1,0,2,16777245,'2022-10-06 11:52:22',NULL,1048585,2),(41,1,6,3,16777249,'2022-10-06 11:57:08','2022-10-06 11:59:12',1048586,1),(59,1,0,2,16777246,'2022-10-14 16:56:46','2022-10-14 17:00:10',1048585,4),(87,1,1,3,16777258,'2022-10-26 18:25:19','2022-12-13 14:43:39',0,0),(88,1,2,3,16777258,'2022-10-26 18:25:20',NULL,0,0),(111,1,0,2,16777246,'2022-11-13 17:48:14','2022-11-13 17:49:02',1048585,5),(127,1,1,3,16777258,'2022-11-26 22:29:50','2022-12-13 14:43:39',0,0),(128,1,2,3,16777258,'2022-11-26 22:29:50',NULL,0,0),(144,1,0,2,16777246,'2022-11-29 16:25:59','2022-11-29 16:27:44',1048585,7),(156,1,0,2,16777246,'2022-11-29 16:59:02','2022-11-29 16:59:29',1048585,9),(157,1,1,3,16777258,'2022-12-01 17:20:26','2022-12-13 14:43:39',0,0),(159,1,2,3,16777258,'2022-12-01 17:20:26',NULL,0,0),(167,1,1,3,16777258,'2022-12-31 22:00:01',NULL,0,0),(168,1,2,3,16777258,'2022-12-31 22:00:01',NULL,0,0),(169,1,1,3,16777258,'2023-01-01 22:50:24',NULL,0,0),(170,1,2,3,16777258,'2023-01-01 22:50:25',NULL,0,0);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text DEFAULT NULL,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_resumption_tokens`
--

LOCK TABLES `oai_resumption_tokens` WRITE;
/*!40000 ALTER TABLE `oai_resumption_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_resumption_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.PublishSubmissions\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('bootstrapthreethemeplugin',1,'bootstrapTheme','paper','string'),('bootstrapthreethemeplugin',1,'enabled','1','bool'),('browseblockplugin',1,'browseCategories','1','bool'),('browseblockplugin',1,'browseNewReleases','1','bool'),('browseblockplugin',1,'browseSeries','1','bool'),('browseblockplugin',1,'context','1','int'),('browseblockplugin',1,'enabled','1','bool'),('browseblockplugin',1,'seq','1','int'),('customblockmanagerplugin',1,'enabled','1','bool'),('customheaderplugin',1,'content','','string'),('customheaderplugin',1,'enabled','1','bool'),('customheaderplugin',1,'footerContent','','string'),('customlocaleplugin',1,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#173167','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'typography','notoSans_notoSerif','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'context','1','int'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'context','1','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('doipubidplugin',1,'enabled','1','bool'),('dublincoremetaplugin',1,'enabled','1','bool'),('epubviewerplugin',1,'enabled','1','bool'),('googleanalyticsplugin',1,'enabled','1','bool'),('googleanalyticsplugin',1,'googleAnalyticsSiteId','G-HKTKEN4Q2S','string'),('googlescholarplugin',1,'enabled','1','bool'),('htmlmonographfileplugin',1,'enabled','1','bool'),('informationblockplugin',1,'context','1','int'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'context','1','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'context','1','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('pragmathemeplugin',1,'enabled','1','bool'),('staticpagesplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','633463b872934','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `press_settings`
--

DROP TABLE IF EXISTS `press_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `press_settings` (
  `press_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `press_settings_pkey` (`press_id`,`locale`,`setting_name`),
  KEY `press_settings_press_id` (`press_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press_settings`
--

LOCK TABLES `press_settings` WRITE;
/*!40000 ALTER TABLE `press_settings` DISABLE KEYS */;
INSERT INTO `press_settings` VALUES (1,'','agencies','0',NULL),(1,'','catalogSortOption','datePublished-2',NULL),(1,'','citations','0',NULL),(1,'','coverage','enable',NULL),(1,'','coverThumbnailsMaxHeight','390',NULL),(1,'','coverThumbnailsMaxWidth','280',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','disciplines','request',NULL),(1,'','displayFeaturedBooks','1',NULL),(1,'','displayInSpotlight','1',NULL),(1,'','displayNewReleases','1',NULL),(1,'','emailSignature','<br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>',NULL),(1,'','enablePublisherId','[]',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','languages','enable',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','1',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','paymentPluginName','ManualPayment',NULL),(1,'','restrictReviewerFileAccess','1',NULL),(1,'','reviewerAccessKeysEnabled','1',NULL),(1,'','rights','enable',NULL),(1,'','showEnsuringLink','1',NULL),(1,'','sidebar','[\"WebFeedBlockPlugin\",\"browseblockplugin\",\"languagetoggleblockplugin\",\"informationblockplugin\"]',NULL),(1,'','source','0',NULL),(1,'','subjects','enable',NULL),(1,'','supportedFormLocales','[\"es_ES\",\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"es_ES\",\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"es_ES\",\"en_US\",\"fr_CA\"]',NULL),(1,'','themePluginPath','bootstrap3',NULL),(1,'','type','enable',NULL),(1,'en_US','authorInformation','Interested in submitting to this press? We recommend that you review the <a href=\"http://148.206.53.210/omp_filosofia/index.php/pf/about\">About the Press</a> page for the press\' section policies and <a href=\"http://148.206.53.210/omp_filosofia/index.php/pf/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://148.206.53.210/omp_filosofia/index.php/pf/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://148.206.53.210/omp_filosofia/index.php/index/login\">log in</a> and begin the 5 step process.',NULL),(1,'en_US','dateFormatLong','%B %e, %Y',NULL),(1,'en_US','dateFormatShort','%Y-%m-%d',NULL),(1,'en_US','datetimeFormatLong','%B %e, %Y - %I:%M %p',NULL),(1,'en_US','datetimeFormatShort','%Y-%m-%d %I:%M %p',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'en_US','openAccessPolicy','This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://148.206.53.210/omp_filosofia/index.php/pf/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://148.206.53.210/omp_filosofia/index.php/pf/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another press for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":6,\"content\":\"The submission file is in the Microsoft Word, RTF, or OpenDocument file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":7,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the <a href=\\\"http:\\/\\/148.206.53.210\\/omp_filosofia\\/index.php\\/pf\\/about\\/submissions#authorGuidelines\\\" target=\\\"_blank\\\">Author Guidelines<\\/a>, which is found in About the Press.\"},{\"order\":8,\"content\":\"\"}]',NULL),(1,'en_US','timeFormat','%I:%M %p',NULL),(1,'es_ES','acronym','PDF',NULL),(1,'es_ES','additionalHomeContent','<p>Bienvenidos</p>',NULL),(1,'es_ES','authorInformation','¿Le interesa hacer un envío a esta publicación? Le recomendamos que revise los apartados <a href=\"http://148.206.53.210/omp_filosofia/index.php/pf/about\">Acerca de la publicación</a>, para obtener información sobre las políticas de sección, y <a href=\"http://148.206.53.210/omp_filosofia/index.php/pf/about/submissions#authorGuidelines\">Directrices para autores/as</a>. Los autores/as deben <a href=\"http://148.206.53.210/omp_filosofia/index.php/pf/user/register\">registrarse</a> en la publicación antes realizar un envío o, si ya están registrados, simplemente <a href=\"http://148.206.53.210/omp_filosofia/index.php/index/login\">iniciar sesión</a> y empezar con el proceso de 5 pasos.',NULL),(1,'es_ES','customHeaders','<meta name=\"google-site-verification\" content=\"bQOgDidIsRNuTJICelruMo5AIpVfkaLTaaGbYxCcVTs\" />',NULL),(1,'es_ES','dateFormatLong','5 de octubre de 2022',NULL),(1,'es_ES','dateFormatShort','%d-%m-%Y',NULL),(1,'es_ES','datetimeFormatLong','5 de octubre de 2022 - %I:%M %p',NULL),(1,'es_ES','datetimeFormatShort','%d-%m-%Y %I:%M %p',NULL),(1,'es_ES','description','<p>Somos una editorial académica adscrita al Departamento de Filosfía de la División de Ciencias Sociales y Humanidades de la Universidad Autónoma Metropolitana, Unidad Iztapalapa. </p>\n<p>Publicamos los resultados de investigación de los docentes del Departamento en cuatro áreas específicas</p>',NULL),(1,'es_ES','homepageImage','{\"name\":\"log-filo.png\",\"uploadName\":\"homepageImage_es_ES.png\",\"width\":750,\"height\":750,\"dateUploaded\":\"2022-12-15 12:29:12\",\"altText\":\"\"}',NULL),(1,'es_ES','internalReviewGuidelines','<p>El autor sabe que la dictaminación es doble ciego.</p>',NULL),(1,'es_ES','librarianInformation','Animamos a los bibliotecarios/as a listar esta publicación en sus fondos de publicaciones electrónicas. Además, este sistema de publicación de código abierto es apropiado para que las bibliotecas lo ofrezcan a sus miembros  involucrados en la edición de publicaciones (ver <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'es_ES','name','Libros del Departamento de Filosofía',NULL),(1,'es_ES','openAccessPolicy','Esta editorial proporciona acceso abierto inmediato a su contenido bajo el principio de que hacer disponible la investigación, abiertamente al público, fomenta un mayor intercambio de conocimiento global.',NULL),(1,'es_ES','privacyStatement','<p>Los nombres y direcciones de correo electrónico introducidos en esta editorial se utilizarán exclusivamente para los fines declarados por la misma y no estarán disponibles para ningún otro propósito ni lugar.</p>',NULL),(1,'es_ES','readerInformation','Los lectores pueden darse de alta en el servicio de notificación de novedades. Para ello, utiliza el enlace de <a href=\"http://148.206.53.210/omp_filosofia/index.php/pf/user/register\">Crear cuenta</a> en la parte superior de la página. Este registro permitirá al lector recibir por correo electrónico la Tabla de Contenidos de cada novedad. Consulta la <a href=\"http://148.206.53.210/omp_filosofia/index.php/pf/about/submissions#privacyStatement\">Declaración de Privacidad</a> de la editorial que asegura a los lectores que su nombre y dirección de correo electrónico no será utilizada para otros fines.',NULL),(1,'es_ES','submissionChecklist','[{\"order\":1,\"content\":\"La propuesta no ha sido publicada previamente, ni está bajo consideración de ninguna otra editorial (o se proporciona una explicación en \\\"Comentarios para la editorial\\\").\"},{\"order\":6,\"content\":\"El fichero de la propuesta está en formato Microsoft Word.\"},{\"order\":3,\"content\":\"Se proporcionan las direcciones URLs de las referencias si están disponibles.\"},{\"order\":7,\"content\":\"El texto tiene interlineado simple, se utiliza una fuente de 12 puntos, cursiva en lugar de subrayado, y todas las ilustraciones, figuras y tablas están dentro del texto en los lugares apropiados en lugar de al final.\"},{\"order\":5,\"content\":\"El texto se adhiere a los requisitos bibliográficos y de estilo indicados en las <a href=\\\"http:\\/\\/148.206.53.210\\/omp_filosofia\\/index.php\\/pf\\/about\\/submissions#authorGuidelines\\\" target=\\\"_blank\\\">Directrices para autores<\\/a>, que se encuentran en Acerca de la editorial.\"},{\"order\":8,\"content\":\"Todas las figuras cuentan con la fuente de donde fueron tomadas.\"}]',NULL),(1,'es_ES','timeFormat','%I:%M %p',NULL),(1,'fr_CA','authorInformation','Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href=\"https://pubfilosofia.izt.uam.mx/index.php/pf/about\">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href=\"https://pubfilosofia.izt.uam.mx/index.php/pf/about/submissions#authorGuidelines\">Lignes directrices à l\'intention des auteurs-es</a>. Les auteurs-es doivent <a href=\"https://pubfilosofia.izt.uam.mx/index.php/pf/user/register\">s\'inscrire</a> auprès de la presse avant d\'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href=\"https://pubfilosofia.izt.uam.mx/index.php/index/login\">d\'ouvrir une session</a> pour débuter la procédure en 5 étapes.',NULL),(1,'fr_CA','librarianInformation','Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d\'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l\'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'fr_CA','openAccessPolicy','Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l\'échelle mondiale.',NULL),(1,'fr_CA','privacyStatement','<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d\'autres fins ou transmis à une tierce partie.</p>',NULL),(1,'fr_CA','readerInformation','Nous encourageons les lecteurs à s\'abonner au service d\'avis de publication de cette presse. Utilisez le lien <a href=\"https://pubfilosofia.izt.uam.mx/index.php/pf/user/register\">d\'inscription</a> situé en haut de la page d\'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d\'affirmer qu\'elle compte un certain nombre de lecteurs. Consultez <a href=\"https://pubfilosofia.izt.uam.mx/index.php/pf/about/submissions#privacyStatement\">l\'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d\'autres fins.',NULL);
/*!40000 ALTER TABLE `press_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presses`
--

DROP TABLE IF EXISTS `presses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presses` (
  `press_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `primary_locale` varchar(14) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`press_id`),
  UNIQUE KEY `press_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presses`
--

LOCK TABLES `presses` WRITE;
/*!40000 ALTER TABLE `presses` DISABLE KEYS */;
INSERT INTO `presses` VALUES (1,'pf',1.00,'es_ES',1);
/*!40000 ALTER TABLE `presses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_categories`
--

DROP TABLE IF EXISTS `publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_categories` (
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_categories`
--

LOCK TABLES `publication_categories` WRITE;
/*!40000 ALTER TABLE `publication_categories` DISABLE KEYS */;
INSERT INTO `publication_categories` VALUES (5,2);
/*!40000 ALTER TABLE `publication_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_dates`
--

DROP TABLE IF EXISTS `publication_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_dates` (
  `publication_date_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint(20) NOT NULL,
  `role` varchar(40) NOT NULL,
  `date_format` varchar(40) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`publication_date_id`),
  KEY `format_publication_dates_pkey` (`publication_date_id`,`publication_format_id`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_dates`
--

LOCK TABLES `publication_dates` WRITE;
/*!40000 ALTER TABLE `publication_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_format_settings`
--

DROP TABLE IF EXISTS `publication_format_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_format_settings` (
  `publication_format_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `publication_format_settings_pkey` (`publication_format_id`,`locale`,`setting_name`),
  KEY `publication_format_id_key` (`publication_format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_format_settings`
--

LOCK TABLES `publication_format_settings` WRITE;
/*!40000 ALTER TABLE `publication_format_settings` DISABLE KEYS */;
INSERT INTO `publication_format_settings` VALUES (1,'en_US','name','Download','string'),(1,'es_ES','name','Descargar','string'),(2,'en_US','name','','string'),(2,'es_ES','name','Capítulo 1','string'),(3,'en_US','name','','string'),(3,'es_ES','name','Capítulo 2','string'),(4,'en_US','name','','string'),(4,'es_ES','name','Capítulo 3','string'),(5,'en_US','name','','string'),(5,'es_ES','name','Capítulo 4','string'),(6,'en_US','name','','string'),(6,'es_ES','name','Capítulo 5','string'),(7,'en_US','name','Buy on Ediciones del Lirio','string'),(7,'es_ES','name','Comprar en Ediciones del Lirio','string'),(8,'en_US','name','Buy on Casa de Libros Abiertos','string'),(8,'es_ES','name','Comprar en Casa de Libros Abiertos','string'),(9,'en_US','name','','string'),(9,'es_ES','name','PDF','string'),(10,'en_US','name','','string'),(10,'es_ES','name','Libro digital','string'),(10,'fr_CA','name','','string'),(12,'en_US','name','','string'),(12,'es_ES','name','Capítulo 1. LA JUSTICIA Y LA DEMOCRACIA: ¿CUÁL ES LA SITUACIÓN DE LA POLÍTICA EN EL MUNDO GLOBAL?','string'),(12,'fr_CA','name','','string'),(13,'en_US','name','','string'),(13,'es_ES','name','Capítulo 2. ENTRE EL PODER Y LA POLÍTICA: EL INDIVIDUO Y LA LIBERTAD','string'),(13,'fr_CA','name','','string'),(14,'en_US','name','','string'),(14,'es_ES','name','Capítulo 3. HANNAH ARENDT: EL ESPACIO INTERMEDIO DE LA POLÍTICA Y EL PODER DE LA ACCIÓN COMÚN*','string'),(14,'fr_CA','name','','string'),(16,'en_US','name','','string'),(16,'es_ES','name','Capítulo 4. EL PODER: ENFOQUES EN CONTRASTE','string'),(16,'fr_CA','name','','string'),(17,'en_US','name','','string'),(17,'es_ES','name','Capítulo 5. LA LOCURA Y EL PODER: UN FRAGMENTO DEL TRAYECTO DE MICHEL FOUCAULT','string'),(17,'fr_CA','name','','string'),(18,'en_US','name','','string'),(18,'es_ES','name','Libro digital','string'),(18,'fr_CA','name','','string'),(19,'en_US','name','','string'),(19,'es_ES','name','Libro digital','string'),(19,'fr_CA','name','','string'),(20,'en_US','name','','string'),(20,'es_ES','name','Capítulo 1. LA TRADICIÓN DE LA GUERRA JUSTA','string'),(20,'fr_CA','name','','string'),(21,'en_US','name','','string'),(21,'es_ES','name','Capítulo 2. GUERRA Y DERECHO SOBERANO','string'),(21,'fr_CA','name','','string'),(22,'en_US','name','','string'),(22,'es_ES','name','Capítulo 3.RACIONALIDAD INTERNA Y EXTERNA DE LA GUERRA','string'),(22,'fr_CA','name','','string'),(23,'en_US','name','','string'),(23,'es_ES','name','Capítulo 4. LOS PRINCIPIOS DE LA GUERRA JUSTA','string'),(23,'fr_CA','name','','string');
/*!40000 ALTER TABLE `publication_format_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_formats`
--

DROP TABLE IF EXISTS `publication_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_formats` (
  `publication_format_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `physical_format` smallint(6) DEFAULT 1,
  `entry_key` varchar(64) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `file_size` varchar(255) DEFAULT NULL,
  `front_matter` varchar(255) DEFAULT NULL,
  `back_matter` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `height_unit_code` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `width_unit_code` varchar(255) DEFAULT NULL,
  `thickness` varchar(255) DEFAULT NULL,
  `thickness_unit_code` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `weight_unit_code` varchar(255) DEFAULT NULL,
  `product_composition_code` varchar(255) DEFAULT NULL,
  `product_form_detail_code` varchar(255) DEFAULT NULL,
  `country_manufacture_code` varchar(255) DEFAULT NULL,
  `imprint` varchar(255) DEFAULT NULL,
  `product_availability_code` varchar(255) DEFAULT NULL,
  `technical_protection_code` varchar(255) DEFAULT NULL,
  `returnable_indicator_code` varchar(255) DEFAULT NULL,
  `remote_url` varchar(2047) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL,
  `is_approved` smallint(6) NOT NULL DEFAULT 0,
  `is_available` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`publication_format_id`),
  KEY `publication_format_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_formats`
--

LOCK TABLES `publication_formats` WRITE;
/*!40000 ALTER TABLE `publication_formats` DISABLE KEYS */;
INSERT INTO `publication_formats` VALUES (1,4,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(2,4,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,1),(3,4,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(4,4,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(5,4,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(6,4,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(7,4,NULL,0,'BC',0.00,NULL,'13-20','285-294','21','cm','13.5','cm','2','cm','430','gr','30','','MX','Ediciones de Lirio','20',NULL,'Y','https://edicionesdellirio.com.mx/index.php/product/rosario-castellanos-intelectual-mexicana/','',1,1),(8,4,NULL,0,'BC',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://casadelibrosabiertos.uam.mx/gpd-rosario-castellanos.html','',1,1),(9,5,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',0,0),(10,7,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(12,7,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(13,7,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(14,7,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(16,7,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(17,7,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(18,8,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',0,0),(19,9,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(20,9,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(21,9,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(22,9,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0),(23,9,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,0);
/*!40000 ALTER TABLE `publication_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_settings`
--

DROP TABLE IF EXISTS `publication_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_settings` (
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_publication_id` (`publication_id`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'en_US','abstract',''),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title',''),(1,'es_ES','abstract','<p>Sin duda, en ciertas culturas, los adornos y el maquillaje formaban parte de fiestas y rituales, y no tanto de la vida cotidiana, pero, en algunas épocas, el cuerpo y sus adornos fueron reglamentados y condenados, lo que ocasionó que se produjera gran cantidad de escritos, de ahí lo ingente y variado de nuestro corpus, que da cuenta de lo extendido que estaba este tema tanto en las letras medievales, como en las de los Siglos de Oro y de los virreinatos, épocas a las que se ciñe este estudio.</p>'),(1,'es_ES','prefix',''),(1,'es_ES','subtitle','Los afeites en las literaturas medieval, áureas y virreinal'),(1,'es_ES','title','De belleza y misoginia'),(2,'','categoryIds','[]'),(2,'en_US','abstract',''),(2,'en_US','prefix',''),(2,'en_US','subtitle',''),(2,'en_US','title',''),(2,'es_ES','abstract','<p class=\"p1\">La guerra entre México y Estados Unidos fue un acontecimiento que marcó profundas consecuencias en la historia de ambos países. El conflicto creó un hito en el imaginario de los mexicanos, quienes vivieron la debacle nacional, pues creyeron que, conseguida su independencia en 1821 y derrotadas las tropas españolas que ocho años después intentaron reconquistar México, serían capaces de vencer los obstáculos internacionales. Sin embargo, con la derrota frente al vecino del norte, en 1848, estos individuos enfrentaron la pérdida de más de la mitad del territorio, las finanzas públicas destrozadas, poblados enteros saqueados y un ejército desmoralizado. México no volvió a ser el mismo después de la intervención, y, hasta hoy, algunas de sus heridas no han cicatrizado completamente.</p>'),(2,'es_ES','prefix',''),(2,'es_ES','subtitle',''),(2,'es_ES','title','Guerrilla, violencia y xenofobia'),(4,'','categoryIds','[]'),(4,'','copyrightYear','2022'),(4,'en_US','coverImage','{\"dateUploaded\":\"2022-10-14 18:27:39\",\"uploadName\":\"submission_4_4_coverImage_en_US.jpg\",\"altText\":\"Cover\"}'),(4,'es_ES','abstract','<p>Rosario Castellanos, intelectual mexicana es producto de una investigación en la que Claudia Maribel Domínguez Miranda explica por qué, en vida. Rosario Castellanos no fue consagrada como intelectual. A su vez, se pregunta si se ha difundido una imagen oficial de la vida y obra de la escritura chiapaneca. Para dar respuesta a esta interrogante, la investigadora se refiere a etapa clave en la trayectoria intelectual de Castellanos 1) formativa 1950-1958: años en los que, a través de sus primeros ensayos y novelas, la escritora desarrolló un pensamiento transdiciplinario. literario, antropológico y filosófico; 2) madurez política, 1959-1968: tiempo en el que sus cargos como Jefa de Información y Prensa en la Universidad Nacional Autónoma de México y como editorialista en Excélsior contribuyeron a que emitiera una crítica sostenida en contra del autoritarismo de Estado y en defensa de la libertad de expresión, y 3) auge cultural 1969-1975, periodo en el cual consolidó ante sí misma y ante el Estado una imagen de intelectual femenina que la distinguió de la elite cultural mexicana. Importa mencionar que, para revalorar la originalidad del pensamiento de Rosario Castellanos, la autora exhumó documentos del Archivo General de la Nación (AGN),Instituto Nacional Indigenista (INI), Fondo reservado de la Biblioteca Nacional de la UNAM, Fondo de Cultura Económica y la revista Siempre!, fondos que guardan información relevante sobre el perfil literario y político de la autora chiapaneca. Sin lugar a dudas, Domínguez Miranda ofrece información veraz e inédita de la que los lectores pueden seguir distintas líneas de investigación.</p>'),(4,'es_ES','copyrightHolder','Universidad Autónoma Metropolitana Unidad Iztapalapa'),(4,'es_ES','coverage','México'),(4,'es_ES','coverImage','[]'),(4,'es_ES','rights','Acceso abierto'),(4,'es_ES','title','Rosario Castellanos, intelectual mexicana'),(4,'es_ES','type','Texto'),(5,'','categoryIds','[2]'),(5,'','copyrightYear','2022'),(5,'en_US','abstract',''),(5,'en_US','coverage',''),(5,'en_US','prefix',''),(5,'en_US','rights',''),(5,'en_US','subtitle',''),(5,'en_US','title',''),(5,'en_US','type',''),(5,'es_ES','abstract','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tristique augue magna, in porttitor nisl scelerisque sit amet. Praesent non pulvinar odio, sit amet varius leo. Donec commodo augue tortor, ut dignissim nunc iaculis ac. Sed laoreet, tortor non mollis maximus, erat sapien congue turpis, sit amet volutpat nibh urna eget neque. Integer sollicitudin ante tortor, non consectetur tortor tempor quis. Maecenas eget tincidunt nisi. Mauris aliquam, nibh in fermentum tempor, augue lectus vulputate sem, eget sollicitudin nulla mi ut turpis. Aenean aliquam tellus a nunc aliquet, fringilla posuere lorem egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque quis congue metus.</p>\r\n<p>Suspendisse pellentesque sapien ut velit condimentum ullamcorper. Suspendisse non fermentum augue. Donec ut libero ut enim semper dignissim. Sed eu feugiat tortor, vitae malesuada metus. Duis in massa at lorem blandit hendrerit eget sed ipsum. Cras non pharetra quam, sit amet luctus urna. Praesent ut feugiat ante, sed sodales mauris. Pellentesque rhoncus nisl sed tortor pretium pharetra.</p>\r\n<p>Curabitur egestas lorem at metus venenatis vulputate. Mauris vulputate nulla nulla, eget eleifend tellus semper non. Vestibulum quis sapien tincidunt, aliquet dolor vel, fringilla orci. Donec venenatis nisl sed turpis bibendum, a suscipit nisl facilisis. Mauris iaculis sed tellus ut sagittis. Suspendisse dapibus, nulla nec dapibus suscipit, diam lectus ultrices massa, in placerat purus mauris a urna. Nullam ante urna, porta sed metus sed, iaculis feugiat tellus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque vitae turpis arcu. Mauris congue leo id eros dictum, maximus hendrerit sapien mattis. In porta eget velit ut pharetra.</p>\r\n<p>Nulla tristique velit sed porta efficitur. Sed hendrerit leo ut lectus feugiat pellentesque vel eu ipsum. Aliquam congue nunc quis malesuada ultricies. Maecenas varius scelerisque turpis ut molestie. Morbi quis ornare orci. Cras posuere metus vulputate, ornare neque vitae, tincidunt enim. Aliquam suscipit tortor eros, vel venenatis eros porta vitae. Curabitur id urna ut quam porta accumsan quis id nunc. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris porta, ipsum at facilisis condimentum, libero odio maximus mauris, ut porttitor ipsum sapien sed mi. Morbi sit amet quam suscipit, pretium dolor ut, sollicitudin orci. Morbi vel lacus vel eros rhoncus interdum.</p>\r\n<p>Quisque sollicitudin eget nibh vel convallis. Ut at orci neque. Etiam lorem dolor, mattis sed nibh ac, semper convallis lacus. Sed mi ligula, congue eget tortor vel, scelerisque elementum nulla. Praesent eu odio ac arcu maximus interdum. Integer rutrum mattis ipsum ut lobortis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>'),(5,'es_ES','copyrightHolder','Publicaciones Departamento de Filosofía'),(5,'es_ES','coverage','test'),(5,'es_ES','coverImage','{\"dateUploaded\":\"2022-11-13 17:52:26\",\"uploadName\":\"submission_5_5_coverImage_es_ES.jpg\",\"altText\":\"\"}'),(5,'es_ES','prefix',''),(5,'es_ES','rights','Acceso abierto'),(5,'es_ES','subtitle',''),(5,'es_ES','title','Prueba catalogo'),(5,'es_ES','type','texto'),(6,'','categoryIds','[]'),(6,'en_US','abstract',''),(6,'en_US','coverage',''),(6,'en_US','prefix',''),(6,'en_US','rights',''),(6,'en_US','subtitle',''),(6,'en_US','title',''),(6,'en_US','type',''),(6,'es_ES','abstract','<p>La categoría de poder es sin duda imponente. Ella parece arrastrar consigo un caudal de nociones como fuerza, dominación, violencia, presuponiendo con ello alguna forma de sumisión. En sus descripciones más crudas, como poder político, tal categoría no puede sino producir un cierto estremecimiento; ¿quién no lo ha resentido leyendo los excesos del poder en las obras de Maquiavelo, Hobbes, Marx o Schmitt? Es, además, una categoría elusiva. Esto se debe a ciertas razones que pertenecen a la naturaleza del poder mismo: una, que el poder es siempre cambiante en sus efectos, en sus manifestaciones y aun en sus rituales. Incluso una mirada superficial a la historia percibe que las formas de su ejercicio han sufrido transformaciones profundas en torno a las razones que lo sustentan, a los objetivos que se propone, a la entidad que lo ejerce y a quien o quienes lo sufren. Aunque la escena del ejercicio del poder parece siempre la misma, lo cierto es que los papeles de dominador y dominado, y las relaciones entre ambos, están sujetos a variaciones sin límite.</p>'),(6,'es_ES','coverage',''),(6,'es_ES','prefix',''),(6,'es_ES','rights',''),(6,'es_ES','subtitle',''),(6,'es_ES','title','LA CATEGORÍA DEL PODER EN LA FILOSOFÍA POLÍTICA DE NUESTROS DÍAS'),(6,'es_ES','type',''),(6,'fr_CA','abstract',''),(6,'fr_CA','coverage',''),(6,'fr_CA','prefix',''),(6,'fr_CA','rights',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(6,'fr_CA','type',''),(7,'','categoryIds','[]'),(7,'','copyrightYear','2022'),(7,'en_US','coverage',''),(7,'en_US','rights',''),(7,'en_US','type',''),(7,'es_ES','abstract','<p>La categoría de poder, lo mismo que el poder real y sus efectos, no cesan de renovarse. Las transformaciones en las formas de dominación, sumisión, fuerza o equilibrio siguen las formas cambiantes en las que los seres humanos organizan su vida en común. Cada generación requiere escribir su propia historia respecto al poder en el que se devuelve. El presente trabajo busca ofrecer un diagnóstico de nuestra actualidad. Está a cargo de un grupo de filósofos cuya especialidad es la conceptualización de la vida pública y de sus relaciones en torno a la justicia y al poder. Quiere ser, desde luego, una reflexión analítica del presente.</p>'),(7,'es_ES','copyrightHolder','Universidad Autónoma Metropolitana Unidad Iztapalapa'),(7,'es_ES','coverage',''),(7,'es_ES','coverImage','{\"dateUploaded\":\"2022-11-29 17:18:16\",\"uploadName\":\"submission_7_7_coverImage_es_ES.jpg\",\"altText\":\"\"}'),(7,'es_ES','rights',''),(7,'es_ES','title','La categoría del poder en la filosofía política de nuestros días'),(7,'es_ES','type',''),(7,'fr_CA','coverage',''),(7,'fr_CA','rights',''),(7,'fr_CA','type',''),(8,'','categoryIds','[]'),(9,'','categoryIds','[]'),(9,'','copyrightYear','2022'),(9,'en_US','coverage',''),(9,'en_US','rights',''),(9,'en_US','type',''),(9,'es_ES','abstract','<p>La valoración moral respecto de las guerras ha sido una inquietud permanente del ser humano. Satanizadas algunas, mientras otras han sido reivindicadas y hasta bendecidas, no podemos renunciar a manifestarnos respecto de las guerras fratricidas en África, sobre la guerra silenciosa que se libra en Chiapas, o sobre las guerras del pasado reciente y remoto sin dejar de asumir una postura moral al respecto. Más allá de estas consideraciones, el trabajo del filósofo que intenta acercarse al tema de la guerra es complejo. Este libro recupera los principios de la guerra justa perteneciente a la tradición agustiniana y la tradición política de la guerra porque a través de ambas pueden encontrarse las herramientas necesarias que permitan aclarar algunos de estos problemas.</p>\n<p>Teresa Santiago es profesora-investigadora del Departamento de Filosofía de la UAM-Iztapalapa. Ha publicado Alcances y límites de la racionalidad en el conocimiento y la sociedad (2000) y diversos artículos sobre filosofía de la historia y de la guerra.</p>'),(9,'es_ES','copyrightHolder','Universidad Autónoma Metropolitana Unidad Iztapalapa'),(9,'es_ES','coverage',''),(9,'es_ES','coverImage','{\"dateUploaded\":\"2022-11-29 17:17:36\",\"uploadName\":\"submission_9_9_coverImage_es_ES.jpg\",\"altText\":\"\"}'),(9,'es_ES','rights',''),(9,'es_ES','title','Justificar la guerra'),(9,'es_ES','type',''),(9,'fr_CA','coverage',''),(9,'fr_CA','rights',''),(9,'fr_CA','type','');
/*!40000 ALTER TABLE `publication_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications` (
  `publication_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `publication_date_type` varchar(32) DEFAULT 'pub',
  `publication_type` varchar(32) DEFAULT 'publication',
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `series_id` bigint(20) DEFAULT NULL,
  `series_position` varchar(255) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_section_id` (`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,NULL,'2022-10-05 12:29:50',NULL,1,'pub','publication',0.00,NULL,NULL,1,1,NULL,1),(2,NULL,'2022-10-06 11:52:12',NULL,2,'pub','publication',0.00,NULL,NULL,2,1,NULL,1),(3,NULL,'2022-10-07 10:41:17',NULL,NULL,'pub','publication',0.00,NULL,NULL,3,1,NULL,1),(4,'2022-10-14','2022-11-16 11:52:50',NULL,3,'pub','publication',0.00,NULL,NULL,4,3,NULL,1),(5,'2022-11-13','2022-11-17 11:01:41',NULL,4,'pub','publication',0.00,NULL,NULL,5,1,NULL,1),(6,NULL,'2022-11-29 16:02:14',NULL,NULL,'pub','publication',0.00,NULL,NULL,6,1,NULL,1),(7,'2022-11-29','2022-11-29 17:18:21',NULL,NULL,'pub','publication',0.00,NULL,NULL,7,3,NULL,1),(8,NULL,'2022-11-29 16:32:56',NULL,NULL,'pub','publication',0.00,NULL,NULL,8,1,NULL,1),(9,'2022-11-29','2022-11-29 17:17:43',NULL,NULL,'pub','publication',0.00,NULL,NULL,9,3,NULL,1);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `query_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,1048585,2,1,1.00,NULL,NULL,1);
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_participants`
--

DROP TABLE IF EXISTS `query_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
INSERT INTO `query_participants` VALUES (1,2),(1,6);
/*!40000 ALTER TABLE `query_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queued_payments`
--

DROP TABLE IF EXISTS `queued_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text DEFAULT NULL,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queued_payments`
--

LOCK TABLES `queued_payments` WRITE;
/*!40000 ALTER TABLE `queued_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `queued_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representatives`
--

DROP TABLE IF EXISTS `representatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `representatives` (
  `representative_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `role` varchar(40) NOT NULL,
  `representative_id_type` varchar(255) DEFAULT NULL,
  `representative_id_value` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `is_supplier` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`representative_id`),
  KEY `format_representatives_pkey` (`representative_id`,`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representatives`
--

LOCK TABLES `representatives` WRITE;
/*!40000 ALTER TABLE `representatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `representatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text DEFAULT NULL,
  `recommendation` smallint(6) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint(6) NOT NULL DEFAULT 0,
  `declined` smallint(6) NOT NULL DEFAULT 0,
  `cancelled` smallint(6) NOT NULL DEFAULT 0,
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint(6) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `review_method` smallint(6) NOT NULL DEFAULT 1,
  `round` smallint(6) NOT NULL DEFAULT 1,
  `step` smallint(6) NOT NULL DEFAULT 1,
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_files` (
  `review_id` bigint(20) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_element_settings`
--

LOCK TABLES `review_form_element_settings` WRITE;
/*!40000 ALTER TABLE `review_form_element_settings` DISABLE KEYS */;
INSERT INTO `review_form_element_settings` VALUES (1,'en_US','description','','string'),(1,'en_US','possibleResponses','[\"\",\"\"]','object'),(1,'en_US','question','','string'),(1,'es_ES','description','','string'),(1,'es_ES','possibleResponses','[\"Sí\",\"No\"]','object'),(1,'es_ES','question','<p>¿El tema del trabajo es relevante?</p>','string'),(2,'en_US','description','','string'),(2,'en_US','possibleResponses','[\"\",\"\"]','object'),(2,'en_US','question','','string'),(2,'es_ES','description','','string'),(2,'es_ES','possibleResponses','[\"Sí\",\"No\"]','object'),(2,'es_ES','question','<p>¿Las conclusiones están justificadas?</p>','string'),(3,'en_US','description','','string'),(3,'en_US','possibleResponses','[\"\",\"\",\"\",\"\"]','object'),(3,'en_US','question','','string'),(3,'es_ES','description','','string'),(3,'es_ES','possibleResponses','[\"Excelente\",\"Buena\",\"Moderada\",\"Mala\"]','object'),(3,'es_ES','question','<p>¿Cuál es su opinión sobre la claridad del tema?</p>','string');
/*!40000 ALTER TABLE `review_form_element_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_elements`
--

DROP TABLE IF EXISTS `review_form_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` smallint(6) DEFAULT NULL,
  `included` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_elements`
--

LOCK TABLES `review_form_elements` WRITE;
/*!40000 ALTER TABLE `review_form_elements` DISABLE KEYS */;
INSERT INTO `review_form_elements` VALUES (1,1,1.00,5,1,1),(2,1,2.00,5,1,1),(3,1,3.00,5,1,1);
/*!40000 ALTER TABLE `review_form_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_responses`
--

DROP TABLE IF EXISTS `review_form_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text DEFAULT NULL,
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_responses`
--

LOCK TABLES `review_form_responses` WRITE;
/*!40000 ALTER TABLE `review_form_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_settings`
--

DROP TABLE IF EXISTS `review_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_settings`
--

LOCK TABLES `review_form_settings` WRITE;
/*!40000 ALTER TABLE `review_form_settings` DISABLE KEYS */;
INSERT INTO `review_form_settings` VALUES (1,'en_US','description','','string'),(1,'en_US','title','','string'),(1,'es_ES','description','<p>Completen este formulrio para ayudar a los editores a tomar una decisión sobre la publicación del manuscrito.&nbsp;</p>','string'),(1,'es_ES','title','Formulario para revisión interna','string');
/*!40000 ALTER TABLE `review_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_forms`
--

DROP TABLE IF EXISTS `review_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `is_active` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_forms`
--

LOCK TABLES `review_forms` WRITE;
/*!40000 ALTER TABLE `review_forms` DISABLE KEYS */;
INSERT INTO `review_forms` VALUES (1,512,1,1.00,0);
/*!40000 ALTER TABLE `review_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_round_files`
--

DROP TABLE IF EXISTS `review_round_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_round_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_rounds`
--

DROP TABLE IF EXISTS `review_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_rights`
--

DROP TABLE IF EXISTS `sales_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_rights` (
  `sales_rights_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint(20) NOT NULL,
  `type` varchar(40) NOT NULL,
  `row_setting` smallint(6) NOT NULL DEFAULT 0,
  `countries_included` text DEFAULT NULL,
  `countries_excluded` text DEFAULT NULL,
  `regions_included` text DEFAULT NULL,
  `regions_excluded` text DEFAULT NULL,
  PRIMARY KEY (`sales_rights_id`),
  KEY `format_sales_rights_pkey` (`sales_rights_id`,`publication_format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_rights`
--

LOCK TABLES `sales_rights` WRITE;
/*!40000 ALTER TABLE `sales_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_tasks`
--

DROP TABLE IF EXISTS `scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.PublishSubmissions','2023-01-22 15:05:55'),('lib.pkp.classes.task.ReviewReminder','2023-01-22 15:05:55'),('lib.pkp.classes.task.StatisticsReport','2023-01-01 22:50:24'),('plugins.generic.usageStats.UsageStatsLoader','2023-01-22 15:05:55');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `series_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `press_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) DEFAULT 0.00,
  `featured` smallint(6) NOT NULL DEFAULT 0,
  `editor_restricted` smallint(6) NOT NULL DEFAULT 0,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  `is_inactive` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`series_id`),
  UNIQUE KEY `series_path` (`press_id`,`path`),
  KEY `series_press_id` (`press_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_categories`
--

DROP TABLE IF EXISTS `series_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series_categories` (
  `series_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  UNIQUE KEY `series_categories_id` (`series_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_categories`
--

LOCK TABLES `series_categories` WRITE;
/*!40000 ALTER TABLE `series_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `series_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_settings`
--

DROP TABLE IF EXISTS `series_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series_settings` (
  `series_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `series_settings_pkey` (`series_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_settings`
--

LOCK TABLES `series_settings` WRITE;
/*!40000 ALTER TABLE `series_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `series_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT 0,
  `last_used` bigint(20) NOT NULL DEFAULT 0,
  `remember` smallint(6) NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('07splu8tcub74kjimgnl3it4io',NULL,'35.217.74.140','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko; compatible; BW/1.1; bit.ly/3eZNDnO; 0f283008f3) Chrome/84.0.4147.105 Safari/537.36',1674194401,1674194401,0,'','pubfilosofia.izt.uam.mx'),('0ea93tnqk5r7grd4h72co28mfq',NULL,'167.248.133.118','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)',1674374463,1674374463,0,'','pubfilosofia.izt.uam.mx'),('0m8j2r4ckj6k3qru2e5ksikneo',NULL,'185.191.171.43','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674317298,1674317298,0,'','pubfilosofia.izt.uam.mx'),('19nuataqai73o3cfgan0fknod1',NULL,'185.191.171.44','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674334326,1674334326,0,'','pubfilosofia.izt.uam.mx'),('1cdlggb1g4sgd96v6ilh8ag495',NULL,'201.119.104.13','Mozilla/5.0 (Linux; Android 12; motorola edge 20 lite) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36',1674282833,1674282833,0,'','pubfilosofia.izt.uam.mx'),('231ulugj77b2hb8ihlhug12lg0',NULL,'35.217.74.140','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko; compatible; BW/1.1; bit.ly/3eZNDnO; 0f283008f3) Chrome/84.0.4147.105 Safari/537.36',1674194400,1674194400,0,'','pubfilosofia.izt.uam.mx'),('273c2tqiqecn6uaem4fmoql63e',NULL,'157.55.39.72','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674174970,1674174970,0,'','pubfilosofia.izt.uam.mx'),('28at9qedb461csba3kmchf8igi',NULL,'66.249.65.154','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',1674315483,1674315483,0,'csrf|a:2:{s:9:\"timestamp\";i:1674315483;s:5:\"token\";s:32:\"43d68dae1e2bf55f350094a71a28c35c\";}','pubfilosofia.izt.uam.mx'),('2vhb66ptunrpa4smq8kes4npie',NULL,'207.46.13.61','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674270877,1674270877,0,'','pubfilosofia.izt.uam.mx'),('3amtj8tm6383vkstu5fl0fa2i0',NULL,'138.246.3.234','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:109.0) Gecko/20100101 Firefox/109.0',1674073626,1674073627,0,'','pubfilosofia.izt.uam.mx'),('3gs1grpgmolu70q3r1a0i4mamd',NULL,'40.77.167.85','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674041070,1674041070,0,'','pubfilosofia.izt.uam.mx'),('3mh901avo2r483fgcfajiv6ris',NULL,'148.206.53.135','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1674147276,1674152106,0,'csrf|a:2:{s:9:\"timestamp\";i:1674152107;s:5:\"token\";s:32:\"2886f3d3238508e22737ba49e44ee191\";}','pubfilosofia.izt.uam.mx'),('4grk98kuc68f40e9bnib37i9nq',NULL,'207.46.13.59','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674449064,1674449064,0,'','pubfilosofia.izt.uam.mx'),('5jgaieoai72jbmvv9t2nqpkdf5',NULL,'157.55.39.89','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674219100,1674219100,0,'','pubfilosofia.izt.uam.mx'),('5uic3kdvo332do7dd6e1c2ojcq',NULL,'148.206.53.144','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1674155995,1674174363,0,'csrf|a:2:{s:9:\"timestamp\";i:1674174362;s:5:\"token\";s:32:\"4b1c05af0283833cd6ebfcb74f55f258\";}','pubfilosofia.izt.uam.mx'),('5vra2ra2reaulq5emfgj8r52fv',NULL,'185.191.171.4','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674287204,1674287204,0,'csrf|a:2:{s:9:\"timestamp\";i:1674287204;s:5:\"token\";s:32:\"e8b329b8c7375db0dd9778c8d343ece3\";}','pubfilosofia.izt.uam.mx'),('65dnstugh66hh4ghpkiuuutcjj',NULL,'207.46.13.61','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674352784,1674352784,0,'','pubfilosofia.izt.uam.mx'),('668jj9h485dl7ced1f6rcm3l54',NULL,'40.77.167.72','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674009280,1674009280,0,'','pubfilosofia.izt.uam.mx'),('6ct6ek194lc3rsv9snba1d82qi',NULL,'204.187.13.80','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:79.0) Gecko/20100101 Firefox/79.0',1674296734,1674296734,0,'','pubfilosofia.izt.uam.mx'),('6v4gdj4vvqr8sofask1k8t387g',NULL,'148.206.53.144','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1674498563,1674498572,0,'csrf|a:2:{s:9:\"timestamp\";i:1674498573;s:5:\"token\";s:32:\"5f916d23c2c1fbd1f04483ddb3183b73\";}','pubfilosofia.izt.uam.mx'),('76quundivo28kbcr47oce7qgpc',NULL,'207.46.13.61','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674470188,1674470188,0,'','pubfilosofia.izt.uam.mx'),('7dok6ge283b3rsfp9f8m30mjf7',NULL,'185.191.171.37','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674398006,1674398006,0,'','pubfilosofia.izt.uam.mx'),('7tc5870btmlk4elqhu9b2jm54m',NULL,'185.191.171.15','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674280182,1674280182,0,'','pubfilosofia.izt.uam.mx'),('8cfsj8iqtrl293ho9u8hul579p',NULL,'185.191.171.3','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674333174,1674333174,0,'','pubfilosofia.izt.uam.mx'),('8mq1crbmlahnvnasl87aevvun9',NULL,'207.46.13.59','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674450757,1674450757,0,'','pubfilosofia.izt.uam.mx'),('8skbfocr143rlc1e16sivn3ss3',NULL,'207.46.13.101','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1673997747,1673997747,0,'','pubfilosofia.izt.uam.mx'),('8v34vd1vnudij4icpco9f1gr5k',NULL,'167.248.133.118','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)',1674374463,1674374463,0,'','pubfilosofia.izt.uam.mx'),('a299f4g6ubb75hfqps5uc1v4t9',NULL,'40.77.167.72','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674044596,1674044596,0,'','pubfilosofia.izt.uam.mx'),('a6fk359nvh2ck6i3ujdotndh70',NULL,'148.206.53.135','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1674066672,1674088125,0,'csrf|a:2:{s:9:\"timestamp\";i:1674069385;s:5:\"token\";s:32:\"e286ee53b867664e580006b5cf49eed2\";}','pubfilosofia.izt.uam.mx'),('abkv8rer0thlelobjnv07l7g2m',NULL,'207.46.13.59','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674235539,1674235539,0,'','pubfilosofia.izt.uam.mx'),('b4p0m32at175t85ajs6ljdpfhi',NULL,'185.191.171.4','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674382639,1674382639,0,'currentLocale|s:5:\"fr_CA\";','pubfilosofia.izt.uam.mx'),('bs77h72vsmsgahojn724cauvuo',NULL,'157.55.39.72','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)',1673997763,1673997763,0,'','pubfilosofia.izt.uam.mx'),('c3ofk3fe9bai8nho1hjeutjvhv',NULL,'66.249.65.154','Googlebot/2.1 (+http://www.google.com/bot.html)',1674500255,1674500255,0,'','pubfilosofia.izt.uam.mx'),('c6lfkd4lboq9gslmf46v25uf58',NULL,'185.191.171.4','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674311640,1674311640,0,'','pubfilosofia.izt.uam.mx'),('d2ugcao3qq6g0dcd2i58c97vv9',NULL,'148.206.53.224','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1674084312,1674084312,0,'','pubfilosofia.izt.uam.mx'),('d8e68grstebpiekvt6fir9btbd',NULL,'40.77.167.72','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)',1674112275,1674112275,0,'','pubfilosofia.izt.uam.mx'),('di1iehminf4m1ejm7ohtcuscd7',NULL,'185.191.171.41','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674321111,1674321111,0,'','pubfilosofia.izt.uam.mx'),('dsnu70ah32ukjdedu1cb8f8okr',NULL,'148.206.53.224','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1674084312,1674084312,0,'','pubfilosofia.izt.uam.mx'),('e956irtp6664qstq4u8ptsckp2',NULL,'167.248.133.118','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)',1674374462,1674374462,0,'','pubfilosofia.izt.uam.mx'),('eb0qttd7rak905u0ebk54pgk8f',NULL,'185.191.171.43','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674297643,1674297643,0,'','pubfilosofia.izt.uam.mx'),('eb50ej77jcjrh7pvpbc898ravr',NULL,'157.55.39.224','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674029235,1674029235,0,'','pubfilosofia.izt.uam.mx'),('esqjgfn8b7ogslul90v6vjqkkv',NULL,'148.206.32.75','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1674166110,1674166111,0,'','pubfilosofia.izt.uam.mx'),('fsbvv1b9etaom024m9c8uedbkb',NULL,'185.191.171.21','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674340700,1674340700,0,'','pubfilosofia.izt.uam.mx'),('g1ogu5i4thq0m3bbgu367guvne',NULL,'185.191.171.22','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674332813,1674332813,0,'','pubfilosofia.izt.uam.mx'),('h7r2o69vrp2h2bth327q0sgvt2',NULL,'185.191.171.16','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674343366,1674343366,0,'','pubfilosofia.izt.uam.mx'),('h9qhd6d15tfvnndefdb8075hal',NULL,'148.206.32.75','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1674167501,1674167916,0,'','pubfilosofia.izt.uam.mx'),('hcl9bvg7j7smu10sdp8io0nr6n',NULL,'167.248.133.118','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)',1674374463,1674374463,0,'','pubfilosofia.izt.uam.mx'),('iunnpe5ivtagcb5g5rpujeils8',NULL,'185.191.171.16','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674382641,1674382641,0,'','pubfilosofia.izt.uam.mx'),('j8qvooqt2t0mu6rjf68opq99ku',NULL,'148.206.53.224','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1674084310,1674084310,0,'','pubfilosofia.izt.uam.mx'),('jcvotrh3k6j555gl83m6dlneal',NULL,'207.46.13.61','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674455193,1674455194,0,'currentLocale|s:5:\"es_ES\";','pubfilosofia.izt.uam.mx'),('jd73aiufkabo8cv2485iqarc34',NULL,'207.46.13.59','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674470058,1674470058,0,'','pubfilosofia.izt.uam.mx'),('juqe7gtjrt2r7pbrmpsd23iel2',NULL,'185.191.171.33','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674417312,1674417312,0,'','pubfilosofia.izt.uam.mx'),('k1d1srjpirg6vbl4eviabjd2of',NULL,'200.68.183.141','WhatsApp/2.22.24.78 A',1674065972,1674065972,0,'','pubfilosofia.izt.uam.mx'),('k1hkfune9grblk1qaha4qqblcg',NULL,'207.46.13.59','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674506507,1674506508,0,'currentLocale|s:5:\"es_ES\";','pubfilosofia.izt.uam.mx'),('kpn6af8tq36galuhnp4bbglar5',NULL,'185.191.171.26','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674388009,1674388009,0,'csrf|a:2:{s:9:\"timestamp\";i:1674388009;s:5:\"token\";s:32:\"eb7d5dc2f9d3338d46e30caa2156c7e4\";}','pubfilosofia.izt.uam.mx'),('ku4dpgutmghp8smpkq6sop71l2',NULL,'185.191.171.36','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674421555,1674421555,0,'','pubfilosofia.izt.uam.mx'),('l1hj4liedrd3lcffh362s40qqj',NULL,'185.191.171.14','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674381763,1674381763,0,'','pubfilosofia.izt.uam.mx'),('leellln6i88sill136lfcd87bq',NULL,'185.191.171.10','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674280757,1674280757,0,'','pubfilosofia.izt.uam.mx'),('mfidavl1frpjjsaj42gj6nljh2',NULL,'40.77.167.72','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)',1674078551,1674078551,0,'','pubfilosofia.izt.uam.mx'),('mhc7olp633st4h24bhdtaisive',NULL,'148.206.53.144','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1674233554,1674259387,0,'csrf|a:2:{s:9:\"timestamp\";i:1674259387;s:5:\"token\";s:32:\"5307fece452a711716182afc45eba18d\";}','pubfilosofia.izt.uam.mx'),('mjs89rm8uns8pprn2f233s7jue',NULL,'207.46.13.61','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674319130,1674319130,0,'','pubfilosofia.izt.uam.mx'),('nlp44df7od7he72kvsssviqrv4',NULL,'204.187.13.80','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:79.0) Gecko/20100101 Firefox/79.0',1674312111,1674312111,0,'','pubfilosofia.izt.uam.mx'),('og83vvpbn5m5d1g7ais0tteobq',NULL,'207.46.13.61','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674434679,1674434679,0,'','pubfilosofia.izt.uam.mx'),('oq7kfs787i4v041vsdi6sru22r',NULL,'200.68.183.171','Mozilla/5.0 (Linux; Android 12; motorola edge 20 lite) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36',1674088661,1674088675,0,'','pubfilosofia.izt.uam.mx'),('os00ttum13te39rldrdbakfgq4',NULL,'148.206.53.224','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1674084310,1674084310,0,'','pubfilosofia.izt.uam.mx'),('ot7v9998odtq7kpaifjrdthn2c',NULL,'40.77.167.85','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)',1674138187,1674138187,0,'','pubfilosofia.izt.uam.mx'),('paiu4b351r3qshel8hao340iv8',NULL,'185.191.171.22','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674318826,1674318826,0,'','pubfilosofia.izt.uam.mx'),('pbj93qqea74t3oo5du9a2entdc',NULL,'185.191.171.2','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674417521,1674417521,0,'currentLocale|s:5:\"en_US\";','pubfilosofia.izt.uam.mx'),('r6e9h2plf096ukh5udnnkud67q',NULL,'148.206.53.224','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1674001049,1674084312,0,'','pubfilosofia.izt.uam.mx'),('r6mg50gn36o3i4g17p9u8157m6',NULL,'189.195.157.166','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1674154544,1674154544,0,'','pubfilosofia.izt.uam.mx'),('rh7n3714ua9arcvc3a64pph1fr',NULL,'157.55.39.89','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674455214,1674455214,0,'','pubfilosofia.izt.uam.mx'),('spuhil83cp8ur7rnp0ch2474ah',NULL,'185.191.171.39','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674332748,1674332748,0,'','pubfilosofia.izt.uam.mx'),('tccb39b3m6v3tpcssv50bdfuo0',NULL,'40.77.167.72','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674155105,1674155105,0,'','pubfilosofia.izt.uam.mx'),('td47ru5fm0a3pn2j58hc5i2ak5',NULL,'185.191.171.10','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674364181,1674364181,0,'','pubfilosofia.izt.uam.mx'),('to3m6509k35tcuhaegnih3pb5j',NULL,'40.77.167.46','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)',1674219082,1674219082,0,'csrf|a:2:{s:9:\"timestamp\";i:1674219083;s:5:\"token\";s:32:\"e5ef66401880c907d7d261b11a71cf27\";}','pubfilosofia.izt.uam.mx'),('tscb18l8sfve33fg26qfvavab5',NULL,'157.55.39.72','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674174990,1674174990,0,'','pubfilosofia.izt.uam.mx'),('ub5vqvkiu9jmoonh0h44pkag7u',NULL,'204.187.13.80','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:79.0) Gecko/20100101 Firefox/79.0',1674312111,1674312111,0,'','pubfilosofia.izt.uam.mx'),('udh2qsm0env9789qsj8t36qnhd',NULL,'40.77.167.72','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36',1674188859,1674188859,0,'','pubfilosofia.izt.uam.mx'),('uh9aap5lin0cca0t9r0lna40rj',NULL,'185.191.171.11','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)',1674386920,1674386920,0,'currentLocale|s:5:\"es_ES\";','pubfilosofia.izt.uam.mx'),('vbb2o2nums5v5peff5tb1p7dml',NULL,'148.206.40.140','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1674150418,1674150418,0,'','pubfilosofia.izt.uam.mx');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint(6) NOT NULL DEFAULT 6,
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en_US' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (0,'es_ES',6,'[\"en_US\",\"es_ES\",\"fr_CA\"]','[\"en_US\",\"es_ES\",\"fr_CA\"]',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES ('contactEmail','es_ES','uamidigital@xanum.uam.mx'),('contactName','en_US','Open Monograph Press'),('contactName','es_ES','Open Monograph Press'),('themePluginPath','','default');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotlight_settings`
--

DROP TABLE IF EXISTS `spotlight_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spotlight_settings` (
  `spotlight_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `spotlight_settings_pkey` (`spotlight_id`,`locale`,`setting_name`),
  KEY `spotlight_settings_id` (`spotlight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotlight_settings`
--

LOCK TABLES `spotlight_settings` WRITE;
/*!40000 ALTER TABLE `spotlight_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `spotlight_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotlights`
--

DROP TABLE IF EXISTS `spotlights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spotlights` (
  `spotlight_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` smallint(6) NOT NULL,
  `press_id` bigint(20) NOT NULL,
  PRIMARY KEY (`spotlight_id`),
  KEY `spotlights_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotlights`
--

LOCK TABLES `spotlights` WRITE;
/*!40000 ALTER TABLE `spotlights` DISABLE KEYS */;
/*!40000 ALTER TABLE `spotlights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_assignments`
--

DROP TABLE IF EXISTS `stage_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint(6) NOT NULL DEFAULT 0,
  `can_change_metadata` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,13,2,'2022-10-05 12:21:28',0,0),(2,1,3,2,'2022-10-05 12:30:34',0,1),(3,1,8,2,'2022-10-05 12:30:34',0,0),(4,2,13,6,'2022-10-06 11:47:41',0,0),(5,2,3,2,'2022-10-06 11:52:22',0,1),(6,2,8,2,'2022-10-06 11:52:22',0,0),(7,3,2,1,'2022-10-07 10:41:17',0,1),(8,4,2,1,'2022-10-14 16:32:37',0,1),(9,5,2,1,'2022-11-13 17:34:33',0,1),(10,6,2,1,'2022-11-29 15:56:14',0,1),(11,7,2,1,'2022-11-29 16:04:38',0,1),(12,8,2,1,'2022-11-29 16:32:56',0,1),(13,9,2,1,'2022-11-29 16:40:12',0,1);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page_settings`
--

LOCK TABLES `static_page_settings` WRITE;
/*!40000 ALTER TABLE `static_page_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_page_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_pages`
--

LOCK TABLES `static_pages` WRITE;
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subeditor_submission_group`
--

DROP TABLE IF EXISTS `subeditor_submission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subeditor_submission_group` (
  `context_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`assoc_type`,`user_id`),
  KEY `section_editors_context_id` (`context_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  KEY `subeditor_submission_group_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,2,525,2);
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapter_authors`
--

DROP TABLE IF EXISTS `submission_chapter_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_chapter_authors` (
  `author_id` bigint(20) NOT NULL,
  `chapter_id` bigint(20) NOT NULL,
  `primary_contact` smallint(6) NOT NULL DEFAULT 0,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  UNIQUE KEY `chapter_authors_pkey` (`author_id`,`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_authors`
--

LOCK TABLES `submission_chapter_authors` WRITE;
/*!40000 ALTER TABLE `submission_chapter_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_chapter_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapter_settings`
--

DROP TABLE IF EXISTS `submission_chapter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_chapter_settings` (
  `chapter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `submission_chapter_settings_pkey` (`chapter_id`,`locale`,`setting_name`),
  KEY `submission_chapter_settings_chapter_id` (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_settings`
--

LOCK TABLES `submission_chapter_settings` WRITE;
/*!40000 ALTER TABLE `submission_chapter_settings` DISABLE KEYS */;
INSERT INTO `submission_chapter_settings` VALUES (1,'','datacite-export::status','notDeposited','string'),(1,'','pages','','string'),(1,'en_US','abstract','','string'),(1,'en_US','subtitle','','string'),(1,'en_US','title','','string'),(1,'es_ES','abstract','','string'),(1,'es_ES','subtitle','','string'),(1,'es_ES','title','Capítulo 1. Intelectual-escritora: Rosario Castellanos entre el reconocimiento y el ninguneo.','string'),(2,'','datacite-export::status','notDeposited','string'),(2,'','pages','','string'),(2,'en_US','abstract','','string'),(2,'en_US','subtitle','','string'),(2,'en_US','title','','string'),(2,'es_ES','abstract','','string'),(2,'es_ES','subtitle','','string'),(2,'es_ES','title','Capítulo 2. Del proceso de concepción literaria al de incorporación de una escritora a su campo intelectual.','string'),(3,'','datacite-export::status','notDeposited','string'),(3,'','pages','','string'),(3,'en_US','abstract','','string'),(3,'en_US','subtitle','','string'),(3,'en_US','title','','string'),(3,'es_ES','abstract','','string'),(3,'es_ES','subtitle','','string'),(3,'es_ES','title','Capítulo 3. El papel intelectual de Rosario Castellanos: recepción del campo de poder en la década de 1960 y “apogeo” en el campo intelectual.','string'),(4,'','datacite-export::status','notDeposited','string'),(4,'','pages','','string'),(4,'en_US','abstract','','string'),(4,'en_US','subtitle','','string'),(4,'en_US','title','','string'),(4,'es_ES','abstract','','string'),(4,'es_ES','subtitle','','string'),(4,'es_ES','title','Capítulo 4. Una forma femenina de ser intelectual: Rosario Castellanos (enero, 1969-marzo, 1971).','string'),(5,'','datacite-export::status','notDeposited','string'),(5,'','pages','','string'),(5,'en_US','abstract','','string'),(5,'en_US','subtitle','','string'),(5,'en_US','title','','string'),(5,'es_ES','abstract','','string'),(5,'es_ES','subtitle','','string'),(5,'es_ES','title','Capítulo 5. Rosario Castellanos desde Israel: una conciliación entre el periodismo, la diplomacia y la “vida doméstica”.','string'),(7,'','pages','','string'),(7,'en_US','abstract','','string'),(7,'en_US','subtitle','','string'),(7,'en_US','title','','string'),(7,'es_ES','abstract','','string'),(7,'es_ES','subtitle','','string'),(7,'es_ES','title','Capítulo 1. LA JUSTICIA Y LA DEMOCRACIA: ¿CUÁL ES LA SITUACIÓN DE LA POLÍTICA EN EL MUNDO GLOBAL?','string'),(7,'fr_CA','abstract','','string'),(7,'fr_CA','subtitle','','string'),(7,'fr_CA','title','','string'),(8,'','pages','','string'),(8,'en_US','abstract','','string'),(8,'en_US','subtitle','','string'),(8,'en_US','title','','string'),(8,'es_ES','abstract','','string'),(8,'es_ES','subtitle','','string'),(8,'es_ES','title','Capítulo 2. ENTRE EL PODER Y LA POLÍTICA: EL INDIVIDUO Y LA LIBERTAD','string'),(8,'fr_CA','abstract','','string'),(8,'fr_CA','subtitle','','string'),(8,'fr_CA','title','','string'),(9,'','pages','','string'),(9,'en_US','abstract','','string'),(9,'en_US','subtitle','','string'),(9,'en_US','title','','string'),(9,'es_ES','abstract','','string'),(9,'es_ES','subtitle','','string'),(9,'es_ES','title','Capítulo 3. HANNAH ARENDT: EL ESPACIO INTERMEDIO DE LA POLÍTICA Y EL PODER DE LA ACCIÓN COMÚN','string'),(9,'fr_CA','abstract','','string'),(9,'fr_CA','subtitle','','string'),(9,'fr_CA','title','','string'),(10,'','pages','','string'),(10,'en_US','abstract','','string'),(10,'en_US','subtitle','','string'),(10,'en_US','title','','string'),(10,'es_ES','abstract','','string'),(10,'es_ES','subtitle','','string'),(10,'es_ES','title','Capítulo 4. EL PODER: ENFOQUES EN CONTRASTE','string'),(10,'fr_CA','abstract','','string'),(10,'fr_CA','subtitle','','string'),(10,'fr_CA','title','','string'),(11,'','pages','','string'),(11,'en_US','abstract','','string'),(11,'en_US','subtitle','','string'),(11,'en_US','title','','string'),(11,'es_ES','abstract','','string'),(11,'es_ES','subtitle','','string'),(11,'es_ES','title','Capítulo 5. LA LOCURA Y EL PODER: UN FRAGMENTO DEL TRAYECTO DE MICHEL FOUCAULT','string'),(11,'fr_CA','abstract','','string'),(11,'fr_CA','subtitle','','string'),(11,'fr_CA','title','','string'),(12,'','pages','','string'),(12,'en_US','abstract','','string'),(12,'en_US','subtitle','','string'),(12,'en_US','title','','string'),(12,'es_ES','abstract','','string'),(12,'es_ES','subtitle','','string'),(12,'es_ES','title','Capítulo 1. LA TRADICIÓN DE LA GUERRA JUSTA','string'),(12,'fr_CA','abstract','','string'),(12,'fr_CA','subtitle','','string'),(12,'fr_CA','title','','string'),(13,'','pages','','string'),(13,'en_US','abstract','','string'),(13,'en_US','subtitle','','string'),(13,'en_US','title','','string'),(13,'es_ES','abstract','','string'),(13,'es_ES','subtitle','','string'),(13,'es_ES','title','Capítulo 2. GUERRA Y DERECHO SOBERANO','string'),(13,'fr_CA','abstract','','string'),(13,'fr_CA','subtitle','','string'),(13,'fr_CA','title','','string'),(14,'','pages','','string'),(14,'en_US','abstract','','string'),(14,'en_US','subtitle','','string'),(14,'en_US','title','','string'),(14,'es_ES','abstract','','string'),(14,'es_ES','subtitle','','string'),(14,'es_ES','title','Capítulo 3. RACIONALIDAD INTERNA Y EXTERNA DE LA GUERRA','string'),(14,'fr_CA','abstract','','string'),(14,'fr_CA','subtitle','','string'),(14,'fr_CA','title','','string'),(15,'','pages','','string'),(15,'en_US','abstract','','string'),(15,'en_US','subtitle','','string'),(15,'en_US','title','','string'),(15,'es_ES','abstract','','string'),(15,'es_ES','subtitle','','string'),(15,'es_ES','title','Capítulo 4. LOS PRINCIPIOS DE LA GUERRA JUSTA','string'),(15,'fr_CA','abstract','','string'),(15,'fr_CA','subtitle','','string'),(15,'fr_CA','title','','string');
/*!40000 ALTER TABLE `submission_chapter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapters`
--

DROP TABLE IF EXISTS `submission_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_chapters` (
  `chapter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`chapter_id`),
  KEY `chapters_chapter_id` (`chapter_id`),
  KEY `chapters_publication_id` (`publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapters`
--

LOCK TABLES `submission_chapters` WRITE;
/*!40000 ALTER TABLE `submission_chapters` DISABLE KEYS */;
INSERT INTO `submission_chapters` VALUES (1,NULL,4,1.00),(2,NULL,4,2.00),(3,NULL,4,3.00),(4,NULL,4,4.00),(5,NULL,4,5.00),(7,NULL,7,1.00),(8,NULL,7,2.00),(9,NULL,7,3.00),(10,NULL,7,4.00),(11,NULL,7,5.00),(12,NULL,9,1.00),(13,NULL,9,2.00),(14,NULL,9,3.00),(15,NULL,9,4.00);
/*!40000 ALTER TABLE `submission_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_comments`
--

DROP TABLE IF EXISTS `submission_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_revisions`
--

DROP TABLE IF EXISTS `submission_file_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `submission_file_revisions_submission_file_id_foreign` (`submission_file_id`),
  KEY `submission_file_revisions_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(5,4,5),(6,5,6),(7,6,7),(8,7,8),(9,8,9),(10,9,10),(11,10,11),(16,14,16),(17,15,17),(18,16,18),(19,17,19),(20,18,20),(21,19,21),(22,20,22),(24,22,24),(25,23,25),(26,24,26),(27,25,27),(28,26,28);
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `submission_file_settings_pkey` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,'es_ES','name','De belleza y misoginia-FINAL (Revisado).docx','string'),(4,'en_US','name','','string'),(4,'es_ES','name','Rosario Castellanos-COMPLETO.pdf','string'),(5,'','chapterId','1','string'),(5,'en_US','name','','string'),(5,'es_ES','name','Capitulo 1.pdf','string'),(6,'','chapterId','2','string'),(6,'en_US','name','','string'),(6,'es_ES','name','Capitulo 2.pdf','string'),(7,'','chapterId','3','string'),(7,'en_US','name','','string'),(7,'es_ES','name','Capitulo 3.pdf','string'),(8,'','chapterId','4','string'),(8,'en_US','name','','string'),(8,'es_ES','name','Capitulo 4.pdf','string'),(9,'','chapterId','5','string'),(9,'en_US','name','','string'),(9,'es_ES','name','Capitulo 5.pdf','string'),(10,'','dateCreated','','string'),(10,'','language','','string'),(10,'en_US','creator','','string'),(10,'en_US','description','','string'),(10,'en_US','name','','string'),(10,'en_US','publisher','','string'),(10,'en_US','source','','string'),(10,'en_US','sponsor','','string'),(10,'en_US','subject','','string'),(10,'es_ES','creator','','string'),(10,'es_ES','description','','string'),(10,'es_ES','name','Meta.html','string'),(10,'es_ES','publisher','','string'),(10,'es_ES','source','','string'),(10,'es_ES','sponsor','','string'),(10,'es_ES','subject','','string'),(14,'en_US','name','','string'),(14,'es_ES','name','LA CATEGORÍA DEL PODER EN LA FILOSOFÍA POLÍTICA DE NUESTROS DÍAS','string'),(14,'fr_CA','name','','string'),(15,'','chapterId','7','string'),(15,'en_US','name','','string'),(15,'es_ES','name','Capitulo 1.pdf','string'),(15,'fr_CA','name','','string'),(16,'','chapterId','8','string'),(16,'en_US','name','','string'),(16,'es_ES','name','Capitulo 2.pdf','string'),(16,'fr_CA','name','','string'),(17,'','chapterId','9','string'),(17,'en_US','name','','string'),(17,'es_ES','name','Capitulo 3.pdf','string'),(17,'fr_CA','name','','string'),(18,'','chapterId','10','string'),(18,'en_US','name','','string'),(18,'es_ES','name','Capitulo 4.pdf','string'),(18,'fr_CA','name','','string'),(19,'','chapterId','11','string'),(19,'en_US','name','','string'),(19,'es_ES','name','Capitulo 5.pdf','string'),(19,'fr_CA','name','','string'),(20,'en_US','name','','string'),(20,'es_ES','name','Justificar la guerra','string'),(20,'fr_CA','name','','string'),(22,'en_US','name','','string'),(22,'es_ES','name','Justificar la guerra','string'),(22,'fr_CA','name','','string'),(23,'','chapterId','12','string'),(23,'en_US','name','','string'),(23,'es_ES','name','Capitulo 1.pdf','string'),(23,'fr_CA','name','','string'),(24,'','chapterId','13','string'),(24,'en_US','name','','string'),(24,'es_ES','name','Capitulo 2.pdf','string'),(24,'fr_CA','name','','string'),(25,'','chapterId','14','string'),(25,'en_US','name','','string'),(25,'es_ES','name','Capitulo 3.pdf','string'),(25,'fr_CA','name','','string'),(26,'','chapterId','15','string'),(26,'en_US','name','','string'),(26,'es_ES','name','Capitulo 4.pdf','string'),(26,'fr_CA','name','','string');
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_files` (
  `submission_file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `source_submission_file_id` bigint(20) DEFAULT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,3,2,NULL,NULL,NULL,'2022-10-05 12:22:01','2022-10-05 12:22:10',2,NULL,NULL),(4,4,5,NULL,3,10,'0','openAccess',1,'2022-10-14 16:46:52','2022-10-14 16:53:28',1,521,1),(5,4,6,NULL,4,10,'0','openAccess',1,'2022-10-14 16:51:56','2022-10-14 16:53:39',1,521,2),(6,4,7,NULL,4,10,'0','openAccess',1,'2022-10-14 16:52:11','2022-10-14 16:53:45',1,521,3),(7,4,8,NULL,4,10,'0','openAccess',1,'2022-10-14 16:52:24','2022-10-14 16:53:50',1,521,4),(8,4,9,NULL,4,10,'0','openAccess',1,'2022-10-14 16:52:43','2022-10-14 16:53:57',1,521,5),(9,4,10,NULL,4,10,'0','openAccess',1,'2022-10-14 16:52:59','2022-10-14 16:54:03',1,521,6),(10,4,11,NULL,13,10,'0','openAccess',1,'2022-10-14 16:53:12','2022-10-14 16:54:10',1,521,7),(14,7,16,NULL,3,10,'0','openAccess',1,'2022-11-29 16:12:16','2022-11-29 16:22:52',1,521,10),(15,7,17,NULL,3,10,'0','openAccess',1,'2022-11-29 16:21:08','2022-11-29 16:23:08',1,521,12),(16,7,18,NULL,3,10,'0','openAccess',1,'2022-11-29 16:21:28','2022-11-29 16:23:14',1,521,13),(17,7,19,NULL,3,10,'0','openAccess',1,'2022-11-29 16:21:42','2022-11-29 16:23:20',1,521,14),(18,7,20,NULL,3,10,'0','openAccess',1,'2022-11-29 16:22:08','2022-11-29 16:23:26',1,521,16),(19,7,21,NULL,3,10,'0','openAccess',1,'2022-11-29 16:22:21','2022-11-29 16:23:32',1,521,17),(20,8,22,NULL,3,10,NULL,NULL,NULL,'2022-11-29 16:37:58','2022-11-29 16:38:23',1,521,18),(22,9,24,NULL,3,10,'0','openAccess',1,'2022-11-29 16:45:13','2022-11-29 16:52:06',1,521,19),(23,9,25,NULL,3,10,'0','openAccess',1,'2022-11-29 16:51:07','2022-11-29 16:52:11',1,521,20),(24,9,26,NULL,3,10,'0','openAccess',1,'2022-11-29 16:51:21','2022-11-29 16:52:16',1,521,21),(25,9,27,NULL,3,10,'0','openAccess',1,'2022-11-29 16:51:35','2022-11-29 16:52:21',1,521,22),(26,9,28,NULL,3,10,'0','openAccess',1,'2022-11-29 16:51:51','2022-11-29 16:52:26',1,521,23);
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (277,'1925-1974'),(36,'1950-1958'),(39,'1959-1968'),(42,'1969-1975'),(468,'acarrea'),(265,'accumsan'),(579,'acercarse'),(596,'aclarar'),(438,'actividad'),(536,'actualidad'),(332,'además'),(150,'adipiscing'),(196,'aenean'),(444,'africa'),(112,'agn'),(494,'agradable'),(589,'agustiniana'),(604,'alcances'),(387,'algo'),(310,'alguna'),(556,'algunas'),(597,'algunos'),(152,'aliquam'),(198,'aliquet'),(574,'allá'),(591,'ambas'),(373,'ambos'),(148,'amet'),(549,'analítica'),(61,'años'),(98,'ante'),(72,'antropológico'),(383,'apocalíptica'),(457,'aquello'),(109,'archivo'),(256,'arcu'),(448,'argelinos'),(300,'arrastrar'),(610,'artículos'),(465,'aspecto'),(572,'asumir'),(52,'atónoma'),(40,'auge'),(154,'augue'),(344,'aun'),(366,'aunque'),(80,'autónoma'),(9,'autora'),(281,'autoras'),(90,'autoritarismo'),(497,'bando'),(560,'bendecidas'),(504,'beneficia'),(236,'bibendum'),(118,'biblioteca'),(224,'blandit'),(506,'buen'),(533,'busca'),(525,'cada'),(341,'cambiante'),(523,'cambiantes'),(537,'cargo'),(75,'cargos'),(6,'castellanos'),(142,'catalogo'),(291,'categoría'),(302,'caudal'),(519,'cesan'),(25,'chiapaneca'),(567,'chiapas'),(447,'chinos'),(399,'cientos'),(336,'ciertas'),(320,'cierto'),(417,'civilizaciones'),(1,'claudia'),(33,'clave'),(165,'commodo'),(18,'como'),(581,'complejo'),(50,'compra'),(436,'común'),(308,'con'),(542,'conceptualización'),(214,'condimentum'),(515,'conflictos'),(176,'congue'),(389,'conocido'),(607,'conocimiento'),(17,'consagrada'),(149,'consectetur'),(576,'consideraciones'),(485,'considerados'),(301,'consigo'),(97,'consolidó'),(392,'constante'),(398,'constatable'),(420,'construido'),(479,'contar'),(88,'contra'),(84,'contribuyeron'),(269,'convallis'),(290,'cortés'),(402,'cotidiano'),(226,'cras'),(86,'crítica'),(449,'croatas'),(315,'crudas'),(96,'cual'),(462,'cuando'),(208,'cubilia'),(120,'cultura'),(41,'cultural'),(430,'culturales'),(232,'curabitur'),(209,'curae'),(540,'cuya'),(240,'dapibus'),(27,'dar'),(335,'debe'),(514,'debemos'),(92,'defensa'),(571,'dejar'),(89,'del'),(601,'departamento'),(482,'derechos'),(419,'desaparecido'),(431,'desarrolladas'),(416,'desarrollado'),(68,'desarrolló'),(313,'descripciones'),(393,'desde'),(478,'desprotección'),(531,'devuelve'),(535,'diagnóstico'),(242,'diam'),(295,'días'),(258,'dictum'),(21,'difundido'),(167,'dignissim'),(250,'dis'),(101,'distinguió'),(139,'distintas'),(609,'diversos'),(108,'documentos'),(146,'dolor'),(305,'dominación'),(476,'dominadas'),(370,'dominado'),(369,'dominador'),(3,'domínguez'),(164,'donec'),(296,'duda'),(132,'dudas'),(222,'duis'),(121,'económica'),(82,'editorialista'),(342,'efectos'),(260,'efficitur'),(201,'egestas'),(181,'eget'),(362,'ejerce'),(352,'ejercicio'),(234,'eleifend'),(403,'elemento'),(272,'elementum'),(151,'elit'),(102,'elite'),(298,'ella'),(434,'ellas'),(309,'ello'),(333,'elusiva'),(85,'emitiera'),(592,'encontrarse'),(217,'enim'),(66,'ensayos'),(361,'entidad'),(437,'entonces'),(372,'entre'),(521,'equilibrio'),(174,'erat'),(257,'eros'),(367,'escena'),(528,'escribir'),(24,'escritora'),(59,'escritura'),(441,'espacio'),(541,'especialidad'),(10,'esta'),(91,'estado'),(510,'estados'),(374,'están'),(575,'estas'),(582,'este'),(334,'esto'),(598,'estos'),(321,'estremecimiento'),(60,'etapa'),(32,'etapas'),(270,'etiam'),(83,'excélsior'),(325,'excesos'),(107,'exhumó'),(12,'explica'),(94,'expresión'),(493,'fácil'),(238,'facilisis'),(397,'fácilmente'),(413,'fantasioso'),(204,'faucibus'),(100,'femenina'),(284,'feminismo'),(285,'feminista'),(191,'fermentum'),(219,'feugiat'),(293,'filosofía'),(73,'filosófico'),(577,'filósofo'),(539,'filósofos'),(116,'fondo'),(124,'fondos'),(311,'forma'),(351,'formas'),(35,'formativa'),(495,'forme'),(422,'fortalezas'),(564,'fratricidas'),(199,'fringilla'),(16,'fue'),(304,'fuerza'),(410,'futuro'),(526,'generación'),(110,'general'),(450,'germanos'),(538,'grupo'),(125,'guardan'),(381,'guerra'),(411,'guerras'),(487,'guerrero'),(483,'habían'),(407,'hace'),(353,'han'),(501,'hasta'),(396,'hecho'),(225,'hendrerit'),(440,'hermana'),(427,'héroes'),(593,'herramientas'),(349,'historia'),(329,'hobbes'),(432,'hombres'),(406,'humana'),(471,'humanas'),(554,'humano'),(391,'humanos'),(169,'iaculis'),(23,'imagen'),(297,'imponente'),(103,'importa'),(346,'incluso'),(414,'increíble'),(114,'indigenista'),(135,'inédita'),(77,'información'),(115,'ini'),(500,'innegable'),(552,'inquietud'),(512,'instituciones'),(113,'instituto'),(183,'integer'),(7,'intelectual'),(280,'intelectuales'),(578,'intenta'),(267,'interdum'),(278,'interpretación'),(29,'interrogante'),(57,'investigación'),(30,'investigadora'),(145,'ipsum'),(44,'isbn'),(55,'iztapalapa'),(76,'jefa'),(385,'juan'),(586,'justa'),(544,'justicia'),(380,'justificar'),(266,'lacus'),(171,'laoreet'),(326,'las'),(508,'lecciones'),(136,'lectores'),(192,'lectus'),(163,'leo'),(426,'leyendas'),(324,'leyendo'),(513,'leyes'),(216,'libero'),(93,'libertad'),(566,'libra'),(453,'librado'),(583,'libro'),(271,'ligula'),(377,'límite'),(605,'límites'),(140,'líneas'),(71,'literario'),(286,'literatura'),(274,'lobortis'),(144,'lorem'),(62,'los'),(206,'luctus'),(547,'luego'),(131,'lugar'),(37,'madurez'),(187,'maecenas'),(155,'magna'),(249,'magnis'),(221,'malesuada'),(343,'manifestaciones'),(563,'manifestarnos'),(328,'maquiavelo'),(2,'maribel'),(330,'marx'),(314,'más'),(223,'massa'),(472,'materiales'),(259,'mattis'),(190,'mauris'),(173,'maximus'),(433,'mayoría'),(104,'mencionar'),(461,'mente'),(53,'metropolitana'),(211,'metus'),(8,'mexicana'),(282,'mexicanas'),(446,'mexicas'),(81,'méxico'),(477,'miedo'),(557,'mientras'),(347,'mirada'),(4,'miranda'),(99,'misma'),(340,'mismo'),(425,'mitos'),(262,'molestie'),(172,'mollis'),(455,'momentos'),(252,'montes'),(423,'monumentos'),(551,'moral'),(263,'morbi'),(418,'muchas'),(481,'muchos'),(279,'mujeres'),(421,'murallas'),(255,'mus'),(111,'nación'),(79,'nacional'),(253,'nascetur'),(247,'natoque'),(339,'naturaleza'),(46,'navegador'),(43,'nbsp'),(241,'nec'),(594,'necesarias'),(182,'neque'),(179,'nibh'),(189,'nisi'),(157,'nisl'),(303,'nociones'),(466,'nocivo'),(439,'nos'),(67,'novelas'),(460,'nuestra'),(294,'nuestros'),(195,'nulla'),(245,'nullam'),(507,'número'),(168,'nunc'),(359,'objetivos'),(11,'obra'),(327,'obras'),(502,'obvio'),(161,'odio'),(58,'oficial'),(133,'ofrece'),(534,'ofrecer'),(467,'ominoso'),(205,'orci'),(524,'organizan'),(106,'originalidad'),(264,'ornare'),(47,'otra'),(558,'otras'),(368,'papeles'),(26,'para'),(299,'parece'),(496,'parte'),(489,'participa'),(251,'parturient'),(568,'pasado'),(210,'pellentesque'),(248,'penatibus'),(69,'pensamiento'),(463,'pensamos'),(350,'percibe'),(470,'pérdidas'),(289,'pérez'),(128,'perfil'),(95,'periodo'),(553,'permanente'),(595,'permitan'),(503,'pero'),(400,'personas'),(338,'pertenecen'),(587,'perteneciente'),(227,'pharetra'),(243,'placerat'),(561,'podemos'),(292,'poder'),(442,'polinesios'),(38,'política'),(129,'político'),(13,'por'),(590,'porque'),(246,'porta'),(156,'porttitor'),(573,'postura'),(200,'posuere'),(415,'práctica'),(159,'praesent'),(20,'pregunta'),(78,'prensa'),(386,'presenta'),(405,'presente'),(307,'presuponiendo'),(231,'pretium'),(458,'primero'),(65,'primeros'),(203,'primis'),(585,'principios'),(599,'problemas'),(319,'producir'),(56,'producto'),(600,'profesora-investigadora'),(356,'profundas'),(529,'propia'),(360,'propone'),(409,'proyección'),(141,'prueba'),(543,'pública'),(603,'publicado'),(452,'pueblos'),(317,'puede'),(137,'pueden'),(160,'pulvinar'),(244,'purus'),(228,'quam'),(14,'qué'),(363,'quien'),(364,'quienes'),(545,'quiere'),(186,'quis'),(268,'quisque'),(456,'quizás'),(606,'racionalidad'),(337,'razones'),(518,'real'),(569,'reciente'),(509,'recuerdan'),(584,'recupera'),(49,'redireccionando'),(45,'redirigir'),(31,'refiere'),(548,'reflexión'),(559,'reivindicadas'),(371,'relaciones'),(126,'relevante'),(570,'remoto'),(395,'remotos'),(520,'renovarse'),(562,'renunciar'),(527,'requiere'),(323,'resentido'),(117,'reservado'),(530,'respecto'),(28,'respuesta'),(287,'retórica'),(105,'revalorar'),(435,'revela'),(382,'revelación'),(122,'revista'),(230,'rhoncus'),(254,'ridiculus'),(345,'rituales'),(5,'rosario'),(273,'rutrum'),(239,'sagittis'),(384,'san'),(517,'sanguinarios'),(379,'santiago'),(175,'sapien'),(555,'satanizadas'),(158,'scelerisque'),(331,'schmitt'),(464,'sea'),(170,'sed'),(138,'seguir'),(194,'sem'),(218,'semper'),(546,'ser'),(390,'seres'),(288,'sergio'),(484,'sido'),(123,'siempre'),(428,'siendo'),(283,'siglo'),(522,'siguen'),(565,'silenciosa'),(424,'símbolos'),(130,'sin'),(318,'sino'),(147,'sit'),(388,'sobra'),(127,'sobre'),(608,'sociedad'),(229,'sodales'),(488,'soldado'),(184,'sollicitudin'),(451,'son'),(87,'sostenida'),(365,'sufren'),(354,'sufrido'),(375,'sujetos'),(312,'sumisión'),(348,'superficial'),(480,'suprimen'),(445,'sur'),(64,'sus'),(237,'suscipit'),(212,'suspendisse'),(358,'sustentan'),(316,'tal'),(505,'también'),(490,'tampoco'),(404,'tan'),(492,'tarea'),(197,'tellus'),(580,'tema'),(185,'tempor'),(378,'teresa'),(276,'test'),(275,'texto'),(74,'tiempo'),(394,'tiempos'),(188,'tincidunt'),(408,'toda'),(499,'todo'),(357,'torno'),(166,'tortor'),(473,'totalidad'),(532,'trabajo'),(588,'tradición'),(469,'trae'),(401,'trágicamente'),(70,'transdiciplinario'),(355,'transformaciones'),(474,'trastoca'),(491,'trata'),(63,'través'),(34,'trayectoria'),(153,'tristique'),(177,'turpis'),(143,'uam'),(602,'uam-iztapalapa'),(215,'ullamcorper'),(207,'ultrices'),(261,'ultricies'),(22,'una'),(119,'unam'),(54,'unidad'),(51,'universidad'),(48,'url'),(180,'urna'),(412,'utópico'),(550,'valoración'),(376,'variaciones'),(429,'variadas'),(454,'varios'),(162,'varius'),(516,'veces'),(235,'vel'),(213,'velit'),(475,'ven'),(498,'vencedor'),(233,'venenatis'),(134,'veraz'),(202,'vestibulum'),(19,'vez'),(15,'vida'),(459,'viene'),(306,'violencia'),(220,'vitae'),(486,'vitales'),(511,'vivimos'),(178,'volutpat'),(193,'vulputate'),(443,'zulúes'),(322,'¿quién');
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL COMMENT 'Word position of the keyword in the object.',
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (241,1,0),(243,1,7),(241,2,1),(243,2,8),(241,3,2),(243,3,9),(243,3,150),(241,4,3),(243,4,10),(243,4,151),(242,5,0),(243,5,0),(243,5,15),(243,5,113),(244,5,1),(242,6,1),(243,6,1),(243,6,16),(243,6,42),(243,6,114),(244,6,0),(242,7,2),(243,7,2),(243,7,20),(243,7,41),(243,7,100),(242,8,3),(243,8,3),(243,8,105),(243,9,115),(243,9,145),(243,10,34),(364,10,44),(243,11,28),(243,12,11),(243,13,12),(243,14,13),(243,15,14),(243,15,27),(364,15,26),(364,15,51),(243,16,17),(243,17,18),(243,18,19),(243,18,65),(243,18,73),(268,18,11),(268,18,25),(243,19,21),(243,20,22),(243,21,23),(243,22,5),(243,22,24),(243,22,78),(243,22,98),(268,22,49),(268,22,61),(268,22,73),(356,22,6),(356,22,44),(364,22,62),(243,23,25),(243,23,99),(243,24,52),(243,25,30),(243,25,146),(243,26,31),(243,26,108),(243,27,32),(243,28,33),(243,29,35),(243,30,36),(243,31,37),(243,33,39),(243,34,40),(243,35,43),(243,36,44),(243,37,59),(243,38,60),(267,38,4),(356,38,71),(363,38,4),(243,39,61),(243,40,88),(243,41,89),(243,41,104),(243,42,90),(249,45,0),(249,46,1),(249,47,2),(249,48,3),(249,49,4),(249,50,5),(241,51,4),(243,51,69),(241,52,5),(241,53,6),(241,54,7),(241,55,8),(243,56,4),(243,57,6),(243,57,162),(243,58,26),(243,59,29),(243,60,38),(243,61,45),(243,62,46),(243,62,156),(268,62,38),(268,62,89),(268,62,107),(356,62,63),(364,62,22),(243,63,47),(356,63,74),(243,64,48),(243,64,63),(268,64,21),(268,64,65),(268,64,67),(268,64,70),(364,64,5),(364,64,53),(243,65,49),(243,66,50),(243,67,51),(243,68,53),(243,69,54),(243,69,112),(243,70,55),(243,71,56),(243,71,143),(243,72,57),(243,73,58),(243,74,62),(243,75,64),(243,76,66),(243,77,67),(243,77,139),(243,77,153),(243,78,68),(243,79,70),(243,79,124),(243,79,130),(243,80,71),(243,81,72),(244,81,7),(248,81,0),(243,82,74),(243,83,75),(243,84,76),(243,85,77),(243,86,79),(244,86,3),(243,87,80),(243,88,81),(243,89,82),(243,89,111),(243,89,118),(267,89,1),(268,89,40),(268,89,58),(268,89,99),(268,89,101),(356,89,9),(356,89,37),(356,89,53),(356,89,89),(363,89,1),(364,89,65),(243,90,83),(243,91,84),(243,91,97),(243,92,85),(243,93,86),(243,94,87),(243,95,91),(243,96,92),(243,97,93),(243,98,94),(243,98,96),(243,99,95),(268,99,105),(243,100,101),(243,101,102),(243,102,103),(243,103,106),(243,104,107),(243,105,109),(243,106,110),(243,107,116),(243,108,117),(243,109,119),(243,110,120),(243,111,121),(243,112,122),(243,113,123),(243,114,125),(243,115,126),(243,116,127),(243,116,132),(243,117,128),(243,118,129),(243,119,131),(243,120,133),(243,121,134),(243,122,135),(243,123,136),(268,123,63),(268,123,104),(243,124,137),(243,125,138),(243,126,140),(243,127,141),(356,127,29),(356,127,34),(356,127,101),(243,128,142),(243,129,144),(268,129,27),(243,130,147),(268,130,2),(268,130,118),(356,130,41),(243,131,148),(243,132,149),(243,133,152),(243,134,154),(243,135,155),(243,136,157),(243,137,158),(356,137,76),(243,138,159),(243,139,160),(243,140,161),(247,275,0),(244,277,2),(244,278,4),(244,279,5),(244,280,6),(244,281,8),(244,282,9),(244,283,10),(245,284,0),(245,285,1),(246,286,0),(246,287,1),(266,288,0),(362,288,0),(266,289,1),(362,289,1),(266,290,2),(362,290,2),(267,291,0),(268,291,0),(268,291,29),(268,291,50),(363,291,0),(364,291,0),(267,292,2),(268,292,1),(268,292,26),(268,292,41),(268,292,59),(268,292,62),(268,292,102),(363,292,2),(364,292,1),(364,292,3),(364,292,35),(364,292,57),(267,293,3),(356,293,91),(356,293,102),(363,293,3),(267,294,5),(363,294,5),(267,295,6),(363,295,6),(268,296,3),(268,297,4),(268,298,5),(268,299,6),(268,299,103),(268,300,7),(268,301,8),(268,302,9),(268,303,10),(268,304,12),(364,304,15),(268,305,13),(364,305,13),(268,306,14),(268,307,15),(268,308,16),(268,309,17),(268,310,18),(268,311,19),(268,312,20),(364,312,14),(268,313,22),(268,314,23),(356,314,48),(268,315,24),(268,316,28),(268,317,30),(268,318,31),(268,319,32),(268,320,33),(268,320,106),(268,321,34),(268,322,35),(268,323,36),(268,324,37),(268,325,39),(268,326,42),(268,326,78),(268,326,86),(268,326,111),(356,326,3),(356,326,25),(356,326,35),(356,326,78),(364,326,9),(364,326,11),(364,326,18),(364,326,21),(268,327,43),(268,328,44),(268,329,45),(268,330,46),(268,331,47),(268,332,48),(268,333,51),(268,334,52),(268,335,53),(268,336,54),(268,337,55),(268,337,87),(268,338,56),(268,339,57),(268,340,60),(364,340,2),(268,341,64),(268,342,66),(364,342,6),(268,343,68),(268,344,69),(268,345,71),(268,346,72),(268,347,74),(268,348,75),(268,349,76),(356,349,103),(364,349,33),(268,350,77),(268,351,79),(364,351,12),(364,351,19),(268,352,80),(268,352,100),(268,353,81),(356,353,16),(268,354,82),(268,355,83),(364,355,10),(268,356,84),(268,357,85),(364,357,55),(268,358,88),(268,359,90),(268,360,91),(268,361,92),(268,362,93),(268,363,94),(268,364,95),(268,365,96),(268,366,97),(268,367,98),(268,368,108),(268,369,109),(268,370,110),(268,371,112),(364,371,54),(268,372,113),(268,373,114),(268,374,115),(268,375,116),(268,376,117),(268,377,119),(354,378,0),(356,378,86),(354,379,1),(356,379,87),(355,380,0),(355,381,1),(356,381,30),(356,381,58),(356,381,65),(356,381,72),(356,381,104),(364,390,23),(364,391,24),(364,393,60),(364,405,37),(364,405,66),(356,411,4),(356,411,26),(356,411,36),(364,436,27),(356,444,28),(364,460,42),(356,484,5),(356,484,17),(356,501,19),(364,518,4),(364,519,7),(364,520,8),(364,521,16),(364,522,17),(364,523,20),(364,524,25),(364,525,28),(364,526,29),(364,527,30),(364,528,31),(364,529,32),(356,530,2),(356,530,24),(356,530,47),(364,530,34),(364,531,36),(356,532,52),(364,532,38),(364,533,39),(364,534,40),(364,535,41),(364,536,43),(364,537,45),(364,538,46),(364,539,47),(364,540,48),(364,541,49),(364,542,50),(364,543,52),(364,544,56),(364,545,58),(356,546,10),(364,546,59),(364,547,61),(364,548,63),(364,549,64),(356,550,0),(356,551,1),(356,551,46),(356,552,7),(356,553,8),(356,554,11),(356,555,12),(356,556,13),(356,557,14),(356,558,15),(356,559,18),(356,560,20),(356,561,21),(356,562,22),(356,563,23),(356,564,27),(356,565,31),(356,566,32),(356,567,33),(356,568,38),(356,569,39),(356,570,40),(356,571,42),(356,572,43),(356,573,45),(356,574,49),(356,575,50),(356,576,51),(356,577,54),(356,578,55),(356,579,56),(356,580,57),(356,581,59),(356,582,60),(356,583,61),(356,584,62),(356,585,64),(356,586,66),(356,587,67),(356,588,68),(356,588,70),(356,589,69),(356,590,73),(356,591,75),(356,592,77),(356,593,79),(356,594,80),(356,595,81),(356,596,82),(356,597,83),(356,598,84),(356,599,85),(356,600,88),(356,601,90),(356,602,92),(356,603,93),(356,604,94),(356,605,95),(356,606,96),(356,607,97),(356,608,98),(356,609,99),(356,610,100);
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint(20) DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)',
  PRIMARY KEY (`object_id`),
  KEY `submission_search_object_submission` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (241,4,1,0),(242,4,2,0),(243,4,4,0),(244,4,16,0),(245,4,17,0),(246,4,8,0),(247,4,32,0),(248,4,64,0),(249,4,128,10),(266,6,1,0),(267,6,2,0),(268,6,4,0),(269,6,16,0),(270,6,17,0),(271,6,8,0),(272,6,32,0),(273,6,64,0),(354,9,1,0),(355,9,2,0),(356,9,4,0),(357,9,16,0),(358,9,17,0),(359,9,8,0),(360,9,32,0),(361,9,64,0),(362,7,1,0),(363,7,2,0),(364,7,4,0),(365,7,16,0),(366,7,17,0),(367,7,8,0),(368,7,32,0),(369,7,64,0);
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_settings`
--

LOCK TABLES `submission_settings` WRITE;
/*!40000 ALTER TABLE `submission_settings` DISABLE KEYS */;
INSERT INTO `submission_settings` VALUES (4,'','datacite-export::status','notDeposited');
/*!40000 ALTER TABLE `submission_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT 1,
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `submission_progress` smallint(6) NOT NULL DEFAULT 1,
  `work_type` smallint(6) DEFAULT 0,
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2022-10-05 12:30:34','2022-10-05 12:30:34','2022-10-05 12:30:34',1,'es_ES',1,0,2),(2,1,2,'2022-10-06 12:02:23','2022-10-06 11:52:22','2022-10-06 11:52:22',1,'es_ES',1,0,2),(3,1,3,'2022-10-07 10:41:17',NULL,'2022-10-07 10:41:17',1,'en_US',1,1,0),(4,1,4,'2022-11-16 11:52:50','2022-10-14 16:47:32','2022-10-14 16:32:37',5,'es_ES',3,0,2),(5,1,5,'2022-11-17 11:01:41','2022-11-13 17:38:42','2022-11-13 17:34:33',5,'es_ES',1,0,2),(6,1,6,'2022-11-29 16:02:14','2022-11-29 16:02:14','2022-11-29 15:56:14',5,'es_ES',1,0,2),(7,1,7,'2022-11-29 17:18:21','2022-11-29 16:12:43','2022-11-29 16:04:38',5,'es_ES',3,0,2),(8,1,8,'2022-11-29 16:38:23',NULL,'2022-11-29 16:32:56',1,'es_ES',1,1,0),(9,1,9,'2022-11-29 17:17:43','2022-11-29 16:45:41','2022-11-29 16:40:11',5,'es_ES',3,0,2);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_files`
--

LOCK TABLES `temporary_files` WRITE;
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
INSERT INTO `temporary_files` VALUES (34,1,'jpgVEk0HF','image/jpeg',43190,'A_Song_of_Ice_and_Fire_book_collection_box_set_cover.jpg','2022-11-13 17:47:02'),(35,1,'jpgubzG9a','image/jpeg',43190,'A_Song_of_Ice_and_Fire_book_collection_box_set_cover.jpg','2022-11-13 17:49:30'),(36,1,'jpgv7mHkM','image/jpeg',43190,'A_Song_of_Ice_and_Fire_book_collection_box_set_cover.jpg','2022-11-13 17:50:20'),(38,1,'jpg5G9jaN','image/jpeg',94397,'submission_4_4_coverImage_es_ES.jpg','2022-11-13 18:12:25');
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT 1,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_temporary_records`
--

LOCK TABLES `usage_stats_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_settings`
--

DROP TABLE IF EXISTS `user_group_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(1,'es_ES','name','##default.groups.name.siteAdmin##','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'','recommendOnly','0','bool'),(2,'en_US','abbrev','PM','string'),(2,'en_US','name','Press manager','string'),(2,'es_ES','abbrev','JE','string'),(2,'es_ES','name','Jefe/a editorial','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(3,'','nameLocaleKey','default.groups.name.editor','string'),(3,'en_US','abbrev','PE','string'),(3,'en_US','name','Press editor','string'),(3,'es_ES','abbrev','CE','string'),(3,'es_ES','name','Coordinador editorial','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(4,'','nameLocaleKey','default.groups.name.productionEditor','string'),(4,'en_US','abbrev','ProdE','string'),(4,'en_US','name','Production editor','string'),(4,'es_ES','abbrev','CoProd','string'),(4,'es_ES','name','Coordinador/a de producción','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(5,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(5,'en_US','abbrev','AcqE','string'),(5,'en_US','name','Series editor','string'),(5,'es_ES','abbrev','CO','string'),(5,'es_ES','name','Coordinador de obra','string'),(6,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(6,'','nameLocaleKey','default.groups.name.copyeditor','string'),(6,'en_US','abbrev','CE','string'),(6,'en_US','name','Copyeditor','string'),(6,'es_ES','abbrev','CE','string'),(6,'es_ES','name','Corrector/a de estilo','string'),(7,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(7,'','nameLocaleKey','default.groups.name.designer','string'),(7,'en_US','abbrev','Design','string'),(7,'en_US','name','Designer','string'),(7,'es_ES','abbrev','Diseño','string'),(7,'es_ES','name','Diseñador/a','string'),(8,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(8,'','nameLocaleKey','default.groups.name.funding','string'),(8,'en_US','abbrev','FC','string'),(8,'en_US','name','Funding coordinator','string'),(8,'es_ES','abbrev','CF','string'),(8,'es_ES','name','Coordinador/a de financiación','string'),(9,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(9,'','nameLocaleKey','default.groups.name.indexer','string'),(9,'en_US','abbrev','IND','string'),(9,'en_US','name','Indexer','string'),(9,'es_ES','abbrev','DOC','string'),(9,'es_ES','name','Documentalista','string'),(10,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(10,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(10,'en_US','abbrev','LE','string'),(10,'en_US','name','Layout Editor','string'),(10,'es_ES','abbrev','MAQ','string'),(10,'es_ES','name','Maquetador/a','string'),(11,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(11,'','nameLocaleKey','default.groups.name.marketing','string'),(11,'en_US','abbrev','MS','string'),(11,'en_US','name','Marketing and sales coordinator','string'),(11,'es_ES','abbrev','MV','string'),(11,'es_ES','name','Coordinador/a de marketing y ventas','string'),(12,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(12,'','nameLocaleKey','default.groups.name.proofreader','string'),(12,'en_US','abbrev','PR','string'),(12,'en_US','name','Proofreader','string'),(12,'es_ES','abbrev','CP','string'),(12,'es_ES','name','Corrector/a de pruebas','string'),(13,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(13,'','nameLocaleKey','default.groups.name.author','string'),(13,'en_US','abbrev','AU','string'),(13,'en_US','name','Author','string'),(13,'es_ES','abbrev','AU','string'),(13,'es_ES','name','Autor/a','string'),(14,'','abbrevLocaleKey','default.groups.abbrev.volumeEditor','string'),(14,'','nameLocaleKey','default.groups.name.volumeEditor','string'),(14,'en_US','abbrev','VE','string'),(14,'en_US','name','Volume editor','string'),(14,'es_ES','abbrev','CO','string'),(14,'es_ES','name','Coordinador de obra','string'),(15,'','abbrevLocaleKey','default.groups.abbrev.chapterAuthor','string'),(15,'','nameLocaleKey','default.groups.name.chapterAuthor','string'),(15,'en_US','abbrev','CA','string'),(15,'en_US','name','Chapter Author','string'),(15,'es_ES','abbrev','AC','string'),(15,'es_ES','name','Autor de capítulo','string'),(16,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(16,'','nameLocaleKey','default.groups.name.translator','string'),(16,'en_US','abbrev','Trans','string'),(16,'en_US','name','Translator','string'),(16,'es_ES','abbrev','Trad','string'),(16,'es_ES','name','Traductor/a','string'),(17,'','abbrevLocaleKey','default.groups.abbrev.internalReviewer','string'),(17,'','nameLocaleKey','default.groups.name.internalReviewer','string'),(17,'en_US','abbrev','IR','string'),(17,'en_US','name','Internal Reviewer','string'),(17,'es_ES','abbrev','RI','string'),(17,'es_ES','name','Revisor/a interno','string'),(18,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(18,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(18,'en_US','abbrev','ER','string'),(18,'en_US','name','External Reviewer','string'),(18,'es_ES','abbrev','RE','string'),(18,'es_ES','name','Revisor/a externo','string'),(19,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(19,'','nameLocaleKey','default.groups.name.reader','string'),(19,'en_US','abbrev','Read','string'),(19,'en_US','name','Reader','string'),(19,'es_ES','abbrev','Lect','string'),(19,'es_ES','name','Lector/a','string');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT INTO `user_group_stage` VALUES (1,2,1),(1,2,2),(1,2,3),(1,2,4),(1,2,5),(1,3,1),(1,3,2),(1,3,3),(1,3,4),(1,3,5),(1,4,4),(1,4,5),(1,5,1),(1,5,2),(1,5,3),(1,5,4),(1,5,5),(1,6,4),(1,7,5),(1,8,1),(1,8,2),(1,8,3),(1,9,5),(1,10,5),(1,11,4),(1,12,5),(1,13,1),(1,13,2),(1,13,3),(1,13,4),(1,13,5),(1,14,1),(1,14,2),(1,14,3),(1,14,4),(1,14,5),(1,15,4),(1,15,5),(1,16,1),(1,16,2),(1,16,3),(1,16,4),(1,16,5),(1,17,2),(1,18,3);
/*!40000 ALTER TABLE `user_group_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 1,
  `permit_self_registration` smallint(6) NOT NULL DEFAULT 0,
  `permit_metadata_edit` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,0,1,1,0,0,0),(2,1,16,1,0,0,1),(3,1,16,1,0,0,1),(4,1,16,1,0,0,1),(5,1,17,1,0,0,1),(6,1,4097,1,0,0,0),(7,1,4097,1,0,0,0),(8,1,4097,1,0,0,0),(9,1,4097,1,0,0,0),(10,1,4097,1,0,0,0),(11,1,4097,1,0,0,0),(12,1,4097,1,0,0,0),(13,1,65536,1,0,1,0),(14,1,65536,1,0,0,0),(15,1,65536,1,0,1,0),(16,1,65536,1,0,0,0),(17,1,4096,1,0,0,0),(18,1,4096,1,0,1,0),(19,1,1048576,1,0,1,0);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
INSERT INTO `user_interests` VALUES (7,7);
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,'es_ES','familyName',0,0,'admin','string'),(1,'es_ES','givenName',0,0,'admin','string'),(2,'','orcid',0,0,'','string'),(2,'es_ES','affiliation',0,0,'','string'),(2,'es_ES','biography',0,0,'','string'),(2,'es_ES','familyName',0,0,'Rodríguez Sánchez','string'),(2,'es_ES','givenName',0,0,'María Guadalupe','string'),(2,'es_ES','preferredPublicName',0,0,'Mtra. María Guadalupe Rodríguez Sánchez','string'),(2,'es_ES','signature',0,0,'','string'),(3,'','orcid',0,0,'','string'),(3,'en_US','affiliation',0,0,'','string'),(3,'en_US','biography',0,0,'','string'),(3,'en_US','familyName',0,0,'','string'),(3,'en_US','givenName',0,0,'','string'),(3,'en_US','preferredPublicName',0,0,'','string'),(3,'en_US','signature',0,0,'','string'),(3,'es_ES','affiliation',0,0,'','string'),(3,'es_ES','biography',0,0,'','string'),(3,'es_ES','familyName',0,0,'Luna','string'),(3,'es_ES','givenName',0,0,'Amaranta','string'),(3,'es_ES','preferredPublicName',0,0,'Amaranta','string'),(3,'es_ES','signature',0,0,'','string'),(4,'','orcid',0,0,'','string'),(4,'en_US','affiliation',0,0,'','string'),(4,'en_US','biography',0,0,'','string'),(4,'en_US','familyName',0,0,'','string'),(4,'en_US','givenName',0,0,'','string'),(4,'en_US','preferredPublicName',0,0,'','string'),(4,'en_US','signature',0,0,'','string'),(4,'es_ES','affiliation',0,0,'','string'),(4,'es_ES','biography',0,0,'','string'),(4,'es_ES','familyName',0,0,'Gónzález','string'),(4,'es_ES','givenName',0,0,'Alejandro','string'),(4,'es_ES','preferredPublicName',0,0,'Ale','string'),(4,'es_ES','signature',0,0,'','string'),(5,'','orcid',0,0,'','string'),(5,'en_US','affiliation',0,0,'','string'),(5,'en_US','biography',0,0,'','string'),(5,'en_US','familyName',0,0,'','string'),(5,'en_US','givenName',0,0,'','string'),(5,'en_US','preferredPublicName',0,0,'','string'),(5,'en_US','signature',0,0,'','string'),(5,'es_ES','affiliation',0,0,'','string'),(5,'es_ES','biography',0,0,'','string'),(5,'es_ES','familyName',0,0,'Mendoza','string'),(5,'es_ES','givenName',0,0,'Emmanuel','string'),(5,'es_ES','preferredPublicName',0,0,'Emmanuel','string'),(5,'es_ES','signature',0,0,'','string'),(6,'','orcid',0,0,'','string'),(6,'en_US','affiliation',0,0,'','string'),(6,'en_US','biography',0,0,'','string'),(6,'en_US','familyName',0,0,'','string'),(6,'en_US','givenName',0,0,'','string'),(6,'en_US','preferredPublicName',0,0,'','string'),(6,'en_US','signature',0,0,'','string'),(6,'es_ES','affiliation',0,0,'','string'),(6,'es_ES','biography',0,0,'','string'),(6,'es_ES','familyName',0,0,'Zárate','string'),(6,'es_ES','givenName',0,0,'Camilo','string'),(6,'es_ES','preferredPublicName',0,0,'Camilo','string'),(6,'es_ES','signature',0,0,'','string'),(7,'es_ES','affiliation',0,0,'Trabajador','string'),(7,'es_ES','familyName',0,0,'Méndez Sánchez','string'),(7,'es_ES','givenName',0,0,'Miguel Angel','string'),(8,'es_ES','affiliation',0,0,'{\"es_ES\":\"Universidad Autónoma Metropolitana Unidad Iztapalapa\"}','object'),(8,'es_ES','familyName',0,0,'Salgado Vazquez','string'),(8,'es_ES','givenName',0,0,'Alan Erick','string');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES (1,1),(2,1),(2,2),(3,2),(4,2),(5,2),(6,2),(6,3),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(13,4),(13,6),(14,2),(15,2),(16,2),(17,2),(17,5),(18,2),(18,6),(18,7),(19,2),(19,8);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `gossip` text DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` smallint(6) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT 0,
  `disabled_reason` text DEFAULT NULL,
  `inline_help` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$h7fckPzuois9ff2kydu1w.jsJuSSFZ40YmmfZOGhx1vGJfboaB5Zq','uamidigital@xanum.uam.mx',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2022-09-26 14:18:13',NULL,'2022-12-15 12:09:46',0,NULL,NULL,0,NULL,1),(2,'dfilo','$2y$10$sGp.dHQy7GPELt0uSY9S4ebYSKXkWH0S/hfwhytCpEmWmrVgqCr3.','pubf@xanum.uam.mx','','','',NULL,'MX','','',NULL,'2022-09-28 10:11:56',NULL,'2022-10-12 21:56:13',0,NULL,NULL,0,NULL,1),(3,'aluna','$2y$10$WvTQN7I114OJAXZBnV4g3.ep2cz47rILHRaQ5SHE7mhC5wmGywa3O','lunamaranta@xanum.uam.mx','','','',NULL,'MX','',NULL,NULL,'2022-10-04 12:58:02',NULL,'2022-10-04 13:18:24',0,NULL,NULL,0,NULL,1),(4,'agonzalez','$2y$10$Cngfd7ogRdZMasY3.NBc5uyngi8xwQmRvjt40xhARuN47iIG9Fsnq','ale_alejandro@gmail.com','','','',NULL,'ES','',NULL,NULL,'2022-10-04 13:21:56',NULL,'2022-10-04 13:21:56',0,NULL,NULL,0,NULL,1),(5,'emendoza','$2y$10$8RH6lvgXhJ/qye35AZN/LuWevRtBSDQlJHFGU.8IaqVtSFgHE5/fq','emm_mendoza@gmail.com','','','',NULL,'CU','',NULL,NULL,'2022-10-04 13:24:25',NULL,'2022-10-04 13:24:25',0,NULL,NULL,0,NULL,1),(6,'czarate','$2y$10$BSrCmXT5RsO0E58ftUTgKeGWyTV6Hx0I2eTZtQ0g6Fx5J9Z/eOeWi','cami_zarate@gmail.com','','','',NULL,'AR','',NULL,NULL,'2022-10-04 13:26:38',NULL,'2022-10-04 13:26:38',0,NULL,NULL,0,NULL,1),(7,'sopm43','$2y$10$vgYPqysWj86b5ReauOaVH.to4omjZx/B13FFWcKWbZ66ATFFQFj7y','sopm@xanum.uam.mx',NULL,NULL,NULL,NULL,'MX','',NULL,NULL,'2022-10-27 13:20:00',NULL,'2022-10-27 13:20:00',0,NULL,NULL,0,NULL,1),(8,'asalgadov','$2y$10$8NDRbBVwd3yQ03US.WmFpeK7Gas.Z7z8jMBzqYsljNKlX5f5E32mm','ae_salgado@icloud.com',NULL,NULL,NULL,NULL,'MX','',NULL,NULL,'2022-11-16 14:01:06',NULL,'2022-11-16 14:01:06',0,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `major` int(11) NOT NULL DEFAULT 0 COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int(11) NOT NULL DEFAULT 0 COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int(11) NOT NULL DEFAULT 0 COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int(11) NOT NULL DEFAULT 0 COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itelf',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise',
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,0,0,0,'2022-09-26 14:18:14',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.pubIds','doi','DOIPubIdPlugin',0,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.pubIds','urn','URNPubIdPlugin',0,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.generic','usageEvent','',0,1),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.generic','acron','',0,1),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,2,0,0,'2022-09-26 14:18:14',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,2,0,0,'2022-09-26 14:18:14',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.themes','default','DefaultThemePlugin',1,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.importexport','csv','',0,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.importexport','onix30','',0,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2022-09-26 14:18:14',1,'plugins.paymethod','manual','',0,0),(3,3,0,12,'2022-09-26 14:18:03',1,'core','omp','',0,1),(1,0,5,0,'2022-09-27 18:48:10',1,'plugins.generic','epubViewer','EpubViewerPlugin',1,0),(1,0,1,0,'2022-09-27 18:48:50',1,'plugins.generic','openGraph','OpenGraphPlugin',1,0),(1,1,0,2,'2022-09-27 18:49:17',1,'plugins.generic','customLocale','CustomLocalePlugin',1,0),(1,0,4,0,'2022-09-27 18:49:37',1,'plugins.generic','addThis','AddThisPlugin',1,0),(1,0,0,6,'2022-09-27 18:50:10',1,'plugins.importexport','datacite','DataciteExportPlugin',1,0),(1,0,0,0,'2022-10-07 10:40:33',1,'plugins.importexport','quickSubmit','',0,0),(1,0,3,1,'2022-10-14 17:10:56',1,'plugins.generic','customHeader','CustomHeaderPlugin',1,0),(3,1,0,0,'2022-11-12 23:57:01',0,'plugins.themes','bootstrap3','BootstrapThreeThemePlugin',0,0),(1,1,1,0,'2022-11-13 00:28:12',1,'plugins.themes','pragma','PragmaThemePlugin',1,0),(3,2,0,4,'2022-11-13 00:40:08',1,'plugins.themes','bootstrap3','BootstrapThreeThemePlugin',1,0),(3,3,0,1,'2022-11-16 11:25:51',1,'plugins.generic','shariff','ShariffPlugin',1,0),(3,2,0,1,'2022-11-16 11:26:56',1,'plugins.blocks','announcementsBlock','AnnouncementsBlockPlugin',1,0);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-23 17:16:07
