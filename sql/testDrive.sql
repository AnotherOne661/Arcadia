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

CREATE TABLE productos (
    codExpansion VARCHAR(100),
    nombreProducto VARCHAR(255),
    idJuego INT NOT NULL, -- Se toma de expansiones
    precio DECIMAL(10, 2) NOT NULL,
    tipo ENUM('carta', 'caja', 'sobre'),
    urlImagen VARCHAR(255),
    descuento DECIMAL(10, 2) DEFAULT NULL,
    PRIMARY KEY (codExpansion, nombreProducto),
    FOREIGN KEY (codExpansion) REFERENCES expansiones(codExpansion),
    FOREIGN KEY (idJuego) REFERENCES expansiones(idJuego) -- Referencia a idJuego de expansiones
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

INSERT INTO expansiones (codExpansion, nombreExpansion, fechaLanzamiento, idJuego, urlImagen) VALUES
('SSSBM', 'Steven\'s Beldum & Metagross EX', '2024-11-20', 3, '../assets/images/product/POK/tins/SSSBM/starter-set-ex-stevens-beldum-metagross-ex.jpg'),
('SSMMG', 'Marnie\'s Morpeko & Grimmsnarl EX', '2024-11-21', 3, '../assets/images/product/POK/tins/SSMMG/marnie-morpeko-grimmsnarl-ex.png'),
('UR', 'Ursula\'s Return', '2024-11-22', 4, '../assets/images/product/LOR/tins/UR/ursula-tin.webp'),
('MH3', 'Modern Horizons 3', '2024-11-23', 1, '../assets/images/product/MTG/cards/MH3/mh3-booster-box.webp'),
('PNBP', 'Phantom Nightmare', '2024-11-24', 2, '../assets/images/product/YGO/packs/phantom-nightmare-booster-pack.jpg'),
('OP16', 'Uta Starter Deck', '2024-11-25', 5, '../assets/images/product/OP/packs/OP16/uta-starter-deck.webp');



-- Insert into `productos`
INSERT INTO productos (codExpansion, nombreProducto, idJuego, precio, tipo, urlImagen) VALUES
('SSSBM', 'Steven\'s Beldum & Metagross EX Booster Pack', 3, 3.99, 'sobre', '../assets/images/product/POK/tins/SSSBM/starter-set-ex-stevens-beldum-metagross-ex.jpg'),
('SSMMG', 'Marnie\'s Morpeko & Grimmsnarl EX Booster Pack', 3, 3.99, 'sobre', '../assets/images/product/POK/tins/SSMMG/marnie-morpeko-grimmsnarl-ex.png'),
('UR', 'Ursula\'s Return Tin', 4, 19.99, 'caja', '../assets/images/product/LOR/tins/UR/ursula-tin.webp'),
('MH3', 'Modern Horizons 3 Booster Box', 1, 55.00, 'caja', '../assets/images/product/MTG/cards/MH3/mh3-booster-box.webp'),
('PNBP', 'Phantom Nightmare Booster Pack', 2, 3.99, 'sobre', '../assets/images/product/YGO/packs/phantom-nightmare-booster-pack.jpg'),
('OP16', 'Uta Starter Deck', 5, 35.99, 'caja', '../assets/images/product/OP/packs/OP16/uta-starter-deck.webp');

-- Insert into `sobre` (Booster Packs)
INSERT INTO sobre (codExpansion, nombreProducto, numCartas, idJuego) VALUES
('SSSBM', 'Steven\'s Beldum & Metagross EX Booster Pack', 10, 3),
('SSMMG', 'Marnie\'s Morpeko & Grimmsnarl EX Booster Pack', 10, 3),
('PNBP', 'Phantom Nightmare Booster Pack', 9, 2);

-- Insert into `caja` (Tins and Booster Boxes)
INSERT INTO caja (codExpansion, nombreProducto, numCartas, idJuego) VALUES
('UR', 'Ursula\'s Return Tin', 60, 4),
('MH3', 'Modern Horizons 3 Booster Box', 540, 1),
('OP16', 'Uta Starter Deck', 50, 5);

CREATE TABLE ofertas (
    nombreProducto VARCHAR(255) NOT NULL,
    codExpansion VARCHAR(100) NOT NULL,
    idJuego INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    tipo ENUM('carta', 'caja', 'sobre') NOT NULL,
    urlImagen VARCHAR(255),
    descuento INT NOT NULL,
    FOREIGN KEY (codExpansion, nombreProducto) REFERENCES productos(codExpansion, nombreProducto),
    FOREIGN KEY (idJuego) REFERENCES productos(idJuego),
    PRIMARY KEY (codExpansion, nombreProducto)
);
INSERT INTO ofertas (nombreProducto, codExpansion, idJuego, precio, tipo, urlImagen)
VALUES
  ('Steven\'s Beldum & Metagross EX Booster Pack', 'SSSBM', 3, 3.99, 'Booster Pack', '../assets/images/product/POK/tins/SSSBM/starter-set-ex-stevens-beldum-metagross-ex.jpg', 15),
  ('Marnie\'s Morpeko & Grimmsnarl EX Booster Pack', 'SSMMG', 3, 3.99, 'Booster Pack', '../assets/images/product/POK/tins/SSMMG/marnie-morpeko-grimmsnarl-ex.png', 25),
  ('Ursula\'s Return Tin', 'UR', 4, 19.99, 'Tin', '../assets/images/product/LOR/tins/UR/ursula-tin.webp', 15),
  ('Modern Horizons 3 Booster Box', 'MH3', 1, 55.00, 'Booster Box', '../assets/images/product/MTG/cards/MH3/mh3-booster-box.webp', 13),
  ('Phantom Nightmare Booster Pack', 'PNBP', 2, 3.99, 'Booster Pack', '../assets/images/product/YGO/packs/phantom-nightmare-booster-pack.jpg', 5),
  ('Uta Starter Deck', 'OP16', 5, 35.99, 'Starter Deck', '../assets/images/product/OP/packs/OP16/uta-starter-deck.webp', 65);
