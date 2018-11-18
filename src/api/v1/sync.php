<?php

use Slim\Http\Request;
use Slim\Http\Response;


$app->group('/api', function () use ($app) {

    $app->group('/v1', function () use ($app) {

        $app->get('/sync/all', function (Request $request, Response $response, array $args) {
            $operations = \App\Model\Operation::all();
            return $response->withJson($operations);
        });

        $app->get('/sync/create', function (Request $request, Response $response, array $args) {


        });

        $app->get('/sync/update', function (Request $request, Response $response, array $args) {


        });

        $app->get('/sync/delete', function (Request $request, Response $response, array $args) {


        });

    });

});