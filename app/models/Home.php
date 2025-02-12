<?php

// Requerimos modelo para que pueda extender de él
require_once __DIR__ . '/Model.php';

// Creamos una clase llamada Home que tan solo tiene los atributos propios de 
// las columnas de la tabla así como sus getters
class Home extends Model
{
  private $id;
  private $text;

  public function __construct($id, $text)
  {
    $this->id = $id;
    $this->text = $text;
  }

  public function getId()
  {
    return $this->id;
  }

  public function getText()
  {
    return $this->text;
  }
}