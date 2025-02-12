<?php

// Requerimos primero el controlador principal
require_once __DIR__ . '/Controller.php';
// Luego las respuestas y peticiones
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';
// Finalmente requerimos el respositorio sobre el que haremos las búsquedas dinámicas
require_once __DIR__ . '/../repositories/LandingRepository.php';

class LandingController extends Controller
{
  private $landingRepository;

  public function __construct($request, $response)
  {
    // Llamamos al constructor del padre para inicializar las propiedades del controlador
    parent::__construct($request, $response);
    $this->layout = 'landingLayout';
    // Creamos instancia del repositorio de Test y lo asignamos a la variable de esta instancia de HomeController
    $this->landingRepository = new LandingRepository();
  }

  // Método que renderiza la vista home, también es donde ejecutaremos las querys dinámicas
  public function index()
  {
    // Esto obtiene el array de objetos Test
    // $tests = $this->testRepository->findAll();
    $landingProducts = $this->landingRepository->findLandingProducts();

    // Render, método de Controller, toma el nfindombre de la url, seguido del array
    // asociativo con clave: nombre de variable cuando se renderice valor: valor de la variable
    return $this->render('landing', [
      'title' => 'Arcadia - Tu tienda TCG',
      'cssFile' => 'landing.css',
      'jsFile' => 'landing.js',
      'landingProducts' => $landingProducts
      // Siempre le enviaremos (por lo general) su título propio, su css propio y, en caso de tenerlo
      // un js propio.
      // Dado que es una página dinámica, también le mandaremos la variable tests, conteniendo el array de objetos Test
    ]);
  }
  public function indexNobd()
  {
    return $this->render('landing-alt', [
      'title' => 'Arcadia - Tu tienda TCG',
      'cssFile' => 'landing.css',
      'jsFile' => 'landing-alt.js',
    ]);
  }
}
