<?php
require_once __DIR__ . '/connection.php';


class Model {
    public $con;

    public function __construct() {
        // Database connection can be initialized here
        $c = new Connection();
        $c->connect();
        $this->con = $c->getConnection();

    }

    function getSingleResultCollections($idJuego) {
    
        $query = "SELECT * FROM colecciones WHERE idJuego = :idJuego";
        $stmt = $con->prepare($query);
        $stmt->bindParam(':idJuego', $idJuego);
        $stmt->execute();
        return $stmt->fetch();
    }
    
    function getAllResultsCollections() {
    
        $query = "SELECT * FROM colecciones";
        $stmt = $con->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll();
    }

}
