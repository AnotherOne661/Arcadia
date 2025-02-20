<?php

// Requerimos el repositorio principal
require_once __DIR__ . '/Repository.php';

// Requerimos los modelos necesarios
require_once __DIR__ . '/../models/Home.php';

require_once __DIR__ . '/../models/ProductsWithExpansion.php';

require_once __DIR__ . '/../models/Event.php';

// Extendemos HomeRepository de Repository
class HomeRepository extends Repository
{
  public function __construct()
  {
    // Llamamos al constructor padre y, al atributo del padre
    // le damos el atributo que es el nombre de la tabla sobre la que trabajaremos
    parent::__construct();

    $this->tableName = 'productos';
  }

  // Método para obtener los nuevos productos, ordenados por fecha de lanzamiento de la expansión
  public function findNewProducts()
  {
    $query = "SELECT p.codExpansion, p.nombreProducto, p.idJuego,p.precio,p.tipo, p.urlImagen, e.nombreExpansion, e.fechaLanzamiento  FROM $this->tableName as p, expansiones as e WHERE p.idJuego=e.idJuego AND p.codExpansion=e.codExpansion ORDER BY e.fechaLanzamiento DESC LIMIT 6";
    $stmt = $this->pdo->prepare($query);
    $stmt->execute();

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $results = [];
    foreach ($rows as $row) {
      // Dividimos el nombre del producto en dos partes, una en español y otra en inglés
      $esName = explode("|", $row['nombreProducto']);
      // Instanciamos los objetos de ProdcutsWithExpansion y los añadimos al array
      $results[] = new ProductsWithExpansion($row['codExpansion'], $esName[1], $row['idJuego'], $row['precio'], $row['tipo'], $row['urlImagen'], $row['nombreExpansion'], $row['fechaLanzamiento'], $esName[0]);
    }
    // Devolvemos el array de instancias de ProductsWithExpansion para que puedan ser mandadas como argumento en la funcioón render
    return $results;
  }
  // Método para obtener los productos más vendidos, ordenados por fecha de lanzamiento de la expansión, como no hay ventas, recoge las más nuevas
  public function findTrendingProducts()
  {
    $query = "SELECT p.codExpansion, p.nombreProducto, p.idJuego, p.precio, p.tipo, p.urlImagen, e.nombreExpansion, e.fechaLanzamiento
    FROM productos as p
    LEFT JOIN expansiones as e ON p.codExpansion = e.codExpansion AND p.idJuego = e.idJuego
    ORDER BY e.fechaLanzamiento DESC
    LIMIT 6";
    $stmt = $this->pdo->prepare($query);
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $results = [];
    foreach ($rows as $row) {
      // Dividimos el nombre del producto en dos partes, una en español y otra en inglés
      $esName = explode("|", $row['nombreProducto']);
      // Instanciamos los objetos de ProdcutsWithExpansion y los añadimos al array
      $results[] = new ProductsWithExpansion($row['codExpansion'], $esName[1], $row['idJuego'], $row['precio'], $row['tipo'], $row['urlImagen'], $row['nombreExpansion'], $row['fechaLanzamiento'], $esName[0]);
    }
    // Devolvemos el array de instancias de ProductsWithExpansion para que puedan ser mandadas como argumento en la funcioón render
    return $results;
  }
  // Método para obtener los productos en oferta, ordenados por fecha de lanzamiento de la expansión
  public function findSaleProducts()
  {
    $query = "SELECT p.codExpansion, p.nombreProducto, p.idJuego, p.precio, p.tipo, p.urlImagen, e.nombreExpansion, e.fechaLanzamiento
    FROM productos AS p
    LEFT JOIN expansiones AS e ON p.codExpansion = e.codExpansion AND p.idJuego = e.idJuego
    WHERE p.descuento IS NOT NULL
    ORDER BY e.fechaLanzamiento DESC
    LIMIT 6";
    $stmt = $this->pdo->prepare($query);
    $stmt->execute();

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $results = [];
    foreach ($rows as $row) {
      // Dividimos el nombre del producto en dos partes, una en español y otra en inglés
      $esName = explode("|", $row['nombreProducto']);
      // Instanciamos los objetos de ProdcutsWithExpansion y los añadimos al array
      $results[] = new ProductsWithExpansion($row['codExpansion'], $esName[1], $row['idJuego'], $row['precio'], $row['tipo'], $row['urlImagen'], $row['nombreExpansion'], $row['fechaLanzamiento'], $esName[0]);
    }
    // Devolvemos el array de instancias de ProductsWithExpansion para que puedan ser mandadas como argumento en la funcioón render
    return $results;
  }
  // Método para obtener las imágenes de los eventos más recientes, ordenados por fecha de evento, para mandarlos para el carrusel
  public function findEventImages()
  {
    $query = "SELECT * FROM eventos ORDER BY fecha_evento DESC LIMIT 5";
    $stmt = $this->pdo->prepare($query);
    $stmt->execute();

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $results = [];
    foreach ($rows as $row) {
      // Instanciamos los objetos de Event y los añadimos al array
      $results[] = new Event($row['idEvento'], $row['nombre_evento'], $row['fecha_evento'], $row['descripcion'], $row['urlImagen']);
    }
    // Devolvemos el array de instancias de Event para que puedan ser mandadas como argumento en la funcioón render
    return $results;
  }
}
