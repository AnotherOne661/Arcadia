<?php

// Requerimos primero el controlador principal
require_once __DIR__ . '/Controller.php';
// Luego las respuestas y peticiones
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';
// Finalmente requerimos el respositorio sobre el que haremos las búsquedas dinámicas

class CartController extends Controller
{

  public function __construct($request, $response)
  {
    // Llamamos al constructor del padre para inicializar las propiedades del controlador
    parent::__construct($request, $response);
    // Sobreescribimos el layout del padre ya que cart tiene el suyo propio
    $this->layout = 'cartLayout';
  }

  // Método que renderiza la vista Del carrito
  public function cart()
  {
    return $this->render('cart', [
      'title' => 'Carrito',
      'cssFile' => 'cart.css',
      'jsFile' => 'cart.js'
    ]);
  }
}
