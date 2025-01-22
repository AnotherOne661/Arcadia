DROP DATABASE IF EXISTS arcadia;
CREATE DATABASE arcadia;
USE arcadia;


-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-01-2025 a las 11:43:37
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

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
('DSK', 'Caja de sobres de coleccionista de Duskmourn:La casa de los horrores', 12, 1),
('DSK', 'Caja de sobres de juego de Duskmourn:La casa de los horrores', 36, 1),
('DSK', 'Duskmourn:House of Horror: Nightmare Fat Pack Bundle', 6, 1),
('INFO', 'Infinite Forbidden Box', 520, 2),
('INR', 'Caja de sobres de coleccionista de Innistrad remasterizada,Innistrad Remastered Collector Booster Box ', 12, 1),
('INR', 'Caja de sobres de juego de Innistrad remasterizada,Innistrad Remastered Play Booster Box', 36, 1),
('IXL', 'Ixalan Deck', 60, 1),
('KLD', 'Kaladesh Booster Box', 540, 1),
('MH3', 'Modern Horizons 3 Booster Box', 540, 1),
('OP09', 'Emperors in the New World Booster Box', 24, 5),
('OP09', 'Emperors in the New World Booster Box Case (12x Booster Box)', 288, 5),
('OP16', 'Uta Starter Deck', 50, 5),
('SC', 'Stellar Crown Booster Box', 540, 3),
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
('DSK', 'Armadura etérea,Ethereal Armor ', 1, 'hechizo,encantamiento,aura,uncommon,coste:1{W}'),
('DSK', 'Aspiradora de fantasmas,Ghost Vacuum ', 1, 'artefacto,rare,coste:1{NC}'),
('DSK', 'Avería inoportuna,Untimely Malfunction ', 1, 'hechizo,instant,uncommon,coste:1{NC},1{R}'),
('DSK', 'Bosques sangrantes,Bleeding Woods', 1, 'tierra,common'),
('DSK', 'Brillolinterna,Glimmerlight', 1, 'artefacto,equipamiento,common,coste:2{NC}'),
('DSK', 'Campamento abandonado,Abandoned Campground', 1, 'tierra,common'),
('DSK', 'Cercenador cabezagujas,Razorkin Needlehead', 1, 'criatura,humano asesino,rare,fuerza:2,resistencia:2,coste:2{R}'),
('DSK', 'Consejo demoníaco,Demonic Counsel', 1, 'hechizo,sorcery,rare,coste:1{NC},1{B}'),
('DSK', 'Detonación ígnea,Pyroclasm', 1, 'hechizo,sorcery,uncommon,coste:1{NC},1{R}'),
('DSK', 'Línea mística de la esperanza,Leyline of Hope ', 1, 'hechizo,encantamiento,rare,coste:2{NC},2{W}'),
('DSK', 'Línea mística de la resonancia,Leyline of Resonance ', 1, 'hechizo,encantamiento,rare,coste:2{NC},2{R}'),
('DSK', 'Llaves de la Casa,Keys to the House ', 1, 'artefacto,uncommon,coste:1{NC}'),
('DSK', 'Maizal grabado,Etched Cornfield', 1, 'tierra,common'),
('DSK', 'Némesis de los gritos,Screaming Nemesis ', 1, 'criatura,espiritu,mítico,fuerza:3,resistencia:3,coste:2{NC},1{R}'),
('DSK', 'Ojo aberrante,Abhorrent Oculus ', 1, 'criatura,ojo,mítico,fuerza:5,resistencia:5,coste:2{NC},1{U}'),
('DSK', 'Pantalla poseída,Haunted Screen', 1, 'artefacto,uncommon,coste:3{NC}'),
('DSK', 'Protegido por fantasmas,Sheltered by Ghosts', 1, 'criatura,Soldado Vampiro, uncommon,fuerza:1,resistencia:1,coste:1{NC}1{W}'),
('DSK', 'Separarse,Split Up ', 1, 'hechizo,sorcery,rare,coste:1{NC},2{W}'),
('DSK', 'Sierra,Saw ', 1, 'artefacto,uncommon,coste:2{NC}'),
('DSK', 'Tergiversar la realidad,Twist Reality', 1, 'hechizo,instant,common,coste:1{NC},2{U}'),
('DSK', 'Tormento agotador,Withering Torment ', 1, 'hechizo,instant,uncommon,coste:2{NC},1{B}'),
('DSK', 'Umbral de Cenagalardiente,Blazemire Verge ', 1, 'tierra,mítico'),
('DSK', 'Umbral de Lagosombrío,Gloomlake Verge', 1, 'tierra,mítico'),
('DSK', 'Valgavoth el Devoraterrores,Valgavoth Terror Eater', 1, 'criatura legendaria,elder demon,mítico,fuerza:9,resistencia:9,coste:6{NC},3{B}'),
('INFO', 'Dragón Tenpai Genroku,Tenpai Dragon Genroku', 2, 'criatura,dragon efecto,ultra rare,nivel:3,ataque:0,defensa:1000'),
('INFO', 'Forbidden One', 2, 'Mythic, Forbidden'),
('INR', 'Almas persistentes,Lingering Souls ', 1, 'hechizo,sorcery,uncommon,coste:2{NC},1{W}'),
('INR', 'Artista de la sangre,Blood Artist', 1, 'criatura,vampiro,fuerza:0,resistencia:1,coste:1{NC},1{B}'),
('INR', 'Atravesando la brecha,Through the Breach ', 1, 'hechizo,instant,arcane,mítico,coste:4{NC},1{R}'),
('INR', 'Bosque (V.1),Forest (V.1)', 1, 'tierra básica,G'),
('INR', 'Carácter ardiente,Fiery Temper ', 1, 'hechizo,instant,uncommon,coste:1{NC},2{R}'),
('INR', 'Cazahechizos,Spell Queller ', 1, 'criatura,spirit,rare,fuerza:2,resistencia:3,coste:1{NC},1{W},1{U}'),
('INR', 'Cota de malla demoníaca,Demonmail Hauberk', 1, 'artefacto,equipment,coste:4{NC}'),
('INR', 'Desove arácnido, Spider Spawning ', 1, 'hechizo,sorcery,uncommon,coste:4{NC},1{G}'),
('INR', 'Edgar Markov', 1, 'criatura legendaria,vampire knight,mítico,fuerza:4,resistencia:4,coste:3{NC},1{R},1{W},1{B}'),
('INR', 'Emrakul el Final Prometido,Emrakul the Promised End', 1, 'criatura legendaria,eldrazi,mítico,fuerza:13,resistencia:13,coste:13{NC}'),
('INR', 'Extractor de almas,Soul Separator', 1, 'artefacto,uncommon,coste:3{NC}'),
('INR', 'Flujo de esencia,Essence Flux', 1, 'hechizo,instant,common,coste:1{U}'),
('INR', 'Histeria masiva, Mass Hysteria', 1, 'hechizo,enchantment,rare,coste:1{R}'),
('INR', 'Injerto de suturador,Stitcher\'s Graf', 1, 'artefacto,equipment,rare,coste:1{NC}'),
('INR', 'Isla (V.1),Island (V.1)', 1, 'tierra báscia,U'),
('INR', 'Llanura (V.1),Plains (V.1)', 1, 'tierra básica,W'),
('INR', 'Montaña (V.1), Mountain (V.1)', 1, 'tierra básica,R'),
('INR', 'Mutación espontánea,Spontaneous Mutation ', 1, 'hechizo,enchantment,aura,common,coste:1{U}'),
('INR', 'Navegante certero,Deadeye Navigator', 1, 'criatura,spirit,rare,fuerza:5,resistencia:5,coste:4{NC},2{U}'),
('INR', 'Pantano (V.1),Swamp (V.1)', 1, 'tierra básica,B'),
('INR', 'Pulsión asesina,Murderous Compulsion ', 1, 'hechizo,sorcery,common,coste:1{NC},1{B}'),
('INR', 'Reforjar el alma,Reforge the Soul ', 1, 'hechizo,sorcery,rare,coste:3{NC},2{R}'),
('INR', 'Ritos de pueblo,Village Rites ', 1, 'hechizo,instant,common,coste:1{B}'),
('INR', 'Tentación mortal,Deadly Allure', 1, 'hechizo,sorcery,uncommon,coste:1{B}'),
('INR', 'Trampa luzgeist,Geistlight Snare ', 1, 'hechizo,instant,uncommon,coste:2{NC},1{U}'),
('INR', 'Triscaidecafobia,Triskaidekaphobia', 1, 'hechizo,enchantment,uncommon,coste;3{NC},1{B}'),
('INR', 'Tumba del ángel,Angel\'s Tomb', 1, 'artefacto,uncommon,coste:3{NC}'),
('INR', 'Ventana entablada,Boarded Window', 1, 'artefacto,uncommon,coste:3{NC}'),
('INR', 'Virtud intangible,Intangible Virtue ', 1, 'hechizo,enchantment,uncommon,coste:1{NC},1{W}'),
('IXL', 'Ixalan Mythic Card', 1, 'Dinosaur, Mythic'),
('J25', 'Abrazo de Serra,Serra\'s Embrace', 1, 'hechizo,enchantment,aura,uncommon,coste:2{NC},2{W}'),
('J25', 'Aphelia encantadora de víboras,Aphelia  Viper Whisperer ', 1, 'criatura legendaria,gorgon assassin,mítico,fuerza:1,resistencia:3,coste:1{NC},1{B}'),
('J25', 'Arranque violento,Violent Outburst ', 1, 'hechizo,common,instant,coste;1{NC},1{R},1{G}'),
('J25', 'Bosque,Forest', 1, 'tierra básica'),
('J25', 'Cachorro generoso,Generous Pup ', 1, 'criatura,dog,rare,fuerza:2,resistencia:2,coste:1{NC},1{W}'),
('J25', 'Chupasangre insidioso,Creeping Bloodsucker ', 1, 'criatura,common,vampiro,fuerza:1,resistencia:2,coste:1{NC},1{B}'),
('J25', 'Cólera ancestral,Ancestral Anger', 1, 'hechizo,sorcery,common,coste:1{R}'),
('J25', 'Concentrarse,Concentrate', 1, 'hechizo,sorcery,uncommon,coste:2{NC},2{U}'),
('J25', 'Crecimiento exuberante,Rampant Growth ', 1, 'hechizo,sorcery,common,coste:1{NC},1{G}'),
('J25', 'Cría de felinoguadaña,Scythecat Cub ', 1, 'criatura,gato,rare,fuerza:2,resistencia:2,coste:1{NC},1{G}'),
('J25', 'Escupefuego,Fireshrieker ', 1, 'artefacto,equipment,uncommon,coste:3{NC}'),
('J25', 'Esperanza en extinción,Fading Hope ', 1, 'hechizo,instant,uncommon,coste:1{U}'),
('J25', 'Evereth virreina del saqueo,Evereth Viceroy of Plunder', 1, 'criatura legendaria,vampire soldier,rare,fuerza:2,resistencia:2,coste:2{NC},1{B}'),
('J25', 'Fabricaingenios,Whirlermaker', 1, 'artefacto,uncommon,coste:3{NC}'),
('J25', 'Golpe a la garganta,Go for the Throat ', 1, 'hechizo,instant,coste:1{NC},1{B}'),
('J25', 'Herramientas de ladrón,Thieves\' Tools ', 1, 'artefacto,equipamiento,common,coste:1{NC},1{B}'),
('J25', 'Isla,Island', 1, 'tierra básica'),
('J25', 'Jugar con fuego,Play with Fire ', 1, 'hechizo,instant,coste:1{R}'),
('J25', 'Kodama del árbol del oeste, Kodama of the West Tree', 1, 'criatura legendaria,spirit ,mítico,fuerza:3,resistencia:3,coste:2{NC},1{G}'),
('J25', 'Llamas de la instigadora,Flames of the Firebrand ', 1, 'hechizo,sorcery,uncommon,coste:2{NC},1{R}'),
('J25', 'Maza del valiente,Mace of the Valiant', 1, 'artefacto,equipamiento,rare,coste;2{NC},1{W}'),
('J25', 'Montaña,Mountain', 1, 'tierra básica'),
('J25', 'Pantano,Swamp', 1, 'tierra básica'),
('J25', 'Parcela fúngica,Fungal Plots ', 1, 'hechizo,enchantment,uncommon,coste:1{NC},1{G}'),
('J25', 'Rastro de migajas,Trail of Crumbs ', 1, 'hechizo,enchantment,uncommon,coste:1{NC},1{G}'),
('J25', 'Recuerdo del Starnheim,Starnheim Memento ', 1, 'artefacto,uncommon,coste:3{NC}'),
('J25', 'Reenviar,Remand ', 1, 'hechizo,instant,uncommon,coste:1{NC},1{U}'),
('J25', 'Retirada a Kazandu,Retreat to Kazandu ', 1, 'hechizo,enchantment,uncommon,coste:2{NC},1{G}'),
('J25', 'Rev sacadiezmos,Rev Tithe Extractor ', 1, 'criatura legendaria,human rogue,rare,fuerza:3,resistencia:3,coste:3{NC},1{B}'),
('J25', 'Secuestrado por las hadas,Stolen by the Fae ', 1, 'hechizo,sorcery,rare,coste:X,2{U}'),
('J25', 'Tormento de escarabajos,Torment of Scarabs', 1, 'hechizo,enchantment,aura curse,coste:3{NC},1{B}'),
('J25', 'Valkiria justa,Righteous Valkyrie', 1, 'criatura,rare,angel cleric,fuerza:2,resistencia:4,coste:2{NC},1{W}'),
('J25', 'Verdiguardián anciano,Ancient Greenwarden ', 1, 'criatura,elemental,mítico,fuerza:5,resistencia:7,coste;4{NC},2{G}'),
('KLD', 'Kaladesh Rare Card', 1, 'Artifact, Rare'),
('OP09', 'Boa Hancock', 5, 'personaje,don:6,poder:8000'),
('OP09', 'Buggy', 5, 'personaje,don:10,poder:12000'),
('OP09', 'Franky', 5, 'personaje,don:4,poder:5000'),
('OP09', 'Gol.D.Roger', 5, 'personaje,don:10,poder:13000'),
('OP09', 'Marshall.D.Teach', 5, 'personaje,don:10,poder:12000'),
('OP09', 'Monkey.D.Luffy', 5, 'personaje,don:9,poder:10000'),
('OP09', 'Nami', 5, 'personaje,don:5,poder:5000'),
('OP09', 'Nico Robin', 5, 'lider,poder:5000'),
('OP09', 'Sanji', 5, 'personaje,don:7,poder:7000'),
('OP09', 'Shanks', 5, 'personajes,don:10,poder:12000'),
('OP09', 'Uta', 5, 'personaje,don:1,poder:2000'),
('OP09', 'Zoro-Juurou', 5, 'personaje,don:3,poder:4000'),
('SC', 'Stellar Crown Promo Card', 3, 'Holo, Limited Edition'),
('SDWD', 'Blue-Eyes White Dragon', 2, 'Legendary, Blue-Eyes'),
('SFA', 'Fezandipiti ex', 3, 'pokemon,tipo:siniestro,ex double rare,hp:210,weakness:2{F},retreat:1{N}'),
('SFA', 'Persian', 3, 'pokemon,tipo:normal,hp:110,weakness{2},retreat{1}'),
('SSPK', 'Surging Sparks Exclusive Card', 3, 'Ultra Rare');

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
(1, 'Torneo Pauper Magic: The Gathering', '2025-01-15', 'Inscripción: 5€. 1º Premio: 50€. 2º Premio: 10€. 3º Premio: 3 Booster Packs Foundations, Premio por participar: 1 Booster Pack Foundations', '../assets/product/MGT/events/25-1-15-pauper.jpg'),
(2, 'Lanzamiento de Yu-Gi-Oh! Rage of the Abyss', '2025-01-05', 'Ven a por la nueva entrega de Yu-Gi-Oh!', '../assets/product/YGO/events/25-1-5-ROTA_launch.jpg'),
(3, 'Torneo One Piece TCG', '2025-01-20', 'Inscripción: 10€. 1º Premio: 75€. 2º Premio: 15€. 3º Premio: 5 Booster Packs OP-11, Premio por participar: 1 Booster Pack OP-11', '../assets/product/OP/events/25-1-20-OP.jpg'),
(4, 'Preguntas y respuestas con Artista español de Wizards of The Coast \"Manuel Huedo\"', '2025-01-30', '', '../assets/product/MTG/events/25-1-30-interview.jpg'),
(5, 'Torneo Gratuito de Lorcana', '2025-02-01', 'Inscripción: 0€. 1º Premio: 1 Booster Pack Ursula\'s return', '../assets/product/LOR/events/25-2-1-tournament.jpg');

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
('DSK', 'Duskmourn: La casa de los Horrores, Duskmourn: House of Horror', '2024-09-20', 1, '\\../assets\\images\\product\\MTG\\sets\\DSK\\DSK-ex.webp'),
('INFO', 'Infinite Forbidden', '2024-07-18', 2, '/assets/images/product/YGO/sets/INFO.webp'),
('INR', 'Innistrad Remastered', '2025-01-24', 1, '../assets\\images\\product\\MTG\\sets\\INR\\portada-inr.webp'),
('IXL', 'Ixalan', '2024-12-15', 1, '/assets/images/product/MAG/sets/Ixalan.jpg'),
('J25', 'Foundations Jumpstart', '2024-11-08', 1, '../assets\\images\\product\\MTG\\sets\\jumpstart.webp'),
('KLD', 'Kaladesh', '2024-10-20', 1, '/assets/images/product/MAG/sets/Kaladesh.jpg'),
('MH3', 'Modern Horizons 3', '2024-11-23', 1, '../assets/images/product/MTG/cards/MH3/mh3-booster-box.webp'),
('OP09', 'Emperors in the New World', '2024-12-14', 5, '../assets\\images\\product\\OP\\sets\\OP09\\OP-09.webp'),
('OP16', 'Uta Starter Deck', '2024-11-25', 5, '../assets/images/product/OP/packs/OP16/uta-starter-deck.webp'),
('PNBP', 'Phantom Nightmare', '2024-11-24', 2, '../assets/images/product/YGO/packs/phantom-nightmare-booster-pack.jpg'),
('SC', 'Stellar Crown', '2024-09-13', 3, '/assets/images/product/POK/sets/Stellar_Crown_Logo.png'),
('SDWD', 'Blue-Eyes White Destiny', '2025-02-06', 2, '/assets/images/product/YGO/sets/WD.jpg'),
('SFA', 'Fábula Sombría', '2024-08-02', 3, '../assets\\images\\product\\POk\\sets\\SFA.webp'),
('SSMMG', 'Marnie\'s Morpeko & Grimmsnarl EX', '2024-11-21', 3, '../assets/images/product/POK/tins/SSMMG/marnie-morpeko-grimmsnarl-ex.png'),
('SSPK', 'Surging Sparks', '2024-11-08', 3, '/assets/images/product/POK/sets/Surging_Sparks_Logo.png'),
('SSSBM', 'Steven\'s Beldum & Metagross EX', '2024-11-20', 3, '../assets/images/product/POK/tins/SSSBM/starter-set-ex-stevens-beldum-metagross-ex.jpg'),
('UR', 'Ursula\'s Return', '2024-11-22', 4, '../assets/images/product/LOR/tins/UR/ursula-tin.webp');

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
('DSK', 'Armadura etérea,Ethereal Armor ', 1, 0.24, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\armadura-etérea.webp', NULL),
('DSK', 'Aspiradora de fantasmas,Ghost Vacuum ', 1, 5.61, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\aspiradora-de-fantasmas.webp', NULL),
('DSK', 'Avería inoportuna,Untimely Malfunction ', 1, 1.99, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\avería-inoportuna.webp', NULL),
('DSK', 'Bosques sangrantes,Bleeding Woods', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\bosques-sangrantes.webp', NULL),
('DSK', 'Brillolinterna,Glimmerlight', 1, 0.06, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\Brillolinterna.webp', NULL),
('DSK', 'Caja de sobres de coleccionista de Duskmourn:La casa de los horrores', 1, 217.72, 'caja', '../assets\\images\\product\\MTG\\tins\\DSK\\caja-de-sobres-de-coleccionista-de-duskmourn-la-casa-de-los-horrores.webp', NULL),
('DSK', 'Caja de sobres de juego de Duskmourn:La casa de los horrores', 1, 136.49, 'caja', '../assets\\images\\product\\MTG\\tins\\DSK\\caja-de-sobres-de-juego-de-duskmourn-la-casa-de-los-horrores.webp', NULL),
('DSK', 'Campamento abandonado,Abandoned Campground', 1, 0.12, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\campamento-abandonado.webp', NULL),
('DSK', 'Cercenador cabezagujas,Razorkin Needlehead', 1, 3.34, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\Cercenador cabezagujas.webp', NULL),
('DSK', 'Consejo demoníaco,Demonic Counsel', 1, 1.51, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\consejo-demoníaco.webp', NULL),
('DSK', 'Detonación ígnea,Pyroclasm', 1, 0.18, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\detonación-ígnea.webp', NULL),
('DSK', 'Duskmourn:House of Horror Collector Booster', 1, 20.00, 'sobre', '../assets\\images\\product\\MTG\\packs\\DSK\\duskmourn-house-of-horror-collector-booster.webp', NULL),
('DSK', 'Duskmourn:House of Horror Play Booster', 1, 3.72, 'sobre', '../assets\\images\\product\\MTG\\packs\\DSK\\duskmourn-house-of-horror-play-booster.webp', NULL),
('DSK', 'Duskmourn:House of Horror: Nightmare Fat Pack Bundle', 1, 71.74, 'caja', '../assets\\images\\product\\MTG\\tins\\DSK\\duskmourn-house-of-horror-nightmare-fat-pack-bundle.webp', NULL),
('DSK', 'Duskmourn:Nightmare Bundle Booster', 1, 11.52, 'sobre', '../assets\\images\\product\\MTG\\packs\\DSK\\duskmourn-la-nightmare-bundle-booster.webp', NULL),
('DSK', 'Duskmourn:Prerelease Promo Cards Booster', 1, 5.23, 'sobre', '../assets\\images\\product\\MTG\\packs\\DSK\\duskmourn-prerelease-promo-cards-booster.webp', NULL),
('DSK', 'Línea mística de la esperanza,Leyline of Hope ', 1, 0.29, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\línea-mística-de-la-esperanza.webp', NULL),
('DSK', 'Línea mística de la resonancia,Leyline of Resonance ', 1, 0.99, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\línea-mística-de-la-resonancia.webp', NULL),
('DSK', 'Llaves de la Casa,Keys to the House ', 1, 0.08, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\llaves-de-la-casa.webp', NULL),
('DSK', 'Maizal grabado,Etched Cornfield', 1, 0.10, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\maizal-grabado.webp', NULL),
('DSK', 'Némesis de los gritos,Screaming Nemesis ', 1, 24.27, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\némesis-de-los-gritos.webp', NULL),
('DSK', 'Ojo aberrante,Abhorrent Oculus ', 1, 42.36, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK/ojo-aberrante.webp', NULL),
('DSK', 'Pantalla poseída,Haunted Screen', 1, 0.11, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\pantalla-poseida.webp', NULL),
('DSK', 'Protegido por fantasmas,Sheltered by Ghosts', 1, 4.81, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\protegido-por-fantasmas.webp', NULL),
('DSK', 'Separarse,Split Up ', 1, 1.97, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\separarse.webp', NULL),
('DSK', 'Sierra,Saw ', 1, 0.07, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\sierra.webp', NULL),
('DSK', 'Tergiversar la realidad,Twist Reality', 1, 0.10, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\tergiversar-la-realidad.webp', NULL),
('DSK', 'Tormento agotador,Withering Torment ', 1, 1.36, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\tormento-agotador.webp', NULL),
('DSK', 'Umbral de Cenagalardiente,Blazemire Verge ', 1, 5.74, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\umbral-de-cenagalardiente.webp', NULL),
('DSK', 'Umbral de Lagosombrío,Gloomlake Verge', 1, 10.78, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\umbral-de-lagosombrio.webp', NULL),
('DSK', 'Valgavoth el Devoraterrores,Valgavoth Terror Eater', 1, 16.25, 'carta', '../assets\\images\\product\\MTG\\cards\\DSK\\Valgavoth-el-Devoraterrores', NULL),
('INFO', 'Dragón Tenpai Genroku,Tenpai Dragon Genroku', 2, 3.90, 'carta', '../assets\\images\\product\\YGO\\cards\\INFO\\dragon-tenpai-genroku.webp', NULL),
('INFO', 'Forbidden One', 2, 20.00, 'carta', '/assets/images/product/YGO/sets/Forbidden_One_Card.png', NULL),
('INFO', 'Infinite Forbidden Box', 2, 140.00, 'caja', '/assets/images/product/YGO/sets/Infinite_Forbidden_Box.png', NULL),
('INFO', 'Infinite Forbidden Pack', 2, 4.75, 'sobre', '/assets/images/product/YGO/sets/Infinite_Forbidden_Pack.png', NULL),
('INR', 'Almas persistentes,Lingering Souls ', 1, 0.18, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\almas-persistentes.webp', NULL),
('INR', 'Artista de la sangre,Blood Artist', 1, 0.89, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\artista-sangre.webp', NULL),
('INR', 'Atravesando la brecha,Through the Breach ', 1, 3.15, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\atravesando.web', NULL),
('INR', 'Bosque (V.1),Forest (V.1)', 1, 0.39, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\bosque.webp', NULL),
('INR', 'Caja de sobres de coleccionista de Innistrad remasterizada,Innistrad Remastered Collector Booster Box ', 1, 310.31, 'caja', '../assets\\images\\product\\MTG\\packs\\INR\\caja-inr-collector.webp', NULL),
('INR', 'Caja de sobres de juego de Innistrad remasterizada,Innistrad Remastered Play Booster Box', 1, 164.81, 'caja', '../assets\\images\\product\\MTG\\tins\\INR\\caja-inr-boosters.webp', NULL),
('INR', 'Carácter ardiente,Fiery Temper ', 1, 0.12, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\caracter.webp', NULL),
('INR', 'Cazahechizos,Spell Queller ', 1, 1.00, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\caza-hechizos.webp', NULL),
('INR', 'Cota de malla demoníaca,Demonmail Hauberk', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\cota-de-malla.webp', NULL),
('INR', 'Desove arácnido, Spider Spawning ', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\desove-aracnido.webp', NULL),
('INR', 'Edgar Markov', 1, 55.22, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\edgar-markov.webp', NULL),
('INR', 'Emrakul el Final Prometido,Emrakul the Promised End', 1, 31.56, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\emrakul.webp', NULL),
('INR', 'Extractor de almas,Soul Separator', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\extractor-de-almas.webp', NULL),
('INR', 'Fe incólume,Faith Unbroken', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\fe.webp', NULL),
('INR', 'Flujo de esencia,Essence Flux', 1, 0.60, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\flujo.webp', NULL),
('INR', 'Histeria masiva, Mass Hysteria', 1, 0.12, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\histeria.webp', NULL),
('INR', 'Injerto de suturador,Stitcher\'s Graf', 1, 0.20, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\injerto.webp', NULL),
('INR', 'Isla (V.1),Island (V.1)', 1, 0.58, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\isla.webp', NULL),
('INR', 'Llanura (V.1),Plains (V.1)', 1, 0.38, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\llanura.webp', NULL),
('INR', 'Montaña (V.1), Mountain (V.1)', 1, 0.50, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\montaña.webp', NULL),
('INR', 'Mutación espontánea,Spontaneous Mutation ', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\mutación-espontánea.webp', NULL),
('INR', 'Navegante certero,Deadeye Navigator', 1, 2.40, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\navegante-certero.webp', NULL),
('INR', 'Pantano (V.1),Swamp (V.1)', 1, 0.50, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\pantano.webp', NULL),
('INR', 'Pulsión asesina,Murderous Compulsion ', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\pulsion-asesina.webp', NULL),
('INR', 'Reforjar el alma,Reforge the Soul ', 1, 2.97, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\reforjar-el-alma.webp', NULL),
('INR', 'Ritos de pueblo,Village Rites ', 1, 0.20, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\ritos.webp', NULL),
('INR', 'Sobre de coleccionista de Innistrad remasterizada,Innistrad Remastered Collector Booster', 1, 29.19, 'sobre', '../assets\\images\\product\\MTG\\packs\\INR\\sobre-inr-collector.webp', NULL),
('INR', 'Sobre de juego de Innistrad remasterizada,Innistrad Remastered Play Booster', 1, 5.51, 'sobre', '../assets\\images\\product\\MTG\\packs\\INR\\sobre-inr-booster.webp', NULL),
('INR', 'Tentación mortal,Deadly Allure', 1, 0.13, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\tentacion-mortal.webp', NULL),
('INR', 'Trampa luzgeist,Geistlight Snare ', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\rampa.webp', NULL),
('INR', 'Triscaidecafobia,Triskaidekaphobia', 1, 0.13, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\Triscaidecafobia.webp', NULL),
('INR', 'Tumba del ángel,Angel\'s Tomb', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\tumba-del-angel.webp', NULL),
('INR', 'Ventana entablada,Boarded Window', 1, 0.24, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\ventana-entablada.webp', NULL),
('INR', 'Virtud intangible,Intangible Virtue', 1, 0.13, 'carta', '../assets\\images\\product\\MTG\\cards\\INR\\virtud-intangible.webp', NULL),
('IXL', 'Ixalan Booster Pack', 1, 4.25, 'sobre', '/assets/images/product/MAG/sets/Ixalan_Pack.png', NULL),
('IXL', 'Ixalan Deck', 1, 16.00, 'caja', '/assets/images/product/MAG/sets/Ixalan_Deck.png', NULL),
('IXL', 'Ixalan Mythic Card', 1, 15.00, 'carta', '/assets/images/product/MAG/sets/Ixalan_Card.png', NULL),
('J25', 'Abrazo de Serra,Serra\'s Embrace', 1, 0.17, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\abrazo-serra.webp', NULL),
('J25', 'Aphelia encantadora de víboras,Aphelia  Viper Whisperer ', 1, 21.14, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\aphelia.webp', NULL),
('J25', 'Arranque violento,Violent Outburst ', 1, 0.54, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\arranque-violento.webp', NULL),
('J25', 'Bosque,Forest', 1, 0.02, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\bosque.webp', NULL),
('J25', 'Cachorro generoso,Generous Pup ', 1, 5.58, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\cachorro.webp', NULL),
('J25', 'Chupasangre insidioso,Creeping Bloodsucker ', 1, 3.91, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\chupasangre.webp', NULL),
('J25', 'Cólera ancestral,Ancestral Anger', 1, 0.28, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\colera-ancestral.webp', NULL),
('J25', 'Concentrarse,Concentrate', 1, 0.13, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\concentrarse.webp', NULL),
('J25', 'Crecimiento exuberante,Rampant Growth ', 1, 0.38, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\crecimiento-exuberante.webp', NULL),
('J25', 'Cría de felinoguadaña,Scythecat Cub ', 1, 27.76, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\felinoguadaña.webp', NULL),
('J25', 'Emisaria de guerra,Herald of War', 1, 1.30, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\angel.webp', NULL),
('J25', 'Escupefuego,Fireshrieker ', 1, 0.17, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\escupefuego.webp', NULL),
('J25', 'Esperanza en extinción,Fading Hope ', 1, 0.33, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\esperanza.webp', NULL),
('J25', 'Evereth virreina del saqueo,Evereth Viceroy of Plunder', 1, 12.67, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\evereth.webp', NULL),
('J25', 'Fabricaingenios,Whirlermaker', 1, 0.05, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\Fabricaingenios.webp', NULL),
('J25', 'Golpe a la garganta,Go for the Throat ', 1, 0.91, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\golpe-garganta.webp', NULL),
('J25', 'Herramientas de ladrón,Thieves\' Tools ', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\herramientas-ladron.webp', NULL),
('J25', 'Isla,Island', 1, 0.10, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\isla.webp', NULL),
('J25', 'Jugar con fuego,Play with Fire ', 1, 1.16, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\jugar-con-fuego.webp', NULL),
('J25', 'Kodama del árbol del oeste, Kodama of the West Tree', 1, 13.84, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\kodama.webp', NULL),
('J25', 'Llamas de la instigadora,Flames of the Firebrand ', 1, 0.10, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\llamas-instigadora.webp', NULL),
('J25', 'Magic:The Gathering Foundations Play Booster', 1, 4.08, 'sobre', '../assets\\images\\product\\MTG\\packs\\J25\\sobre-cimientos-play-booster.webp', NULL),
('J25', 'Maza del valiente,Mace of the Valiant', 1, 0.14, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\mazo-del-valiente.webp', NULL),
('J25', 'Montaña,Mountain', 1, 0.03, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\montaña.webp', NULL),
('J25', 'Pantano,Swamp', 1, 0.08, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\pantano.webp', NULL),
('J25', 'Parcela fúngica,Fungal Plots ', 1, 0.18, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\parcela-fungica.webp', NULL),
('J25', 'Rastro de migajas,Trail of Crumbs ', 1, 0.28, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\rastro-migajas.webp', NULL),
('J25', 'Recuerdo del Starnheim,Starnheim Memento ', 1, 0.21, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\recuerdo-starnheim.webp', NULL),
('J25', 'Reenviar,Remand ', 1, 0.51, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\reenviar.webp', NULL),
('J25', 'Retirada a Kazandu,Retreat to Kazandu ', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\retirada-kazandu.webp', NULL),
('J25', 'Rev sacadiezmos,Rev Tithe Extractor ', 1, 29.93, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\rev.webp', NULL),
('J25', 'Secuestrado por las hadas,Stolen by the Fae ', 1, 0.15, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\secuestrado.webp', NULL),
('J25', 'Sobre de Jumpstart de Magic: The Gathering - Cimientos,Magic: The Gathering Foundations Jumpstart Booster ', 1, 4.20, 'sobre', '../assets\\images\\product\\MTG\\packs\\J25\\sobre-cimientos-jumpstart-booster.webp', NULL),
('J25', 'Tormento de escarabajos,Torment of Scarabs', 1, 0.41, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\tormento-escarabajos.webp', NULL),
('J25', 'Valkiria justa,Righteous Valkyrie', 1, 3.90, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\valkiria.webp', NULL),
('J25', 'Verdiguardián anciano,Ancient Greenwarden ', 1, 6.14, 'carta', '../assets\\images\\product\\MTG\\cards\\J25\\anciano.webp', NULL),
('KLD', 'Kaladesh Booster Box', 1, 110.00, 'caja', '/assets/images/product/MAG/sets/Kaladesh_Box.png', NULL),
('KLD', 'Kaladesh Booster Pack', 1, 4.25, 'sobre', '/assets/images/product/MAG/sets/Kaladesh_Pack.png', NULL),
('KLD', 'Kaladesh Rare Card', 1, 8.00, 'carta', '/assets/images/product/MAG/sets/Kaladesh_Card.png', NULL),
('MH3', 'Modern Horizons 3 Booster Box', 1, 55.00, 'caja', '../assets/images/product/MTG/cards/MH3/mh3-booster-box.webp', NULL),
('OP09', 'Boa Hancock', 5, 110.39, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Boa.webp', NULL),
('OP09', 'Buggy', 5, 284.87, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Buggy.webp', NULL),
('OP09', 'Emperors in the New World Booster', 5, 2.20, 'sobre', '../assets\\images\\product\\OP\\packs\\OP09\\sobre-op09.webp', NULL),
('OP09', 'Emperors in the New World Booster Box', 5, 96.99, 'caja', '../assets\\images\\product\\OP\\tins\\OP09\\caja-op09.webp', NULL),
('OP09', 'Emperors in the New World Booster Box Case (12x Booster Box)', 5, 1125.36, 'caja', '../assets\\images\\product\\OP\\tins\\OP09\\caja2-op09.webp', NULL),
('OP09', 'Emperors in the New World Sleeved Booster', 5, 12.20, 'sobre', '\\../assets\\images\\product\\OP\\packs\\OP09\\sobre-2-op09.webp', NULL),
('OP09', 'Franky', 5, 7.19, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Franky.webp', NULL),
('OP09', 'Gol.D.Roger', 5, 2000.00, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Gol.D.Roger.webp', NULL),
('OP09', 'Marshall.D.Teach', 5, 478.76, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Marshall.D.Teach.webp', NULL),
('OP09', 'Monkey.D.Luffy', 3, 671.49, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Monkey.D.Luffy.webp', NULL),
('OP09', 'Nami', 5, 148.36, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Nami.webp', NULL),
('OP09', 'Nico Robin', 5, 23.94, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\nico-robin.webp', NULL),
('OP09', 'Sabo', 5, 0.05, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Sabo.webp', NULL),
('OP09', 'Sanji', 5, 14.07, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Sanji.webp', NULL),
('OP09', 'Shanks', 5, 423.89, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\shanks.webp', NULL),
('OP09', 'Uta', 5, 0.09, 'carta', '../assets\\images\\product\\OP\\cards\\uta.webp', NULL),
('OP09', 'Zoro-Juurou', 5, 84.74, 'carta', '../assets\\images\\product\\OP\\cards\\OP09\\Zoro-Juurou.webp', NULL),
('OP16', 'Uta Starter Deck', 5, 35.99, 'caja', '../assets/images/product/OP/packs/OP16/uta-starter-deck.webp', NULL),
('PNBP', 'Phantom Nightmare Booster Pack', 2, 3.99, 'sobre', '../assets/images/product/YGO/packs/phantom-nightmare-booster-pack.jpg', NULL),
('SC', 'Stellar Crown Booster Box', 3, 120.00, 'caja', '/assets/images/product/POK/sets/Stellar_Crown_Box.png', NULL),
('SC', 'Stellar Crown Booster Pack', 3, 4.00, 'sobre', '/assets/images/product/POK/sets/Stellar_Crown_Pack.png', NULL),
('SC', 'Stellar Crown Promo Card', 3, 10.00, 'carta', '/assets/images/product/POK/sets/Stellar_Crown_Card.png', NULL),
('SDWD', 'Blue-Eyes White Destiny Box', 2, 130.00, 'caja', '/assets/images/product/YGO/sets/Blue_Eyes_Box.png', NULL),
('SDWD', 'Blue-Eyes White Destiny Pack', 2, 5.00, 'sobre', '/assets/images/product/YGO/sets/Blue_Eyes_Pack.png', NULL),
('SDWD', 'Blue-Eyes White Dragon', 2, 25.00, 'carta', '/assets/images/product/YGO/sets/Blue_Eyes_Card.png', NULL),
('SFA', 'Fezandipiti ex', 3, 7.51, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\Fezandipiti_ex.webp', NULL),
('SFA', 'Persian', 3, 27.78, 'carta', '../assets\\images\\product\\POk\\cards\\SFA\\persian.webp', NULL),
('SSMMG', 'Marnie\'s Morpeko & Grimmsnarl EX Booster Pack', 3, 3.99, 'sobre', '../assets/images/product/POK/tins/SSMMG/marnie-morpeko-grimmsnarl-ex.png', NULL),
('SSPK', 'Surging Sparks Booster Pack', 3, 4.50, 'sobre', '/assets/images/product/POK/sets/Surging_Sparks_Pack.png', NULL),
('SSPK', 'Surging Sparks Deck', 3, 15.00, 'caja', '/assets/images/product/POK/sets/Surging_Sparks_Deck.png', NULL),
('SSPK', 'Surging Sparks Exclusive Card', 3, 12.00, 'carta', '/assets/images/product/POK/sets/Surging_Sparks_Card.png', NULL),
('SSSBM', 'Steven\'s Beldum & Metagross EX Booster Pack', 3, 3.99, 'sobre', '../assets/images/product/POK/tins/SSSBM/starter-set-ex-stevens-beldum-metagross-ex.jpg', NULL),
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
('DSK', 'Duskmourn:House of Horror Collector Booster', 15, 1),
('DSK', 'Duskmourn:House of Horror Play Booster', 14, 1),
('DSK', 'Duskmourn:Nightmare Bundle Booster', 15, 1),
('DSK', 'Duskmourn:Prerelease Promo Cards Booster', 15, 1),
('INR', 'Sobre de coleccionista de Innistrad remasterizada,Innistrad Remastered Collector Booster', 15, 1),
('INR', 'Sobre de juego de Innistrad remasterizada,Innistrad Remastered Play Booster', 14, 1),
('J25', 'Magic:The Gathering Foundations Play Booster', 14, 1),
('J25', 'Sobre de Jumpstart de Magic: The Gathering - Cimientos,Magic: The Gathering Foundations Jumpstart Booster ', 20, 1),
('OP09', 'Emperors in the New World Booster', 12, 5),
('OP09', 'Emperors in the New World Sleeved Booster', 12, 5),
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
  `role` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`email`, `username`, `password`, `phone`, `role`) VALUES
('something@example.org', 'another', '1234', 324, 1);

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
  ADD CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`codExpansion`,`nombreProducto`) REFERENCES `productos` (`codExpansion`, `nombreProducto`),
  ADD CONSTRAINT `caja_ibfk_2` FOREIGN KEY (`idJuego`) REFERENCES `productos` (`idJuego`);

--
-- Filtros para la tabla `carta`
--
ALTER TABLE `carta`
  ADD CONSTRAINT `carta_ibfk_1` FOREIGN KEY (`codExpansion`,`nombreProducto`) REFERENCES `productos` (`codExpansion`, `nombreProducto`),
  ADD CONSTRAINT `carta_ibfk_2` FOREIGN KEY (`idJuego`) REFERENCES `productos` (`idJuego`);

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
  ADD CONSTRAINT `sobre_ibfk_1` FOREIGN KEY (`codExpansion`,`nombreProducto`) REFERENCES `productos` (`codExpansion`, `nombreProducto`),
  ADD CONSTRAINT `sobre_ibfk_2` FOREIGN KEY (`idJuego`) REFERENCES `productos` (`idJuego`);

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
