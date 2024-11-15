<?php
require_once __DIR__ . '/Model.php';
class ProductsWithExpansion extends Model
{
    private $codExpansion;
    private $nombreProducto;
    private $idJuego;
    private $precio;
    private $tipo;
    private $urlImagen;
    private $nombreExpansion;
    private $releaseDate;
    public function __construct($codExpansion, $nombreProducto, $idJuego, $precio, $tipo, $urlImagen, $nombreExpansion, $releaseDate)
    {
        $this->codExpansion = $codExpansion;
        $this->nombreProducto = $nombreProducto;
        $this->idJuego = $idJuego;
        $this->precio = $precio;
        $this->tipo = $tipo;
        $this->urlImagen = $urlImagen;
        $this->nombreExpansion = $nombreExpansion;
        $this->releaseDate = $releaseDate;
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
    public function getnombreExpansion(){
        return $this->nombreExpansion;
    }
    public function getreleaseDate(){
        return $this->releaseDate;
    }
}