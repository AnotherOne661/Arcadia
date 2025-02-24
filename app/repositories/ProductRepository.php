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

    $names[1] = isset($names[1]) ? $names[1] : $names[0];

    return new Product($product['codExpansion'], $names[1], $product['idJuego'], $product['precio'], $product['tipo'], $product['urlImagen'], $names[0]);
  }
  // Método para buscar un producto por su ID y devolverlo como un objeto Product
  public function getProductData($id, $nombre)
  {
    $product = $this->getProduct($id, $nombre);

    $tipe = $product->gettipo();
    $cod = $product->getcodExpansion();
    $nombre = '%' . $product->getNombreProductoEn() . '%';

    switch ($tipe) {
      case 'carta':
        $query = "SELECT codExpansion, nombreProducto, idJuego, atributos FROM carta WHERE codExpansion = :cod AND nombreProducto LIKE :nombre";
        $stmt = $this->pdo->prepare($query);
        $stmt->bindParam(':cod', $cod, PDO::PARAM_STR);
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return new Card(
          $product->getcodExpansion(),
          $product->getNombreProductoEn(),
          $product->getIdJuego(),
          $product->getprecio(),
          $product->gettipo(),
          $product->geturlImagen(),
          $result['atributos'] ?? null,
          $product->getNombreProductoEs()
        );

      case 'caja':
        $query = "SELECT codExpansion, nombreProducto, numSobres, idJuego FROM caja WHERE codExpansion = :cod AND nombreProducto LIKE :nombre";
        $stmt = $this->pdo->prepare($query);
        $stmt->bindParam(':cod', $cod, PDO::PARAM_STR);
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return new Box(
          $product->getcodExpansion(),
          $product->getNombreProductoEn(),
          $product->getIdJuego(),
          $product->getprecio(),
          $product->gettipo(),
          $product->geturlImagen(),
          $result['numSobres'] ?? null,
          $product->getNombreProductoEs()
        );

      case 'sobre':
        $query = "SELECT codExpansion, nombreProducto, numCartas, idJuego FROM sobre WHERE codExpansion = :cod AND nombreProducto LIKE :nombre";
        $stmt = $this->pdo->prepare($query);
        $stmt->bindParam(':cod', $cod, PDO::PARAM_STR);
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return new Booster(
          $product->getcodExpansion(),
          $product->getNombreProductoEn(),
          $product->getIdJuego(),
          $product->getprecio(),
          $product->gettipo(),
          $product->geturlImagen(),
          $result['numCartas'] ?? null,
          $product->getNombreProductoEs()
        );
    }
  }



  public function findMany($name = null, $game = null, $expansion = null, $page = -1, $limit = 10)
  {
    $gg = $game == 'all' ? null : $game;
    $ee = $expansion == 'all' ? null : $expansion;

    // Base de la consulta SQL
    $baseQuery = "
        FROM productos p
        JOIN expansiones e ON p.codExpansion = e.codExpansion
        JOIN juegos j ON p.idJuego = j.idJuego
        WHERE 
            (:game IS NULL OR j.nombre_juego LIKE :game)
            AND (:expansion IS NULL OR e.nombreExpansion LIKE :expansion)
            AND (
                :name IS NULL OR p.nombreProducto LIKE :name
                OR p.codExpansion LIKE :name
                OR e.nombreExpansion LIKE :name
            )
    ";

    // Consulta para contar el total de productos
    $countQuery = "SELECT COUNT(*) as total " . $baseQuery;

    // Consulta para obtener los productos
    $productQuery = "
        SELECT 
            p.codExpansion, 
            p.nombreProducto, 
            p.idJuego, 
            p.precio, 
            p.tipo, 
            p.urlImagen, 
            p.descuento
    " . $baseQuery;

    // Agregar límites y desplazamiento si se especifica la paginación
    if ($page > -1) {
      $offset = ($page - 1) * $limit;
      $productQuery .= " LIMIT :limit OFFSET :offset";
    }

    // Preparar las consultas
    $stmtCount = $this->pdo->prepare($countQuery);
    $stmtProducts = $this->pdo->prepare($productQuery);

    // Configurar los parámetros de búsqueda
    $nameParam = ($name !== null) ? '%' . strtolower($name) . '%' : null;
    $gameParam = ($gg !== null) ? '%' . strtolower($gg) . '%' : null;
    $expansionParam = ($ee !== null) ? '%' . strtolower($ee) . '%' : null;

    // Vincular parámetros para la consulta de conteo
    if ($name !== null) {
      $stmtCount->bindParam(':name', $nameParam, PDO::PARAM_STR);
    } else {
      $stmtCount->bindValue(':name', null, PDO::PARAM_NULL);
    }

    if ($game !== null) {
      $stmtCount->bindParam(':game', $gameParam, PDO::PARAM_STR);
    } else {
      $stmtCount->bindValue(':game', null, PDO::PARAM_NULL);
    }
    if ($expansion !== null) {
      $stmtCount->bindParam(':expansion', $expansionParam, PDO::PARAM_STR);
    } else {
      $stmtCount->bindValue(':expansion', null, PDO::PARAM_NULL);
    }

    // Vincular parámetros para la consulta de productos
    $stmtProducts->bindParam(':name', $nameParam, PDO::PARAM_STR);
    if ($game !== null) {
      $stmtProducts->bindParam(':game', $gameParam, PDO::PARAM_STR);
    } else {
      $stmtProducts->bindValue(':game', null, PDO::PARAM_NULL);
    }
    if ($expansion !== null) {
      $stmtProducts->bindParam(':expansion', $expansionParam, PDO::PARAM_STR);
    } else {
      $stmtProducts->bindValue(':expansion', null, PDO::PARAM_NULL);
    }

    // Vincular límites y desplazamiento si se especifica la paginación
    if ($page > -1) {
      $stmtProducts->bindParam(':limit', $limit, PDO::PARAM_INT);
      $stmtProducts->bindParam(':offset', $offset, PDO::PARAM_INT);
    }

    // Ejecutar la consulta de conteo y obtener el total de productos
    $stmtCount->execute();
    $totalRow = $stmtCount->fetch(PDO::FETCH_ASSOC);
    $total = $totalRow['total'];

    // Ejecutar la consulta de productos y obtener los resultados
    $stmtProducts->execute();
    $products = [];

    // Procesar los resultados de la consulta de productos
    while ($row = $stmtProducts->fetch(PDO::FETCH_ASSOC)) {
      $names = explode("|", $row['nombreProducto']);
      $displayName = isset($names[1]) ? $names[1] : $names[0];

      $products[] = new Product(
        $row['codExpansion'],
        $displayName,
        $row['idJuego'],
        $row['precio'],
        $row['tipo'],
        $row['urlImagen'],
        $names[0]
      );
    }

    // Devolver los productos y el total
    return [
      'products' => $products,
      'total' => $total
    ];
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
