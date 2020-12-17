-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sponsorme
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `perk`
--

DROP TABLE IF EXISTS `perk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perk` (
  `perk_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`perk_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `perk_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perk`
--

LOCK TABLES `perk` WRITE;
/*!40000 ALTER TABLE `perk` DISABLE KEYS */;
INSERT INTO `perk` VALUES (1,20,'MOFT Float - Super Early Bird *1',390.00,'Two Sizes to Choose(11\"/12.9\"). We will send you a survey to collect the size options and mailing address after the campaign ends. Will retail for $59 | 34% off retail'),(2,20,'MOFT Float - Super Early Bird *2',690.00,'Two Sizes to Choose(11\"/12.9\"). We will send you a survey to collect the size options and mailing address after the campaign ends. Will retail for $1080 | 36% off retail'),(3,20,'Workstation Combo - Super Early Bird *1',690.00,'Two Sizes to Choose(11\"/12.9\"). We will send you a survey to collect the size options and mailing address after the campaign ends. Will retail for $1180 | 37% off retail'),(4,21,'Monument 2',1690.00,' Storage is not included. Plug-in your own SSD module or USB drive. ◇ Taxes will be collected after the campaign. ◇ Pledge as a gift available.'),(5,21,'Monument 2 SSD 1TB | Early Bird',2990.00,'Built-in 1TB SSD storage included. ◇ Taxes will be collected after the campaign. ◇ Pledge as a gift available.'),(6,22,'Super Early Bird - ARCO hand grinder',1250.00,'With superb grind consistency and simple grind adjustment, you\'ll be ready to take this hand grinder anywhere!'),(7,22,'Early Bird - ARCO hand grinder',1440.00,'With superb grind consistency and simple grind adjustment, you\'ll be ready to take this hand grinder anywhere!'),(8,22,'Early Bird - ARCO 2-in-1',2900.00,'The 2-in-1 coffee grinder that will change the way you grind. Forever.'),(9,23,'ALUMNO REGULAR',600.00,'¡Gracias por tu apoyo! Como recompensa te enviaremos regalos digitales exclusivos de este Kickstarter: Thanks for your support! As a reward we\'ll send you exclusive digital files made for this Kickstarter:'),(10,23,'ALTO RENDIMIENTO',1500.00,'Regalos digitales exclusivos de este Kickstarte y con los primeros tomos de la historia de CARTA PRAT en eBook. Digital rewards exclusively made for this Kickstarter besides the first two book of the CARTA PRAT comic series.'),(11,24,'Online film screening',1000.00,'Films usually get a release date only after finishing their festival circulation (which can take up to 2 years). However, every backer will have an exclusive opportunity to see the film in an online screening event - months before release date.'),(12,24,'The Film (Download) & Backer Credit',2500.00,'All of the above, plus: 1. Digital download of the film, delivered after release date. 2. You will be credited as Backer in end credits of the film.'),(13,25,'Every Dollar Counts!',1.00,'We will include your name on the backers thank you page on our website, plus you\'ll get access to the backer updates.'),(14,25,'Thank You in Our App!',10000.00,'Your name will be listed on a page in our exclusive festival mobile app, as well as on the big screen at the festival during the pre-show slides and on our website, plus you\'ll get access to the backer updates.'),(15,26,'Pledge without reward',200.00,'Contribute because you love all things jazz, and want to see this amazing project see the light of day!'),(16,26,'Sound of Detroit Digital album',1500.00,'Strata Records-The Sound Of Detroit-Reimagined By Jazzanova digital album. Be the first to receive an exclusive download of the album fresh after mastering!'),(17,27,'VIP Membership',1000.00,''),(18,27,'Music Pack',3900.00,''),(19,28,'Digital Thank You Card',500.00,'You will receive a personalized thank you email from us. Every little bit helps!'),(20,28,'Signed Copy of the Album',2000.00,'1 physical copy of the CD signed by Trio Ghidorah.'),(21,29,'Your name in imprint of the book',900.00,'Even small help is meaningful! Thank you for your support. Your name will be placed on the page of honour in our upcoming publication.'),(22,29,'Original book designed by Jaroslav Benda',2900.00,'Receive a rare publication carefully selected from the author\'s collection of Jaroslav Benda\'s artworks, restored with the utmost care to perfect condition. Original language: Czech.'),(23,30,'DIGITAL VERSION',5000.00,'The Ultimate Guide To Rebuilding A Civilization. Over 400 pages of detailed and catchy illustrations.'),(24,30,'Super Early Bird',69999.00,'Wholesale tire. This catchy, witty compilation of inventions, filled with beautiful illustrations, is a wonderful gift for collectors, enthusiasts, and curious minds. Shipping will be invoiced after the project ends. You can see shipping rates at the Shipping Rates section.'),(25,31,'Insider Access',999.00,'For people who just want to support the project without a reward. You get access to Kickstarter updates and emails tracking the progress of the project. Plus, your name will be listed as a backer in the book.'),(26,31,'Paperback',49999.00,'Insider access to project updates, your name listed as a backer in the book, the ebook, and a paperback copy of the book.'),(27,32,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(28,33,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(29,34,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(30,35,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(31,36,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(32,37,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(33,38,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(34,32,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(35,33,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(36,34,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(37,35,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(38,36,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(39,37,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(40,38,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(41,32,'Flavor of love',5999999.00,'Pledge $5,999,999 and we will name a drink after you on our menu. If you\'ve ever been to a deli before, you know this is literally better than winning an Oscar.'),(42,33,'Flavor of love',5999999.00,'Pledge $5,999,999 and we will name a drink after you on our menu. If you\'ve ever been to a deli before, you know this is literally better than winning an Oscar.'),(43,33,'Flavor of love',5999999.00,'Pledge $5,999,999 and we will name a drink after you on our menu. If you\'ve ever been to a deli before, you know this is literally better than winning an Oscar.'),(44,35,'Game Creator (PC)',5999999.00,'The game as a collaborative experience. You\'re part of it! \'Access all areas\'! Actively participate in the game development process, share your suggestions, give us feedback, discuss with the team, or sit back and relax: you\'ll still have early access to every game news and updates, video footages and live sessions. Please note we aim to complete the game around March 2022, but this reward will give you access to every version of the game (as early as inception), starting from April 2021.'),(45,36,'EMPLOYER BRANDING SPECIALIST IN HELL',5999999.00,'We need new Architects of Hell. We hope that you and Lilith will be able to retrieve the lost souls!');
/*!40000 ALTER TABLE `perk` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18  2:13:28
