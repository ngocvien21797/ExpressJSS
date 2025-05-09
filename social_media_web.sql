-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: social_media_web
-- ------------------------------------------------------
-- Server version	9.2.0

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
CREATE DATABASE IF NOT EXISTS social_media_web;
USE social_media_web;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,2,'Đà Lạt đẹp quá, share thêm ảnh đi!','2025-04-27 09:06:12'),(2,1,3,'Hồ Xuân Hương buổi tối lung linh lắm!','2025-04-27 09:06:12'),(3,1,4,'Đi Đà Lạt mùa này lạnh không?','2025-04-27 09:06:12'),(4,1,5,'Đã bookmark địa điểm này!','2025-04-27 09:06:12'),(5,1,6,'Chuyến đi vui vậy, kể thêm đi!','2025-04-27 09:06:12'),(6,2,1,'Phở bò trông ngon quá, cho xin công thức!','2025-04-27 09:06:12'),(7,2,3,'Món này hợp cuối tuần ghê!','2025-04-27 09:06:12'),(8,2,4,'Bạn nấu giỏi thật đấy!','2025-04-27 09:06:12'),(9,3,1,'iPhone 16 camera đỉnh thật!','2025-04-27 09:06:12'),(10,3,2,'Mình thấy giá hơi cao, bạn nghĩ sao?','2025-04-27 09:06:12'),(11,3,4,'Chưa dùng nhưng nghe nói pin tốt hơn.','2025-04-27 09:06:12'),(12,3,5,'Đang cân nhắc nâng cấp đây!','2025-04-27 09:06:12'),(13,4,5,'Mình cũng mới tập, hẹn đi chung nhé!','2025-04-27 09:06:12'),(14,4,6,'Tập gym vui lắm, cố lên!','2025-04-27 09:06:12'),(15,5,6,'JavaScript thú vị thật, bạn học tới đâu rồi?','2025-04-27 09:06:12'),(16,6,7,'Chào bạn, welcome nha!','2025-04-27 09:06:12'),(17,6,8,'Rất vui được gặp bạn!','2025-04-27 09:06:12'),(18,6,9,'Hy vọng bạn sẽ thích cộng đồng này!','2025-04-27 09:06:12'),(19,7,8,'Biển Vũng Tàu cuối tuần đông lắm, thích ghê!','2025-04-27 09:06:12'),(20,7,9,'Chụp ảnh đẹp quá, share thêm đi!','2025-04-27 09:06:12'),(21,8,9,'\"Nhà giả kim\" hay thật, cảm ơn recommend!','2025-04-27 09:06:12'),(22,8,10,'Đọc xong cũng mê luôn, sách đỉnh!','2025-04-27 09:06:12'),(23,9,10,'Chạy bộ sáng sớm là nhất, tiếp tục nha!','2025-04-27 09:06:12'),(24,10,1,'Cà phê sáng chill ghê, quán nào vậy?','2025-04-27 09:06:12'),(25,10,2,'Mình cũng muốn join, ở đâu thế?','2025-04-27 09:06:12');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `following_user_id` int NOT NULL,
  `followed_user_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`following_user_id`,`followed_user_id`),
  KEY `followed_user_id` (`followed_user_id`),
  CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`following_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`followed_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`post_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,'2025-04-25 04:05:00'),(1,3,'2025-04-25 05:05:00'),(2,1,'2025-04-25 04:06:00'),(2,3,'2025-04-25 05:06:00'),(3,1,'2025-04-25 04:07:00'),(3,4,'2025-04-25 05:35:00'),(4,2,'2025-04-25 04:35:00'),(4,4,'2025-04-25 05:36:00'),(5,2,'2025-04-25 04:36:00'),(5,6,'2025-04-25 06:35:00'),(6,7,'2025-04-25 07:05:00'),(7,7,'2025-04-25 07:06:00'),(8,8,'2025-04-25 07:35:00'),(9,9,'2025-04-25 08:05:00'),(10,10,'2025-04-25 08:35:00');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `user_id` int DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image_url` varchar(255) DEFAULT NULL,
  `likes` int DEFAULT '0',
  `comments` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Chuyến đi Đà Lạt','Vừa có chuyến đi Đà Lạt siêu vui! Hồ Xuân Hương đẹp mê ly.',1,'published','2025-04-25 04:00:00','https://picsum.photos/1280/600?random=1',150,5),(2,'Món ăn mới','Hôm nay thử nấu phở bò, ngon tuyệt!',2,'published','2025-04-25 04:30:00','https://picsum.photos/1280/600?random=2',80,3),(3,'Công nghệ mới','Ai đã dùng iPhone 16 chưa? Chia sẻ cảm nhận đi!',3,'published','2025-04-25 05:00:00','https://picsum.photos/1280/600?random=9',200,4),(4,'Tập gym','Mới bắt đầu tập gym, có ai muốn đi cùng không?',4,'published','2025-04-25 05:30:00','https://picsum.photos/1280/600?random=3',50,2),(5,'Học lập trình','Đang học JavaScript, khó nhưng thú vị!',5,'draft','2025-04-25 06:00:00','https://picsum.photos/1280/600?random=8',30,1),(6,'Chào mọi người','Mới tham gia mạng xã hội này, mọi người ơi!',6,'published','2025-04-25 06:30:00','https://picsum.photos/1280/600?random=10',100,3),(7,'Biển Vũng Tàu','Cuối tuần đi Vũng Tàu, biển đẹp lắm!',7,'published','2025-04-25 07:00:00','https://picsum.photos/1280/600?random=4',120,2),(8,'Sách hay','Đọc \"Nhà giả kim\" xong, recommend mọi người nhé!',8,'published','2025-04-25 07:30:00','https://picsum.photos/1280/600?random=7',90,2),(9,'Chạy bộ','Sáng nay chạy 5km, cảm giác sảng khoái!',9,'published','2025-04-25 08:00:00','https://picsum.photos/1280/600?random=5',60,1),(10,'Cà phê sáng','Ngồi cà phê sáng, ai muốn join?',10,'published','2025-04-25 08:30:00','https://picsum.photos/1280/600?random=6',70,2);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://via.placeholder.com/40',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Bvannhi03','admin','2025-04-25 03:00:00','admin','https://i.pravatar.cc/40?img=1'),(2,'QuocTuan','user','2025-04-25 03:01:00','password123','https://i.pravatar.cc/40?img=2'),(3,'Ba Thọ','admin','2025-04-25 03:02:00','admin123','https://i.pravatar.cc/40?img=3'),(4,'Thanh Tam','user','2025-04-25 03:03:00','password123','https://i.pravatar.cc/40?img=4'),(5,'Minh Anh','user','2025-04-25 03:04:00','password123','https://i.pravatar.cc/40?img=5'),(6,'admin','admin','2025-04-25 03:05:00','123','https://i.pravatar.cc/40?img=6'),(7,'Hải Nam','user','2025-04-25 03:06:00','password123','https://i.pravatar.cc/40?img=7'),(8,'Lan Hương','user','2025-04-25 03:07:00','password123','https://i.pravatar.cc/40?img=8'),(9,'Đức Anh','user','2025-04-25 03:08:00','password123','https://i.pravatar.cc/40?img=9'),(10,'Mai Linh','user','2025-04-25 03:09:00','password123','https://i.pravatar.cc/40?img=10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-27 16:09:05
