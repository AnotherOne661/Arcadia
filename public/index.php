<?php

require_once __DIR__ . '/../app/controllers/HomeController.php';
require_once __DIR__ . '/../app/controllers/SiteController.php';
require_once __DIR__ . '/../app/controllers/UserController.php';
require_once __DIR__ . '/../app/controllers/CalendarController.php';
require_once __DIR__ . '/../app/controllers/CollectionController.php';
require_once __DIR__ . '/../app/controllers/JsonController.php';
require_once __DIR__ . '/../app/controllers/ContactController.php';
require_once __DIR__ . '/../app/controllers/LandingController.php';
require_once __DIR__ . '/../app/controllers/ErrorController.php';
require_once __DIR__ . '/../app/core/http/Request.php';
require_once __DIR__ . '/../app/core/http/Response.php';


$requestUri = trim($_SERVER['REQUEST_URI'], '/');
$requestUri = explode('?', $requestUri)[0];

$controller = null;

$request = new Request();
$response = new Response($request);

switch ($requestUri) {
  case '':
    $controller = new HomeController($request, $response);
    echo $response->sendHtml($controller->index());
    break;
  case 'home':
    $controller = new HomeController($request, $response);
    echo $response->sendHtml($controller->index());
    break;
  case 'collections':
    $controller = new CollectionController($request, $response);
    echo $response->sendHtml($controller->index());
    break;
  case 'jsontest':
    $controller = new JsonController($request, $response);
    break;
  case 'landing':
    $controller = new LandingController($request, $response);
    echo $response->sendHtml($controller->index());
    break;
  case 'landing-nodb':
    $controller = new LandingController($request, $response);
    echo $response->sendHtml($controller->indexNobd());
    break;
  case 'secret':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->secret());
    break;
  case 'cart':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->cart());
    break;
  case 'login':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->login());
    break;
  case 'logout':
    $controller = new UserController($request, $response);
    echo $response->sendHtml($controller->logout());
    break;
  case 'login-form':
    $controller = new UserController($request, $response);
    echo $response->sendHtml($controller->loginForm());
    break;
  case 'signup':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->signUp());
    break;
  case 'mypage':
    if ($_SESSION['name'] != null) {
      $controller = new SiteController($request, $response);
      echo $response->sendHtml($controller->myPage());

    } else {
      $controller = new SiteController($request, $response);
      echo $response->sendRedirect('/login');
    }
    break;

  case 'signup-form':
    $controller = new UserController($request, $response);
    echo $response->sendHtml($controller->signUpForm());
    break;
  case 'delete-account':
    $controller = new UserController($request, $response);
    echo $response->sendHtml($controller->deleteAccount());
    break;
  case 'edit-account':
    $controller = new UserController($request, $response);
    echo $response->sendHtml($controller->editAccount());
    break;
  case 'learn-ygo':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->learnYgo());
    break;
  case 'learn-mtg':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->learnMTG());
    break;
  case 'learn-lor':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->learnLor());
    break;
  case 'learn-op':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->learnOp());
    break;
  case 'learn-pok':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->learnPok());
    break;
  case 'terms':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->terms());
    break;
  case 'privacy':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->privacy());
    break;
  case 'cookies':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->cookies());
    break;
  case 'contact-form':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->contactForm());
    break;
  case 'calendar':
    $controller = new CalendarController($request, $response);
    echo $response->sendHtml($controller->renderBasic());
    break;
  case 'contact':
    $controller = new ContactController($request, $response);
    echo $response->sendHtml($controller->index());
    break;
  case 'sitemap':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->siteMap());
    break;
  case 'error':
  default:
    $controller = new ErrorController($request, $response);
    echo $response->sendHtml($controller->index());
    break;

}

