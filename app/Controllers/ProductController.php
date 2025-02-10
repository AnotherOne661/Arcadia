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
    // Creamos instancia del repositorio de Test y lo asignamos a la variable de esta instancia de HomeController
    $this->productRepository = new ProductRepository();
  }

  // Método que renderiza la vista home, también es donde ejecutaremos las querys dinámicas
  public function index()
  {
    // Esto obtiene el array de objetos Test
    // $tests = $this->testRepository->findAll();

    // Dummy
    $codExpansion = $this->request->get('code');
    $nomProducto = $this->request->get('name');

    $product = $this->productRepository->getProductData($codExpansion, $nomProducto);
    // Verificamos si el producto existe
    // if ($product) {
    //   $this->response->getBody()->write(json_encode($product));
    // } else {
    //   $this->response->getBody()->write(json_encode(['error' => 'Producto no encontrado']));
    // }

    // Render, método de Controller, toma el nfindombre de la url, seguido del array
    // asociativo con clave: nombre de variable cuando se renderice valor: valor de la variable
    return $this->render('product', [
      'title' => $product->getnombreProducto(),
      'cssFile' => 'product.css',
      'jsFile' => 'product.js',
      'product' => $product

      // Siempre le enviaremos (por lo general) su título propio, su css propio y, en caso de tenerlo
      // un js propio.
      // Dado que es una página dinámica, también le mandaremos la variable tests, conteniendo el array de objetos Test
    ]);
  }
}
