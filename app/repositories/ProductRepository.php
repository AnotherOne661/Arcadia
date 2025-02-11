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
    $names = $product['nombreProducto'];
    $names = explode("|", $names);
    return new Product($product['codExpansion'], $names[1], $product['idJuego'], $product['precio'], $product['tipo'], $product['urlImagen'], $names[0]);
  }
  // Método para buscar un producto por su ID y devolverlo como un objeto Product
  public function getProductData($id, $nombre)
  {
    $product = $this->getProduct($id, $nombre);

    $tipe = $product->gettipo();
    $cod = $product->getcodExpansion();
    $nombre = $product->getNombreProductoEn();
    $nombre = '%' . $nombre . '%';
    switch ($tipe) {
      case 'carta':
        $query = "SELECT 'codExpansion', 'nombreProducto', 'idJuego', 'atributos' FROM carta WHERE codExpansion = :cod AND nombreProducto LIKE :nombre";
        $stmt = $this->pdo->prepare($query);
        $stmt->bindParam(':cod', $cod, PDO::PARAM_STR);
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetch();
        // 
        return new Card($product->getcodExpansion(), $product->getNombreProductoEn(), $product->getIdJuego(), $product->getprecio(), $product->gettipo(), $product->geturlImagen(), $result['atributos'], $product->getNombreProductoEs());
      case 'caja':
        $query = "SELECT 'codExpansion', 'nombreProducto', 'numCartas', 'idJuego' FROM caja WHERE codExpansion = :cod AND nombreProducto LIKE :nombre";
        $stmt = $this->pdo->prepare($query);
        $stmt->bindParam(':cod', $cod, PDO::PARAM_STR);
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetch();
        return new Box($product->getcodExpansion(), $product->getnombreProductoEn(), $product->getIdJuego(), $product->getprecio(), $product->gettipo(), $product->geturlImagen(), $result['numCartas'], $product->getnombreProductoEs());

      case 'sobre':
        $query = "SELECT 'codExpansion', 'nombreProducto', 'numCartas', 'idJuego' FROM sobre WHERE codExpansion = :cod AND nombreProducto LIKE :nombre";
        $stmt = $this->pdo->prepare($query);
        $stmt->bindParam(':cod', $cod, PDO::PARAM_STR);
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetch();
        return new Booster($product->getcodExpansion(), $product->getnombreProductoEn(), $product->getIdJuego(), $product->getprecio(), $product->gettipo(), $product->geturlImagen(), $result['numCartas'], $product->getnombreProductoEs());

    }
  }

  public function findAll($page = -1, $game = null, $expansion = null, $limit = 10)
  {
    $gg = $game == 'all' ? null : $game;
    $ee = $expansion == 'all' ? null : $expansion;

    $query = "SELECT p.* FROM $this->tableName p JOIN juegos j ON p.idJuego = j.idJuego JOIN expansiones e ON p.codExpansion = e.codExpansion WHERE 1 = 1";
    if ($gg != null) {
      $query .= " AND j.nombre_juego = :game";
    }

    if ($ee != null) {
      $query .= " AND e.nombreExpansion = :expansion";
    }

    if ($page > -1) {
      $offset = ($page - 1) * $limit;
      $query .= " LIMIT :limit OFFSET :offset";
    }

    $stmt = $this->pdo->prepare($query);

    if ($gg != null) {
      $stmt->bindParam(':game', $gg, PDO::PARAM_STR);
    }

    if ($ee != null) {
      $stmt->bindParam(':expansion', $ee, PDO::PARAM_STR);
    }

    if ($page > -1) {
      $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
      $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
    }

    $stmt->execute();
    $products = [];
    while ($row = $stmt->fetch()) {
      $names = $row['nombreProducto'];
      $names = explode("|", $names);

      $names[1] = isset($names[1]) ? $names[1] : $names[0];

      $products[] = new Product($row['codExpansion'], $names[1], $row['idJuego'], $row['precio'], $row['tipo'], $row['urlImagen'], $names[0]);
    }
    return $products;
  }

  public function findMany($name, $page = -1, $limit = 10)
  {
    $query = "SELECT p.codExpansion, p.nombreProducto, p.idJuego, p.precio, p.tipo, p.urlImagen, p.descuento FROM $this->tableName p JOIN expansiones e ON p.codExpansion = e.codExpansion WHERE p.nombreProducto LIKE :nombre OR p.codExpansion LIKE :nombre OR e.nombreExpansion LIKE :nombre";
    if ($page > -1) {
      $offset = ($page - 1) * $limit;
      $query .= " LIMIT :limit OFFSET :offset";
    }

    $name = strtolower($name);
    $name = '%' . $name . '%';

    $stmt = $this->pdo->prepare($query);

    if ($page > -1) {
      $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
      $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
    }

    $stmt->bindParam(':nombre', $name, PDO::PARAM_STR);

    $stmt->execute();
    $products = [];
    while ($row = $stmt->fetch()) {
      $names = $row['nombreProducto'];
      $names = explode("|", $names);
      $names[1] = isset($names[1]) ? $names[1] : $names[0];
      $products[] = new Product($row['codExpansion'], $names[1], $row['idJuego'], $row['precio'], $row['tipo'], $row['urlImagen'], $names[0]);
    }
    return $products;
  }

  public function findTotalProducts($name)
  {
    $query = "SELECT COUNT(*) FROM $this->tableName p JOIN expansiones e ON p.codExpansion = e.codExpansion WHERE p.nombreProducto LIKE :nombre OR p.codExpansion LIKE :nombre OR e.nombreExpansion LIKE :nombre";
    $name = '%' . $name . '%';

    $stmt = $this->pdo->prepare($query);
    $stmt->bindParam(':nombre', $name, PDO::PARAM_STR);
    $stmt->execute();

    return $stmt->fetchColumn();
  }

  public function countAll($game = null, $expansion = null)
  {
    $gg = $game == 'all' ? null : $game;
    $ee = $expansion == 'all' ? null : $expansion;

    $query = "SELECT COUNT(*) FROM $this->tableName p JOIN juegos j ON p.idJuego = j.idJuego JOIN expansiones e ON p.codExpansion = e.codExpansion WHERE 1 = 1";

    if ($gg != null) {
      $query .= " AND j.nombre_juego = :game";
    }

    if ($ee != null) {
      $query .= " AND e.nombreExpansion = :expansion";
    }

    $stmt = $this->pdo->prepare($query);

    if ($gg != null) {
      $stmt->bindParam(':game', $gg, PDO::PARAM_STR);
    }

    if ($ee != null) {
      $stmt->bindParam(':expansion', $ee, PDO::PARAM_STR);
    }

    $stmt->execute();

    return $stmt->fetchColumn();
  }
  public function getGameNames()
  {
    $query = "SELECT nombre_juego FROM juegos";
    $stmt = $this->pdo->prepare($query);
    $stmt->execute();

    $rows = $stmt->fetchAll(PDO::FETCH_COLUMN);


    return $rows;
  }
  public function getExpansionsByGame($game)
  {
    $query = "SELECT nombreExpansion FROM expansiones WHERE idJuego = (SELECT idJuego FROM juegos WHERE nombre_juego = :game)";
    $stmt = $this->pdo->prepare($query);
    $stmt->bindParam(':game', $game, PDO::PARAM_STR);
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_COLUMN);
    return $rows;
  }
}
