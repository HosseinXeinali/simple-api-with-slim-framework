<?php

use App\Model\Operation;
use Slim\Http\Request;
use Slim\Http\Response;


$app->group('/api', function () use ($app) {

    $app->group('/v1', function () use ($app) {
        $app->post('/clients', function (Request $request, Response $response, array $args) {
            $allPostPutVars = $request->getParsedBody();

            $client = new \App\Model\Client();
            $client->username = $allPostPutVars['username'];
            $client->password = md5($allPostPutVars['password']);
            try {
                if ($client->save()) {
                    return $response->withJson($client);
                }
                echo 'not saved!';

            } catch (Exception $e) {
                echo 'error!';

            }

        });
    });

});