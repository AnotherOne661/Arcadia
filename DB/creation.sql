CREATE DATABASE IF NOT EXISTS arcadia;

USE arcadia;

CREATE TABLE colecciones(
  codColeccion VARCHAR(10),
  nombreColeccion VARCHAR(50),
  fechaCreacion DATE,
  idJuego INT,
  PRIMARY KEY (codColeccion)
);