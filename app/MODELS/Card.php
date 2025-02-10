<?php

require_once __DIR__ . '/Product.php';

class Card extends Product
{
  private $atributos;


  public function __construct($codExpansion, $nombreProducto, $idJuego, $precio, $tipo, $urlImagen, $atributos)
  {
    parent::__construct($codExpansion, $nombreProducto, $idJuego, $precio, $tipo, $urlImagen);
    $this->atributos = $atributos;
  }

  public function getAtributos()
  {
    return $this->atributos;
  }

}