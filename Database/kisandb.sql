-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: kisan_connect
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer` (
  `bid` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `uid` (`uid`),
  CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (1,'atharv','kakade','atharv@gmail.com','shrigonda',1,'7678980934'),(2,'raghav','tiwari','raghav@gmail.com','daund',6,'9898989898'),(27,'raman','raghav','raman123@gmail.com','nashik',36,'9898909099'),(28,'qwe','tyu','qwe@gmail.com','shrigonda',37,'7678980934'),(29,'onkar','alekar','onkar123@gmail.com','shrigonda',38,'4376978675'),(30,'suraj','kamble','suraj123@gmail.com','shrigonda',42,'4577876567'),(31,'sumit','karjule','sumit@gmail.com','nevasa',43,'4565665678'),(32,'sumit','karjule','sumit@gmail.com','nevasa',44,'4565665678');
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `fpid` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `bid` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fpid` (`fpid`),
  KEY `FK5gtrg11m6m1l5vbqw8widbo9u` (`bid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`fpid`) REFERENCES `farmer_product` (`fpid`),
  CONSTRAINT `FK5gtrg11m6m1l5vbqw8widbo9u` FOREIGN KEY (`bid`) REFERENCES `buyer` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer`
--

DROP TABLE IF EXISTS `farmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmer` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `reg_no` varchar(255) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `reg_no_UNIQUE` (`reg_no`),
  KEY `uid` (`uid`),
  CONSTRAINT `farmer_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer`
--

LOCK TABLES `farmer` WRITE;
/*!40000 ALTER TABLE `farmer` DISABLE KEYS */;
INSERT INTO `farmer` VALUES (1,'sandip','rahinj','san123@gmail.com','98989999889',2,'9359530124',NULL),(2,'rupesh','kirdatt','rup123@gmail.com','567890908989',3,'8798989898',NULL),(4,'hiten ','rathod','hiten123@gmail.com','87888909889',5,'8888888888',NULL),(6,'abc','xyz','abc@gmail.com','121212',30,'9090909090',NULL),(10,'Deva','Dra','dev@gmail.com','5476878781',39,'8909786754',NULL),(11,'Abhishek','Ingle','abhi@gmail.com','43784782',40,'1234567890',NULL),(12,'suraj','deshmukh','suraj@gmail.com','23435456',41,'3245676567',NULL),(13,'ajay','ghodake','ajay@gmail.com','34545665',45,'2343456778',NULL);
/*!40000 ALTER TABLE `farmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer_product`
--

DROP TABLE IF EXISTS `farmer_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmer_product` (
  `fpid` int NOT NULL AUTO_INCREMENT,
  `sid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `vid` int DEFAULT NULL,
  PRIMARY KEY (`fpid`),
  KEY `sid` (`sid`),
  KEY `pid` (`pid`),
  KEY `FKedxucy8y3xgqkw6913dbnbbl0` (`vid`),
  CONSTRAINT `farmer_product_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `farmer` (`sid`),
  CONSTRAINT `farmer_product_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `FKedxucy8y3xgqkw6913dbnbbl0` FOREIGN KEY (`vid`) REFERENCES `variety` (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_product`
--

LOCK TABLES `farmer_product` WRITE;
/*!40000 ALTER TABLE `farmer_product` DISABLE KEYS */;
INSERT INTO `farmer_product` VALUES (9,1,1,50,2000.00,2);
/*!40000 ALTER TABLE `farmer_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `fpid` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `tot_amt` decimal(10,2) DEFAULT NULL,
  `bid` int DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fpid` (`fpid`),
  KEY `bid` (`bid`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`fpid`) REFERENCES `farmer_product` (`fpid`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `buyer` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `orderdetail_id` int NOT NULL AUTO_INCREMENT,
  `qty` int DEFAULT NULL,
  `rate` decimal(38,2) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `oid` int DEFAULT NULL,
  PRIMARY KEY (`orderdetail_id`),
  KEY `pid` (`pid`),
  KEY `odfk_idx` (`oid`),
  KEY `oddfkkk_idx` (`oid`),
  CONSTRAINT `odfkpkai` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,15,500.00,1,3),(2,50,2500.00,1,4),(3,50,2000.00,1,5),(4,20,500.00,1,6),(5,50,5000.00,1,7),(6,10,2000.00,1,8),(7,40,1000.00,1,8),(8,50,4000.00,1,9),(9,40,7000.00,1,10),(10,30,7000.00,1,11),(11,50,6000.00,1,11),(12,10,1000.00,1,12),(13,12,1200.00,1,13),(14,50,8000.00,1,14),(15,60,3000.00,1,15),(16,50,2000.00,1,16);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `bid` int DEFAULT NULL,
  `fpid` int DEFAULT NULL,
  `tot_amt` decimal(38,2) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK7tck9us01oktl0869atahc1u2` (`bid`),
  KEY `FK911vb40bc4gbnbtva8bf67poa` (`fpid`),
  CONSTRAINT `FK7tck9us01oktl0869atahc1u2` FOREIGN KEY (`bid`) REFERENCES `buyer` (`bid`),
  CONSTRAINT `FK911vb40bc4gbnbtva8bf67poa` FOREIGN KEY (`fpid`) REFERENCES `farmer_product` (`fpid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-08-18',1,9,500.00),(2,'2024-08-18',1,9,2000.00),(3,'2024-08-18',1,9,500.00),(4,'2024-08-18',1,9,2500.00),(5,'2024-08-18',1,9,2000.00),(6,'2024-08-18',1,9,500.00),(7,'2024-08-18',30,9,5000.00),(8,'2024-08-19',30,9,3000.00),(9,'2024-08-19',30,9,4000.00),(10,'2024-08-19',30,9,7000.00),(11,'2024-08-19',30,9,13000.00),(12,'2024-08-19',30,9,1000.00),(13,'2024-08-19',30,9,1200.00),(14,'2024-08-19',30,9,8000.00),(15,'2024-08-19',1,9,3000.00),(16,'2024-08-19',1,9,2000.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `pay_id` int NOT NULL AUTO_INCREMENT,
  `pay_method` varchar(255) DEFAULT NULL,
  `bid` int DEFAULT NULL,
  `trans_no` varchar(255) DEFAULT NULL,
  `oid` int DEFAULT NULL,
  `amount` decimal(38,2) DEFAULT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `FK5i7gltpihwbtqcfo42byt8d33` (`bid`),
  KEY `FK2881yj3k7cthql5lko15ju8tp` (`oid`),
  CONSTRAINT `FK2881yj3k7cthql5lko15ju8tp` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FK5i7gltpihwbtqcfo42byt8d33` FOREIGN KEY (`bid`) REFERENCES `buyer` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'wheat'),(2,'bajara'),(3,'jowar'),(4,'barley'),(5,'rice');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `rid` int NOT NULL,
  `rname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'user'),(2,'farmer'),(3,'buyer');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uid` int NOT NULL AUTO_INCREMENT,
  `rid` int DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `rid` (`rid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('atharv@gmail.com','$2a$11$.URlqXCK19J9PABRpTpJ6uOv0d5xjmgEloyetJngyh8sIpPFhyWH.',1,3,'atharv'),('san123@gmail.com','$2a$11$PeTMpHRQJqw01Bo/f5zYduXWcoCbXWFWDX4ufkDHAFSiqVii9d3va',2,2,'sandip'),('rup123@gmail.com','$2a$11$XoRhnZlTnoiNNOLQZwlvP.Z3Q9lyYG6eI96rU9oMuui4ky81Rotme',3,2,'rupesh'),('hiten123@gmail.com','$2a$11$cuCmkf1ZVsRHIEFI8WW5oedY2wlineRYLfcROzfvtJeXLhvLEOku2',5,2,'hiten'),('raghav@gmail.com','$2a$11$6GMqHgTSNiIY7RbAaJT20udrqxmPpE/msMWIfFqN6Z5X6rbyqe5n2',6,3,'raghav'),('hiten@gmail.com','$2a$11$IEtA6UKE1aQ6JX3Eac/GbutgfAHHG0wvOKnzN.6fabuxexbVpyFA2',8,3,'hiten'),('hiten@gmail.com','$2a$11$vI6FYQvWA54DeOhSnVEZeOq0eVa/9qwDY0BB/JFBW0onWz.M9tUuu',9,3,'hiten'),('hiten@gmail.com','$2a$11$i9628ZTA0Q.nfcRPW3MHruXPyUrl5mbNbn26rMSuPT4KuKsfDVRPK',10,3,'hiten'),('hiten@gmail.com','$2a$11$fsCKQMCWWAAJfHypJIBTeeSNy5Tb.oOG.Ko8FGVvdqF8JAAn7l4Ii',11,3,'hiten'),('hiten@gmail.com','$2a$11$Nf2IdQ5DLNogFtOHwBS9c.nsGQOgwgW5v2g6T1i2OxdfLSPf2hPuW',12,3,'hiten'),('hiten@gmail.com','$2a$11$k1EvYvf3AUnvl9an2VIne.7CT0N1fs/qS1VIB5Nk3.wgJK6N9d1XS',13,3,'hiten'),('hiten@gmail.com','$2a$11$sQ6vIvkGFeyST.SwbOwGJ.kTg53LoouIJglhNu355HE8C2hduAwfK',14,3,'hiten'),('hiten@gmail.com','$2a$11$yXe0jhpOR0qPVG8uccRLIOxNHjl0JbL5xfrABokbSBlumNzITSEye',15,3,'hiten'),('hiten@gmail.com','$2a$11$SOeVIYeQ6YaDlm7dJJSWM.tRB08AJdfjA8JzbAhcWGjIff7e4jO12',16,3,'hiten'),('hiten@gmail.com','$2a$11$aFsiWq.RVMMJLS8yrN1qjeGIK0rFCobX7/rt4Lro42lEM0yr83P0.',17,3,'hiten'),('hiten@gmail.com','$2a$11$vZjtx3GBFeJvArbJEDOuk.8NjhWSEUGbbkMX87SAlZuz1acpL2sCS',18,3,'hiten'),('hiten@gmail.com','$2a$11$ZqUSb7dkIEMtKGpnXGhuBuM5D1X4ulHXclixfZLRU3K/QPouGVoqi',19,3,'hiten'),('hiten@gmail.com','$2a$11$KQyd6uqTMezNuPsTAp50LeD2lA8SrQSJHmsGkxzRkwnkvQvR88cSW',20,3,'hiten'),('hiten@gmail.com','$2a$11$WXBuelrU.te3qxq.o0YvVO/8lZZa5PfkhUsJAIEqQoN4lhq4Jd/Gu',21,3,'hiten'),('hiten@gmail.com','$2a$11$DsjNFjyJCxBivkZiVp3XQOmDmJKh0xV7hdSg0hTB4GKjzQvmGv5Rm',22,3,'hiten'),('hiten@gmail.com','$2a$11$qLavIMtAiqdPCdKAGeF9fucSswKonvVi.tH6.uYLM8faDpwt8hJ26',23,3,'hiten'),('hiten@gmail.com','$2a$11$5PIeUG7VtDt5tRkaT80z0.pMvQCdFFmIhDhqdP0BHUhGBiz4n1xmC',24,3,'hiten'),('hiten@gmail.com','$2a$11$ml5l/7rzH7M94FSn3m9juelznpXynhFWGOHBzjPQveKyJD.TC7LaS',25,3,'hitu'),('hiten@gmail.com','$2a$11$j3yYCOruzrWdIPjAe4DdkuchtVW6QAoI.bpBTvRsfX3GUR5gwdiWO',26,3,'hitu'),('hiten@gmail.com','$2a$11$dfXWmriftJRGOAraD5DhmegfrY1X87e7ZP./M17kQ0TJxRa2U/0RO',27,3,'hitu'),('hiten@gmail.com','$2a$11$Jlrf05OeLXgzgly2hU9G5.0.MyKVRLIguP7.SpsamYJwKV0jCq0US',28,3,'hitu'),('hiten@gmail.com','$2a$11$H2aJz7Sl27fsPER5xvzRR.Ep.rEKONNCdUrt3Ks6cuJfyZBScr5ri',29,3,'hitu'),('abc@gmail.com','$2a$11$Vsc3vwB2pt9/ShV/NRZAae/.Yxl.fVfd2szB4vqorF1hNUnLugxGy',30,2,'abc'),('yash@gmail.com','$2a$11$ZvaGv2IsSWsye2GiiU4Gr.Cjtz.FTE1yjJAmLEz7R7rmGwqMq.tie',34,3,'yash'),('yash@gmail.com','$2a$11$ofIMScjtsyRi9MsbHU1/z.mW3JjyJ9gSap4DM4MKAIjYdnxLR/tVW',35,3,'yash'),('raman123@gmail.com','$2a$11$zZUs0xmO1h2TygteqOvcE.cPjirur1yw6GuiQ1wdYFJl/hK8.alJq',36,3,'raman'),('qwe@gmail.com','$2a$11$.MVFJAa4v2hOisFdXpvjC./HoA5IFh2/ZziqRp50rv.isHu4k5yHm',37,3,'qwe'),('onkar123@gmail.com','$2a$11$upK2GbWvVHpqB3HZqHnMtuNA8W8GjCqAMx/nN3m.CrNz7N3TYaC2K',38,3,'onkar'),('dev@gmail.com','$2a$11$P4J45BFlUOeeS/TlBqQ2oOGhEAgFNR9GGF/k8LTrl4oRZKRa3aaSi',39,2,'deva'),('abhi@gmail.com','$2a$11$Eq8Q7U0TY9r9Z.Rq0StgAenSAA7zjkVYv4bHPeNhJBBfoKGKUg4ou',40,2,'abhi'),('suraj@gmail.com','$2a$11$VObUCQhniShXwte5bR9yfuO.eDT.XA67OsPtB0EQDxUneNMjH5mYa',41,2,'suraj'),('suraj123@gmail.com','$2a$11$DoW7emaeA92C6z5ZacrRqOJX2vAg8Yhme6gcMZheDltPDJ5OMlJwC',42,3,'suraj123'),('sumit@gmail.com','$2a$11$z6ESMOvuNEF9eqwvZqkeW.DzzEpsqCidqw5ED9YlCztNho6jttFHO',43,3,'sumit'),('sumit@gmail.com','$2a$11$/SOUrF77lWCrqeuJ7beaJu1xqAeOHR7AzE4jp10NYrjV5wSb.kY0C',44,3,'sumit'),('ajay@gmail.com','$2a$11$4tWH9f1IBnm1Aq7sotzttOY3Y6iBj4yDKcFHbOkm7Q1GoNs1J5IV6',45,2,'ajay');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variety`
--

DROP TABLE IF EXISTS `variety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variety` (
  `vid` int NOT NULL AUTO_INCREMENT,
  `vname` varchar(255) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  PRIMARY KEY (`vid`),
  KEY `pid` (`pid`),
  CONSTRAINT `variety_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variety`
--

LOCK TABLES `variety` WRITE;
/*!40000 ALTER TABLE `variety` DISABLE KEYS */;
INSERT INTO `variety` VALUES (1,'lok1',1),(2,'sharbati',1),(3,'nandi-35',2),(4,'sampada',2),(5,'vasudha',3),(6,'phule chitra',3),(7,'manjula',4),(8,'azad',4),(9,'basmati',5),(10,'kolam',5);
/*!40000 ALTER TABLE `variety` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 14:20:29
