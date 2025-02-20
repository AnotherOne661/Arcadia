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
  // Simplemente  una broma
  public function secret()
  {
    return $this->render('mysteriousstranger', [
      'title' => 'Shhhhh',
      'cssFile' => 'mysteriousstranger.css'
    ]);
  }
  // Páginas de inicio de sesión, registro y perfil
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
      'cssFile' => 'signup.css',
      'jsFile' => 'singup.js'
    ]);
  }
  public function myPage()
  {
    return $this->render('mypage', [
      'title' => 'My Page',
      'cssFile' => 'mypage.css',
      'jsFile' => 'mypage.js'
    ]);
  }

  // Páginas de tutoriales de los distintos juegos
  public function learnYgo()
  {
    return $this->render('learn-ygo', [
      'title' => 'Aprender a jugar Yu-Gi-Oh!',
      'cssFile' => 'learn-ygo.css',
    ]);
  }
  public function learnLor()
  {
    return $this->render('learn-lor', [
      'title' => 'Aprender a jugar Lorcana',
      'cssFile' => 'learn-lor.css',
    ]);

  }
  public function learnMTG()
  {
    return $this->render('learn-mtg', [
      'title' => 'Aprender a jugar Magic: The Gathering',
      'cssFile' => 'learn-mtg.css',
    ]);
  }
  public function learnPok()
  {
    return $this->render('learn-pok', [
      'title' => 'Aprender a jugar Pokémon',
      'cssFile' => 'learn-pok.css',
    ]);
  }
  public function learnOp()
  {
    return $this->render('learn-op', [
      'title' => 'Aprender a jugar Otros Juegos de Cartas',
      'cssFile' => 'learn-op.css',
    ]);
  }

  // Páginas de términos y condiciones, política de privacidad, política de cookies, formulario de contacto y mapa del sitio
  public function terms()
  {
    return $this->render('terms', [
      'title' => 'Términos y Condiciones',
      'cssFile' => 'terms.css',
    ]);
  }
  public function privacy()
  {
    return $this->render('privacy', [
      'title' => 'Política de Privacidad',
      'cssFile' => 'privacy.css',
    ]);
  }
  public function cookies()
  {
    return $this->render('cookies', [
      'title' => 'Política de Cookies',
      'cssFile' => 'cookies.css',
    ]);
  }
  public function contactForm()
  {
    return $this->render('contact-form', [
      'title' => 'Contáctanos',
      'cssFile' => 'contact-form.css',
    ]);
  }
  public function siteMap()
  {
    return $this->render('sitemap', [
      'title' => 'Mapa del Sitio',
      'cssFile' => 'sitemap.css',
    ]);
  }
}