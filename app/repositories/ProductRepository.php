<?php

// Requerimos el repositorio principal
require_once __DIR__ . '/Repository.php';

// Requerimos los modelos necesarios
require_once __DIR__ . '/../models/Card.php';
require_once __DIR__ . '/../models/Box.php';
require_once __DIR__ . '/../models/Booster.php';
require_once __DIR__ . '/../models/Product.php';

// Extendemos HomeRepository de Repository
class ProductRepository extends Repository
{
  public function __construct()
  {
    // Llamamos al constructor padre y, al atributo del padre
    // le damos el atributo que es el nombre de la tabla sobre la que trabajaremos
    parent::__construct();

    $this->tableName = 'productos';
  }

  public function getProduct($id, $nombre)
  {
    $query = "SELECT * FROM $this->tableName WHERE codExpansion = :id AND nombreProducto LIKE :nombre";
    $nombre2 = '%' . $nombre . '%';


    $stmt = $this->pdo->prepare($query);
    $stmt->bindParam(':id', $id, PDO::PARAM_STR);
    $stmt->bindParam(':nombre', $nombre2, PDO::PARAM_STR);
    $stmt->execute();

    $product = $stmt->fetch();
    return new Product($product['codExpansion'], $product['nombreProducto'], $product['idJuego'], $product['precio'], $product['tipo'], $product['urlImagen']);
  }
  // Método para buscar un producto por su ID y devolverlo como un objeto Product
  public function getProductData($id, $nombre)
  {
    $product = $this->getProduct($id, $nombre);
    $tipe = $product->gettipo();
    $cod = $product->getcodExpansion();
    $nombre = $product->getnombreProducto();
    switch ($tipe) {
      case 'carta':
        $query = "SELECT 'codExpansion', 'nombreProducto', 'idJuego', 'atributos' FROM carta WHERE codExpansion = :cod AND nombreProducto = :nombre";
        $stmt = $this->pdo->prepare($query);
        $stmt->bindParam(':cod', $cod, PDO::PARAM_STR);
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetch();
        // 
        return new Card($product->getcodExpansion(), $product->getnombreProducto(), $product->getIdJuego(), $product->getprecio(), $product->gettipo(), $product->geturlImagen(), $result['atributos']);
      case 'caja':
        $query = "SELECT 'codExpansion', 'nombreProducto', 'numCartas', 'idJuego' FROM caja WHERE codExpansion = :cod AND nombreProducto = :nombre";
        $stmt = $this->pdo->prepare($query);
        $stmt->bindParam(':cod', $cod, PDO::PARAM_STR);
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetch();
        return new Box($product->getcodExpansion(), $product->getnombreProducto(), $product->getIdJuego(), $product->getprecio(), $product->gettipo(), $product->geturlImagen(), $result['numCartas']);

      case 'sobre':
        $query = "SELECT 'codExpansion', 'nombreProducto', 'numCartas', 'idJuego' FROM sobre WHERE codExpansion = :cod AND nombreProducto = :nombre";
        $stmt = $this->pdo->prepare($query);
        $stmt->bindParam(':cod', $cod, PDO::PARAM_STR);
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetch();
        return new Booster($product->getcodExpansion(), $product->getnombreProducto(), $product->getIdJuego(), $product->getprecio(), $product->gettipo(), $product->geturlImagen(), $result['numCartas']);

    }
  }
}
