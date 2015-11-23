-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: pokemons
-- ------------------------------------------------------
-- Server version	5.6.17-enterprise-commercial-advanced-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP DATABASE IF EXISTS pokemons;

CREATE DATABASE pokemons;
USE pokemons;

--
-- Table structure for table `amigos`
--

DROP TABLE IF EXISTS `amigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amigos` (
  `idinvitado` int(11) DEFAULT NULL,
  `idinvitador` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amigos`
--

LOCK TABLES `amigos` WRITE;
/*!40000 ALTER TABLE `amigos` DISABLE KEYS */;
INSERT INTO `amigos` VALUES (1,2,1),(1,3,1),(1,4,1),(2,3,1),(3,4,1),(7,1,1),(1,8,0);
/*!40000 ALTER TABLE `amigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ataques`
--

DROP TABLE IF EXISTS `ataques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ataques` (
  `idataque` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `poder` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idataque`),
  KEY `idTipo_idx` (`tipo`),
  CONSTRAINT `idTipo` FOREIGN KEY (`tipo`) REFERENCES `tipos` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ataques`
--

LOCK TABLES `ataques` WRITE;
/*!40000 ALTER TABLE `ataques` DISABLE KEYS */;
INSERT INTO `ataques` VALUES (1,1,50,'A physical attack in which the user charges and slams into the target with its whole body.','Tackle'),(2,1,5,'The user growls in an endearing way, making opposing Pokémon less wary.','Growl'),(3,3,10,'A seed is planted on the target.','Leech Sed'),(4,3,45,'The enemy is struck with slender, whiplike vines to inflict damage.','Vine Whip'),(5,2,15,'The user scatters a cloud of poisonous dust on the target.','Poison Powder'),(6,3,15,'The user scatters a big cloud of sleep-inducing dust around the target.','Sleep Powder');
/*!40000 ALTER TABLE `ataques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capturados`
--

DROP TABLE IF EXISTS `capturados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capturados` (
  `idpokemon` int(11) NOT NULL,
  `identrenador` int(11) NOT NULL,
  `apodo` varchar(25) NOT NULL,
  `nivel` int(11) NOT NULL,
  `habilidad` int(11) NOT NULL,
  `ataque1` int(11) NOT NULL,
  `ataque2` int(11) NOT NULL,
  `ataque3` int(11) NOT NULL,
  `ataque4` int(11) NOT NULL,
  `health` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpokemon`,`identrenador`),
  KEY `idAtaques_idx` (`ataque1`),
  KEY `idHabilidadC_idx` (`habilidad`),
  KEY `idEntrenadorC_idx` (`identrenador`),
  KEY `idAtaques2_idx` (`ataque2`),
  KEY `idAtaques3_idx` (`ataque3`),
  KEY `idAtaques4_idx` (`ataque4`),
  CONSTRAINT `idAtaques` FOREIGN KEY (`ataque1`) REFERENCES `ataques` (`idataque`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idAtaques2` FOREIGN KEY (`ataque2`) REFERENCES `ataques` (`idataque`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idAtaques3` FOREIGN KEY (`ataque3`) REFERENCES `ataques` (`idataque`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idAtaques4` FOREIGN KEY (`ataque4`) REFERENCES `ataques` (`idataque`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idEntrenadorC` FOREIGN KEY (`identrenador`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idHabilidadC` FOREIGN KEY (`habilidad`) REFERENCES `pokemon_habilidad` (`idhabilidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPokemonC` FOREIGN KEY (`idpokemon`) REFERENCES `pokemones` (`idpokemon`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capturados`
--

LOCK TABLES `capturados` WRITE;
/*!40000 ALTER TABLE `capturados` DISABLE KEYS */;
INSERT INTO `capturados` VALUES (1,1,'Bulbasaur',29,1,2,2,3,3,32),(1,3,'Bulba',35,2,5,6,2,3,37),(1,4,'MiMostrrrrooo',22,2,2,6,1,4,0),(2,1,'Plants',52,1,3,6,3,2,89),(2,3,'Poop',19,1,4,2,5,2,36),(2,4,'popis',21,2,4,1,2,2,16),(3,1,'Weed',14,1,5,2,4,5,22),(3,3,'Venosaur',16,2,5,4,5,5,25),(4,2,'El Komander',4,1,1,1,1,1,1),(4,7,'Poop',5,1,1,1,1,1,1),(5,2,'Fierro Pariente',76,1,1,1,1,1,44),(5,4,'yoloswaggins',15,1,1,1,1,1,8),(7,1,'Squirt',27,1,1,1,1,1,29),(7,6,'SquirtMe',5,1,1,1,1,1,2),(7,8,'Tortuguita',5,1,1,1,1,1,2),(8,1,'Warti',37,1,1,1,1,1,49),(9,1,'BigTurtle',17,1,1,1,1,1,32),(11,1,'Harden',61,1,1,1,1,1,66),(12,1,'NotVenomoth',88,1,1,1,1,1,111),(13,1,'Pinhead',53,1,1,1,1,1,48),(15,1,'GreenHornet',45,1,1,1,1,1,64);
/*!40000 ALTER TABLE `capturados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efectividad_tipo`
--

DROP TABLE IF EXISTS `efectividad_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `efectividad_tipo` (
  `idTipoPrincipal` int(11) NOT NULL,
  `idTipoSecundario` int(11) NOT NULL,
  `debil` tinyint(4) NOT NULL,
  PRIMARY KEY (`idTipoPrincipal`,`idTipoSecundario`),
  KEY `idTipoSecundario_idx` (`idTipoSecundario`),
  CONSTRAINT `idTipoPrincipal` FOREIGN KEY (`idTipoPrincipal`) REFERENCES `tipos` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idTipoSecundario` FOREIGN KEY (`idTipoSecundario`) REFERENCES `tipos` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efectividad_tipo`
--

LOCK TABLES `efectividad_tipo` WRITE;
/*!40000 ALTER TABLE `efectividad_tipo` DISABLE KEYS */;
INSERT INTO `efectividad_tipo` VALUES (1,1,0),(2,3,1),(2,4,1),(3,2,0),(3,3,0),(3,4,1),(4,6,0),(5,2,1),(5,3,1),(6,1,1),(6,8,0),(7,1,1),(7,15,1),(8,5,1),(8,11,0),(9,3,0),(9,4,1),(10,1,0),(10,9,0),(11,2,1),(11,4,1),(12,2,0),(12,4,0),(13,8,1),(13,14,1),(14,16,0),(14,17,0),(15,1,1),(15,11,1),(16,3,1),(16,4,0),(17,2,0),(17,5,0);
/*!40000 ALTER TABLE `efectividad_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidades`
--

DROP TABLE IF EXISTS `habilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidades` (
  `idhabilidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`idhabilidad`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidades`
--

LOCK TABLES `habilidades` WRITE;
/*!40000 ALTER TABLE `habilidades` DISABLE KEYS */;
INSERT INTO `habilidades` VALUES (1,'Chlorophyll','Boosts the Pokémon\'s Speed stat in sunshine.'),(2,'Overgrow','Powers up Grass-type moves when the Pokémon is in trouble.'),(3,'Clear Body','Prevents other Pokémon from lowering its stats.'),(4,'Anticipation','Senses a foe\'s dangerous moves.'),(5,'Drizzle','The Pokémon makes it rain when it enters a battle.'),(6,'Early Bird','The Pokémon awakens quickly from sleep.'),(7,'Run Away','Enables a sure getaway from wild Pokémon.'),(8,'Friend Guard','Reduces damage done to allies.'),(9,'Imposter','It transforms itself into the Pokémon it is facing.'),(10,'Primordial Sea	','Makes it rain heavily when the ability activates.'),(11,'Solid Rock','Reduces damage from supereffective attacks.'),(12,'Truant','Pokémon can\'t attack on consecutive turns.'),(13,'Zen Mode	','Changes the Pokémon\'s shape when HP is halved.'),(14,'Storm Drain	','Draws in all Water-type moves to up Sp. Attack.'),(15,'Super Luck','Heightens the critical-hit ratios of moves.'),(16,'Regenerator','Restores a little HP when withdrawn from battle.');
/*!40000 ALTER TABLE `habilidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `idPerfil` int(11) NOT NULL,
  `idObjeto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idPerfil`,`idObjeto`),
  KEY `idObjeto_idx` (`idObjeto`),
  CONSTRAINT `idObjeto` FOREIGN KEY (`idObjeto`) REFERENCES `objetos` (`idobjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPerfilI` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,1),(2,1,1),(2,3,0),(3,1,6),(4,1,0),(4,2,0),(4,3,2);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetos`
--

DROP TABLE IF EXISTS `objetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objetos` (
  `idobjeto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` int(11) NOT NULL,
  `valor_efecto` double NOT NULL,
  PRIMARY KEY (`idobjeto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetos`
--

LOCK TABLES `objetos` WRITE;
/*!40000 ALTER TABLE `objetos` DISABLE KEYS */;
INSERT INTO `objetos` VALUES (1,'PokeBall','Use this to catch a Pokemon',100,1),(2,'GreatBall','This Ball has a higher catch rate than a normal PokeBall',250,1.25),(3,'UltraBall','This Ball will make catching a Pokemon even easier',400,1.5);
/*!40000 ALTER TABLE `objetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oponentes`
--

DROP TABLE IF EXISTS `oponentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oponentes` (
  `idprincipal` int(11) NOT NULL,
  `idoponente` int(11) NOT NULL,
  PRIMARY KEY (`idprincipal`,`idoponente`),
  KEY `idoponente_perfil_idx` (`idoponente`),
  CONSTRAINT `idoponente_perfil` FOREIGN KEY (`idoponente`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idperfil_perfil` FOREIGN KEY (`idprincipal`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oponentes`
--

LOCK TABLES `oponentes` WRITE;
/*!40000 ALTER TABLE `oponentes` DISABLE KEYS */;
INSERT INTO `oponentes` VALUES (3,1),(4,2),(1,3),(2,4),(6,5),(5,6),(7,7),(8,8);
/*!40000 ALTER TABLE `oponentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `sprite` varchar(100) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `dinero` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `cumple` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  PRIMARY KEY (`idperfil`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'chuu','pass','img/chuu.png','chuu24@gmail.com',16200,'Jesus Herrera','July/8','Mexico'),(2,'sue','bob','img/sue.png','imsomeonelse@gmail.com',300,'Susana Gonzalez','March/16','Canada'),(3,'chuu24','pass','img/chuu.png','chuu24@gmail.com',15000,'Chuu Herrera','July/8','Mexico'),(4,'asd','asd','img/chuu.png','asd@asd.com',0,'asd','asd','asd'),(5,'infiernanda','infier','img/train/f6.png','infier@mail.com',2000,'Fernanda Montiel','1988-09-15','MX'),(6,'cantucky','pass','img/train/f5.png','cantucky@canto.com',2000,'Daniel Canto','1994-07-12','MX'),(7,'quijadin','muai','img/train/f1.png','quisiera@propuesta.com',2000,'Roman Aguilar','1993-02-14','BN'),(8,'chimi','rana','img/train/m5.png','chimi@reptiles.com',2000,'Sebastian Chimal','1999-02-22','BB');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_ataque`
--

DROP TABLE IF EXISTS `pokemon_ataque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_ataque` (
  `idpokemon` int(11) NOT NULL,
  `idataque` int(11) NOT NULL,
  PRIMARY KEY (`idpokemon`,`idataque`),
  KEY `idAtaque_idx` (`idataque`),
  CONSTRAINT `idAtaqueOtro` FOREIGN KEY (`idataque`) REFERENCES `ataques` (`idataque`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPokemonOtro` FOREIGN KEY (`idpokemon`) REFERENCES `pokemones` (`idpokemon`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_ataque`
--

LOCK TABLES `pokemon_ataque` WRITE;
/*!40000 ALTER TABLE `pokemon_ataque` DISABLE KEYS */;
INSERT INTO `pokemon_ataque` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(7,1),(9,1),(11,1),(13,1),(16,1),(17,1),(153,1),(155,1),(157,1),(159,1),(161,1),(253,1),(254,1),(257,1),(258,1),(260,1),(389,1),(392,1),(393,1),(395,1),(396,1),(398,1),(495,1),(496,1),(499,1),(501,1),(503,1),(653,1),(656,1),(658,1),(1,2),(2,2),(3,2),(7,2),(8,2),(9,2),(10,2),(12,2),(17,2),(152,2),(154,2),(156,2),(160,2),(161,2),(252,2),(254,2),(256,2),(258,2),(260,2),(387,2),(389,2),(390,2),(391,2),(393,2),(395,2),(396,2),(397,2),(398,2),(495,2),(497,2),(499,2),(501,2),(502,2),(650,2),(652,2),(653,2),(656,2),(658,2),(1,3),(2,3),(3,3),(4,3),(6,3),(8,3),(11,3),(14,3),(16,3),(152,3),(155,3),(156,3),(158,3),(160,3),(162,3),(252,3),(253,3),(255,3),(256,3),(257,3),(258,3),(387,3),(388,3),(390,3),(391,3),(393,3),(394,3),(397,3),(398,3),(496,3),(497,3),(500,3),(501,3),(502,3),(650,3),(652,3),(654,3),(655,3),(656,3),(658,3),(1,4),(2,4),(3,4),(4,4),(6,4),(8,4),(11,4),(12,4),(15,4),(17,4),(153,4),(154,4),(156,4),(158,4),(162,4),(252,4),(254,4),(255,4),(257,4),(259,4),(260,4),(387,4),(389,4),(390,4),(392,4),(396,4),(397,4),(398,4),(495,4),(498,4),(500,4),(502,4),(650,4),(651,4),(654,4),(657,4),(1,5),(2,5),(3,5),(5,5),(6,5),(7,5),(10,5),(12,5),(15,5),(16,5),(152,5),(154,5),(157,5),(158,5),(159,5),(160,5),(162,5),(253,5),(254,5),(255,5),(257,5),(259,5),(388,5),(390,5),(391,5),(394,5),(396,5),(397,5),(398,5),(496,5),(497,5),(500,5),(503,5),(651,5),(654,5),(657,5),(1,6),(2,6),(3,6),(5,6),(10,6),(13,6),(15,6),(17,6),(153,6),(155,6),(157,6),(159,6),(161,6),(162,6),(254,6),(256,6),(258,6),(260,6),(388,6),(389,6),(392,6),(394,6),(395,6),(397,6),(398,6),(496,6),(498,6),(501,6),(503,6),(651,6),(655,6),(657,6);
/*!40000 ALTER TABLE `pokemon_ataque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_equipo`
--

DROP TABLE IF EXISTS `pokemon_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_equipo` (
  `idpokemon` int(11) NOT NULL,
  `identrenador` int(11) NOT NULL,
  `principal` tinyint(4) NOT NULL,
  PRIMARY KEY (`idpokemon`,`identrenador`,`principal`),
  KEY `team_entrenador_idx` (`identrenador`),
  CONSTRAINT `team_entrenador` FOREIGN KEY (`identrenador`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `team_pokemon` FOREIGN KEY (`idpokemon`) REFERENCES `pokemones` (`idpokemon`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_equipo`
--

LOCK TABLES `pokemon_equipo` WRITE;
/*!40000 ALTER TABLE `pokemon_equipo` DISABLE KEYS */;
INSERT INTO `pokemon_equipo` VALUES (1,1,0),(2,1,0),(2,1,1),(3,1,0),(3,1,1),(9,1,1),(12,1,1),(13,1,1),(15,1,1),(4,2,1),(5,2,1),(1,3,0),(1,3,1),(2,3,1),(3,3,0),(3,3,1),(1,4,1),(2,4,1),(5,4,1),(7,6,0),(7,6,1),(7,8,1);
/*!40000 ALTER TABLE `pokemon_equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_evolucion`
--

DROP TABLE IF EXISTS `pokemon_evolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_evolucion` (
  `idpokemonpre` int(11) NOT NULL,
  `idevolucion` int(11) NOT NULL,
  `metodo` smallint(6) DEFAULT NULL,
  `detalle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idpokemonpre`,`idevolucion`),
  KEY `idEvolucion_idx` (`idevolucion`),
  CONSTRAINT `idEvolucion` FOREIGN KEY (`idevolucion`) REFERENCES `pokemones` (`idpokemon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPokemonPre` FOREIGN KEY (`idpokemonpre`) REFERENCES `pokemones` (`idpokemon`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_evolucion`
--

LOCK TABLES `pokemon_evolucion` WRITE;
/*!40000 ALTER TABLE `pokemon_evolucion` DISABLE KEYS */;
INSERT INTO `pokemon_evolucion` VALUES (1,2,1,'16'),(2,3,1,'32'),(4,5,1,'16'),(5,6,1,'32'),(7,6,1,'16'),(8,9,1,'32'),(10,11,1,'16'),(11,12,1,'32'),(13,14,1,'16'),(14,15,1,'32'),(16,17,1,'16'),(152,153,1,'16'),(153,154,1,'32'),(155,156,1,'16'),(156,157,1,'32'),(158,159,1,'16'),(159,160,1,'32'),(161,162,1,'16'),(252,253,1,'16'),(253,254,1,'32'),(255,256,1,'16'),(256,257,1,'32'),(258,259,1,'16'),(259,260,1,'32'),(387,388,1,'16'),(388,389,1,'32'),(390,391,1,'16'),(391,392,1,'32'),(393,394,1,'16'),(394,395,1,'32'),(396,397,1,'16'),(397,398,1,'32'),(495,496,1,'16'),(496,497,1,'32'),(498,499,1,'16'),(499,500,1,'32'),(501,502,1,'16'),(502,503,1,'32'),(650,651,1,'16'),(651,652,1,'32'),(653,654,1,'16'),(654,655,1,'32'),(656,657,1,'16'),(657,658,1,'32');
/*!40000 ALTER TABLE `pokemon_evolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_habilidad`
--

DROP TABLE IF EXISTS `pokemon_habilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_habilidad` (
  `idpokemon` int(11) NOT NULL,
  `idhabilidad` int(11) NOT NULL,
  PRIMARY KEY (`idpokemon`,`idhabilidad`),
  KEY `idHabilidad_idx` (`idhabilidad`),
  CONSTRAINT `idHabilidad` FOREIGN KEY (`idhabilidad`) REFERENCES `habilidades` (`idhabilidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPokemon` FOREIGN KEY (`idpokemon`) REFERENCES `pokemones` (`idpokemon`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_habilidad`
--

LOCK TABLES `pokemon_habilidad` WRITE;
/*!40000 ALTER TABLE `pokemon_habilidad` DISABLE KEYS */;
INSERT INTO `pokemon_habilidad` VALUES (1,1),(2,1),(3,1),(4,1),(9,1),(14,1),(154,1),(159,1),(254,1),(259,1),(390,1),(391,1),(396,1),(498,1),(503,1),(655,1),(1,2),(2,2),(3,2),(4,2),(9,2),(15,2),(154,2),(160,2),(254,2),(259,2),(391,2),(397,2),(498,2),(650,2),(655,2),(4,3),(10,3),(15,3),(155,3),(160,3),(254,3),(260,3),(391,3),(397,3),(498,3),(650,3),(655,3),(5,4),(10,4),(16,4),(155,4),(160,4),(255,4),(260,4),(392,4),(397,4),(499,4),(650,4),(656,4),(5,5),(10,5),(16,5),(155,5),(161,5),(255,5),(260,5),(392,5),(398,5),(499,5),(651,5),(656,5),(5,6),(11,6),(16,6),(156,6),(161,6),(255,6),(387,6),(392,6),(398,6),(499,6),(651,6),(656,6),(6,7),(11,7),(17,7),(156,7),(161,7),(256,7),(387,7),(393,7),(398,7),(500,7),(651,7),(657,7),(6,8),(11,8),(17,8),(156,8),(162,8),(256,8),(387,8),(393,8),(495,8),(500,8),(652,8),(657,8),(6,9),(12,9),(17,9),(157,9),(162,9),(256,9),(388,9),(393,9),(495,9),(500,9),(652,9),(658,9),(7,10),(12,10),(152,10),(157,10),(162,10),(257,10),(388,10),(394,10),(495,10),(501,10),(652,10),(658,10),(7,11),(12,11),(152,11),(157,11),(252,11),(257,11),(388,11),(394,11),(496,11),(501,11),(653,11),(658,11),(7,12),(13,12),(152,12),(158,12),(252,12),(257,12),(389,12),(394,12),(496,12),(501,12),(653,12),(8,13),(13,13),(153,13),(158,13),(252,13),(258,13),(389,13),(395,13),(496,13),(502,13),(653,13),(8,14),(13,14),(153,14),(158,14),(253,14),(258,14),(389,14),(395,14),(497,14),(502,14),(654,14),(8,15),(14,15),(153,15),(159,15),(253,15),(258,15),(390,15),(395,15),(497,15),(503,15),(654,15),(9,16),(14,16),(154,16),(159,16),(253,16),(259,16),(390,16),(396,16),(497,16),(503,16),(654,16);
/*!40000 ALTER TABLE `pokemon_habilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_tipo`
--

DROP TABLE IF EXISTS `pokemon_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_tipo` (
  `idpokemon` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`idpokemon`,`idtipo`),
  KEY `idTipo_idx` (`idtipo`),
  CONSTRAINT `idPokemonT` FOREIGN KEY (`idpokemon`) REFERENCES `pokemones` (`idpokemon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idTipoP` FOREIGN KEY (`idtipo`) REFERENCES `tipos` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_tipo`
--

LOCK TABLES `pokemon_tipo` WRITE;
/*!40000 ALTER TABLE `pokemon_tipo` DISABLE KEYS */;
INSERT INTO `pokemon_tipo` VALUES (10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(4,2),(5,2),(6,2),(155,2),(156,2),(157,2),(255,2),(256,2),(257,2),(390,2),(391,2),(392,2),(498,2),(499,2),(500,2),(653,2),(654,2),(655,2),(1,3),(2,3),(3,3),(152,3),(153,3),(154,3),(252,3),(253,3),(254,3),(387,3),(388,3),(389,3),(495,3),(496,3),(497,3),(650,3),(651,3),(652,3),(7,8),(8,8),(9,8),(158,8),(159,8),(160,8),(258,8),(259,8),(260,8),(393,8),(394,8),(395,8),(501,8),(502,8),(503,8),(656,8),(657,8),(658,8),(16,9),(17,9),(396,9),(397,9),(398,9),(161,11),(162,11);
/*!40000 ALTER TABLE `pokemon_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemones`
--

DROP TABLE IF EXISTS `pokemones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemones` (
  `idpokemon` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `altura` varchar(10) NOT NULL,
  `peso` varchar(15) NOT NULL,
  `pesoEN` varchar(45) DEFAULT NULL,
  `radiogeneroM` varchar(50) NOT NULL,
  `hp` int(11) NOT NULL,
  `ataque` int(11) NOT NULL,
  `defensa` int(11) NOT NULL,
  `ataqueEs` int(11) NOT NULL,
  `defensaEs` int(11) NOT NULL,
  `velocidad` int(11) NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL,
  `region` varchar(60) NOT NULL,
  `generacion` varchar(60) NOT NULL,
  `sprite` varchar(60) NOT NULL,
  `alturaEn` varchar(15) NOT NULL,
  `radioGeneroH` varchar(45) NOT NULL,
  PRIMARY KEY (`idpokemon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemones`
--

LOCK TABLES `pokemones` WRITE;
/*!40000 ALTER TABLE `pokemones` DISABLE KEYS */;
INSERT INTO `pokemones` VALUES (1,'Bulbasaur','Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.','0.7m','6.9kg','15.2 lb','50%',45,49,49,65,65,45,47.651968,9.478485,'Kanto','1','img/Bulbasaur.png','2ft 04 in','50%'),(2,'Ivysaur','There is a bud on this Pokémon’s back. To support its weight, Ivysaur’s legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it’s a sign that the bud will bloom into a large flower soon.','1.0m','13,0 kg','28.7 lb','50%',80,82,83,100,100,80,46.97,9.561,'Kanto','1','img/Ivysaur.png','3ft 03 in','50%'),(3,'Venusaur','There is a large flower on Venusaur’s back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower’s aroma soothes the emotions of people.','1.0m','100,0 kg','220.52 lb','50%',60,62,63,80,80,60,48.558,12.132,'Kanto','1','img/Venusaur.png','6ft 07 in','50%'),(4,'Charmander','The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.','0.6m','8.5 kg','18.7 lb ','87.5%',39,52,43,60,50,65,40.123,15.943,'Kanto','1','img/Charmander.png','2 ft 00 in ','12.5%'),(5,'Charmeleon','Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.','1.1m','19.0 kg','41.9 lb ','87.5%',58,64,58,80,65,80,41.243,14.534,'Kanto','1','img/Charmeleon.png','3 ft 07 in ','12.5%'),(6,'Charizard','Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.','1.7m','90.5 kg','199.5 lb ','87.5%',78,84,78,109,86,100,40.948,13.489,'Kanto','1','img/Charizard.png','5 ft 07 in ','12.5% '),(7,'Squirtle','Squirtle’s shell is not merely used for protection. The shell’s rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.','0.5m','9.0 kg','19.8 lb ','87.5%',44,48,65,50,64,43,21.186,-96.205,'Kanto','1','img/Squirtle.png','1 ft 08 in ','12.5%'),(8,'Wartortle','Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this Pokémon’s toughness as a battler.','1.0m','22.5 kg','49.6 lb ','87.5%',59,63,80,65,80,58,21.521,-95.244,'Kanto','1','img/Wartortle.png','3 ft 03 in ','12.5%'),(9,'Blastoise','Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.','1.6m','85.5 kg','188.5 lb ','87.5%',79,83,100,85,105,78,22.435,-96.632,'Kanto','1','img/Blastoise.png','5 ft 03 in ','12.5%'),(10,'Caterpie','Caterpie has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this Pokémon releases a terrifically strong odo','0.3m','2.9 kg','6.4 lb ','50%',45,30,35,20,20,45,-13.964,-57.715,'Kanto','1','img/Caterpie.png','1 ft 00 in ','50%'),(11,'Metapod','The shell covering this Pokémon’s body is as hard as an iron slab. Metapod does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.','0.7m','9.9 kg','21.8 lb ','50%',50,20,55,25,25,30,-13.543,-56.225,'Kanto','1','img/Metapod.png','2 ft 04 in ','50%'),(12,'Butterfree','Butterfree has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.','1.1m','32.0 kg','70.5 lb ','50%',60,45,50,90,80,70,-13.982,-55.831,'Kanto','1','img/Butterfree.png','3 ft 07 in ','50%'),(13,'Weedle','Weedle has an extremely acute sense of smell. It is capable of distinguishing its favorite kinds of leaves from those it dislikes just by sniffing with its big red proboscis (nose).','0.3m','3.2 kg','7.1 lb ','50%',40,35,30,20,20,50,-14.243,-56.432,'Kanto','1','img/Weedle.png','1 ft 00 in ','50%'),(14,'Kakuna','Kakuna remains virtually immobile as it clings to a tree. However, on the inside, it is extremely busy as it prepares for its coming evolution. This is evident from how hot the shell becomes to the touch.','0,6m','10.0 kg','22.0 lb','50%',45,25,50,25,25,35,-14.865,-55.342,'Kanto','1','img/Kakuna.png','2 ft 00 in ','50%'),(15,'Beedrill','Beedrill is extremely territorial. No one should ever approach its nest—this is for their own safety. If angered, they will attack in a furious swarm','1.0m','29.5 kg','65.0 lb ','50%',65,90,40,45,80,75,-13.424,-56.152,'Kanto','1','img/Beedrill.png','3 ft 03 in ','50%'),(16,'Pidgey','Pidgey is a small, plump-bodied avian Pokémon. It is primarily brown with a cream-colored face, underside, and flight feathers. Both its feet and beak are a pinkish-gray color. \n','1.0m','1.8 kg ','4.0 lb','50%',40,45,40,35,35,56,20.355,-63.4,'Kanto','1','img/Pidgey.png','1 ft 00 in ','50%'),(17,'Pidgeotto','Pidgeotto is a raptor-like avian Pokémon. It is covered with brown feathers, and has a cream-colored face and underside. It has a crest of pinkish-red feathers on its head and black, angular markings behind its eyes. ','1.1 m','30.0 kg','66.1lb','50%',63,60,55,50,50,71,-6.017,155.59,'Kanto','1','img/Pidgeotto.png','3 ft 07 in','50%'),(152,'Chikorita','Chikorita is a small, pale green Pokémon with a darker necklace of buds. It has a large head in proportion to the rest of its body with large red eyes that appear to have no pupils. ','0.9 m','6.4 kg ','14.1 lb ','12.5% ',45,49,65,49,65,45,-15.29,82.76,'Johto ','2','img/Chikorita.png','2 ft 11 in ','87.5%'),(153,'Bayleef','Bayleef resembles a pale yellow sauropod dinosaur or a lizard. A large leaf shaped like a scythe protrudes from its head. It has red eyes, and has one large toenail on each of its four feet. ','1.2 m ','15.8 kg ','34.8 lb ','12.5% ',60,62,80,63,80,60,4.68,101.134,'Johto','2','img/Bayleef.png','3 ft 11 in ','87.5%'),(154,'Meganium','Meganium is a pale green, sauropod-like Pokémon with yellow eyes. It has two stamen-like protrusions sprouting from the top of its nose, each tipped with its own anther. ','1.8 m ','100.5 kg ','221.6 lb ','12.5% ',80,82,100,83,100,80,30.75,-40.175,'Johto ','2','img/Meganium.png','5 ft 11 in ','87.5%'),(155,'Cyndaquil ','Cyndaquil is a small, bipedal Pokémon with bluish fur on top of its body, and a milky color on the underside. Cyndaquil seems to be a composite of features from the echidna and the shrew. ','0.5 m ','7.9 kg ','17.4 lb ','12.5% ',39,52,43,60,50,65,-31.04,-28.244,'Johto ','2','img/Cyndaquil.png','1 ft 08 in ','87.5%'),(156,'Quilava ','Quilava is a slim quadruped Pokémon. The top half of Quilava\'s body is blue, while the lower half is cream. Its ears are triangular with red insides, and it possesses a rounded nose and red eyes.','0.9 m ','19.9 kg ','41.9 lb ','12.5% ',58,64,58,58,65,80,47.29,50.98,'Johto ','2','img/Quilava.png','2 ft 11 in ','87.5% '),(157,'Typhlosion','Typhlosion is a badger-like Pokémon with a bulky yet agile body. Typhlosion is classified as a quadruped, but it is capable of bipedal movement and is frequently depicted standing on its hind legs.','1.7 m ','79.5 kg ','173.5 lb ','12.5%',78,84,78,109,85,100,3.55,7.11,'Johto ','2','img/Typhlosion.png','5 ft 11 in ','85.5%'),(158,'Totodile','Totodile resembles a bipedal, blue crocodile with red spines on its back and tail. The spine on its back is larger with additional ridges','0.6 m ','9.5 kg ','20.09 lb ','12.5% ',50,65,64,44,48,43,-62,27.98,'Johto','2','img/Totodile.png','2 ft 00 in ','87.5%'),(159,'Croconaw','Croconaw is a medium-sized, bipedal, crocodilian Pokémon with a blue and yellow body. ','1.1 m ','25.0 kg ','55.1 lb ','12.5%',65,80,80,59,63,58,22.012,-81.21,'Johto','2','img/Croconaw.png','3 ft 07 in ','87.5% '),(160,'Feraligatr','Feraligatr is a bulky, bipedal crocodilian Pokémon that is primarily blue with accents of red and yellow.','2.3 m ','88.8 kg ','195.8 lb ','12.5% ',85,105,100,79,83,78,47.385,-175.86,'Johto','2','img/Feraligatr.png','7 ft 07 in ','87.5%'),(161,'Sentret','Sentret is a small, furry Pokémon with a big round body, stubby arms, and two small feet. Its fur is light brown, and it has a tail with dark brown stripes that it uses to stand on to see if there is danger nearby. ','0.8 m ','6.0 kg ','13.2 lb ','50% ',35,46,34,35,45,20,14.3,137.02,'Johto ','2 ','img/Sentret.png','2 ft 07 in ','50%'),(162,'Furret','Furret is a tan creature that bears a strong resemblance to a ferret. Its most notable feature is its long skinny body, which is used for slipping through the small entrances to its nest and squirm through small spaces to escape foes.','1.8 m ','32.5 kg ','71.6 lb ','50% ',85,76,64,45,55,90,10.32,176.21,'Johto ','2','img/Furret.png','5 ft 11 in ','50%'),(252,'Treecko','Treecko is a small, green, bipedal reptilian Pokémon. It has yellow eyes with long, narrow pupils. ','0.5 m ','5.0 kg ','11.0 lb ','12.5%',40,45,35,65,55,70,-0.013,-0.011,'Hoenn ','3','img/Treecko.png','1 ft 08 in ','87.5%'),(253,'Grovyle','Grovyle is a bipedal Pokémon similar in appearance to a theropod dinosaur. It is primarily green with a red underside. There is a belt-like green stripe across its belly. ','0.9 m ','21.6 kg ','47.6 lb ','12.5% ',50,65,45,85,65,90,55.27,-170.74,'Hoenn','3','img/Grovyle.png','2 ft 11 in ','87.5% '),(254,'Sceptile','Sceptile is a reptilian, bipedal Pokémon. Its neck is somewhat long, and it has two crests on its head. ','1.7 m ','52.2 kg ','115.1 lb ','12.% ',70,85,65,105,85,120,12.12,20.12,'Hoenn','3','img/Sceptile.png','5 ft 11 in ','87.5%'),(255,'Torchic','Torchic is a small, chick Pokémon with stubby, downy, yellow wings. Its body is covered with orange feathers. There is an orange and yellow crest on its head that resembles a flame. ','3','2.5 kg ','5.5 lb ','12.5% ',45,60,40,70,50,45,5.64,-2.64,'Hoenn','3','img/Torchic.png','1 ft 04 in ','87.5%'),(256,'Combusken','Combusken is a bipedal, chicken-like Pokémon. Most of Combusken\'s upper body is yellow, while most of the lower body is orange. An orange, pointed design adorns the center of its waist at the dividing line of the two colors','0.9 m','19.5 kg ','43.0 lb ','12.5% ',60,85,60,85,60,55,-19.522,57.45,'Hoenn ','3','img/Combusken.png','2 ft 11 in ','87.5% '),(257,'Blaziken','Blaziken is a bipedal, chicken-like Pokémon. The majority of Blaziken\'s body is red with accents of beige, yellow, and gray. Behind its head, there are beige, hair-like feathers that continue downward and surround its chest and abdomen. ','1.9 m ','52.0 kg ','114.6 lb ','12.5% ',80,120,70,110,70,80,-29.31,39.12,'Hoenn','3','img/Blaziken.png','6 ft 03 in ','87.5%'),(258,'Mudkip','Mudkip is a small amphibious quadruped Pokémon. It has a blue body with a light-blue underside. ','0.4 m ','7.6 kg ','16.8 lb ','12.5% ',50,70,50,50,50,40,27.08,44.34,'Hoenn','3','img/Mudkip.png','1 ft 04 in ','87.5%'),(259,'Marshtomp','Marshtomp is an amphibious bipedal Pokémon. Its body is primarily light-blue with a lighter shade of blue for its underside and an orange belly','0.7 m ','28.0 kg ','61.7 lb','12.5%',70,85,70,60,70,50,-13.76,31.52,'Hoenn','3','img/Marshtomp.png','2 ft 04 in ','87.5%'),(260,'Swampert','Swampert is a bipedal Pokémon. It has a large cobalt blue body and large three-fingered hands. It has two orange gills that protrude from round patches on its cheeks. ','1.5 m ','81.9 kg ','180.6 lb ','12.5% ',100,110,90,85,90,60,24.142,70.68,'Hoenn','3','img/Swampert.png','4 ft 11 in ','87.5%'),(387,'Turtwig','Turtwig is a small, light green, quadruped Pokémon resembling a turtle or tortoise. Its eyes, feet, and lower jaw are yellow. Its body is covered by a brown shell that is composed of earth. ','0.4 m ','10.2 kg ','22.5 lb ','12.5% ',55,68,64,45,55,31,47.17,21.95,'Sinnoh','4','img/Turtwig.png','1 ft 04 in ','87.5%'),(388,'Grotle','Grotle is a quadruped Pokémon with light green skin and a large shell covering its back.','1.1 m ','97.9 kg ','213.8 lb ','12.5% ',75,89,85,55,65,36,47.29,65.52,'Sinnoh ','4','img/Grotle.png','3 ft 07 in ','87.5%'),(389,'Torterra','Torterra is a bulky quadruped Pokémon resembling a tortoise, with a large shell covering its back. There is a single, oak-like tree and three triangular, stony extensions resembling mountain peaks on the top of the shell. ','2.2 m ','310 kg ','684.3 lb','12.5% ',95,109,105,75,85,56,31.92,-110.67,'Sinnoh','4','img/Torterra.png','7 ft 03 in ','87.5% '),(390,'Chimchar','Chimchar is a bipedal Pokémon resembling a chimpanzee. Its fur is primarily a shade of orange, though its face, outer ears, underbelly, hands, and feet are light yellow.','0.5 m ','6.2 kg ','13.7 lb ','12.5%',44,58,44,58,44,61,7.13,12.52,'Sinnoh','4','img/Chimchar.png','1 ft 08 in ','87.5% '),(391,'Monferno','Monferno is a bipedal, primate-like Pokémon. Orange fur covers most of its body, except for its ears, muzzle, fingers, circular areas on its palms, feet, and chest, which are tan. ','0.9 m ','22.0 kg ','48.5 lb ','12.5%',64,78,52,78,52,81,69.92,80.47,'Sinnoh','4','img/Monferno.png','2 ft 11 in','87.5%'),(392,'Infernape','Infernape is a bipedal, primate-like Pokémon that is primarily reddish-brown with sections of white fur on its chest, head, and lower legs. ','1.2 m','55.0 kg ','121.3 lb','12.5%',76,104,71,104,71,108,7.45,120.03,'Sinnoh','4','img/Infernape.png','3 ft 11 in','87.5%'),(393,'Piplup','Piplup is a light-blue penguin-like Pokémon, which is covered in thick down to insulate against the cold. It has a dark blue head with a primarily white face and a short, yellow beak. ','0.4 m ','5.2 kg ','11.5 lb','12.5%',53,51,53,61,56,40,-7.44,139.08,'Sinnoh','4','img/Piplup.png','1 ft 04 in ','87.5%'),(394,'Prinplup','Prinplup is a blue, penguin-like Pokémon. It is mostly dark blue with light blue facial markings, wing tips, and lower body. Its eyes are blue and it has a short yellow beak with a small point above it.','0.8 m ','23.0 kg ','50.07 lb ','12.5%',64,66,68,81,76,50,-3.84,117.22,'Sinnoh','4','img/Prinplup.png','2 ft 07 in','87.5%'),(395,'Empoleon','Empoleon is a large, navy blue, penguin-like Pokémon. It has a wide, yellow beak with three pointed horns that form a trident-shaped crest and small, blue eyes. ','1.7 m ','84.5 kg ','186.3 lb','12.5%',84,86,88,111,101,60,14.22,19.76,'Sinnoh','4','img/Empoleon.png','5 ft 07 in ','87.5%'),(396,'Starly','Starly is an avian Pokémon with primarily grayish-brown plumage. There is a white marking on its face, resembling a mask, and a white spot on its chest. ','0.3 m ','2.0 kg ','4.4 lb ','50%',40,55,30,30,30,60,28.09,24.68,'Sinnoh ','4','img/Starly.png','1 ft 00 in ','87.5%'),(397,'Staravia','Staravia is a grayish-brown, avian Pokémon with black and white markings. Its head and upper body are primarily black with an \"M\"-shaped pattern over its white chest. ','0.6 m','15.5 kg ','34.2 lb','50%',55,75,50,40,40,80,-14.37,142.89,'Sinnoh','4','img/Staravia.png','2 ft 00 in','50%'),(398,'Staraptor','Staraptor is a grayish-brown, avian Pokémon similar to a large bird of prey. It has small, red eyes and a thin, yellow beak with a black tip','1.2 m ','24.9 kg ','54.2 lb ','50% ',85,120,70,50,50,100,39.6,42.36,'Sinnoh','4','img/Staraptor.png','3 ft 11 in ','50%'),(495,'Snivy','Snivy is a bipedal, reptilian Pokémon with a slender build. Most of its body is green with a cream underside. A yellow stripe runs down the length of its back and tail, and it has yellow markings around its large eyes. ','0.6 m ','8.1 kg ','17.9 lb ','12.5%',45,45,55,45,55,63,-6.67,140.32,'Unova','5','img/Snivy.png','2 ft 00 in','87.5%'),(496,'Servine','Servine is a slim bipedal Pokémon that is primarily green with a cream underside, and narrow red eyes. It has a yellow V-shaped structure that starts at the chest and extends behind the shoulders.','0.8 m ','16 kg ','35.3 lb','12.5%',60,60,75,60,75,83,-31.63,-67.23,'Unova','5','img/Servine.png','2 ft 07 in ','87.5%'),(497,'Serperior','Serperior is a primarily pale green, serpentine Pokémon. Its face and throat are white, while its back is dark green. Curled, mint-colored patterns extend into the white portion of its face','3.3 m ','63.0 kg','138.9 lb','12.5%',75,75,95,75,95,113,17.31,141.32,'Unova','5','img/Serperior.png','10 ft 10 in ','87.5%'),(498,'Tepig','Tepig is a quadruped, pig-like Pokémon that is primarily orange. It has oval eyes, a pink nose, and a thick yellow stripe on its snout. The upper portion of its head is dark brown, and its long, pointed ears are positioned closely together.','0.5 m','9.9 kg','21.8 lb','12.5%',65,63,45,45,45,45,60.76,2.57,'Unova','5','img/Tepig.png','1 ft 08 in','87.5%'),(499,'Pignite','Pignite is a bipedal, pig-like Pokémon. Its chubby body is orange with brown bands around its shoulders, sides, belly, hands, and from the back of its head down its snout.','1.0 m ','55.5 kg ','122.4 lb','12.5%',90,93,55,70,55,55,0.69,45.7,'Unova','5','img/Pignite.png','3 ft 03 in','87.5%'),(500,'Emboar','Emboar are bulky, bipedal Pokémon with pig-like features. It has a red nose, large bushy black eyebrows, and two tusks protruding from its lower jaw. Constantly burning flames cover the front of its neck and shoulders.','1.6 m','150.0 kg ','330.07 lb ','12.5%',110,123,65,100,65,65,29.61,29.34,'Unova','5','img/Emboar.png','5 ft 03 in ','87.5%'),(501,'Oshawott','Oshawott is a bipedal sea otter-like Pokémon. It has a spherical white head with small, triangular dark-blue ears on the sides. Oshawott\'s eyes are dark and its dark orange nose is shaped like a horizontal oval. ','0.5 m','5.9 kg ','13.0 lb ','12.5%',55,55,45,63,45,45,25.84,28.4,'Unova','5','img/Oshawott.png','1 ft 08 in','87.5%'),(502,'Dewott','Dewott is a bipedal, otter-like Pokémon that is primarily light blue. It has small black ears, a pointed crest at the back of its head, a red nose, and long white whiskers forming tilted V-shapes. ','0.8 m ','24.5 ','54.0 lb ','12.5%',75,75,60,83,60,60,23.41,-108.11,'Unova','5','img/Dewott.png','2 ft 07 in ','87.5%'),(503,'Samurott','Samurott is a quadruped, blue, sea lion-like Pokémon. It has two pairs of pointed teeth, one in the upper jaw and one in the lower. ','1.5 m','94.6 kg','108.6 lb ','12.5%',95,100,85,108,70,70,39.29,40.43,'Unova','5','img/Samurott.png','4 ft 11 in ','87.5%'),(650,'Chespin','Chespin is a bipedal, mammalian Pokémon. It has a light brown front with dark brown arms and three triangular markings on its face. There is a tough, green shell covering its back','0.4 m ','9.0 kg','19.8 lb','12.5%',56,61,65,48,45,38,-29.86,141.12,'Kalos','6','img/Chesping.png','1 ft  04 in ','87.5%'),(651,'Quilladin','Quilladin is a bipedal, mammalian Pokémon with some plant-like features. It is largely covered in an armor-like shell similar to that of a chestnut','0.7 m','29.0 kg','63.9 lb','12.5%',61,78,95,56,58,57,-10.63,35.85,'Kalos','6','img/Quilladin.png','2 ft 04 in','87.5%'),(652,'Chesnaught','Chesnaught is a bipedal, mammalian Pokémon with some plant-like features. It possesses a prominent domed, armor-like shell similar to that of a chestnut.','1.6 m ','90.0 kg','198.4 lb ','12.5%',88,107,122,74,75,64,-3.69,-127.42,'Kalos','6','img/Kalos.png','5 ft 03 in','87.5%'),(653,'Fennekin','Fennekin is a quadruped, fox-like Pokémon. It is covered in pale yellow fur that is longer on its haunches. Tufts of dark orange fur cover the insides of its large ears, and it has a white muzzle with longer fur on its cheeks.','0.4 m','9.4 kg ','20.7 lb ','12.5%',40,45,40,62,60,60,17.52,-73.21,'Kalos','6','img/Fennekin.png','1 ft 04 in ','87.5%'),(654,'Braixen','Braixen is a bipedal, fox-like Pokémon. While the majority of its fur is yellow, it has black legs, white arms, face and neck, and a dark orange tail tip.','1.0 m','14.5 kg ','32.0 lb ','12.5%',59,59,58,90,70,73,35.99,140.41,'Kalos','6','img/Braixen.png','3 ft 03 in','87.5%'),(655,'Delphox','Delphox is a relatively tall bipedal Pokémon resembling a fox. It is covered in a coat of fur that resembles a robe; this \"robe\" is primarily dark red, with red-orange, flame-like markings near its knees.','1.5 m','39.0 kg','86.0 lb ','12.5%',75,69,72,114,100,104,-34.7,-67.73,'Kalos ','6','img/Delphox.png','4 ft 11 in','87.5%'),(656,'Froakie','Froakie is a quadruped, frog-like Pokémon. It has light blue skin, white hands, and a dark blue stripe from the center of its oval head to its nose.','0.3 m','7.0 kg','15.4 lb','12.5%',41,56,40,62,44,71,9.81,41.74,'Kalos','6','img/Froakie.png','1 ft 00 in','87.5%'),(657,'Frogadier','Frogadier is a dark blue frog-like Pokémon with a light blue underside. Its eyes have yellow sclera, and it has a white bubble scarf. It has dark blue hands and toes, and white circular fingers','0.6 m ','10.9 kg ','24.0 lb ','12.5%',54,63,52,83,56,97,-23.21,-46.86,'Kalos','6','img/Frogadier.png','2 ft 00 in','87.5%'),(658,'Greninja','Greninja is a large, bipedal, frog-like Pokémon. Its body and legs are dark blue, with single large white bubbles on its legs and arms and white spots over its eyes. ','1.5 m ','40.0 kg','88.2 lb ','12.5%',72,95,67,103,71,122,-14.72,142.76,'Kalos','6','img/Greninja.png','4 ft 11 in','87.5%');
/*!40000 ALTER TABLE `pokemones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos`
--

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` VALUES (1,'bug','img/type/bug.png'),(2,'fire','img/type/fire.png'),(3,'grass','img/type/grass.png'),(4,'ground','img/type/ground.png'),(5,'ice','img/type/ice.png'),(6,'rock','img/type/rock.png'),(7,'steel','img/type/steel.png'),(8,'water','img/type/water.png'),(9,'flying','img/type/flying.png'),(10,'dark','img/type/dark.png'),(11,'normal','img/type/normal.png'),(12,'ghost','img/type/ghost.png'),(13,'electric','img/type/electric.png'),(14,'fairy','img/type/fairy.png'),(15,'psychic','img/type/psychic.png'),(16,'poison','img/type/poison.png'),(17,'fighting','img/type/fighting.png');
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-23 13:38:55
