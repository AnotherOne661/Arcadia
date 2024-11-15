<?php

require_once __DIR__ . '/../core/Database.php';
// Requiere la vase de datos, puesto que creará una conexión

abstract class Repository
{
  // Adquiere las propiedades pdo, que usará para las querys, y tableName que 
  // será la principal para las búsquedas
  protected PDO $pdo;
  protected string $tableName;

  // El constructor usa la función de Database para crear la conexión y asignarla a pdo
  public function __construct()
  {
    $this->pdo = Database::getConnection();
  }
}