
  <?php

require_once __DIR__ . '/../app/controllers/HomeController.php';
require_once __DIR__ . '/../app/controllers/SiteController.php';
  require_once __DIR__ . '/../app/controllers/CollectionController.php';
require_once __DIR__ . '/../app/controllers/JsonController.php';
  require_once __DIR__ . '/../app/core/http/Request.php';
  require_once __DIR__ . '/../app/core/http/Response.php';


  $requestUri = trim($_SERVER['REQUEST_URI'], '/');
  $requestUri = explode('?', $requestUri)[0];

  $controller = null;

  $request = new Request();
  $response = new Response($request);

  switch($requestUri){
    case '':
      $controller = new HomeController();
      break;
    case 'contact':
      $controller = new SiteController();
      break;
    case 'collections':
      $controller = new CollectionController();
      break;
    case 'jsontest':
      $controller = new JsonController();
      break;
    default:
      $controller = new HomeController();
      break;
  }

/*
  $baseDir = __DIR__ . '/../View/pages/';

  $route = 'home';
  $layout = 'main';

  if (!empty($requestUri)) {
    $route = $requestUri;
  }

  $file = $baseDir . $route . '.php';
  if (!file_exists($file)) {
    $file = $baseDir . '_404.php';
  }

  ob_start();
  require_once $file;
  $content = ob_get_clean();
  ob_end_clean();

  require_once __DIR__ . "/../View/includes/layout/$layout.php";
  ?>
*/