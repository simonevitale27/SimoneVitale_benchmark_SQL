CREATE DATABASE  IF NOT EXISTS `toysgroup` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `toysgroup`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: toysgroup
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id_Category` int NOT NULL,
  `CategoryName` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Action Figures'),(2,'Dolls'),(3,'Board Games'),(4,'Educational'),(5,'Outdoor Toys');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `infoterritory`
--

DROP TABLE IF EXISTS `infoterritory`;
/*!50001 DROP VIEW IF EXISTS `infoterritory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `infoterritory` AS SELECT 
 1 AS `IDStato`,
 1 AS `StateName`,
 1 AS `IDRegion`,
 1 AS `RegionName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_Product` int NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `id_Category` int DEFAULT NULL,
  PRIMARY KEY (`id_Product`),
  KEY `FK_Product_Category` (`id_Category`),
  CONSTRAINT `FK_Product_Category` FOREIGN KEY (`id_Category`) REFERENCES `category` (`id_Category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Super Hero A',1),(2,'Space Warrior',1),(3,'Robot X',1),(4,'Fashion Doll 1',2),(5,'Baby Doll',2),(6,'Doll House',2),(7,'Monopoly Deluxe',3),(8,'Chess Set',3),(9,'Card Game Plus',3),(10,'Math Quiz Kit',4),(11,'Science Lab Junior',4),(12,'Globe 3D',4),(13,'Football Pro',5),(14,'Garden Swing',5),(15,'Water Gun Max',5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!50001 DROP VIEW IF EXISTS `productcategory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productcategory` AS SELECT 
 1 AS `IDProduct`,
 1 AS `ProductName`,
 1 AS `CategoryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id_Region` int NOT NULL,
  `RegionName` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'WestEurope'),(2,'SouthEurope'),(3,'NorthAmerica'),(4,'APAC');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id_Sales` int NOT NULL,
  `SalesDate` date NOT NULL,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `id_Product` int DEFAULT NULL,
  `id_State` int DEFAULT NULL,
  PRIMARY KEY (`id_Sales`),
  KEY `FK_Sales_Product` (`id_Product`),
  KEY `FK_Sales_State` (`id_State`),
  CONSTRAINT `FK_Sales_Product` FOREIGN KEY (`id_Product`) REFERENCES `product` (`id_Product`),
  CONSTRAINT `FK_Sales_State` FOREIGN KEY (`id_State`) REFERENCES `state` (`id_State`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2024-05-10',10,15.00,1,4),(2,'2024-06-15',5,50.00,7,1),(3,'2024-08-20',2,40.00,4,7),(4,'2024-09-05',1,120.00,14,2),(5,'2025-01-12',3,30.00,10,9),(6,'2025-02-28',12,15.00,9,5),(7,'2025-03-15',4,50.00,2,3),(8,'2025-06-01',1,45.00,13,10),(9,'2025-07-20',8,40.00,11,4),(10,'2025-08-10',2,25.00,3,6),(11,'2025-09-05',10,40.00,12,8),(12,'2025-10-12',5,50.00,8,1),(13,'2025-11-20',3,20.00,5,5),(14,'2025-12-05',1,300.00,6,7),(15,'2025-12-28',20,5.00,15,2);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id_State` int NOT NULL,
  `StateName` varchar(100) NOT NULL,
  `id_Region` int DEFAULT NULL,
  PRIMARY KEY (`id_State`),
  KEY `FK_State_Region` (`id_Region`),
  CONSTRAINT `FK_State_Region` FOREIGN KEY (`id_Region`) REFERENCES `region` (`id_Region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'France',1),(2,'Germany',1),(3,'UK',1),(4,'Italy',2),(5,'Spain',2),(6,'Greece',2),(7,'USA',3),(8,'Canada',3),(9,'Japan',4),(10,'Australia',4);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `infoterritory`
--

/*!50001 DROP VIEW IF EXISTS `infoterritory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `infoterritory` AS select `s`.`id_State` AS `IDStato`,`s`.`StateName` AS `StateName`,`r`.`id_Region` AS `IDRegion`,`r`.`RegionName` AS `RegionName` from (`region` `r` join `state` `s` on((`s`.`id_Region` = `r`.`id_Region`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productcategory`
--

/*!50001 DROP VIEW IF EXISTS `productcategory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productcategory` AS select `p`.`id_Product` AS `IDProduct`,`p`.`ProductName` AS `ProductName`,`c`.`CategoryName` AS `CategoryName` from (`category` `c` join `product` `p` on((`p`.`id_Category` = `c`.`id_Category`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-08 15:35:17
