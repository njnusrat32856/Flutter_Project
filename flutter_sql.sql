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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwMDI5MSwiZXhwIjoxNzMwODg2NjkxfQ.DoqXj7FJ2y247xQ2PGfvgAF_e5MzeooVxSMA6Bg_LhI',1),(2,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwMDMzOCwiZXhwIjoxNzMwODg2NzM4fQ.PGXvm93flMlfM4nyzs6P1PF9eTv3iRc_U6PnyOXdft0',1),(3,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwMDQwMSwiZXhwIjoxNzMwODg2ODAxfQ.I1fXidTDmmgwo8LenCuBabO5tbDMfQt4SjRMyHEO0hQ',1),(4,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDA4NzMsImV4cCI6MTczMDg4NzI3M30.LarPYCLjhBdy1zeTLncM5OQygPKs1-XBygGAS95ChnY',1),(5,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDE0MzUsImV4cCI6MTczMDg4NzgzNX0.ihIFPEY_cUAZYjCvdnoKGjUaYCgdX8c1kulvJBzHtI8',1),(6,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDIwMjYsImV4cCI6MTczMDg4ODQyNn0.G4QPRS3JKMA_vrWDW6TH-nGa-uf38d44CnlOT24BiQg',1),(7,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDI3MTksImV4cCI6MTczMDg4OTExOX0.R9PY9Vo42qBliLsxgChpcXkkQIdnTh89neuIUHJ8IQY',1),(8,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNDE3MCwiZXhwIjoxNzMwODkwNTcwfQ.CCmShupKsJzPvlJ99AQ468X-CF3aeP1WwNOGvjizrUE',2),(9,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNDI0MCwiZXhwIjoxNzMwODkwNjQwfQ.XAdh7DpSHfH6bE6w6v3ACfqcFvhXGdLT4q4ARmZW1OM',2),(10,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNDg5NywiZXhwIjoxNzMwODkxMjk3fQ.RiOoIMtSn5SH4B46xFmVaasWv8bepaAGS_CX6vu8jAc',2),(11,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNTMzMSwiZXhwIjoxNzMwODkxNzMxfQ.OO4sHnLZ5oLoygAgD2Do4caCbhMLv_YlB1_8HbBc2b4',2),(12,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNTU5NCwiZXhwIjoxNzMwODkxOTk0fQ.RbA765STBt1UyJxH_dfkhHZpY3PVpEOEKfzp6A6WvPU',2),(13,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNTkzNywiZXhwIjoxNzMwODkyMzM3fQ.ND81zckgb175LEhmw3MPnR0UqL3ui6zkCNtc5XkZUtg',2),(14,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDgwNjQyOCwiZXhwIjoxNzMwODkyODI4fQ.bvKqNs7RKhmwh2H-Hy5zphTk2Tl-2unFxCxU8yDtaGg',2),(15,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDgxNDEsImV4cCI6MTczMDg5NDU0MX0.Tn9buf2wrigEC-rDhAnGXb1hPY0WRDw5CpNJbuBJ9rc',1),(16,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDg0MDUsImV4cCI6MTczMDg5NDgwNX0.UwtNX8vTSsVq35MaH_EisFuT83AhojIXVRfcgYxBKG4',1),(17,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDg0NjQsImV4cCI6MTczMDg5NDg2NH0.uUbCXMJt2kW6H74QgIH5KW9vBkFxif8SwyJvcPiE2qk',1),(18,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDg1MDEsImV4cCI6MTczMDg5NDkwMX0.KZ0CbU5LT2-bOmZeoMJcnKj5GBM68furp6VEjPFstUg',1),(19,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDg1NDMsImV4cCI6MTczMDg5NDk0M30.FxmFloCNNMS7XV3kSxh-UHTbFHNn0YGxeHenMAbGC2E',1),(20,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDg2OTYsImV4cCI6MTczMDg5NTA5Nn0.YmdPzFcwKb3z_xW71ggphtZ-XapKs8HRr0WJ3T-wnOg',1),(21,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDg5MzMsImV4cCI6MTczMDg5NTMzM30.kRLSTln1IYOWrvt9njxeJ-91P-15aG5_ai3U4G-q5mA',1),(22,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDk0NDcsImV4cCI6MTczMDg5NTg0N30.x8Okp-gdQrRAjAAnwzPFB9duNyqRLqZxsmGGxXPuLHM',1),(23,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MTA3OTAsImV4cCI6MTczMDg5NzE5MH0.Ba0SNGy7vlhVJN7YLr2BO-4_A7zPwSYZYaQtjRUMJtA',1),(24,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MTA4MjAsImV4cCI6MTczMDg5NzIyMH0.5Xad9ja2OErfHoJ3WlGBhTShx00mLY9hvKzPuQoTmh0',1),(25,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MTA4NjgsImV4cCI6MTczMDg5NzI2OH0.ldRb8dovZ3CZlbRfVmGf78SCU5C6RJjV7rn6lofxXXQ',1),(26,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4ODI1NTEsImV4cCI6MTczMDk2ODk1MX0.LL2F55L6eXA557Qu9cAC8g0EkCuditI6nY8CJDY3haw',1),(27,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4ODI2MTQsImV4cCI6MTczMDk2OTAxNH0.9t5o5xFJH5YBQHscFIh9fedghNJyQVc56dRs5xvcB-g',1),(28,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg4MzMwOCwiZXhwIjoxNzMwOTY5NzA4fQ.N6wLQENlaBFfFa9BxAzZvBSECW0KCnKlWu8XTSWtHD4',2),(29,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg4MzM1NywiZXhwIjoxNzMwOTY5NzU3fQ.4fz_Y_2vnqzDFpUiVC6UYChsU2y2g5J6U0OsNqbSU4g',2),(30,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg4NDUwNCwiZXhwIjoxNzMwOTcwOTA0fQ.4XYeaTvmktrYbyBrjo_RIXOEdB8PT1IfyDtZXdfPGyc',2),(31,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg4NDYyNSwiZXhwIjoxNzMwOTcxMDI1fQ.Fhg6HSP_nAMaOrFpGM1D209KSJp7PWNj6qAQqZYVnkI',2),(32,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg4Nzc1NiwiZXhwIjoxNzMwOTc0MTU2fQ.TRLvUdYn_LWpNaJ_U6ZeIAsgvdGSN925ya5PkkS2JVQ',2),(33,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg4Nzk2OSwiZXhwIjoxNzMwOTc0MzY5fQ.gcSRm3dOdbD23p9NAH3rjXMkyDT3ATdCK5UfS-yTWCU',2),(34,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg4ODM1MywiZXhwIjoxNzMwOTc0NzUzfQ.AXzIbKS31F05OlKbfyRsRUiS0o5Sy_goelKJRxbit90',2),(35,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg4ODg0MywiZXhwIjoxNzMwOTc1MjQzfQ.2TLjkME4UjWmXvIhqFOZ_G6E3cFhu05xYdcCrR9n2W0',2),(36,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5MDExMywiZXhwIjoxNzMwOTc2NTEzfQ.YwMZIVMJlQ_AtoluCjOuel59gU_K-wAhRNBnBHeu-NY',2),(37,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5MDE2NiwiZXhwIjoxNzMwOTc2NTY2fQ.giFOCcdBiVUTW3rOCcKlY3Mk4L8E-edAXvUN1APJgH4',2),(38,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5MDMyMywiZXhwIjoxNzMwOTc2NzIzfQ.MQn66CnY-8veyOVRql7_L8tNQBcat7grFBWQkrDeMtY',2),(39,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5MDc4MywiZXhwIjoxNzMwOTc3MTgzfQ.qYytKLMNfFD4M2_OW1cphqa-Qw3JNnIK6Vsxu0UCjQQ',2),(40,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5MTg5MCwiZXhwIjoxNzMwOTc4MjkwfQ.7XKr5aI4CRMvL3fDkG-jcyZvfRo_9gA-bk7_Yfvlm0w',2),(41,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NDEwMywiZXhwIjoxNzMwOTgwNTAzfQ.nIG5ceOCs63Q7-OPkzkQDAKuyCFOzfsTXRddWvlRcQE',2),(42,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NDYzNiwiZXhwIjoxNzMwOTgxMDM2fQ.DqoOSnKQanXhveeLO-0q2onqTa9-lzIvq5ngIkNYbp0',2),(43,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NTc5MSwiZXhwIjoxNzMwOTgyMTkxfQ.-AG5U0hUHzQrFQ2a7FYVPbW4oqUkPhRbm1jMwV-sa0A',2),(44,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NTg5NSwiZXhwIjoxNzMwOTgyMjk1fQ.OCx9VTXE_Hwe9S0_3QN0pHt8ZeymJaCmrGVMYj8p15k',2),(45,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NjA2NiwiZXhwIjoxNzMwOTgyNDY2fQ.6hFaj0z8IlnMehbVaJ1MEn500lgrGLLsZf_GFHnt1Wg',2),(46,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NjE2MCwiZXhwIjoxNzMwOTgyNTYwfQ.uLVU7AtRY0eduB2TSLZfDFxu0XrTxIxTF_uG4W_bzdc',2),(47,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NjgwOCwiZXhwIjoxNzMwOTgzMjA4fQ.c_DzXMcgaaew8C-3FYXGo3hIInzECAlFpL6VRgz1Tts',2),(48,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NzUwNCwiZXhwIjoxNzMwOTgzOTA0fQ.DqXpJ2Xs4lL4LzuLFkkdOB2Y2r9eOU-0B0FFd32Y0u4',2),(49,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk2ODE0NiwiZXhwIjoxNzMxMDU0NTQ2fQ.n0aI4ZH8q66bXTcpLSywH1KDdR7DXJ7vVMmVRyGGdBI',2),(50,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk2ODUyMSwiZXhwIjoxNzMxMDU0OTIxfQ.DYbJpfwLAuSQtefgn7BnkJmL7RKSyll6zA9L0mNIjew',2),(51,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk2OTA4OCwiZXhwIjoxNzMxMDU1NDg4fQ.T3fDdnI4At_fZqrPOHYcdlTeeg-_NUbQ87BKTFyD9Bk',2),(52,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk2OTc1NSwiZXhwIjoxNzMxMDU2MTU1fQ.vI3BSrVNuQtyoL9tNCYMV4Bat5ct84zYf0toCHJY2-Q',2),(53,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3MDk4OCwiZXhwIjoxNzMxMDU3Mzg4fQ.kzD59edowLIBeyePmsQIXAfmB8SrlHBsRUfvgUnXGBg',2),(54,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3MjY1NSwiZXhwIjoxNzMxMDU5MDU1fQ.tN_4WZnEuT3XOcm8zg9MJhxQOIJ0JDDSSw0Q46hxO2c',2),(55,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3Mjg0OCwiZXhwIjoxNzMxMDU5MjQ4fQ.GNIDKSSNfm6HYC0Q6vF2V4DmSkrKTEYHqYe1I4Abgh8',2),(56,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3MzQzMCwiZXhwIjoxNzMxMDU5ODMwfQ.NXrsZv3f7vak0Vbs8J7jnKrmk97EwQ8L9jF6gSe79Uk',2),(57,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3NDI0OSwiZXhwIjoxNzMxMDYwNjQ5fQ.WZUc8On5y0QWwQK75zpM284EBxqk5wk2Yle9B_xSC8Y',2),(58,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3NDI3MSwiZXhwIjoxNzMxMDYwNjcxfQ.C6Fl2HjZ9KQz4rRGpdCZtlT3_gfKcxOWN0ih0UyUuQ8',2),(59,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3NTAzMSwiZXhwIjoxNzMxMDYxNDMxfQ.HCfHMMxwMzWUGT7hDvAb56oDB78iyxZXc43HJcu5WKA',2),(60,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3NzE1MywiZXhwIjoxNzMxMDYzNTUzfQ.grDE2z4zEFo-XnTZC7GN2wTpcq3kr1Wsi7fhWk4bjAc',2),(61,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3NzIwOCwiZXhwIjoxNzMxMDYzNjA4fQ.p9V9fPiAkGZ295Wrlyp8pCqPp5gQ5n7OOD0xcVK9Fno',2),(62,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3NzMwMSwiZXhwIjoxNzMxMDYzNzAxfQ.1BJjblES8OrKDCQgTPYaLewClL12rTsl4zbTJcMD1pA',2),(63,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3ODAxOCwiZXhwIjoxNzMxMDY0NDE4fQ.7RpWFTgochTDz_gXh3pcEW45ABKJSAhRB-l03nhyFzo',2),(64,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3ODExNSwiZXhwIjoxNzMxMDY0NTE1fQ.QOjdPhnExzXopa-w6Ek6lKUhfosVE5M5vVB6JDigCYM',2),(65,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYWltYUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA5Nzk2OTksImV4cCI6MTczMTA2NjA5OX0.P-k8OGuhVWDZdgV_2NFKQhPKb8JJ7QtDYNcYHU6soko',1),(66,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3OTcxNywiZXhwIjoxNzMxMDY2MTE3fQ.ltCcFvC-ZTh35wqIZZ7yKdVYbYdhHT910k8PFLitoXs',2),(67,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3OTg5MCwiZXhwIjoxNzMxMDY2MjkwfQ.9HZslSnchj4HlEC63BgvXWnKjmn1KOoZPoTWWVwHHB4',2),(68,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MDE3MSwiZXhwIjoxNzMxMDY2NTcxfQ.w4dR0eLKL9AB-3PVnKYAl3-wN6x7yt2UMBcQ03B_h_g',2),(69,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MDQ1OSwiZXhwIjoxNzMxMDY2ODU5fQ.sgFobCshQXhQn_TwdO4c7h4Jfhi6P612XoOu2wmJBtk',2),(70,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0MTIyOCwiZXhwIjoxNzMxMjI3NjI4fQ._y2zMRkLzY9_XspGpH-SkTB3KKNY1-tBFrkmYW56FCk',2),(71,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0MTQ3NywiZXhwIjoxNzMxMjI3ODc3fQ.js-tlak6VWflox7gddxEjmwC-N94OaIHyFq_f0fDFVY',2),(72,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0MjU4MywiZXhwIjoxNzMxMjI4OTgzfQ.HaEBnQ-JJOIkLKGkukKOjKfXMhKjRLIUgk_1CAjVnrM',2),(73,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NDE3NywiZXhwIjoxNzMxMjMwNTc3fQ.mEEK2CI4y39jek3BoLJbEaxfaWb2e09W1YWj70mCS_s',2),(74,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NDI4OCwiZXhwIjoxNzMxMjMwNjg4fQ.8jjEh3x02cO2R81dvCtcKsffdOfaw3RgQNEusvZAUlo',2),(75,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NDg1NSwiZXhwIjoxNzMxMjMxMjU1fQ.IZnTT1_2G8YsdUKGhrZsibK16v1X4RVapZD1n-Zl3U8',2),(76,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NTQwMiwiZXhwIjoxNzMxMjMxODAyfQ.3pFPVFfaUyYdUcw9eLpEUZTflwrVgVmETiMvOSLWf-4',2),(77,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NTUyNiwiZXhwIjoxNzMxMjMxOTI2fQ.AmmQ8FKFDpnR-_ZttEDc9DK33CpSWJ1pzIiZP2hn9GI',2),(78,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NTY1MSwiZXhwIjoxNzMxMjMyMDUxfQ.NzgNo6vyYOO7ve2XsI3tZQl6KBnUhSdSlI7qCkV8Rg4',2),(79,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NTc1MiwiZXhwIjoxNzMxMjMyMTUyfQ.gn84udTvnM5JFXYZl6vWZI7WxlMfs868Li-sF8Sc42M',2),(80,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NTgxNCwiZXhwIjoxNzMxMjMyMjE0fQ.49wREW1QIZ9_QcO9e1a2ovBad5i7jN7irlPQL4Obv-8',2),(81,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NjQ1NiwiZXhwIjoxNzMxMjMyODU2fQ.zA9I8zatU-taRUxrjsXrWCjafwxaT-v9RmTQCc38qMM',2),(82,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NjU0MCwiZXhwIjoxNzMxMjMyOTQwfQ.6JsKh7rK76R8MQln4Kj_iLKf1_q0b3CdaCez48tlMSo',2),(83,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NjU2OCwiZXhwIjoxNzMxMjMyOTY4fQ.A-m6XAs5BEF1sP0nB10QNUsjQw3uxDGVN8UnIb6LaEw',2),(84,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NjY2MCwiZXhwIjoxNzMxMjMzMDYwfQ.Eyr7HCAQ3CuUypDvOgOYelmMrJnybFtfBzQqusGPtwI',2),(85,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0Njc1MywiZXhwIjoxNzMxMjMzMTUzfQ.ypjHhQ37xwo3tBmX5IBqQqylKdb4mHWbN89wCmPG85w',2),(86,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NzQ1NSwiZXhwIjoxNzMxMjMzODU1fQ.6F1_SSj5RSunaiQNVkfqqQwC6rMec5e-imLvxgjVVhM',2),(87,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0NzU5MCwiZXhwIjoxNzMxMjMzOTkwfQ.CQPJkNy4TLJ-1gcJMmE7Kp8mUZ3Ltsql1y2XxauDwJQ',2),(88,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0OTAzMCwiZXhwIjoxNzMxMjM1NDMwfQ.puO89Kv2f5E2kEJTYvbPxffK1-YlBsnFgNC-QqT_Ci8',2),(89,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE0OTI1MywiZXhwIjoxNzMxMjM1NjUzfQ.ep6lTgXDxDFUbruQUIgs2OJBYEU1kIvMtlv4_XIldbQ',2),(90,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE1MzY5MSwiZXhwIjoxNzMxMjQwMDkxfQ.iVBxCUDVEL36a0-tNIjFW2ZvGuvIhAVl1M0s_SlCL5c',2),(91,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE1NTMxMywiZXhwIjoxNzMxMjQxNzEzfQ.01XUZykkymoNywxatb_cK04lByC9a4QE8SrX8jR965M',2),(92,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE1NTQ5OCwiZXhwIjoxNzMxMjQxODk4fQ.2SuP2R5bdZ9UcxVsFvLmcwKRPwFjKVlPL51CLrvDV7Y',2),(93,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwMjUwOSwiZXhwIjoxNzMxNDg4OTA5fQ.aUcSUYo_CETvxHX2XWW9ey6WNr9kHwfKaN7G5AGEZss',2),(94,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwMzYzMiwiZXhwIjoxNzMxNDkwMDMyfQ.dFH5IBiD1xtgM8CmPknG1dqcjJlIx7jUu67ogJKiCxQ',2),(95,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwMzY4MywiZXhwIjoxNzMxNDkwMDgzfQ.ZiCGxsht-KanZUZ-MpEbTJj3XzUJeBKKGun1-y6TBcY',2),(96,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwMzg3NSwiZXhwIjoxNzMxNDkwMjc1fQ._2UztWt9lIKh69qmoF5eQMKuGsgWZgHhqDGBdCidVek',2),(97,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNDI2NywiZXhwIjoxNzMxNDkwNjY3fQ.uGEpVRDI8UGFMjwxWJq-ZliLakBkoxLgyyuro-Ku8aQ',2),(98,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNDM0MiwiZXhwIjoxNzMxNDkwNzQyfQ.pz8G3cQzBn2X5nUDKyUJ8mnrfV7qNpgzGqUmsGnSwCI',2),(99,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNDQwMCwiZXhwIjoxNzMxNDkwODAwfQ.rgdb5pLaokmsROfYLEUYlNkxL5GAgSDFhv16YrK2PJk',2),(100,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNDY2MSwiZXhwIjoxNzMxNDkxMDYxfQ.8UKov2YqInAeQjO6pKWCaUxm81ji0-K8tnBnMu-KmiU',2),(101,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNDg3MiwiZXhwIjoxNzMxNDkxMjcyfQ.SIUDdOEVjcy1h6fQbD4UkH0WiZw82qRcwsHJq5BXqDg',2),(102,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNTE2OSwiZXhwIjoxNzMxNDkxNTY5fQ.Mwkn3KoG-826D-yRbxRvLYAvtgGr4m3e0Yd3jYprLEI',2),(103,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNTUxNywiZXhwIjoxNzMxNDkxOTE3fQ.ZmjKnDbh2L0viNxqHQ6zeCCr1zfozDigno4-qqlyym4',2),(104,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNTkyOCwiZXhwIjoxNzMxNDkyMzI4fQ.px_6G40NtWrOsh5ymNpqoFd-98_Yt_Tdjek5kfYVJH8',2),(105,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNjE1NSwiZXhwIjoxNzMxNDkyNTU1fQ.FHkC2h799wUS2hi7Q_uRo2Xqc_a0PpeuZMZl_Df3Dts',2),(106,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNjY4NiwiZXhwIjoxNzMxNDkzMDg2fQ.-d-ZuHJCCuSY4oWmle3ODhxqsWU-R25nKDzHCZr1_34',2),(107,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwOTQyMywiZXhwIjoxNzMxNDk1ODIzfQ.i6yo5M1FbrsEj_Ifht0vxew-iv8OmiYOUMeP7YYJGjw',2),(108,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxMDUxNiwiZXhwIjoxNzMxNDk2OTE2fQ.c5V_k36zAQonqtp7uOCe7zDpSsm99dEkh5m_rFZu3o4',2),(109,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxMTM3OSwiZXhwIjoxNzMxNDk3Nzc5fQ.O5nPTASyVI6pMcTI7wrDy2iN9AHfXT9FtAHLW835_b8',2),(110,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxMTYxNiwiZXhwIjoxNzMxNDk4MDE2fQ.P6j9v6XFGLsHaqQotn6667I4rOMbgH5_v8Vl-atkK70',2),(111,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxMTcwNSwiZXhwIjoxNzMxNDk4MTA1fQ.0tIPQfTA1xuXHiENaLuf_QT0-2Hq3-4r4ZqqG7WcGgw',2),(112,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxMjU0MSwiZXhwIjoxNzMxNDk4OTQxfQ.lflzb2Dj49aaIORQPTnN3NrCT-8CSHplenFdpcmhjoc',2),(113,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxMjgxNCwiZXhwIjoxNzMxNDk5MjE0fQ._WSF7R65zQhsK68Vtl8gs3-94ICHYFaIgRhJtYquZiE',2),(114,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxMzA4MywiZXhwIjoxNzMxNDk5NDgzfQ.rREsyfFhzCsxHUSRY4O_nWVHmLmEmSnqBXFLFEqodF0',2),(115,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxMzE2NSwiZXhwIjoxNzMxNDk5NTY1fQ.e9e3Wv3AMG7kj7fw5HqCUTIYTA8aETHaNTpogZC4Ky4',2),(116,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxMzI1MCwiZXhwIjoxNzMxNDk5NjUwfQ.f5wSjXBnndJPk0LWJvpQxaG2AfbCtkqqmhVkdzhzoVM',2),(117,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxMzg5MywiZXhwIjoxNzMxNTAwMjkzfQ.LT063lCSTmfJ0_Gxt4BNEdZUyG26f91MqHNx9tI5q-M',2),(118,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxNDU0MiwiZXhwIjoxNzMxNTAwOTQyfQ.WFhC5UBRx93J3ycKTHzH3UPHf0JOqehN-GmJn2zH3IM',2),(119,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxNDY5NSwiZXhwIjoxNzMxNTAxMDk1fQ.nQzLLXOibIdABXp4c5OgBS_6UsScc3o9Hf3UNROzxEo',2),(120,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxNTY1NCwiZXhwIjoxNzMxNTAyMDU0fQ.7B_NdMT_xdreRLfHA4tNydOISxgOBGI26J4xXvSNs_A',2),(121,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuakBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxNTc1NiwiZXhwIjoxNzMxNTAyMTU2fQ.Y9qyaiKca0q1vYE3EtR1PVDszSX17DtcwEMetf_mCwE',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1000,1000,'Deposit Money','PENDING','496198270','2024-11-07 15:47:44.616068','DEPOSIT',2),(2,1000,2000,'Deposit Money','PENDING','496198270','2024-11-09 14:34:19.677808','DEPOSIT',2),(3,1000,3000,'Deposit Money','PENDING','496198270','2024-11-09 14:38:12.105973','DEPOSIT',2),(4,1000,4000,'Money Deposit','PENDING','496198270','2024-11-09 14:56:47.485482','DEPOSIT',2),(5,1000,3000,'Withdraw Money','PENDING','496198270','2024-11-09 15:25:17.942754','WITHDRAW',2),(6,1000,2000,'Transfer Funds','PENDING','496198270','2024-11-09 16:20:26.376922','FUND_TRANSFER',2),(7,1000,2000,'Received from 496198270','PENDING','400454289','2024-11-09 16:20:26.393104','FUND_TRANSFER',1),(8,10000,12000,'Deposit Money','PENDING','496198270','2024-11-12 15:56:52.875812','DEPOSIT',2);
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
INSERT INTO `users` VALUES (1,'400454289',NULL,'Mirpur',2000,NULL,NULL,'naima@gmail.com',NULL,'Female',NULL,_binary '',NULL,'12132323','1212','$2a$10$ICw/OnF0BphwyZZ5IXRiJOqYGg6JqRXTRwR7WDzKU.bzC7xqKUpqi','ADMIN',_binary ''),(2,'496198270','Savings Account','Mirpur',12000,NULL,'2024-08-01T00:00:00.000','nj@gmail.com','Nusrat','Female',NULL,_binary '','Jahan','345435','243432','$2a$10$DzMNpXOnm/W6W1y1I/xbRee7DZWiZMOVZSIC6OSX0lnnFc9UqkUPu','USER',_binary '');
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

-- Dump completed on 2024-11-12 18:58:14
