-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: forflutterdb
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `balance_remaining` double NOT NULL,
  `duration_in_months` int NOT NULL,
  `end_date` date DEFAULT NULL,
  `interest_rate` float NOT NULL,
  `loan_amount` double NOT NULL,
  `loan_type` varchar(255) DEFAULT NULL,
  `monthly_payment` double NOT NULL,
  `payments_made` double NOT NULL,
  `start_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6xxlcjc0rqtn5nq28vjnx5t9d` (`user_id`),
  CONSTRAINT `FK6xxlcjc0rqtn5nq28vjnx5t9d` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_logged_out` bit(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj8rfw4x0wjjyibfqq566j4qng` (`user_id`),
  CONSTRAINT `FKj8rfw4x0wjjyibfqq566j4qng` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwMDI5MSwiZXhwIjoxNzMwODg2NjkxfQ.DoqXj7FJ2y247xQ2PGfvgAF_e5MzeooVxSMA6Bg_LhI',1),(2,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwMDMzOCwiZXhwIjoxNzMwODg2NzM4fQ.PGXvm93flMlfM4nyzs6P1PF9eTv3iRc_U6PnyOXdft0',1),(3,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwMDQwMSwiZXhwIjoxNzMwODg2ODAxfQ.I1fXidTDmmgwo8LenCuBabO5tbDMfQt4SjRMyHEO0hQ',1),(4,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDA4NzMsImV4cCI6MTczMDg4NzI3M30.LarPYCLjhBdy1zeTLncM5OQygPKs1-XBygGAS95ChnY',1),(5,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDE0MzUsImV4cCI6MTczMDg4NzgzNX0.ihIFPEY_cUAZYjCvdnoKGjUaYCgdX8c1kulvJBzHtI8',1),(6,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDIwMjYsImV4cCI6MTczMDg4ODQyNn0.G4QPRS3JKMA_vrWDW6TH-nGa-uf38d44CnlOT24BiQg',1),(7,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDI3MTksImV4cCI6MTczMDg4OTExOX0.R9PY9Vo42qBliLsxgChpcXkkQIdnTh89neuIUHJ8IQY',1),(8,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNDE3MCwiZXhwIjoxNzMwODkwNTcwfQ.CCmShupKsJzPvlJ99AQ468X-CF3aeP1WwNOGvjizrUE',2),(9,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNDI0MCwiZXhwIjoxNzMwODkwNjQwfQ.XAdh7DpSHfH6bE6w6v3ACfqcFvhXGdLT4q4ARmZW1OM',2),(10,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNDg5NywiZXhwIjoxNzMwODkxMjk3fQ.RiOoIMtSn5SH4B46xFmVaasWv8bepaAGS_CX6vu8jAc',2),(11,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNTMzMSwiZXhwIjoxNzMwODkxNzMxfQ.OO4sHnLZ5oLoygAgD2Do4caCbhMLv_YlB1_8HbBc2b4',2),(12,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNTU5NCwiZXhwIjoxNzMwODkxOTk0fQ.RbA765STBt1UyJxH_dfkhHZpY3PVpEOEKfzp6A6WvPU',2),(13,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNTkzNywiZXhwIjoxNzMwODkyMzM3fQ.ND81zckgb175LEhmw3MPnR0UqL3ui6zkCNtc5XkZUtg',2),(14,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNjQyOCwiZXhwIjoxNzMwODkyODI4fQ.bvKqNs7RKhmwh2H-Hy5zphTk2Tl-2unFxCxU8yDtaGg',2),(15,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDgxNDEsImV4cCI6MTczMDg5NDU0MX0.Tn9buf2wrigEC-rDhAnGXb1hPY0WRDw5CpNJbuBJ9rc',1),(16,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDg0MDUsImV4cCI6MTczMDg5NDgwNX0.UwtNX8vTSsVq35MaH_EisFuT83AhojIXVRfcgYxBKG4',1),(17,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDg0NjQsImV4cCI6MTczMDg5NDg2NH0.uUbCXMJt2kW6H74QgIH5KW9vBkFxif8SwyJvcPiE2qk',1),(18,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDg1MDEsImV4cCI6MTczMDg5NDkwMX0.KZ0CbU5LT2-bOmZeoMJcnKj5GBM68furp6VEjPFstUg',1),(19,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDg1NDMsImV4cCI6MTczMDg5NDk0M30.FxmFloCNNMS7XV3kSxh-UHTbFHNn0YGxeHenMAbGC2E',1),(20,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDg2OTYsImV4cCI6MTczMDg5NTA5Nn0.YmdPzFcwKb3z_xW71ggphtZ-XapKs8HRr0WJ3T-wnOg',1),(21,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDg5MzMsImV4cCI6MTczMDg5NTMzM30.kRLSTln1IYOWrvt9njxeJ-91P-15aG5_ai3U4G-q5mA',1),(22,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDk0NDcsImV4cCI6MTczMDg5NTg0N30.x8Okp-gdQrRAjAAnwzPFB9duNyqRLqZxsmGGxXPuLHM',1),(23,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MTA3OTAsImV4cCI6MTczMDg5NzE5MH0.Ba0SNGy7vlhVJN7YLr2BO-4_A7zPwSYZYaQtjRUMJtA',1),(24,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MTA4MjAsImV4cCI6MTczMDg5NzIyMH0.5Xad9ja2OErfHoJ3WlGBhTShx00mLY9hvKzPuQoTmh0',1),(25,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MTA4NjgsImV4cCI6MTczMDg5NzI2OH0.ldRb8dovZ3CZlbRfVmGf78SCU5C6RJjV7rn6lofxXXQ',1);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `balance` double NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `target_account_number` varchar(255) DEFAULT NULL,
  `transaction_date` datetime(6) DEFAULT NULL,
  `transaction_type` enum('DEPOSIT','FUND_TRANSFER','WITHDRAW') DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqwv7rmvc8va8rep7piikrojds` (`user_id`),
  CONSTRAINT `FKqwv7rmvc8va8rep7piikrojds` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_number` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `balance` double NOT NULL,
  `create_date` date DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_lock` bit(1) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `nid` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','USER') DEFAULT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKd4t5vk5oufhxosw60bxqut2vq` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'400454289',NULL,'Mirpur',1000,NULL,NULL,'naima@gmail.com',NULL,'Female',NULL,_binary '',NULL,'12132323','1212','$2a$10$ICw/OnF0BphwyZZ5IXRiJOqYGg6JqRXTRwR7WDzKU.bzC7xqKUpqi','ADMIN',_binary ''),(2,'496198270','Savings Account','Mirpur',0,NULL,'2024-08-01T00:00:00.000','nj@gmail.com','Nusrat','Female',NULL,_binary '','Jahan','345435','243432','$2a$10$DzMNpXOnm/W6W1y1I/xbRee7DZWiZMOVZSIC6OSX0lnnFc9UqkUPu','USER',_binary '');
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

-- Dump completed on 2024-11-05 18:58:20
