<?php

require_once __DIR__ . '/Controller.php';
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';

// Este será el controlador por defecto, que, una vez construida su instancia, tendrá un método para cada página estática
class SiteController extends Controller
{

  public function __construct(Request $request, Response $response)
  {
    parent::__construct($request, $response);
  }

  // en este caso, sobre la página about, tendrá una que use la función render del controlador para mandarle el título de la página y los valores de la página
  public function contact()
  {
    return $this->render('contact', [
      'title' => 'Sobre nosotros',
      'cssFile' => 'contact.css'
    ]);
  }
  public function secret()
  {
    return $this->render('mysteriousstranger', [
      'title' => 'Shhhhh',
      'cssFile' => 'mysteriousstranger.css'
    ]);
  }
}