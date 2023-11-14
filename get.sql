-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: asia_latte_n_chai
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `add_ons`
--

DROP TABLE IF EXISTS `add_ons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `add_ons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_ons`
--

LOCK TABLES `add_ons` WRITE;
/*!40000 ALTER TABLE `add_ons` DISABLE KEYS */;
INSERT INTO `add_ons` VALUES (1,'Sauce',100.00,'2023-11-05 06:26:46','2023-11-05 06:26:46');
/*!40000 ALTER TABLE `add_ons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Master Admin','Khandakar','01759412381','admin@admin.com','def.png','$2y$10$K/VMLl4zl30EkSmbt3hUH.0kmauBg2h66i8.EVW6MDO5J2xGGM3sG','gbIdrIRFLBxabtpch9e07BCyj39fNpVDJsmAxtATESTUJyJ612NKkaOsXTIw','2023-10-04 06:58:06','2023-10-04 06:58:06');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'Cheese','2023-11-05 06:27:33','2023-11-05 06:27:33');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `restaurant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_tables`
--

DROP TABLE IF EXISTS `book_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_tables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `no_of_person` int NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_tables`
--

LOCK TABLES `book_tables` WRITE;
/*!40000 ALTER TABLE `book_tables` DISABLE KEYS */;
INSERT INTO `book_tables` VALUES (1,'Tanjir','01925484921','tanjir.rsa@gmail.com','2023-10-10','15:08:00',2,'Tad','2023-10-08 07:08:41','2023-10-08 07:08:41',NULL),(2,'Tanjir','01925484921','tanjir.rsa@gmail.com','2023-10-10','15:08:00',2,'Tad','2023-10-08 07:09:21','2023-10-08 07:09:21',NULL),(3,'Tanjir','2531511902','tanjir@tanjir.com','2023-10-09','15:09:00',2,'Tqad','2023-10-08 07:09:48','2023-10-08 07:09:48',NULL),(4,'Violet Fitzgerald','+1 (559) 213-6459','dyworibuna@mailinator.com','2005-08-19','00:16:00',26,'Alias provident et','2023-10-08 07:12:02','2023-10-08 07:12:02',NULL),(5,'Garrison Compton','+1 (396) 344-1657','jyqoja@mailinator.com','2003-01-19','11:56:00',86,'Autem vel est unde o','2023-10-08 07:12:38','2023-10-08 07:12:38',NULL),(6,'Rinah Durham','+1 (469) 412-6526','qeluxy@mailinator.com','2008-07-20','05:02:00',78,'Voluptatum facere pa','2023-10-08 07:14:48','2023-10-08 07:14:48',NULL),(7,'Hakeem Thornton','+1 (885) 651-3804','webujipoje@mailinator.com','2018-08-29','09:31:00',99,'Nisi proident conse','2023-10-08 07:18:46','2023-10-08 07:18:46',NULL),(8,'Emerson Adams','+1 (893) 328-1833','xupiluh@mailinator.com','1989-12-22','01:01:00',62,'Fugiat accusamus dol','2023-10-08 07:19:08','2023-10-08 07:19:08',NULL),(9,'Abraham Odom','+1 (471) 912-5075','fynuv@mailinator.com','1985-06-26','22:35:00',34,'Dolor deserunt quibu','2023-10-08 07:23:49','2023-10-08 07:23:49',NULL),(10,'Nina Glass','+1 (302) 471-7899','supuviga@mailinator.com','1984-12-22','20:22:00',87,'Et sint dolorem sed','2023-10-08 07:27:43','2023-10-08 07:27:43',NULL),(11,'Florence Munoz','+1 (807) 791-2651','koxaqe@mailinator.com','1988-05-13','15:11:00',33,'Dicta accusamus erro','2023-10-08 07:29:24','2023-10-08 07:29:24',NULL),(12,'Imogene Coffey','+1 (779) 367-7441','danokinapa@mailinator.com','2007-01-04','01:58:00',18,'Nisi quis aspernatur','2023-10-08 07:31:03','2023-10-08 07:31:03',NULL),(13,'Tatiana Gamble','+1 (884) 128-8067','vezyzyxu@mailinator.com','1991-06-05','10:45:00',9,'Iure eius et vel ull','2023-10-08 07:34:37','2023-10-08 07:34:37',NULL),(14,'Dane Battle','+1 (963) 683-4429','ruvimeh@mailinator.com','1973-02-28','08:35:00',100,'Sunt repellendus Iu','2023-10-08 07:36:58','2023-10-08 07:36:58',NULL),(15,'Jenette Schultz','+1 (548) 497-4539','biwirunyk@mailinator.com','1983-03-16','17:36:00',97,'Quibusdam nostrud ni','2023-10-08 07:38:50','2023-10-08 07:38:50',NULL),(16,'Ora Blankenship','+1 (598) 642-5722','lywi@mailinator.com','1976-04-04','19:56:00',52,'Sequi enim ipsum ad','2023-10-08 07:42:05','2023-10-08 07:42:05',NULL),(17,'Dawn Underwood','+1 (317) 364-1151','hytyfum@mailinator.com','2001-03-13','11:55:00',26,'Non labore non dolor','2023-10-08 07:47:56','2023-10-08 07:47:56',NULL),(18,'Reed Mcguire','+1 (234) 334-6045','gewyduc@mailinator.com','2018-06-09','03:39:00',69,'Laborum deserunt qui','2023-10-08 07:50:31','2023-10-08 07:50:31',NULL),(19,'Savannah Wolfe','+1 (495) 115-6814','deruru@mailinator.com','2010-03-24','14:13:00',39,'Exercitation eum ut','2023-10-08 07:51:26','2023-10-08 07:51:26',NULL),(20,'Florence Silva','+1 (811) 419-7247','tafowasu@mailinator.com','1971-10-06','09:14:00',26,'Inventore corrupti','2023-10-08 07:56:59','2023-10-08 07:56:59',NULL),(21,'Carolyn Glass','+1 (446) 378-9257','vocybi@mailinator.com','1984-03-12','05:16:00',53,'Tempor nisi fugiat','2023-10-08 07:57:23','2023-10-08 07:57:23',NULL),(22,'Ishmael Waters','+1 (261) 291-5869','japojug@mailinator.com','1974-02-13','01:27:00',33,'Vel reprehenderit cu','2023-10-08 07:57:46','2023-10-08 07:57:46',NULL),(23,'Brianna Terrell','+1 (241) 511-3004','qonulytaz@mailinator.com','1991-12-21','07:29:00',78,'Impedit iusto ducim','2023-10-08 07:59:06','2023-10-08 07:59:06',NULL),(24,'Reuben Francis','+1 (452) 618-2475','cuha@mailinator.com','2013-08-16','15:07:00',90,'Sunt reprehenderit','2023-10-08 08:05:13','2023-10-08 08:05:13',NULL),(25,'Laurel Anthony','+1 (501) 869-4171','vilufysego@mailinator.com','1995-05-24','19:35:00',19,'Neque molestias omni','2023-10-08 08:05:20','2023-10-08 08:05:20',NULL),(26,'Cairo Stevenson','+1 (282) 286-2612','qevoqu@mailinator.com','1999-12-30','14:12:00',30,'Aspernatur id ration','2023-10-08 08:07:52','2023-10-08 08:07:52',NULL),(27,'wewe','+1 (847) 253-2064','huqy@mailinator.com','1991-12-09','07:05:00',34,'Blanditiis quis offi','2023-10-08 08:08:56','2023-10-08 08:08:56',NULL),(28,'Beatrice Church','+1 (555) 301-6209','kami@mailinator.com','2014-01-02','05:32:00',33,'Nobis et rerum volup','2023-10-08 08:10:54','2023-10-08 08:10:54',NULL),(29,'Ferdinand Molina','+1 (577) 104-4224','tirytyvuvy@mailinator.com','1999-03-10','03:59:00',85,'Non culpa dignissimo','2023-10-08 08:11:22','2023-10-08 08:11:22',NULL),(30,'Hiram Spence','+1 (835) 943-1762','tebiwifob@mailinator.com','1996-09-20','17:52:00',7,'Distinctio Sunt cu','2023-10-08 08:12:55','2023-10-08 08:12:55',NULL),(31,'William Patel','+1 (969) 447-2546','ture@mailinator.com','1975-06-11','13:46:00',4,'Accusantium expedita','2023-10-08 08:13:21','2023-10-08 08:13:21',NULL),(32,'Kendall Castaneda','+1 (223) 128-9477','guqoga@mailinator.com','1980-11-16','11:16:00',87,'Ut impedit amet es','2023-10-08 08:14:20','2023-10-08 08:14:20',NULL),(33,'Kendall Castaneda','+1 (223) 128-9477','guqoga@mailinator.com','1980-11-16','11:16:00',87,'Ut impedit amet es','2023-10-08 08:14:40','2023-10-08 08:14:40',NULL),(34,'Hammett Morales','+1 (699) 685-3688','hofib@mailinator.com','2009-04-09','02:17:00',62,'Nulla amet ea nostr','2023-10-08 08:14:48','2023-10-08 08:14:48',NULL),(35,'Kameko Parks','+1 (898) 971-7853','gawujoda@mailinator.com','1970-06-04','09:49:00',4,'Nulla commodo ipsam','2023-10-08 08:15:27','2023-10-08 08:15:27',NULL),(36,'Kellie Mcneil','+1 (391) 683-7421','gykodaconi@mailinator.com','1978-08-23','15:25:00',96,'Omnis fugiat dolor','2023-10-08 08:16:01','2023-10-08 08:16:01',NULL),(37,'Fletcher Murray','+1 (863) 432-8332','tedidof@mailinator.com','2019-11-03','01:26:00',5,'Ducimus error qui e','2023-10-08 08:16:23','2023-10-08 08:16:23',NULL),(38,'Eve Stokes','+1 (489) 515-1687','tody@mailinator.com','1973-03-22','20:21:00',26,'In et eum impedit a','2023-10-08 08:16:49','2023-10-08 08:16:49',NULL),(39,'Reuben Potts','+1 (593) 385-1935','xeba@mailinator.com','2016-05-01','15:35:00',91,'Nobis id dolorem ven','2023-10-08 08:18:05','2023-10-08 08:18:05',NULL),(40,'Knox Townsend','+1 (645) 586-5436','putupa@mailinator.com','1995-02-22','05:49:00',22,'Eius quis adipisicin','2023-10-08 08:18:46','2023-10-08 08:18:46',NULL),(41,'Kai Elliott','+1 (701) 137-3967','buvi@mailinator.com','2003-12-04','04:50:00',71,'Nemo autem ut magna','2023-10-08 08:23:39','2023-10-08 08:23:39',NULL),(42,'Demetria Whitaker','+1 (464) 702-5888','humutyvuve@mailinator.com','1989-12-02','18:09:00',48,'Beatae quis vel quia','2023-10-08 08:29:42','2023-10-08 08:29:42',NULL),(43,'Mufutau Hebert','+1 (824) 842-6754','kypipajoty@mailinator.com','2010-07-19','16:14:00',48,'Officiis fugiat pro','2023-10-08 08:34:30','2023-10-08 08:34:30',NULL),(44,'Fredericka Lloyd','+1 (925) 809-9487','kunypo@mailinator.com','1986-02-27','14:02:00',8,'Aspernatur est repre','2023-10-08 08:34:46','2023-10-08 08:34:46',NULL),(45,'Velma Johns','+1 (951) 378-6057','heber@mailinator.com','1974-12-30','03:53:00',95,'Porro necessitatibus','2023-10-08 08:34:59','2023-10-08 08:34:59',NULL),(46,'Ferris White','+1 (272) 266-9837','raqynoxe@mailinator.com','2015-11-11','16:39:00',26,'Ex non molestiae lab','2023-10-08 08:41:29','2023-10-08 08:41:29',NULL),(47,'Randall Riddle','+1 (151) 359-7503','liwo@mailinator.com','1984-12-12','11:37:00',61,'Dolor vel quod labor','2023-10-08 08:44:01','2023-10-08 12:27:00','2023-10-08 12:27:00'),(48,'Shelby Rich','+1 (124) 737-4785','pybo@mailinator.com','2007-05-18','14:57:00',62,'Quis magnam non ut a','2023-10-08 09:07:17','2023-10-08 09:07:17',NULL),(49,'Ivor Ramsey','+1 (504) 541-9315','zytedy@mailinator.com','1994-08-07','06:49:00',4,'Illo quo aliquam ius','2023-10-08 09:22:35','2023-10-08 12:27:06','2023-10-08 12:27:06'),(50,'Serina Booth','+1 (907) 886-9227','kogotuxo@mailinator.com','2018-04-01','13:58:00',50,'Quidem dolorum fugia','2023-10-08 09:25:06','2023-10-08 09:25:06',NULL),(51,'Robin Riggs','+1 (632) 763-5728','johijafyx@mailinator.com','1983-05-13','09:33:00',63,'Et est aperiam velit','2023-10-08 09:46:37','2023-10-08 12:24:48','2023-10-08 12:24:48'),(52,'Lance Woodward','+1 (866) 596-6546','senir@mailinator.com','1993-09-21','06:32:00',24,'Consectetur quam in','2023-10-08 09:48:39','2023-10-08 12:24:44','2023-10-08 12:24:44'),(53,'Tatum Cardenas','+1 (908) 691-6215','xajetybe@mailinator.com','2019-06-06','07:15:00',61,'Tenetur molestias es','2023-10-08 09:50:50','2023-10-08 09:50:50',NULL),(54,'Fatima Pena','+1 (319) 846-8803','suvaj@mailinator.com','2016-03-07','16:18:00',6,'Aliquid accusantium','2023-10-08 09:51:15','2023-10-08 09:51:15',NULL),(55,'Addison Brooks','+1 (288) 648-2743','pytux@mailinator.com','1977-07-07','10:41:00',98,'Molestiae et alias s','2023-10-14 11:11:58','2023-10-14 11:11:58',NULL),(56,'Marshall Combs','+1 (684) 785-3898','pagav@mailinator.com','2007-10-14','03:39:00',82,'Quibusdam amet temp','2023-10-14 11:12:21','2023-10-14 11:12:21',NULL),(57,'Marshall Combs','+1 (684) 785-3898','pagav@mailinator.com','2007-10-14','03:39:00',82,'Quibusdam amet temp','2023-10-14 11:19:49','2023-10-14 11:19:49',NULL),(58,'Marshall Combs','+1 (684) 785-3898','pagav@mailinator.com','2007-10-14','03:39:00',82,'Quibusdam amet temp','2023-10-14 11:20:01','2023-10-14 11:20:01',NULL),(59,'Marshall Combs','+1 (684) 785-3898','pagav@mailinator.com','2007-10-14','03:39:00',82,'Quibusdam amet temp','2023-10-14 11:20:25','2023-10-14 11:20:25',NULL),(60,'Marshall Combs','+1 (684) 785-3898','pagav@mailinator.com','2007-10-14','03:39:00',82,'Quibusdam amet temp','2023-10-14 11:20:44','2023-10-14 11:20:44',NULL),(61,'Marshall Combs','+1 (684) 785-3898','pagav@mailinator.com','2007-10-14','03:39:00',82,'Quibusdam amet temp','2023-10-14 11:20:54','2023-10-14 11:20:54',NULL),(62,'Marshall Combs','+1 (684) 785-3898','pagav@mailinator.com','2007-10-14','03:39:00',82,'Quibusdam amet temp','2023-10-14 11:22:17','2023-10-14 11:22:17',NULL),(63,'Marshall Combs','+1 (684) 785-3898','pagav@mailinator.com','2007-10-14','03:39:00',82,'Quibusdam amet temp','2023-10-14 11:25:07','2023-10-14 11:25:07',NULL),(64,'Marshall Combs','+1 (684) 785-3898','pagav@mailinator.com','2007-10-14','03:39:00',82,'Quibusdam amet temp','2023-10-14 11:29:49','2023-10-14 11:29:49',NULL),(65,'Marshall Combs','+1 (684) 785-3898','pagav@mailinator.com','2007-10-14','03:39:00',82,'Quibusdam amet temp','2023-10-14 11:37:43','2023-10-14 11:37:43',NULL),(66,'Sydnee Newton','+1 (726) 192-1442','rybuqigyta@mailinator.com','1993-06-19','04:39:00',92,'Nisi excepteur harum','2023-10-14 11:39:30','2023-10-14 11:39:30',NULL),(67,'Sydnee Newton','+1 (726) 192-1442','rybuqigyta@mailinator.com','1993-06-19','04:39:00',92,'Nisi excepteur harum','2023-10-14 11:40:04','2023-10-14 11:40:04',NULL),(68,'Levi Blackburn','+1 (619) 117-9535','jimog@mailinator.com','1999-10-23','17:30:00',100,'Iure perferendis sin','2023-10-14 11:41:15','2023-10-14 11:41:15',NULL),(69,'Rinah Acevedo','+1 (348) 145-6976','bibi@mailinator.com','1986-12-19','07:36:00',39,'Voluptatem Molestia','2023-10-14 11:43:02','2023-10-14 11:43:02',NULL),(70,'Rinah Acevedo','+1 (348) 145-6976','bibi@mailinator.com','1986-12-19','07:36:00',39,'Voluptatem Molestia','2023-10-14 11:43:44','2023-10-14 11:43:44',NULL),(71,'Rinah Acevedo','+1 (348) 145-6976','bibi@mailinator.com','1986-12-19','07:36:00',39,'Voluptatem Molestia','2023-10-14 11:46:34','2023-10-14 11:46:34',NULL),(72,'Rinah Acevedo','+1 (348) 145-6976','bibi@mailinator.com','1986-12-19','07:36:00',39,'Voluptatem Molestia','2023-10-14 11:51:36','2023-10-14 11:51:36',NULL),(73,'Rinah Acevedo','+1 (348) 145-6976','bibi@mailinator.com','1986-12-19','07:36:00',39,'Voluptatem Molestia','2023-10-14 12:07:49','2023-10-14 12:07:49',NULL);
/*!40000 ALTER TABLE `book_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coverage` int NOT NULL DEFAULT '1',
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,NULL,'Gulshan Branch','gulshan@gulshan.com','$2y$10$K/VMLl4zl30EkSmbt3hUH.0kmauBg2h66i8.EVW6MDO5J2xGGM3sG','23.7502788,','90.3839963','Gulshn 1, Dhaka',1,'2023-10-12 10:50:24','2023-10-12 10:50:24',2,'s63Em2HmwYFEvpXt5o5M73EaabdUZ8uTK98O9w8bRNpYFy1Z5PO12kwKjoYu'),(2,NULL,'Badda','badda@badda.com','$2y$10$LvM4Ju4GhLcaMw6npWiFJede1s90XHomooqA6IsYYDVzwpxPGTqiC','1234.34.67','3213.56.676','Dhaka badda',1,'2023-10-28 06:35:22','2023-10-28 06:35:22',3,'wKUv8eEolqWCgBvVXV4n3ZY5cTrXg48z1dbUZHqdVyew7n3Ujw0aI2LcszxB');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_settings`
--

DROP TABLE IF EXISTS `business_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_settings`
--

LOCK TABLES `business_settings` WRITE;
/*!40000 ALTER TABLE `business_settings` DISABLE KEYS */;
INSERT INTO `business_settings` VALUES (1,'restaurant_open_time','07:11','2021-01-06 05:55:51','2021-01-06 05:55:51'),(2,'restaurant_close_time','01:20',NULL,NULL),(3,'restaurant_name','Latte N Chai',NULL,NULL),(4,'currency','BDT',NULL,NULL),(5,'logo','2023-05-25-646f0c1c70668.png',NULL,NULL),(6,'mail_config','{\"name\":\"The Food Store\",\"host\":\"mail.thefoodstore.app\",\"driver\":\"sendmail\",\"port\":\"465\",\"username\":\"thefoodstore@thefoodstore.app\",\"email_id\":\"thefoodstore@thefoodstore.app\",\"encryption\":\"tls\",\"password\":\"testFood1\"}',NULL,'2021-10-05 12:13:06'),(7,'delivery_charge','50',NULL,NULL),(8,'ssl_commerz_payment','{\"status\":\"1\",\"store_id\":\"foods61d57733df906\",\"store_password\":\"foods61d57733df906@ssl\"}',NULL,'2022-01-05 16:56:08'),(9,'paypal','{\"status\":\"1\",\"paypal_client_id\":null,\"paypal_secret\":null}',NULL,'2022-01-05 17:54:52'),(10,'stripe','{\"status\":\"1\",\"api_key\":null,\"published_key\":null}',NULL,'2022-01-05 17:54:58'),(11,'phone','+01747413273',NULL,NULL),(13,'footer_text','copyright@foodstore',NULL,NULL),(14,'address','AB Tower 131/2/GA (6th Floor Middle Badda Progati Sharani Opposite PRAN-RFL CENTRE Above DESH FURNITURE Dhaka, 1212',NULL,NULL),(15,'email_address','foodstore12@gmail.com',NULL,NULL),(16,'cash_on_delivery','{\"status\":\"1\"}',NULL,'2021-02-11 18:39:36'),(17,'email_verification','0',NULL,NULL),(18,'digital_payment','{\"status\":\"1\"}','2021-01-30 19:38:54','2021-01-30 19:38:58'),(19,'terms_and_conditions','<p>Ratification of the Agreement<br />\r\n* To be a member of the website of TheFoodStore.App, first of all it is required that you fill in the registration form and then agree and undertake to comply with the provisions of the user agreement for TheFoodStore.App. By filling in and ratifying the registration form or getting any services or ordering a meal using this system, the user agrees to be bound by the user agreement of TheFoodStore.App. * You are responsible for making all arrangements necessary for you to have access to the website. You are also responsible for ensuring that all persons who access the website through your Internet connection are aware of these website terms and that they comply with them. By viewing, using, accessing, browsing, or submitting any content or material on the site, you agree to these Terms of Use as a binding legal agreement between you and TheFoodStore.App, without limitation or qualification. The term &quot;you&quot; or &quot;You&quot; shall refer to any person or entity, who views, uses, accesses, browses or submits any content or material to the site. If you do not agree to these Terms of Use, then you may not use the site. TheFoodStore.App reserves the right to modify these Terms of Use at any time without prior notice. You agree that each visit you make to the sites shall be subject to the then-current Terms of Use, and continued use of the site now or following modifications in these Terms of Use confirms that you have read, accepted, and agreed to be bound by such modifications. The terms and conditions apply to TheFoodStore.App website and its associated applications on iPhone, iPad, Android, and mobile site platforms<br />\r\nDescription of the Services<br />\r\nTheFoodStore.App allows its members who ratify the agreement to order from shops online. TheFoodStore.App provides a way for you to communicate your orders to delivery shops displayed on this website.<br />\r\nThe purpose of this site is to provide a simple and convenient service to consumers, linking them to shops in their area that offer takeaway food. Interactive menus allow customers to build and submit orders at the click of a button.<br />\r\nWe have created the website to serve as a food court online market. TheFoodStore.App is a commercial service for food delivery online.<br />\r\nTheFoodStore.App does not sell or interfere in any way in the production of any food produced at the shops. But what this online market offers to the users is only providing the ability to search for and find local shops that deliver or make food available to their addresses and enables ordering this food through this website. The shops are obligated to comply with country local laws, rules, regulations, and standards pertaining to food preparation, sale, marketing and safety.<br />\r\n<br />\r\nHowever, it is important for users to understand that TheFoodStore.App does not in any way independently verify the credentials, representations or products of shops, the ingredients or the quality of any products, or that a shop is in compliance with applicable laws. Buyers must make themselves comfortable through information provided by shops on the website or as requested by buyers directly from the shops as to the quality and reliability of the shops, as well as to their compliance with applicable laws.<br />\r\nTheFoodStore.App does not in any way guaranty the quality of any food or that any food complies with applicable laws and does not guarantee matching the menu displayed on the site of what is actually provided to the users.<br />\r\n<br />\r\nIn addition, a shop may represent that food preparation is in accordance with special standards such as &quot;organic,&quot; &quot;macrobiotic&quot; or allergen-specific standards such as &quot;nut-free&quot;, &quot;gluten-free&quot;, or &quot;lactose-free&quot;. However, TheFoodStore.App does not independently investigate or verify such representations.<br />\r\nTheFoodStore.App shall not be liable or responsible for any food or services offered by shops that is unhealthy, is the cause of injury, that is otherwise unacceptable to buyers or that does not meet the expectation of buyers in any manner.<br />\r\n<br />\r\nBuyers are solely responsible for verifying the accuracy of delivery addresses, and TheFoodStore.App shall have no liability or responsibility for any such erroneous addresses. All food preparation and deliveries are the sole responsibility of the shop accepting the order. Please be aware that the shop will do everything they can to meet the delivery time specified, however delivery times may be affected by factors beyond their control and therefore cannot be guaranteed. We will inform you if we become aware of an unexpected delay.<br />\r\n<br />\r\nHow to make an order and how it is processed<br />\r\n<br />\r\nOnce you have selected your order from the menu of your chosen Delivery shop you will be given the opportunity to submit your order by clicking on &ldquo;Checkout&rdquo; button. Please note it is important that you check the information that you enter and correct any errors before clicking on the &ldquo;Checkout&rdquo; button since once you click on this input errors cannot be corrected. On receipt of your order, TheFoodStore.App will begin processing your order and we will send a message on the final page that your order has been received and sent successfully to the shop. Where any payment you make is not authorized you will be returned to the previous page on the website and we shall not be obliged to provide the services.<br />\r\n<br />\r\nOrder Cancellation<br />\r\n<br />\r\nYou have the right to cancel an order up to 5 minutes from placing the order on our website. While every effort is made to ensure that accurate pricing and descriptions are maintained, we reserve the right to cancel any order that is based on inaccurate information.<br />\r\n<br />\r\nAn order may be subsequently cancelled by a shop after you have received a confirmation that it has been sent to the shop. TheFoodStore.App and our partner shops reserve the right to cancel any order, before or after acceptance, and will notify you immediately of any such cancellation.<br />\r\nMembership system for TheFoodStore.App<br />\r\n<br />\r\nAny member of TheFoodStore.App has a &ldquo;user name&rdquo; and &ldquo;password&rdquo; which are determined by the member herself/himself. The &quot;user name&quot; is personal to the member and the same &ldquo;user name&rdquo; is not given to two different members. The &ldquo;password&rdquo; is only known by the user. The user can change the password at any time. It is solely under the responsibility of the user to select and protect the password. TheFoodStore.App is not liable for any problems, which may arise from the use of password. TheFoodStore.App informs the user about the promotions, which take place in the user&rsquo;s area and from which the user may benefit, by emails. TheFoodStore.App does not share the user information with the third party companies &ndash; the phone number may be shared with the shop which deals with take-out foods, in order to provide a faster and correct delivery. For the user to connect to the services, which require a membership of TheFoodStore.App, the user must enter the user name and password. This process is called &ldquo;login&rdquo; to TheFoodStore.App.<br />\r\n<br />\r\nBy using this site, you warrant that any personal information provided by you is true, accurate, current and complete in all respects and that you will notify us immediately of any changes to your personal information by updating your member profile on the site or by contacting us, you agree not to impersonate any other person or entity or to use a false name or a name that you are not authorized to use.<br />\r\n<br />\r\nYou are not allowed to register multiple memberships for use by the same person. Violation of this clause may result in termination of your membership.<br />\r\n<br />\r\nMembers&#39; passwords should be kept confidential at all times, and must not be shared or disclosed to anyone. You are responsible for all activities and orders that occur or are submitted through your membership. If you know or suspect that someone has knowledge of your password then you should contact us immediately.<br />\r\n<br />\r\nYou may not use the site for any unlawful or unauthorized purpose, including without limitation to: Distributing any unlawful, libelous, abusive, threatening, harmful, obscene or otherwise objectionable material.<br />\r\n<br />\r\nTransmitting material that constitutes a criminal offense, results in civil liability or otherwise breaches any laws, regulations or codes of practice.<br />\r\n<br />\r\nInterfering with any other persons use or enjoyment of the site.<br />\r\nDamaging, disabling or impairing the operation of this site or attempting to gain unauthorized access to this site or to networks connected to it, through hacking, spoofing or other such similar means.<br />\r\nResponsibilities of the Member<br />\r\n<br />\r\nDuring the use of the services of TheFoodStore.App, the member accepts and undertakes: The information in the registration form is correct; in the conditions that this information is required the member is the only responsible for any losses which may arise from any misinformation or inadequate information (ex. forgetting the password); and in these cases his/her membership may be terminated.<br />\r\nThe member is the sole responsible for all personal ideas, opinions, statements set forth by the member while using the services of TheFoodStore.App, all the files uploaded to TheFoodStore.App and the personal information sent, and that in no way TheFoodStore.App shall be held liable for these files, not to access any services provided in TheFoodStore.App unauthorized and in any way other that the one identified by TheFoodStore.App; not to change the software in any way; not to use the software which is identified as being changed; and to indemnify TheFoodStore.App for all material and moral losses in the event the member does not comply with the aforementioned articles, TheFoodStore.App shall not be responsible for any damages which may arise from reading of data belonging to any members by any unauthorized people, not to send any messages which are threatening, immoral, racially and contrary to the Laws of Kuwait and international agreements, any correspondences, titles, nicknames posted to the context shall not be contrary to the rules of public morality, good manners and laws, not to harass and/or threaten other users, or any of TheFoodStore.App live chat personnel, not to act in a way affecting the use of services by other users, not to post, print, distribute, circulate any amoral, inappropriate and unlawful materials and information which may give harm to the names of any people or institutions, not to advertise, sell or offer to sell any products or services, engage in any activities such as survey, competition or chain letter, not to send any information or programs which may give harm to the information or software in the computers of other users,<br />\r\nAll of the records or materials obtained by using the services of TheFoodStore.App are within the consent of the user; the user shall be absolutely responsible for any damages, loss of information or other losses caused by them in the user&rsquo;s computer; the user shall not demand any compensation for any losses arising from the use of the service, not to use the services of TheFoodStore.App.com for any commercial and advertising purposes without obtaining the consent of TheFoodStore.App TheFoodStore.App may monitor all system at any time or continuously.<br />\r\nTheFoodStore.App may use its system for commercial purposes, not to mail any information which is forbidden legally and circulate any mails which do not have authorization to be sent such as chain mail, malicious software, etc., not to record and misuse any personal information belonging to others, The member himself/herself is responsible for all kinds of acts made under the &ldquo;username&rdquo;, The clients must pay the service fee which is notified previously at the time of delivery of products; otherwise the products shall not be delivered to the clients. not to access the site or services using a third-party&#39;s account/registration without the express consent of the account holder; not to use the site for illegal purposes; not to commit any acts of infringement on the site or with respect to content on the site; not to use the site to engage in commercial activities apart from sanctioned use of TheFoodStore.App services; not to copy any content, including, but not limited to shop menu content and third-party reviews, for republication in print or online; not to create shop reviews or blog entries for or with any commercial or other purpose or intent that does not in good faith comport with the purpose or spirit of the site; not to attempt to gain unauthorized access to other computer systems from or through the site; not to interfere with another person&#39;s use and enjoyment of the site or another entity&#39;s use and enjoyment of the site; not to upload or transmit viruses or other harmful, disruptive or destructive files; and/or not to disrupt, interfere with, or otherwise harm or violate the security of the site, or any services, system resources, accounts, passwords, servers or networks connected to or accessible through the site or affiliated or linked sites (including those of our shop partners). All users who are minors in the jurisdiction in which they reside (generally under the age of 18) must have the permission of, and be directly supervised by, their parent or guardian to use the website. If you are a minor, you must have your parent or guardian read and agree to this Agreement prior to you using the website.<br />\r\nCredit or Debit cards used in placing orders through the online payment gateway on TheFoodStore.App website or applications must belong to the user. Otherwise, the user must attain the legal permission from the card owner to perform the transaction.<br />\r\n<br />\r\nVisitor material and conduct<br />\r\n<br />\r\nOther than personally identifiable information, which is covered under the TheFoodStore.App Privacy Policy, any material you transmit or post to this website will be considered non-confidential and non-proprietary. TheFoodStore.App will have no obligations with respect to such material. TheFoodStore.App and anyone we designate will be free to copy, disclose, distribute, incorporate and otherwise use that material and all data, images, sounds, text and other things embodied in it for any and all commercial or non-commercial purposes.<br />\r\nYou are prohibited from posting, uploading or transmitting to or from this website any material that:<br />\r\nBreaches any applicable local, national or international law;<br />\r\nIs unlawful or fraudulent. Amounts to unauthorized advertising; or Contains viruses or any other harmful programs. You may not misuse the website (including by hacking). Any comments or feedback that you submit through the website must not: Contain any defamatory, obscene or offensive material; Promote violence or discrimination; Infringe the intellectual property rights of another person; Breach any legal duty owed to a third party (such as a duty of confidence); Promote illegal activity or invade another&rsquo;s privacy; Give the impression that they originate from us; or Be used to impersonate another person or to misrepresent your affiliation with another person. The prohibited acts listed in the above paragraphs are non-exhaustive. You will pay TheFoodStore.App for all costs and damages which it incurs as a result of you breaching any of these restrictions. TheFoodStore.App will fully co-operate with any law enforcement authorities or court order requesting or directing us to disclose the identity or location of anyone posting any material in breach of the above paragraph.<br />\r\n<br />\r\nAuthority of TheFoodStore.App<br />\r\n<br />\r\nTheFoodStore.App may temporary suspend or completely cease the system operation at any time. TheFoodStore.App shall not have any responsibilities against the members of TheFoodStore.App or any third parties due to the temporarily suspension or completely cessation of the system operation. The user name and password shall be displayed and approved after the filling of the application parts to be submitted to the clients by TheFoodStore.App. TheFoodStore.App may prevent its clients who have filled in all parts or have connected although they have passwords from having a new password or from using their passwords for an indefinite period of time if it is deemed necessary by TheFoodStore.App. TheFoodStore.App does not warrant that its services shall be provided on time in a secure and complete way, the results obtained from the services shall be correct and reliable, and that the service quality shall meet the expectations. TheFoodStore.App has the right to back-up and delete all or some of the files, messages which are provided by the members during the use of services for some periods deemed suitable by TheFoodStore.App. TheFoodStore.App shall not be held responsible for back-up and delete processes. TheFoodStore.App has the ownership and copyrights arising from the ownership of the information, documents, software, designs, graphics and etc. which are produced by itself and/or bought from outside. The sales of TheFoodStore.App are limited to the current availability of menus of the firms provided in TheFoodStore.App. TheFoodStore.App is not responsible for any item ordered and not delivered by the shop due to unavailability. TheFoodStore.App has right to post any information, documents, software, designs, graphics, etc. (such as the messages, poets, reports/news, file posted to the bulletin board) which are member generated and uploaded to the system by the members and/or to transmit them to another place within the site deemed as appropriate by TheFoodStore.App. It is probable that this information is copied and/or posted by other users. In such cases, the users shall not demand any royalty from TheFoodStore.App The obligation to change the information in relation to the price and product specifications, which are provided to sell in TheFoodStore.App, belongs to the companies which have cyber shops in TheFoodStore.App. In the event of any misinformation relating to the price and specifications of products, TheFoodStore.App may correct this mistake by cancelling the order. TheFoodStore.App may provide transition for a member to other websites. In this case, the member agrees that TheFoodStore.App shall not be responsible for the context of the websites, which the member may access through its site. TheFoodStore.App may make any changes in the implementation of this agreement, and amend the existing articles or add new articles for the purpose of complying with any technical necessities and legislation which shall come into being in the future. TheFoodStore.App may change in time the services for which any membership is not required to a form, which requires membership. TheFoodStore.App may provide addition services, change some of the services partially or completely, or transform into a paid service. This site may be unavailable at certain times to allow for maintenance and upgrades. Although we will endeavour to notify customers in advance of any service unavailability, this cannot be guaranteed and we reserve the right to alter or withdraw the service at any time.<br />\r\nGuidelines for Reviews<br />\r\nReviews are approved based on the following criteria:<br />\r\nRELEVANCY<br />\r\nReviewers must have had an experience with the shop first hand.<br />\r\n<br />\r\nACCEPTABLE CONTENT TheFoodStore.App are not obligated to approve reviews on the site. A subset of the potential reasons for rejection are: Offensive Language: Profanity, abusive, racist, and hate language is not tolerated in our interactive sections. Irrelevant or non-indicative content Discrimination based on the grounds of religion, race, gender, national origin, age, marital status or disability. References to illegal activity or uncorrelated references towards society&rsquo;s traditions and values. Conflicts of interest: Competing shops are not allowed to post negative reviews. Violation of this might result in permanent removal from our website. Allegations of health code violations. Outdated and obsolete information<br />\r\n<br />\r\nNOT ENDORSED<br />\r\nReviews are not endorsed by TheFoodStore.App, and do not represent the views of TheFoodStore.App, our parent companies, our subsidiaries. TheFoodStore.App does not assume liability for any review or for any claims, liabilities or losses resulting from any use of our sites, or information on our site.<br />\r\nOWNED BY THEFOODSTORE.APP Reviews are owned by TheFoodStore.App exclusively in perpetuity. We have the right to reproduce, modify, translate, transmit, and/or distribute all materials relating to reviews. TheFoodStore.App is under no obligation to pay the author or anyone else for their reviews.<br />\r\nTermination of agreement<br />\r\n<br />\r\nTheFoodStore.App may terminate this agreement unilaterally at any time.<br />\r\n<br />\r\nRestrictions for Non-Personal and Non-Commercial Use<br />\r\n<br />\r\nYou agree that the consequences of commercial use or re-publication of content or information of TheFoodStore.App may lead to serious and incalculable monetary compensation that may not be a sufficient or appropriate remedy and that TheFoodStore.App will be entitled to temporary and permanent injunctive relief to prohibit such use.<br />\r\nProduct Delivery<br />\r\n<br />\r\nDuring any product delivery made by shops, if the client is not available in the address specified in the system, the meals ordered by the client shall not deliver to anywhere else. Within the framework of such a case, the member must accept all legal responsibilities arising from ordering a meal to an address where he/she does not exist.<br />\r\nPayment Methods<br />\r\n<br />\r\n1. Customer can choose between different payment methods provided on the platforms, which are currently the following: Cash on Delivery, local debit cards, Apple Pay (currently in UAE), Visa Checkout and credit cards.<br />\r\n2. THEFOODSTORE.APP reserves the right to provide other payment methods or to no longer offer certain payment methods.<br />\r\n3. Customer bindingly chooses the payment method when placing the respective order, provided that the customer chooses an online payment method, the payment will be processed by an external online payment provider cooperating with THEFOODSTORE.APP .<br />\r\n4. Card data will be stored for future orders by the external online payment providers, on the condition that the customer has given consent to the storage and future usage.<br />\r\n5. Customer is obliged to ensure sufficient cover of the respective account or, when using credit card, to use the credit card only within the card transaction limit. Customer has to refrain from causing unauthorized debit charge backs.<br />\r\n<br />\r\nPrice and Payment<br />\r\n<br />\r\nOnce your order has been accepted, this represents an agreement between you the customer and the shop. The shop has sole responsibility for this order. Cash payments are made directly to the shop upon delivery to fulfil the order. If you have chosen to pay with credit or debit card on the Site then the transaction is processed by TheFoodStore.App as agent of the shop. Delivery charges are calculated per order and based on the policy of the individual shop. Any delivery charges or any other fees will be displayed clearly in your Order Summary. Debit / Credit Cards:<br />\r\nPlease read the following terms of use and disclaimers carefully before using Debit / Credit Cards: The customer is liable to pay by cash upon delivery any extra charges the shop might charge as a result of the &quot;Special Request&quot; or the &quot;General Request&quot; placed by the customer. You may cancel the order if the delivery time exceeded the shop delivery promise time; your paid amount will be refunded back to your account. The customer order cancellation is limited to a maximum time of 5 minutes from the time of placing the order.<br />\r\nThe customer refund procedure might take 2-7 working days to process on the Debit /Credit Cards bank payment gateway. The customer has to follow on with the bank in case of any delay in crediting back the customer&rsquo;s account with the amount previously paid by the customer. We will send an email to the customer that contains a printout of the refund advice printed from Debit / Credit Cards bank payment gateway as reference in case the customer wants to revise the bank with. Customers using the Debit / Credit Cards facility are requested to be available on their respective contact numbers.<br />\r\nThe customer would be reimbursed by the shop in case the shop faced the inconvenience of a missing item (Reimbursement applicable only for the missing item and is subject to the shop own reimbursement policy). Credit or Debit cards used in placing orders through the online payment gateway on TheFoodStore.App website or applications must belong to the user. Otherwise, the user must attain the legal permission from the card owner to perform the transaction. The customer is entirely liable for placing an order using the Debit / Credit Cards facility after carefully reading all the terms &amp; conditions.<br />\r\n<br />\r\nValidity of TheFoodStore.App records<br />\r\nIn the disputes which may arise in relation to this agreement, the member agrees, states and warrants that any bookkeeping entry, microfilm, microfiche and computer records constitute a valid, binding, absolute and exclusive evidence; this article has the characteristics of an evidential contract, and that the member waives in advance all kinds of objections to the specified TheFoodStore.App records and the right to tender an oath in relation to the fact that these records are kept in due form.<br />\r\nGoverning law &amp; competent<br />\r\nThese Website Terms shall be governed by and construed in accordance with the law. Disputes arising in connection with these Website Terms (including non-contractual disputes) shall be subject to the exclusive jurisdiction of the courts.<br />\r\nRewards Program TheFoodStore.App (referred to hereinafter as the &lsquo;Company&rsquo;) may or may not consider launching a TheFoodStore.App Loyalty Reward Program (referred to hereinafter as the &lsquo;Program&rsquo;) operating under the terms and conditions as set out below.<br />\r\n1.Eligibility Only members and users of TheFoodStore.App within Bangladesh, and those who are selected and invited by the Company shall be eligible to join the Program. Such eligibility criteria may be subject to change at any time.<br />\r\n2. Acceptance and Disclosure The terms and conditions set out herein, together with the Company&rsquo;s Privacy Policy available on its website shall govern the Company&rsquo;s relationship with members of the Program including but not limited to the membership, expiration, redeeming and earning Program points. By using your Membership Account that you were invited to receive and redeem points of the Program, you agree that;<br />\r\n- You have read and accept these terms and conditions set out herein, - You consent to the collection, use, and disclosure of your personal data by the Company, the Program, and the Company&rsquo;s affiliates to any third party for any purpose related to the Program or the company&rsquo;s business.<br />\r\n-You accept and acknowledge the Privacy Policy of the Company available on the Company&rsquo;s website remain in effect.<br />\r\n3.Termination or Modification The Company reserves the right to modify at any time without notice its Program including but not limited to the Program benefits, awards, The program&rsquo;s Earning and Redemption Points as set in provision no. 4(referred to hereinafter as &lsquo;Provision No. 4&rsquo; ), and some or all of these terms and conditions set out herein in the program pages. Loyalty Members are responsible for remaining knowledgeable of the Program terms and conditions and any modifications that may occur to them. The Program Account member&rsquo;s continued participation in the Program will constitute the acceptance of any such modifications. The Company may terminate the Program, in whole or in part, with one-week prior notice to all active Program Members, and all unredeemed Points will be lost after the conclusion of the notice period without any obligation or liability. The Company can immediately terminate the Program Membership Account of an Account member, if in its reasonable opinion the account member has breached these terms and conditions, or behaved fraudulently, or has provided the company with false or misleading information. In the mentioned events the account member case will lose all the acquired benefits and any right of use.<br />\r\n4.Earning and Redemption The Company&rsquo;s Program membership allows its account members to earn and redeem points when making purchase orders through the Company&rsquo;s application and only within the U.A.E territory, and in accordance with the rules, requirements and specifications set out below:<br />\r\nUsers will benefit from a minimum of 2 points for every BDT 50/- spent and the opportunity to earn additional points from time to time as communicated by the Program.<br />\r\nProvided that the TheFoodStore.App Rewards Relationship is active and in good standing, as determined by TheFoodStore.App , TheFoodStore.App Rewards Points may be redeemed (i) in exchange for TheFoodStore.App Credit, Restaurant offers or other specific deals, as may be published from time to time on the TheFoodStore.App Rewards Section of the app.<br />\r\nDetails of the TheFoodStore.App Rewards are set out on the TheFoodStore.App Rewards App Section. Reasonable efforts have been made to ensure that the information contained in the TheFoodStore.App Rewards Catalogue is accurate. TheFoodStore.App is not responsible, and shall not be held responsible, for any errors, inaccuracies or omissions appearing therein.<br />\r\nUsers can exchange points for via the app for any of the items mentioned in the rewards section of the app, to offset any specified fees and/or charges normally applicable to the TheFoodStore.App Rewards user as determined by TheFoodStore.App . Redemption of rewards from TheFoodStore.App authorized merchants are subject to the terms and conditions as may be prescribed by the issuer or supplier thereof from time to time.<br />\r\nOnce issued, the redemption of credit and other vouchers are not exchangeable, returnable, refundable, or redeemable for cash or credit, nor will they be replaced in the event of loss, damage or destruction. Once submitted, an order for redemption cannot be cancelled, revoked, transferred or changed by the TheFoodStore.App Rewards Accountholder in any manner.<br />\r\n5.Expiration of points:<br />\r\nThe Program points earned from making a qualifying purchase as per the Loyalty Program Earning and Redemption Points Catalogue, are only valid for a period of three (3) months from the date of crediting the points to the member&rsquo;s account, and shall expire only in the event of not making any subsequent purchases during the mentioned three (3) months&rsquo; period.<br />\r\n6.Membership<br />\r\n<br />\r\nThe Company&rsquo;s Program membership cannot be duplicated, shared, gifted and/or used for any purpose other than those provided in Provision No. 4, and the terms and conditions set out herein . The Program membership or points may not be transferred or used, for any reason, by anyone other than the account member.<br />\r\n7. Claims; Cancelled, Modified, Delayed Orders<br />\r\nIn case of an order being cancelled or modified by the account member, the points earned from this order will be deducted from the member&rsquo;s loyalty account. In case of an order being delivered to the member after the estimated delivery time, for any reason, no additional points will be earned as result of this delay. Redemption award claims shall not be accepted for any backdated access and purchases made by the account member as a Guest.<br />\r\n8. Responsibility The Company shall not be held responsible for any direct or indirect consequences associated with any force majeure events or malfunction beyond its control, and/or any direct or indirect consequences associated to the member&rsquo;s non-accordance use or fraudulent use with these terms and conditions.<br />\r\n9. Governing Law These terms and conditions and any disputes or claims arising out of, or in connection with, shall be governed by and construed in accordance with the law of the United Arab Emirates.</p>',NULL,'2021-09-09 14:13:07'),(20,'fcm_topic','',NULL,NULL),(21,'fcm_project_id','3f34f34',NULL,NULL),(22,'push_notification_key','AAAAIcptTHI:APA91bG5iTBm4rBHfAeJZjMlwqtw5O50faVwAX4IPpJIsy3llvqNfM_24hAGVdOlWNWG_tFGZhdn0pED-IvSCkbQl3thsfJS_65XmoQYfM83A9irM8dCoY0kll3w42KxlIgFZqYI5hTL',NULL,NULL),(24,'order_pending_message','{\"status\":1,\"message\":\"Your order has been placed successfully.\"}',NULL,NULL),(25,'order_processing_message','{\"status\":1,\"message\":\"Your order is going to the cook\"}',NULL,NULL),(26,'out_for_delivery_message','{\"status\":0,\"message\":\"Order out for delivery.\"}',NULL,NULL),(27,'order_delivered_message','{\"status\":1,\"message\":\"delivered\"}',NULL,NULL),(28,'delivery_boy_assign_message','{\"status\":1,\"message\":\"boy assigned\"}',NULL,NULL),(29,'delivery_boy_start_message','{\"status\":1,\"message\":\"start delivery\"}',NULL,NULL),(30,'delivery_boy_delivered_message','{\"status\":1,\"message\":\"boy delivered\"}',NULL,NULL),(32,'order_confirmation_msg','{\"status\":1,\"message\":\"Your order has been confirmed.\"}',NULL,NULL),(33,'razor_pay','{\"status\":\"1\",\"razor_key\":null,\"razor_secret\":null}','2021-02-14 10:15:12','2022-01-05 17:54:43'),(34,'location_coverage','{\"status\":1,\"longitude\":\"91.410747\",\"latitude\":\"22.986282\",\"coverage\":\"20\"}',NULL,NULL),(35,'minimum_order_value','4',NULL,NULL),(36,'point_per_currency','2',NULL,NULL),(37,'internal_point','{\"status\":\"1\"}','2021-04-24 01:50:19','2022-01-05 17:52:25'),(38,'senang_pay','{\"status\":\"1\",\"secret_key\":null,\"merchant_id\":null}','2021-04-24 01:58:21','2022-01-05 17:55:15'),(39,'privacy_policy','<h3>THESE PRIVACY POLICY APPLY TO THE WEBSITE WWW.THEFOODSTORE.APP (BANGLADESH) (THE &quot;SITE&quot;). PLEASE READ THIS STATEMENT CAREFULLY. IF YOU DO NOT WISH TO BE BOUND BY THESE TERMS AND CONDITIONS THEN YOU SHOULD NOT ACCESS THIS SITE. ACCESS OF THIS SITE BY YOU SHALL BE DEEMED TO BE YOUR ACCEPTANCE OF THESE TERMS AND CONDITIONS.<br />\r\nWE COLLECT INFORMATION FROM AND ABOUT YOU:</h3>\r\n\r\n<p><br />\r\na. <strong>Contact Information-</strong> Personal identifiable information such as- Your name, address, telephone number, e-mail addresses, and any other information you may voluntarily provide. You will have the choice whether or not to disclose such Personal Information in the above activities; however, some parts of the Site and some services may be more difficult or impossible to use if you choose not to disclose Personal Information.<br />\r\n<br />\r\nb.<strong> Demographic Information -</strong> We may collect information about our services you like or products you buy. We might collect this as part of a survey, for example.</p>\r\n\r\n<p><br />\r\nc<strong>. Other information-</strong> If you use our website, we may collect information about your computer location or the browser you&#39;re using. We might look at what site you came from, or what site you visit when you leave us.</p>\r\n\r\n<p><br />\r\nWE COLLECT INFORMATION IN DIFFERENT WAYS: We use third party analytics tools to help understand the use of the Site. Many of these tools collect the information sent by your browser as part of interactions with the Site, including cookies and your IP address or device ID. These analytics tools also receive this information and the third party use of this information governed by the third party&rsquo;s privacy policy. One type of cookie/tool We may use is called &ldquo;Google Analytics, Google Analytics collects information such as how often users visit this Site, what pages they visit when they do so, and what other sites they used prior to coming to this Site. We use the information We obtain from Google Analytics and other similar analytics tools only to improve this Site and Our other web sites. Google Analytics collects only the IP address assigned to you on the date you visit this Site, rather than your name or other identifying information. We do not combine the information collected through the use of Google Analytics with personally identifiable information. Google&rsquo;s ability to use and share information collected by Google Analytics about your visits to this site is restricted by the Google Analytics Terms of Use and the Google Privacy Policy. We may use other analytics tools to analyse, administering and improve the Site. You can disable cookies on your computer or device by indicating this in the preferences or options menus however certain functionalities of the Site may not be available to you if you do so. If you do not want cookies to be accessible by this website, you should adjust the settings on your browser program to deny or disable the use of cookies. You can find additional information on cookies and web beacons at http://www.allaboutcookies.org. The major browsers have attempted to implement the draft &ldquo;Do Not Track&rdquo; (&ldquo;DNT&rdquo;) standard of the World Wide Web Consortium (&ldquo;W3C&rdquo;) in their latest releases. As this standard has not been finalized, this website is not compatible with DNT. WITH WHOM WE MAY SHARE THE INFORMATION WITH: WWW.THEFOODSTORE.APP is the Part of A CUSTOM PALETTE LTD, and may share personal information collected on this site with any member of A CUSTOM PALETTE LTD, its franchisees, and any other future subsidiaries or affiliates. This Privacy Policy applies if Company shares your Personal Information collected on this Site with any other Yum Brands members. If you choose to provide your Personal Information to other members of Yum Brands through their respective websites, then those respective Privacy Policies will apply. Company will not sell, rent, loan, transfer, or otherwise disclose any Personal Information to third parties except as set forth in this Privacy Policy. Company may share Personal Information with third parties (which do not include affiliated entities or franchisees) under the following circumstances: (i) in connection with a court order, subpoena, government investigation, or when otherwise required by law or to protect any person or entity; (ii) in the event of an actual or contemplated corporate sale, merger, acquisition, or similar event; or (iii) working with third party companies to support the Site&rsquo;s technical operation or execute a specific promotion or program (such as providing responses to the Guest Comments Page, or conduct surveys. In the event We disclose Personal Information to any third party for the purposes of executing a specific promotion or program or providing services to Us, the Company will enter into written agreements with such third parties requiring use of the Personal Information for the limited purposes provided and compliance with Company&rsquo;s privacy policies and applicable laws. To avoid your Personal Information from being shared with a third party, you can choose not to use the affected service or participate in the affected promotional activity. &bull; We may share the information with the third parties who perform services on our behalf. For example, we share information with the vendors who help us manage our online registration process or who fulfil your purchase. Some vendors may be located outside of Bangladesh. &bull; We may share information if we think we have to in order to comply with the law or to protect ourselves. For example, we will share information to respond to a court order or subpoena. We may also share it if a government agency or investigatory body requests. Or, we might also share information when we are investigating potential fraud. This might include fraud we think has happened during a sweepstakes or promotion. &bull; We may share information with any successor to all or part of our business. For example, if part of our business is sold we may give our customer list as part of that transaction. &bull; We may share information with our business partners. For example, if we are working with a third party and running a joint promotion. THESE SITES ARE NOT INTENDED FOR CHILDREN. Our Sites are meant for adults. We do not knowingly collect personally identifiable information from children under 18 without permission from a parent or guardian. If you are a parent or a legal guardian and think your child under 18 has given us information, you can email us here CUSTOMERCARE@THEFOODSTORE.APP . You can also write to us at the address listed at the end of the policy. WE USE STANDARD SECURITY MEASURES. The internet is not 100% secure. We cannot promise that your use of our sites will be completely safe. We encourage you to use caution when using the internet. This include not sharing your passwords. We keep personal information as long as it is necessary or relevant for the practices described in the is policy. We also keep information as otherwise required by law. HOW DOES COMPANY PROTECT THE SECURITY OF MY PERSONAL INFORMATION? To prevent unauthorized access, maintain data accuracy, and ensure the correct use of your Personal Information, Company has put in place, and has required its service providers to put in place, certain reasonable physical, electronic, managerial and security procedures to safeguard and secure the Personal Information collected through the Site. We cannot guarantee, however, that our measures will not prevent a third party from circumventing our security measures and unlawfully intercept or access transmissions or private communications, or where an error may occur in the administration of this Site. As such, Company recommends that you use caution whenever submitting Personal Information online. HOW CAN I STOP RECEIVING NOTICES ABOUT FUTURE OFFERS OR TO STOP MY PERSONAL INFORMATION FROM BEING SHARED WITH THIRD PARTIES? Users, who initially opted-in to receive future offers or promotional materials, or to allow the sharing of Personal Information with third parties, may subsequently opt-out by sending an e-mail to CUSTOMERCARE@THEFOODSTORE.APP. Company will implement the change promptly. Company will send an acknowledgement or confirmation of the request to the e-mail address on file and reserves the right to request information to verify the identity of the individual making the request. HOW DO I CORRECT OR UPDATE MY PERSONAL INFORMATION? As a registered User, you control the accuracy of your Personal Information. If your Personal Information changes, feel free to correct, update or delete/deactivate it by e-mailing CUSTOMERCARE@THEFOODSTORE.APP If you wish to review your Personal Information that Company has on record, you may contact CUSTOMERCARE@THEFOODSTORE.APP company will implement the change promptly. Company will send an acknowledgement or confirmation of the request to the e-mail address on file and reserves the right to request information to verify the identity of the individual making the request. DOES COMPANY&rsquo;S SITE LINK TO OTHER SITES? This Site may contain links to other websites that may not be owned or operated by Company. Company cannot control nor is responsible for the privacy practices or content of such other websites. Company encourages you to read the privacy statements of each and every website that collects personally identifiable information. This Privacy Policy applies solely to Personal Information collected on this Site. WHAT IS THE EFFECTIVE DATE OF COMPANY&rsquo;S PRIVACY POLICY AND HOW WILL COMPANY NOTIFY ME OF CHANGES TO ITS PRIVACY POLICY? The effective date of this Privacy Policy is listed below. Company will post any changes on the Site&rsquo;s Homepage, so visitors are always aware of any changes to what information We collect, how We use it, and under what circumstances We disclose it. If We decide to use your Personal Information in a manner different than first communicated, Company will notify users by e-mail to the e-mail addresses on record. Users will then be given a choice as to whether or not their Personal Information can be used in the new manner. In the event that Company goes through a business transition, such as a merger, another company acquires Company or its Affiliates, or Company sells a portion of its assets, your personal information will, in most instances, be part of the assets transferred. At least ten days prior to the change of ownership or control, you will be informed of this exchange and its effects via prominent notice on Our site. If as a result of a business transition, your personally identifiable information will be used in a manner different from that stated at the time of collection, you will be given the choice to opt-out. TRADEMARK NOTICE This Website contains many valuable trademarks owned and used by HCL-Bangladesh. and its subsidiaries and affiliates throughout the world. These trademarks are used to distinguish HCL-Bangladesh&rsquo;s quality products and services. These trademarks and related proprietary property are protected from reproduction and simulation under national and international laws and are not to be copied or used in any manner or in any medium without the express written permission of HCL-Bangladesh. COPYRIGHT NOTICE The text, graphics (except the trademarks as noted above) and HTML and ASP.NET code contained in this Website are the exclusive property of the Company. Except where otherwise noted, the text, graphics and webpage code contained here may not be modified, copied, distributed, displayed, reproduced uploaded or transmitted in any form or by any means without the prior written permission of the Company. Except that you may print and download portions of material from the different areas of the site solely for your own non-commercial use provided that you agree not to change or delete any copyright or proprietary notices from the materials.<br />\r\nHOW DO I CONTACT THE COMPANY?<br />\r\nIf you have any further questions concerning the Company&rsquo;s Privacy Policy and the use of your Personal Information, please contact INFO@THEFOODSTORE.APP<br />\r\nCorporate off:<br />\r\nA CUSTOM PALETTE LTD<br />\r\nHOUSE 26, ROAD 34, GULSHAN 2<br />\r\nDHAKA, BANGLADESH</p>',NULL,'2021-09-09 14:10:59'),(40,'about_us','<p><strong>The Foodstore App</strong> provides a contactless ordering and payment experience. It&rsquo;s just like having a Food court in your pocket, only it doesn&rsquo;t weight tons and have people that work inside it. Then there&rsquo;s the offers and deals you can&rsquo;t find anywhere else. It&rsquo;s like a VIP club of rewards. Only it&rsquo;s not really secret. In fact, please don&rsquo;t keep it a secret. Tell everyone!<br />\r\n<br />\r\nApp Features:<br />\r\n<br />\r\n&middot; Find your nearest mobile order enabled The Food Store App center<br />\r\n&middot; Browse the restaurant menu by category<br />\r\n&middot; Order and pay ahead with our contactless ordering and payment experience<br />\r\n&middot; Buy, earn points, and redeem rewards with The Food Store App<br />\r\n&middot; Special mobile app-only Offers, Deals and App Exclusives<br />\r\n&middot; Enable push notifications and never miss a great deal</p>\r\n\r\n<p><br />\r\nOwned by <a href=\"http://custompalettes.com\">A Custom Palette Ltd.</a> we pledge to serve you best.<br />\r\nGood food at your fingertip!<strong><em> </em></strong></p>',NULL,'2021-10-15 22:07:46'),(42,'paystack','{\"status\":\"1\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}','2021-05-04 14:38:35','2022-01-05 17:55:08'),(43,'time_zone','Asia/Dhaka',NULL,NULL),(44,'point_per_refer',NULL,NULL,NULL),(45,'pagination_limit','20',NULL,NULL);
/*!40000 ALTER TABLE `business_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `offer_id` bigint DEFAULT NULL,
  `qty` decimal(8,2) NOT NULL DEFAULT '0.00',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (101,'68c22cd0a76fe4bd54ba',2,NULL,1.00,NULL,'2023-11-16','2023-11-13 05:45:42','2023-11-13 05:48:32','1','1',NULL),(102,'kcFRidoy3',3,NULL,1.00,NULL,'2023-11-16','2023-11-13 05:51:09','2023-11-13 05:51:09','1','1',NULL),(103,'73eb8ffda25ccf2f7bc7',1,NULL,1.00,NULL,'2023-11-16','2023-11-13 06:02:08','2023-11-13 06:02:08','1','1',NULL),(104,'628c422d127e19e0ebef',2,NULL,1.00,NULL,'2023-11-16','2023-11-13 06:10:32','2023-11-13 06:10:32','1','1',NULL),(105,NULL,2,NULL,1.00,NULL,'2023-11-16','2023-11-13 06:24:45','2023-11-13 06:25:45','1','1','233');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int NOT NULL,
  `position` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Test',0,0,1,'2023-10-11 08:56:19','2023-10-11 08:56:19','2023-10-11-652663337b876.png'),(2,'Category 1',0,0,1,'2023-11-07 06:29:16','2023-11-07 06:29:16','2023-11-07-6549d93c292ff.png'),(3,'Sub Category',1,1,1,'2023-11-07 06:29:33','2023-11-07 06:29:33','def.png');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyes`
--

DROP TABLE IF EXISTS `companyes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companyes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bin_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyes`
--

LOCK TABLES `companyes` WRITE;
/*!40000 ALTER TABLE `companyes` DISABLE KEYS */;
INSERT INTO `companyes` VALUES (1,'ACPL','acpl@gmail.com','01925484921','2023-10-04-651d12be08cad.png','$2y$10$ouskmfMBGQHuYyJfbwSHsuEm4/1sp1YfDSF1mDgoZKy2W3uoIDdLK',NULL,'Dhaka',1,'2023-10-04 07:22:38','2023-10-04 07:22:38',NULL);
/*!40000 ALTER TABLE `companyes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Tanjie','tanjirislam7@gmail.com','THis is tanjir','HElllo','2023-10-14 09:07:14','2023-10-14 09:07:14',NULL),(2,'Ezra Trujillo','sicomi@mailinator.com','werwer','ewerwr','2023-10-14 09:07:43','2023-10-14 09:07:43',NULL),(3,'Ezra Trujillo','sicomi@mailinator.com','werwer','ewerwr','2023-10-14 09:08:39','2023-10-14 09:08:39',NULL),(4,'Tanjir','tanjirislam7@gmail.com','HEllo','Thewrtuiert','2023-10-14 09:09:15','2023-10-14 09:09:15',NULL),(5,'Tanjir','tanjirislam7@gmail.com','HEllo','Thewrtuiert','2023-10-14 09:09:28','2023-10-14 09:09:28',NULL),(6,'Tanjir','tanjirislam7@gmail.com','HEllo','Thewrtuiert','2023-10-14 09:10:03','2023-10-14 09:10:03',NULL),(7,'Tanjir','tanjirislam7@gmail.com','HEllo','Thewrtuiert','2023-10-14 09:10:41','2023-10-14 09:10:41',NULL),(8,'Tanjir','tanjirislam7@gmail.com','HEllo','Thewrtuiert','2023-10-14 09:14:52','2023-10-14 09:14:52',NULL),(9,'Tanjir','tanjirislam7@gmail.com','HEllo','Thewrtuiert','2023-10-14 09:32:54','2023-10-14 09:32:54',NULL),(10,'Tanjir','tanjirislam7@gmail.com','HEllo','Thewrtuiert','2023-10-14 09:34:22','2023-10-14 09:34:22',NULL),(11,'Tanjir','tanjirislam7@gmail.com','HEllo','Thewrtuiert','2023-10-14 09:48:00','2023-10-14 09:48:00',NULL),(12,'Ezra Trujilloq','sicomiq@mailinator.com','sdf','ewerwr','2023-10-14 10:01:49','2023-10-14 10:01:49',NULL),(13,'Ezra Trujilloq','sicomiq@mailinator.com','sdf','ewerwr','2023-10-14 10:02:22','2023-10-14 10:02:22',NULL),(14,'Ezra Trujilloq','sicomiq@mailinator.com','sdf','ewerwr','2023-10-14 10:02:45','2023-10-14 10:02:45',NULL),(15,'Ezra Trujilloq','sicomiq@mailinator.com','sdf','ewerwr','2023-10-14 10:03:22','2023-10-14 10:03:22',NULL),(16,'Ezra Trujilloq','sicomiq@mailinator.com','sdf','ewerwr','2023-10-14 10:03:56','2023-10-14 10:03:56',NULL),(17,'Ezra Trujilloq','sicomiq@mailinator.com','sdf','ewerwr','2023-10-14 10:04:02','2023-10-14 10:04:02',NULL),(18,'Ezra Trujilloq','sicomiq@mailinator.com','sdf','ewerwr','2023-10-14 10:04:14','2023-10-14 10:04:14',NULL),(19,'Ezra Trujilloq','sicomiq@mailinator.com','sdf','ewerwr','2023-10-14 10:10:58','2023-10-14 10:10:58',NULL),(20,'Ezra Trujilloq','sicomiq@mailinator.com','sdf','ewerwr','2023-10-14 10:12:47','2023-10-14 10:12:47',NULL),(21,'Ezra Trujilloq','sicomiq@mailinator.com','sdf','ewerwr','2023-10-14 10:12:58','2023-10-14 10:12:58',NULL),(22,'Ezra Trujilloq','sicomiq@mailinator.com','sdf','ewerwr','2023-10-14 10:13:28','2023-10-14 10:13:28',NULL),(23,'Ezra Trujilloq','sicomiq@mailinator.com','sdf','ewerwr','2023-10-14 10:15:14','2023-10-14 10:15:14',NULL),(24,'Herman Buckley','caxywejeha@mailinator.com','rewrewr','werwerwer','2023-10-14 10:16:56','2023-10-14 10:16:56',NULL),(25,'Herman Buckley','caxywejeha@mailinator.com','rewrewr','werwerwer','2023-10-14 10:17:02','2023-10-14 10:17:02',NULL),(26,'Herman Buckley','caxywejeha@mailinator.com','rewrewr','werwerwer','2023-10-14 10:20:58','2023-10-14 10:20:58',NULL),(27,'Ezra Trujillo','sicomi@mailinator.com','dsd','dsfsdg','2023-10-14 10:28:07','2023-10-14 10:28:07',NULL),(28,'Ezra Trujillo','sicomi@mailinator.com','dsd','dsfsdg','2023-10-14 10:28:20','2023-10-14 10:28:20',NULL),(29,'Ezra Trujillo','sicomi@mailinator.com','dsd','dsfsdg','2023-10-14 10:29:03','2023-10-14 10:29:03',NULL),(30,'Ezra Trujillo','sicomi@mailinator.com','dsd','dsfsdg','2023-10-14 10:29:16','2023-10-14 10:29:16',NULL),(31,'Ezra Trujillo','sicomi@mailinator.com','dsd','dsfsdg','2023-10-14 10:29:24','2023-10-14 10:29:24',NULL),(32,'Ezra Trujillo','sicomi@mailinator.com','dsd','dsfsdg','2023-10-14 10:30:38','2023-10-14 10:30:38',NULL),(33,'Ezra Trujillo','sicomi@mailinator.com','dsd','dsfsdg','2023-10-14 10:31:31','2023-10-14 10:31:31',NULL),(34,'Ezra Trujillo','sicomi@mailinator.com','dsd','dsfsdg','2023-10-14 10:33:01','2023-10-14 10:33:01',NULL),(35,'Ezra Trujillo','sicomi@mailinator.com','dsdrs','dsfsdg','2023-10-14 10:34:57','2023-10-14 10:34:57',NULL),(36,'Ezra Trujillo','sicomi@mailinator.com','dsdrs','dsfsdg','2023-10-14 10:35:00','2023-10-14 10:35:00',NULL),(37,'Herman Buckley','caxywejeha@mailinator.com','4t546','rgtrdgf','2023-10-14 10:35:12','2023-10-14 10:35:12',NULL),(38,'Herman Buckley','caxywejeha@mailinator.com','4t546','rgtrdgf','2023-10-14 10:36:16','2023-10-14 10:36:16',NULL),(39,'Herman Buckley','caxywejeha@mailinator.com','4t546','rgtrdgf','2023-10-14 10:36:18','2023-10-14 10:36:18',NULL),(40,'Ezra Trujillo','sicomi@mailinator.com','erere','ererer','2023-10-14 10:36:29','2023-10-14 10:36:29',NULL),(41,'Ezra Trujillo','sicomi@mailinator.com','erere','ererer','2023-10-14 10:36:35','2023-10-14 10:36:35',NULL),(42,'Ezra Trujillo','sicomi@mailinator.com','erere','ererer','2023-10-14 10:37:05','2023-10-14 10:37:05',NULL),(43,'Ezra Trujillo','sicomi@mailinator.com','erere','ererer','2023-10-14 10:38:17','2023-10-14 10:38:17',NULL),(44,'Ezra Trujillo','sicomi@mailinator.com','erere','ererer','2023-10-14 10:39:58','2023-10-14 10:39:58',NULL),(45,'dsfds','sicomi@mailinator.com','fdgfg','dg','2023-10-14 10:40:14','2023-10-14 10:40:14',NULL),(46,'dsfds','sicomi@mailinator.com','fdgfg','dg','2023-10-14 10:40:25','2023-10-14 10:40:25',NULL),(47,'dsfds','sicomi@mailinator.com','fdgfg','dg','2023-10-14 10:40:27','2023-10-14 10:40:27',NULL),(48,'Yetta Battle','vukawikuk@mailinator.com','Ex adipisicing ipsa','In recusandae Expli','2023-10-14 10:41:06','2023-10-14 10:41:06',NULL),(49,'Yetta Battle','vukawikuk@mailinator.com','Ex adipisicing ipsa','In recusandae Expli','2023-10-14 10:46:58','2023-10-14 10:46:58',NULL),(50,'Yetta Battle','vukawikuk@mailinator.com','Ex adipisicing ipsa','In recusandae Expli','2023-10-14 10:48:53','2023-10-14 10:48:53',NULL),(51,'Ezra Trujillo','sicomi@mailinator.com','sdf','asasa','2023-10-14 10:49:08','2023-10-14 10:49:08',NULL),(52,'Ezra Trujillo','sicomi@mailinator.com','sdf','asasa','2023-10-14 10:56:52','2023-10-14 10:56:52',NULL),(53,'Ezra Trujillo','sicomi@mailinator.com','sdf','asasa','2023-10-14 10:56:55','2023-10-14 10:56:55',NULL),(54,'Ezra Trujillo','sicomi@mailinator.com','sdf','asasa','2023-10-14 10:57:27','2023-10-14 10:57:27',NULL),(55,'Ezra Trujillo','sicomi@mailinator.com','sdf','wrw','2023-10-15 07:23:45','2023-10-15 07:23:45',NULL);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coupon_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'Test Coupon','HELLO70','2023-11-05','2023-11-10',500.00,0.00,70.00,'amount',1,'2023-11-05 08:53:02','2023-11-05 08:53:02','first_order',NULL),(2,'Test Coupon','Test','2023-11-06','2023-11-20',2.00,0.00,50.00,'amount',1,'2023-11-13 06:24:28','2023-11-13 06:24:28','first_order',NULL);
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'US Dollar','USD','$',1.00,NULL,NULL),(2,'Canadian Dollar','CAD','CA$',1.00,NULL,NULL),(3,'Euro','EUR','€',1.00,NULL,NULL),(4,'United Arab Emirates Dirham','AED','د.إ.‏',1.00,NULL,NULL),(5,'Afghan Afghani','AFN','؋',1.00,NULL,NULL),(6,'Albanian Lek','ALL','L',1.00,NULL,NULL),(7,'Armenian Dram','AMD','֏',1.00,NULL,NULL),(8,'Argentine Peso','ARS','$',1.00,NULL,NULL),(9,'Australian Dollar','AUD','$',1.00,NULL,NULL),(10,'Azerbaijani Manat','AZN','₼',1.00,NULL,NULL),(11,'Bosnia-Herzegovina Convertible Mark','BAM','KM',1.00,NULL,NULL),(12,'Bangladeshi Taka','BDT','৳',1.00,NULL,NULL),(13,'Bulgarian Lev','BGN','лв.',1.00,NULL,NULL),(14,'Bahraini Dinar','BHD','د.ب.‏',1.00,NULL,NULL),(15,'Burundian Franc','BIF','FBu',1.00,NULL,NULL),(16,'Brunei Dollar','BND','B$',1.00,NULL,NULL),(17,'Bolivian Boliviano','BOB','Bs',1.00,NULL,NULL),(18,'Brazilian Real','BRL','R$',1.00,NULL,NULL),(19,'Botswanan Pula','BWP','P',1.00,NULL,NULL),(20,'Belarusian Ruble','BYN','Br',1.00,NULL,NULL),(21,'Belize Dollar','BZD','$',1.00,NULL,NULL),(22,'Congolese Franc','CDF','FC',1.00,NULL,NULL),(23,'Swiss Franc','CHF','CHf',1.00,NULL,NULL),(24,'Chilean Peso','CLP','$',1.00,NULL,NULL),(25,'Chinese Yuan','CNY','¥',1.00,NULL,NULL),(26,'Colombian Peso','COP','$',1.00,NULL,NULL),(27,'Costa Rican Colón','CRC','₡',1.00,NULL,NULL),(28,'Cape Verdean Escudo','CVE','$',1.00,NULL,NULL),(29,'Czech Republic Koruna','CZK','Kč',1.00,NULL,NULL),(30,'Djiboutian Franc','DJF','Fdj',1.00,NULL,NULL),(31,'Danish Krone','DKK','Kr.',1.00,NULL,NULL),(32,'Dominican Peso','DOP','RD$',1.00,NULL,NULL),(33,'Algerian Dinar','DZD','د.ج.‏',1.00,NULL,NULL),(34,'Estonian Kroon','EEK','kr',1.00,NULL,NULL),(35,'Egyptian Pound','EGP','E£‏',1.00,NULL,NULL),(36,'Eritrean Nakfa','ERN','Nfk',1.00,NULL,NULL),(37,'Ethiopian Birr','ETB','Br',1.00,NULL,NULL),(38,'British Pound Sterling','GBP','£',1.00,NULL,NULL),(39,'Georgian Lari','GEL','GEL',1.00,NULL,NULL),(40,'Ghanaian Cedi','GHS','GH¢',1.00,NULL,NULL),(41,'Guinean Franc','GNF','FG',1.00,NULL,NULL),(42,'Guatemalan Quetzal','GTQ','Q',1.00,NULL,NULL),(43,'Hong Kong Dollar','HKD','HK$',1.00,NULL,NULL),(44,'Honduran Lempira','HNL','L',1.00,NULL,NULL),(45,'Croatian Kuna','HRK','kn',1.00,NULL,NULL),(46,'Hungarian Forint','HUF','Ft',1.00,NULL,NULL),(47,'Indonesian Rupiah','IDR','Rp',1.00,NULL,NULL),(48,'Israeli New Sheqel','ILS','₪',1.00,NULL,NULL),(49,'Indian Rupee','INR','₹',1.00,NULL,NULL),(50,'Iraqi Dinar','IQD','ع.د',1.00,NULL,NULL),(51,'Iranian Rial','IRR','﷼',1.00,NULL,NULL),(52,'Icelandic Króna','ISK','kr',1.00,NULL,NULL),(53,'Jamaican Dollar','JMD','$',1.00,NULL,NULL),(54,'Jordanian Dinar','JOD','د.ا‏',1.00,NULL,NULL),(55,'Japanese Yen','JPY','¥',1.00,NULL,NULL),(56,'Kenyan Shilling','KES','Ksh',1.00,NULL,NULL),(57,'Cambodian Riel','KHR','៛',1.00,NULL,NULL),(58,'Comorian Franc','KMF','FC',1.00,NULL,NULL),(59,'South Korean Won','KRW','CF',1.00,NULL,NULL),(60,'Kuwaiti Dinar','KWD','د.ك.‏',1.00,NULL,NULL),(61,'Kazakhstani Tenge','KZT','₸.',1.00,NULL,NULL),(62,'Lebanese Pound','LBP','ل.ل.‏',1.00,NULL,NULL),(63,'Sri Lankan Rupee','LKR','Rs',1.00,NULL,NULL),(64,'Lithuanian Litas','LTL','Lt',1.00,NULL,NULL),(65,'Latvian Lats','LVL','Ls',1.00,NULL,NULL),(66,'Libyan Dinar','LYD','د.ل.‏',1.00,NULL,NULL),(67,'Moroccan Dirham','MAD','د.م.‏',1.00,NULL,NULL),(68,'Moldovan Leu','MDL','L',1.00,NULL,NULL),(69,'Malagasy Ariary','MGA','Ar',1.00,NULL,NULL),(70,'Macedonian Denar','MKD','Ден',1.00,NULL,NULL),(71,'Myanma Kyat','MMK','K',1.00,NULL,NULL),(72,'Macanese Pataca','MOP','MOP$',1.00,NULL,NULL),(73,'Mauritian Rupee','MUR','Rs',1.00,NULL,NULL),(74,'Mexican Peso','MXN','$',1.00,NULL,NULL),(75,'Malaysian Ringgit','MYR','RM',1.00,NULL,NULL),(76,'Mozambican Metical','MZN','MT',1.00,NULL,NULL),(77,'Namibian Dollar','NAD','N$',1.00,NULL,NULL),(78,'Nigerian Naira','NGN','₦',1.00,NULL,NULL),(79,'Nicaraguan Córdoba','NIO','C$',1.00,NULL,NULL),(80,'Norwegian Krone','NOK','kr',1.00,NULL,NULL),(81,'Nepalese Rupee','NPR','Re.',1.00,NULL,NULL),(82,'New Zealand Dollar','NZD','$',1.00,NULL,NULL),(83,'Omani Rial','OMR','ر.ع.‏',1.00,NULL,NULL),(84,'Panamanian Balboa','PAB','B/.',1.00,NULL,NULL),(85,'Peruvian Nuevo Sol','PEN','S/',1.00,NULL,NULL),(86,'Philippine Peso','PHP','₱',1.00,NULL,NULL),(87,'Pakistani Rupee','PKR','Rs',1.00,NULL,NULL),(88,'Polish Zloty','PLN','zł',1.00,NULL,NULL),(89,'Paraguayan Guarani','PYG','₲',1.00,NULL,NULL),(90,'Qatari Rial','QAR','ر.ق.‏',1.00,NULL,NULL),(91,'Romanian Leu','RON','lei',1.00,NULL,NULL),(92,'Serbian Dinar','RSD','din.',1.00,NULL,NULL),(93,'Russian Ruble','RUB','₽.',1.00,NULL,NULL),(94,'Rwandan Franc','RWF','FRw',1.00,NULL,NULL),(95,'Saudi Riyal','SAR','ر.س.‏',1.00,NULL,NULL),(96,'Sudanese Pound','SDG','ج.س.',1.00,NULL,NULL),(97,'Swedish Krona','SEK','kr',1.00,NULL,NULL),(98,'Singapore Dollar','SGD','$',1.00,NULL,NULL),(99,'Somali Shilling','SOS','Sh.so.',1.00,NULL,NULL),(100,'Syrian Pound','SYP','LS‏',1.00,NULL,NULL),(101,'Thai Baht','THB','฿',1.00,NULL,NULL),(102,'Tunisian Dinar','TND','د.ت‏',1.00,NULL,NULL),(103,'Tongan Paʻanga','TOP','T$',1.00,NULL,NULL),(104,'Turkish Lira','TRY','₺',1.00,NULL,NULL),(105,'Trinidad and Tobago Dollar','TTD','$',1.00,NULL,NULL),(106,'New Taiwan Dollar','TWD','NT$',1.00,NULL,NULL),(107,'Tanzanian Shilling','TZS','TSh',1.00,NULL,NULL),(108,'Ukrainian Hryvnia','UAH','₴',1.00,NULL,NULL),(109,'Ugandan Shilling','UGX','USh',1.00,NULL,NULL),(110,'Uruguayan Peso','UYU','$',1.00,NULL,NULL),(111,'Uzbekistan Som','UZS','so\'m',1.00,NULL,NULL),(112,'Venezuelan Bolívar','VEF','Bs.F.',1.00,NULL,NULL),(113,'Vietnamese Dong','VND','₫',1.00,NULL,NULL),(114,'CFA Franc BEAC','XAF','FCFA',1.00,NULL,NULL),(115,'CFA Franc BCEAO','XOF','CFA',1.00,NULL,NULL),(116,'Yemeni Rial','YER','﷼‏',1.00,NULL,NULL),(117,'South African Rand','ZAR','R',1.00,NULL,NULL),(118,'Zambian Kwacha','ZMK','ZK',1.00,NULL,NULL),(119,'Zimbabwean Dollar','ZWL','Z$',1.00,NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_addresses`
--

DROP TABLE IF EXISTS `customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `contact_person_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_addresses`
--

LOCK TABLES `customer_addresses` WRITE;
/*!40000 ALTER TABLE `customer_addresses` DISABLE KEYS */;
INSERT INTO `customer_addresses` VALUES (1,'online','14568393986','HEllo',NULL,NULL,'2023-10-14 12:45:02','2023-10-14 12:45:02',NULL,NULL,'4473e19ab384723f2966','Tanjir Islam','tanjirislam7@gmail.com','ET REPUDIANDAE QUI A',NULL,NULL),(2,'online','+1 (706) 899-7457','Nihil temporibus eni',NULL,NULL,'2023-10-15 05:43:56','2023-10-15 05:43:56',NULL,NULL,'ad4e6168aea08f6fc79b','Urielle Stevenson','xitisyvub@mailinator.com','Impedit totam archi',NULL,NULL),(3,'online','+1 (931) 253-1224','Quis autem fugiat no',NULL,NULL,'2023-10-15 05:58:31','2023-10-15 05:58:31',NULL,NULL,'ad4e6168aea08f6fc79b','Juliet Mcdowell','difycehuta@mailinator.com','Ut laboriosam quo a',NULL,NULL),(4,'online','+1 (463) 476-4489','Est nisi delectus e',NULL,NULL,'2023-10-15 06:10:01','2023-10-15 06:10:01',NULL,NULL,'aba34f385fc96f0bd3ce','Mariko Sharp','kosu@mailinator.com','Et ipsam quo ea et i',NULL,NULL),(5,'online','01925484921','Dhaka',NULL,NULL,'2023-10-15 08:28:12','2023-10-15 08:28:12',NULL,NULL,'fe87eec01fb5de2d9d58','Tanjir','tanjirislam7@gmail.com','1215',NULL,NULL),(6,'online','+1 (335) 967-9313','Laudantium est exce',NULL,NULL,'2023-10-15 08:28:59','2023-10-15 08:28:59',NULL,NULL,'710df27e3f4f2f9351a4','Isabelle Price','bejoqizy@mailinator.com','Cupidatat velit iure',NULL,NULL),(7,'online','+1 (283) 673-8263','Voluptatem cum amet',NULL,NULL,'2023-10-15 08:30:08','2023-10-15 08:30:08',NULL,NULL,'e8bb89888c84f6c7717f','Alika Hubbard','noposod@mailinator.com','Iure saepe cum et qu',NULL,NULL),(8,'online','+1 (565) 969-2727','Ex doloribus dolor e',NULL,NULL,'2023-10-15 08:30:17','2023-10-15 08:30:17',NULL,NULL,'e8bb89888c84f6c7717f','Maggy Holman','tira@mailinator.com','Magni lorem quia ita',NULL,NULL),(9,'online','+1 (769) 156-8469','Alias voluptas conse',NULL,NULL,'2023-10-15 08:34:47','2023-10-15 08:34:47',NULL,NULL,'e8bb89888c84f6c7717f','Adria Cooke','rebine@mailinator.com','Voluptates vel modi',NULL,NULL),(10,'online','+1 (145) 618-5713','Reiciendis doloremqu',NULL,NULL,'2023-10-15 08:38:25','2023-10-15 08:38:25',NULL,NULL,'e8bb89888c84f6c7717f','Clio Marsh','dyva@mailinator.com','Quos consequatur vit',NULL,NULL),(11,'online','+1 (447) 249-7767','Veritatis incidunt',NULL,NULL,'2023-10-15 08:49:19','2023-10-15 08:49:19',NULL,NULL,'e8bb89888c84f6c7717f','Pascale Austin','syjyg@mailinator.com','Qui in aut voluptate',NULL,NULL),(12,'online','+1 (356) 318-3944','Qui distinctio Quis',NULL,NULL,'2023-10-15 09:01:51','2023-10-15 09:01:51',NULL,NULL,'e8bb89888c84f6c7717f','Brock Solomon','cupinyda@mailinator.com','Distinctio Optio d',NULL,NULL),(13,'online','+1 (313) 954-2722','Eum soluta exercitat',NULL,NULL,'2023-10-15 09:04:20','2023-10-15 09:04:20',NULL,NULL,'e8bb89888c84f6c7717f','Mona Tucker','lykazur@mailinator.com','Excepteur repudianda',NULL,NULL),(14,'online','+1 (241) 908-1381','Recusandae Voluptat',NULL,NULL,'2023-10-15 09:05:02','2023-10-15 09:05:02',NULL,NULL,'e8bb89888c84f6c7717f','Octavia Winters','sepurys@mailinator.com','Omnis esse sed quis',NULL,NULL),(15,'online','+1 (256) 546-7938','Modi ea nisi ut ut u',NULL,NULL,'2023-10-15 09:05:18','2023-10-15 09:05:18',NULL,NULL,'e8bb89888c84f6c7717f','Nisha','secotepen@mailinator.com','Excepteur nostrum ma',NULL,NULL),(16,'online','+1 (846) 788-8891','Laborum id sunt et',NULL,NULL,'2023-10-15 09:07:51','2023-10-15 09:08:36',233,NULL,NULL,'Naida Ayala','gumekal@mailinator.com','Sit incidunt culpa',NULL,NULL),(17,'online','+1 (914) 153-1104','Impedit eiusmod dol',NULL,NULL,'2023-10-15 09:08:53','2023-10-15 09:08:53',NULL,NULL,'d278bc05733e998ac4e4','Haley Parks','mezacowot@mailinator.com','Quia cupiditate in e',NULL,NULL),(18,'online','+1 (677) 705-9643','Non tempor nisi ea a',NULL,NULL,'2023-10-15 09:15:46','2023-10-15 09:15:46',233,NULL,NULL,'Skyler Howe','rafupecato@mailinator.com','Et nemo recusandae',NULL,NULL),(19,'online','+1 (589) 254-8164','Eveniet est et prov',NULL,NULL,'2023-10-15 09:18:58','2023-10-15 09:18:58',NULL,NULL,'d278bc05733e998ac4e4','Naomi Morris','cyfuma@mailinator.com','Eu in consequatur ap',NULL,NULL),(20,'online','+1 (396) 437-7467','Impedit in reiciend',NULL,NULL,'2023-10-15 09:19:05','2023-10-15 09:19:05',NULL,NULL,'d278bc05733e998ac4e4','Lareina Kennedy','xeziw@mailinator.com','Incidunt voluptatem',NULL,NULL),(21,'online','+1 (396) 437-7467','Impedit in reiciend',NULL,NULL,'2023-10-15 09:19:25','2023-10-15 09:19:25',NULL,NULL,'d278bc05733e998ac4e4','Lareina Kennedy','xeziw@mailinator.com','Incidunt voluptatem',NULL,NULL),(22,'online','+1 (396) 437-7467','Impedit in reiciend',NULL,NULL,'2023-10-15 09:20:56','2023-10-15 09:20:56',NULL,NULL,'d278bc05733e998ac4e4','Lareina Kennedy','xeziw@mailinator.com','Incidunt voluptatem',NULL,NULL),(23,'online','+1 (228) 205-4406','Excepturi provident','23.755405','90.395734','2023-10-15 09:55:17','2023-11-08 12:52:55',3,NULL,NULL,'Cathleen Myers','gukaxu@mailinator.com','Molestiae quas esse',NULL,NULL),(24,'online','+1 (704) 211-1849','Quasi distinctio In',NULL,NULL,'2023-10-15 10:02:29','2023-10-15 10:02:29',NULL,NULL,'c0d3d002bb1d88007935','Christopher Gilliam','teqawecu@mailinator.com','Et eligendi et dolor',NULL,NULL),(33,'online','01312507139','Tejgaon Industrial area','23.753578','90.393717','2023-10-28 10:22:41','2023-10-28 10:22:41',12,'Nishat',NULL,'Tanjir','teqaecu@mailinator.com','1326',NULL,NULL),(34,'online','0123435876324','Dhaka',NULL,NULL,'2023-10-22 06:22:37','2023-10-22 06:22:37',12,'Ridoy',NULL,'Tanjir Islam','test@test.com','1215',NULL,NULL),(35,'online','+1 (147) 149-6922','Ullam quis recusanda',NULL,NULL,'2023-10-22 06:41:19','2023-10-22 06:41:19',12,'Kato Serrano',NULL,'Tanjir Islam','test@test.com','Aperiam odio reprehe','Mollitia voluptate f','Possimus sed facere'),(36,'online','+1 (345) 625-7914','Tempora non rem tene',NULL,NULL,'2023-10-25 07:17:01','2023-10-25 07:17:01',NULL,NULL,'516341562af0a5957383','Grady Martin','beve@mailinator.com','Expedita fugiat mai',NULL,NULL),(37,'online','+1 (207) 354-4464','At commodi eos volup',NULL,NULL,'2023-10-28 06:36:30','2023-10-28 06:36:30',NULL,NULL,'23d52c72597da22ef01d','Cairo Conrad','logu@mailinator.com','Ut inventore nisi au',NULL,NULL),(38,'online','19312531224','Dhaka',NULL,NULL,'2023-10-28 07:08:15','2023-10-28 07:08:15',NULL,NULL,'2687ec46c34955e792ef','Tanjir islam','tanjirislam7@gmail.com','1219',NULL,NULL),(39,'online','+14568393986','Laboriosam est adip',NULL,NULL,'2023-10-28 09:44:04','2023-10-28 09:44:04',NULL,NULL,'b381bab67a6966559154','aBRA CA DABRA','sicomi@mailinator.com','ET REPUDIANDAE QUI A',NULL,NULL),(40,'online','+1 (533) 651-8319','Similique sit aut in',NULL,NULL,'2023-10-28 11:10:28','2023-10-28 11:10:28',NULL,NULL,'51c357c35965d97c99db','Roanna Flynn','qacyfor@mailinator.com','Quo et eaque autem d',NULL,NULL),(41,'online','+1 (461) 251-3052','Dicta velit eum vol',NULL,NULL,'2023-10-29 06:22:31','2023-10-29 06:22:31',NULL,NULL,'1d39839415305ea476c1','Jonas Skinner','homuwa@mailinator.com','Aliquam rerum dolore',NULL,NULL),(42,'online','+1 (478) 228-1599','Inventore Nam velit',NULL,NULL,'2023-10-29 06:23:38','2023-10-29 06:23:38',NULL,NULL,'1a308615f9080c939b3d','Sophia Odonnell','satol@mailinator.com','Dhaka -1215',NULL,NULL),(43,'online','+1 (263) 241-4291','Quis harum consequat',NULL,NULL,'2023-10-29 06:24:22','2023-10-29 06:24:22',NULL,NULL,'fa2b4c3990b4ef05cbdb','Ocean Dorsey','wafamumot@mailinator.com','Libero facilis eius',NULL,NULL),(44,'online','+1 (166) 736-2555','Ut error ad assumend',NULL,NULL,'2023-10-29 10:43:43','2023-10-29 10:43:43',NULL,NULL,'31a9e81be81be1a1e784','Dean Ross','hipopuhody@mailinator.com','Consequatur reprehen',NULL,NULL),(45,'online','+1 (765) 704-6083','Quaerat nihil quia i',NULL,NULL,'2023-11-01 10:18:04','2023-11-01 10:18:04',NULL,NULL,'1b80065cd5079e3be344','Cecilia Rhodes','lupej@mailinator.com','Voluptatum et nihil',NULL,NULL),(46,'online','+1 (692) 942-6232','Voluptatem In fugia',NULL,NULL,'2023-11-08 11:19:06','2023-11-08 11:32:00',233,NULL,NULL,'Ira Ewing','zazulizyga@mailinator.com','Est enim et reprehen',NULL,NULL),(47,'online','+1 (539) 321-8227','Tenetur alias sint',NULL,NULL,'2023-11-08 11:33:47','2023-11-08 11:35:14',233,NULL,NULL,'Dexter Long','mojomyza@mailinator.com','Omnis iure ea laboru',NULL,NULL),(48,'online','+1 (447) 586-1855','Aut ipsam nostrum fu',NULL,NULL,'2023-11-08 11:44:11','2023-11-08 12:24:53',233,NULL,NULL,'Dennis Beck','gufahityp@mailinator.com','Quis blanditiis faci',NULL,NULL),(49,'online','01888888888','Hatirjheel','23.7509073',NULL,'2023-11-11 08:26:36','2023-11-11 08:26:36',12,NULL,NULL,'TJ','tj@tj.com','1215',NULL,NULL),(50,'online','01994935439534','Hello','23.755483','90.382988','2023-11-11 08:33:15','2023-11-11 08:33:15',12,NULL,NULL,'Tanvir','tv@tv.com','1245',NULL,NULL),(51,'online','01925484921','Hello','23.7791371','90.4361341','2023-11-11 09:34:24','2023-11-11 09:34:24',12,NULL,NULL,'Hello','email@email.com','2453',NULL,NULL),(52,'online','1244356456758','346346','23.7791371','90.4361341','2023-11-11 10:14:39','2023-11-11 10:14:39',12,NULL,NULL,'TT','tt@tt.com','354365',NULL,NULL),(53,'Home','0192575643885','1650, Unnamed Road, 94043, 94043,  Mountain View, United States,','37.421998333333335','-122.084','2023-11-12 06:31:38','2023-11-12 06:31:38',15,'test',NULL,NULL,NULL,NULL,NULL,NULL),(54,'online','+14568393986','Dhaka','23.755483','90.3839963','2023-11-13 05:52:35','2023-11-13 05:52:35',NULL,NULL,'68c22cd0a76fe4bd54ba','Tanjir islam','tanjirislam7@gmail.com','1219',NULL,NULL),(55,'online','19312531224','Quis autem fugiat no','23.7803489','90.4266124','2023-11-13 06:13:49','2023-11-13 06:13:49',NULL,NULL,'628c422d127e19e0ebef','Dhaka','ridoy@ridoy.com','Ut laboriosam quo a',NULL,NULL);
/*!40000 ALTER TABLE `customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_m_reviews`
--

DROP TABLE IF EXISTS `d_m_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_m_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_m_reviews`
--

LOCK TABLES `d_m_reviews` WRITE;
/*!40000 ALTER TABLE `d_m_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `d_m_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_histories`
--

DROP TABLE IF EXISTS `delivery_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint DEFAULT NULL,
  `deliveryman_id` bigint DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_histories`
--

LOCK TABLES `delivery_histories` WRITE;
/*!40000 ALTER TABLE `delivery_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_men`
--

DROP TABLE IF EXISTS `delivery_men`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_men` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_men_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_men`
--

LOCK TABLES `delivery_men` WRITE;
/*!40000 ALTER TABLE `delivery_men` DISABLE KEYS */;
INSERT INTO `delivery_men` VALUES (1,'Afia','Akhtar','01925484921','aaa18bd@gmail.com','123546567','passport','[\"2023-10-12-6527d51f24703.png\"]','2023-10-12-6527d51f282b7.png','$2y$10$5ZnOz13Obc4vPbiFUU1sS.eaqZvaprRP/VFOnob6ds16KHjtu82yy','2023-10-12 11:14:39','2023-10-16 07:12:26',NULL,NULL,0);
/*!40000 ALTER TABLE `delivery_men` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verifications`
--

DROP TABLE IF EXISTS `email_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verifications`
--

LOCK TABLES `email_verifications` WRITE;
/*!40000 ALTER TABLE `email_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2020_07_13_131238_create_carts_table',1),(10,'2020_12_28_082729_create_admins_table',1),(11,'2020_12_28_083059_create_delivery_men_table',1),(12,'2020_12_28_085055_create_attributes_table',1),(13,'2020_12_28_085146_create_add_ons_table',1),(14,'2020_12_28_085255_create_categories_table',1),(15,'2020_12_28_085511_create_business_settings_table',1),(16,'2020_12_28_085733_create_customer_addresses_table',1),(17,'2020_12_28_090037_create_orders_table',1),(18,'2020_12_28_090551_create_order_details_table',1),(19,'2020_12_28_091214_create_order_delivery_histories_table',1),(20,'2020_12_28_092607_create_banners_table',1),(21,'2020_12_28_092747_create_notifications_table',1),(22,'2020_12_28_092933_create_coupons_table',1),(23,'2020_12_28_093409_create_track_deliverymen_table',1),(24,'2020_12_28_093637_create_conversations_table',1),(25,'2020_12_28_093812_create_reviews_table',1),(26,'2020_12_28_093937_create_products_table',1),(27,'2021_01_02_053131_add_products_column_attributes',1),(28,'2021_01_02_062050_add_products_table_column_discount_tax',1),(29,'2021_01_03_083314_add_column_to_order_details',1),(30,'2021_01_03_084318_add_another_column_to_order_details',1),(31,'2021_01_05_133023_add_columns_to_customer_addressess',1),(32,'2021_01_07_142644_add_column_to_conversation',1),(33,'2021_01_09_145939_add_column_to_order_table',1),(34,'2021_01_09_180439_add_column_to_product_table',1),(35,'2021_01_09_182458_add_image_column_to_category',1),(36,'2021_01_10_144352_create_wishlists_table',1),(37,'2021_01_16_182939_add_column_to_order_table1',1),(38,'2021_01_18_124153_add_column_to_cono_table',1),(39,'2021_01_18_132026_add_column_to_deliveryman_table',1),(40,'2021_01_18_135107_create_delivery_histories_table',1),(41,'2021_01_23_102525_add_col_to_banner_category_id',1),(42,'2021_01_26_133423_add_delivery_charge_order_table',1),(43,'2021_01_27_111644_add_email_token_to_user_table',1),(44,'2021_01_27_112309_create_email_verifications_table',1),(45,'2021_01_27_120054_remove_column_from_users',1),(46,'2021_01_27_120306_add_column_tousers',1),(47,'2021_01_28_152556_create_currencies_table',1),(48,'2021_02_07_140951_add_firebase_token_to_users_table',1),(49,'2021_02_07_141134_add_order_note_to_orders_table',1),(50,'2021_02_11_125439_add_fcm_to_delivery_man',1),(51,'2021_02_15_094227_add_orderid_to_reviews_table',1),(52,'2021_02_18_085112_add_coupon_type_column_in_coupons',1),(53,'2021_02_18_095103_add_coupon_code_to_order_table',1),(54,'2021_02_20_051812_create_d_m_reviews_table',1),(55,'2021_02_20_070636_add_addon_qtys_order_table',1),(56,'2021_02_22_084240_add_order_type',1),(57,'2021_02_23_053203_create_branches_table',1),(58,'2021_02_23_093537_add_branch_in_order',1),(59,'2021_02_24_055406_add_coverage_in_branch',1),(60,'2021_02_25_063013_add_branch_to_delivery_man',1),(61,'2021_02_28_080406_add_remember_token_to_branch',1),(62,'2021_03_01_112807_change_poduct_table_column_change',1),(63,'2021_04_17_054600_add_point_to_users',1),(64,'2021_04_17_084426_create_point_transitions',1),(65,'2021_05_03_160034_add_callback_to_order',1),(66,'2021_05_04_203143_add_delivery_date_to_order',1),(67,'2021_05_06_144650_change_business_value_col_type',1),(68,'2021_06_17_054551_create_soft_credentials_table',1),(69,'2021_08_16_135503_create_companies_table',1),(70,'2021_08_16_193534_create_restaurants_table',1),(71,'2021_08_18_172710_add_company_id_to_products',1),(72,'2021_08_19_190556_add_company_id_to_order_details',1),(73,'2021_08_21_145014_add_delivery_status_to_order_details',1),(74,'2021_09_09_145704_add_restaurant_id_to_products',1),(75,'2021_09_13_122545_add_cover_image_to_resturants',1),(76,'2021_09_22_171500_add_remember_token_to_companyes',1),(77,'2021_09_28_130717_add_restaurant_id_to_banners',1),(78,'2021_10_09_164614_add_bin_in_to_companys',1),(79,'2021_10_23_163140_add_refer_to_users',1),(80,'2023_10_08_121143_create_book_tables_table',2),(81,'2023_10_14_144658_create_contact_us_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('03c36c7c12401050cf01440c9cd623dd43cdc79cd44c2ef8ab5a7bd81e1ee416fdb9255710111d37',12,1,'RestaurantCustomerAuth','[]',0,'2023-10-31 06:43:59','2023-10-31 06:43:59','2024-10-31 12:43:59'),('08118835da4e3ec0177dedbb7e0eee197857a0755d742924faa1cc8fec1683f6583e208cede63df7',12,1,'RestaurantCustomerAuth','[]',0,'2023-11-01 07:06:46','2023-11-01 07:06:46','2024-11-01 13:06:46'),('15d814b9ca93c992d12362b47df31f924eb5950632cef581e5bd8120cd1e300df2f50f6cb82dca6e',12,1,'RestaurantCustomerAuth','[]',0,'2023-11-01 08:26:15','2023-11-01 08:26:15','2024-11-01 14:26:15'),('236fb432c5f958520caf133804511d9978141107cb822d3641fcf14302c2b4effe556e7b6d4a5c90',12,1,'RestaurantCustomerAuth','[]',0,'2023-11-01 10:35:29','2023-11-01 10:35:29','2024-11-01 16:35:29'),('3891dc66985abfd7411fb523b0c0d8286823a003f0014c11b7bc49e5ea06d2137e1033db127afe0b',13,1,'RestaurantCustomerAuth','[]',0,'2023-11-02 05:58:09','2023-11-02 05:58:09','2024-11-02 11:58:09'),('4e51208b2d7285860c7e2c29767af8c7601b0a980e5f340c973ab4b86f1878ccffbf6afa552cf047',15,1,'RestaurantCustomerAuth','[]',0,'2023-11-12 07:43:06','2023-11-12 07:43:06','2024-11-12 13:43:06'),('4e76e6a2e8f37ec906f1153d7275d7de7055e066764079ff1bbe37429e8273cc27f77ea9ede70cc7',12,1,'RestaurantCustomerAuth','[]',0,'2023-11-06 11:03:18','2023-11-06 11:03:18','2024-11-06 17:03:18'),('584128e7dc684db44f08dc14d36f943c0f34e70e4c55c32b03f9cf5aff2032e33d3b505a5ebb3c66',12,1,'RestaurantCustomerAuth','[]',0,'2023-11-01 06:33:48','2023-11-01 06:33:48','2024-11-01 12:33:48'),('5fc5eaf77cf7b0d40ab9ffeb9d27c81094e71600f4e015e4e73898829cd81db8420c89dce3ffcd67',14,1,'RestaurantCustomerAuth','[]',0,'2023-11-11 10:52:46','2023-11-11 10:52:46','2024-11-11 16:52:46'),('62c230854449e7cb6d12dc8c086dc013ee79848883f084ea7b4048269fc6d037446e624bf9bf6b51',12,1,'RestaurantCustomerAuth','[]',0,'2023-11-02 07:04:11','2023-11-02 07:04:11','2024-11-02 13:04:11'),('677f7b24887b0071de7e7d07ba28aca199fc0fb081ad9e519da6e4ecbe12d2391545843603928e69',1,1,'admin-password','[]',0,'2023-10-05 07:45:11','2023-10-05 07:45:11','2024-10-05 13:45:11'),('6805927fde56ebca9cda7f542d867d5d71bde77759ae22f93f87f495d1dd0afcb2acd5e9edf6660a',13,1,'RestaurantCustomerAuth','[]',0,'2023-11-01 07:15:40','2023-11-01 07:15:40','2024-11-01 13:15:40'),('771118115421956ea8741383d39f258845c25a3ef68c4925edc1e3ecae07bd81b7584dcfa502e3d6',12,1,'RestaurantCustomerAuth','[]',0,'2023-10-31 08:36:08','2023-10-31 08:36:08','2024-10-31 14:36:08'),('77c1f9986cf2ea30faadbf53b3efac8abee849cf690373c96e57d8ca91e32306d0a4ba2235b18bc4',14,1,'RestaurantCustomerAuth','[]',0,'2023-11-12 06:51:58','2023-11-12 06:51:58','2024-11-12 12:51:58'),('7d518e0876d4ca6db41b292d64198a1e6de6cdc2957f452b9c46ace10604a105cef6a22d572fde1c',12,1,'RestaurantCustomerAuth','[]',0,'2023-11-02 09:09:53','2023-11-02 09:09:53','2024-11-02 15:09:53'),('939a8192e193cfba6eb71396d725bf3e5048e037eb80177777ccc0cee019c59f4a6b936061e6254d',14,1,'RestaurantCustomerAuth','[]',0,'2023-11-11 10:56:03','2023-11-11 10:56:03','2024-11-11 16:56:03'),('a34273b394d0eb95ca5a7fc04df22fec19407e6cad2d30a0ace6c91dfe62cfa9250ac95da6a10fd7',12,1,'RestaurantCustomerAuth','[]',0,'2023-10-31 07:16:09','2023-10-31 07:16:09','2024-10-31 13:16:09'),('bbe3e4ae811f2af0425b225eca890d0d6222e64f41dc81ff1c11738fafd2ba77c4ef74b13113cbf9',12,1,'RestaurantCustomerAuth','[]',0,'2023-11-08 09:22:28','2023-11-08 09:22:28','2024-11-08 15:22:28'),('bcb55cae5de3439ec3747000523f4c9ee158e574676582671d8816c77ceb3c2f7192e222886bf099',13,1,'RestaurantCustomerAuth','[]',0,'2023-11-02 06:00:31','2023-11-02 06:00:31','2024-11-02 12:00:31'),('c20c82dce582a237088de2698040284bc1f4ac2526f834de91920b0ea690a5940062af19ed59b353',16,1,'RestaurantCustomerAuth','[]',0,'2023-11-12 07:12:35','2023-11-12 07:12:35','2024-11-12 13:12:35'),('d6e2ad81800540e4c0853c0db2cd3913c1b13dbf6fe9aed437358680c95a56cd6f9a2ea4fbe35af8',15,1,'RestaurantCustomerAuth','[]',0,'2023-11-13 05:54:11','2023-11-13 05:54:11','2024-11-13 11:54:11'),('da603a254e0875e709a87e1e20b11fe4a8167cff051a3b31862ee63d73577c280a925773e7e6921d',15,1,'RestaurantCustomerAuth','[]',0,'2023-11-12 06:20:52','2023-11-12 06:20:52','2024-11-12 12:20:52'),('dfa6bdf9543e9100cb5207da7723fd84ae317a25a2a1a71cf4d08c425bd0ef089ecaf89757c50781',12,1,'RestaurantCustomerAuth','[]',0,'2023-10-31 10:58:57','2023-10-31 10:58:57','2024-10-31 16:58:57'),('e61d67ded46af4e1e001330db4a2abe8adf60f70acb93a54ca86626f687db1c0066ca04c0d2d0158',15,1,'RestaurantCustomerAuth','[]',0,'2023-11-12 07:23:50','2023-11-12 07:23:50','2024-11-12 13:23:50');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','a3xgB2eZ3s7upOHdSUTxKAVmPVrxmeAb2cVFaN1S',NULL,'http://localhost',1,0,0,'2023-10-05 07:45:05','2023-10-05 07:45:05');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2023-10-05 07:45:05','2023-10-05 07:45:05');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_delivery_histories`
--

DROP TABLE IF EXISTS `order_delivery_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_delivery_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint DEFAULT NULL,
  `delivery_man_id` bigint DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery_histories`
--

LOCK TABLES `order_delivery_histories` WRITE;
/*!40000 ALTER TABLE `order_delivery_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_delivery_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `product_details` text COLLATE utf8mb4_unicode_ci,
  `variation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_on_product` decimal(8,2) DEFAULT NULL,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int NOT NULL DEFAULT '1',
  `tax_amount` decimal(8,2) NOT NULL DEFAULT '1.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `add_on_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_on_qtys` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `delivery_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `restaurant_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (288,3,100001,190.00,'{\"id\":3,\"name\":\"Joy Bangla\",\"description\":null,\"image\":\"2023-11-01-65421214173a0.png\",\"price\":190,\"variations\":[],\"add_ons\":[],\"tax\":0,\"qty\":212,\"available_time_starts\":\"10:30:00\",\"available_time_ends\":\"19:30:00\",\"status\":1,\"cat_id\":null,\"created_at\":\"2023-11-01T08:53:40.000000Z\",\"updated_at\":\"2023-11-07T12:27:58.000000Z\",\"attributes\":[],\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"choice_options\":[],\"discount\":10,\"discount_type\":\"amount\",\"tax_type\":\"percent\",\"set_menu\":0,\"company_id\":1,\"restaurant_id\":\"1\"}','[]',10.00,'discount_on_product',2,0.00,'2023-11-13 09:50:22','2023-11-13 09:50:22','[]',NULL,NULL,NULL,'pending',NULL),(289,4,100002,180.00,'{\"id\":4,\"name\":\"Joy bongobondhu\",\"description\":null,\"image\":\"2023-11-01-654213b097582.png\",\"price\":180,\"variations\":[],\"add_ons\":[],\"tax\":0,\"qty\":91,\"available_time_starts\":\"10:30:00\",\"available_time_ends\":\"19:30:00\",\"status\":1,\"cat_id\":1,\"created_at\":\"2023-11-01T09:00:32.000000Z\",\"updated_at\":\"2023-11-07T11:29:20.000000Z\",\"attributes\":[],\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"choice_options\":[],\"discount\":0,\"discount_type\":\"percent\",\"tax_type\":\"percent\",\"set_menu\":0,\"company_id\":1,\"restaurant_id\":\"1\"}','[]',0.00,'discount_on_product',1,0.00,'2023-11-13 09:58:00','2023-11-13 09:58:00','[]',NULL,NULL,NULL,'pending',NULL),(290,4,100003,180.00,'{\"id\":4,\"name\":\"Joy bongobondhu\",\"description\":null,\"image\":\"2023-11-01-654213b097582.png\",\"price\":180,\"variations\":[],\"add_ons\":[],\"tax\":0,\"qty\":90,\"available_time_starts\":\"10:30:00\",\"available_time_ends\":\"19:30:00\",\"status\":1,\"cat_id\":1,\"created_at\":\"2023-11-01T09:00:32.000000Z\",\"updated_at\":\"2023-11-13T09:58:00.000000Z\",\"attributes\":[],\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"choice_options\":[],\"discount\":0,\"discount_type\":\"percent\",\"tax_type\":\"percent\",\"set_menu\":0,\"company_id\":1,\"restaurant_id\":\"1\"}','[]',0.00,'discount_on_product',1,0.00,'2023-11-13 09:58:19','2023-11-13 09:58:19','[]',NULL,NULL,NULL,'pending',NULL),(291,4,100004,180.00,'{\"id\":4,\"name\":\"Joy bongobondhu\",\"description\":null,\"image\":\"2023-11-01-654213b097582.png\",\"price\":180,\"variations\":[],\"add_ons\":[],\"tax\":0,\"qty\":89,\"available_time_starts\":\"10:30:00\",\"available_time_ends\":\"19:30:00\",\"status\":1,\"cat_id\":1,\"created_at\":\"2023-11-01T09:00:32.000000Z\",\"updated_at\":\"2023-11-13T09:58:19.000000Z\",\"attributes\":[],\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"choice_options\":[],\"discount\":0,\"discount_type\":\"percent\",\"tax_type\":\"percent\",\"set_menu\":0,\"company_id\":1,\"restaurant_id\":\"1\"}','[]',0.00,'discount_on_product',1,0.00,'2023-11-13 09:58:25','2023-11-13 09:58:25','[]',NULL,NULL,NULL,'pending',NULL);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `order_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_discount` decimal(8,2) DEFAULT NULL,
  `transaction_reference` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_man_id` bigint DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  `order_note` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `branch_id` bigint NOT NULL DEFAULT '1',
  `callback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100088 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (100001,12,310.00,50.00,'Test Coupon','paid','delivered',0.00,'1',0.00,NULL,NULL,33,'2023-11-13 09:50:22','2023-11-13 10:07:04',1,NULL,50.00,NULL,'Test','online',1,NULL,'2023-11-13','15:50:22'),(100002,12,180.00,0.00,NULL,'unpaid','delivered',0.00,'3',0.00,NULL,NULL,33,'2023-11-13 09:58:00','2023-11-13 10:03:23',1,NULL,50.00,NULL,NULL,'online',1,NULL,'2023-11-13','15:58:00'),(100003,12,180.00,0.00,NULL,'paid','confirmed',0.00,'internal_point',0.00,'payment_jQTuv2PVEh6PlmK',NULL,33,'2023-11-13 09:58:19','2023-11-13 09:58:19',1,NULL,50.00,NULL,NULL,'online',1,NULL,'2023-11-13','15:58:19'),(100004,12,180.00,0.00,NULL,'paid','confirmed',0.00,'internal_point',0.00,'payment_WY81QbiigK0CX0N',NULL,33,'2023-11-13 09:58:25','2023-11-13 09:58:25',1,NULL,50.00,NULL,NULL,'online',1,NULL,'2023-11-13','15:58:25');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_transitions`
--

DROP TABLE IF EXISTS `point_transitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_transitions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_transitions`
--

LOCK TABLES `point_transitions` WRITE;
/*!40000 ALTER TABLE `point_transitions` DISABLE KEYS */;
INSERT INTO `point_transitions` VALUES (17,12,'paid for order ID : 100001.','point_out',244.00,'2023-11-08 05:14:33','2023-11-08 05:14:33'),(18,12,'paid for order ID : 100002.','point_out',244.00,'2023-11-08 05:18:39','2023-11-08 05:18:39'),(19,12,'earned point for order ID : 100004.','point_in',61.00,'2023-11-08 06:21:58','2023-11-08 06:21:58'),(20,12,'earned point for order ID : 100004.','point_in',61.00,'2023-11-08 06:33:35','2023-11-08 06:33:35'),(21,12,'earned point for order ID : 100005.','point_in',61.00,'2023-11-08 06:34:33','2023-11-08 06:34:33'),(22,12,'earned point for order ID : 100006.','point_in',61.00,'2023-11-08 07:00:23','2023-11-08 07:00:23'),(23,12,'paid for order ID : 100053.','point_out',500.00,'2023-11-12 07:49:31','2023-11-12 07:49:31'),(24,12,'paid for order ID : 100054.','point_out',500.00,'2023-11-12 07:49:38','2023-11-12 07:49:38'),(25,12,'paid for order ID : 100055.','point_out',500.00,'2023-11-12 07:50:04','2023-11-12 07:50:04'),(26,12,'paid for order ID : 100056.','point_out',500.00,'2023-11-12 07:50:12','2023-11-12 07:50:12'),(27,12,'paid for order ID : 100059.','point_out',500.00,'2023-11-12 07:55:34','2023-11-12 07:55:34'),(28,15,'paid for order ID : 100060.','point_out',344.00,'2023-11-12 08:00:19','2023-11-12 08:00:19'),(29,12,'paid for order ID : 100003.','point_out',360.00,'2023-11-13 09:58:19','2023-11-13 09:58:19'),(30,12,'paid for order ID : 100004.','point_out',360.00,'2023-11-13 09:58:25','2023-11-13 09:58:25'),(31,12,'earned point for order ID : 100001.','point_in',155.00,'2023-11-13 10:08:45','2023-11-13 10:08:45');
/*!40000 ALTER TABLE `point_transitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `variations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` decimal(8,2) NOT NULL DEFAULT '0.00',
  `qty` int NOT NULL DEFAULT '0',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cat_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `set_menu` tinyint(1) NOT NULL DEFAULT '0',
  `company_id` bigint DEFAULT NULL,
  `restaurant_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Testu',NULL,'2023-10-11-6526634d7a677.png',122.00,'[]','[]',0.00,107,'10:30:00','19:30:00',1,1,'2023-10-11 08:56:45','2023-11-11 09:35:12','[]','[{\"id\":\"1\",\"position\":1}]','[]',0.00,'percent','percent',0,1,'1'),(2,'NEw Product',NULL,'2023-10-25-6538b27d5e145.png',100.00,'[]','[]',12.00,63,'10:30:00','19:30:00',1,1,'2023-10-25 06:15:25','2023-11-13 09:09:12','[]','[{\"id\":\"1\",\"position\":1}]','[]',10.00,'percent','percent',0,1,'1'),(3,'Joy Bangla',NULL,'2023-11-01-65421214173a0.png',190.00,'[]','[]',0.00,210,'10:30:00','19:30:00',1,NULL,'2023-11-01 08:53:40','2023-11-13 09:50:22','[]','[{\"id\":\"1\",\"position\":1}]','[]',10.00,'amount','percent',0,1,'1'),(4,'Joy bongobondhu',NULL,'2023-11-01-654213b097582.png',180.00,'[]','[]',0.00,88,'10:30:00','19:30:00',1,1,'2023-11-01 09:00:32','2023-11-13 09:58:25','[]','[{\"id\":\"1\",\"position\":1}]','[]',0.00,'percent','percent',0,1,'1');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantes`
--

DROP TABLE IF EXISTS `restaurantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantes`
--

LOCK TABLES `restaurantes` WRITE;
/*!40000 ALTER TABLE `restaurantes` DISABLE KEYS */;
INSERT INTO `restaurantes` VALUES (1,'Latte N Chai','1','2023-10-04-651d12e4056b1.png','Gulshan 1',1,'2023-10-04-651d12e405993.png','2023-10-04 07:23:16','2023-10-04 07:23:16');
/*!40000 ALTER TABLE `restaurantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soft_credentials`
--

DROP TABLE IF EXISTS `soft_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soft_credentials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soft_credentials`
--

LOCK TABLES `soft_credentials` WRITE;
/*!40000 ALTER TABLE `soft_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `soft_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_deliverymen`
--

DROP TABLE IF EXISTS `track_deliverymen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track_deliverymen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint DEFAULT NULL,
  `delivery_man_id` bigint DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_deliverymen`
--

LOCK TABLES `track_deliverymen` WRITE;
/*!40000 ALTER TABLE `track_deliverymen` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_deliverymen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point` decimal(8,2) NOT NULL DEFAULT '0.00',
  `refer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refer_by_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_ref` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Piper Ferrell','Deacon Horne','+1 (226) 918-3914','zagepiwamy@mailinator.com',NULL,0,NULL,'$2y$10$PMrr0ItnD12eHoVbQWVznuTOGoH1XfrQ9Q1QpY7N3wV1YgUTXKtza',NULL,'2023-10-08 11:38:26','2023-10-08 11:38:26',NULL,NULL,0.00,NULL,NULL,0),(2,'Lucy Moss','Elizabeth Sharp','+1 (877) 781-4797','gefemyk@mailinator.com',NULL,0,NULL,'$2y$10$V1.NJg9QiU64BC7PdmdLZeT/gjUSqJyezEOPKKm6SWw7QpI/osHn.',NULL,'2023-10-08 11:38:57','2023-10-08 11:38:57',NULL,NULL,0.00,NULL,NULL,0),(3,'Tanjir Islam','Islam','01925484921','tanjirislam7@gmail.com',NULL,0,NULL,'$2y$10$6IGc.tvy/gxVLcwosD48z.hyltPmQtSl2M6FmGtR5rlsuiafVfjPi',NULL,'2023-10-12 10:39:07','2023-11-08 12:48:07',NULL,NULL,0.00,NULL,NULL,0),(4,'Olga','Amelia','+1 (268) 441-2489','fymuly@mailinator.com',NULL,0,NULL,'$2y$10$c7osqDXBEV.9aQZ1QJtfnuAyNZaOTiLXMw45OZuBjUssaPn1gTkwy',NULL,'2023-10-17 06:28:22','2023-10-17 06:28:22',NULL,NULL,0.00,NULL,NULL,0),(5,'Harlan','Isaac','+1 (802) 581-9861','wixemoguk@mailinator.com',NULL,0,NULL,'$2y$10$o.dvolmhhmcb74chMsEjP.vXCnIyItmQaCa3oVE8VxVB3.kPnOKp.',NULL,'2023-10-17 06:28:52','2023-10-17 06:28:52',NULL,NULL,0.00,NULL,NULL,0),(6,'Yoko','Henry','+1 (538) 477-2905','fypehubica@mailinator.com',NULL,0,NULL,'$2y$10$7SOss7bRzvPkzNUTf/PQ5OVFlVXhxwRaHJ9Il4sxQDkg8vacswkG2',NULL,'2023-10-17 06:29:06','2023-10-17 06:29:06',NULL,NULL,0.00,NULL,NULL,0),(7,'Roth','Valentine','+1 (198) 127-9117','toqodo@mailinator.com',NULL,0,NULL,'$2y$10$rHQe93sG.O7Ign.7TbRmNuL/gDsJH9PSmF3wHHSR6MIjjIdsiPu96',NULL,'2023-10-17 06:29:57','2023-10-17 06:29:57',NULL,NULL,0.00,NULL,NULL,0),(8,'Talon Luna','Islam','1844687561612','Islam@admin.com',NULL,0,NULL,'$2y$10$/CcRDrJIpcVAEAhwmTu94OjPeht6hfm92r3HRh4BVVoK5TbQrxKgm',NULL,'2023-10-17 06:31:07','2023-10-17 06:31:07',NULL,NULL,0.00,NULL,NULL,0),(9,'Keith','Alma','+1 (604) 621-2026','zopuxoj@mailinator.com',NULL,0,NULL,'$2y$10$kZPcXm84XicRqwWQfvRpKegL7p/EUzo4E2dwc5YOkBHUH/GdlIgem',NULL,'2023-10-17 06:31:25','2023-10-17 06:31:25',NULL,NULL,0.00,NULL,NULL,0),(10,'Asher','Preston','+1 (329) 629-2836','vaxoj@mailinator.com',NULL,0,NULL,'$2y$10$i1rEsUazVHdJp9v6auzHQu6m7oeedgPCHUk0JCGxKnqagqpT6UOTC',NULL,'2023-10-17 06:32:05','2023-10-17 06:32:05',NULL,NULL,0.00,NULL,NULL,0),(11,'Flavia','Chadwick','+1 (724) 877-9891','tyhitefa@mailinator.com',NULL,0,NULL,'$2y$10$LOzwPyTNvarx4OUfkyhDou5LnAhTrk1Fqf.HLV/K86UHH5sOvi0Gu',NULL,'2023-10-17 06:33:28','2023-10-17 06:33:28',NULL,NULL,0.00,NULL,NULL,0),(12,'Tanjir Helo','Dhaka','01924354657','hello@hello.com','2023-11-02-654372078d7c9.png',0,NULL,'$2y$10$sTtTXPfN3vhXcmsBFySaGu3YIovvv.Y/ilAeR6u30t7eVZ1ok5seS',NULL,'2023-10-17 06:37:06','2023-11-13 10:08:45',NULL,NULL,655.00,NULL,NULL,0),(13,'TEs','test','+8801405804033',NULL,NULL,0,NULL,'$2y$10$sTtTXPfN3vhXcmsBFySaGu3YIovvv.Y/ilAeR6u30t7eVZ1ok5seS',NULL,'2023-11-01 07:15:40','2023-11-01 07:15:40',NULL,'eKk3iCNeTKq_yLdrmCxtmC:APA91bGMCcNv69_THMp1wv-9zbtuIuLLza6kb1SFzHrmUQjzMWhmOfMpqJw-OgN_4iC98nYgAoKRAY9xQEMAUdzGeKCv-E8vdBuNTdwba26EtpjUS_1wDWBD8r4l4UcB8jpP04Zqa58y',0.00,'8aCTEs6',NULL,0),(14,'Testy','test','01312507139',NULL,NULL,0,NULL,'$2y$10$UOe.IVFyM7XR1P96nSVzNuBskqUXwx4d2.j2.CQ0Qahsz/QyWaG6e',NULL,'2023-11-11 10:52:45','2023-11-11 10:52:45',NULL,NULL,0.00,'pBFTesty3',NULL,0),(15,'Ridoy','Rahman','+8801700000000',NULL,NULL,0,NULL,'$2y$10$rWvk6gZrU4BQFF7azI7d6emjvSEFx4Li5ZrZQ6lU9yqRNZr6XEbOm',NULL,'2023-11-12 06:20:52','2023-11-12 08:00:19',NULL,'c97R3rU-SYK6aO4BQyvx2v:APA91bE4Qa7MrrL5UDwGj_rANEUgSL0kDGCFLv5t7KwYWvZtWY1YKZnFmKevegkISjBS1RA5PeDP06sBUw0ZAGJd6XLUk2xxoSVKPb9-7O1kAIzU44BHdD_TaQ-F0f5cniCQOpC1NfCD',156.00,'kcFRidoy3',NULL,0),(16,'test','test2','+8801600000000',NULL,NULL,0,NULL,'$2y$10$ShLpjVYXCOSiS2zTB8m68Oy33YghtCv8ojt3mwE5azIQFQIpVcoB6',NULL,'2023-11-12 07:12:35','2023-11-12 07:12:35',NULL,'c97R3rU-SYK6aO4BQyvx2v:APA91bE4Qa7MrrL5UDwGj_rANEUgSL0kDGCFLv5t7KwYWvZtWY1YKZnFmKevegkISjBS1RA5PeDP06sBUw0ZAGJd6XLUk2xxoSVKPb9-7O1kAIzU44BHdD_TaQ-F0f5cniCQOpC1NfCD',0.00,'lEctest10',NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES (1,12,1,'2023-10-26 07:19:32','2023-10-26 07:19:32'),(3,15,4,'2023-11-12 06:58:40','2023-11-12 06:58:40');
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-14 12:46:13
