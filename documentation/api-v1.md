***[Product create](#product-create)***

***[Product update](#product-update)***

***[Product delete](#product-delete)***

***[sync all](#sync-all)***

***[sync create](#sync-create)***

***[sync update](#sync-update)***

***[sync delete](#sync-delete)***

# <a name="product-create"></a> **Create a product**
----
  Calling this api url, you will create a new product.
* **URL**

  /api/v1/products

* **Method:**
  
  `POST`

* **Data Params**

   **Required:**
   
   `name=[string]`
   
   `price=[decimal]`


* **Success Response:**
  
  * **Code:** 201 <br />
    **Content:** `{ message : The item was created successfully }`
 
* **Error Response:**

  * **Code:** 401 <br />
    **Content:** `{ message : "Authentication credentials were missing or incorrect" }`
  
  OR

  * **Code:** 400 <br />
    **Content:** `{ message : "Validation errors in your request",
     "errors": {
                 "price": [
                       "The price should be a positive int or decimal."
                        ...
                     ]
                 ...
                } 
             }`
  
  OR
  
  * **Code:** 400 <br />
      **Content:** `{ message : "unknown database error in your request"}`

# <a name="product-update"></a> **Update a product**
----
  Calling this api url, you will update a  product.
* **URL**

  /api/v1/products/{id}

* **Method:**
  
  `PUT`

*  **URL Params**

   **Required:**
 
   `id=[integer]`

* **Data Params**

  None


* **Success Response:**
  
  * **Code:** 200 <br />
    **Content:** `{ product : {name: iPhone, price: 900} }`
 
* **Error Response:**

  * **Code:** 401 <br />
    **Content:** `{ message : "Authentication credentials were missing or incorrect" }`
  
  OR

  * **Code:** 400 <br />
    **Content:** `{ message : "Validation errors in your request",
     "errors": {
                 "price": [
                       "The price should be a positive int or decimal."
                        ...
                     ]
                 ...
                } 
             }`
  
  OR
  
  * **Code:** 400 <br />
      **Content:** `{ message : "unknown database error in your request"}`

# <a name="product-delete"></a> **Delete a product**
----
  Calling this api url, you will delete a  product.
* **URL**

  /api/v1/delete/{id}

* **Method:**
  
  `Delete`

*  **URL Params**

   **Required:**
 
   `id=[integer]`

* **Data Params**

  None


* **Success Response:**
  
  * **Code:** 200 <br />
    **Content:** `{ product : {name: iPhone, price: 900} }`
 
* **Error Response:**

  * **Code:** 401 <br />
    **Content:** `{ message : "Authentication credentials were missing or incorrect" }`
   
  OR
    
    * **Code:** 404 <br />
        **Content:** `{ message : "The item does not exist."}`

# <a name="sync-all"></a> **Sync (created, updated, deleted) products**
----
  Calling this api url, you will get a list of (created, updated, deleted) that should be synced.
* **URL**

  /api/v1/sync/all

* **Method:**
  
  `GET`

* **Success Response:**
  
  * **Code:** 202 <br />
    **Content:** `[
                      {
                          "id": 36,
                          "type": "create",
                          "time": 1542721593,
                          "updated_at": "2018-11-20 17:16:33",
                          "created_at": "2018-11-20 17:16:33",
                          "product_id": 56
                      },
                      {
                          "id": 37,
                          "type": "update",
                          "time": 1542721594,
                          "updated_at": "2018-11-20 17:16:34",
                          "created_at": "2018-11-20 17:16:34",
                          "product_id": 57
                      },
                      ...
                  ]`
 
* **Error Response:**

  * **Code:** 401 <br />
    **Content:** `{ message : "Authentication credentials were missing or incorrect" }`
  
# <a name="sync-create"></a> **Sync created products**
----
  Calling this api url, you will get a list of (created, updated, deleted) that should be synced.
* **URL**

  /api/v1/sync/create

* **Method:**
  
  `GET`

* **Success Response:**
  
  * **Code:** 202 <br />
    **Content:** `[
                      {
                          "id": 36,
                          "type": "create",
                          "time": 1542721593,
                          "updated_at": "2018-11-20 17:16:33",
                          "created_at": "2018-11-20 17:16:33",
                          "product_id": 56
                      },
                      {
                          "id": 37,
                          "type": "create",
                          "time": 1542721594,
                          "updated_at": "2018-11-20 17:16:34",
                          "created_at": "2018-11-20 17:16:34",
                          "product_id": 57
                      },
                      ...
                  ]`
 
* **Error Response:**

  * **Code:** 401 <br />
    **Content:** `{ message : "Authentication credentials were missing or incorrect" }`
  
# <a name="sync-update"></a> **Sync updated products**
----
  Calling this api url, you will get a list of (created, updated, deleted) that should be synced.
* **URL**

  /api/v1/sync/update

* **Method:**
  
  `GET`

* **Success Response:**
  
  * **Code:** 202 <br />
    **Content:** `[
                      {
                          "id": 36,
                          "type": "update",
                          "time": 1542721593,
                          "updated_at": "2018-11-20 17:16:33",
                          "created_at": "2018-11-20 17:16:33",
                          "product_id": 56
                      },
                      {
                          "id": 37,
                          "type": "update",
                          "time": 1542721594,
                          "updated_at": "2018-11-20 17:16:34",
                          "created_at": "2018-11-20 17:16:34",
                          "product_id": 57
                      },
                      ...
                  ]`
 
* **Error Response:**

  * **Code:** 401 <br />
    **Content:** `{ message : "Authentication credentials were missing or incorrect" }`
  
# <a name="sync-delete"></a> **Sync deleted products**
----
  Calling this api url, you will get a list of (created, updated, deleted) that should be synced.
* **URL**

  /api/v1/sync/delete

* **Method:**
  
  `GET`

* **Success Response:**
  
  * **Code:** 202 <br />
    **Content:** `[
                      {
                          "id": 36,
                          "type": "delete",
                          "time": 1542721593,
                          "updated_at": "2018-11-20 17:16:33",
                          "created_at": "2018-11-20 17:16:33",
                          "product_id": 56
                      },
                      {
                          "id": 37,
                          "type": "delete",
                          "time": 1542721594,
                          "updated_at": "2018-11-20 17:16:34",
                          "created_at": "2018-11-20 17:16:34",
                          "product_id": 57
                      },
                      ...
                  ]`
 
* **Error Response:**

  * **Code:** 401 <br />
    **Content:** `{ message : "Authentication credentials were missing or incorrect" }`
  