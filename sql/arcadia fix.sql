DROP DATABASE IF EXISTS arcadia;
CREATE DATABASE arcadia;
USE arcadia;

CREATE TABLE `addresses` (
  `idAddress` int(11) NOT NULL,
  `comunidad` varchar(150) DEFAULT NULL,
  `municipio` varchar(150) DEFAULT NULL,
  `cp` int(5) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `puerta` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idAddress`)
);

CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` int(12) NOT NULL,
  `role` int(1) NOT NULL,
  PRIMARY KEY (`email`)
);

CREATE TABLE `user_addresses` (
  `email` varchar(255) NOT NULL,
  `idAddress` int(11) NOT NULL,
  PRIMARY KEY (`email`, `idAddress`),
  FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE,
  FOREIGN KEY (`idAddress`) REFERENCES `addresses` (`idAddress`) ON DELETE CASCADE
);

CREATE TABLE `juegos` (
  `idJuego` int(11) NOT NULL,
  `nombre_juego` varchar(100) NOT NULL,
  PRIMARY KEY (`idJuego`)
);

CREATE TABLE `expansiones` (
  `codExpansion` varchar(100) NOT NULL,
  `nombreExpansion` varchar(255) NOT NULL,
  `fechaLanzamiento` date NOT NULL,
  `idJuego` int(11) NOT NULL,
  `urlImagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codExpansion`),
  FOREIGN KEY (`idJuego`) REFERENCES `juegos` (`idJuego`) ON DELETE CASCADE
);

CREATE TABLE `productos` (
  `codExpansion` varchar(100) NOT NULL,
  `nombreProducto` varchar(255) NOT NULL,
  `idJuego` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `tipo` enum('carta','caja','sobre') DEFAULT NULL,
  `urlImagen` varchar(255) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`nombreProducto`, `codExpansion`),
  FOREIGN KEY (`codExpansion`) REFERENCES `expansiones` (`codExpansion`) ON DELETE CASCADE,
  FOREIGN KEY (`idJuego`) REFERENCES `expansiones` (`idJuego`) ON DELETE CASCADE
);

CREATE TABLE `ofertas` (
  `nombreProducto` varchar(255) NOT NULL,
  `codExpansion` varchar(100) NOT NULL,
  `idJuego` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `tipo` enum('carta','caja','sobre') NOT NULL,
  `urlImagen` varchar(255) DEFAULT NULL,
  `descuento` int(11) NOT NULL,
  PRIMARY KEY (`nombreProducto`, `codExpansion`),
  FOREIGN KEY (`nombreProducto`, `codExpansion`) REFERENCES `productos` (`nombreProducto`, `codExpansion`) ON DELETE CASCADE,
  FOREIGN KEY (`idJuego`) REFERENCES `juegos` (`idJuego`) ON DELETE CASCADE
);

CREATE TABLE `eventos` (
  `idEvento` int(11) NOT NULL,
  `nombre_evento` varchar(255) NOT NULL,
  `fecha_evento` date NOT NULL,
  `descripcion` text DEFAULT NULL,
  `urlImagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idEvento`)
);

CREATE TABLE `caja` (
  `codExpansion` varchar(100) NOT NULL,
  `nombreProducto` varchar(255) NOT NULL,
  `numCartas` int(11) NOT NULL,
  `idJuego` int(11) NOT NULL,
  PRIMARY KEY (`codExpansion`, `nombreProducto`),
  FOREIGN KEY (`codExpansion`, `nombreProducto`) REFERENCES `productos` (`codExpansion`, `nombreProducto`) ON DELETE CASCADE,
    FOREIGN KEY (`idJuego`) REFERENCES `juegos` (`idJuego`) ON DELETE CASCADE

);

CREATE TABLE `sobre` (
  `codExpansion` varchar(100) NOT NULL,
  `nombreProducto` varchar(255) NOT NULL,
  `numCartas` int(11) NOT NULL,
  `idJuego` int(11) NOT NULL,
  PRIMARY KEY (`codExpansion`, `nombreProducto`),
  FOREIGN KEY (`codExpansion`, `nombreProducto`) REFERENCES `productos` (`codExpansion`, `nombreProducto`) ON DELETE CASCADE
);

CREATE TABLE `carta` (
  `codExpansion` varchar(100) NOT NULL,
  `nombreProducto` varchar(255) NOT NULL,
  `idJuego` int(11) NOT NULL,
  `atributos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codExpansion`, `nombreProducto`),
  FOREIGN KEY (`codExpansion`, `nombreProducto`) REFERENCES `productos` (`codExpansion`, `nombreProducto`) ON DELETE CASCADE
);
