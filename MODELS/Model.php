<?php
require_once __DIR__ . '/connection.php';


class Model
{
    public $con;

    public function __construct()
    {
        // Database connection can be initialized here
        $c = new Connection();
        $c->connect();
        $this->con = $c->getConnection();

    }

    public function getSingleResultCollections($idJuego)
    {

        $query = "SELECT * FROM colecciones WHERE idJuego = :idJuego";
        $stmt = $this->con->prepare($query);
        $stmt->bindParam(':idJuego', $idJuego);
        $stmt->execute();
        return $stmt->fetch();
    }

    public function getAllResultsCollections()
    {

        $query = "SELECT * FROM colecciones";
        $stmt = $this->con->prepare($query);
        $stmt->execute();
        $json = $stmt->fetchAll(PDO::FETCH_ASSOC); // Use PDO::FETCH_ASSOC to get associative arrays
        /*
        // Create the JSON file
        $jsonFilePath = 'collections.json'; // Specify the desired file path
        file_put_contents($jsonFilePath, json_encode($json, JSON_PRETTY_PRINT));
        */
        return json_encode($json, JSON_PRETTY_PRINT);
    }

}
