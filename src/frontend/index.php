<?php

use App\Model\Operation;
use Slim\Http\Request;
use Slim\Http\Response;

$app->get('/', function (Request $request, Response $response, array $args) {
    return $this->view->render($response, 'frontend/index/index.twig', []);
});