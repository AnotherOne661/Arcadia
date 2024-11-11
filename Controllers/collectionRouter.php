<?php
require_once __DIR__ . '/../MODELS/connection.php';

function getSingleResult($idJuego) {
    global $pdo;

    $query = "SELECT * FROM colecciones WHERE idJuego = :idJuego";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':idJuego', $idJuego);
    $stmt->execute();
    return $stmt->fetch();
}

function getAllResults() {
    global $pdo;

    $query = "SELECT * FROM colecciones";
    $stmt = $pdo->prepare($query);
    $stmt->execute();
    return $stmt->fetchAll();
}