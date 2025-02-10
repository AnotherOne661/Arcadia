<?php

require_once __DIR__ . '/Model.php';
require_once __DIR__ . '/Product.php';


class Box extends Product
{

  private $numCartas;


  public function __construct($codExpansion, $nombreProductoEn, $idJuego, $precio, $tipo, $urlImagen, $numCartas, $nombreProductoEs = null)
  {
    parent::__construct($codExpansion, $nombreProductoEn, $idJuego, $precio, $tipo, $urlImagen, $nombreProductoEs);
    $this->numCartas = $numCartas;

  }



  public function getNumCartas()
  {
    return $this->numCartas;
  }


}