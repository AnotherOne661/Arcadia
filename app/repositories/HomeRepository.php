<?php

// Requerimos el repositorio principal
require_once __DIR__ . '/Repository.php';

// Requerimos los modelos necesarios
require_once __DIR__ . '/../models/Home.php';

require_once __DIR__ . '/../MODELS/Product.php';

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

  public function findNewProducts()
  {
    $query = "SELECT codExpansion, nombreProducto, idJuego,precio,tipo, urlImagen FROM $this->tableName as p";
    $stmt = $this->pdo->prepare($query);
    $stmt->execute();

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $results = [];
    foreach ($rows as $row) {
      $results[] = new Product($row['codExpansion'], $row['nombreProducto'], $row['idJuego'], $row['precio'], $row['tipo'], $row['urlImagen']);
    }
    return $results;
  }
  public function findTrendingProducts() {}
}
