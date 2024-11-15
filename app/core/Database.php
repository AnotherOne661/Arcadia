<?php
// La clase Database que nos permitirá crear la conexión
class Database
{
  private static $connection = null;

  private function __construct()
  {
    // Mantenemos el constructor vacío y privado para que no pueda
    // ser instanciada desde fuera de la clase aún sin ser abstracta
    // Dado que a la conexión se entrará por getConnection
  }

  // Método que nos permitirá obtener la conexión
  public static function getConnection()
  {
      // Si la conexión no existe, la creamos
    if (self::$connection === null) {

      // self:: es como acceder a sus atributos privados mismos (como Persona.nombre)

      try {
        // Creamos la conexión a la base de datos
        self::$connection = new PDO('mysql:host=localhost;dbname=arcadia', 'root', '');
        self::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      } catch (PDOException $e) {
        die('Database connection failed ' . $e->getMessage());
      }
    }
    // Devolvemos la conexión
    return self::$connection;
  }

  // Método que nos permitirá cerrar la conexión
  public static function closeConnection()
  {
    if (!is_null(self::$connection)) {
      self::$connection = null;
    }
  }
}