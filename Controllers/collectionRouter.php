<?php
require_once __DIR__ . '/../MODELS/connection.php';
require_once __DIR__ . '/../MODELS/Model.php';

$model = new Model();
$fetch = $model->getAllResultsCollections();

header('Content-Type: application/json');
echo json_encode($fetch); // Asegúrate de usar json_encode para convertir el resultado a JSON
?>