<?php

require_once __DIR__ . '/Product.php';

class Card extends Product
{
  private $atributos;


  public function __construct($codExpansion, $nombreProductoEn, $idJuego, $precio, $tipo, $urlImagen, $atributos, $nombreProductoEs = null)
  {
    parent::__construct($codExpansion, $nombreProductoEn, $idJuego, $precio, $tipo, $urlImagen, $nombreProductoEs);
    $this->atributos = $atributos;
  }

  public function getAtributos()
  {
    return $this->atributos;
  }

}