<?php

// Requerimos modelo para que pueda extender de él
require_once __DIR__ . '/Model.php';

// Creamos una clase llamada Test que tan solo tiene los atributos propios de 
// las columnas de la tabla así como sus getters
class Collection extends Model
{
  private $codExpansion;
  private $nombreExpansion;
  private $fechaLanzamiento;
  private $idJuego;
  private $urlImagen;

  public function __construct($codExpansion, $nombreExpansion, $fechaLanzamiento, $idJuego, $urlImagen)
  {
    $this->codExpansion = $codExpansion;
    $this->nombreExpansion = $nombreExpansion;
    $this->fechaLanzamiento = $fechaLanzamiento;
    $this->idJuego = $idJuego;
    $this->urlImagen = $urlImagen;
  }

  public function getcodExpansion()
  {
    return $this->codExpansion;
  }

  public function getnombreExpansion()
  {
    return $this->nombreExpansion;
  }
  
  public function getFechaLanzamiento()
  {
    return $this->fechaLanzamiento;
  }
  
  public function getIdJuego()
  {
    return $this->idJuego;
  }
  public function geturlImagen()
  {
    return $this->urlImagen;
  }
  
}