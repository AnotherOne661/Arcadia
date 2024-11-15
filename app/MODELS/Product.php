<?php

// Requerimos modelo para que pueda extender de él
require_once __DIR__ . '/Model.php';

// Creamos una clase llamada Test que tan solo tiene los atributos propios de 
// las columnas de la tabla así como sus getters
class Product extends Model
{
    private $codExpansion;
    private $nombreProducto;
    private $idJuego;
    private $precio;
    private $tipo;
    private $urlImagen;

    public function __construct($codExpansion, $nombreProducto, $idJuego, $precio, $tipo, $urlImagen)
    {
        $this->codExpansion = $codExpansion;
        $this->nombreProducto = $nombreProducto;
        $this->idJuego = $idJuego;
        $this->precio = $precio;
        $this->tipo = $tipo;
        $this->urlImagen = $urlImagen;
    }

    public function getcodExpansion()
    {
        return $this->codExpansion;
    }

    public function getnombreProducto()
    {
        return $this->nombreProducto;
    }

    public function getprecio()
    {
        return $this->precio;
    }
    public function gettipo()
    {
        return $this->tipo;
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
