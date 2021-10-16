<?php
require './Manager/PlanqueManager.php';

// AJAX CODE DELETE
$requestBody = file_get_contents('php://input');
$requestBody = json_decode($requestBody);

$planqueManager = new PlanqueManager();
$planqueManager->delete($requestBody->code);
