<?php

namespace Tests\Functional;

use GuzzleHttp\Client;

class ProductTest extends BaseTestCase
{
    /**
     * Test that the index route returns a rendered response containing the text 'SlimFramework' but not a greeting
     */
    public function testCreateValidProduct()
    {
        $client = new Client();

        $response = $client->request('POST', 'http://localhost:8080/simple-api-with-slim-framework/public/api/v1/products', [
            'auth' => ['hossein', 'hossein'],
            'form_params' => [
                'name' => 'iPhone',
                'price' => '900',
            ]
        ]);


        $this->assertEquals(201, $response->getStatusCode());
    }
}