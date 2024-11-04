<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Arcadia - Tu tienda TCG</title>
</head>

<body>
  <?php

  require_once "helper.php";

  $requestUri = trim($_SERVER['REQUEST_URI'], '/');
  $baseDir = __DIR__ . '/../View/pages/';
  $baseStyleDir = __DIR__ . '/../View/styles/';

  $route = 'home';
  $layout = 'main';
  $styleFile = 'global';

  if (!empty($requestUri)) {
    $route = $requestUri;
  }

  $file = $baseDir . $route . '.php';
  $styleRoute = $route . '.css';


  if (!file_exists($file)) {
    $file = $baseDir . '_404.php';
  }

  ob_start();
  require_once $file;
  $content = ob_get_clean();

  require_once __DIR__ . "/../View/includes/layout/$layout.php";
  ?>
</body>

</html>