CREATE DATABASE  IF NOT EXISTS `teacher_app_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `teacher_app_db`;
-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: teacher_app_db
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'message: campo relacionado al mensaje que se va a representar en el chat.\n',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation_date: campo que indica la fecha de creación del mensaje.',
  `boolean_teacher` tinyint(1) NOT NULL COMMENT 'Campo que relaciona e indica si es o no el teacher el que genera el comentario.',
  `user_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chats_users1_idx` (`user_id`),
  KEY `fk_chats_teachers1_idx` (`teacher_id`),
  CONSTRAINT `fk_chats_teachers1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  CONSTRAINT `fk_chats_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,'Hola, me gustaría saber más sobre las clases de matemáticas.','2023-11-15 09:30:00',0,1,2),(2,'Claro, estaré encantado de ayudarte con eso.','2023-11-15 09:45:00',1,1,2),(3,'Buenos días, quisiera agendar una clase de biología para mañana.','2023-11-16 14:00:00',0,3,4),(4,'Sí, tengo disponibilidad en la tarde. ¿A qué hora te gustaría?','2023-11-16 14:15:00',1,3,4);
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_hours`
--

DROP TABLE IF EXISTS `class_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_hours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day_of_week` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Campo que va a contener el día de la semana del horario indicado. “Lunes”, “Martes”, “Miércoles”, “Jueves”, “Viernes”',
  `start_time` time NOT NULL COMMENT 'start_time: horario de inicio de las clases',
  `end_time` time NOT NULL COMMENT 'end_time: campo que indica el horario de finalización de las clases.',
  `slot` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'slot: campo que indica el slot horario de las clases “mañana”, “tarde”, “noche”.',
  `teacher_id` int NOT NULL,
  `id_user1` int DEFAULT NULL,
  `id_user2` int DEFAULT NULL,
  `id_user3` int DEFAULT NULL,
  `id_user4` int DEFAULT NULL,
  `id_user5` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_class_hours_teachers1_idx` (`teacher_id`),
  CONSTRAINT `fk_class_hours_teachers1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_hours`
--

LOCK TABLES `class_hours` WRITE;
/*!40000 ALTER TABLE `class_hours` DISABLE KEYS */;
INSERT INTO `class_hours` VALUES (1,'Viernes','08:00:00','10:00:00','Mañana',1,2,3,NULL,NULL,NULL),(2,'Sábado','15:00:00','17:00:00','Tarde',2,1,NULL,NULL,NULL,NULL),(3,'Jueves','13:00:00','15:00:00','Tarde',3,1,2,4,NULL,NULL),(4,'Miércoles','16:00:00','18:00:00','Tarde',4,3,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `class_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'department_name: campo que hace referencia al nombre del departamento',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'description: campo que hace referencia a la descripción del departamento.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Matemáticas','Departamento dedicado a la enseñanza de matemáticas.'),(2,'Historia','Departamento encargado de la enseñanza de historia y geografía.'),(3,'Biología','Departamento dedicado al estudio de la Biología.'),(4,'Literatura','Departamento enfocado en la enseñanza de literatura y lenguaje.');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `latitude` double NOT NULL COMMENT 'latitude: campo que va a contener la latitud al ubicarse automáticamente',
  `longitude` double NOT NULL COMMENT 'longitude: campo que va a contener la latitud al ubicarse automáticamente',
  `address` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'address: campo que va a contener la dirección completa.',
  `city` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'citie: campo que contiene el nombre de la ciudad de residencia.',
  `province` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'province: campo que contiene el nombre de la provincia de residencia.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,40.416775,-3.70379,'Calle Falsa 123','Madrid','Madrid'),(2,41.385063,2.173404,'Avinguda Diagonal 123','Barcelona','Barcelona'),(3,37.389092,-5.984459,'Calle Principal 456','Sevilla','Sevilla'),(4,39.469907,-0.376288,'Avenida Principal 789','Valencia','Valencia'),(5,41.385063,2.987456,'calle de quintal 25','Santiago','A Coruña');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL COMMENT 'rating: campo que va a contener el numero dado de puntuación en un rango entre 0 y 5.',
  `comment_student` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'comment_student: campo que va a contener el comentario asociado a la puntuación.',
  `comment_teacher` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'comment_teacher: campo que va a contener el comentario asociado a la puntuación.',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation_date: campo destinado a contener la fecha de creación del rating del comment con la formula (Now()).',
  `teacher_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ratings_teachers1_idx` (`teacher_id`),
  KEY `fk_ratings_users1_idx` (`user_id`),
  CONSTRAINT `fk_ratings_teachers1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  CONSTRAINT `fk_ratings_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,4,'Excelente profesor, muy claro en sus explicaciones.','Gracias','2023-11-15 10:00:00',1,2),(2,5,'Muy buen docente, recomiendo sus clases.','Gracias','2023-11-16 15:30:00',2,1),(3,3,'El profesor es bueno pero las clases son algo aburridas.','Perdoname por eso, intentare mejorar','2023-11-18 14:00:00',3,4),(4,4,'Las clases son dinámicas y entretenidas, aprendí mucho.','Me alegra mucho leer esto','2023-11-18 14:00:00',4,3);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'role: campo destinado a contener el rol de los usuarios',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'description: campo destinado a contener la descripción del rol de los usuarios.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'student','Rol asignado a los estudiantes'),(2,'teacher','Rol asignado a los profesores'),(3,'admin','Rol asignado a los administradores');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'subject: campo que indica la materia que imparte dicho profesor',
  `teacher_id` int NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_subjects_teachers1_idx` (`teacher_id`),
  KEY `fk_subjects_departments1_idx` (`department_id`),
  CONSTRAINT `fk_subjects_departments1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_subjects_teachers1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Trigonometría',1,1),(2,'Historia Medieval',2,2),(3,'Biología Forense',3,3),(4,'Literatura Anglosajona ',4,4);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id: campo que representa el id único del profesor\n',
  `experience` int NOT NULL COMMENT 'experience: campo que indica los años de experiencia del profesor',
  `class_mode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'class_mode: campo relacionado con el tipo de clase si es presencial o si es online.',
  `price_hour` decimal(10,2) NOT NULL COMMENT 'price_hour: campo que indica el precio/hora del profesor.',
  `about_me` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'about_me: campo que hace énfasis en una breve descripción del profesor.',
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teachers_users1_idx` (`user_id`),
  CONSTRAINT `fk_teachers_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,5,'Mañana',30.50,'Soy un apasionado de la enseñanza y me encanta ayudar a mis estudiantes a alcanzar su máximo potencial.',1),(2,3,'Tarde',25.00,'He enseñado historia durante años y disfruto compartiendo mi conocimiento con los alumnos.',2),(3,7,'Mañana',40.00,'Soy un apasionado de las ciencias naturales y disfruto enseñando Biología y Química.',3),(4,4,'Tarde',35.00,'Me encanta la literatura y tengo experiencia enseñando varios idiomas extranjeros.',4);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'name: campo destinado a contener el nombre y apellido de los usuarios (students y teachers).\n',
  `nickname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'nickname: campo que contiene el sobrenombre del usuario',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'email: campo que contiene el email del usuario.',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'phone: campo destinado a contener el número de teléfono del usuario',
  `password` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'password: campo que contiene la contraseña del usuario encriptada (por eso decidimos colocar tinytext).',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation_date: campo destinado a contener la fecha de creación del usuario con la formula (Now()).',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'update_date: campo que contiene la fecha de modificación de usuario.',
  `date_of_birth` date NOT NULL COMMENT 'age: campo que indica la edad del usuario.',
  `status` tinyint(1) NOT NULL COMMENT '“no validado” = 1\n“validado” = 2\n“baja” = 3',
  `photo` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'photo: campo que hace referencia a la URL de la imagen del usuario.',
  `role_id` int NOT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `fk_users_roles1_idx` (`role_id`),
  KEY `fk_users_locations1_idx` (`location_id`),
  CONSTRAINT `fk_users_locations1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `fk_users_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juan Pérez','juanito','juan.perez@example.com','123456789','$2a$10$L7NutDbu/E0XtYpw0rsUHeqAVZrim/hGfTa5B7Cbmmkw3f9.bpziK','2023-11-15 08:00:00','2023-11-15 08:00:00','1990-05-15',2,'https://i.pravatar.cc/500',3,1),(2,'María López','malopez','maria.lopez@example.com','987654321','$2a$10$L7NutDbu/E0XtYpw0rsUHeqAVZrim/hGfTa5B7Cbmmkw3f9.bpziK','2023-11-16 10:00:00','2023-11-16 10:00:00','1985-03-05',1,'https://i.pravatar.cc/500',2,2),(3,'Carlos Gómez','carlitos','carlos.gomez@example.com','555444333','$2a$10$L7NutDbu/E0XtYpw0rsUHeqAVZrim/hGfTa5B7Cbmmkw3f9.bpziK','2023-11-17 12:00:00','2023-11-17 12:00:00','1978-08-03',2,'https://i.pravatar.cc/500',2,3),(4,'Laura Martínez','lau','laura.martinez@example.com','666777888','$2a$10$L7NutDbu/E0XtYpw0rsUHeqAVZrim/hGfTa5B7Cbmmkw3f9.bpziK','2023-11-18 14:00:00','2023-11-18 14:00:00','1995-02-20',3,'https://i.pravatar.cc/500',1,4),(5,'Juano Alvarez','juan123','juana@gmail.com','637364548','$2a$10$L7NutDbu/E0XtYpw0rsUHeqAVZrim/hGfTa5B7Cbmmkw3f9.bpziK','2023-11-29 23:51:40','2023-11-29 23:51:40','1993-02-15',2,'https://i.pravatar.cc/500',1,5);
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

-- Dump completed on 2023-11-29 23:52:55
