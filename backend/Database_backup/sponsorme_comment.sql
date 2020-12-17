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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18  2:13:26
