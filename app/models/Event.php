<?php

// Requerimos modelo para que pueda extender de él
require_once __DIR__ . '/Model.php';

// Creamos una clase llamada Test que tan solo tiene los atributos propios de 
// las columnas de la tabla así como sus getters
class Event extends Model
{
  private $nombre_evento;
  private $fecha_evento;
  private $descripcion;
  private $urlImagen;
  private $idEvento;

  public function __construct($idEvento, $nombre_evento, $fecha_evento, $descripcion, $urlImagen)
  {
    $this->idEvento = $idEvento;
    $this->nombre_evento = $nombre_evento;
    $this->fecha_evento = $fecha_evento;
    $this->descripcion = $descripcion;
    $this->urlImagen = $urlImagen;
  }

  public function getIdEvento()
  {
    return $this->idEvento;
  }
  public function getNombreEvento()
  {
    return $this->nombre_evento;
  }
  public function getFechaEvento()
  {
    return $this->fecha_evento;
  }
  public function getDescripcion()
  {
    return $this->descripcion;
  }
  public function geturlImagen()
  {
    return $this->urlImagen;
  }
}
