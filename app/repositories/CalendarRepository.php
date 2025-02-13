<?php

// Requerimos el repositorio principal
require_once __DIR__ . '/Repository.php';

// Requerimos los modelos necesarios
require_once __DIR__ . '/../models/Collection.php';

// Extendemos HomeRepository de Repository
class CalendarRepository extends Repository
{
  public function __construct()
  {
    // Llamamos al constructor padre y, al atributo del padre
    // le damos el atributo que es el nombre de la tabla sobre la que trabajaremos
    parent::__construct();

    $this->tableName = 'eventos';
  }

  // Método para buscar un test por su ID y devolverlo como un objeto Test
  public function getEvents()
  {
    $query = "SELECT idEvento, nombre_evento, fecha_evento, descripcion ,urlImagen FROM $this->tableName ORDER BY fecha_evento ASC";
    $stmt = $this->pdo->prepare($query);
    $stmt->execute();
    $events = $stmt->fetchAll(PDO::FETCH_ASSOC);
    return $events;
  }
}
