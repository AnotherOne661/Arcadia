DROP DATABASE IF EXISTS arcadia;
CREATE DATABASE arcadia;
USE arcadia;
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-02-2025 a las 15:06:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `arcadia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `idAddress` int(11) NOT NULL,
  `comunidad` varchar(150) DEFAULT NULL,
  `municipio` varchar(150) DEFAULT NULL,
  `cp` int(5) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `puerta` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `addresses`
--

INSERT INTO `addresses` (`idAddress`, `comunidad`, `municipio`, `cp`, `calle`, `puerta`) VALUES
(1, '[value-2]', '[value-3]', 0, '[value-5]', '[value-6]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `codExpansion` varchar(100) NOT NULL,
  `nombreProducto` varchar(255) NOT NULL,
  `numCartas` int(11) NOT NULL,
  `idJuego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`codExpansion`, `nombreProducto`, `numCartas`, `idJuego`) VALUES
('ACR', 'Caja de sobres de coleccionista de Más allá del Multiverso: Assassin\'s Creed|Universes Beyond: Assassin\'s Creed Collector Booster Box ', 12, 1),
('ACR', 'Caja de sobres de Más allá del Multiverso: Assassin\'s Creed|Universes Beyond: Assassin\'s Creed Beyond Booster Display ', 24, 1),
('BLB', 'Caja de sobres de coleccionista de Bloomburrow | Bloomburrow Collector Booster Box', 12, 1),
('BLB', 'Caja de sobres de juego de Bloomburrow | Bloomburrow Play Booster Box ', 36, 1),
('DFT', 'Caja de sobres de coleccionista de Aetherdrift | Aetherdrift Collector Booster Box ', 12, 1),
('DFT', 'Caja de sobres de juego de Aetherdrift | Aetherdrift Play Booster Box', 30, 1),
('DSK', 'Caja de sobres de coleccionista de Duskmourn:La casa de los horrores', 12, 1),
('DSK', 'Caja de sobres de juego de Duskmourn:La casa de los horrores', 36, 1),
('DSK', 'Duskmourn:House of Horror: Nightmare Fat Pack Bundle', 6, 1),
('INFO', 'Infinite Forbidden Box', 520, 2),
('INR', 'Caja de sobres de coleccionista de Innistrad remasterizada,Innistrad Remastered Collector Booster Box ', 12, 1),
('INR', 'Caja de sobres de juego de Innistrad remasterizada,Innistrad Remastered Play Booster Box', 36, 1),
('IXL', 'Ixalan Deck', 60, 1),
('KLD', 'Kaladesh Booster Box', 540, 1),
('MH3', 'Caja de sobres de coleccionista de Horizontes de Modern 3|Modern Horizons 3 Collector Booster Box', 12, 1),
('MH3', 'Modern Horizons 3 Booster Box', 540, 1),
('OP08', 'Caja Two Legends Booster Box Case (12x Booster Box) | Two Legends Booster Box Case (12x Booster Box)', 288, 5),
('OP08', 'Caja Two Legends Booster Box|Two Legends Booster Box', 24, 5),
('OP09', 'Emperors in the New World Booster Box', 24, 5),
('OP09', 'Emperors in the New World Booster Box Case (12x Booster Box)', 288, 5),
('OP16', 'Uta Starter Deck', 50, 5),
('OTJ', 'Caja de sobres de coleccionista de Forajidos de Cruce de Truenos|Outlaws of Thunder Junction Collector Booster Box ', 12, 1),
('OTJ', 'Caja de sobres de juego de Forajidos de Cruce de Truenos|Outlaws of Thunder Junction Play Booster Box', 36, 1),
('PIP', 'Universes Beyond: Fallout Collector Booster Box', 12, 1),
('SCR', 'Stellar Crown Booster Box', 540, 3),
('SDWD', 'Blue-Eyes White Destiny Box', 500, 2),
('SSPK', 'Surging Sparks Deck', 60, 3),
('UR', 'Ursula\'s Return Tin', 60, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carta`
--

CREATE TABLE `carta` (
  `codExpansion` varchar(100) NOT NULL,
  `nombreProducto` varchar(255) NOT NULL,
  `idJuego` int(11) NOT NULL,
  `atributos` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carta`
--

INSERT INTO `carta` (`codExpansion`, `nombreProducto`, `idJuego`, `atributos`) VALUES
('ACR', 'Amparo de la oscuridad|Cover of Darkness ', 1, 'hechizo,enchantment,rare,coste:1{NC},1{B}'),
('ACR', 'Asesinato en cadena|Chain Assassination ', 1, 'hechizo,instant,uncommon,coste:2{NC},2{B}'),
('ACR', 'Ataque con sobrecarga|Overpowering Attack ', 1, 'hechizo,sorcery,uncommon,coste:3{NC},2{R}'),
('ACR', 'Base de la Hermandad|Brotherhood Headquarters', 1, 'tierra,uncommon,Agrega{C}'),
('ACR', 'Bosque ACR|Forest ACR', 1, 'tierra,básica,Agrega{G}'),
('ACR', 'Contactos en el mercado negro|Black Market Connections', 1, 'hechizo,enchantment,rare,coste:2{NC},1{B}'),
('ACR', 'Descanse en paz|Rest in Peace', 1, 'hechizo,enchantment,rare,coste:1{NC},1{W}'),
('ACR', 'Edward Kenway|Edward Kenway', 1, 'criatura,legendary,,human assassin pirate,mitico,fuerza:5,resistencia:5,coste:2{NC},1{U},1{B},1{R}'),
('ACR', 'Eivor, Matalobos|Eivor, Wolf-Kissed', 1, 'criatura,legendary,human assassins warrior,mitico,fuerza:7,resistencia:6,coste:3{NC},1{R},1{G},1{W}'),
('ACR', 'El Animus|The Animus', 1, 'artefacto,legendary,rare,coste:2{NC}'),
('ACR', 'Espada de abundancia y escasez|Sword of Feast and Famine', 1, 'artefacto,equipment,mitico,coste:3{NC}'),
('ACR', 'Evie Frye|Evie Frye', 1, 'criatura,legendary,human assassin,rare,fuerza:2,resistencia:1,coste:1{NC},1{U}'),
('ACR', 'Excalibur,espada del Edén|Excalibur,Sword of Eden ', 1, 'artefacto,legendary,equipment,rare,coste:12{NC}'),
('ACR', 'Ezio Auditore da Firenze|Ezio Auditore da Firenze', 1, 'criatura,legendary,human assassin,mitico,fuerza:3,resistencia:2,coste:1{NC},1{B}'),
('ACR', 'Fardo de heno|Haystack ', 1, 'artefacto,uncommon,coste:1{NC},1{W}'),
('ACR', 'Fruto del Edén,reliquia Isu|Apple of Eden,Isu Relic ', 1, 'artefacto,legendary,mitico,coste:4{NC}'),
('ACR', 'Haytham Kenway|Haytham Kenway', 1, 'criatura,legendary,human knight,rare,fuerza:3,resistencia:3,coste:2{NC},1{W},1{U}'),
('ACR', 'Hoja oculta|Hidden Blade ', 1, 'artefacto,equipment,uncommon,coste:2{NC}'),
('ACR', 'Isla ACR| Island ACR', 1, 'tierra,básica,Agrega{U}'),
('ACR', 'Kassandra, portadora del águila|Kassandra, Eagle Bearer', 1, 'criatura,legendary,human assassin warrior,fuerza:2,resistencia:2,coste:1{NC},1{R},1{W}'),
('ACR', 'La lanza de Leónidas|The Spear of Leonidas ', 1, 'artefacto,legendary,equipment,rare,coste:2{NC},1{R}'),
('ACR', 'Latrocinio nimio|Petty Larceny', 1, 'hechizo,sorcery,uncommon,coste:3{NC},1{B}'),
('ACR', 'Leonardo da Vinci|Leonardo da Vinci', 1, 'criatura,legendary,human artificer,mitico,fuerza:3,resistencia:3,coste:2{NC},1{U}'),
('ACR', 'Llanura ACR|Plains ACR', 1, 'tierra,básica,Agrega{W}'),
('ACR', 'Lo que hay que hacer|What Must Be Done ', 1, 'hechizo,sorcery,rare,coste:3{NC},2{W}'),
('ACR', 'Lydia Frye|Lydia Frye', 1, 'criatura,legendary,human assassin,uncommon,fuerza:3,resistencia:2,coste:2{NC}'),
('ACR', 'Montaña ACR|Mountain ACR', 1, 'tierra,básica,Agrega{R}'),
('ACR', 'Pantano ACR|Swamp ACR', 1, 'tierra,básica,Agrega{B}'),
('ACR', 'Piratería costera|Coastal Piracy', 1, 'hechizo,enchantment,uncommon,coste:2{NC},2{U}'),
('ACR', 'Propaganda|Propaganda', 1, 'hechizo,enchantment,uncommon,coste:2{NC},1{U}'),
('ACR', 'Ratonhnhaké:ton|Ratonhnhaké꞉ton ', 1, 'criatura,legendary,human assassin,rare,fuerza:3,resistencia:3,coste:1{W},1{U},1{B}'),
('ACR', 'Ser anónimo|Become Anonymous', 1, 'hechizo,instant,uncommon,coste:2{NC},2{U}'),
('ACR', 'Sócrates,profesor ateniense|Sokrates,Athenian Teacher ', 1, 'criatura,legendary,human advisor,rare,fuerza:0,resistencia:4,coste:1{NC},1{W},1{U}'),
('ACR', 'Terminar|Terminate', 1, 'hechizo,instant,uncommon,coste:1{B},1{R}'),
('ACR', 'Transgresión temporal|Temporal Trespass', 1, 'hechizo,sorcery,mitico,coste:8{NC},3{U}'),
('ACR', 'Trofeo de la asesina|Assassin\'s Trophy', 1, 'hechizo,instant,rare,coste:1{B},1{G}'),
('ACR', 'Vista de águila|Eagle Vision ', 1, 'hechizo,sorcery,uncommon,coste:4{NC},1{U}'),
('ACR', 'Yggdrasil,artefacto del renacer|Yggdrasil,Rebirth Engine ', 1, 'artefacto,legendary,mitico,coste:3{NC}'),
('ALP', 'Loto Negro |Black Lotus ', 1, 'artefacto,rare,coste:0'),
('ANE', 'Monkey.D.Luffy (OP05-119) (V.1)', 5, 'personaje,don:10,poder:120000'),
('BLB', 'Beza, la Primavera Prometida | Beza, the Bounding Spring', 1, 'criatura,legendaria,elemental elk,mítica,fuerza:4,resistencia:5,coste:2{NC},2{W}'),
('BLB', 'Caer|Fell ', 1, 'hechizo,sorcery,uncommon,coste:1{NC},1{B}'),
('BLB', 'Campana de Puerto Fontanal|Fountainport Bell', 1, 'artefacto,common,coste:1{NC}'),
('BLB', 'Cangrejo arremolinante|Eddymurk Crab ', 1, 'criatura,uncommon,elemental crab,resistencia:5,fuerza:5,coste:5{NC},2{U}'),
('BLB', 'Clériga de la vista estelar|Starscape Cleric ', 1, 'criatura,uncommon,bat cleric,resistencia:1,fuerza:1,coste:1{NC},1{B}'),
('BLB', 'En las garras del sueño|Kitnap', 1, 'hechizo,enchantment,aura,rare,coste:2{NC},2{U}'),
('BLB', 'Epopeya heredada|Heirloom Epic ', 1, 'artefacto,uncommon,coste:1{NC}'),
('BLB', 'Espada de forja estelar|Starforged Sword ', 1, 'artefacto,equipment,uncommon,coste:4{NC}'),
('BLB', 'Festival de las Ascuas|Festival of Embers', 1, 'hechizo,enchantment,rare,coste:4{NC},1{R}'),
('BLB', 'Formación de la Patarcela|Pawpatch Formation', 1, 'hechizo,instant,uncommon,coste:1{NC},1{G}'),
('BLB', 'Guerrera de la flamánima | Emberheart Challenger', 1, 'criatura,mouse warrior,rare,fuerza:2,resistencia:2,coste:1{NC},1{R}'),
('BLB', 'Hacia las fauces inundadas|Into the Flood Maw ', 1, 'hechizo,instant,uncommon,coste:1{U}'),
('BLB', 'Héroe de la llama del corazón|Heartfire Hero ', 1, 'criatura,uncommon,mouse soldier,resistencia:1,fuerza:1,coste:1{R}'),
('BLB', 'Invocación estelar|Starfall Invocation', 1, 'hechizo,sorcery,rare,coste:3{NC},2{W}'),
('BLB', 'Llenar la despensa|Stocking the Pantry', 1, 'hechizo,enchantment,uncommon,coste:1{G}'),
('BLB', 'Lumra, Bramido del Bosque | Lumra, Bellow of the Woods', 1, 'criatura,legendaria,elemental bear,mítico,fuerza:*,resistencia:*,coste:4{NC},2{G}'),
('BLB', 'Luz de destierro|Banishing Light', 1, 'hechizo,enchantment,common,coste:2{NC},1{W}'),
('BLB', 'Maha, Plumas de la Noche | Maha, Its Feathers Night ', 1, 'criatura,legendaria,elemental bird,mítica,fuerza:6,resistencia:5,coste:3{NC},2{B}'),
('BLB', 'Monolito amenazador|Sinister Monolith ', 1, 'artefacto,uncommon,coste:3{NC},1{B}'),
('BLB', 'Patas a la obra|Hop to It', 1, 'hechizo,sorcery,uncommon,coste:2{NC},1{W}'),
('BLB', 'Poder de los mansos|Might of the Meek ', 1, 'hechizo,instant,common,coste:1{R}'),
('BLB', 'Por el bien común|For the Common Good ', 1, 'hechizo,sorcery,rare,coste:2{X},1{G}'),
('BLB', 'Portal acuático|Splash Portal ', 1, 'hechizo,sorcery,uncommon,coste:1{U}'),
('BLB', 'Pozo de los deseos|Wishing Well', 1, 'artefacto,rare,coste:3{NC},1{U}'),
('BLB', 'Racha de regalo|Parting Gust', 1, 'hechizo,instant,uncommon,coste:2{W}'),
('BLB', 'Recluta de la Patarcela|Pawpatch Recruit', 1, 'criatura,rare,rabbit warrior,fuerza:2,resistencia:1,coste:1{G}'),
('BLB', 'Sinsonte|Mockingbird', 1, 'criatura,rare,bird bard,resistencia:1,fuerza:1,coste:1{X},1{U}'),
('BLB', 'Sobreproteger|Overprotect', 1, 'hechizo,instant,uncommon,coste:1{NC},1{G}'),
('BLB', 'Talento: herrería|Blacksmith\'s Talent', 1, 'hechizo,enchantment,class,uncommon,coste:1{R}'),
('BLB', 'Víbora de boca pútrida | Rottenmouth Viper ', 1, 'criatura,elemental snake,mítico,fuerza:6,resistencia:6,coste:5{NC},1{B}'),
('BLB', 'Ygra, devoratodo | Ygra, Eater of All ', 1, 'criatura.legendaria,elemental cat,mítico,fuerza:6,resistencia:6,coste:3{NC},1{B},1{G}'),
('CLC', 'Charizard|Charizard', 3, 'pokemon,tipo:fuego,hp:120,weakness{2},resistance{-30},retreat{3}.'),
('CLC', 'Charmander|Charmander', 3, 'pokemon,tipo:fuego,hp:50,weakness{2},retreat{1}'),
('CLC', 'Charmeleon|Charmeleon', 3, 'pokemon,tipo:fuego,hp:80,weakness{2},retreat{1}'),
('CLC', 'Clefable|Clefable', 3, 'pokemon,tipo:hada,hp:70,weakness{2},retreat{2}'),
('CLC', 'Clefairy|Clefairy', 3, 'pokemon,tipo:normal,hp:40,weakness{2},retreat{1}'),
('CLC', 'Electrode|Electrode', 3, 'pokemon,tipo:electrico,hp:80,weakness{2},retreat{1}'),
('CLC', 'Ho-Oh ex|Ho-Oh ex', 3, 'pokemon,tipo:fuego,hp:220,weakness{2},retreat{2}'),
('CLC', 'Magmar|Magmar', 3, 'pokemon,tipo:fuego,hp:70,weakness{2},retreat{1}'),
('CLC', 'Pikachu|Pikachu', 3, 'pokemon,tipo:normal,hp:40,weakness{2},retreat{1}'),
('CLC', 'Ponyta|Ponyta', 3, 'pokemon,tipo:fuego,hp:60,weakness{2},retreat{1}'),
('CLC', 'Raichu|Raichu', 3, 'pokemon,tipo:electrico,hp:130,weakness{2},retreat{1}'),
('CLC', 'Rapidash|Rapidash', 3, 'pokemon,tipo:fuego,hp:100,weakness{2},retreat{1}'),
('CLC', 'Voltorb|Voltorb', 3, 'pokemon,tipo:electrico,hp:40,weakness{2},retreat{1}'),
('CLC', 'Zapdos|Zapdos', 3, 'pokemon,tipo:electrico,hp:120,weakness{2},retreat{1}'),
('DFT', ' |Bleachbone Verge', 1, 'tierra,rare,B,W.'),
('DFT', ' |Boommobile', 1, 'artefacto,vehiculo,fuerza:5,resistencia:5,coste:2{NC},2{R}'),
('DFT', ' |Chandra, Spark Hunter', 1, 'legendary planeswalker,chandra,mítica,coste:3{NC},1{R}'),
('DFT', ' |Cursecloth Wrappings', 1, 'artefacto,coste:2{NC},2{B}'),
('DFT', ' |Defend the Rider ', 1, 'hechizo,instant,uncommon,coste:1{G}'),
('DFT', ' |Ketramose, the New Dawn', 1, 'criatura,legendaria,mítico,Dios,fuerza:4,resistencia:4,coste:1{NC},1{W},1{B}'),
('DFT', ' |Kolodin,Triumph Caster', 1, 'criatura,legendaria,rare,piloto humano,fuerza:2,resistencia:3,coste:1{R},1{W}'),
('DFT', ' |Lifecraft Engine', 1, 'artefacto,vehiculo,rare,fuerza:4,resistencia:4,coste:3{NC}'),
('DFT', ' |Mindspring Merfolk', 1, 'criatura,merfolk wizard,rare,resistencia:1,fuerza:1,coste:1{U}'),
('DFT', ' |Momentum Breaker', 1, 'hechizo,enchantment,coste:1{NC},1{B}'),
('DFT', ' |Possession Engine', 1, 'artefacto,vehiculo,rare,fuerza:5,resistencia:5,coste:3{NC},2{U}'),
('DFT', ' |Redshift,Rocketeer Chief ', 1, 'criatura,legendaria,duende piloto,rare,fuerza:2,resistencia:3,coste:1{R},1{G}'),
('DFT', ' |Riverpyre Verge', 1, 'tierra,R,U.'),
('DFT', ' |Sab-Sunen,Luxa Embodied', 1, 'criatura,legendaria,Dios,fuerza:6,resistenica:6,coste:3{NC},1{G},1{U}'),
('DFT', ' |Sunbillow Verge', 1, 'tierra,rare,W,R.'),
('DFT', ' |Thunderous Velocipede', 1, 'artefacto,vehiculo,fuerza:5,resistencia:5,coste:1{NC},2{G}'),
('DFT', ' |Vnwxt,Verbose Host', 1, 'criatura,legendaria,rare,homunculus,fuerza:0,resistencia:4,coste:1{NC},1{U}'),
('DFT', ' |Willowrush Verge', 1, 'tierra,rare,U,G.'),
('DFT', ' |Winter,Cursed Rider', 1, 'criatura,legendaria,human warlock,rare,fuerza:3,resistencia:2,coste:2{U},1{B}'),
('DSK', 'Armadura etérea|Ethereal Armor ', 1, 'hechizo,encantamiento,aura,uncommon,coste:1{W}'),
('DSK', 'Aspiradora de fantasmas|Ghost Vacuum ', 1, 'artefacto,rare,coste:1{NC}'),
('DSK', 'Avería inoportuna|Untimely Malfunction ', 1, 'hechizo,instant,uncommon,coste:1{NC},1{R}'),
('DSK', 'Bosques sangrantes|Bleeding Woods', 1, 'tierra,common'),
('DSK', 'Brillolinterna|Glimmerlight', 1, 'artefacto,equipamiento,common,coste:2{NC}'),
('DSK', 'Campamento abandonado|Abandoned Campground', 1, 'tierra,common'),
('DSK', 'Cercenador cabezagujas|Razorkin Needlehead', 1, 'criatura,humano asesino,rare,fuerza:2,resistencia:2,coste:2{R}'),
('DSK', 'Consejo demoníaco|Demonic Counsel', 1, 'hechizo,sorcery,rare,coste:1{NC},1{B}'),
('DSK', 'Detonación ígnea|Pyroclasm', 1, 'hechizo,sorcery,uncommon,coste:1{NC},1{R}'),
('DSK', 'Línea mística de la esperanza|Leyline of Hope ', 1, 'hechizo,encantamiento,rare,coste:2{NC},2{W}'),
('DSK', 'Línea mística de la resonancia|Leyline of Resonance ', 1, 'hechizo,encantamiento,rare,coste:2{NC},2{R}'),
('DSK', 'Llaves de la Casa|Keys to the House ', 1, 'artefacto,uncommon,coste:1{NC}'),
('DSK', 'Maizal grabado|Etched Cornfield', 1, 'tierra,common'),
('DSK', 'Némesis de los gritos|Screaming Nemesis ', 1, 'criatura,espiritu,mítico,fuerza:3,resistencia:3,coste:2{NC},1{R}'),
('DSK', 'Ojo aberrante|Abhorrent Oculus ', 1, 'criatura,ojo,mítico,fuerza:5,resistencia:5,coste:2{NC},1{U}'),
('DSK', 'Pantalla poseída|Haunted Screen', 1, 'artefacto,uncommon,coste:3{NC}'),
('DSK', 'Protegido por fantasmas|Sheltered by Ghosts', 1, 'criatura,Soldado Vampiro, uncommon,fuerza:1,resistencia:1,coste:1{NC}1{W}'),
('DSK', 'Separarse|Split Up ', 1, 'hechizo,sorcery,rare,coste:1{NC},2{W}'),
('DSK', 'Sierra|Saw ', 1, 'artefacto,uncommon,coste:2{NC}'),
('DSK', 'Tergiversar la realidad|Twist Reality', 1, 'hechizo,instant,common,coste:1{NC},2{U}'),
('DSK', 'Tormento agotador|Withering Torment ', 1, 'hechizo,instant,uncommon,coste:2{NC},1{B}'),
('DSK', 'Umbral de Cenagalardiente|Blazemire Verge ', 1, 'tierra,mítico'),
('DSK', 'Umbral de Lagosombrío|Gloomlake Verge', 1, 'tierra,mítico'),
('DSK', 'Valgavoth el Devoraterrores|Valgavoth Terror Eater', 1, 'criatura legendaria,elder demon,mítico,fuerza:9,resistencia:9,coste:6{NC},3{B}'),
('INFO', 'Dragón Tenpai Genroku,Tenpai Dragon Genroku', 2, 'criatura,dragon efecto,ultra rare,nivel:3,ataque:0,defensa:1000'),
('INFO', 'Forbidden One', 2, 'Mythic, Forbidden'),
('INR', 'Almas persistentes|Lingering Souls ', 1, 'hechizo,sorcery,uncommon,coste:2{NC},1{W}'),
('INR', 'Artista de la sangre|Blood Artist', 1, 'criatura,vampiro,fuerza:0,resistencia:1,coste:1{NC},1{B}'),
('INR', 'Atravesando la brecha|Through the Breach ', 1, 'hechizo,instant,arcane,mítico,coste:4{NC},1{R}'),
('INR', 'Bosque INR|Forest INR', 1, 'tierra básica,G'),
('INR', 'Carácter ardiente|Fiery Temper ', 1, 'hechizo,instant,uncommon,coste:1{NC},2{R}'),
('INR', 'Cazahechizos|Spell Queller ', 1, 'criatura,spirit,rare,fuerza:2,resistencia:3,coste:1{NC},1{W},1{U}'),
('INR', 'Cota de malla demoníaca|Demonmail Hauberk', 1, 'artefacto,equipment,coste:4{NC}'),
('INR', 'Desove arácnido| Spider Spawning ', 1, 'hechizo,sorcery,uncommon,coste:4{NC},1{G}'),
('INR', 'Edgar Markov', 1, 'criatura legendaria,vampire knight,mítico,fuerza:4,resistencia:4,coste:3{NC},1{R},1{W},1{B}'),
('INR', 'Emrakul el Final Prometido|Emrakul the Promised End', 1, 'criatura legendaria,eldrazi,mítico,fuerza:13,resistencia:13,coste:13{NC}'),
('INR', 'Extractor de almas|Soul Separator', 1, 'artefacto,uncommon,coste:3{NC}'),
('INR', 'Flujo de esencia|Essence Flux', 1, 'hechizo,instant,common,coste:1{U}'),
('INR', 'Histeria masiva| Mass Hysteria', 1, 'hechizo,enchantment,rare,coste:1{R}'),
('INR', 'Injerto de suturador|Stitcher\'s Graf', 1, 'artefacto,equipment,rare,coste:1{NC}'),
('INR', 'Isla INR|Island INR', 1, 'tierra báscia,U'),
('INR', 'Llanura INR|Plains INR', 1, 'tierra básica,W'),
('INR', 'Montaña INR| Mountain INR', 1, 'tierra básica,R'),
('INR', 'Mutación espontánea|Spontaneous Mutation ', 1, 'hechizo,enchantment,aura,common,coste:1{U}'),
('INR', 'Navegante certero|Deadeye Navigator', 1, 'criatura,spirit,rare,fuerza:5,resistencia:5,coste:4{NC},2{U}'),
('INR', 'Pantano INR|Swamp INR', 1, 'tierra básica,B'),
('INR', 'Pulsión asesina|Murderous Compulsion ', 1, 'hechizo,sorcery,common,coste:1{NC},1{B}'),
('INR', 'Reforjar el alma|Reforge the Soul ', 1, 'hechizo,sorcery,rare,coste:3{NC},2{R}'),
('INR', 'Ritos de pueblo|Village Rites ', 1, 'hechizo,instant,common,coste:1{B}'),
('INR', 'Tentación mortal|Deadly Allure', 1, 'hechizo,sorcery,uncommon,coste:1{B}'),
('INR', 'Trampa luzgeist|Geistlight Snare ', 1, 'hechizo,instant,uncommon,coste:2{NC},1{U}'),
('INR', 'Triscaidecafobia|Triskaidekaphobia', 1, 'hechizo,enchantment,uncommon,coste;3{NC},1{B}'),
('INR', 'Tumba del ángel|Angel\'s Tomb', 1, 'artefacto,uncommon,coste:3{NC}'),
('INR', 'Ventana entablada|Boarded Window', 1, 'artefacto,uncommon,coste:3{NC}'),
('INR', 'Virtud intangible|Intangible Virtue', 1, 'hechizo,enchantment,uncommon,coste:1{NC},1{W}'),
('IXL', 'Ixalan Mythic Card', 1, 'Dinosaur, Mythic'),
('J25', 'Abrazo de Serra|Serra\'s Embrace', 1, 'hechizo,enchantment,aura,uncommon,coste:2{NC},2{W}'),
('J25', 'Aphelia encantadora de víboras|Aphelia  Viper Whisperer ', 1, 'criatura legendaria,gorgon assassin,mítico,fuerza:1,resistencia:3,coste:1{NC},1{B}'),
('J25', 'Arranque violento|Violent Outburst ', 1, 'hechizo,common,instant,coste;1{NC},1{R},1{G}'),
('J25', 'Bosque J25|Forest J25', 1, 'tierra básica'),
('J25', 'Cachorro generoso|Generous Pup ', 1, 'criatura,dog,rare,fuerza:2,resistencia:2,coste:1{NC},1{W}'),
('J25', 'Chupasangre insidioso|Creeping Bloodsucker ', 1, 'criatura,common,vampiro,fuerza:1,resistencia:2,coste:1{NC},1{B}'),
('J25', 'Cólera ancestral|Ancestral Anger', 1, 'hechizo,sorcery,common,coste:1{R}'),
('J25', 'Concentrarse|Concentrate', 1, 'hechizo,sorcery,uncommon,coste:2{NC},2{U}'),
('J25', 'Crecimiento exuberante|Rampant Growth ', 1, 'hechizo,sorcery,common,coste:1{NC},1{G}'),
('J25', 'Cría de felinoguadaña|Scythecat Cub ', 1, 'criatura,gato,rare,fuerza:2,resistencia:2,coste:1{NC},1{G}'),
('J25', 'Escupefuego|Fireshrieker ', 1, 'artefacto,equipment,uncommon,coste:3{NC}'),
('J25', 'Esperanza en extinción|Fading Hope ', 1, 'hechizo,instant,uncommon,coste:1{U}'),
('J25', 'Evereth virreina del saqueo|Evereth Viceroy of Plunder', 1, 'criatura legendaria,vampire soldier,rare,fuerza:2,resistencia:2,coste:2{NC},1{B}'),
('J25', 'Fabricaingenios|Whirlermaker', 1, 'artefacto,uncommon,coste:3{NC}'),
('J25', 'Golpe a la garganta|Go for the Throat ', 1, 'hechizo,instant,coste:1{NC},1{B}'),
('J25', 'Herramientas de ladrón|Thieves\' Tools ', 1, 'artefacto,equipamiento,common,coste:1{NC},1{B}'),
('J25', 'Isla J25| Island J25', 1, 'tierra básica'),
('J25', 'Jugar con fuego|Play with Fire ', 1, 'hechizo,instant,coste:1{R}'),
('J25', 'Kodama del árbol del oeste| Kodama of the West Tree', 1, 'criatura legendaria,spirit ,mítico,fuerza:3,resistencia:3,coste:2{NC},1{G}'),
('J25', 'Llamas de la instigadora|Flames of the Firebrand ', 1, 'hechizo,sorcery,uncommon,coste:2{NC},1{R}'),
('J25', 'Maza del valiente|Mace of the Valiant', 1, 'artefacto,equipamiento,rare,coste;2{NC},1{W}'),
('J25', 'Montaña J25|Mountain J25', 1, 'tierra básica'),
('J25', 'Pantano J25|Swamp J25', 1, 'tierra básica'),
('J25', 'Parcela fúngica,Fungal Plots ', 1, 'hechizo,enchantment,uncommon,coste:1{NC},1{G}'),
('J25', 'Rastro de migajas|Trail of Crumbs ', 1, 'hechizo,enchantment,uncommon,coste:1{NC},1{G}'),
('J25', 'Recuerdo del Starnheim|Starnheim Memento ', 1, 'artefacto,uncommon,coste:3{NC}'),
('J25', 'Reenviar|Remand ', 1, 'hechizo,instant,uncommon,coste:1{NC},1{U}'),
('J25', 'Retirada a Kazandu|Retreat to Kazandu ', 1, 'hechizo,enchantment,uncommon,coste:2{NC},1{G}'),
('J25', 'Rev sacadiezmos|Rev Tithe Extractor ', 1, 'criatura legendaria,human rogue,rare,fuerza:3,resistencia:3,coste:3{NC},1{B}'),
('J25', 'Secuestrado por las hadas|Stolen by the Fae ', 1, 'hechizo,sorcery,rare,coste:X,2{U}'),
('J25', 'Tormento de escarabajos|Torment of Scarabs', 1, 'hechizo,enchantment,aura curse,coste:3{NC},1{B}'),
('J25', 'Valkiria justa|Righteous Valkyrie', 1, 'criatura,rare,angel cleric,fuerza:2,resistencia:4,coste:2{NC},1{W}'),
('J25', 'Verdiguardián anciano|Ancient Greenwarden ', 1, 'criatura,elemental,mítico,fuerza:5,resistencia:7,coste;4{NC},2{G}'),
('KLD', 'Kaladesh Rare Card', 1, 'Artifact, Rare'),
('MH3', 'Arena de la gloria|Arena of Glory ', 1, 'tierra,rare,Agrega{R}'),
('MH3', 'Bosque MH3|Forest MH3', 1, 'tierra,básica,Agrega{G}'),
('MH3', 'Camino de la aniquilación|Path of Annihilation', 1, 'hechizo,enchantment,uncommon,coste:3{NC},1{G}'),
('MH3', 'Diluvio tóxico|Toxic Deluge ', 1, 'hechizo,sorcery,rare,coste:2{NC},1{B}'),
('MH3', 'Estallido de cultivo|Flare of Cultivation ', 1, 'hechizo,sorcery,rare,coste:1{NC},2{G}'),
('MH3', 'Estallido de maldad|Flare of Malice ', 1, 'hechizo,instant,rare,coste:2{NC},2{B}'),
('MH3', 'Estallido de negación|Flare of Denial', 1, 'hechizo,instant,rare,coste:1{NC},2{U}'),
('MH3', 'Estribaciones boscosas|Wooded Foothills', 1, 'tierra,rare'),
('MH3', 'Felia, pastora jovial|Exuberant Shepherd ', 1, 'criatura,legendary,dog,rare,fuerza:2,resistencia:2,coste:1{NC},1{W}'),
('MH3', 'Fénix del detective|Detective\'s Phoenix ', 1, 'criatura,enchantment,rare,phoenix,fuerza:2,resistencia:2,coste:2{NC},1{R}'),
('MH3', 'Flauta disruptora|Disruptor Flute ', 1, 'artefacto,rare,coste:2{NC}'),
('MH3', 'Incubador de Urza|Urza\'s Incubator', 1, 'artefacto,rare,coste:3{NC}'),
('MH3', 'Ira de los cielos|Wrath of the Skies', 1, 'hechizo,sorcery,rare,coste:1{X},2{W}'),
('MH3', 'Isla MH3|Island MH3', 1, 'tierra,básica,Agrega{U}'),
('MH3', 'Kaalia de la Vastedad|Kaalia of the Vast ', 1, 'criatura,legendary,human cleric,mitico,fuerza:2,resistencia:2,coste:1{NC},1{R},1{W},1{B}'),
('MH3', 'Kozilek, la Realidad Rota|Kozilek, the Broken Reality', 1, 'criatura,legendary,eldrazi,mitico,fuerza:9,resistencia:9,coste:9{NC}'),
('MH3', 'Laberinto de Ugin|Ugin\'s Labyrinth', 1, 'tierra,mitico,Agrega{C}'),
('MH3', 'Llanura MH3|Plains MH3', 1, 'tierra,básica,Agrega{W}'),
('MH3', 'Manada de ocelotes|Ocelot Pride', 1, 'criatura,cat,mitico,fuerza:1,resistencia:1,coste:1{W}'),
('MH3', 'Medallón de esmeralda|Emerald Medallion', 1, 'artefacto,rare,coste:2{NC}'),
('MH3', 'Medallón de rubíes|Ruby Medallion', 1, 'artefacto,rare,coste:2{NC}'),
('MH3', 'Medallón de zafiros|Sapphire Medallion', 1, 'artefacto,rare,coste:2{NC}'),
('MH3', 'Montaña MH3|Mountain MH3', 1, 'tierra,básica,Agrega{R}'),
('MH3', 'Mortigoyf|Nethergoyf ', 1, 'criatura,lhurgoyf,mitico,fuerza:*,resistencia:1+*,coste:1{B}'),
('MH3', 'Nadu, Sabiduría Alada|Nadu, Winged Wisdom', 1, 'criatura,legendary,bird wizard,rare,fuerza:3,resistencia:4,coste:1{NC},1{G},1{U}'),
('MH3', 'Ondas de muerte viviente|Ripples of Undeath ', 1, 'hechizo,enchantment,rare,coste:1{NC},1{B}'),
('MH3', 'Pantano MH3|Swamp MH3', 1, 'tierra,básica,Agrega{B}'),
('MH3', 'Pesadilla ctónica|Chthonian Nightmare', 1, 'hechizo,enchantment,rare,coste:1{NC},1{B}'),
('MH3', 'Phlage,titán de la furia del fuego|Phlage,Titan of Fire\'s Fury ', 1, 'criatura,legendary,elder giant,mitico,fuerza:6,resistencia:6,coste:1{NC},1{R},1{W}'),
('MH3', 'Playa anegada|Flooded Strand', 1, 'tierra,rare'),
('MH3', 'Protector silvestre|Sylvan Safekeeper', 1, 'criatura,human wizard,rare,fuerza:1,resistencia:1,coste:1{G}'),
('MH3', 'Reclusión de Ugin|Ugin\'s Binding ', 1, 'hechizo,instant,mitico,coste:2{NC},1{U}'),
('MH3', 'Relegar a la memoria|Consign to Memory', 1, 'hechizo,instant,uncommon,coste:1{U}'),
('MH3', 'Ritual de nacimiento|Birthing Ritual ', 1, 'hechizo,enchantment,mitico,coste:1{NC},1{G}'),
('MH3', 'Rueda del potencial|Wheel of Potential', 1, 'hechizo,sorcery,rare,coste:2{NC},1{R}'),
('MH3', 'Seis|Six', 1, 'criatura,legendary,treefolk,rare,fuerza:2,resistencia:4,coste:2{NC},2{G}'),
('MH3', 'Serenata del strix|Strix Serenade', 1, 'hechizo,instant,rare,coste:1{U}'),
('MH3', 'Sombra del Segundo Sol|Shadow of the Second Sun', 1, 'hechizo,enchantment,aura,mitico,coste:4{NC},2{U}'),
('MH3', 'Torre pirexiana|Phyrexian Tower', 1, 'tierra,legendary,Agrega{C}'),
('MH3', 'Ulamog, el Profanador|Ulamog, the Defiler ', 1, 'criatura,legendary,eldrazi,mitico,fuerza:7,resistencia:7,coste:10{NC}'),
('MH3', 'Vislumbrar lo imposible|Glimpse the Impossible ', 1, 'hechizo,sorcery,common,coste:2{NC},1{R}'),
('OP08', 'Charlotte Linlin OP08|Charlotte Linlin OP08', 5, 'personaje,don:9,poder:9000'),
('OP08', 'Charlotte Pudding OP08|Charlotte Pudding OP08', 5, 'personaje,don:3,poder:4000'),
('OP08', 'Edward Newgate OP08|Edward Newgate OP08', 5, 'personaje,don:10,poder:12000'),
('OP08', 'Kaido OP08|Kaido OP08', 5, 'personaje,don:9,poder:9000'),
('OP08', 'Nami OP08| Nami OP08', 5, 'personaje,don:5,poder:5000'),
('OP08', 'Pedro OP08|Pedro OP08', 5, 'personaje,don:4,poder:5000'),
('OP08', 'Portgas.D.Ace OP08|Portgas.D.Ace OP08', 5, 'personaje,don:5,poder:6000'),
('OP09', 'Black Hole|Black Hole', 5, 'evento,don:4'),
('OP09', 'Boa Hancock|Boa Hancock', 5, 'personaje,don:6,poder:8000'),
('OP09', 'Brook|Brook', 5, 'personaje,don:5,poder:6000'),
('OP09', 'Buggy|Buggy', 5, 'personaje,don:10,poder:12000'),
('OP09', 'Crocodile|Crocodile', 5, 'personaje,don:7,poder:7000'),
('OP09', 'Cross Guild |Cross Guild', 5, 'evento,don:1'),
('OP09', 'Dereshi!|Dereshi!', 5, 'evento,don:3'),
('OP09', 'Dracule Mihawk|Dracule Mihawk', 5, 'personaje,don:6,poder:7000'),
('OP09', 'Franky|Franky', 5, 'personaje,don:4,poder:5000'),
('OP09', 'Fullalead|Fullalead', 5, 'escenario,don:1'),
('OP09', 'Gol.D.Roger|Gol.D.Roger', 5, 'personaje,don:10,poder:13000'),
('OP09', 'Gum-Gum Giant|Gum-Gum Giant', 5, 'evento,don:1'),
('OP09', 'Jesus Burgess|Jesus Burgess', 5, 'personaje,don:4,poder:5000'),
('OP09', 'Jinbe|Jinbe', 5, 'personaje,don:7,poder:9000'),
('OP09', 'Marco|Marco', 5, 'personaje,don:3,poder:5000'),
('OP09', 'Marshall.D.Teach|Marshall.D.Teach', 5, 'personaje,don:10,poder:12000'),
('OP09', 'Mr.3(Galdino)|Mr.3(Galdino)', 5, 'personaje,don:1,poder:2000'),
('OP09', 'My Era...Begins!!|My Era...Begins!!', 5, 'evento,don:1'),
('OP09', 'Nami|Nami', 5, 'personaje,don:5,poder:5000'),
('OP09', 'Nico Robin|Nico Robin', 5, 'lider,poder:5000'),
('OP09', 'Portgas.D.Ace|Portgas.D.Ace', 5, 'personaje,don:5,poder:5000'),
('OP09', 'Red Force|Red Force ', 5, 'escenario,don:2'),
('OP09', 'Sanji|Sanji', 5, 'personaje,don:7,poder:7000'),
('OP09', 'Shanks|Shanks', 5, 'personajes,don:10,poder:12000'),
('OP09', 'Thousand Sunny|Thousand Sunny', 5, 'escenario,don:1'),
('OP09', 'Tony Tony.Chopper|Tony Tony.Chopper ', 5, 'personaje,don:5,poder:6000'),
('OP09', 'Trafalgar Law|Trafalgar Law ', 5, 'personaje,don:1,poder:2000'),
('OP09', 'Uta|Uta', 5, 'personaje,don:1,poder:2000'),
('OP09', 'Yasopp|Yasopp', 5, 'personaje,don:5,poder:6000'),
('OP09', 'Zoro-Juurou|Zoro-Juurou', 5, 'personaje,don:3,poder:4000'),
('OTJ', 'A la hora señalada|High Noon ', 1, 'hechizo,enchantment,rare,coste:1{NC},1{W}'),
('OTJ', 'Accidente desafortunado|Unfortunate Accident', 1, 'hechizo,instant,uncommon,coste:1{B}'),
('OTJ', 'Annie se une al equipo|Annie Joins Up', 1, 'hechizo,enchantment,legendary,rare,coste:1{NC},1{R},1{G},1{W}'),
('OTJ', 'Apariciones emergentes|Emergent Haunting', 1, 'hechizo,enchantment,uncommon,coste;1{NC},1{U}'),
('OTJ', 'Árynx entrenada|Trained Arynx ', 1, 'criatura,cat beast mount,commmon,fuerza:3,resistencia:1,coste:1{NC},1{W}'),
('OTJ', 'Atalaya inspiradora|Inspiring Vantage ', 1, 'tierra,rare,Agrega{R}o{W}'),
('OTJ', 'Avalancha de miedo|Rush of Dread ', 1, 'hechizo,sorcery,rare,coste:1{NC},2{B}'),
('OTJ', 'Avaricia insaciable|Insatiable Avarice', 1, 'hechizo,sorcery,rare,coste:1{B}'),
('OTJ', 'Batea de oro|Gold Pan', 1, 'artefacto,equipment,common,coste:2{NC}'),
('OTJ', 'Bosque OTJ|Forest OTJ', 1, 'tierra,básica,Agrega{G}'),
('OTJ', 'Botas de espuelava|Lavaspur Boots ', 1, 'artefacto,equipamiento,uncommon,coste:1{NC}'),
('OTJ', 'Cactarántula|Cactarantula ', 1, 'criatura,plant spider,common,fuerza:6,resistencia:5,coste:4{NC},2{G}'),
('OTJ', 'Campaña de intimidación|Intimidation Campaign ', 1, 'hechizo,enchantment,uncommon,coste:1{NC},1{U},1{B}'),
('OTJ', 'Canal riscoaguja|Spirebluff Canal', 1, 'tierra,rare,Agrega{U}o{R}'),
('OTJ', 'Cenagal floreciente|Blooming Marsh ', 1, 'tierra,rare,Agregar{B}o{G}'),
('OTJ', 'Creído de los Tirográcil|Slickshot Show-Off', 1, 'criatura,bird wizard,rare,fuerza:1,resistencia:2,coste:1{NC},1{R}'),
('OTJ', 'Devolver la cortesía|Return the Favor', 1, 'hechizo,instant,uncommon,coste:2{R}'),
('OTJ', 'Duelista de la mente|Duelist of the Mind ', 1, 'criatura,human advisor,rare,fuerza:*,resistencia:3,coste:1{NC},1{U}'),
('OTJ', 'Edu Espinoso, sembrador de púas|Bristly Bill, Spine Sower', 1, 'criatura,legendaria,plant druid,mitico,fuerza:2,resistencia:2,coste:1{NC},1{G}'),
('OTJ', 'Égida asimiladora|Assimilation Aegis', 1, 'artefacto,equipamiento,mitico,coste:1{NC},1{W},1{U}'),
('OTJ', 'Enfrentamiento decisivo|Final Showdown', 1, 'hechizo,instant,mítico,coste:1{W}'),
('OTJ', 'Fblthp,perdido en la intemperie|Fblthp,Lost on the Range', 1, 'criatura,legendary,homunculus,rare,fuerza:1,resistencia:1,coste:1{NC},2{U}'),
('OTJ', 'Gran asalto al tren|Great Train Heist', 1, 'hechizo,instant,rare,coste:1{R}'),
('OTJ', 'Hacienda móvil|Mobile Homestead ', 1, 'artefacto,vehiculo,uncommon,fuerza:3,resistencia:3,coste:2{NC}'),
('OTJ', 'Isla OTJ|Island OTJ', 1, 'tierra,básica,Agregar{U}'),
('OTJ', 'Lazo de truenos|Thunder Lasso ', 1, 'artefacto,equipment,uncommon,coste:2{NC},1{W}'),
('OTJ', 'Llanura OTJ|Plains OTJ', 1, 'tierra,básica,Agrega{W}'),
('OTJ', 'Me las pagarás|Hell to Pay', 1, 'hechizo,sorcery,rare,coste:1{X},1{R}'),
('OTJ', 'Montaña OTJ|Mountain OTJ', 1, 'tierra,básica,Agregar{R}'),
('OTJ', 'Montes espinosos|Bristling Backwoods ', 1, 'tierra,desert,Agregar{R}o{G}'),
('OTJ', 'Pantano OTJ|Swamp OTJ ', 1, 'tierra,básica,Agrega{B}'),
('OTJ', 'Planear el golpe|Plan the Heist ', 1, 'hechizo,sorcery,uncommon,coste:2{NC},2{U}'),
('OTJ', 'Rakdos se une al equipo|Rakdos Joins Up', 1, 'hechizo,enchantment,legendary,rare,coste:3{NC},1{B},1{R}'),
('OTJ', 'Rakdos,la fuerza bruta|Rakdos,the Muscle', 1, 'criatura,legendaria,demon mercenary,mitico,fuerza:6,resistencia:5,coste:2{NC},2{B},1{R}'),
('OTJ', 'Riscos deteriorados|Abraded Bluffs ', 1, 'tierra,desert,Agregar{R}o{W}'),
('OTJ', 'Saquear la ciénaga|Pillage the Bog', 1, 'hechizo,sorcery,rare,coste:1{B},1{G}'),
('OTJ', 'Satoru,el infiltrador|Satoru,the Infiltrator', 1, 'criatura,legendary,human ninja rogue,rare,fuerza:2,resistencia:3,coste:1{U},1{B}'),
('OTJ', 'Sierpe de cascabel colosal|Colossal Rattlewurm', 1, 'criatura,wurm,rare,fuerza:6,resistencia:5,coste:2{NC},2{G}'),
('OTJ', 'Sorpresa de la contrabandista|Smuggler\'s Surprise ', 1, 'hechizo,instant,rare,coste:1{G}'),
('OTJ', 'Terror de las cimas|Terror of the Peaks', 1, 'criatura,dragon,mitico,fuerza:5,resistencia:4,coste:3{NC},2{R}'),
('PIP', 'Acto blasfemo|Blasphemous Act', 1, 'hechizo,sorcery,rare,coste:8{NC},1{R}'),
('PIP', 'Albóndiga, siempre leal|Dogmeat, Ever Loyal', 1, 'criatura,legendaria,dog,mítica,fuerza:3,resistencia:3,coste:1{R},1{G},1{W}'),
('PIP', 'Arboleda Pétalo Solar|Sunpetal Grove ', 1, 'tierra,rare,Agregar{G}o{W}'),
('PIP', 'Bien descansada|Well Rested ', 1, 'hechizo,enchatment,aura,uncommon,coste:1{NC},1{G}'),
('PIP', 'Bosque PIP|Forest PIP', 1, 'tierra,basica,Agrega{G}'),
('PIP', 'Cabezón: percepción|Perception Bobblehead ', 1, 'artefacto,booblehead,uncommon,coste:3{NC}'),
('PIP', 'Cait,luchadora de la jaula|Cait,Cage Brawler ', 1, 'criatura,legendary,human warrior,rare,fuerza:1,resistencia:1,coste:1{R},1{G}'),
('PIP', 'Carroñero supermutante|Super Mutant Scavenger', 1, 'criatura,mutant warrior,uncommon,fuerza:5,resistencia:5,coste:4{NC},1{G}'),
('PIP', 'Catacumba inundada|Drowned Catacomb ', 1, 'tierra,rare,Agrega{U}o{B}'),
('PIP', 'César, emperador de la Legión|Caesar, Legion\'s Emperor ', 1, 'criatura,legendaria,human soldier,mítica,fuerza:4,resistencia:4,coste:1{NC},1{R},1{W},1{B}'),
('PIP', 'Ciudad Escoria|Junktown', 1, 'tierra,rare,Agrega{C}'),
('PIP', 'Comandante Sofia Daguerre|Commander Sofia Daguerre', 1, 'criatura,legendaria,human pilot,uncommon,fuerza:1,resistencia:3,coste:3{NC},1{W}'),
('PIP', 'Contaminación nuclear|Nuclear Fallout ', 1, 'hechizo,sorcery,rare,coste:1{X},2{B}'),
('PIP', 'Cultivar|Cultivate', 1, 'hechizo,sorcery,uncommon,coste:2{NC}1,{G}'),
('PIP', 'Dictado severo|Austere Command ', 1, 'hechizo,sorcery,rare,coste:4{NC},2{W}'),
('PIP', 'Disputa mortal|Deadly Dispute', 1, 'hechizo,instant,common,coste:1{NC},1{B}'),
('PIP', 'Espadas en guadañas|Swords to Plowshares ', 1, 'hechizo,instant,uncommo,coste:1{W}'),
('PIP', 'Grebas relámpago|Lightning Greaves', 1, 'artefacto,equipment,uncommon,coste:2{NC}'),
('PIP', 'Hancock,alcalde necrófago|Hancock,Ghoulish Mayor', 1, 'criatura,legendaria,zombie mutant advisor,rare,fuerza:2,resistencia:1,coste:2{NC},1{B}'),
('PIP', 'Ian el Temerario|Ian the Reckless', 1, 'criatura,legendaria,human warrior,uncommon,fuerza:2,resistencia:1,coste:1{NC},1{R}'),
('PIP', 'Intervención heroica|Fallout - Heroic Intervention', 1, 'hechizo,instant,rare,coste:1{NC},1{G}'),
('PIP', 'Isla PIP|Island PIP', 1, 'tierra,basica,Agrega{U}'),
('PIP', 'Jason el Iluminado,profeta resplandeciente|Jason Bright,Glowing Prophet ', 1, 'criatura,legendaria,zombie mutant advisor,rare,fuerza:2,resistencia:3,coste:2{NC},1{U}'),
('PIP', 'La Duquesa,tabernera del Wayward|Duchess,Wayward Tavernkeep', 1, 'criatura,legendaria,human citizen,rare,fuerza:4,resistencia:3,coste:3{NC},1{R}'),
('PIP', 'Llanura PIP|Plains PIP', 1, 'tierra,basica,Agrega{W}'),
('PIP', 'Maestre Owyn Lyons|Elder Owyn Lyons ', 1, 'criatura,legendaria,human knight,uncommon,fuerza:3,resistencia:3,coste:2{NC},1{W},1{U}'),
('PIP', 'Máquina expendedora de Nuka-Cola|Nuka-Cola Vending Machine', 1, 'artefacto,uncommon,coste:3{NC}'),
('PIP', 'Marea inexorable|Inexorable Tide ', 1, 'hechizo,enchantment,rare,coste:3{NC},2{U}'),
('PIP', 'Mercado negro|Black Market ', 1, 'hechizo,enchantment,rare,coste:3{NC},2{B}'),
('PIP', 'Montaña PIP|Mountain PIP', 1, 'tierra,basica,Agrega{R}'),
('PIP', 'Mulo|Strong Back', 1, 'hechizo,enchantment,aura,rare,coste:2{NC},1{G}'),
('PIP', 'Paisaje infinito|Myriad Landscape ', 1, 'tierra,uncommon,Agrega{C}'),
('PIP', 'Pantano PIP|Swamp PIP', 1, 'tierra,basica,Agrega{B}'),
('PIP', 'Pip-Boy 3000', 1, 'artefacto,equipment,rare,coste:1{NC}'),
('PIP', 'Proyecto Guardián|Guardian Project', 1, 'hechizo,enchantment,rare,coste:3{NC},1{G}'),
('PIP', 'Sierra,fan absoluta de Nuka|Sierra,Nuka\'s Biggest Fan', 1, 'criatura,legendaria,human citizen,rare,fuerza:3,resistencia:4,coste:3{NC},1{W}'),
('PIP', 'Tormenta radiactiva|Radstorm ', 1, 'hechizo,instant,rare,coste:3{NC},1{U}'),
('PIP', 'Traje de Mortaja Plateada|Silver Shroud Costume', 1, 'artefacto,equipment,uncommon,coste:2{NC}'),
('PIP', 'Ultimátum ruinoso|Ruinous Ultimatum', 1, 'hechizo,sorcery,rare,coste:2{R},3{W},2{B}'),
('PIP', 'Valle Fuegomusgo|Mossfire Valley', 1, 'tierra,rare,Agrega:{R,G}'),
('PIP', 'Ventaja mutacional|Mutational Advantage', 1, 'hechizo,instant,rare,coste:1{NC},1{G},1{U}'),
('SCR', 'Stellar Crown Promo Card', 3, 'Holo, Limited Edition'),
('SDSB', 'Mago Oscuro,Dark Magician', 2, 'Monstruo Normal,atributo:oscuridad,nivel:7,tipo:Lanzador de conjuros,ataque:2500,defensa:2100'),
('SDWD', 'Blue-Eyes White Dragon', 2, 'Legendary, Blue-Eyes'),
('SFA', 'Bewear|Bewear', 3, 'pokemon,tipo:normal,hp:130,weakness{2},retreat{3}'),
('SFA', 'Cresselia|Cresselia', 3, 'pokemon,tipo:psiquico,hp:120,weakness{2},retreat{1}'),
('SFA', 'Cufant|Cufant', 3, 'pokemon,tipo:acero,hp:100,weakness{2},retreat{3}'),
('SFA', 'Dusclops|Dusclops', 3, 'pokemon,tipo:fantasma,hp:90,weakness{2},retreat{2}'),
('SFA', 'Dusknoir|Dusknoir', 3, 'pokemon,tipo:fantasma,hp:160,weakness{2},retreat{3}'),
('SFA', 'Fezandipiti ex|Fezandipiti ex', 3, 'pokemon,tipo:siniestro,ex double rare,hp:210,weakness:2{F},retreat:1{N}'),
('SFA', 'Fraxure|Fraxure', 3, 'pokemon,tipo:dragon,hp:100,weakness{0},retreat{2}'),
('SFA', 'Horsea|Horsea', 3, 'pokemon,tipo:dragon,hp:60,weakness{2},retreat{1}'),
('SFA', 'Kingdra|Kingdra', 3, 'pokemon,tipo:dragon,hp:310,weakness{2},retreat{1}'),
('SFA', 'Okidogi ex|Okidogi ex', 3, 'pokemon,tipo:normal,hp:250,weakness{2},retreat{3}'),
('SFA', 'Persian|Persian', 3, 'pokemon,tipo:normal,hp:110,weakness{2},retreat{1}'),
('SFA', 'Sylveon|Sylveon', 3, 'pokemon,tipo:hada,hp:120,weakness{2},retreat{1}'),
('SFA', 'Zorua|Zorua', 3, 'pokemon,tipo:siniestro,hp:70,weakness{2},retreat{1}'),
('SSPK', 'Surging Sparks Exclusive Card', 3, 'Ultra Rare'),
('TFC', '|Stitch -Carefree Surfer', 4, 'nombre:stitch,versión:carefree surfer,coste de tinta:7,fuerza:4,fuerza de voluntad:8,clases:dreamborn,hero,alien,habilidad:ohana.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `idEvento` int(11) NOT NULL,
  `nombre_evento` varchar(255) NOT NULL,
  `fecha_evento` date NOT NULL,
  `descripcion` text DEFAULT NULL,
  `urlImagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`idEvento`, `nombre_evento`, `fecha_evento`, `descripcion`, `urlImagen`) VALUES
(1, 'Torneo Pauper Magic: The Gathering', '2025-01-15', 'Inscripción: 5€. 1º Premio: 50€. 2º Premio: 10€. 3º Premio: 3 Booster Packs Foundations, Premio por participar: 1 Booster Pack Foundations', '../assets/images/product/MTG/events/25-1-15-pauper.webp'),
(2, 'Lanzamiento de Yu-Gi-Oh! Rage of the Abyss', '2025-01-05', 'Ven a por la nueva entrega de Yu-Gi-Oh!', '../assets/images/product/YGO/events/25-1-5-ROTA_launch.webp'),
(3, 'Torneo One Piece TCG', '2025-01-20', 'Inscripción: 10€. 1º Premio: 75€. 2º Premio: 15€. 3º Premio: 5 Booster Packs OP-11, Premio por participar: 1 Booster Pack OP-11', '../assets/images/product/OP/events/25-1-20-OP.webp'),
(4, 'Preguntas y respuestas con Artista español de Wizards of The Coast \"Manuel Huedo\"', '2025-01-30', '', '../assets/images/product/MTG/events/25-1-30-interview.webp'),
(5, 'Torneo Gratuito de Lorcana', '2025-02-01', 'Inscripción: 0€. 1º Premio: 1 Booster Pack Ursula\'s return', '../assets/images/product/LOR/events/25-2-1-tournament.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expansiones`
--

CREATE TABLE `expansiones` (
  `codExpansion` varchar(100) NOT NULL,
  `nombreExpansion` varchar(255) NOT NULL,
  `fechaLanzamiento` date NOT NULL,
  `idJuego` int(11) NOT NULL,
  `urlImagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `expansiones`
--

INSERT INTO `expansiones` (`codExpansion`, `nombreExpansion`, `fechaLanzamiento`, `idJuego`, `urlImagen`) VALUES
('ACR', 'Más allá del Multiverso: Assassin\'s Creed|Universes Beyond: Assassin\'s Creed', '2024-07-05', 1, '../assets\\images\\product\\MTG\\sets\\ACR\\portada-ACR.webp'),
('ALP', 'Alfa|Alpha', '1993-08-01', 1, '../assets\\images\\product\\MTG\\sets\\ALP\\alpha-sets.webp'),
('ANE', '|Awakening of the New Era (Japanese) ', '2023-08-23', 5, '../assets\\images\\product\\OP\\sets\\ANE\\Ane.webp'),
('BLB', 'Bloomburrow|Bloomburrow ', '2024-08-02', 1, '../assets\\images\\product\\MTG\\sets\\BLB\\BLB.webp'),
('CLC', 'Pokémon Trading Card Game Classic: Charizard & Ho-Oh ex Deck|Pokémon Trading Card Game Classic: Charizard & Ho-Oh ex Deck', '2023-11-17', 3, '../assets\\images\\product\\POk\\sets\\PKHC\\portada-pkhc.webp'),
('DFT', 'Aetherdrift|Aetherdrift ', '2025-02-14', 1, '../assets\\images\\product\\MTG\\sets\\DFT\\aetherdrift-portada.webp'),
('DSK', 'Duskmourn: La casa de los Horrores|Duskmourn: House of Horror', '2024-09-20', 1, '../assets\\images\\product\\MTG\\sets\\DSK\\DSK-ex.webp'),
('INFO', 'El Infinito Prohibido|Infinite Forbidden', '2024-07-18', 2, '../assets/images/product/YGO/sets/INFO.webp'),
('INR', 'Innistrad Remastered|Innistrad Remastered', '2025-01-24', 1, '../assets\\images\\product\\MTG\\sets\\INR\\portada-inr.webp'),
('IXL', 'Ixalan|Ixalan', '2024-12-15', 1, '../assets/images/product/MAG/sets/Ixalan.jpg'),
('J25', 'Foundations Jumpstart|Foundations Jumpstart', '2024-11-08', 1, '../assets\\images\\product\\MTG\\sets\\jumpstart.webp'),
('KLD', 'Kaledesh|Kaladesh', '2024-10-20', 1, '../assets/images/product/MAG/sets/Kaladesh.jpg'),
('MH3', 'Horizontes Modern 3|Modern Horizons 3', '2024-11-23', 1, '../assets/images/product/MTG/sets/MH3/portada-MH3.webp'),
('OP08', 'Two Legends|Two Legends ', '2024-09-13', 5, '../assets\\images\\product\\OP\\sets\\OP08\\portada-op08.webp'),
('OP09', '|Emperors in the New World', '2024-12-14', 5, '../assets\\images\\product\\OP\\sets\\OP09\\OP-09.webp'),
('OP16', '|Uta Starter Deck', '2024-11-25', 5, '../assets/images/product/OP/packs/OP16/uta-starter-deck.webp'),
('OTJ', 'Forajidos de Cruce de Truenos|Outlaws of Thunder Junction ', '2024-04-19', 1, '../assets\\images\\product\\MTG\\sets\\OTJ\\portada-otj.webp'),
('PIP', 'Más allá del Multiverso: Fallout|Universes Beyond: Fallout ', '2024-03-08', 1, '../assets\\images\\product\\MTG\\sets\\PIP\\Magic-Fallout.webp'),
('PNBP', 'Pesadilla Fantasma|Phantom Nightmare', '2024-11-24', 2, '../assets/images/product/YGO/packs/phantom-nightmare-booster-pack.jpg'),
('SCR', 'Corona Astral|Stellar Crown', '2024-09-13', 3, '../assets/images/product/POK/sets/Stellar_Crown_Logo.png'),
('SDSB', '|Speed Duel: Streets of Battle City ', '2023-08-23', 2, '../assets\\images\\product\\YGO\\sets\\SDSB\\sdsb.webp'),
('SDWD', '|Blue-Eyes White Destiny', '2025-02-06', 2, '../assets/images/product/YGO/sets/WD.jpg'),
('SFA', 'Shrouded Fable|Fábula Sombría', '2024-08-02', 3, '../assets\\images\\product\\POk\\sets\\SFA.webp'),
('SSMMG', 'Marnie\'s Morpeko & Grimmsnarl EX|Marnie\'s Morpeko & Grimmsnarl EX', '2024-11-21', 3, '../assets/images/product/POK/tins/SSMMG/marnie-morpeko-grimmsnarl-ex.png'),
('SSPK', 'Chispas Fulgurantes|Surging Sparks', '2024-11-08', 3, '../assets/images/product/POK/sets/Surging_Sparks_Logo.png'),
('SSSBM', 'Steven\'s Beldum & Metagross EX|Steven\'s Beldum & Metagross EX', '2024-11-20', 3, '../assets/images/product/POK/tins/SSSBM/starter-set-ex-stevens-beldum-metagross-ex.jpg'),
('TFC', '|The First Chapter ', '2023-09-01', 4, '../assets\\images\\product\\LOR\\sets\\TFC\\The_First_Chapter_logo.webp'),
('UR', '|Ursula\'s Return', '2024-11-22', 4, '../assets/images/product/LOR/tins/UR/ursula-tin.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `idJuego` int(11) NOT NULL,
  `nombre_juego` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`idJuego`, `nombre_juego`) VALUES
(1, 'Magic: The Gathering'),
(2, 'Yu-Gi-Oh!'),
(3, 'Pokémon'),
(4, 'Lorcana'),
(5, 'One Piece');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

CREATE TABLE `ofertas` (
  `nombreProducto` varchar(255) NOT NULL,
  `codExpansion` varchar(100) NOT NULL,
  `idJuego` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `tipo` enum('carta','caja','sobre') NOT NULL,
  `urlImagen` varchar(255) DEFAULT NULL,
  `descuento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ofertas`
--

INSERT INTO `ofertas` (`nombreProducto`, `codExpansion`, `idJuego`, `precio`, `tipo`, `urlImagen`, `descuento`) VALUES
('Modern Horizons 3 Booster Box', 'MH3', 1, 55.00, 'caja', '../assets/images/product/MTG/cards/MH3/mh3-booster-box.webp', 13),
('Phantom Nightmare Booster Pack', 'PNBP', 2, 3.99, 'sobre', '../assets/images/product/YGO/packs/phantom-nightmare-booster-pack.jpg', 20),
('Marnie\'s Morpeko & Grimmsnarl EX Booster Pack', 'SSMMG', 3, 3.99, 'sobre', '../assets/images/product/POK/tins/SSMMG/marnie-morpeko-grimmsnarl-ex.png', 25),
('Steven\'s Beldum & Metagross EX Booster Pack', 'SSSBM', 3, 3.99, 'sobre', '../assets/images/product/POK/tins/SSSBM/starter-set-ex-stevens-beldum-metagross-ex.jpg', 15),
('Ursula\'s Return Tin', 'UR', 4, 19.99, 'caja', '../assets/images/product/LOR/tins/UR/ursula-tin.webp', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codExpansion` varchar(100) NOT NULL,
  `nombreProducto` varchar(255) NOT NULL,
  `idJuego` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `tipo` enum('carta','caja','sobre') DEFAULT NULL,
  `urlImagen` varchar(255) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codExpansion`, `nombreProducto`, `idJuego`, `precio`, `tipo`, `urlImagen`, `descuento`) VALUES
('ACR', 'Amparo de la oscuridad|Cover of Darkness ', 1, 4.04, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\amparo-de-la-oscuridad.webp', NULL),
('ACR', 'Asesinato en cadena|Chain Assassination ', 1, 0.07, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Asesinato-en-cadena.webp', NULL),
('ACR', 'Ataque con sobrecarga|Overpowering Attack ', 1, 0.71, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Ataque-con-sobrecarga.webp', NULL),
('ACR', 'Base de la Hermandad|Brotherhood Headquarters', 1, 0.23, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Base-de-la-Hermandad.webp', NULL),
('ACR', 'Bosque ACR|Forest ACR', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\bosque.webp', NULL),
('ACR', 'Caja de sobres de coleccionista de Más allá del Multiverso: Assassin\'s Creed|Universes Beyond: Assassin\'s Creed Collector Booster Box ', 1, 212.95, 'caja', '../assets\\images\\product\\MTG\\tins\\ACR\\caja-2-ACR.webp', NULL),
('ACR', 'Caja de sobres de Más allá del Multiverso: Assassin\'s Creed|Universes Beyond: Assassin\'s Creed Beyond Booster Display ', 1, 101.86, 'caja', '../assets\\images\\product\\MTG\\tins\\ACR\\caja-ACR.webp', NULL),
('ACR', 'Contactos en el mercado negro|Black Market Connections', 1, 9.88, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Contactos-en-el-mercado-negro.webp', NULL),
('ACR', 'Descanse en paz|Rest in Peace', 1, 0.45, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\descanse-en-paz.webp', NULL),
('ACR', 'Edward Kenway|Edward Kenway', 1, 11.06, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Edward-Kenway.webp', NULL),
('ACR', 'Eivor, Matalobos|Eivor, Wolf-Kissed', 1, 2.09, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Eivor.webp', NULL),
('ACR', 'El Animus|The Animus', 1, 0.59, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\animus.webp', NULL),
('ACR', 'Espada de abundancia y escasez|Sword of Feast and Famine', 1, 15.61, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Espada-de-abundancia-y-escasez.webp', NULL),
('ACR', 'Evie Frye|Evie Frye', 1, 0.41, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Evie-Frye.webp', NULL),
('ACR', 'Excalibur,espada del Edén|Excalibur,Sword of Eden ', 1, 10.14, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Excalibur.webp', NULL),
('ACR', 'Ezio Auditore da Firenze|Ezio Auditore da Firenze', 1, 10.89, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Ezio-Auditore.webp', NULL),
('ACR', 'Fardo de heno|Haystack ', 1, 0.27, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Fardo-de-heno.webp', NULL),
('ACR', 'Fruto del Edén,reliquia Isu|Apple of Eden,Isu Relic ', 1, 1.98, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Fruto-del-Edén.webp', NULL),
('ACR', 'Haytham Kenway|Haytham Kenway', 1, 0.39, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\haytham-kenway.webp', NULL),
('ACR', 'Hoja oculta|Hidden Blade ', 1, 0.17, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Hoja-oculta.webp', NULL),
('ACR', 'Isla ACR| Island ACR', 1, 0.49, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\isla.webp', NULL),
('ACR', 'Kassandra, portadora del águila|Kassandra, Eagle Bearer', 1, 6.21, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Kassandra.webp', NULL),
('ACR', 'La lanza de Leónidas|The Spear of Leonidas ', 1, 1.05, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\La-lanza-de-Leónidas.webp', NULL),
('ACR', 'Latrocinio nimio|Petty Larceny', 1, 0.11, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Latrocinio-nimio.webp', NULL),
('ACR', 'Leonardo da Vinci|Leonardo da Vinci', 1, 2.12, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Leonardo-da-Vinci.webp', NULL),
('ACR', 'Llanura ACR|Plains ACR', 1, 0.13, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Llanura.webp', NULL),
('ACR', 'Lo que hay que hacer|What Must Be Done ', 1, 0.41, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Lo-que-hay-que-hacer.webp', NULL),
('ACR', 'Lydia Frye|Lydia Frye', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Lydia.webp', NULL),
('ACR', 'Montaña ACR|Mountain ACR', 1, 0.21, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Montaña.webp', NULL),
('ACR', 'Pantano ACR|Swamp ACR', 1, 0.18, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\pantano.webp', NULL),
('ACR', 'Piratería costera|Coastal Piracy', 1, 0.34, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\pirateria.webp', NULL),
('ACR', 'Propaganda|Propaganda', 1, 1.41, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Propaganda.webp', NULL),
('ACR', 'Ratonhnhaké:ton|Ratonhnhaké꞉ton ', 1, 0.28, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Ratonhnhakéton.webp', 20.00),
('ACR', 'Ser anónimo|Become Anonymous', 1, 0.25, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Ser-anónimo.webp', NULL),
('ACR', 'Sobre de coleccionista de Más allá del Multiverso: Assassin\'s Creed|Universes Beyond: Assassin\'s Creed Collector Booster', 1, 21.04, 'sobre', '../assets\\images\\product\\MTG\\packs\\ACR\\sobre-ACR-collec.webp', NULL),
('ACR', 'Sobre de Más allá de Multiverso:Assassin\'s Creed|Universes Beyond:Assassin\'s Creed Beyond Booster', 1, 5.06, 'sobre', '../assets\\images\\product\\MTG\\packs\\ACR\\sobre-ACR.webp', NULL),
('ACR', 'Sócrates,profesor ateniense|Sokrates,Athenian Teacher ', 1, 0.57, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\socrates.webp', NULL),
('ACR', 'Terminar|Terminate', 1, 0.30, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Terminar.webp', NULL),
('ACR', 'Transgresión temporal|Temporal Trespass', 1, 4.22, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Transgresión-temporal.webp', NULL),
('ACR', 'Trofeo de la asesina|Assassin\'s Trophy', 1, 1.77, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Trofeo-de-la-asesina.webp', NULL),
('ACR', 'Vista de águila|Eagle Vision ', 1, 0.21, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Vista-de-águila.webp', NULL),
('ACR', 'Yggdrasil,artefacto del renacer|Yggdrasil,Rebirth Engine ', 1, 9.35, 'carta', '../assets\\images\\product\\MTG\\cards\\ACR\\Yggdrasil.webp', NULL),
('ALP', 'Loto Negro |Black Lotus ', 1, 18000.00, 'carta', '../assets\\images\\product\\MTG\\cards\\ALP\\black-lotus.webp', NULL),
('ANE', 'Monkey.D.Luffy (OP05-119) (V.1)', 5, 18000.00, 'carta', '../assets\\images\\product\\OP\\cards\\ANE\\Luffy.webp', NULL),
('BLB', 'Beza, la Primavera Prometida | Beza, the Bounding Spring', 1, 13.85, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Beza.webp', NULL),
('BLB', 'Bloomburrow: Prerelease Promo Cards Booster', 1, 6.04, 'sobre', '../assets\\images\\product\\MTG\\packs\\BLB\\sobre-prelease.webp', NULL),
('BLB', 'Caer|Fell ', 1, 0.56, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Caer.webp', NULL),
('BLB', 'Caja de sobres de coleccionista de Bloomburrow | Bloomburrow Collector Booster Box', 1, 332.04, 'caja', '../assets\\images\\product\\MTG\\tins\\BLB\\caja-sobres.webp', NULL),
('BLB', 'Caja de sobres de juego de Bloomburrow | Bloomburrow Play Booster Box ', 1, 135.68, 'caja', '../assets\\images\\product\\MTG\\tins\\BLB\\caja-booster.webp', NULL),
('BLB', 'Campana de Puerto Fontanal|Fountainport Bell', 1, 0.04, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Campana-de-Puerto-Fontanal.webp', NULL),
('BLB', 'Cangrejo arremolinante|Eddymurk Crab ', 1, 0.30, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Cangrejo-arremolinante.webp', NULL),
('BLB', 'Clériga de la vista estelar|Starscape Cleric ', 1, 1.17, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\clériga-de-la-vista-estelar.webp', NULL),
('BLB', 'En las garras del sueño|Kitnap', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\En-las-garras-del-sueño.webp', NULL),
('BLB', 'Epopeya heredada|Heirloom Epic ', 1, 0.07, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Epopeya-heredada.webp', NULL),
('BLB', 'Espada de forja estelar|Starforged Sword ', 1, 0.06, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Espada-de-forja-estelar.webp', NULL),
('BLB', 'Festival de las Ascuas|Festival of Embers', 1, 0.13, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Festival-de-las-Ascuas.webp', NULL),
('BLB', 'Formación de la Patarcela|Pawpatch Formation', 1, 3.90, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Formación-de-la-Patarcela.webp', NULL),
('BLB', 'Guerrera de la flamánima | Emberheart Challenger', 1, 5.82, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Guerrera-flamanima.webp', NULL),
('BLB', 'Hacia las fauces inundadas|Into the Flood Maw ', 1, 1.53, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Hacia-las-fauces-inundadas.webp', NULL),
('BLB', 'Héroe de la llama del corazón|Heartfire Hero ', 1, 3.52, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\heroe-de-la-llama-del-corazon.webp', NULL),
('BLB', 'Invocación estelar|Starfall Invocation', 1, 0.72, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Invocación-estelar.webp', NULL),
('BLB', 'Llenar la despensa|Stocking the Pantry', 1, 0.13, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Llenar-la-despensa.webp', NULL),
('BLB', 'Lumra, Bramido del Bosque | Lumra, Bellow of the Woods', 1, 11.07, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Lumra.webp', NULL),
('BLB', 'Luz de destierro|Banishing Light', 1, 0.05, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Luz-de-destierro.webp', NULL),
('BLB', 'Maha, Plumas de la Noche | Maha, Its Feathers Night ', 1, 7.99, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Maha.webp', NULL),
('BLB', 'Monolito amenazador|Sinister Monolith ', 1, 0.10, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Monolito.webp', NULL),
('BLB', 'Patas a la obra|Hop to It', 1, 0.16, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Patas-a-la-obra.webp', NULL),
('BLB', 'Poder de los mansos|Might of the Meek ', 1, 0.11, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Poder-de-los-mansos.webp', NULL),
('BLB', 'Por el bien común|For the Common Good ', 1, 0.69, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Por-el-bien-común.webp', NULL),
('BLB', 'Portal acuático|Splash Portal ', 1, 0.27, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Portal-acuático.webp', NULL),
('BLB', 'Pozo de los deseos|Wishing Well', 1, 0.11, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Pozo-de-los-deseos.webp', NULL),
('BLB', 'Racha de regalo|Parting Gust', 1, 0.44, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Racha-de-regalo.webp', NULL),
('BLB', 'Recluta de la Patarcela|Pawpatch Recruit', 1, 2.10, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\recluta-de-la-patarcela-.webp', NULL),
('BLB', 'Sinsonte|Mockingbird', 1, 4.36, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Sinsonte.webp', NULL),
('BLB', 'Sobre de coleccionista de Bloomburrow | Bloomburrow Collector Booster', 1, 26.39, 'sobre', '../assets\\images\\product\\MTG\\packs\\BLB\\sobre-colec.webp', NULL),
('BLB', 'Sobre de juego de Bloomburrow | Bloomburrow Play Booster ', 1, 4.10, 'sobre', '../assets\\images\\product\\MTG\\packs\\BLB\\sobre-blb.webp', NULL),
('BLB', 'Sobreproteger|Overprotect', 1, 0.81, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Sobreproteger.webp', NULL),
('BLB', 'Talento: herrería|Blacksmith\'s Talent', 1, 0.17, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Talento-herrería.webp', NULL),
('BLB', 'Víbora de boca pútrida | Rottenmouth Viper ', 1, 7.56, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Víbora.webp', NULL),
('BLB', 'Ygra, devoratodo | Ygra, Eater of All ', 1, 14.10, 'carta', '../assets\\images\\product\\MTG\\cards\\BLB\\Ygra.webp', NULL),
('CLC', 'Charizard|Charizard', 3, 74.99, 'carta', '../assets\\images\\product\\POk\\cards\\PKHC\\charizard.webp', NULL),
('CLC', 'Charmander|Charmander', 3, 10.02, 'carta', '../assets/images/product/POK/cards/CLC/Charmander.webp', NULL),
('CLC', 'Charmeleon|Charmeleon', 3, 8.38, 'carta', '../assets/images/product/POK/cards/CLC/Charmeleon.webp', NULL),
('CLC', 'Clefable|Clefable', 3, 1.95, 'carta', '../assets/images/product/POK/cards/CLC/Clefable.webp', NULL),
('CLC', 'Clefairy|Clefairy', 3, 1.95, 'carta', '../assets/images/product/POK/cards/CLC/Clefairy.webp', NULL),
('CLC', 'Electrode|Electrode', 3, 0.92, 'carta', '../assets/images/product/POK/cards/CLC/Electrode.webp', NULL),
('CLC', 'Ho-Oh ex|Ho-Oh ex', 3, 0.82, 'carta', '../assets/images/product/POK/cards/CLC/Ho-Oh_ex.webp', NULL),
('CLC', 'Magmar|Magmar', 3, 1.12, 'carta', '../assets/images/product/POK/cards/CLC/Magmar.webp', NULL),
('CLC', 'Pikachu|Pikachu', 3, 12.33, 'carta', '../assets/images/product/POK/cards/Pikachu.webp', NULL),
('CLC', 'Ponyta|Ponyta', 3, 0.54, 'carta', '../assets/images/product/POK/cards/CLC/Ponyta.webp', NULL),
('CLC', 'Raichu|Raichu', 3, 1.65, 'carta', '../assets/images/product/POK/cards/CLC/Raichu.webp', NULL),
('CLC', 'Rapidash|Rapidash', 3, 0.45, 'carta', '../assets/images/product/POK/cards/CLC/Rapidash.webp', NULL),
('CLC', 'Voltorb|Voltorb', 3, 0.53, 'carta', '../assets/images/product/POK/cards/CLC/Voltorb.webp', NULL),
('CLC', 'Zapdos|Zapdos', 3, 0.95, 'carta', '../assets/images/product/POK/cards/CLC/Zapdos.webp', NULL),
('DFT', ' |Bleachbone Verge', 1, 9.05, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Bleachbone.webp', NULL),
('DFT', ' |Boommobile', 1, 8.05, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Boommobile.webp', NULL),
('DFT', ' |Chandra, Spark Hunter', 1, 14.55, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\chandra.webp', NULL),
('DFT', ' |Cursecloth Wrappings', 1, 13.55, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Cursecloth.webp', NULL),
('DFT', ' |Defend the Rider', 1, 0.34, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Defend-the-rider.webp', NULL),
('DFT', ' |Ketramose, the New Dawn', 1, 33.75, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Ketramose.webp', NULL),
('DFT', ' |Kolodin,Triumph Caster', 1, 12.89, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Kolodin.webp', NULL),
('DFT', ' |Lifecraft Engine', 1, 8.20, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Lifecraft.webp', NULL),
('DFT', ' |Mindspring Merfolk', 1, 13.55, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Mindspring.webp', NULL),
('DFT', ' |Momentum Breaker', 1, 0.34, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Momentum.webp', NULL),
('DFT', ' |Possession Engine', 1, 9.55, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Possession.webp', NULL),
('DFT', ' |Redshift,Rocketeer Chief', 1, 9.45, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Redshift.webp', NULL),
('DFT', ' |Riverpyre Verge', 1, 9.84, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Riverpyre.webp', NULL),
('DFT', ' |Sab-Sunen,Luxa Embodied', 1, 27.75, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Sab-Sunen.webp', NULL),
('DFT', ' |Sunbillow Verge', 1, 9.15, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Sunbillow.webp', NULL),
('DFT', ' |Thunderous Velocipede', 1, 16.35, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Thunderous.webp', NULL),
('DFT', ' |Vnwxt,Verbose Host', 1, 12.38, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Vnwxt.webp', NULL),
('DFT', ' |Willowrush Verge', 1, 9.10, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Willowrush.webp', NULL),
('DFT', ' |Winter,Cursed Rider', 1, 8.40, 'carta', '../assets\\images\\product\\MTG\\cards\\DFT\\Winter.webp', NULL),
('DFT', 'Caja de sobres de coleccionista de Aetherdrift | Aetherdrift Collector Booster Box ', 1, 217.70, 'caja', '../assets\\images\\product\\MTG\\tins\\DFT\\caja-coleccion.webp', NULL),
('DFT', 'Caja de sobres de juego de Aetherdrift | Aetherdrift Play Booster Box', 1, 112.24, 'caja', '../assets\\images\\product\\MTG\\tins\\DFT\\caja-aetherdrift.webp', NULL),
('DFT', 'Sobre Aetherdrift Prerelease|Aetherdrift Prerelease Promo Cards Booster', 1, 9.99, 'sobre', '../assets\\images\\product\\MTG\\packs\\DFT\\sobre-prerelease.webp', NULL),
('DFT', 'Sobre de Box Topper de Aetherdrift | Aetherdrift Box Topper Booster ', 1, 24.98, 'sobre', '../assets\\images\\product\\MTG\\packs\\DFT\\sobre-box-topper.webp', NULL),
('DFT', 'Sobre de coleccionista de Aetherdrift | Aetherdrift Collector Booster', 1, 21.23, 'sobre', '../assets\\images\\product\\MTG\\packs\\DFT\\sobre-coleccionista.webp', NULL),
('DFT', 'Sobre de juego de Aetherdrift | Aetherdrift Play Booster', 1, 4.47, 'sobre', '../assets\\images\\product\\MTG\\packs\\DFT\\sobre-aetherdrift.webp', NULL),
('DSK', 'Armadura etérea|Ethereal Armor ', 1, 0.24, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\armadura-etérea.webp', NULL),
('DSK', 'Aspiradora de fantasmas|Ghost Vacuum ', 1, 5.61, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\aspiradora-de-fantasmas.webp', NULL),
('DSK', 'Avería inoportuna|Untimely Malfunction ', 1, 1.99, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\avería-inoportuna.webp', NULL),
('DSK', 'Bosques sangrantes|Bleeding Woods', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\bosques-sangrantes.webp', NULL),
('DSK', 'Brillolinterna|Glimmerlight', 1, 0.06, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\Brillolinterna.webp', NULL),
('DSK', 'Caja de sobres de coleccionista de Duskmourn:La casa de los horrores', 1, 217.72, 'caja', '../assets\\images\\product\\MTG\\tins\\DSK\\caja-de-sobres-de-coleccionista-de-duskmourn-la-casa-de-los-horrores.webp', NULL),
('DSK', 'Caja de sobres de juego de Duskmourn:La casa de los horrores', 1, 136.49, 'caja', '../assets\\images\\product\\MTG\\tins\\DSK\\caja-de-sobres-de-juego-de-duskmourn-la-casa-de-los-horrores.webp', NULL),
('DSK', 'Campamento abandonado|Abandoned Campground', 1, 0.12, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\campamento-abandonado.webp', NULL),
('DSK', 'Cercenador cabezagujas|Razorkin Needlehead', 1, 3.34, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\Cercenador cabezagujas.webp', NULL),
('DSK', 'Consejo demoníaco|Demonic Counsel', 1, 1.51, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\consejo-demoníaco.webp', NULL),
('DSK', 'Detonación ígnea|Pyroclasm', 1, 0.18, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\detonación-ígnea.webp', NULL),
('DSK', 'Duskmourn:House of Horror Collector Booster', 1, 20.00, 'sobre', '../assets\\images\\product\\MTG\\packs\\DSK\\duskmourn-house-of-horror-collector-booster.webp', NULL),
('DSK', 'Duskmourn:House of Horror Play Booster', 1, 3.72, 'sobre', '../assets\\images\\product\\MTG\\packs\\DSK\\duskmourn-house-of-horror-play-booster.webp', NULL),
('DSK', 'Duskmourn:House of Horror: Nightmare Fat Pack Bundle', 1, 71.74, 'caja', '../assets\\images\\product\\MTG\\tins\\DSK\\duskmourn-house-of-horror-nightmare-fat-pack-bundle.webp', NULL),
('DSK', 'Duskmourn:Nightmare Bundle Booster', 1, 11.52, 'sobre', '../assets\\images\\product\\MTG\\packs\\DSK\\duskmourn-la-nightmare-bundle-booster.webp', NULL),
('DSK', 'Duskmourn:Prerelease Promo Cards Booster', 1, 5.23, 'sobre', '../assets\\images\\product\\MTG\\packs\\DSK\\duskmourn-prerelease-promo-cards-booster.webp', NULL),
('DSK', 'Línea mística de la esperanza|Leyline of Hope ', 1, 0.29, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\línea-mística-de-la-esperanza.webp', NULL),
('DSK', 'Línea mística de la resonancia|Leyline of Resonance ', 1, 0.99, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\línea-mística-de-la-resonancia.webp', NULL),
('DSK', 'Llaves de la Casa|Keys to the House ', 1, 0.08, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\llaves-de-la-casa.webp', NULL),
('DSK', 'Maizal grabado|Etched Cornfield', 1, 0.10, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\maizal-grabado.webp', NULL),
('DSK', 'Némesis de los gritos|Screaming Nemesis ', 1, 24.27, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\némesis-de-los-gritos.webp', NULL),
('DSK', 'Ojo aberrante|Abhorrent Oculus ', 1, 42.36, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK/ojo-aberrante.webp', NULL),
('DSK', 'Pantalla poseída|Haunted Screen', 1, 0.11, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\pantalla-poseida.webp', NULL),
('DSK', 'Protegido por fantasmas|Sheltered by Ghosts', 1, 4.81, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\protegido-por-fantasmas.webp', NULL),
('DSK', 'Separarse|Split Up ', 1, 1.97, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\separarse.webp', NULL),
('DSK', 'Sierra|Saw ', 1, 0.07, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\sierra.webp', NULL),
('DSK', 'Tergiversar la realidad|Twist Reality', 1, 0.10, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\tergiversar-la-realidad.webp', NULL),
('DSK', 'Tormento agotador|Withering Torment ', 1, 1.36, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\tormento-agotador.webp', NULL),
('DSK', 'Umbral de Cenagalardiente|Blazemire Verge ', 1, 5.74, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\umbral-de-cenagalardiente.webp', NULL),
('DSK', 'Umbral de Lagosombrío|Gloomlake Verge', 1, 10.78, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\umbral-de-lagosombrio.webp', NULL),
('DSK', 'Valgavoth el Devoraterrores|Valgavoth Terror Eater', 1, 16.25, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\Valgavoth-el-Devoraterrores', NULL),
('INFO', 'Dragón Tenpai Genroku,Tenpai Dragon Genroku', 2, 3.90, 'carta', '../assets\\images\\product\\YGO\\cards\\INFO\\dragon-tenpai-genroku.webp', NULL),
('INFO', 'Forbidden One', 2, 20.00, 'carta', '/assets/images/product/YGO/sets/Forbidden_One_Card.png', NULL),
('INFO', 'Infinite Forbidden Box', 2, 140.00, 'caja', '/assets/images/product/YGO/sets/Infinite_Forbidden_Box.png', NULL),
('INFO', 'Infinite Forbidden Pack', 2, 4.75, 'sobre', '/assets/images/product/YGO/sets/Infinite_Forbidden_Pack.png', NULL),
('INR', 'Almas persistentes|Lingering Souls ', 1, 0.18, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\almas-persistentes.webp', NULL),
('INR', 'Artista de la sangre|Blood Artist', 1, 0.89, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\artista-sangre.webp', NULL),
('INR', 'Atravesando la brecha|Through the Breach ', 1, 3.15, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\atravesando-la-brecha.webp', NULL),
('INR', 'Bosque INR|Forest INR', 1, 0.39, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\bosque.webp', NULL),
('INR', 'Caja de sobres de coleccionista de Innistrad remasterizada,Innistrad Remastered Collector Booster Box ', 1, 310.31, 'caja', '../assets\\images\\product\\MTG\\packs\\INR\\caja-inr-collector.webp', NULL),
('INR', 'Caja de sobres de juego de Innistrad remasterizada,Innistrad Remastered Play Booster Box', 1, 164.81, 'caja', '../assets\\images\\product\\MTG\\tins\\INR\\caja-inr-boosters.webp', NULL),
('INR', 'Carácter ardiente|Fiery Temper ', 1, 0.12, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\caracter.webp', NULL),
('INR', 'Cazahechizos|Spell Queller ', 1, 1.00, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\caza-hechizos.webp', NULL),
('INR', 'Cota de malla demoníaca|Demonmail Hauberk', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\cota-de-malla.webp', NULL),
('INR', 'Desove arácnido| Spider Spawning ', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\desove-aracnido.webp', NULL),
('INR', 'Edgar Markov', 1, 55.22, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\edgar-markov.webp', NULL),
('INR', 'Emrakul el Final Prometido|Emrakul the Promised End', 1, 31.56, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\emrakul.webp', NULL),
('INR', 'Extractor de almas|Soul Separator', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\extractor-de-almas.webp', NULL),
('INR', 'Fe incólume|Faith Unbroken', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\fe.webp', NULL),
('INR', 'Flujo de esencia|Essence Flux', 1, 0.60, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\flujo.webp', NULL),
('INR', 'Histeria masiva| Mass Hysteria', 1, 0.12, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\histeria.webp', NULL),
('INR', 'Injerto de suturador|Stitcher\'s Graf', 1, 0.20, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\injerto.webp', NULL),
('INR', 'Isla INR|Island INR', 1, 0.58, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\isla.webp', NULL),
('INR', 'Llanura INR|Plains INR', 1, 0.38, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\llanura.webp', NULL),
('INR', 'Montaña INR| Mountain INR', 1, 0.50, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\montaña.webp', NULL),
('INR', 'Mutación espontánea|Spontaneous Mutation ', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\mutación-espontánea.webp', NULL),
('INR', 'Navegante certero|Deadeye Navigator', 1, 2.40, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\navegante-certero.webp', NULL),
('INR', 'Pantano INR|Swamp INR', 1, 0.50, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\pantano.webp', NULL),
('INR', 'Pulsión asesina|Murderous Compulsion ', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\pulsion-asesina.webp', NULL),
('INR', 'Reforjar el alma|Reforge the Soul ', 1, 2.97, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\reforjar-el-alma.webp', NULL),
('INR', 'Ritos de pueblo|Village Rites ', 1, 0.20, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\ritos.webp', NULL),
('INR', 'Sobre de coleccionista de Innistrad remasterizada|Innistrad Remastered Collector Booster', 1, 29.19, 'sobre', '../assets\\images\\product\\MTG\\packs\\INR\\sobre-inr-collector.webp', NULL),
('INR', 'Sobre de juego de Innistrad remasterizada|Innistrad Remastered Play Booster', 1, 5.51, 'sobre', '../assets\\images\\product\\MTG\\packs\\INR\\sobre-inr-booster.webp', NULL),
('INR', 'Tentación mortal|Deadly Allure', 1, 0.13, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\tentacion-mortal.webp', NULL),
('INR', 'Trampa luzgeist|Geistlight Snare ', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\rampa.webp', NULL),
('INR', 'Triscaidecafobia|Triskaidekaphobia', 1, 0.13, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\Triscaidecafobia.webp', NULL),
('INR', 'Tumba del ángel|Angel\'s Tomb', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\tumba-del-angel.webp', NULL),
('INR', 'Ventana entablada|Boarded Window', 1, 0.24, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\ventana-entablada.webp', NULL),
('INR', 'Virtud intangible|Intangible Virtue', 1, 0.13, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\virtud-intangible.webp', NULL),
('IXL', 'Ixalan Booster Pack', 1, 4.25, 'sobre', '/assets/images/product/MAG/sets/Ixalan_Pack.png', NULL),
('IXL', 'Ixalan Deck', 1, 16.00, 'caja', '/assets/images/product/MAG/sets/Ixalan_Deck.png', NULL),
('IXL', 'Ixalan Mythic Card', 1, 15.00, 'carta', '/assets/images/product/MAG/sets/Ixalan_Card.png', NULL),
('J25', 'Abrazo de Serra|Serra\'s Embrace', 1, 0.17, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\abrazo-serra.webp', NULL),
('J25', 'Aphelia encantadora de víboras|Aphelia  Viper Whisperer ', 1, 21.14, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\aphelia.webp', NULL),
('J25', 'Arranque violento|Violent Outburst ', 1, 0.54, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\arranque-violento.webp', NULL),
('J25', 'Bosque J25|Forest J25', 1, 0.02, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\bosque.webp', NULL),
('J25', 'Cachorro generoso|Generous Pup ', 1, 5.58, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\cachorro.webp', NULL),
('J25', 'Chupasangre insidioso|Creeping Bloodsucker ', 1, 3.91, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\chupasangre.webp', NULL),
('J25', 'Cólera ancestral|Ancestral Anger', 1, 0.28, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\colera-ancestral.webp', NULL),
('J25', 'Concentrarse|Concentrate', 1, 0.13, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\concentrarse.webp', NULL),
('J25', 'Crecimiento exuberante|Rampant Growth ', 1, 0.38, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\crecimiento-exuberante.webp', NULL),
('J25', 'Cría de felinoguadaña|Scythecat Cub ', 1, 27.76, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\felinoguadaña.webp', NULL),
('J25', 'Emisaria de guerra|Herald of War', 1, 1.30, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\angel.webp', NULL),
('J25', 'Escupefuego|Fireshrieker ', 1, 0.17, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\escupefuego.webp', NULL),
('J25', 'Esperanza en extinción|Fading Hope ', 1, 0.33, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\esperanza.webp', NULL),
('J25', 'Evereth virreina del saqueo|Evereth Viceroy of Plunder', 1, 12.67, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\evereth.webp', NULL),
('J25', 'Fabricaingenios|Whirlermaker', 1, 0.05, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\Fabricaingenios.webp', NULL),
('J25', 'Golpe a la garganta|Go for the Throat ', 1, 0.91, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\golpe-garganta.webp', NULL),
('J25', 'Herramientas de ladrón|Thieves\' Tools ', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\herramientas-ladron.webp', NULL),
('J25', 'Isla J25| Island J25', 1, 0.10, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\isla.webp', NULL),
('J25', 'Jugar con fuego|Play with Fire ', 1, 1.16, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\jugar-con-fuego.webp', NULL),
('J25', 'Kodama del árbol del oeste| Kodama of the West Tree', 1, 13.84, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\kodama.webp', NULL),
('J25', 'Llamas de la instigadora|Flames of the Firebrand ', 1, 0.10, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\llamas-instigadora.webp', NULL),
('J25', 'Maza del valiente|Mace of the Valiant', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\mazo-del-valiente.webp', NULL),
('J25', 'Montaña J25|Mountain J25', 1, 0.03, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\montaña.webp', NULL),
('J25', 'Pantano J25|Swamp J25', 1, 0.08, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\pantano.webp', NULL),
('J25', 'Parcela fúngica,Fungal Plots ', 1, 0.18, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\parcela-fungica.webp', NULL),
('J25', 'Rastro de migajas|Trail of Crumbs ', 1, 0.28, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\rastro-migajas.webp', NULL),
('J25', 'Recuerdo del Starnheim|Starnheim Memento ', 1, 0.21, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\recuerdo-starnheim.webp', NULL),
('J25', 'Reenviar|Remand ', 1, 0.51, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\reenviar.webp', NULL),
('J25', 'Retirada a Kazandu|Retreat to Kazandu ', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\retirada-kazandu.webp', NULL),
('J25', 'Rev sacadiezmos|Rev Tithe Extractor ', 1, 29.93, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\rev.webp', NULL),
('J25', 'Secuestrado por las hadas|Stolen by the Fae ', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\secuestrado.webp', NULL),
('J25', 'Sobre de Jumpstart de Magic:The Gathering Cimientos,Magic: The Gathering|Foundations Jumpstart Booster ', 1, 4.20, 'sobre', '../assets\\images\\product\\MTG\\packs\\J25\\sobre-cimientos-jumpstart-booster.webp', NULL),
('J25', 'Tormento de escarabajos|Torment of Scarabs', 1, 0.41, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\tormento-escarabajos.webp', NULL),
('J25', 'Valkiria justa|Righteous Valkyrie', 1, 3.90, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\valkiria.webp', NULL),
('J25', 'Verdiguardián anciano|Ancient Greenwarden ', 1, 6.14, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\anciano.webp', NULL),
('J25', '|Magic:The Gathering Foundations Play Booster', 1, 4.08, 'sobre', '../assets\\images\\product\\MTG\\packs\\J25\\sobre-cimientos-play-booster.webp', NULL),
('KLD', 'Kaladesh Booster Box', 1, 110.00, 'caja', '/assets/images/product/MAG/sets/Kaladesh_Box.png', NULL),
('KLD', 'Kaladesh Booster Pack', 1, 4.25, 'sobre', '/assets/images/product/MAG/sets/Kaladesh_Pack.png', NULL),
('KLD', 'Kaladesh Rare Card', 1, 8.00, 'carta', '/assets/images/product/MAG/sets/Kaladesh_Card.png', NULL),
('MH3', 'Arena de la gloria|Arena of Glory ', 1, 10.78, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Arena-de-la-gloria.webp', NULL),
('MH3', 'Bosque MH3|Forest MH3', 1, 0.26, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\bosque-mh3.webp', NULL),
('MH3', 'Caja de sobres de coleccionista de Horizontes de Modern 3|Modern Horizons 3 Collector Booster Box', 1, 385.09, 'caja', '../assets\\images\\product\\MTG\\tins\\MH3\\caja-coleccionista-mh3.webp', NULL),
('MH3', 'Camino de la aniquilación|Path of Annihilation', 1, 0.16, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Camino-de-la-aniquilación.webp', NULL),
('MH3', 'Diluvio tóxico|Toxic Deluge ', 1, 6.45, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Diluvio-tóxico.webp', NULL),
('MH3', 'Estallido de cultivo|Flare of Cultivation ', 1, 1.33, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Estallido-de-cultivo.webp', NULL),
('MH3', 'Estallido de maldad|Flare of Malice ', 1, 2.05, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Estallido-de-maldad.webp', NULL),
('MH3', 'Estallido de negación|Flare of Denial', 1, 7.36, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Estallido-de-negación.webp', NULL),
('MH3', 'Estribaciones boscosas|Wooded Foothills', 1, 11.31, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Estribaciones-boscosas.webp', NULL),
('MH3', 'Felia, pastora jovial|Exuberant Shepherd ', 1, 2.81, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Felia.webp', NULL),
('MH3', 'Fénix del detective|Detective\'s Phoenix ', 1, 2.29, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Fénix-del-detective.webp', NULL),
('MH3', 'Flauta disruptora|Disruptor Flute ', 1, 1.21, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Flauta-disruptora.webp', NULL),
('MH3', 'Incubador de Urza|Urza\'s Incubator', 1, 6.93, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Incubador-de-Urza.webp', NULL),
('MH3', 'Ira de los cielos|Wrath of the Skies', 1, 2.26, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Ira-de-los-cielos.webp', NULL),
('MH3', 'Isla MH3|Island MH3', 1, 0.23, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\isla-mh3.webp', NULL),
('MH3', 'Kaalia de la Vastedad|Kaalia of the Vast ', 1, 1.21, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Kaalia-de-la-Vastedad.webp', NULL),
('MH3', 'Kozilek, la Realidad Rota|Kozilek, the Broken Reality', 1, 4.69, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Kozilek.webp', NULL),
('MH3', 'Laberinto de Ugin|Ugin\'s Labyrinth', 1, 23.00, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Laberinto-de-Ugin.webp', NULL),
('MH3', 'Llanura MH3|Plains MH3', 1, 0.21, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\llanura-mh3.webp', NULL),
('MH3', 'Manada de ocelotes|Ocelot Pride', 1, 34.69, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Manada-de-ocelotes.webp', NULL),
('MH3', 'Medallón de esmeralda|Emerald Medallion', 1, 1.38, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\esmeralda-medallon.webp', NULL),
('MH3', 'Medallón de rubíes|Ruby Medallion', 1, 4.69, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Medallón-de-rubíes.webp', NULL),
('MH3', 'Medallón de zafiros|Sapphire Medallion', 1, 2.28, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Medallón-de-zafiros.webp', NULL),
('MH3', 'Modern Horizons 3 Booster Box', 1, 55.00, 'caja', '../assets/images/product/MTG/tins/MH3/mh3-booster-box.webp', NULL),
('MH3', 'Montaña MH3|Mountain MH3', 1, 0.22, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Montaña-mh3.webp', NULL),
('MH3', 'Mortigoyf|Nethergoyf ', 1, 20.73, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Mortigoyf.webp', NULL),
('MH3', 'Nadu, Sabiduría Alada|Nadu, Winged Wisdom', 1, 0.92, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Nadu.webp', NULL),
('MH3', 'Ondas de muerte viviente|Ripples of Undeath ', 1, 2.25, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Ondas-de-muerte-viviente.webp', NULL),
('MH3', 'Pantano MH3|Swamp MH3', 1, 0.22, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\pantano-mh3.webp', NULL),
('MH3', 'Pesadilla ctónica|Chthonian Nightmare', 1, 1.72, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Pesadilla-ctónica.webp', NULL),
('MH3', 'Phlage,titán de la furia del fuego|Phlage,Titan of Fire\'s Fury ', 1, 21.41, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Phlage.webp', NULL),
('MH3', 'Playa anegada|Flooded Strand', 1, 10.46, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Playa-anegada.webp', NULL),
('MH3', 'Protector silvestre|Sylvan Safekeeper', 1, 1.79, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Protector-silvestre.webp', NULL),
('MH3', 'Reclusión de Ugin|Ugin\'s Binding ', 1, 2.15, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Reclusión-de-Ugin.webp', NULL),
('MH3', 'Relegar a la memoria|Consign to Memory', 1, 5.18, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Relegar-a-la-memoria.webp', NULL),
('MH3', 'Ritual de nacimiento|Birthing Ritual ', 1, 5.70, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Ritual-de-nacimiento.webp', NULL),
('MH3', 'Rueda del potencial|Wheel of Potential', 1, 0.23, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Rueda-del-potencial.webp', NULL),
('MH3', 'Seis|Six', 1, 3.13, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Seis.webp', NULL),
('MH3', 'Serenata del strix|Strix Serenade', 1, 1.33, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Serenata-del-strix.webp', NULL),
('MH3', 'Sobre de Coleccionista Booster Sample Modern 3|Modern Horizons 3 Collector Booster Sample Pack ', 1, 5.26, 'sobre', '../assets\\images\\product\\MTG\\packs\\MH3\\packs-c-booster-sample.webp', NULL),
('MH3', 'Sobre de coleccionista de Horizontes de Modern 3|Modern Horizons 3 Collector Booster', 1, 34.44, 'sobre', '../assets\\images\\product\\MTG\\packs\\MH3\\packs-collector-booster-mh3.webp', NULL),
('MH3', 'Sobre de juego de Horizontes de Modern 3|Modern Horizons 3 Play Booster ', 1, 7.20, 'sobre', '../assets\\images\\product\\MTG\\packs\\MH3\\packs-play-booster-mh3.webp', NULL),
('MH3', 'Sobre Prerelease Promo de Modern 3|Modern Horizons 3: Prerelease Promo Cards Booster ', 1, 13.59, 'sobre', '../assets\\images\\product\\MTG\\packs\\MH3\\packs-prerelease.webp', NULL),
('MH3', 'Sombra del Segundo Sol|Shadow of the Second Sun', 1, 1.04, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Sombra-del-Segundo.webp', NULL),
('MH3', 'Torre pirexiana|Phyrexian Tower', 1, 16.17, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Torre-pirexiana.webp', NULL),
('MH3', 'Ulamog, el Profanador|Ulamog, the Defiler ', 1, 22.52, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\Ulamog-el-Profanador.webp', NULL),
('MH3', 'Vislumbrar lo imposible|Glimpse the Impossible ', 1, 0.17, 'carta', '../assets\\images\\product\\MTG\\cards\\MH3\\vislumbrar-lo-imposible.webp', NULL),
('OP08', 'Caja Two Legends Booster Box Case (12x Booster Box) | Two Legends Booster Box Case (12x Booster Box)', 5, 775.19, 'caja', '../assets\\images\\product\\OP\\tins\\OP08\\caja-2legends-box-case.webp', NULL),
('OP08', 'Caja Two Legends Booster Box|Two Legends Booster Box', 5, 68.98, 'caja', '../assets\\images\\product\\OP\\tins\\OP08\\Caja-2legends.webp', NULL),
('OP08', 'Charlotte Linlin OP08|Charlotte Linlin OP08', 5, 4.96, 'carta', '../assets\\images\\product\\OP\\cards\\OP08\\Charlotte-Linlin-op08.webp', NULL),
('OP08', 'Charlotte Pudding OP08|Charlotte Pudding OP08', 5, 14.47, 'carta', '../assets\\images\\product\\OP\\cards\\OP08\\charlotte-op08.webp', NULL),
('OP08', 'Edward Newgate OP08|Edward Newgate OP08', 5, 0.32, 'carta', '../assets\\images\\product\\OP\\cards\\OP08\\Edward-op08.webp', NULL),
('OP08', 'Kaido OP08|Kaido OP08', 5, 1.06, 'carta', '../assets\\images\\product\\OP\\cards\\OP08\\kaido-op08.webp', NULL),
('OP08', 'Nami OP08| Nami OP08', 5, 7.37, 'carta', '../assets\\images\\product\\OP\\cards\\OP08\\nami-op08.webp', NULL),
('OP08', 'Pedro OP08|Pedro OP08', 5, 0.10, 'carta', '../assets\\images\\product\\OP\\cards\\OP08\\pedro-op08.webp', NULL),
('OP08', 'Portgas.D.Ace OP08|Portgas.D.Ace OP08', 5, 0.10, 'carta', '../assets\\images\\product\\OP\\cards\\OP08\\ace-op08.webp', NULL),
('OP08', 'Sobre Two Legends Booster|Two Legends Booster', 5, 1.80, 'sobre', '../assets\\images\\product\\OP\\packs\\OP08\\sobre-2legends.webp', NULL),
('OP08', 'Sobre Two Legends Sleeved Booster|Two Legends Sleeved Booster', 5, 4.41, 'sobre', '../assets\\images\\product\\OP\\packs\\OP08\\sobre-2legends-sleeved.webp', NULL),
('OP09', 'Black Hole|Black Hole', 5, 0.10, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Black-Hole.webp', NULL),
('OP09', 'Boa Hancock|Boa Hancock', 5, 110.39, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Boa.webp', NULL),
('OP09', 'Brook|Brook', 5, 0.02, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Brook.webp', NULL),
('OP09', 'Buggy|Buggy', 5, 284.87, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Buggy.webp', NULL),
('OP09', 'Crocodile|Crocodile', 5, 6.15, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Crocodile.webp', NULL),
('OP09', 'Cross Guild |Cross Guild', 5, 0.09, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Cross-Guild.webp', NULL),
('OP09', 'Dereshi!|Dereshi!', 5, 0.14, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Dereshi.webp', NULL),
('OP09', 'Dracule Mihawk|Dracule Mihawk', 5, 6.26, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Dracule-Mihawk.webp', NULL),
('OP09', 'Emperors in the New World Booster', 5, 2.20, 'sobre', '../assets\\images\\product\\OP\\packs\\OP09\\sobre-op09.webp', NULL),
('OP09', 'Emperors in the New World Booster Box', 5, 96.99, 'caja', '../assets\\images\\product\\OP\\tins\\OP09\\caja-op09.webp', NULL),
('OP09', 'Emperors in the New World Booster Box Case (12x Booster Box)', 5, 1125.36, 'caja', '../assets\\images\\product\\OP\\tins\\OP09\\caja2-op09.webp', NULL),
('OP09', 'Emperors in the New World Sleeved Booster', 5, 12.20, 'sobre', '\\../assets\\images\\product\\OP\\packs\\OP09\\sobre-2-op09.webp', NULL),
('OP09', 'Franky|Franky', 5, 7.19, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Franky.webp', NULL),
('OP09', 'Fullalead|Fullalead', 5, 0.07, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Fullalead.webp', NULL),
('OP09', 'Gol.D.Roger|Gol.D.Roger', 5, 2000.00, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Gol.D.Roger.webp', NULL),
('OP09', 'Gum-Gum Giant|Gum-Gum Giant', 5, 0.82, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Gum-Gum.webp', NULL),
('OP09', 'Jesus Burgess|Jesus Burgess', 5, 0.13, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Jesus-Burgess.webp', NULL),
('OP09', 'Jinbe|Jinbe', 5, 0.05, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Jinbe.webp', NULL),
('OP09', 'Marco|Marco', 5, 0.04, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Marco.webp', NULL),
('OP09', 'Marshall.D.Teach|Marshall.D.Teach', 5, 478.76, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Marshall.D.Teach.webp', NULL),
('OP09', 'Mr.3(Galdino)|Mr.3(Galdino)', 5, 0.08, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Mr.-(Galdino).webp', NULL),
('OP09', 'My Era...Begins!!|My Era...Begins!!', 5, 0.18, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\My-Era-Begins.webp', NULL),
('OP09', 'Nami|Nami', 5, 148.36, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Nami.webp', NULL),
('OP09', 'Nico Robin|Nico Robin', 5, 23.94, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\nico-robin.webp', NULL),
('OP09', 'Portgas.D.Ace|Portgas.D.Ace', 5, 0.05, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Portgas-D-Ace.webp', NULL),
('OP09', 'Red Force|Red Force ', 5, 0.03, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Red-Force.webp', NULL),
('OP09', 'Sabo|Sabo', 5, 0.05, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Sabo.webp', NULL),
('OP09', 'Sanji|Sanji', 5, 14.07, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Sanji.webp', NULL),
('OP09', 'Shanks|Shanks', 5, 423.89, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\shanks.webp', NULL),
('OP09', 'Thousand Sunny|Thousand Sunny', 5, 0.05, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Thousand-Sunny.webp', NULL),
('OP09', 'Tony Tony.Chopper|Tony Tony.Chopper ', 5, 0.08, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Tony-Tony-Chopper .webp', NULL),
('OP09', 'Trafalgar Law|Trafalgar Law ', 5, 0.32, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Trafalgar-Law.webp', NULL),
('OP09', 'Uta|Uta', 5, 0.09, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\uta.webp', 2.00),
('OP09', 'Yasopp|Yasopp', 5, 0.32, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Yasopp.webp', NULL),
('OP09', 'Zoro-Juurou|Zoro-Juurou', 5, 84.74, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Zoro-Juurou.webp', NULL),
('OP16', 'Uta Starter Deck', 5, 35.99, 'caja', '../assets/images/product/OP/packs/OP16/uta-starter-deck.webp', NULL),
('OTJ', 'A la hora señalada|High Noon ', 1, 0.93, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\A-la-hora-señalada.webp', NULL),
('OTJ', 'Accidente desafortunado|Unfortunate Accident', 1, 0.10, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Accidente-desafortunado.webp', NULL),
('OTJ', 'Annie se une al equipo|Annie Joins Up', 1, 2.19, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Annie-se-une-al-equipo.webp', NULL),
('OTJ', 'Apariciones emergentes|Emergent Haunting', 1, 0.05, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Apariciones-emergentes.webp', NULL),
('OTJ', 'Árynx entrenada|Trained Arynx ', 1, 0.05, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Árynx.webp', NULL),
('OTJ', 'Atalaya inspiradora|Inspiring Vantage ', 1, 2.49, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Atalaya-inspiradora.webp', NULL),
('OTJ', 'Avalancha de miedo|Rush of Dread ', 1, 0.57, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Avalancha-de-miedo.webp', NULL),
('OTJ', 'Avaricia insaciable|Insatiable Avarice', 1, 3.81, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Avaricia-insaciable.webp', NULL),
('OTJ', 'Batea de oro|Gold Pan', 1, 0.11, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Batea-de-oro.webp', NULL),
('OTJ', 'Bosque OTJ|Forest OTJ', 1, 0.39, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\bosque-otj.webp', NULL),
('OTJ', 'Botas de espuelava|Lavaspur Boots ', 1, 1.64, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Botas.webp', NULL),
('OTJ', 'Cactarántula|Cactarantula ', 1, 0.11, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Cactarántula.webp', NULL),
('OTJ', 'Caja de sobres de coleccionista de Forajidos de Cruce de Truenos|Outlaws of Thunder Junction Collector Booster Box ', 1, 118.11, 'caja', '../assets\\images\\product\\MTG\\tins\\OTJ\\caja-otj-2.webp', NULL),
('OTJ', 'Caja de sobres de juego de Forajidos de Cruce de Truenos|Outlaws of Thunder Junction Play Booster Box', 1, 118.51, 'caja', '../assets\\images\\product\\MTG\\tins\\OTJ\\caja-otj.webp', NULL),
('OTJ', 'Campaña de intimidación|Intimidation Campaign ', 1, 0.12, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Campaña-de-intimidación.webp', NULL),
('OTJ', 'Canal riscoaguja|Spirebluff Canal', 1, 3.48, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Canal-riscoaguja.webp', NULL),
('OTJ', 'Cenagal floreciente|Blooming Marsh ', 1, 2.72, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Cenagal-floreciente.webp', NULL),
('OTJ', 'Creído de los Tirográcil|Slickshot Show-Off', 1, 10.05, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Creído-de-los-Tirográcil.webp', NULL),
('OTJ', 'Devolver la cortesía|Return the Favor', 1, 1.05, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Devolver-la-cortesía.webp', NULL),
('OTJ', 'Duelista de la mente|Duelist of the Mind ', 1, 0.29, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Duelista.webp', NULL),
('OTJ', 'Edu Espinoso, sembrador de púas|Bristly Bill, Spine Sower', 1, 24.83, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Edu-Espinoso.webp', NULL),
('OTJ', 'Égida asimiladora|Assimilation Aegis', 1, 0.98, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Égida-asimiladora.webp', NULL),
('OTJ', 'Enfrentamiento decisivo|Final Showdown', 1, 6.34, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Enfrentamiento-decisivo.webp', NULL),
('OTJ', 'Fblthp,perdido en la intemperie|Fblthp,Lost on the Range', 1, 0.23, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Fblthp.webp', NULL),
('OTJ', 'Forajidos de Cruce de Truenos: Prerelease Promo Cards Booster|Outlaws of Thunder Junction: Prerelease Promo Cards Booster ', 1, 4.22, 'sobre', '../assets\\images\\product\\MTG\\packs\\OTJ\\sobre-promo.webp', NULL),
('OTJ', 'Gran asalto al tren|Great Train Heist', 1, 2.02, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Gran-asalto-al-tren.webp', NULL),
('OTJ', 'Hacienda móvil|Mobile Homestead ', 1, 0.11, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Hacienda-móvil.webp', NULL),
('OTJ', 'Isla OTJ|Island OTJ', 1, 0.25, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\isla-otj.webp', NULL),
('OTJ', 'Lazo de truenos|Thunder Lasso ', 1, 0.08, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Lazo-de-truenos.webp', NULL),
('OTJ', 'Llanura OTJ|Plains OTJ', 1, 0.35, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\llanura-otj.webp', NULL),
('OTJ', 'Me las pagarás|Hell to Pay', 1, 0.33, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Me-las-pagarás.webp', NULL),
('OTJ', 'Montaña OTJ|Mountain OTJ', 1, 0.35, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\montaña-otj.webp', NULL),
('OTJ', 'Montes espinosos|Bristling Backwoods ', 1, 0.16, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Montes-espinosos.webp', NULL),
('OTJ', 'Pantano OTJ|Swamp OTJ ', 1, 0.28, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Pantano-otj.webp', NULL);
INSERT INTO `productos` (`codExpansion`, `nombreProducto`, `idJuego`, `precio`, `tipo`, `urlImagen`, `descuento`) VALUES
('OTJ', 'Planear el golpe|Plan the Heist ', 1, 0.06, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Planear-el-golpe.webp', NULL),
('OTJ', 'Rakdos se une al equipo|Rakdos Joins Up', 1, 0.39, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Rakdos-se-une-al-equipo.webp', NULL),
('OTJ', 'Rakdos,la fuerza bruta|Rakdos,the Muscle', 1, 1.75, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Rakdos.webp', NULL),
('OTJ', 'Riscos deteriorados|Abraded Bluffs ', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Riscos-deteriorados.webp', NULL),
('OTJ', 'Saquear la ciénaga|Pillage the Bog', 1, 0.69, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Saquear-la-ciénaga.webp', NULL),
('OTJ', 'Satoru,el infiltrador|Satoru,the Infiltrator', 1, 2.44, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Satoru-el-infiltrador.webp', NULL),
('OTJ', 'Sierpe de cascabel colosal|Colossal Rattlewurm', 1, 0.21, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Sierpe-de-cascabel-colosal.webp', NULL),
('OTJ', 'Sobre de coleccionista de Forajidos de Cruce de Truenos Sample Pack|Outlaws of Thunder Junction Collector Booster Sample Pack', 1, 4.24, 'sobre', '../assets\\images\\product\\MTG\\packs\\OTJ\\sobre-collector-booster.webp', NULL),
('OTJ', 'Sobre de coleccionista de Forajidos de Cruce de Truenos|Outlaws of Thunder Junction Collector Booster ', 1, 18.91, 'sobre', '../assets\\images\\product\\MTG\\packs\\OTJ\\sobre-collector.webp', NULL),
('OTJ', 'Sobre de juego de Forajidos de Cruce de Truenos|Outlaws of Thunder Junction Play Booster', 1, 4.06, 'sobre', '../assets\\images\\product\\MTG\\packs\\OTJ\\sobre-play-booster.webp', NULL),
('OTJ', 'Sorpresa de la contrabandista|Smuggler\'s Surprise ', 1, 3.08, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Sorpresa-de-la-contrabandista.webp', NULL),
('OTJ', 'Terror de las cimas|Terror of the Peaks', 1, 16.73, 'carta', '../assets\\images\\product\\MTG\\cards\\OTJ\\Terror-de-las-cimas.webp', NULL),
('PIP', 'Acto blasfemo|Blasphemous Act', 1, 3.13, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Acto-blasfemo.webp', NULL),
('PIP', 'Albóndiga, siempre leal|Dogmeat, Ever Loyal', 1, 0.33, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\albondiga.webp', NULL),
('PIP', 'Arboleda Pétalo Solar|Sunpetal Grove ', 1, 2.00, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Arboleda-Pétalo-Solar.webp', NULL),
('PIP', 'Bien descansada|Well Rested ', 1, 2.65, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Bien-descansada.webp', NULL),
('PIP', 'Bosque PIP|Forest PIP', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\bosque.webp', NULL),
('PIP', 'Cabezón: percepción|Perception Bobblehead ', 1, 0.97, 'carta', 'Cabezón-percepción.webp', NULL),
('PIP', 'Cait,luchadora de la jaula|Cait,Cage Brawler ', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Cait.webp', NULL),
('PIP', 'Carroñero supermutante|Super Mutant Scavenger', 1, 0.09, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Carroñero.webp', NULL),
('PIP', 'Catacumba inundada|Drowned Catacomb ', 1, 2.24, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Catacumba-inundada.webp', NULL),
('PIP', 'César, emperador de la Legión|Caesar, Legion\'s Emperor ', 1, 0.72, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\cesar.webp', NULL),
('PIP', 'Ciudad Escoria|Junktown', 1, 0.18, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Ciudad-Escoria.webp', NULL),
('PIP', 'Comandante Sofia Daguerre|Commander Sofia Daguerre', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\sofia.webp', NULL),
('PIP', 'Contaminación nuclear|Nuclear Fallout ', 1, 2.13, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Contaminación-nuclear.webp', NULL),
('PIP', 'Cultivar|Cultivate', 1, 0.63, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Cultivar.webp', NULL),
('PIP', 'Dictado severo|Austere Command ', 1, 0.50, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Dictado-severo.webp', NULL),
('PIP', 'Disputa mortal|Deadly Dispute', 1, 2.01, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Disputa-mortal.webp', NULL),
('PIP', 'Espadas en guadañas|Swords to Plowshares ', 1, 1.26, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\espadas.webp', NULL),
('PIP', 'Grebas relámpago|Lightning Greaves', 1, 5.28, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Grebas-relámpago.webp', NULL),
('PIP', 'Hancock,alcalde necrófago|Hancock,Ghoulish Mayor', 1, 0.28, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Hancock.webp', NULL),
('PIP', 'Ian el Temerario|Ian the Reckless', 1, 0.17, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\ian.webp', NULL),
('PIP', 'Intervención heroica|Fallout - Heroic Intervention', 1, 9.54, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Intervención-heroica.webp', NULL),
('PIP', 'Isla PIP|Island PIP', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\isla.webp', NULL),
('PIP', 'Jason el Iluminado,profeta resplandeciente|Jason Bright,Glowing Prophet ', 1, 0.20, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Jason.webp', NULL),
('PIP', 'La Duquesa,tabernera del Wayward|Duchess,Wayward Tavernkeep', 1, 0.17, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\La-Duquesa.webp', NULL),
('PIP', 'Llanura PIP|Plains PIP', 1, 0.16, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\llanura.webp', NULL),
('PIP', 'Maestre Owyn Lyons|Elder Owyn Lyons ', 1, 0.20, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Maestre-Owyn-Lyons.webp', NULL),
('PIP', 'Máquina expendedora de Nuka-Cola|Nuka-Cola Vending Machine', 1, 14.86, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\nuka-cola.webp', NULL),
('PIP', 'Marea inexorable|Inexorable Tide ', 1, 2.90, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Marea-inexorable.webp', NULL),
('PIP', 'Mercado negro|Black Market ', 1, 2.09, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Mercado-negro.webp', NULL),
('PIP', 'Montaña PIP|Mountain PIP', 1, 0.16, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\motaña.webp', NULL),
('PIP', 'Mulo|Strong Back', 1, 1.89, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Mulo.webp', NULL),
('PIP', 'Paisaje infinito|Myriad Landscape ', 1, 0.17, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Paisaje-infinito.webp', NULL),
('PIP', 'Pantano PIP|Swamp PIP', 1, 0.25, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\pantano.webp', NULL),
('PIP', 'Pip-Boy 3000', 1, 3.30, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\pip-boy.webp', NULL),
('PIP', 'Proyecto Guardián|Guardian Project', 1, 6.46, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Proyecto-Guardián.webp', NULL),
('PIP', 'Sierra,fan absoluta de Nuka|Sierra,Nuka\'s Biggest Fan', 1, 0.21, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Sierra.webp', NULL),
('PIP', 'Tormenta radiactiva|Radstorm ', 1, 3.92, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Tormenta-radiactiva.webp', NULL),
('PIP', 'Traje de Mortaja Plateada|Silver Shroud Costume', 1, 9.36, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\traje.webp', NULL),
('PIP', 'Ultimátum ruinoso|Ruinous Ultimatum', 1, 2.68, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Ultimátum-ruinoso.webp', NULL),
('PIP', 'Universes Beyond: Fallout Collector Booster', 1, 44.99, 'sobre', '../assets\\images\\product\\MTG\\packs\\PIP\\sobre-collect.webp', NULL),
('PIP', 'Universes Beyond: Fallout Collector Booster Box', 1, 587.77, 'caja', '../assets\\images\\product\\MTG\\tins\\PIP\\caja-pip.webp', NULL),
('PIP', 'Universes Beyond: Fallout Collector Booster Sample Pack', 1, 4.68, 'sobre', '../assets\\images\\product\\MTG\\packs\\PIP\\sobre-pip.webp', NULL),
('PIP', 'Valle Fuegomusgo|Mossfire Valley', 1, 0.20, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\Valle-Fuegomusgo.webp', NULL),
('PIP', 'Ventaja mutacional|Mutational Advantage', 1, 3.37, 'carta', '../assets\\images\\product\\MTG\\cards\\PIP\\ventaja-mutacional.webp', NULL),
('PNBP', 'Phantom Nightmare Booster Pack', 2, 3.99, 'sobre', '../assets/images/product/YGO/packs/phantom-nightmare-booster-pack.jpg', NULL),
('SCR', 'Stellar Crown Booster Box', 3, 120.00, 'caja', '/assets/images/product/POK/sets/Stellar_Crown_Box.png', NULL),
('SCR', 'Stellar Crown Booster Pack', 3, 4.00, 'sobre', '/assets/images/product/POK/sets/Stellar_Crown_Pack.png', NULL),
('SCR', 'Stellar Crown Promo Card', 3, 10.00, 'carta', '/assets/images/product/POK/sets/Stellar_Crown_Card.png', NULL),
('SDSB', 'Mago Oscuro,Dark Magician', 2, 3.50, 'carta', '../assets\\images\\product\\YGO\\cards\\SDSB\\Mago-oscuro.webp', NULL),
('SDWD', 'Blue-Eyes White Destiny Box', 2, 130.00, 'caja', '/assets/images/product/YGO/sets/Blue_Eyes_Box.png', NULL),
('SDWD', 'Blue-Eyes White Destiny Pack', 2, 5.00, 'sobre', '/assets/images/product/YGO/sets/Blue_Eyes_Pack.png', NULL),
('SDWD', 'Blue-Eyes White Dragon', 2, 25.00, 'carta', '/assets/images/product/YGO/sets/Blue_Eyes_Card.png', NULL),
('SFA', 'Bewear|Bewear', 3, 5.29, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\Bewear.webp', NULL),
('SFA', 'Cresselia|Cresselia', 3, 13.60, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\Cresselia.webp', NULL),
('SFA', 'Cufant|Cufant', 3, 6.55, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\Cufant.webp', NULL),
('SFA', 'Dusclops|Dusclops', 3, 15.36, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\Dusclops.webp', NULL),
('SFA', 'Dusknoir|Dusknoir', 3, 19.13, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\Dusknoir.webp', NULL),
('SFA', 'Fezandipiti ex|Fezandipiti ex', 3, 7.51, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\Fezandipiti_ex.webp', NULL),
('SFA', 'Fraxure|Fraxure', 3, 7.15, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\Fraxure.webp', NULL),
('SFA', 'Horsea|Horsea', 3, 15.89, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\Horsea.webp', NULL),
('SFA', 'Kingdra|Kingdra', 3, 2.85, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\\r\nKingdra.webp', NULL),
('SFA', 'Okidogi ex|Okidogi ex', 3, 19.08, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\Okidogi_ex.webp', NULL),
('SFA', 'Persian|Persian', 3, 27.78, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\persian.webp', NULL),
('SFA', 'Sylveon|Sylveon', 3, 0.05, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\Sylveon.webp', NULL),
('SFA', 'Zorua|Zorua', 3, 10.77, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\Zorua.webp', NULL),
('SSMMG', 'Marnie\'s Morpeko & Grimmsnarl EX Booster Pack', 3, 3.99, 'sobre', '../assets/images/product/POK/tins/SSMMG/marnie-morpeko-grimmsnarl-ex.png', NULL),
('SSPK', 'Surging Sparks Booster Pack', 3, 4.50, 'sobre', '/assets/images/product/POK/sets/Surging_Sparks_Pack.png', NULL),
('SSPK', 'Surging Sparks Deck', 3, 15.00, 'caja', '/assets/images/product/POK/sets/Surging_Sparks_Deck.png', NULL),
('SSPK', 'Surging Sparks Exclusive Card', 3, 12.00, 'carta', '/assets/images/product/POK/sets/Surging_Sparks_Card.png', NULL),
('SSSBM', 'Steven\'s Beldum & Metagross EX Booster Pack', 3, 3.99, 'sobre', '../assets/images/product/POK/tins/SSSBM/starter-set-ex-stevens-beldum-metagross-ex.jpg', NULL),
('TFC', '|Stitch -Carefree Surfer', 4, 7.90, 'carta', '../assets\\images\\product\\LOR\\cards\\TFC\\stitch.webp', 6.00),
('UR', 'Ursula\'s Return Tin', 4, 19.99, 'caja', '../assets/images/product/LOR/tins/UR/ursula-tin.webp', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sobre`
--

CREATE TABLE `sobre` (
  `codExpansion` varchar(100) NOT NULL,
  `nombreProducto` varchar(255) NOT NULL,
  `numCartas` int(11) NOT NULL,
  `idJuego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sobre`
--

INSERT INTO `sobre` (`codExpansion`, `nombreProducto`, `numCartas`, `idJuego`) VALUES
('ACR', 'Sobre de coleccionista de Más allá del Multiverso: Assassin\'s Creed|Universes Beyond: Assassin\'s Creed Collector Booster', 10, 1),
('ACR', 'Sobre de Más allá de Multiverso:Assassin\'s Creed|Universes Beyond:Assassin\'s Creed Beyond Booster', 7, 1),
('BLB', 'Bloomburrow: Prerelease Promo Cards Booster', 14, 1),
('BLB', 'Sobre de coleccionista de Bloomburrow | Bloomburrow Collector Booster', 15, 1),
('BLB', 'Sobre de juego de Bloomburrow | Bloomburrow Play Booster ', 14, 1),
('DFT', 'Sobre Aetherdrift Prerelease|Aetherdrift Prerelease Promo Cards Booster', 14, 1),
('DFT', 'Sobre de Box Topper de Aetherdrift | Aetherdrift Box Topper Booster ', 15, 1),
('DFT', 'Sobre de coleccionista de Aetherdrift | Aetherdrift Collector Booster', 15, 1),
('DFT', 'Sobre de juego de Aetherdrift | Aetherdrift Play Booster', 14, 1),
('DSK', 'Duskmourn:House of Horror Collector Booster', 15, 1),
('DSK', 'Duskmourn:House of Horror Play Booster', 14, 1),
('DSK', 'Duskmourn:Nightmare Bundle Booster', 15, 1),
('DSK', 'Duskmourn:Prerelease Promo Cards Booster', 15, 1),
('INR', 'Sobre de coleccionista de Innistrad remasterizada|Innistrad Remastered Collector Booster', 15, 1),
('INR', 'Sobre de juego de Innistrad remasterizada|Innistrad Remastered Play Booster', 14, 1),
('J25', 'Sobre de Jumpstart de Magic:The Gathering Cimientos,Magic: The Gathering|Foundations Jumpstart Booster ', 20, 1),
('J25', '|Magic:The Gathering Foundations Play Booster', 14, 1),
('MH3', 'Sobre de Coleccionista Booster Sample Modern 3|Modern Horizons 3 Collector Booster Sample Pack ', 14, 1),
('MH3', 'Sobre de coleccionista de Horizontes de Modern 3|Modern Horizons 3 Collector Booster', 15, 1),
('MH3', 'Sobre de juego de Horizontes de Modern 3|Modern Horizons 3 Play Booster ', 14, 1),
('MH3', 'Sobre Prerelease Promo de Modern 3|Modern Horizons 3: Prerelease Promo Cards Booster ', 14, 1),
('OP08', 'Sobre Two Legends Booster|Two Legends Booster', 12, 5),
('OP08', 'Sobre Two Legends Sleeved Booster|Two Legends Sleeved Booster', 12, 5),
('OP09', 'Emperors in the New World Booster', 12, 5),
('OP09', 'Emperors in the New World Sleeved Booster', 12, 5),
('OTJ', 'Forajidos de Cruce de Truenos: Prerelease Promo Cards Booster|Outlaws of Thunder Junction: Prerelease Promo Cards Booster ', 15, 1),
('OTJ', 'Sobre de coleccionista de Forajidos de Cruce de Truenos Sample Pack|Outlaws of Thunder Junction Collector Booster Sample Pack', 14, 1),
('OTJ', 'Sobre de coleccionista de Forajidos de Cruce de Truenos|Outlaws of Thunder Junction Collector Booster ', 15, 1),
('OTJ', 'Sobre de juego de Forajidos de Cruce de Truenos|Outlaws of Thunder Junction Play Booster', 14, 1),
('PIP', 'Universes Beyond: Fallout Collector Booster', 15, 1),
('PIP', 'Universes Beyond: Fallout Collector Booster Sample Pack', 14, 1),
('PNBP', 'Phantom Nightmare Booster Pack', 9, 2),
('SSMMG', 'Marnie\'s Morpeko & Grimmsnarl EX Booster Pack', 10, 3),
('SSSBM', 'Steven\'s Beldum & Metagross EX Booster Pack', 10, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` int(12) NOT NULL,
  `role` int(1) NOT NULL,
  `image-url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`email`, `username`, `password`, `phone`, `role`, `image-url`) VALUES
('deathcannon661@gmail.com', 'AnotherOne661', '$2y$10$tTx5z/VdTHxLpBfdXQiCk.Dl8fFA9GM6WRtAfoqzz7GFnHjeGOirS', 691504569, 0, '/assets/images/uploads/user-placeholder.webp'),
('something@example.org', 'another', '1234', 324, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_addresses`
--

CREATE TABLE `user_addresses` (
  `email` varchar(255) NOT NULL,
  `idAddress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_addresses`
--

INSERT INTO `user_addresses` (`email`, `idAddress`) VALUES
('something@example.org', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`idAddress`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`codExpansion`,`nombreProducto`),
  ADD KEY `idJuego` (`idJuego`);

--
-- Indices de la tabla `carta`
--
ALTER TABLE `carta`
  ADD PRIMARY KEY (`codExpansion`,`nombreProducto`),
  ADD KEY `idJuego` (`idJuego`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`idEvento`);

--
-- Indices de la tabla `expansiones`
--
ALTER TABLE `expansiones`
  ADD PRIMARY KEY (`codExpansion`),
  ADD KEY `idJuego` (`idJuego`);

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`idJuego`);

--
-- Indices de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD PRIMARY KEY (`codExpansion`,`nombreProducto`),
  ADD KEY `idJuego` (`idJuego`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codExpansion`,`nombreProducto`),
  ADD KEY `idJuego` (`idJuego`);

--
-- Indices de la tabla `sobre`
--
ALTER TABLE `sobre`
  ADD PRIMARY KEY (`codExpansion`,`nombreProducto`),
  ADD KEY `idJuego` (`idJuego`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`email`,`idAddress`),
  ADD KEY `idAddress` (`idAddress`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`codExpansion`,`nombreProducto`) REFERENCES `productos` (`codExpansion`, `nombreProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `caja_ibfk_2` FOREIGN KEY (`idJuego`) REFERENCES `juegos` (`idJuego`);

--
-- Filtros para la tabla `carta`
--
ALTER TABLE `carta`
  ADD CONSTRAINT `carta_ibfk_1` FOREIGN KEY (`codExpansion`,`nombreProducto`) REFERENCES `productos` (`codExpansion`, `nombreProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carta_ibfk_2` FOREIGN KEY (`idJuego`) REFERENCES `juegos` (`idJuego`);

--
-- Filtros para la tabla `expansiones`
--
ALTER TABLE `expansiones`
  ADD CONSTRAINT `expansiones_ibfk_1` FOREIGN KEY (`idJuego`) REFERENCES `juegos` (`idJuego`);

--
-- Filtros para la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD CONSTRAINT `ofertas_ibfk_1` FOREIGN KEY (`codExpansion`,`nombreProducto`) REFERENCES `productos` (`codExpansion`, `nombreProducto`),
  ADD CONSTRAINT `ofertas_ibfk_2` FOREIGN KEY (`idJuego`) REFERENCES `juegos` (`idJuego`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`codExpansion`) REFERENCES `expansiones` (`codExpansion`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idJuego`) REFERENCES `expansiones` (`idJuego`);

--
-- Filtros para la tabla `sobre`
--
ALTER TABLE `sobre`
  ADD CONSTRAINT `sobre_ibfk_1` FOREIGN KEY (`codExpansion`,`nombreProducto`) REFERENCES `productos` (`codExpansion`, `nombreProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sobre_ibfk_2` FOREIGN KEY (`idJuego`) REFERENCES `juegos` (`idJuego`);

--
-- Filtros para la tabla `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_addresses_ibfk_2` FOREIGN KEY (`idAddress`) REFERENCES `addresses` (`idAddress`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
