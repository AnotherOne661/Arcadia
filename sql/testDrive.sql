DROP DATABASE IF EXISTS arcadia;
CREATE DATABASE arcadia;
USE arcadia;

CREATE TABLE juegos(
    idJuego INT PRIMARY KEY,
    nombre_juego VARCHAR(100) NOT NULL
);

CREATE TABLE expansiones(
    codExpansion VARCHAR(100) PRIMARY KEY,
    nombreExpansion VARCHAR(255) NOT NULL,
    fechaLanzamiento DATE NOT NULL,
    idJuego INT NOT NULL,
    urlImagen VARCHAR(255),
    FOREIGN KEY (idJuego) REFERENCES juegos(idJuego)
);

CREATE TABLE productos(
    codExpansion VARCHAR(100),
    nombreProducto VARCHAR(255),
    idJuego INT NOT NULL, -- Se toma de expansiones
    precio DECIMAL(10, 2) NOT NULL,
    tipo ENUM('carta', 'caja', 'sobre'),
    urlImagen VARCHAR(255),
    FOREIGN KEY (codExpansion) REFERENCES expansiones(codExpansion),
    FOREIGN KEY (idJuego) REFERENCES expansiones(idJuego), -- Referencia a idJuego de expansiones
    PRIMARY KEY (codExpansion, nombreProducto)
);

CREATE TABLE caja(
    codExpansion VARCHAR(100),
    nombreProducto VARCHAR(255),
    numCartas INT NOT NULL,
    idJuego INT NOT NULL, -- Relacionado con productos
    FOREIGN KEY (codExpansion, nombreProducto) REFERENCES productos(codExpansion, nombreProducto),
    FOREIGN KEY (idJuego) REFERENCES productos(idJuego),
    PRIMARY KEY (codExpansion, nombreProducto)
);

CREATE TABLE sobre(
    codExpansion VARCHAR(100),
    nombreProducto VARCHAR(255),
    numCartas INT NOT NULL,
    idJuego INT NOT NULL, -- Relacionado con productos
    FOREIGN KEY (codExpansion, nombreProducto) REFERENCES productos(codExpansion, nombreProducto),
    FOREIGN KEY (idJuego) REFERENCES productos(idJuego),
    PRIMARY KEY (codExpansion, nombreProducto)
);

CREATE TABLE carta(
    codExpansion VARCHAR(100),
    nombreProducto VARCHAR(255),
    idJuego INT NOT NULL, -- Relacionado con productos
    atributos VARCHAR(255),
    FOREIGN KEY (codExpansion, nombreProducto) REFERENCES productos(codExpansion, nombreProducto),
    FOREIGN KEY (idJuego) REFERENCES productos(idJuego),
    PRIMARY KEY (codExpansion, nombreProducto)
);

-- Inserciones en la tabla `juegos`
INSERT INTO juegos(idJuego, nombre_juego) VALUES
(1, 'Magic: The Gathering'),
(2, 'Yu-Gi-Oh!'),
(3, 'Pokémon'),
(4, 'Lorcana'),
(5, 'One Piece');

-- Inserciones en la tabla `expansiones`
INSERT INTO expansiones(codExpansion, nombreExpansion, fechaLanzamiento, idJuego, urlImagen) VALUES
('SC', 'Stellar Crown', '2024-09-13', 3, '/assets/images/product/POK/sets/Stellar_Crown_Logo.png'),
('SSPK', 'Surging Sparks', '2024-11-08', 3, '/assets/images/product/POK/sets/Surging_Sparks_Logo.png'),
('SDWD', 'Blue-Eyes White Destiny', '2025-02-06', 2, '/assets/images/product/YGO/sets/WD.jpg'),
('INFO', 'Infinite Forbidden', '2024-07-18', 2, '/assets/images/product/YGO/sets/INFO.webp'),
('KLD', 'Kaladesh', '2024-10-20', 1, '/assets/images/product/MAG/sets/Kaladesh.jpg'),
('IXL', 'Ixalan', '2024-12-15', 1, '/assets/images/product/MAG/sets/Ixalan.jpg');

