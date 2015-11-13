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
INSERT INTO `capturados` VALUES (1,1,'Bulbasaur',29,1,2,2,3,3),(1,3,'Bulba',35,2,5,6,2,3),(1,4,'MiMostrrrrooo',22,2,2,6,1,4),(2,1,'Plants',52,1,3,6,3,2),(3,1,'Weed',14,1,5,2,4,5),(3,3,'Venosaur',16,2,5,4,5,5),(9,1,'BigTurtle',17,1,1,1,1,1),(12,1,'NotVenomoth',88,1,1,1,1,1),(13,1,'Pinhead',53,1,1,1,1,1),(15,1,'GreenHornet',45,1,1,1,1,1);
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
INSERT INTO `efectividad_tipo` VALUES (1,1,0),(2,3,1),(2,4,1),(3,2,0),(3,3,0),(3,4,1),(4,6,0),(7,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidades`
--

LOCK TABLES `habilidades` WRITE;
/*!40000 ALTER TABLE `habilidades` DISABLE KEYS */;
INSERT INTO `habilidades` VALUES (1,'Chlorophyll','Boosts the Pokémon\'s Speed stat in sunshine.'),(2,'Overgrow','Powers up Grass-type moves when the Pokémon is in trouble.');
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
INSERT INTO `inventario` VALUES (1,1,6),(3,1,8),(4,1,0),(4,2,0),(4,3,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'chuu','pass','img/chuu.png','chuu24@gmail.com',300,'Jesus Herrera','July/8','Mexico'),(2,'sue','bob','img/sue.png','imsomeonelse@gmail.com',1000,'Susana Gonzalez','March/16','Canada'),(3,'chuu24','pass','img/chuu.png','chuu24@gmail.com',1000,'Chuu Herrera','July/8','Mexico'),(4,'asd','asd','img/chuu.png','asd@asd.com',0,'asd','asd','asd');
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
INSERT INTO `pokemon_ataque` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(1,3),(2,3),(3,3),(1,4),(2,4),(3,4),(1,5),(2,5),(3,5),(1,6),(2,6),(3,6);
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
  CONSTRAINT `team_pokemon` FOREIGN KEY (`idpokemon`) REFERENCES `pokemones` (`idpokemon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `team_entrenador` FOREIGN KEY (`identrenador`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_equipo`
--

LOCK TABLES `pokemon_equipo` WRITE;
/*!40000 ALTER TABLE `pokemon_equipo` DISABLE KEYS */;
INSERT INTO `pokemon_equipo` VALUES (1,1,0),(2,1,0),(2,1,1),(3,1,0),(3,1,1),(9,1,1),(12,1,1),(13,1,1),(15,1,1),(1,3,0),(1,3,1),(3,3,0),(3,3,1);
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
INSERT INTO `pokemon_evolucion` VALUES (1,2,1,'16'),(2,3,1,'32');
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
INSERT INTO `pokemon_habilidad` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2);
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
INSERT INTO `pokemon_tipo` VALUES (1,3),(2,3),(3,3);
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
INSERT INTO `pokemones` VALUES (1,'Bulbasaur','Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.','0.7m','6.9kg','15.2 lb','50%',45,49,49,65,65,45,47.651968,9.478485,'Kanto','1','img/Bulbasaur.png','2ft 04 in','50%'),(2,'Ivysaur','There is a bud on this Pokémon’s back. To support its weight, Ivysaur’s legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it’s a sign that the bud will bloom into a large flower soon.','1.0m','13,0 kg','28.7 lb','50%',80,82,83,100,100,80,46.97,9.561,'Kanto','1','img/Ivysaur.png','3ft 03 in','50%'),(3,'Venusaur','There is a large flower on Venusaur’s back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower’s aroma soothes the emotions of people.','1.0m','100,0 kg','220.52 lb','50%',60,62,63,80,80,60,48.558,12.132,'Kanto','1','img/Venusaur.png','6ft 07 in','50%'),(4,'Charmander','The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.','0.6m','8.5 kg',NULL,'87.5%',39,52,43,60,50,65,40.123,15.943,'Kanto','1','img/Charmander.png','',''),(5,'Charmeleon','Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.','1.1m','19.0 kg',NULL,'87.5%',58,64,58,80,65,80,41.243,14.534,'Kanto','1','img/Charmeleon.png','',''),(6,'Charizard','Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.','1.7m','90.5 kg',NULL,'87.5%',78,84,78,109,86,100,40.948,13.489,'Kanto','1','img/Charizard.png','',''),(7,'Squirtle','Squirtle’s shell is not merely used for protection. The shell’s rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.','0.5m','9.0 kg',NULL,'87.5%',44,48,65,50,64,43,21.186,-96.205,'Kanto','1','img/Squirtle.png','',''),(8,'Wartortle','Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this Pokémon’s toughness as a battler.','1.0m','22.5 kg',NULL,'87.5%',59,63,80,65,80,58,21.521,-95.244,'Kanto','1','img/Wartortle.png','',''),(9,'Blastoise','Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.','1.6m','85.5 kg',NULL,'87.5%',79,83,100,85,105,78,22.435,-96.632,'Kanto','1','img/Blastoise.png','',''),(10,'Caterpie','Caterpie has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this Pokémon releases a terrifically strong odo','0.3m','2.9 kg',NULL,'50%',45,30,35,20,20,45,-13.964,-57.715,'Kanto','1','img/Caterpie.png','',''),(11,'Metapod','The shell covering this Pokémon’s body is as hard as an iron slab. Metapod does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.','0.7m','9.9 kg',NULL,'50%',50,20,55,25,25,30,-13.543,-56.225,'Kanto','1','img/Metapod.png','',''),(12,'Butterfree','Butterfree has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.','1.1m','32.0 kg',NULL,'50%',60,45,50,90,80,70,-13.982,-55.831,'Kanto','1','img/Butterfree.png','',''),(13,'Weedle','Weedle has an extremely acute sense of smell. It is capable of distinguishing its favorite kinds of leaves from those it dislikes just by sniffing with its big red proboscis (nose).','0.3m','3.2 kg',NULL,'50%',40,35,30,20,20,50,-14.243,-56.432,'Kanto','1','img/Weedle.png','',''),(14,'Kakuna','Kakuna remains virtually immobile as it clings to a tree. However, on the inside, it is extremely busy as it prepares for its coming evolution. This is evident from how hot the shell becomes to the touch.','0,6m','10.0 kg',NULL,'50%',45,25,50,25,25,35,-14.865,-55.342,'Kanto','1','img/Kakuna.png','',''),(15,'Beedrill','Beedrill is extremely territorial. No one should ever approach its nest—this is for their own safety. If angered, they will attack in a furious swarm','1.0m','29.5 kg',NULL,'50%',65,90,40,45,80,75,-13.424,-56.152,'Kanto','1','img/Beedrill.png','','');
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

-- Dump completed on 2015-10-27 14:27:16
