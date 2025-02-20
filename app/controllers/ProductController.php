<?php

// Requerimos primero el controlador principal
require_once __DIR__ . '/Controller.php';
// Luego las respuestas y peticiones
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';
// Finalmente requerimos el respositorio sobre el que haremos las búsquedas dinámicas
require_once __DIR__ . '/../repositories/ProductRepository.php';

class ProductController extends Controller
{
  private $productRepository;

  public function __construct($request, $response)
  {
    // Llamamos al constructor del padre para inicializar las propiedades del controlador
    parent::__construct($request, $response);
    // Creamos instancia del repositorio de Product y lo asignamos a la variable de esta instancia de ProductRepository
    $this->productRepository = new ProductRepository();
  }

  // Método que renderiza la vista de un solo producto, también es donde ejecutaremos las querys dinámicas
  public function index()
  {
    // Esto está obteniendo los datos del get tanto del codigo como del nombre
    $codExpansion = $this->request->get('code');
    $nomProducto = $this->request->get('name');

    // Esto obtiene los datos del producto
    $product = $this->productRepository->getProductData($codExpansion, $nomProducto);

    return $this->render('product', [
      'title' => $product->getnombreProductoEn(),
      'cssFile' => 'product.css',
      'jsFile' => 'product.js',
      'product' => $product,
    ]);
  }
  // Método que renderiza la vista de todos los productos que coincidan con los filtros
  public function findMany()
  {
    // Obtenemos los datos de los filtros mediante el get de la URL
    $name = $this->request->get('name');
    $game = $this->request->get('game') ?? 'all';
    $expansion = $this->request->get('expansion') ?? 'all';
    $page = $this->request->get('page') ?? 1;

    // Obtenemos los nombres de los juegos y las expansiones que coinciden con el filtro de juego
    $gameNames = $this->productRepository->getGameNames();
    $expansions = $this->productRepository->getExpansionsByGame($game);

    // Creamos un array vacío para los productos y un contador de productos
    $products = [];
    $totalProducts = -1;

    // Hacemos la búsqueda dinámica en el repositorio y obtenemos los productos y el número total de productos
    $result = $this->productRepository->findMany($name, $game, $expansion, $page);
    $products = $result['products'];
    $totalProducts = $result['total'];

    // Renderizamos la vista de los productos filtrados con los datos obtenidos
    return $this->render(
      'filteredproducts',
      [
        'title' => 'Productos',
        'cssFile' => 'filteredproducts.css',
        'jsFile' => 'filteredproducts.js',
        'products' => $products,
        'totalProducts' => $totalProducts,
        'games' => $gameNames,
        'expansions' => $expansions,
      ]
    );
  }
}
