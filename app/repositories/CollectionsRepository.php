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
  public function findById($id)
  {
    $query = "SELECT codExpansion, nombreExpansion, fechaLanzamiento, idJuego FROM $this->tableName WHERE id = :id";
    $stmt = $this->pdo->prepare($query);
    $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    $stmt->execute();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$row) {
      return null;
    }

    return new Collection($row['codExpansion'], $row['nombreExpansion'], $row['fechaLanzamiento'], $row['idJuego']);
  }

  // Método para buscar todos los tests y devolverlos como un array de objetos Test
  public function findAll()
  {
    $query = "SELECT codExpansion, nombreExpansion, fechaLanzamiento, idJuego FROM $this->tableName";
    $stmt = $this->pdo->prepare($query);
    $stmt->execute();

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $results = [];
    foreach ($rows as $row) {
      $results[] = new Collection($row['codExpansion'], $row['nombreExpansion'], $row['fechaLanzamiento'], $row['idJuego']);
    }
    return $results;
  }
}