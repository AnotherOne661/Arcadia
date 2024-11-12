<!DOCTYPE html>
<html lang="en">


<?php

require_once "helper.php";

$requestUri = trim($_SERVER['REQUEST_URI'], '/');
$baseDir = __DIR__ . '/../View/pages/';
$baseStyleDir = __DIR__ . '/../View/styles/';

/*require_once __DIR__ . '/../MODELS/Model.php';
$modelo = new Model();

echo json_encode($modelo);
exit;*/

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

if ($route != 'landing') {
  require_once __DIR__ . "/../View/includes/layout/$layout.php";
} else {
  require_once __DIR__ . "/../View/includes/layout/landingLayout.php";
}

?>

</html>