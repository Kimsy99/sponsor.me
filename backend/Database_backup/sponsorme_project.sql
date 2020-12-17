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
INSERT INTO `project` VALUES (20,'MOFT Float: Invisible Stand&Case for iPad Pro&New iPad Air',500000.00,'A slim stand&case that provides adjustable height and unlimited angles. Taking your iPad Pro to next-level height and experience.','tech',5,'2020-12-15'),(21,'Monument 2: Smart photo storage and organization',700000.00,'The next generation smart photo storage and organization that protects your privacy.','tech',1,'2020-12-15'),(22,'ARCO 2-in-1 Coffee Grinder',400000.00,'Combining the luxury of electrical and the freedom of a hand grinder.','tech',2,'2020-12-15'),(23,'Carta Prat: The Animation',40000.00,'Carta Prat is an animation project in development, help us make the Pilot episode!','film',11,'2020-12-15'),(24,'Shinto: The Way of The Kami',30000.00,'A documentary film about Shinto, the Japanese philosophy of life, and Hiroko, a Shinto priestess.','film',3,'2020-12-15'),(25,'45th Atlanta Film Festival: Building Community Through Film',10000.00,'ATLFF21 is not just April 22nd to May 2nd, but a year-round experience that fosters a thriving film community.','film',4,'2020-12-15'),(26,'Strata Records-The Sound of Detroit-Reimagined by Jazzanova',5000.00,'Help 180 Proof Records and Jazzanova reimagine music from the legendary Strata catalog for an album release.','art',1,'2020-12-15'),(27,'Hatsune Miku Global Concert \"HATSUNE MIKU EXPO 2021 Online\"',100000.00,'Help us create an online show featuring virtual singer Hatsune Miku!','art',2,'2020-12-15'),(28,'Dances and Fantasies: Debut Album from Trio Ghidorah',1000.00,'Music composed and arranged for three guitars featuring pieces by Stephen Dodgson, Annette Kruisbrink, Philip Glass and more!','art',3,'2020-12-15'),(29,'Jaroslav Benda 1882–1970 Typographic designs and letterforms',20000.00,'Extraordinary book about one of the important figures in the history of Czech Republic – English edition 2021.','publish',4,'2020-12-15'),(30,'The Book',7000.00,'The Ultimate Guide To Rebuilding A Civilization. Over 400 pages of detailed and catchy illustrations.','publish',1,'2020-12-15'),(31,'The Fox\'s Wedding: a Compendium of Japanese Folklore',50000.00,'A fully illustrated encyclopedia with over 100 illustrations of yokai, ghosts, demons, and fox spirits from Japanese folklore.','publish',2,'2020-12-15'),(32,'Slow Bloom Coffee Cooperative: Building a Coffee Roastery',400000.00,'Looking for hyper generous coffee lovers to help us fundraise our ~hyper cool~ coffee cooperative: Slow Bloom Coffee Cooperative.','food',3,'2020-12-15'),(33,'Chef Katsu Brooklyn',30000.00,'We hope CKB will be your family\'s go-to spot for your Japanese comfort food fix, while being health conscious :)','food',4,'2020-12-15'),(34,'Kimchi Hotel: Fermentation garden & community hub, Amsterdam',10000.00,'Join in to complete the sustainable garden for the full circle of fermentation experience, community gardening, art exhibitions, & more','food',1,'2020-12-15'),(35,'STORROR Parkour PRO',60000.00,'The OFFICIAL Parkour Videogame Experience','game',2,'2020-12-15'),(36,'Hell Architect – Build and manage your own Hell',30000.00,'Hell Architect - the game where you can create and manage your own hell! Join Lucifer corporation and be the first Hell Manager!','game',3,'2020-12-15'),(37,'Alhambra Big Box 2nd Edition',3000.00,'All new artwork, all 6 expansions, 2 Queenies and Tile Dispenser Tower!','game',1,'2020-12-15'),(38,'Steven Rhodes Games',23000.00,'A 3-Pack of games featuring Steven Rhodes\' unique style of nostalgia with a twist of darkness','game',2,'2020-12-15');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18  2:13:27
