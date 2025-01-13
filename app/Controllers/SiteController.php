<?php

require_once __DIR__ . '/Controller.php';
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';
session_start();

// Este será el controlador por defecto, que, una vez construida su instancia, tendrá un método para cada página estática
class SiteController extends Controller
{
  private $userRepository;
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
  public function cart()
  {
    return $this->render('cart', [
      'title' => 'Carrito',
      'cssFile' => 'cart.css',
      'jsFile' => 'cart.js'
    ]);
  }
  public function login()
  {
    return $this->render('login', [
      'title' => 'Login',
      'cssFile' => 'login.css',
    ]);
  }
  public function signUp()
  {
    return $this->render('signup', [
      'title' => 'Sign Up',
      'cssFile' => 'signup.css'
    ]);
  }
  public function myPage()
  {
    return $this->render('mypage', [
      'title' => 'My Page',
      'cssFile' => 'mypage.css'
    ]);
  }
}