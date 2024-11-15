<?php

// Requerimos el repositorio principal
require_once __DIR__ . '/Repository.php';

// Requerimos los modelos necesarios
require_once __DIR__ . '/../models/Collection.php';

// Extendemos HomeRepository de Repository
class CollectionRepository extends Repository
{
  public function __construct()
  {
    // Llamamos al constructor padre y, al atributo del padre
    // le damos el atributo que es el nombre de la tabla sobre la que trabajaremos
    parent::__construct();

    $this->tableName = 'expansiones';
  }

  // Método para buscar un test por su ID y devolverlo como un objeto Test
  public function findCollectionsById($id)
  {
    $query = "SELECT codExpansion, nombreExpansion, fechaLanzamiento, idJuego, urlImagen FROM $this->tableName WHERE idJuego = :id";
    $stmt = $this->pdo->prepare($query);
    $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    $stmt->execute();

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $results = [];
    foreach ($rows as $row) {
      $results[] = new Collection($row['codExpansion'], $row['nombreExpansion'], $row['fechaLanzamiento'], $row['idJuego'], $row['urlImagen']);
    }
    return $results;
  }

  // Método para buscar todos los tests y devolverlos como un array de objetos Test
  public function findAll()
  {
    $query = "SELECT codExpansion, nombreExpansion, fechaLanzamiento, idJuego, urlImagen FROM $this->tableName";
    $stmt = $this->pdo->prepare($query);
    $stmt->execute();

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $results = [];
    foreach ($rows as $row) {
      $results[] = new Collection($row['codExpansion'], $row['nombreExpansion'], $row['fechaLanzamiento'], $row['idJuego'], $row['urlImagen']);
    }
    return $results;
  }
}
