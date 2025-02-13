<?php

// Requerimos primero el controlador principal
require_once __DIR__ . '/Controller.php';
// Luego las respuestas y peticiones
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';
// Finalmente requerimos el respositorio sobre el que haremos las búsquedas dinámicas
require_once __DIR__ . '/../repositories/CalendarRepository.php';


class CalendarController extends Controller
{
  private $calendarRepository;

  public function __construct($request, $response)
  {
    // Llamamos al constructor del padre para inicializar las propiedades del controlador
    parent::__construct($request, $response);
    // Creamos instancia del repositorio de Collection y lo asignamos a la variable de esta instancia de HomeController
    $this->calendarRepository = new CalendarRepository();

    // Método que renderiza la vista home, también es donde ejecutaremos las querys dinámicas

  }
  public function renderBasic()
  {

    return $this->render('calendar', [
      'title' => 'Calendario De Eventos',
      'cssFile' => 'calendar.css',
      'jsFile' => 'calendar.js'
    ]);
  }
  public function events()
  {
    $events = $this->calendarRepository->getEvents();
    return $this->response->sendJson($events);
  }
}