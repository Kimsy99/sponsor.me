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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18  2:13:27
