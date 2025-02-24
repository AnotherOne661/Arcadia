<?php

require_once __DIR__ . '/Model.php';
require_once __DIR__ . '/Product.php';


class Accesory extends Product
{



  public function __construct($codExpansion, $nombreProductoEn, $idJuego, $precio, $tipo, $urlImagen, $nombreProductoEs = null)
  {
    parent::__construct($codExpansion, $nombreProductoEn, $idJuego, $precio, $tipo, $urlImagen, $nombreProductoEs);
  }



}