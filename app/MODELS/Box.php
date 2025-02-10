<?php

require_once __DIR__ . '/Model.php';
require_once __DIR__ . '/Product.php';


class Box extends Product
{

  private $numCartas;


  public function __construct($codExpansion, $nombreProducto, $idJuego, $precio, $tipo, $urlImagen, $numCartas)
  {
    parent::__construct($codExpansion, $nombreProducto, $idJuego, $precio, $tipo, $urlImagen);
    $this->numCartas = $numCartas;

  }



  public function getNumCartas()
  {
    return $this->numCartas;
  }


}