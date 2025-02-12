<?php

// Requerimos pregunta y respuesta
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';

// Creamos Controller como clase abstracta, para que no pueda ser instanciada
abstract class Controller
{
  // Damos el valor por defecto main a la layout que se renderizará
  protected $layout = 'main';

  // Le damos como atributo una Request y una Response
  protected $request;
  protected $response;

  public function __construct($request, $response)
  {
    // Inicializamos Request y Response con los parámetros que nos llegan
    $this->request = $request;
    $this->response = $response;
  }
  // Método vital: este será el segundo más importante, encargándose de renderizar la página
  // toma, en primer lugar, el nombre de la página a renderizar, y, en segundo, un array con sus variables 
  protected function render($view, $data = [])
  {
    // Si no hay una sesión iniciada, iniciamos una
    if (session_status() == PHP_SESSION_NONE) {
      session_start();
    }

    // Extraemos las variables para usarlas en la vista desde el array de $data
    extract($data);

    // Empezamos a escribir la vista
    ob_start();
    // Requerimos la página en sí, y la almacenamos en content
    require_once __DIR__ . "/../views/pages/$view.php";
    $content = ob_get_clean();

    // Volvemos a empezar a escribir la vista que incluye la layout
    ob_start();
    require_once __DIR__ . "/../Views/includes/layout/$this->layout.php";
    // Dado que los demás controladores Extienden de Controller, tendrán la variable $content con su contenido
    return ob_get_clean();
  }
}
