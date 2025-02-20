<?php

// Requerimos el repositorio principal
require_once __DIR__ . '/Repository.php';

// Requerimos los modelos necesarios

require_once __DIR__ . '/../models/ProductsWithExpansion.php';

// Extendemos LandingRepository de Repository
class LandingRepository extends Repository
{
  public function __construct()
  {
    // Llamamos al constructor padre y, al atributo del padre
    // le damos el atributo que es el nombre de la tabla sobre la que trabajaremos
    parent::__construct();

    $this->tableName = 'ofertas';
  }

  public function findLandingProducts()
  {
    $query = "SELECT p.codExpansion, p.nombreProducto, p.idJuego, p.precio, p.tipo, p.urlImagen, e.nombreExpansion, e.fechaLanzamiento
      FROM $this->tableName as p
      LEFT JOIN expansiones as e ON p.codExpansion = e.codExpansion AND p.idJuego = e.idJuego
      ORDER BY e.fechaLanzamiento DESC
      LIMIT 6";
    $stmt = $this->pdo->prepare($query);
    $stmt->execute();

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $results = [];
    foreach ($rows as $row) {
      $results[] = new ProductsWithExpansion($row['codExpansion'], $row['nombreProducto'], $row['idJuego'], $row['precio'], $row['tipo'], $row['urlImagen'], $row['nombreExpansion'], $row['fechaLanzamiento']);
    }
    return $results;
  }
  public function findTrendingProducts()
  {
  }
}
