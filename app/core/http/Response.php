<?php

require_once __DIR__ . '/Request.php';


class Response
{
  
  private $request;

  public function __construct($request)
  {
    // Le pasamos la request como argumento
    $this->request = $request;
  }

  // Método para establecer el código de estado HTTP
  public function setStatusCode($statusCode = 200)
  {
    http_response_code($statusCode);
  }

  // Método para enviar un contenido HTML y un código de estado HTTP
  public function sendHtml($content, $code = 200)
  {
    $this->setStatusCode($code);
    // Indicamos que el contenido es html
    header('Content-Type: text/html');
    return $content;
  }
  // Método para enviar un contenido json y un código de estado HTTP
  public function sendJson($data, $code = 200)
  {
    $this->setStatusCode($code);
    // Indicamos que el contenido es json
    header('Content-Type: application/json');
    return json_encode($data);
  }
}