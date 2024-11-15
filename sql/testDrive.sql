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

INSERT INTO juegos(idJuego, nombre_juego) VALUES
(1, 'Magic: The Gathering'), (2, 'Yu-Gi-Oh!'), (3, 'Pokémon'), (4, 'Lorcana'), (5, 'One Piece');

INSERT INTO expansiones(codExpansion, nombreExpansion, fechaLanzamiento, idJuego, urlImagen) VALUES 
('SC', 'Stellar Crown', '2024-09-13', 3, '/assets/images/product/POK/sets/Stellar_Crown_Logo.png'), 
('SSPK', 'Surgin Sparks', '2024-11-08', 3, '/assets/images/product/POK/sets/Surging_Sparks_Logo.png');

INSERT INTO expansiones(codExpansion, nombreExpansion, fechaLanzamiento, idJuego, urlImagen) VALUES ('SDWD', 'Blue-Eyes White Destiny', '2025-02-06', 2, '/assets/images/product/YGO/sets/WD.jpg'), ('INFO', 'Infinite Forbidden', '2024-07-18', 2, '/assets/images/product/YGO/sets/INFO.webp') 