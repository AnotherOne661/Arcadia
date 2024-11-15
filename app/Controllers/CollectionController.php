<?php

// Requerimos primero el controlador principal
require_once __DIR__ . '/Controller.php';
// Luego las respuestas y peticiones
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';
// Finalmente requerimos el respositorio sobre el que haremos las búsquedas dinámicas
require_once __DIR__ . '/../repositories/CollectionsRepository.php';

class CollectionController extends Controller
{
  private $collectionRepository;

  public function __construct($request, $response)
  {
    // Llamamos al constructor del padre para inicializar las propiedades del controlador
    parent::__construct($request, $response);
    // Creamos instancia del repositorio de Collection y lo asignamos a la variable de esta instancia de HomeController
    $this->collectionRepository = new CollectionRepository();
  }

  // Método que renderiza la vista home, también es donde ejecutaremos las querys dinámicas
  public function index()
  {
    // Esto obtiene el array de objetos Collection
    $collections_mtg = $this->collectionRepository->findCollectionsById(1);
    $collections_ygo = $this->collectionRepository->findCollectionsById(2);
    $collections_poke = $this->collectionRepository->findCollectionsById(3);
    $collections_lor = $this->collectionRepository->findCollectionsById(4);
    $collections_op = $this->collectionRepository->findCollectionsById(5);

    // Render, método de Controller, toma el nombre de la url, seguido del array
    // asociativo con clave: nombre de variable cuando se renderice valor: valor de la variable
    return $this->render('collections', [
      'title' => 'Colecciones',
      'cssFile' => 'collections.css',
      'jsFile' => 'collections.js',
      // Siempre le enviaremos (por lo general) su título propio, su css propio y, en caso de tenerlo
      // un js propio.
      // Dado que es una página dinámica, también le mandaremos la variable Collections, conteniendo el array de objetos Collection
      'collections_poke' => $collections_poke,
      'collections_ygo' => $collections_ygo
    ]);
  }
}
