-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: schooldb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `id_ciudad` int NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_sexo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_sexo_alumno` (`id_sexo`),
  KEY `fk_id_ciudad_alumno` (`id_ciudad`),
  CONSTRAINT `fk_id_ciudad_alumno` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`),
  CONSTRAINT `fk_id_sexo_alumno` FOREIGN KEY (`id_sexo`) REFERENCES `tipo_sexo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'María','García','López',1,'1999-03-15',2),(2,'Juan','Martínez','Sánchez',2,'2000-05-20',1),(3,'Ana','Hernández','Pérez',3,'1999-07-10',2),(4,'Pedro','Rodríguez','Gómez',1,'1998-12-05',1),(5,'Laura','Díaz','Fernández',2,'1999-09-25',2),(6,'María','García','López',1,'1999-03-15',2),(7,'Juan','Martínez','Sánchez',2,'2000-05-20',1),(8,'Ana','Hernández','Pérez',3,'1999-07-10',2),(9,'Pedro','Rodríguez','Gómez',1,'1998-12-05',1),(10,'Laura','Díaz','Fernández',2,'1999-09-25',2),(11,'Juan','Perez','Gomez',1,'2000-01-15',1);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_se_matricula_asignatura`
--

DROP TABLE IF EXISTS `alumno_se_matricula_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_se_matricula_asignatura` (
  `id_alumno` int NOT NULL,
  `id_asignatura` int NOT NULL,
  `id_curso_escolar` int NOT NULL,
  PRIMARY KEY (`id_alumno`,`id_asignatura`,`id_curso_escolar`),
  KEY `fk_id_asignatura` (`id_asignatura`),
  KEY `fk_id_curso_escolar` (`id_curso_escolar`),
  CONSTRAINT `fk_id_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_id_asignatura` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id`),
  CONSTRAINT `fk_id_curso_escolar` FOREIGN KEY (`id_curso_escolar`) REFERENCES `curso_escolar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_se_matricula_asignatura`
--

LOCK TABLES `alumno_se_matricula_asignatura` WRITE;
/*!40000 ALTER TABLE `alumno_se_matricula_asignatura` DISABLE KEYS */;
INSERT INTO `alumno_se_matricula_asignatura` VALUES (1,1,1),(2,2,2),(3,3,1),(4,4,2),(5,5,1);
/*!40000 ALTER TABLE `alumno_se_matricula_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignatura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `creditos` double NOT NULL,
  `id_tipo_asignatura` int NOT NULL,
  `id_curso` int NOT NULL,
  `id_cuatrimestre` int NOT NULL,
  `id_profesor` int DEFAULT NULL,
  `id_grado` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cuatrimestre` (`id_cuatrimestre`),
  KEY `fk_id_curso` (`id_curso`),
  KEY `fk_id_grado` (`id_grado`),
  KEY `fk_id_profesor_asignatura` (`id_profesor`),
  KEY `fk_id_tipo_asignatura` (`id_tipo_asignatura`),
  CONSTRAINT `fk_id_cuatrimestre` FOREIGN KEY (`id_cuatrimestre`) REFERENCES `cuatrimestre` (`id`),
  CONSTRAINT `fk_id_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`),
  CONSTRAINT `fk_id_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `fk_id_profesor_asignatura` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`),
  CONSTRAINT `fk_id_tipo_asignatura` FOREIGN KEY (`id_tipo_asignatura`) REFERENCES `tipo_asignatura` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
INSERT INTO `asignatura` VALUES (1,'Matemáticas',6,1,1,1,1,1),(2,'Física',5,1,2,2,2,2),(3,'Programación',7,1,1,1,3,1),(4,'Química',6,1,2,2,4,2),(5,'Historia',4,2,1,1,NULL,1);
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `asignaturassinprofesores`
--

DROP TABLE IF EXISTS `asignaturassinprofesores`;
/*!50001 DROP VIEW IF EXISTS `asignaturassinprofesores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `asignaturassinprofesores` AS SELECT 
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Madrid'),(2,'Barcelona'),(3,'Valencia'),(4,'Madrid'),(5,'Barcelona'),(6,'Valencia');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuatrimestre`
--

DROP TABLE IF EXISTS `cuatrimestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuatrimestre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuatrimestre`
--

LOCK TABLES `cuatrimestre` WRITE;
/*!40000 ALTER TABLE `cuatrimestre` DISABLE KEYS */;
INSERT INTO `cuatrimestre` VALUES (1,'Primer Cuatrimestre'),(2,'Segundo Cuatrimestre'),(3,'Primer Cuatrimestre'),(4,'Segundo Cuatrimestre');
/*!40000 ALTER TABLE `cuatrimestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'2018/2019'),(2,'2019/2020'),(3,'2018/2019'),(4,'2019/2020');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_escolar`
--

DROP TABLE IF EXISTS `curso_escolar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_escolar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `año_inicio` date NOT NULL,
  `año_fin` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_escolar`
--

LOCK TABLES `curso_escolar` WRITE;
/*!40000 ALTER TABLE `curso_escolar` DISABLE KEYS */;
INSERT INTO `curso_escolar` VALUES (1,'2018-09-01','2019-06-30'),(2,'2019-09-01','2020-06-30'),(3,'2018-09-01','2019-06-30'),(4,'2019-09-01','2020-06-30');
/*!40000 ALTER TABLE `curso_escolar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Departamento de Matemáticas'),(2,'Departamento de Física'),(3,'Departamento de Informática'),(4,'Departamento de Matemáticas'),(5,'Departamento de Física'),(6,'Departamento de Informática');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `departamentossincursoescolar`
--

DROP TABLE IF EXISTS `departamentossincursoescolar`;
/*!50001 DROP VIEW IF EXISTS `departamentossincursoescolar`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `departamentossincursoescolar` AS SELECT 
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `departamentossinprofesoressinasignatura`
--

DROP TABLE IF EXISTS `departamentossinprofesoressinasignatura`;
/*!50001 DROP VIEW IF EXISTS `departamentossinprofesoressinasignatura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `departamentossinprofesoressinasignatura` AS SELECT 
 1 AS `id`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `direccion_alumno`
--

DROP TABLE IF EXISTS `direccion_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion_alumno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(30) NOT NULL,
  `id_alumno` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_alumno_dir_alumno` (`id_alumno`),
  CONSTRAINT `fk_id_alumno_dir_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion_alumno`
--

LOCK TABLES `direccion_alumno` WRITE;
/*!40000 ALTER TABLE `direccion_alumno` DISABLE KEYS */;
INSERT INTO `direccion_alumno` VALUES (36,'Calle Mayor 123',1),(37,'Av. Diagonal 456',2),(38,'Plaza del Carmen 789',3),(39,'C/ Gran Vía 987',4),(40,'Paseo de Gracia 654',5);
/*!40000 ALTER TABLE `direccion_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion_profesor`
--

DROP TABLE IF EXISTS `direccion_profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion_profesor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(25) NOT NULL,
  `id_profesor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_profesor_direccion` (`id_profesor`),
  CONSTRAINT `fk_id_profesor_direccion` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion_profesor`
--

LOCK TABLES `direccion_profesor` WRITE;
/*!40000 ALTER TABLE `direccion_profesor` DISABLE KEYS */;
INSERT INTO `direccion_profesor` VALUES (6,'C/ Mayor 456',1),(7,'Av. Diagonal 789',2),(8,'C/ Serrano 123',3),(9,'Plaza Mayor 345',4),(10,'C/ Alcalá 678',5);
/*!40000 ALTER TABLE `direccion_profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado`
--

DROP TABLE IF EXISTS `grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado`
--

LOCK TABLES `grado` WRITE;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
INSERT INTO `grado` VALUES (1,'Ingeniería Informática'),(2,'Matemáticas'),(3,'Física'),(4,'Ingeniería Informática'),(5,'Matemáticas'),(6,'Física');
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `listaralumnas`
--

DROP TABLE IF EXISTS `listaralumnas`;
/*!50001 DROP VIEW IF EXISTS `listaralumnas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listaralumnas` AS SELECT 
 1 AS `alumnas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listaralumnos`
--

DROP TABLE IF EXISTS `listaralumnos`;
/*!50001 DROP VIEW IF EXISTS `listaralumnos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listaralumnos` AS SELECT 
 1 AS `apellido1`,
 1 AS `apellido2`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listaralumnosmatriculados2018_2019`
--

DROP TABLE IF EXISTS `listaralumnosmatriculados2018_2019`;
/*!50001 DROP VIEW IF EXISTS `listaralumnosmatriculados2018_2019`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listaralumnosmatriculados2018_2019` AS SELECT 
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listaralumnosnacidos1999`
--

DROP TABLE IF EXISTS `listaralumnosnacidos1999`;
/*!50001 DROP VIEW IF EXISTS `listaralumnosnacidos1999`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listaralumnosnacidos1999` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `apellido1`,
 1 AS `apellido2`,
 1 AS `id_ciudad`,
 1 AS `fecha_nacimiento`,
 1 AS `id_sexo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listarprofesendepartamento`
--

DROP TABLE IF EXISTS `listarprofesendepartamento`;
/*!50001 DROP VIEW IF EXISTS `listarprofesendepartamento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listarprofesendepartamento` AS SELECT 
 1 AS `nombre_departamento`,
 1 AS `cantidad_profesores`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listartelefonosalumnosactivos`
--

DROP TABLE IF EXISTS `listartelefonosalumnosactivos`;
/*!50001 DROP VIEW IF EXISTS `listartelefonosalumnosactivos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listartelefonosalumnosactivos` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido1`,
 1 AS `apellido2`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nif_alumno`
--

DROP TABLE IF EXISTS `nif_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nif_alumno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nif` varchar(30) NOT NULL,
  `id_alumno` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_alumno_nif` (`id_alumno`),
  CONSTRAINT `fk_id_alumno_nif` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nif_alumno`
--

LOCK TABLES `nif_alumno` WRITE;
/*!40000 ALTER TABLE `nif_alumno` DISABLE KEYS */;
INSERT INTO `nif_alumno` VALUES (6,'12345678A',1),(7,'23456789B',2),(8,'34567890C',3),(9,'45678901D',4),(10,'56789012E',5),(11,'12345678A',1),(12,'23456789B',2),(13,'34567890C',3),(14,'45678901D',4),(15,'56789012E',5);
/*!40000 ALTER TABLE `nif_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nif_profesor`
--

DROP TABLE IF EXISTS `nif_profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nif_profesor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nif` varchar(30) NOT NULL,
  `id_profesor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_profesor` (`id_profesor`),
  CONSTRAINT `fk_id_profesor` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nif_profesor`
--

LOCK TABLES `nif_profesor` WRITE;
/*!40000 ALTER TABLE `nif_profesor` DISABLE KEYS */;
INSERT INTO `nif_profesor` VALUES (1,'12345678A',1),(2,'23456789B',2),(3,'34567890C',3),(4,'45678901D',4),(5,'56789012E',5);
/*!40000 ALTER TABLE `nif_profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `id_ciudad` int NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_sexo` int NOT NULL,
  `id_departamento` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_ciudad` (`id_ciudad`),
  KEY `fk_id_sexo` (`id_sexo`),
  KEY `fk_id_departamento_profesor` (`id_departamento`),
  CONSTRAINT `fk_id_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`),
  CONSTRAINT `fk_id_departamento_profesor` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`),
  CONSTRAINT `fk_id_sexo` FOREIGN KEY (`id_sexo`) REFERENCES `tipo_sexo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'Maria','Gonzalez','Lopez',2,'1985-07-20',2,1),(2,'Sofía','López','Martínez',2,'1980-03-12',2,2),(3,'Pablo','González','Fernández',3,'1982-09-05',1,3),(4,'Elena','Martín','Sanz',1,'1978-11-30',2,2),(5,'Alejandro','Díaz','Pérez',2,'1985-07-15',1,3),(6,'Carlos','Ruiz','Gómez',1,'1975-06-20',1,NULL),(7,'Sofía','López','Martínez',2,'1980-03-12',2,NULL),(8,'Pablo','González','Fernández',3,'1982-09-05',1,NULL),(9,'Elena','Martín','Sanz',1,'1978-11-30',2,NULL),(10,'Alejandro','Díaz','Pérez',2,'1985-07-15',1,NULL);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_alumno`
--

DROP TABLE IF EXISTS `telefono_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_alumno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` decimal(10,0) NOT NULL,
  `id_alumno` int NOT NULL,
  `id_tipo_telefono` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_alumno_tel` (`id_alumno`),
  KEY `fk_id_tipo_telefono_alumno` (`id_tipo_telefono`),
  CONSTRAINT `fk_id_alumno_tel` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_id_tipo_telefono_alumno` FOREIGN KEY (`id_tipo_telefono`) REFERENCES `tipo_telefono` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_alumno`
--

LOCK TABLES `telefono_alumno` WRITE;
/*!40000 ALTER TABLE `telefono_alumno` DISABLE KEYS */;
INSERT INTO `telefono_alumno` VALUES (4,666555444,1,1),(5,777888999,2,2),(6,555444333,3,1);
/*!40000 ALTER TABLE `telefono_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_profesor`
--

DROP TABLE IF EXISTS `telefono_profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_profesor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` decimal(10,0) NOT NULL,
  `id_profesor` int NOT NULL,
  `id_tipo_telefono` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_profesor_telofono` (`id_profesor`),
  KEY `fk_id_tipo_telefono` (`id_tipo_telefono`),
  CONSTRAINT `fk_id_profesor_telofono` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`),
  CONSTRAINT `fk_id_tipo_telefono` FOREIGN KEY (`id_tipo_telefono`) REFERENCES `tipo_telefono` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_profesor`
--

LOCK TABLES `telefono_profesor` WRITE;
/*!40000 ALTER TABLE `telefono_profesor` DISABLE KEYS */;
INSERT INTO `telefono_profesor` VALUES (4,666777888,1,1),(5,777888999,2,2),(6,555666777,3,1);
/*!40000 ALTER TABLE `telefono_profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_asignatura`
--

DROP TABLE IF EXISTS `tipo_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_asignatura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_asignatura`
--

LOCK TABLES `tipo_asignatura` WRITE;
/*!40000 ALTER TABLE `tipo_asignatura` DISABLE KEYS */;
INSERT INTO `tipo_asignatura` VALUES (1,'Obligatoria'),(2,'Optativa'),(3,'Obligatoria'),(4,'Optativa');
/*!40000 ALTER TABLE `tipo_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_sexo`
--

DROP TABLE IF EXISTS `tipo_sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_sexo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_sexo`
--

LOCK TABLES `tipo_sexo` WRITE;
/*!40000 ALTER TABLE `tipo_sexo` DISABLE KEYS */;
INSERT INTO `tipo_sexo` VALUES (1,'Masculino'),(2,'Femenino'),(3,'Masculino'),(4,'Femenino');
/*!40000 ALTER TABLE `tipo_sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_telefono`
--

DROP TABLE IF EXISTS `tipo_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_telefono` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_telefono`
--

LOCK TABLES `tipo_telefono` WRITE;
/*!40000 ALTER TABLE `tipo_telefono` DISABLE KEYS */;
INSERT INTO `tipo_telefono` VALUES (1,'Móvil'),(2,'Fijo');
/*!40000 ALTER TABLE `tipo_telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `asignaturassinprofesores`
--

/*!50001 DROP VIEW IF EXISTS `asignaturassinprofesores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `asignaturassinprofesores` AS select `asg`.`nombre` AS `nombre` from (`asignatura` `asg` left join `profesor` `p` on((`p`.`id` = `asg`.`id_profesor`))) where (`p`.`id` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `departamentossincursoescolar`
--

/*!50001 DROP VIEW IF EXISTS `departamentossincursoescolar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `departamentossincursoescolar` AS select `departamento`.`nombre` AS `nombre` from `departamento` where `departamento`.`id` in (select distinct `profesor`.`id_departamento` from (`profesor` join `asignatura` on((`profesor`.`id` = `asignatura`.`id_profesor`)))) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `departamentossinprofesoressinasignatura`
--

/*!50001 DROP VIEW IF EXISTS `departamentossinprofesoressinasignatura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `departamentossinprofesoressinasignatura` AS select `d`.`id` AS `id`,`d`.`nombre` AS `nombre` from (((`profesor` `p` join `departamento` `d` on((`p`.`id_departamento` = `d`.`id`))) join `asignatura` `asg` on((`p`.`id` = `asg`.`id_profesor`))) join `grado` `g` on((`asg`.`id_grado` = `g`.`id`))) where (`g`.`nombre` = 'Ingeniería Informática') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listaralumnas`
--

/*!50001 DROP VIEW IF EXISTS `listaralumnas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listaralumnas` AS select count(`a`.`id`) AS `alumnas` from (`alumno` `a` join `tipo_sexo` `ts` on((`a`.`id_sexo` = `ts`.`id`))) where (`ts`.`id` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listaralumnos`
--

/*!50001 DROP VIEW IF EXISTS `listaralumnos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listaralumnos` AS select `a`.`apellido1` AS `apellido1`,`a`.`apellido2` AS `apellido2`,`a`.`nombre` AS `nombre` from `alumno` `a` order by `a`.`apellido1`,`a`.`apellido2`,`a`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listaralumnosmatriculados2018_2019`
--

/*!50001 DROP VIEW IF EXISTS `listaralumnosmatriculados2018_2019`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listaralumnosmatriculados2018_2019` AS select `al`.`nombre` AS `nombre` from ((`alumno` `al` join `alumno_se_matricula_asignatura` `asm` on((`al`.`id` = `asm`.`id_alumno`))) join `curso_escolar` `cs` on((`asm`.`id_curso_escolar` = `cs`.`id`))) where (`cs`.`id` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listaralumnosnacidos1999`
--

/*!50001 DROP VIEW IF EXISTS `listaralumnosnacidos1999`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listaralumnosnacidos1999` AS select `a`.`id` AS `id`,`a`.`nombre` AS `nombre`,`a`.`apellido1` AS `apellido1`,`a`.`apellido2` AS `apellido2`,`a`.`id_ciudad` AS `id_ciudad`,`a`.`fecha_nacimiento` AS `fecha_nacimiento`,`a`.`id_sexo` AS `id_sexo` from `alumno` `a` where (year(`a`.`fecha_nacimiento`) = 1999) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listarprofesendepartamento`
--

/*!50001 DROP VIEW IF EXISTS `listarprofesendepartamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listarprofesendepartamento` AS select `d`.`nombre` AS `nombre_departamento`,count(`p`.`id`) AS `cantidad_profesores` from (`departamento` `d` join `profesor` `p` on((`d`.`id` = `p`.`id_departamento`))) group by `d`.`nombre` order by `cantidad_profesores` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listartelefonosalumnosactivos`
--

/*!50001 DROP VIEW IF EXISTS `listartelefonosalumnosactivos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listartelefonosalumnosactivos` AS select `a`.`nombre` AS `nombre`,`a`.`apellido1` AS `apellido1`,`a`.`apellido2` AS `apellido2` from (`alumno` `a` join `telefono_alumno` `ta` on((`a`.`id` = `ta`.`id_alumno`))) where (`ta`.`id_alumno` is not null) */;
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

-- Dump completed on 2024-05-14  7:32:11
