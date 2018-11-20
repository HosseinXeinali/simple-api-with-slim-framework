<?php

use App\Model\Operation;
use Slim\Http\Request;
use Slim\Http\Response;


$app->group('/api', function () use ($app) {

    $app->group('/v1', function () use ($app) {

        $app->post('/products', function (Request $request, Response $response, array $args) {
            $allPostPutVars = $request->getParsedBody();

            $product = new \App\Model\Product();
            $whitelist = ['name', 'price'];
            foreach ($whitelist as $wl) {
                if ($wl == 'price') $allPostPutVars[$wl] = number_format((float)$allPostPutVars[$wl], 2, '.', '');
                if (isset($allPostPutVars[$wl])) $product->$wl = $allPostPutVars[$wl];
            }
            $productValidator = new \App\Validator\ProductValidator($product);
            if ($productValidator->validate()) {
                if ($product->save()) {
                    $r = ['message' => 'The item was created successfully'];
                    $newResponse = $response->withJson($r, 201);
                    (new Operation)->create(
                        [
                            'type' => 'create',
                            'time' => time(),
                            'product_id' => $product->id
                        ]
                    );
                    return $newResponse;
                }

                $r = ['message' => 'unknown database error in your request'];
                $newResponse = $response->withJson($r, 400);
                return $newResponse;
            }


            $r = ['message' => 'Validation errors in your request', 'errors' => []];
            foreach ($productValidator->getMessages() as $message) {
                $r['errors'][trim($message->getPropertyPath(), '[]')][] = $message->getMessage();

            }

            $newResponse = $response->withJson($r, 400);
            return $newResponse;

        });

        $app->get('/products', function (Request $request, Response $response, array $args) {
            $limit = 20;

            $page = intval($request->getParam('page'));
            ($page <= 0) ? $page = 1 : '';

            $offset = ($page - 1) * $limit;

            $products = $this->db->table('products')
                ->offset($offset)
                ->limit($limit)
                ->get();

            $newResponse = $response->withHeader('Pagination-Count', 100)
                ->withHeader('Pagination-Page', $page)
                ->withHeader('Pagination-Limit', $limit)
                ->withJson($products, 200);

            return $newResponse;
        });

        $app->delete('/products/{id}', function (Request $resquest, Response $response, array $args) {
            $id = intval($args['id']);
            $product = (new App\Model\Product)->find($id);
            if ($product) {
                $product->delete();
                $newResponse = $response->withJson($product, 200);
                (new Operation)->create(
                    [
                        'type' => 'delete',
                        'time' => time(),
                        'product_id' => $product->id
                    ]
                );
                return $newResponse;
            }

            $r = ['message' => 'The item does not exist.'];

            $newResponse = $response->withJson($r, 404);
            return $newResponse;
        });

        $app->put('/products/{id}', function (Request $request, Response $response, array $args) {

            $id = intval($args['id']);
            $product = (new App\Model\Product)->find($id);
            $allPostPutVars = $request->getParsedBody();

            if ($product) {
                $whitelist = ['name', 'price'];
                foreach ($whitelist as $wl) {
                    if ($wl == 'price') $allPostPutVars[$wl] = number_format((float)$allPostPutVars[$wl], 2, '.', '');
                    if (isset($allPostPutVars[$wl])) $product->$wl = $allPostPutVars[$wl];
                }

                $productValidator = new \App\Validator\ProductValidator($product);

                if ($productValidator->validate()) {
                    if ($product->save()) {
//                        $r = ['message' => 'The item was created successfully'];
                        $newResponse = $response->withJson($product, 200);
                        (new Operation)->create(
                            [
                                'type' => 'update',
                                'time' => time(),
                                'product_id' => $product->id
                            ]
                        );
                        return $newResponse;
                    }

                    $r = ['message' => 'unknown database error in your request'];
                    $newResponse = $response->withJson($product, 400);
                    return $newResponse;

                }

                $r = ['message' => 'Validation errors in your request', 'errors' => []];
                foreach ($productValidator->getMessages() as $message) {
                    $r['errors'][trim($message->getPropertyPath(), '[]')][] = $message->getMessage();

                }

                $newResponse = $response->withJson($r, 400);
                return $newResponse;
            }

            $r = ['message' => 'The item does not exist.'];

            $newResponse = $response->withJson($r, 404);
            return $newResponse;
        });

    })
        ->add(function (Request $request, Response $response, $next) {
            (isset($_SERVER['PHP_AUTH_USER'])) ? $usename = $_SERVER['PHP_AUTH_USER'] : $usename = '';
            (isset($_SERVER['PHP_AUTH_PW'])) ? $password = $_SERVER['PHP_AUTH_PW'] : $password = '';
            $cond = 'username = "' . $usename . '" and password = "' . md5($password) . '" ';
            $client = (new App\Model\Client)->whereRaw($cond)->first();
            if ($client) {
                $response = $next($request, $response);
                return $response;
            }

            $r = ['message' => 'Authentication credentials were missing or incorrect'];
            return $response->withJson($r, 401);
        });

});