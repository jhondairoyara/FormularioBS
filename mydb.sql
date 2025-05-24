-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `cambio_direccion_entrega`
--

DROP TABLE IF EXISTS `cambio_direccion_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cambio_direccion_entrega` (
  `Id_Direccion` int NOT NULL AUTO_INCREMENT,
  `Direccion_Envio` varchar(150) NOT NULL,
  `Id_Ciudad` int NOT NULL,
  PRIMARY KEY (`Id_Direccion`),
  KEY `id_ciudad_idx` (`Id_Ciudad`),
  CONSTRAINT `fk_CambioDireccion_Ciudad` FOREIGN KEY (`Id_Ciudad`) REFERENCES `ciudad` (`Id_Ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cambio_direccion_entrega`
--

LOCK TABLES `cambio_direccion_entrega` WRITE;
/*!40000 ALTER TABLE `cambio_direccion_entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `cambio_direccion_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `Id_Carrito` int NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int NOT NULL,
  `Tiempo_Creacion` datetime NOT NULL,
  PRIMARY KEY (`Id_Carrito`),
  KEY `Id_Usuarios_idx` (`Id_Usuario`),
  CONSTRAINT `fk_Carrito_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `Id_Categoria` int NOT NULL AUTO_INCREMENT,
  `Nombre_Cat` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `Id_Ciudad` int NOT NULL AUTO_INCREMENT,
  `Nom_Ciudad` varchar(100) NOT NULL,
  `Id_Departamento` int NOT NULL,
  PRIMARY KEY (`Id_Ciudad`),
  KEY `Id_Departamento_idx` (`Id_Departamento`),
  CONSTRAINT `fk_Ciudad_Departamento` FOREIGN KEY (`Id_Departamento`) REFERENCES `departamento` (`Id_Departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (21,'Leticia',1),(22,'Medellín',2),(23,'Arauca',3),(24,'Barranquilla',4),(25,'Cartagena',5),(26,'Tunja',6),(27,'Manizales',7),(28,'Florencia',8),(29,'Yopal',9),(30,'Popayán',10),(31,'Valledupar',11),(32,'Quibdó',12),(33,'Montería',13),(34,'Bogotá',14),(35,'San José del Guaviare',15),(36,'Inírida',16),(37,'Neiva',17),(38,'Riohacha',18),(39,'Santa Marta',19),(40,'Villavicencio',20),(41,'Pasto',21),(42,'Cúcuta',22),(43,'Mocoa',23),(44,'Armenia',24),(45,'Pereira',25),(46,'San Andrés',26),(47,'Bucaramanga',27),(48,'Sincelejo',28),(49,'Ibagué',29),(50,'Cali',30),(51,'Mitú',31),(52,'Puerto Carreño',32);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `Id_Cuenta` int NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int NOT NULL,
  `Correo_Electronico` varchar(100) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Fecha_Registro` datetime NOT NULL,
  PRIMARY KEY (`Id_Cuenta`),
  KEY `Id_Usuario_idx` (`Id_Usuario`),
  CONSTRAINT `fk_Cuenta_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `Id_Departamento` int NOT NULL AUTO_INCREMENT,
  `Nom_Departamento` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Amazonas'),(2,'Antioquia'),(3,'Arauca'),(4,'Atlántico'),(5,'Bolívar'),(6,'Boyacá'),(7,'Caldas'),(8,'Caquetá'),(9,'Casanare'),(10,'Cauca'),(11,'Cesar'),(12,'Chocó'),(13,'Córdoba'),(14,'Cundinamarca'),(15,'Guaviare'),(16,'Guainía'),(17,'Huila'),(18,'La Guajira'),(19,'Magdalena'),(20,'Meta'),(21,'Nariño'),(22,'Norte de Santander'),(23,'Putumayo'),(24,'Quindío'),(25,'Risaralda'),(26,'San Andrés y Providencia'),(27,'Santander'),(28,'Sucre'),(29,'Tolima'),(30,'Valle del Cauca'),(31,'Vaupés'),(32,'Vichada');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_carrito`
--

DROP TABLE IF EXISTS `detalles_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_carrito` (
  `Id_Carrito` int NOT NULL,
  `Id_Producto` int NOT NULL,
  `Cantidad` tinyint NOT NULL,
  PRIMARY KEY (`Id_Carrito`,`Id_Producto`),
  KEY `Id_Producto_idx` (`Id_Producto`),
  CONSTRAINT `fk_DetallesCarrito_Carrito` FOREIGN KEY (`Id_Carrito`) REFERENCES `carrito` (`Id_Carrito`),
  CONSTRAINT `fk_DetallesCarrito_Producto` FOREIGN KEY (`Id_Producto`) REFERENCES `producto` (`Id_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_carrito`
--

LOCK TABLES `detalles_carrito` WRITE;
/*!40000 ALTER TABLE `detalles_carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilidad`
--

DROP TABLE IF EXISTS `disponibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilidad` (
  `Id_Stock` int NOT NULL AUTO_INCREMENT,
  `Id_Producto` int NOT NULL,
  `Cantidad_Disponible` int NOT NULL,
  `Cantidad_Reservada` int NOT NULL,
  `Cantidad_Vendida` int NOT NULL,
  PRIMARY KEY (`Id_Stock`),
  KEY `Id_Producto_idx` (`Id_Producto`),
  CONSTRAINT `fk_Disponibilidad_Producto` FOREIGN KEY (`Id_Producto`) REFERENCES `producto` (`Id_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidad`
--

LOCK TABLES `disponibilidad` WRITE;
/*!40000 ALTER TABLE `disponibilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `disponibilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `Id_Envio` int NOT NULL AUTO_INCREMENT,
  `Id_Pedido` int NOT NULL,
  `Id_Direccion` int NOT NULL,
  `Fecha_Envio` date NOT NULL,
  `Fecha_Entrega` date NOT NULL,
  `Id_Estado_Envio` tinyint NOT NULL,
  PRIMARY KEY (`Id_Envio`),
  KEY `Id_Pedido_idx` (`Id_Pedido`),
  KEY `Id_Estado_Envio_idx` (`Id_Estado_Envio`),
  KEY `Id_Direccion_idx` (`Id_Direccion`),
  CONSTRAINT `fk_Envio_Direccion` FOREIGN KEY (`Id_Direccion`) REFERENCES `cambio_direccion_entrega` (`Id_Direccion`),
  CONSTRAINT `fk_Envio_EstadoEnvio` FOREIGN KEY (`Id_Estado_Envio`) REFERENCES `estado_envio` (`Id_Estado_Envio`),
  CONSTRAINT `fk_Envio_Pedido` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`Id_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_envio`
--

DROP TABLE IF EXISTS `estado_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_envio` (
  `Id_Estado_Envio` tinyint NOT NULL AUTO_INCREMENT,
  `Estado_Envio` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Estado_Envio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_envio`
--

LOCK TABLES `estado_envio` WRITE;
/*!40000 ALTER TABLE `estado_envio` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_pago`
--

DROP TABLE IF EXISTS `estado_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_pago` (
  `Id_Estado_Pago` tinyint NOT NULL AUTO_INCREMENT,
  `Estado_Pago` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Estado_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_pago`
--

LOCK TABLES `estado_pago` WRITE;
/*!40000 ALTER TABLE `estado_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_pedido`
--

DROP TABLE IF EXISTS `estado_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_pedido` (
  `Id_Estado_Pedido` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Estado_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_pedido`
--

LOCK TABLES `estado_pedido` WRITE;
/*!40000 ALTER TABLE `estado_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `Id_Met_Pago` tinyint NOT NULL AUTO_INCREMENT,
  `Metodo` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Met_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `Id_Pago` int NOT NULL AUTO_INCREMENT,
  `Id_Pedido` int NOT NULL,
  `Id_Met_Pago` tinyint NOT NULL,
  `Limite_Tiempo_Pago` datetime NOT NULL,
  `Tiempo_Pago` datetime NOT NULL,
  `Id_Estado_Pago` tinyint NOT NULL,
  PRIMARY KEY (`Id_Pago`),
  KEY `Id_Pedidos_idx` (`Id_Pedido`),
  KEY `Id_Met_Pago_idx` (`Id_Met_Pago`),
  KEY `Id_Estado_Pago_idx` (`Id_Estado_Pago`),
  CONSTRAINT `fk_Pago_EstadoPago` FOREIGN KEY (`Id_Estado_Pago`) REFERENCES `estado_pago` (`Id_Estado_Pago`),
  CONSTRAINT `fk_Pago_MetodoPago` FOREIGN KEY (`Id_Met_Pago`) REFERENCES `metodo_pago` (`Id_Met_Pago`),
  CONSTRAINT `fk_Pago_Pedido` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`Id_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `Id_Pedido` int NOT NULL AUTO_INCREMENT,
  `Id_Carrito` int NOT NULL,
  `Tiempo_Pedido` datetime NOT NULL,
  `Id_Estado_Pedido` tinyint NOT NULL,
  PRIMARY KEY (`Id_Pedido`),
  KEY `Id_Carrito_idx` (`Id_Carrito`),
  KEY `Id_Estado_Pedido_idx` (`Id_Estado_Pedido`),
  CONSTRAINT `fk_Pedido_Carrito` FOREIGN KEY (`Id_Carrito`) REFERENCES `carrito` (`Id_Carrito`),
  CONSTRAINT `fk_Pedido_EstadoPedido` FOREIGN KEY (`Id_Estado_Pedido`) REFERENCES `estado_pedido` (`Id_Estado_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `Id_Producto` int NOT NULL AUTO_INCREMENT,
  `Id_Categoria` int NOT NULL,
  `Nombre_Producto` varchar(100) NOT NULL,
  `Descripcion` text NOT NULL,
  `Id_Tallas` int NOT NULL,
  `Precio_Unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id_Producto`),
  KEY `Id_Categoria_idx` (`Id_Categoria`),
  KEY `Id_Tallas_idx` (`Id_Tallas`),
  CONSTRAINT `fk_Producto_Categoria` FOREIGN KEY (`Id_Categoria`) REFERENCES `categoria` (`Id_Categoria`),
  CONSTRAINT `fk_Producto_Tallas` FOREIGN KEY (`Id_Tallas`) REFERENCES `tallas` (`Id_Tallas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallas`
--

DROP TABLE IF EXISTS `tallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tallas` (
  `Id_Tallas` int NOT NULL AUTO_INCREMENT,
  `Nombres_Talla` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Tallas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallas`
--

LOCK TABLES `tallas` WRITE;
/*!40000 ALTER TABLE `tallas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tallas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `Id_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Telefono` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Direccion` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Id_Ciudad` int NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  PRIMARY KEY (`Id_Usuario`),
  KEY `Id_Ciudad_idx` (`Id_Ciudad`),
  CONSTRAINT `fk_Usuario_Ciudad` FOREIGN KEY (`Id_Ciudad`) REFERENCES `ciudad` (`Id_Ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Luis','Ruiz','3278763980','Calle #3 12-02',37,'2005-11-15'),(2,'Juan','Zapata','3245453456','Carrera #47',34,'2000-12-12'),(3,'Alex','López','3135457689','Calle 5a #53-07',45,'2002-10-22'),(4,'Ana','Falla','3174234533','Calle #1',27,'2025-05-07'),(5,'Marco','Gómez','3204234567','Calle 1a #13-08',24,'1998-02-21'),(6,'Valentina','Reyes','3158345678','Calle 1a #12-47',45,'1994-10-20'),(7,'Juan','Orozco','3208906545','Calle 4a #29-03',27,'1999-11-11'),(8,'Carlos','Torres','3103456543','Carrera 7a #12-10',34,'1970-10-29'),(9,'Diego','Salazar','3202809087','Calle #34 - 42',30,'2000-12-22'),(14,'Laura','Valentina','3229876547','Calle #13 - 53',38,'2000-05-11'),(15,'Alejandro','Falla','3108923456','Calle #33 - 54',34,'2004-03-22'),(16,'Felipe','Ramírez','3176548921','Calle 42 #15-28',34,'2005-07-22'),(17,'Felipe','Falla','3254563456','Calle #23 - 34',34,'2005-06-21');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 10:07:26
