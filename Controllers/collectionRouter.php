<?php
require_once __DIR__ . '/../MODELS/connection.php';
require_once __DIR__ . '/../MODELS/Model.php';

$model = new Model();

$fetch = $model->getAllResultConnection();

print_r($fetch);