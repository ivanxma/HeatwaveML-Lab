-- MySQLShell dump 2.0.1  Distrib Ver 8.0.33-commercial for macos13 on x86_64 - for MySQL 8.0.33 (MySQL Enterprise Server - Commercial), for macos13 (x86_64)
--
-- Host: 129.213.214.91    Database: airflight    Table: airlines_train
-- ------------------------------------------------------
-- Server version	8.0.33

--
-- Table structure for table `airlines_train`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `airlines_train` (
  `Airline` varchar(255) DEFAULT NULL,
  `Flight` float DEFAULT NULL,
  `AirportFrom` varchar(255) DEFAULT NULL,
  `AirportTo` varchar(255) DEFAULT NULL,
  `DayOfWeek` int DEFAULT NULL,
  `Time` float DEFAULT NULL,
  `Length` float DEFAULT NULL,
  `Delay` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
