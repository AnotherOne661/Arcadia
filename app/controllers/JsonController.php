<?php

require_once __DIR__ . '/Controller.php';
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';

class JsonController extends Controller
{
  // Construimos con la request y la respuesta
  public function __construct($request, $response)
  {
    parent::__construct($request, $response);
  }
  // Tan solo le damos una función índex, de prueba, con un array asociativo (json) para poder ver cómo se renderiza
  public function index()
  {
    return ['name' => 'Aarón', 'age' => 1];
  }
}