<?php

class Card
{
  private $codExpansion;
  private $nombreProducto;
  private $idJuego;
  private $atributos;

  public function __construct($codExpansion, $nombreProducto, $idJuego, $atributos)
  {
    $this->atributos = $atributos;
  }

}