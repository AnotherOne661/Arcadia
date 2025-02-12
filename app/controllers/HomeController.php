<?php

// Requerimos primero el controlador principal
require_once __DIR__ . '/Controller.php';
// Luego las respuestas y peticiones
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';
// Finalmente requerimos el respositorio sobre el que haremos las búsquedas dinámicas
require_once __DIR__ . '/../repositories/HomeRepository.php';

class HomeController extends Controller
{
  private $homeRepository;

  public function __construct($request, $response)
  {
    // Llamamos al constructor del padre para inicializar las propiedades del controlador
    parent::__construct($request, $response);
    // Creamos instancia del repositorio de Test y lo asignamos a la variable de esta instancia de HomeController
    $this->homeRepository = new HomeRepository();
  }

  // Método que renderiza la vista home, también es donde ejecutaremos las querys dinámicas
  public function index()
  {
    // Esto obtiene el array de objetos Test
    // $tests = $this->testRepository->findAll();
    $new_products = $this->homeRepository->findNewProducts();
    $events_images = $this->homeRepository->findEventImages();
    $sale_products = $this->homeRepository->findSaleProducts();
    $trending_products = $this->homeRepository->findTrendingProducts();


    // Render, método de Controller, toma el nfindombre de la url, seguido del array
    // asociativo con clave: nombre de variable cuando se renderice valor: valor de la variable
    return $this->render('home', [
      'title' => 'Arcadia - Tu tienda TCG',
      'cssFile' => 'home.css',
      'jsFile' => 'home.js',
      'new_products' => $new_products,
      'events_images' => $events_images,
      'sale_products' => $sale_products,
      'trending_products' => $trending_products
      // Siempre le enviaremos (por lo general) su título propio, su css propio y, en caso de tenerlo
      // un js propio.
      // Dado que es una página dinámica, también le mandaremos la variable tests, conteniendo el array de objetos Test
    ]);
  }
}
