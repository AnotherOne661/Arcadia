<?php

require_once __DIR__ . '/../app/controllers/HomeController.php';
require_once __DIR__ . '/../app/controllers/SiteController.php';
require_once __DIR__ . '/../app/controllers/CollectionController.php';
require_once __DIR__ . '/../app/controllers/JsonController.php';
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
  case 'contact':
    $controller = new SiteController($request, $response);
    echo $response->sendHtml($controller->contact());
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
  default:
    $controller = new ErrorController($request, $response);
    echo $response->sendHtml($controller->index());
    break;
}