-- Inserciones en la tabla `productos`
INSERT INTO productos(codExpansion, nombreProducto, idJuego, precio, tipo, urlImagen) VALUES
('SC', 'Stellar Crown Booster Box', 3, 120.00, 'caja', '/assets/images/product/POK/sets/Stellar_Crown_Box.png'),
('SC', 'Stellar Crown Booster Pack', 3, 4.00, 'sobre', '/assets/images/product/POK/sets/Stellar_Crown_Pack.png'),
('SC', 'Stellar Crown Promo Card', 3, 10.00, 'carta', '/assets/images/product/POK/sets/Stellar_Crown_Card.png'),
('SSPK', 'Surging Sparks Deck', 3, 15.00, 'caja', '/assets/images/product/POK/sets/Surging_Sparks_Deck.png'),
('SSPK', 'Surging Sparks Booster Pack', 3, 4.50, 'sobre', '/assets/images/product/POK/sets/Surging_Sparks_Pack.png'),
('SSPK', 'Surging Sparks Exclusive Card', 3, 12.00, 'carta', '/assets/images/product/POK/sets/Surging_Sparks_Card.png'),
('SDWD', 'Blue-Eyes White Destiny Box', 2, 130.00, 'caja', '/assets/images/product/YGO/sets/Blue_Eyes_Box.png'),
('SDWD', 'Blue-Eyes White Destiny Pack', 2, 5.00, 'sobre', '/assets/images/product/YGO/sets/Blue_Eyes_Pack.png'),
('SDWD', 'Blue-Eyes White Dragon', 2, 25.00, 'carta', '/assets/images/product/YGO/sets/Blue_Eyes_Card.png'),
('INFO', 'Infinite Forbidden Box', 2, 140.00, 'caja', '/assets/images/product/YGO/sets/Infinite_Forbidden_Box.png'),
('INFO', 'Infinite Forbidden Pack', 2, 4.75, 'sobre', '/assets/images/product/YGO/sets/Infinite_Forbidden_Pack.png'),
('INFO', 'Forbidden One', 2, 20.00, 'carta', '/assets/images/product/YGO/sets/Forbidden_One_Card.png'),
('KLD', 'Kaladesh Booster Box', 1, 110.00, 'caja', '/assets/images/product/MAG/sets/Kaladesh_Box.png'),
('KLD', 'Kaladesh Booster Pack', 1, 4.25, 'sobre', '/assets/images/product/MAG/sets/Kaladesh_Pack.png'),
('KLD', 'Kaladesh Rare Card', 1, 8.00, 'carta', '/assets/images/product/MAG/sets/Kaladesh_Card.png'),
('IXL', 'Ixalan Deck', 1, 16.00, 'caja', '/assets/images/product/MAG/sets/Ixalan_Deck.png'),
('IXL', 'Ixalan Booster Pack', 1, 4.25, 'sobre', '/assets/images/product/MAG/sets/Ixalan_Pack.png'),
('IXL', 'Ixalan Mythic Card', 1, 15.00, 'carta', '/assets/images/product/MAG/sets/Ixalan_Card.png');

-- Inserciones en la tabla `caja`
INSERT INTO caja(codExpansion, nombreProducto, numCartas, idJuego) VALUES
('SC', 'Stellar Crown Booster Box', 540, 3),
('SSPK', 'Surging Sparks Deck', 60, 3),
('SDWD', 'Blue-Eyes White Destiny Box', 500, 2),
('INFO', 'Infinite Forbidden Box', 520, 2),
('KLD', 'Kaladesh Booster Box', 540, 1),
('IXL', 'Ixalan Deck', 60, 1);

-- Inserciones en la tabla `sobre`
INSERT INTO sobre(codExpansion, nombreProducto, numCartas, idJuego) VALUES
('SC', 'Stellar Crown Booster Pack', 10, 3),
('SSPK', 'Surging Sparks Booster Pack', 10, 3),
('SDWD', 'Blue-Eyes White Destiny Pack', 9, 2),
('INFO', 'Infinite Forbidden Pack', 10, 2),
('KLD', 'Kaladesh Booster Pack', 15, 1),
('IXL', 'Ixalan Booster Pack', 12, 1);

-- Inserciones en la tabla `carta`
INSERT INTO carta(codExpansion, nombreProducto, idJuego, atributos) VALUES
('SC', 'Stellar Crown Promo Card', 3, 'Holo, Limited Edition'),
('SSPK', 'Surging Sparks Exclusive Card', 3, 'Ultra Rare'),
('SDWD', 'Blue-Eyes White Dragon', 2, 'Legendary, Blue-Eyes'),
('INFO', 'Forbidden One', 2, 'Mythic, Forbidden'),
('KLD', 'Kaladesh Rare Card', 1, 'Artifact, Rare'),
('IXL', 'Ixalan Mythic Card', 1, 'Dinosaur, Mythic');
