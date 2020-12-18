CREATE DATABASE  IF NOT EXISTS `sponsorme` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sponsorme`;
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password_hash` varchar(128) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `salt` varchar(512) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `name` (`name`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'TuanHong','6588928f8a236996bd55cf651486321d1f390b56a6838ed778548e0a9f648be9950c69814dfe03786925921f1f6eea7c67c5383796986f22babf469b616c8e2b','tuanhong@sponsorme.com','6419577fd66a892e271cd3aa2cc99360ccd73281a0f42960292ec544caa514d5b1204664a1d5204992206a34a66de6e9ea7f5c976e2188fdb6d20c00afdb2d1b7af51ef0348da9bbfa6fa811718bf61b59679dac349c05583e017ac49f12d1b77552a4611d58f028b3b30b836929b5661bd4be3fd4c1fb779ddf5c5c3fe06e7a16388b0cf7e41e2c650181d5cc79c769dfe416dc96c6c130cf9fead86794bb0ffa628ec73092f86f12fa2494aa921d306d940b8c33eed5829351854e68764f6b41023329f066ccc6bd2b1548442e1ece52315766e05ccd870a23d601e4dae4d6b8c35daff1a9d2490e2eb6f3557714e134e406adb5ec0001726a9666d6c3de'),(2,'Kenneth','6588928f8a236996bd55cf651486321d1f390b56a6838ed778548e0a9f648be9950c69814dfe03786925921f1f6eea7c67c5383796986f22babf469b616c8e2b','kenneth@sponsorme.com','6419577fd66a892e271cd3aa2cc99360ccd73281a0f42960292ec544caa514d5b1204664a1d5204992206a34a66de6e9ea7f5c976e2188fdb6d20c00afdb2d1b7af51ef0348da9bbfa6fa811718bf61b59679dac349c05583e017ac49f12d1b77552a4611d58f028b3b30b836929b5661bd4be3fd4c1fb779ddf5c5c3fe06e7a16388b0cf7e41e2c650181d5cc79c769dfe416dc96c6c130cf9fead86794bb0ffa628ec73092f86f12fa2494aa921d306d940b8c33eed5829351854e68764f6b41023329f066ccc6bd2b1548442e1ece52315766e05ccd870a23d601e4dae4d6b8c35daff1a9d2490e2eb6f3557714e134e406adb5ec0001726a9666d6c3de'),(3,'Kim','6588928f8a236996bd55cf651486321d1f390b56a6838ed778548e0a9f648be9950c69814dfe03786925921f1f6eea7c67c5383796986f22babf469b616c8e2b','kim@sponsorme.com','6419577fd66a892e271cd3aa2cc99360ccd73281a0f42960292ec544caa514d5b1204664a1d5204992206a34a66de6e9ea7f5c976e2188fdb6d20c00afdb2d1b7af51ef0348da9bbfa6fa811718bf61b59679dac349c05583e017ac49f12d1b77552a4611d58f028b3b30b836929b5661bd4be3fd4c1fb779ddf5c5c3fe06e7a16388b0cf7e41e2c650181d5cc79c769dfe416dc96c6c130cf9fead86794bb0ffa628ec73092f86f12fa2494aa921d306d940b8c33eed5829351854e68764f6b41023329f066ccc6bd2b1548442e1ece52315766e05ccd870a23d601e4dae4d6b8c35daff1a9d2490e2eb6f3557714e134e406adb5ec0001726a9666d6c3de');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backed_project`
--

DROP TABLE IF EXISTS `backed_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backed_project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `backer_id` int DEFAULT NULL,
  `project_id` int NOT NULL,
  `perk_id` int NOT NULL,
  `backed_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backer_id` (`backer_id`),
  KEY `project_id` (`project_id`),
  KEY `perk_id` (`perk_id`),
  CONSTRAINT `backed_project_ibfk_1` FOREIGN KEY (`backer_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `backed_project_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE,
  CONSTRAINT `backed_project_ibfk_3` FOREIGN KEY (`perk_id`) REFERENCES `perk` (`perk_id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backed_project`
--

LOCK TABLES `backed_project` WRITE;
/*!40000 ALTER TABLE `backed_project` DISABLE KEYS */;
INSERT INTO `backed_project` VALUES (1,1,20,3,690.00),(2,2,20,3,690.00),(3,3,20,2,690.00),(4,11,20,1,8999.00),(5,2,21,4,1690.00),(6,4,21,4,1690.00),(7,5,21,4,1690.00),(8,3,21,5,2990.00),(9,11,21,5,2990.00),(10,1,22,8,2900.00),(11,3,22,7,1440.00),(12,11,22,6,88888.00),(13,1,23,10,1500.00),(14,2,23,10,1500.00),(15,3,23,9,600.00),(16,4,23,10,1500.00),(17,11,24,12,88888.00),(18,2,24,11,1000.00),(19,5,24,12,2500.00),(20,1,25,14,10000.00),(21,2,26,16,1500.00),(22,3,26,16,1500.00),(23,11,26,15,88888.00),(24,5,26,16,1500.00),(25,3,27,18,3900.00),(26,11,27,17,88888.00),(27,5,27,18,3900.00),(28,11,28,20,88888.00),(29,5,28,19,500.00),(30,4,28,19,3478.00),(31,1,29,21,900.00),(32,2,29,22,2900.00),(33,3,29,22,2900.00),(34,11,29,21,88888.00),(35,5,30,23,5000.00),(36,2,30,24,69999.00),(37,3,30,24,69999.00),(38,11,30,24,88888.00),(39,3,31,25,999.00),(40,11,31,26,88888.00),(41,5,31,26,49999.00),(42,11,32,27,88888.00),(43,1,32,41,5999999.00),(44,2,32,41,5999999.00),(45,11,33,42,5999999.00),(46,1,33,35,999.00),(47,2,33,42,5999999.00),(48,11,34,36,999.00),(49,1,35,44,5999999.00),(50,2,36,45,5999999.00),(51,1,36,38,999.00),(52,3,35,37,999.00),(53,3,37,39,999.00),(54,3,38,40,999.00);
/*!40000 ALTER TABLE `backed_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Backed_amount_check` BEFORE INSERT ON `backed_project` FOR EACH ROW if new.backed_amount < (
                            select price
                            from perk
                            where perk_id = new.perk_id
                        )
then set new.backed_amount = (
                                select price
                                from perk
                                where perk_id = new.perk_id
                            );
                            END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Backed_project_insertion_check` BEFORE INSERT ON `backed_project` FOR EACH ROW if new.project_id != (
                            select project_id
                            from perk
                            where perk_id = new.perk_id
                        )
then set new.project_id = (
                                select project_id
                                from perk
                                where perk_id = new.perk_id
                            );
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Backed_amount_update_check` BEFORE UPDATE ON `backed_project` FOR EACH ROW if new.backed_amount < (
                            select price
                            from perk
                            where perk_id = new.perk_id
                        )
then set new.backed_amount = (
                                select price
                                from perk
                                where perk_id = new.perk_id
                            );
                            END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Backed_project_update_check` BEFORE UPDATE ON `backed_project` FOR EACH ROW if new.project_id != (
                            select project_id
                            from perk
                            where perk_id = new.perk_id
                        )
then set new.project_id = (
                                select project_id
                                from perk
                                where perk_id = new.perk_id
                            );
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign` (
  `project_id` int NOT NULL,
  `project_status` enum('concept','prototype','production','shipping') NOT NULL,
  `story` mediumtext,
  PRIMARY KEY (`project_id`),
  CONSTRAINT `campaign_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES (20,'concept','<div id=\"campaign\" class=\"campaign-details tab-content\" style=\"display: block;\">\r\n            <h3>Story</h3>\r\n            <p>\r\n              The iPad Pro sits alone atop of the tablet game. For a tablet,\r\n              it’s as close to perfection as you’re going to get, but it is\r\n              still missing one major feature: A powerful stand&amp;case to match\r\n              its capabilities. Until now, the most portable stands and cases\r\n              did not offer eye-level viewing and adjustable angles for\r\n              ergonomic working. Your iPad Pro is your next computer and it\r\n              deserves a well-prepared stand&amp;case.\r\n            </p>\r\n            <br>\r\n            <p>\r\n              It brings you a game-changing mobile experience while working with\r\n              the iPad Pro. Most importantly, it\'s still lightweight as MOFT\r\n              product always does. MOFT Float is crafted with a built-in stand.\r\n              It remains consistent with the MOFT \"invisible design\" philosophy\r\n              of providing more functions and protections while remaining the\r\n              same slim design. Floatable when you need it and make it invisible\r\n              when you don\'t. Created with our unique \"FLOAT\" design, MOFT Float\r\n              can elevate your screen up to 3.15 inches. It takes home the crown\r\n              of the tallest portable stand&amp;case on the market, allowing you to\r\n              work anywhere without neck and shoulder pain. Besides the\r\n              adjustable angle&amp;height, The MOFT Float also provides 3 different\r\n              modes that take your iPad Pro to the next level, helping you use\r\n              your iPad Pro in many creative ways.\r\n            </p>\r\n            <h3>Risk and challenges</h3>\r\n            <p>\r\n              The iPad Pro sits alone atop of the tablet game. For a tablet,\r\n              it’s as close to perfection as you’re going to get, but it is\r\n              still missing one major feature: A powerful stand&amp;case to match\r\n              its capabilities. Until now, the most portable stands and cases\r\n              did not offer eye-level viewing and adjustable angles for\r\n              ergonomic working. Your iPad Pro is your next computer and it\r\n              deserves a well-prepared stand&amp;case.\r\n            </p>\r\n            <br>\r\n            <p>\r\n              It brings you a game-changing mobile experience while working with\r\n              the iPad Pro. Most importantly, it\'s still lightweight as MOFT\r\n              product always does. MOFT Float is crafted with a built-in stand.\r\n              It remains consistent with the MOFT \"invisible design\" philosophy\r\n              of providing more functions and protections while remaining the\r\n              same slim design. Floatable when you need it and make it invisible\r\n              when you don\'t. Created with our unique \"FLOAT\" design, MOFT Float\r\n              can elevate your screen up to 3.15 inches. It takes home the crown\r\n              of the tallest portable stand&amp;case on the market, allowing you to\r\n              work anywhere without neck and shoulder pain. Besides the\r\n              adjustable angle&amp;height, The MOFT Float also provides 3 different\r\n              modes that take your iPad Pro to the next level, helping you use\r\n              your iPad Pro in many creative ways.\r\n            </p>\r\n          </div>');
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment` text,
  `parent_comment` int DEFAULT NULL,
  `comment_date` date NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  KEY `parent_comment` (`parent_comment`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`parent_comment`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,20,1,'Hi, I\'ve PMed a message a while back / sent an email but have not received a response',NULL,'2020-12-17'),(2,20,2,'Hi. Can i change my shipping address to different country?',NULL,'2020-12-17'),(3,20,4,'Have you allready sent us the survey?, because I haven’t recieved it yet.',NULL,'2020-12-17'),(4,20,5,'Hello, thanks for your support. The survey will be sent out before shipping which is expected to start in 2021 January,',3,'2020-12-17'),(5,21,3,'Does the SSD model allow you to add an external drive to increase local storage or am I limited to the size of the SSD? If I change my pledge for a unit without internal storage can I add all the external storage I want?',NULL,'2020-12-17'),(6,21,11,'Would it be compatible with encrypted external hard drives (e.g. The WD passport)?',NULL,'2020-12-17'),(7,21,1,'Hi Raul, Extending the internal storage is not possible, but it can be exchanged to a larger one. For the non-SSD version, you can use any USB drive to be the primary storage.',5,'2020-12-17'),(8,21,1,'Hi, It\'s not possible.',6,'2020-12-17'),(9,22,1,'Hey, it seems like a great idea! I\'ve seen some DIY projects of motorized hand grinders and even started gathering parts for my own adaptation. Now... I may do it some day but I\'m looking forward to ARCO :)',NULL,'2020-12-17'),(10,22,3,'I\'m grad that I was able to catch one of the super early 2in1 Arco. I just what to ask if you will provide add-on kits such as a brush, Case for the hand grinder, additional holding cup and cap for the cup (could be Vacuum cap \"I wish\") and so on... many of us would love to buy them. I hope that you are planning for it ^^!',NULL,'2020-12-17'),(11,24,11,'I am a film and music enthusiast from the Deep South of Japan, who used to live nearby Hakozaki Shrine. I am looking forward your project!',NULL,'2020-12-17'),(12,25,4,'Starting strong with over $2K raised in just 1 day thanks to our Kickstarter21 backers. But there\'s still work to be done to reach $20K in 26 days. Join the community of film supporters by pledging today.',NULL,'2020-12-17'),(13,27,5,'I am so happy this is successful. Well done! Looking forward to the concert. Check out my card game on Kickstarter \"CHOOSE A BETTER TOMORROW\".',NULL,'2020-12-17'),(14,27,3,'I\'m so excited for this',NULL,'2020-12-17'),(15,28,1,'Congratulations on reaching the funding goal!',NULL,'2020-12-17'),(16,29,2,'I also pledged an extra $29 for the original book to be included with my order because I didn\'t see a way to combine pledges. Thank you.',NULL,'2020-12-17'),(17,29,11,'Hi - how do I make two pledges? One for the book and one for an original Benda book, for instance? Seems to be one or the other, not both.',NULL,'2020-12-17'),(18,29,4,'Yes, great, I\'ll keep a track of your order. Thank you.',16,'2020-12-17'),(19,29,4,'Hi, it should be possible to combine pledges. If it is not available, choose one reward (for instance Standard edition of JB book for US$59) and pledge an extra US$29 for the f.e. original book (in total with shipping US$119). You’ll save on shipping, all will be shipped in one time and I will take personal care of your order to get everything all right. Thank you for your support, Robin! Really appreciate. Petra',17,'2020-12-17'),(20,29,11,'Great, thanks - I will have to do it on checking out when it comes to the final confirmation, as I can\'t work out how to do it now...',19,'2020-12-17'),(21,30,2,'Brilliant Idea! Cannot wait to see the finished product and very excited to be on this journey with you all! Make sure to spread the word and tell your friends. The more The Book out there the better chance humanity has at surviving when/if the world collapses :P',NULL,'2020-12-17'),(22,30,3,'@creator how do you plan on using the funds and any guarantees this project won’t go bust like so many others? So just burned too many times',NULL,'2020-12-17'),(23,30,5,'HI \'The Book\' friends! With the book growing more and more, what have your thoughts been on adding 2-3 ribbon bookmarks onto the book to help keep track of preferred chapters/pages?',NULL,'2020-12-17'),(24,31,1,'I\'m very excited for you on how successful this campaign has been and continues to be! I\'ve loved all the books so far and really look forward to this to continue my set. Good luck on all the continued success and thank you for the wonderful and informative updates.',NULL,'2020-12-17'),(25,31,3,'You do amazing and inspiring work. I am so happy to see the great success this Kickstarter is having, it is truly deserved. For the past 10 years I have been running table top roleplaying games set in Japan. Once I discovered your books, they entered the inventories of the player characters to help them solve the mysteries about the strange Yokai they encountered. Thank you for these amazing resources.',NULL,'2020-12-17'),(26,31,2,'Thank you so much!',24,'2020-12-17'),(27,31,2,'Thanks! I\'m glad they\'ve been helpful!',25,'2020-12-17'),(28,32,1,'I want you to succeed, to encourage others to take charge and take action. I raise my cup of bean water to your team.',NULL,'2020-12-17'),(29,33,3,'Thank you again for inviting us over for your delicious food today - your hot Yuzu tea was amazing, which inspired me to update my pledge :-) . I\'m reaching out to all my social media contacts to spread the word. Happy Holidays and best of luck!',NULL,'2020-12-17'),(30,33,4,'I can\'t tell you how much we appreciate your help! I truly thank you from the bottom of my heart. We will serve some gluten free menus at our restaurant. Please come and enjoy them :)',29,'2020-12-17'),(31,35,1,'So you could play with pc people playing from PS4 for example?',NULL,'2020-12-17'),(32,35,3,'Hi! I\'ve just back the project and I\'m hyped to see the progress made over the next little while. Question though, I\'m on a MacBook. Will the game be playable on Mac? or only on windows linux, etc?',NULL,'2020-12-17'),(33,35,11,'Hope this kicks off lol cnt wait to be running around as my fave storrors',NULL,'2020-12-17'),(34,35,2,'Hi, we are developing the game cross-platform but it\'s unluckily that a fully-fledged Mac version will be playable. I can\'t give you a final answer right now but it doesn\'t look probable at the moment.',32,'2020-12-17'),(35,36,1,'I don\'t normally play on my laptop, but was ready to try out the demo this weekend while I was on holidays and was disappointed that it\'s not able to be played on Mac OS X 10.15. Any chance of rebuilding the demo for the most recent Mac OS X update?',NULL,'2020-12-17'),(36,36,2,'It looks like the art book is strictly digital, is that correct?',NULL,'2020-12-17'),(37,36,11,'Behold, We have finally reached the 4th circle of heck, We now begin to drag ourselves over to the 5th circle and get try to hire some Succubi Interns to help handle the latest influx of sinners.',NULL,'2020-12-17'),(38,36,3,'Only final version of Hell will be on Mac OSX',35,'2020-12-17'),(39,36,3,'correct',36,'2020-12-17'),(40,36,3,':) We are waiting :)',37,'2020-12-17'),(41,37,3,'Could the lion fountains be redesigned? Or some additional printing on them? They look a bit bland.',NULL,'2020-12-17'),(42,37,2,'Can you please offer the new artwork versions of the six original expansions as a standalone? Otherwise I will be buying the base game for the third time (my original purchase 15 years ago, the Revised Kickstarter from last year, and now this one). Thanks.',NULL,'2020-12-17'),(43,37,1,'There is a significant difference between how the punchboards are laid out for a base game, and how we have to lay them out for individual expansions, such that we would have to print them as totally different products. At the moment, we do not forsee enough demand for the expansions as stand alone products to warrant a new print run of them with the revised artwork, so we aren\'t able to offer them as stand alones. (We might print them in the future, but we do not have plans to at this time).',42,'2020-12-17'),(44,37,2,'Thanks for the reply. As long as you looked at laying out the expansions as their own punchboards and could not make that work, then I can understand this. My hope is that you did, in consideration of long-time fans of the game like me. I am fairly certain I am not alone in this.',43,'2020-12-17'),(45,38,1,'It\'s awesome that the stretch goals are going to be exclusives..is the maptile standee serve a purpose in the game? First player marker maybe?',NULL,'2020-12-17'),(46,38,3,'It\'s great to see that such cool games as these are the second most backed and second most funded campaign in tabletop games right now!',NULL,'2020-12-17'),(47,38,5,'Will the slipcase has some cuts on the side so we can remove games from it without having to tip the whole box on an angle? Like a half circle so we can get purchase on the boxes inside.',NULL,'2020-12-17');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `question` tinytext NOT NULL,
  `answer` text,
  PRIMARY KEY (`question_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,20,'Which iPads are compatible with MOFT Float 11\"?','iPad Air 2020, iPadPro 11-in (1st generation) 2018, iPadPro 11-in (2nd generation) 2020'),(2,20,'Which iPads are compatible with MOFT Float 12.9\"?','iPadPro 12.9-in (3rd generation) 2018, iPadPro 12.9-in (4th generation) 2020'),(3,20,'How high does MOFT Float raise the iPad screen','It can elevate the screen up to 3.15in/8cm when it\'s used in Floating Mode.'),(4,20,'What is MOFT Float made of?','It\'s made of TPU, glassfiber, PC, magnets, aluminum, alloy steel and silicone.'),(5,21,'What makes Monument different?','It\'s a powerful photo storage and organization solution while providing cloud-level experience and protecting privacy.'),(6,21,'When will it be available?','Estimated shipping date is May 2021.'),(7,21,'How does it differ from Google Photos?','Compared to Google Photos, Monument provides a similar photo management experience while protecting user privacy and security. We do not use, market, or sell any personal data. None of your content is visible except you.'),(8,29,'Why don\'t you use hard cover on your Special Limited Edition of the book?','We did not intend to design a monumental publication, that would be heavyweight, thick, and solid as a tombstone as it usually is. We wanted to make Benda\'s book more lively, nice, easily open publication, accessible to the young generation, which is afraid of reading books and scared of milestone publications. Graphic layout is also corresponding to that logic – no wasting with paper and white spaces, as much information as possible in the shortest text possible. Also, we spent much time choosing the right paper and cover materials to make this book light, nicely flexible, and soft in touch. We wanted to create a sexy book full of interesting images and content. Usually, the production lacks sophisticated details and materials. Our book is mainly about the content, form follows function and materials are top quality. So for the Special Limited Edition, we tried to keep the same approach, only add luxurious paper on the cover, use silkscreen print, sign all of the books personally and limit the number of copies.'),(9,29,'Why is the shipping in EU expensive?','We know, it\'s a lot. Yet, we don\'t know the exact weight of the book (translation and new additions might enlarge the number of pages). So we had to choose to heavier option – under 2 kg. Another problem we had in our country is almost a state monopoly on postal service. We were given a general price for the whole of Europe. We couldn\'t differentiate between each EU country separately. Sending one or two parcels is another thing than sending hundreds (by ourselves).'),(10,30,'How do I order more than one pledge?','You can\'t'),(11,30,'How do I pay for shipping?','Shipping will be invoiced after the project ends in Bakerkit. You can see shipping rates at the Shipping Rates section.'),(12,31,'How will shipping fee be calculated?','After the project is funded, pledges will be handled by BackerKit. In BackerKit it is possible to calculate more precise shipping costs based on your country and the weight of your package, to minimize the shipping costs to you.'),(13,33,'Why does it enter $10 extra than the listed amount when I enter for a pledge?','The extra $10 is the shipping cost for the item to be shipped out. Anywhere else in the world (outside of U.S) may cost more.'),(14,33,'I backed a knife and would like my name on it, how/where do I submit that info','Once we reach our goal, we will reach out individually to everyone who kindly backed our project! Then, we will ask you for all the necessary information. Until then, please hang tight and think about what you would like to say on your chef\'s selection knife! :)'),(15,35,'Is £55k enough to make a video game on this level?','Yep, £55k is low and actually we are hoping to raise a lot more than that. The kickstarter funds are only aiming to cover the budget of motion capture and sounds design. The rest is covered by our existing fundings. We have plans to raise more through other avenues.'),(16,35,'You said the \'world\'s first pure parkour game\' what about Mirrors Edge?','Mirrors Edge, although a fun game is not a good comparison for what we are developing. Mirrors Edge is simple action-adventure platform game with a weird story, it is completely ignorant to the culture of the sport it is trying to emulate and covers up its lack of parkour controls by forcing the player into combat situations.'),(17,35,'Is the game going to be 3rd person or POV?','Both! We are planning on giving the player the option to toggle between either perspectives. This way we get the best of both worlds, you can see the movement animation in 3rd person, and you can feel the sense of vertigo in POV.'),(18,38,'If I want extra copies of the games, can I over pledge ahead of time to set aside funds for the additional item(s)?','Yes! You can always over pledge on Kickstarter. You can reach out to us through the \'contact me\' button on our creator page if you need confirmation on the exact amount of funds you\'ll need to add to your initial pledge. Then when we conduct the survey at the end of the campaign, you can add a note about which extra copies you wanted.'),(19,38,'What will my shipping cost be?','The shipping costs can be found in each individual tier of the campaign page, and are the best rates available to us at the time of fulfillment. They are based on actual costs to ship your rewards (depending on your country) and will be charged as part of your pledge. In some regions, the cost of shipping may exceed the cost of the tier you’re pledging for; unfortunately, this cannot be avoided. In most cases, pledging for two or three games (“Double Trouble” and \"Slipcase Exclusive\" Tiers) costs almost the same in terms of shipping as pledging for one game.');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) DEFAULT NULL,
  `project_id` int NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (127,'MOFT Float',20),(128,'MOFT Keyboard',20),(129,'Monument 2',21),(130,'Universal power supply',21),(131,'Monument 2 SSD (1TB)',21),(132,'Handle',22),(133,'ARCO hand grinder',22),(134,'ARCO electric dock',22),(135,'Polaroids (Digital)',23),(136,'Emilio\'s Letter (Digital)',23),(137,'Mailman Guide (Digital)',23),(138,'Carta Prat Vol.1 & 2 (Digital)',23),(139,'Online film screening, months ahead of release',24),(140,'Digital download - The Film',24),(141,'Backer credit in film',24),(142,'Pledge without reward',26),(143,'Endroll Credits',27),(144,'VIP Newsletter Subscription',27),(145,'Theme Song Early Access',27),(146,'SONOCA Music Download Card Set',27),(147,'Thank you card',28),(148,'Digital album download',28),(149,'Physical CD',28),(150,'Thank you from the authors',29),(151,'Your name in imprint of the book',29),(152,'1 original book',29),(153,'Digital version',30),(154,'2 x The Book',30),(155,'ebook version of The Fox\'s Wedding',31),(156,'paperback version of The Fox\'s Wedding',31),(157,'your name listed as a backer in the book',31),(158,'Final PC Game digital download.',35),(159,'Exclusive access to the game development',35),(160,'Early access to updates, announcements, game footage...',35),(161,'In-game \'Creator-Backer\' badge.',35),(162,'FREE in-game store voucher, worth £20.',35),(163,'Early access to the Hell Architect Prologue',36),(164,'A name for one of the demons',36),(165,'Your own painting - an in-game decor item',36),(166,'LIVESTREAM WITH THE DEV TEAM',36),(167,'4 more keys for your friends',36),(168,'Physical game (in a BOX!)',36);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_option`
--

DROP TABLE IF EXISTS `item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_option` (
  `option_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `option_provided` tinytext NOT NULL,
  PRIMARY KEY (`option_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `item_option_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_option`
--

LOCK TABLES `item_option` WRITE;
/*!40000 ALTER TABLE `item_option` DISABLE KEYS */;
INSERT INTO `item_option` VALUES (1,127,'MOFT Float 11\"'),(2,127,'MOFT Float 12.9\"'),(3,128,'US layout'),(4,128,'British layout');
/*!40000 ALTER TABLE `item_option` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `perk` VALUES (1,20,'MOFT Float - Super Early Bird *1',390.00,'Two Sizes to Choose(11\"/12.9\"). We will send you a survey to collect the size options and mailing address after the campaign ends. Will retail for $59 | 34% off retail'),(2,20,'MOFT Float - Super Early Bird *2',690.00,'Two Sizes to Choose(11\"/12.9\"). We will send you a survey to collect the size options and mailing address after the campaign ends. Will retail for $1080 | 36% off retail'),(3,20,'Workstation Combo - Super Early Bird *1',690.00,'Two Sizes to Choose(11\"/12.9\"). We will send you a survey to collect the size options and mailing address after the campaign ends. Will retail for $1180 | 37% off retail'),(4,21,'Monument 2',1690.00,' Storage is not included. Plug-in your own SSD module or USB drive. ◇ Taxes will be collected after the campaign. ◇ Pledge as a gift available.'),(5,21,'Monument 2 SSD 1TB | Early Bird',2990.00,'Built-in 1TB SSD storage included. ◇ Taxes will be collected after the campaign. ◇ Pledge as a gift available.'),(6,22,'Super Early Bird - ARCO hand grinder',1250.00,'With superb grind consistency and simple grind adjustment, you\'ll be ready to take this hand grinder anywhere!'),(7,22,'Early Bird - ARCO hand grinder',1440.00,'With superb grind consistency and simple grind adjustment, you\'ll be ready to take this hand grinder anywhere!'),(8,22,'Early Bird - ARCO 2-in-1',2900.00,'The 2-in-1 coffee grinder that will change the way you grind. Forever.'),(9,23,'ALUMNO REGULAR',600.00,'¡Gracias por tu apoyo! Como recompensa te enviaremos regalos digitales exclusivos de este Kickstarter: Thanks for your support! As a reward we\'ll send you exclusive digital files made for this Kickstarter:'),(10,23,'ALTO RENDIMIENTO',1500.00,'Regalos digitales exclusivos de este Kickstarte y con los primeros tomos de la historia de CARTA PRAT en eBook. Digital rewards exclusively made for this Kickstarter besides the first two book of the CARTA PRAT comic series.'),(11,24,'Online film screening',1000.00,'Films usually get a release date only after finishing their festival circulation (which can take up to 2 years). However, every backer will have an exclusive opportunity to see the film in an online screening event - months before release date.'),(12,24,'The Film (Download) & Backer Credit',2500.00,'All of the above, plus: 1. Digital download of the film, delivered after release date. 2. You will be credited as Backer in end credits of the film.'),(13,25,'Every Dollar Counts!',1.00,'We will include your name on the backers thank you page on our website, plus you\'ll get access to the backer updates.'),(14,25,'Thank You in Our App!',10000.00,'Your name will be listed on a page in our exclusive festival mobile app, as well as on the big screen at the festival during the pre-show slides and on our website, plus you\'ll get access to the backer updates.'),(15,26,'Pledge without reward',200.00,'Contribute because you love all things jazz, and want to see this amazing project see the light of day!'),(16,26,'Sound of Detroit Digital album',1500.00,'Strata Records-The Sound Of Detroit-Reimagined By Jazzanova digital album. Be the first to receive an exclusive download of the album fresh after mastering!'),(17,27,'VIP Membership',1000.00,''),(18,27,'Music Pack',3900.00,''),(19,28,'Digital Thank You Card',500.00,'You will receive a personalized thank you email from us. Every little bit helps!'),(20,28,'Signed Copy of the Album',2000.00,'1 physical copy of the CD signed by Trio Ghidorah.'),(21,29,'Your name in imprint of the book',900.00,'Even small help is meaningful! Thank you for your support. Your name will be placed on the page of honour in our upcoming publication.'),(22,29,'Original book designed by Jaroslav Benda',2900.00,'Receive a rare publication carefully selected from the author\'s collection of Jaroslav Benda\'s artworks, restored with the utmost care to perfect condition. Original language: Czech.'),(23,30,'DIGITAL VERSION',5000.00,'The Ultimate Guide To Rebuilding A Civilization. Over 400 pages of detailed and catchy illustrations.'),(24,30,'Super Early Bird',69999.00,'Wholesale tire. This catchy, witty compilation of inventions, filled with beautiful illustrations, is a wonderful gift for collectors, enthusiasts, and curious minds. Shipping will be invoiced after the project ends. You can see shipping rates at the Shipping Rates section.'),(25,31,'Insider Access',999.00,'For people who just want to support the project without a reward. You get access to Kickstarter updates and emails tracking the progress of the project. Plus, your name will be listed as a backer in the book.'),(26,31,'Paperback',49999.00,'Insider access to project updates, your name listed as a backer in the book, the ebook, and a paperback copy of the book.'),(27,32,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(28,33,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(29,34,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(30,35,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(31,36,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(32,37,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(33,38,'True Romance',1.00,'Pledge $1 and we will tell one of our cats that you love them. Please indicate which cat you\'d like to give love: Franklin Beans, Copernicus, Memphis Blue, Figaro, Samuel L. Catsen, Kyle, Nox, Barnus, Sponge, Bart Simpson, Meowmeow.'),(34,32,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(35,33,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(36,34,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(37,35,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(38,36,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(39,37,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(40,38,'Friend Request',999.00,'Pledge $10 and we will post an Instagram story highlighting all of your best qualities.'),(41,32,'Flavor of love',5999999.00,'Pledge $5,999,999 and we will name a drink after you on our menu. If you\'ve ever been to a deli before, you know this is literally better than winning an Oscar.'),(42,33,'Flavor of love',5999999.00,'Pledge $5,999,999 and we will name a drink after you on our menu. If you\'ve ever been to a deli before, you know this is literally better than winning an Oscar.'),(44,35,'Game Creator (PC)',5999999.00,'The game as a collaborative experience. You\'re part of it! \'Access all areas\'! Actively participate in the game development process, share your suggestions, give us feedback, discuss with the team, or sit back and relax: you\'ll still have early access to every game news and updates, video footages and live sessions. Please note we aim to complete the game around March 2022, but this reward will give you access to every version of the game (as early as inception), starting from April 2021.'),(45,36,'EMPLOYER BRANDING SPECIALIST IN HELL',5999999.00,'We need new Architects of Hell. We hope that you and Lilith will be able to retrieve the lost souls!');
/*!40000 ALTER TABLE `perk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) DEFAULT NULL,
  `funding_goal` decimal(10,2) NOT NULL,
  `small_description` text,
  `category` enum('tech','design','film','art','publish','food','game') NOT NULL,
  `creator_id` int NOT NULL,
  `creation_date` date NOT NULL,
  `team` text,
  PRIMARY KEY (`project_id`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (20,'MOFT Float: Invisible Stand&Case for iPad Pro&New iPad Air',500000.00,'A slim stand&case that provides adjustable height and unlimited angles. Taking your iPad Pro to next-level height and experience.','tech',5,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(21,'Monument 2: Smart photo storage and organization',700000.00,'The next generation smart photo storage and organization that protects your privacy.','tech',1,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(22,'ARCO 2-in-1 Coffee Grinder',400000.00,'Combining the luxury of electrical and the freedom of a hand grinder.','tech',2,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(23,'Carta Prat: The Animation',40000.00,'Carta Prat is an animation project in development, help us make the Pilot episode!','film',11,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(24,'Shinto: The Way of The Kami',30000.00,'A documentary film about Shinto, the Japanese philosophy of life, and Hiroko, a Shinto priestess.','film',3,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(25,'45th Atlanta Film Festival: Building Community Through Film',10000.00,'ATLFF21 is not just April 22nd to May 2nd, but a year-round experience that fosters a thriving film community.','film',4,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(26,'Strata Records-The Sound of Detroit-Reimagined by Jazzanova',5000.00,'Help 180 Proof Records and Jazzanova reimagine music from the legendary Strata catalog for an album release.','art',1,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(27,'Hatsune Miku Global Concert \"HATSUNE MIKU EXPO 2021 Online\"',100000.00,'Help us create an online show featuring virtual singer Hatsune Miku!','art',2,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(28,'Dances and Fantasies: Debut Album from Trio Ghidorah',1000.00,'Music composed and arranged for three guitars featuring pieces by Stephen Dodgson, Annette Kruisbrink, Philip Glass and more!','art',3,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(29,'Jaroslav Benda 1882–1970 Typographic designs and letterforms',20000.00,'Extraordinary book about one of the important figures in the history of Czech Republic – English edition 2021.','publish',4,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(30,'The Book',7000.00,'The Ultimate Guide To Rebuilding A Civilization. Over 400 pages of detailed and catchy illustrations.','publish',1,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(31,'The Fox\'s Wedding: a Compendium of Japanese Folklore',50000.00,'A fully illustrated encyclopedia with over 100 illustrations of yokai, ghosts, demons, and fox spirits from Japanese folklore.','publish',2,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(32,'Slow Bloom Coffee Cooperative: Building a Coffee Roastery',400000.00,'Looking for hyper generous coffee lovers to help us fundraise our ~hyper cool~ coffee cooperative: Slow Bloom Coffee Cooperative.','food',3,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(33,'Chef Katsu Brooklyn',30000.00,'We hope CKB will be your family\'s go-to spot for your Japanese comfort food fix, while being health conscious :)','food',4,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(34,'Kimchi Hotel: Fermentation garden & community hub, Amsterdam',10000.00,'Join in to complete the sustainable garden for the full circle of fermentation experience, community gardening, art exhibitions, & more','food',1,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(35,'STORROR Parkour PRO',60000.00,'The OFFICIAL Parkour Videogame Experience','game',2,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(36,'Hell Architect – Build and manage your own Hell',30000.00,'Hell Architect - the game where you can create and manage your own hell! Join Lucifer corporation and be the first Hell Manager!','game',3,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(37,'Alhambra Big Box 2nd Edition',3000.00,'All new artwork, all 6 expansions, 2 Queenies and Tile Dispenser Tower!','game',1,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>'),(38,'Steven Rhodes Games',23000.00,'A 3-Pack of games featuring Steven Rhodes\' unique style of nostalgia with a twist of darkness','game',2,'2020-12-15','<div id=\"team\" class=\"tab-content\" style=\"display: block;\">\r\n            <h3>About</h3>\r\n            <p>\r\n              Short description of the team <br>\r\n              MOFT stands for “Mobile Office for Travelers”. <br><br>We\r\n              design innovative, easy-to-use productivity accessories enabling\r\n              people to be more efficient with less equipment via unique, smart\r\n              design. <br><br>MOFT aims to transform individuals\' devices to\r\n              work their way, giving them the ability to explore life’s\r\n              adventures while maintaining their productivity. <br><br>We\r\n              make the world your office.\r\n            </p>\r\n            <h3>Team</h3>\r\n            <div class=\"team-members\">\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n              <div class=\"member\">\r\n                <img src=\"../assets/project-categories-header-image/all.jpg\" alt=\"\" width=\"300\" height=\"300\">\r\n                <p>Kim Sheng Yong</p>\r\n              </div>\r\n            </div>\r\n            <div>\r\n              <h3>Contact</h3>\r\n              <p>Email: absdf@gmail.com</p>\r\n            </div>\r\n    </div>');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_picture`
--

DROP TABLE IF EXISTS `project_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_picture` (
  `picture_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `picture_name` varchar(100) NOT NULL,
  PRIMARY KEY (`picture_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `project_picture_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_picture`
--

LOCK TABLES `project_picture` WRITE;
/*!40000 ALTER TABLE `project_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward_item`
--

DROP TABLE IF EXISTS `reward_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reward_item` (
  `perk_id` int NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`perk_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `reward_item_ibfk_1` FOREIGN KEY (`perk_id`) REFERENCES `perk` (`perk_id`) ON DELETE CASCADE,
  CONSTRAINT `reward_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward_item`
--

LOCK TABLES `reward_item` WRITE;
/*!40000 ALTER TABLE `reward_item` DISABLE KEYS */;
INSERT INTO `reward_item` VALUES (1,127),(2,127),(3,127),(3,128),(4,129),(4,130),(5,130),(5,131),(6,132),(7,132),(8,132),(6,133),(7,133),(8,133),(8,134),(9,135),(10,135),(9,136),(10,136),(10,137),(10,138),(11,139),(12,139),(12,140),(12,141),(16,142),(17,143),(18,143),(17,144),(18,144),(18,145),(18,146),(19,147),(20,147),(20,148),(20,149),(21,150),(22,150),(21,151),(22,151),(22,152),(23,153),(24,154),(26,155),(26,156),(26,157),(44,158),(44,159),(44,160),(44,161),(44,162),(45,163),(45,164),(45,165),(45,166),(45,167),(45,168);
/*!40000 ALTER TABLE `reward_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `profile_picture_name` varchar(100) DEFAULT 'default_user_icon',
  `password_hash` varchar(128) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `registration_date` date NOT NULL,
  `salt` varchar(512) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'TuanHong','default_user_icon','6588928f8a236996bd55cf651486321d1f390b56a6838ed778548e0a9f648be9950c69814dfe03786925921f1f6eea7c67c5383796986f22babf469b616c8e2b','tuanhong@sponsorme.com','2020-12-15','6419577fd66a892e271cd3aa2cc99360ccd73281a0f42960292ec544caa514d5b1204664a1d5204992206a34a66de6e9ea7f5c976e2188fdb6d20c00afdb2d1b7af51ef0348da9bbfa6fa811718bf61b59679dac349c05583e017ac49f12d1b77552a4611d58f028b3b30b836929b5661bd4be3fd4c1fb779ddf5c5c3fe06e7a16388b0cf7e41e2c650181d5cc79c769dfe416dc96c6c130cf9fead86794bb0ffa628ec73092f86f12fa2494aa921d306d940b8c33eed5829351854e68764f6b41023329f066ccc6bd2b1548442e1ece52315766e05ccd870a23d601e4dae4d6b8c35daff1a9d2490e2eb6f3557714e134e406adb5ec0001726a9666d6c3de'),(2,'Kenneth','default_user_icon','6588928f8a236996bd55cf651486321d1f390b56a6838ed778548e0a9f648be9950c69814dfe03786925921f1f6eea7c67c5383796986f22babf469b616c8e2b','kenneth@sponsorme.com','2020-12-15','6419577fd66a892e271cd3aa2cc99360ccd73281a0f42960292ec544caa514d5b1204664a1d5204992206a34a66de6e9ea7f5c976e2188fdb6d20c00afdb2d1b7af51ef0348da9bbfa6fa811718bf61b59679dac349c05583e017ac49f12d1b77552a4611d58f028b3b30b836929b5661bd4be3fd4c1fb779ddf5c5c3fe06e7a16388b0cf7e41e2c650181d5cc79c769dfe416dc96c6c130cf9fead86794bb0ffa628ec73092f86f12fa2494aa921d306d940b8c33eed5829351854e68764f6b41023329f066ccc6bd2b1548442e1ece52315766e05ccd870a23d601e4dae4d6b8c35daff1a9d2490e2eb6f3557714e134e406adb5ec0001726a9666d6c3de'),(3,'Kim','default_user_icon','6588928f8a236996bd55cf651486321d1f390b56a6838ed778548e0a9f648be9950c69814dfe03786925921f1f6eea7c67c5383796986f22babf469b616c8e2b','kim@sponsorme.com','2020-12-15','6419577fd66a892e271cd3aa2cc99360ccd73281a0f42960292ec544caa514d5b1204664a1d5204992206a34a66de6e9ea7f5c976e2188fdb6d20c00afdb2d1b7af51ef0348da9bbfa6fa811718bf61b59679dac349c05583e017ac49f12d1b77552a4611d58f028b3b30b836929b5661bd4be3fd4c1fb779ddf5c5c3fe06e7a16388b0cf7e41e2c650181d5cc79c769dfe416dc96c6c130cf9fead86794bb0ffa628ec73092f86f12fa2494aa921d306d940b8c33eed5829351854e68764f6b41023329f066ccc6bd2b1548442e1ece52315766e05ccd870a23d601e4dae4d6b8c35daff1a9d2490e2eb6f3557714e134e406adb5ec0001726a9666d6c3de'),(4,'hanmeimei','default_user_icon','6588928f8a236996bd55cf651486321d1f390b56a6838ed778548e0a9f648be9950c69814dfe03786925921f1f6eea7c67c5383796986f22babf469b616c8e2b','hanmeimei@gmail.com','2020-12-15','6419577fd66a892e271cd3aa2cc99360ccd73281a0f42960292ec544caa514d5b1204664a1d5204992206a34a66de6e9ea7f5c976e2188fdb6d20c00afdb2d1b7af51ef0348da9bbfa6fa811718bf61b59679dac349c05583e017ac49f12d1b77552a4611d58f028b3b30b836929b5661bd4be3fd4c1fb779ddf5c5c3fe06e7a16388b0cf7e41e2c650181d5cc79c769dfe416dc96c6c130cf9fead86794bb0ffa628ec73092f86f12fa2494aa921d306d940b8c33eed5829351854e68764f6b41023329f066ccc6bd2b1548442e1ece52315766e05ccd870a23d601e4dae4d6b8c35daff1a9d2490e2eb6f3557714e134e406adb5ec0001726a9666d6c3de'),(5,'moft','default_user_icon','6588928f8a236996bd55cf651486321d1f390b56a6838ed778548e0a9f648be9950c69814dfe03786925921f1f6eea7c67c5383796986f22babf469b616c8e2b','moft@gmail.com','2020-12-15','6419577fd66a892e271cd3aa2cc99360ccd73281a0f42960292ec544caa514d5b1204664a1d5204992206a34a66de6e9ea7f5c976e2188fdb6d20c00afdb2d1b7af51ef0348da9bbfa6fa811718bf61b59679dac349c05583e017ac49f12d1b77552a4611d58f028b3b30b836929b5661bd4be3fd4c1fb779ddf5c5c3fe06e7a16388b0cf7e41e2c650181d5cc79c769dfe416dc96c6c130cf9fead86794bb0ffa628ec73092f86f12fa2494aa921d306d940b8c33eed5829351854e68764f6b41023329f066ccc6bd2b1548442e1ece52315766e05ccd870a23d601e4dae4d6b8c35daff1a9d2490e2eb6f3557714e134e406adb5ec0001726a9666d6c3de'),(11,'ximena','default_user_icon','6588928f8a236996bd55cf651486321d1f390b56a6838ed778548e0a9f648be9950c69814dfe03786925921f1f6eea7c67c5383796986f22babf469b616c8e2b','ximena@gmail.com','2020-12-15','6419577fd66a892e271cd3aa2cc99360ccd73281a0f42960292ec544caa514d5b1204664a1d5204992206a34a66de6e9ea7f5c976e2188fdb6d20c00afdb2d1b7af51ef0348da9bbfa6fa811718bf61b59679dac349c05583e017ac49f12d1b77552a4611d58f028b3b30b836929b5661bd4be3fd4c1fb779ddf5c5c3fe06e7a16388b0cf7e41e2c650181d5cc79c769dfe416dc96c6c130cf9fead86794bb0ffa628ec73092f86f12fa2494aa921d306d940b8c33eed5829351854e68764f6b41023329f066ccc6bd2b1548442e1ece52315766e05ccd870a23d601e4dae4d6b8c35daff1a9d2490e2eb6f3557714e134e406adb5ec0001726a9666d6c3de');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-19  0:41:20
