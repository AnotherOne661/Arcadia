<?php

// Requerimos primero el controlador principal
require_once __DIR__ . '/Controller.php';
// Luego las respuestas y peticiones
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';
// Finalmente requerimos el respositorio sobre el que haremos las búsquedas dinámicas
// require_once __DIR__ . '/../repositories/LandingRepository.php';

class ContactController extends Controller
{
  private $landingRepository;

  public function __construct($request, $response)
  {
    // Llamamos al constructor del padre para inicializar las propiedades del controlador
    parent::__construct($request, $response);
    $this->layout = 'contactLayout';
    // Creamos instancia del repositorio de Test y lo asignamos a la variable de esta instancia de HomeController
    // $this->landingRepository = new LandingRepository();
  }

  // Método que renderiza la vista home, también es donde ejecutaremos las querys dinámicas
  public function index()
  {

    return $this->render('contact', [
      'title' => 'Arcadia - Tu tienda TCG',
      'cssFile' => 'contact.css',
      'jsFile' => 'contact.js',

    ]);
  }

}
