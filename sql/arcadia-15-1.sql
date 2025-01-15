-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-01-2025 a las 13:42:40
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
('INFO', 'Infinite Forbidden Box', 520, 2),
('IXL', 'Ixalan Deck', 60, 1),
('KLD', 'Kaladesh Booster Box', 540, 1),
('MH3', 'Modern Horizons 3 Booster Box', 540, 1),
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
('DSK', 'Protegido por fantasmas,Sheltered by Ghosts', 1, 'Criatura,Soldado Vampiro, uncommon,fuerza:1,resistencia:1,coste:1{NC}1{W}'),
('INFO', 'Dragón Tenpai Genroku,Tenpai Dragon Genroku', 2, 'criatura,dragon efecto,ultra rare,nivel:3,ataque:0,defensa:1000'),
('INFO', 'Forbidden One', 2, 'Mythic, Forbidden'),
('IXL', 'Ixalan Mythic Card', 1, 'Dinosaur, Mythic'),
('KLD', 'Kaladesh Rare Card', 1, 'Artifact, Rare'),
('SC', 'Stellar Crown Promo Card', 3, 'Holo, Limited Edition'),
('SDWD', 'Blue-Eyes White Dragon', 2, 'Legendary, Blue-Eyes'),
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
('DSK', 'Duskmourn: La casa de los Horrores, Duskmourn: House of Horror', '2024-09-20', 1, '\\public\\assets\\images\\product\\MTG\\sets\\DSK-ex.webp'),
('INFO', 'Infinite Forbidden', '2024-07-18', 2, '/assets/images/product/YGO/sets/INFO.webp'),
('IXL', 'Ixalan', '2024-12-15', 1, '/assets/images/product/MAG/sets/Ixalan.jpg'),
('KLD', 'Kaladesh', '2024-10-20', 1, '/assets/images/product/MAG/sets/Kaladesh.jpg'),
('MH3', 'Modern Horizons 3', '2024-11-23', 1, '../assets/images/product/MTG/cards/MH3/mh3-booster-box.webp'),
('OP16', 'Uta Starter Deck', '2024-11-25', 5, '../assets/images/product/OP/packs/OP16/uta-starter-deck.webp'),
('PNBP', 'Phantom Nightmare', '2024-11-24', 2, '../assets/images/product/YGO/packs/phantom-nightmare-booster-pack.jpg'),
('SC', 'Stellar Crown', '2024-09-13', 3, '/assets/images/product/POK/sets/Stellar_Crown_Logo.png'),
('SDWD', 'Blue-Eyes White Destiny', '2025-02-06', 2, '/assets/images/product/YGO/sets/WD.jpg'),
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
('DSK', 'Protegido por fantasmas,Sheltered by Ghosts', 1, 4.81, 'carta', '\\public\\assets\\images\\product\\MTG\\cards\\DSK\\protegido-por-fantasmas.webp', NULL),
('INFO', 'Dragón Tenpai Genroku,Tenpai Dragon Genroku', 2, 3.90, 'carta', 'public\\assets\\images\\product\\YGO\\cards\\INFO\\dragon-tenpai-genroku.webp', NULL),
('INFO', 'Forbidden One', 2, 20.00, 'carta', '/assets/images/product/YGO/sets/Forbidden_One_Card.png', NULL),
('INFO', 'Infinite Forbidden Box', 2, 140.00, 'caja', '/assets/images/product/YGO/sets/Infinite_Forbidden_Box.png', NULL),
('INFO', 'Infinite Forbidden Pack', 2, 4.75, 'sobre', '/assets/images/product/YGO/sets/Infinite_Forbidden_Pack.png', NULL),
('IXL', 'Ixalan Booster Pack', 1, 4.25, 'sobre', '/assets/images/product/MAG/sets/Ixalan_Pack.png', NULL),
('IXL', 'Ixalan Deck', 1, 16.00, 'caja', '/assets/images/product/MAG/sets/Ixalan_Deck.png', NULL),
('IXL', 'Ixalan Mythic Card', 1, 15.00, 'carta', '/assets/images/product/MAG/sets/Ixalan_Card.png', NULL),
('KLD', 'Kaladesh Booster Box', 1, 110.00, 'caja', '/assets/images/product/MAG/sets/Kaladesh_Box.png', NULL),
('KLD', 'Kaladesh Booster Pack', 1, 4.25, 'sobre', '/assets/images/product/MAG/sets/Kaladesh_Pack.png', NULL),
('KLD', 'Kaladesh Rare Card', 1, 8.00, 'carta', '/assets/images/product/MAG/sets/Kaladesh_Card.png', NULL),
('MH3', 'Modern Horizons 3 Booster Box', 1, 55.00, 'caja', '../assets/images/product/MTG/cards/MH3/mh3-booster-box.webp', NULL),
('OP16', 'Uta Starter Deck', 5, 35.99, 'caja', '../assets/images/product/OP/packs/OP16/uta-starter-deck.webp', NULL),
('PNBP', 'Phantom Nightmare Booster Pack', 2, 3.99, 'sobre', '../assets/images/product/YGO/packs/phantom-nightmare-booster-pack.jpg', NULL),
('SC', 'Stellar Crown Booster Box', 3, 120.00, 'caja', '/assets/images/product/POK/sets/Stellar_Crown_Box.png', NULL),
('SC', 'Stellar Crown Booster Pack', 3, 4.00, 'sobre', '/assets/images/product/POK/sets/Stellar_Crown_Pack.png', NULL),
('SC', 'Stellar Crown Promo Card', 3, 10.00, 'carta', '/assets/images/product/POK/sets/Stellar_Crown_Card.png', NULL),
('SDWD', 'Blue-Eyes White Destiny Box', 2, 130.00, 'caja', '/assets/images/product/YGO/sets/Blue_Eyes_Box.png', NULL),
('SDWD', 'Blue-Eyes White Destiny Pack', 2, 5.00, 'sobre', '/assets/images/product/YGO/sets/Blue_Eyes_Pack.png', NULL),
('SDWD', 'Blue-Eyes White Dragon', 2, 25.00, 'carta', '/assets/images/product/YGO/sets/Blue_Eyes_Card.png', NULL),
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
