<?php

// Requerimos primero el controlador principal
require_once __DIR__ . '/Controller.php';
// Luego las respuestas y peticiones
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';
// Finalmente requerimos el respositorio sobre el que haremos las búsquedas dinámicas

class ErrorController extends Controller
{
  private $errorRepository;

  public function __construct($request, $response)
  {
    // Llamamos al constructor del padre para inicializar las propiedades del controlador
    parent::__construct($request, $response);
  }

  public function index()
  {


    return $this->render('error', [
      'title' => 'error',
      'cssFile' => 'error.css',

    ]);
  }
}
