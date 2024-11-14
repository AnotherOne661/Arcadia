<?php
require_once __DIR__ . '/../MODELS/connection.php';
require_once __DIR__ . '/../MODELS/Model.php';

$model = new Model();
$fetch = $model->getAllResultsCollections();

header('Content-Type: application/json');
echo json_encode($fetch);
