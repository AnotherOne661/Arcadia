<?php

// Requerimos modelo para que pueda extender de él
require_once __DIR__ . '/Model.php';

// Creamos una clase llamada Test que tan solo tiene los atributos propios de 
// las columnas de la tabla así como sus getters
class Product extends Model
{
    private $codExpansion;
    private $nombreProductoEn;
    private $nombreProductoEs;

    private $idJuego;
    private $precio;
    private $tipo;
    private $urlImagen;

    public function __construct($codExpansion, $nombreProductoEn, $idJuego, $precio, $tipo, $urlImagen, $nombreProductoEs = null)
    {
        $this->codExpansion = $codExpansion;
        $this->nombreProductoEn = $nombreProductoEn;
        $this->nombreProductoEs = $nombreProductoEs;
        $this->idJuego = $idJuego;
        $this->precio = $precio;
        $this->tipo = $tipo;
        $this->urlImagen = $urlImagen;

    }

    public function getcodExpansion()
    {
        return $this->codExpansion;
    }

    public function getNombreProductoEn()
    {
        return str_replace("|", "", $this->nombreProductoEn);
    }
    public function getNombreProductoEs()
    {
        return $this->nombreProductoEs;
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
