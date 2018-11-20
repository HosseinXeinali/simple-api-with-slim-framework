<?php

use Slim\Http\Request;
use Slim\Http\Response;


$app->group('/api', function () use ($app) {

    $app->group('/v1', function () use ($app) {

        $app->get('/sync/all', function (Request $request, Response $response, array $args) {
            $client = $request->getAttribute('client');

            $cond = 'time > ' . $client['sync_time'];
            $items = (new App\Model\Operation())->whereRaw($cond)->get();

            $client->sync_time = time();
            $client->save();

            return $response->withJson($items, 202);
        });

        $app->get('/sync/create', function (Request $request, Response $response, array $args) {
            $client = $request->getAttribute('client');

            $cond = 'type = "create" and time > ' . $client['sync_time'];
            $items = (new App\Model\Operation())->whereRaw($cond)->get();

            $client->sync_time = time();
            $client->save();

            return $response->withJson($items, 202);
        });

        $app->get('/sync/update', function (Request $request, Response $response, array $args) {
            $client = $request->getAttribute('client');

            $cond = 'type = "update" and time > ' . $client['sync_time'];
            $items = (new App\Model\Operation())->whereRaw($cond)->get();

            $client->sync_time = time();
            $client->save();

            return $response->withJson($items, 202);
        });

        $app->get('/sync/delete', function (Request $request, Response $response, array $args) {
            $client = $request->getAttribute('client');

            $cond = 'type = "delete" and time > ' . $client['sync_time'];
            $items = (new App\Model\Operation())->whereRaw($cond)->get();

            $client->sync_time = time();
            $client->save();

            return $response->withJson($items, 202);
        });

    })->add(function (Request $request, Response $response, $next) {
        (isset($_SERVER['PHP_AUTH_USER'])) ? $usename = $_SERVER['PHP_AUTH_USER'] : $usename = '';
        (isset($_SERVER['PHP_AUTH_PW'])) ? $password = $_SERVER['PHP_AUTH_PW'] : $password = '';
        $cond = 'username = "' . $usename . '" and password = "' . md5($password) . '" ';
        $client = (new App\Model\Client)->whereRaw($cond)->first();
        if ($client) {
            $request = $request->withAttribute('client', $client);
            $response = $next($request, $response);
            return $response;
        }

        $r = ['message' => 'Authentication credentials were missing or incorrect'];
        return $response->withJson($r, 401);
    });

});