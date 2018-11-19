**Create a product**
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

**Update a product**
----
  Calling this api url, you will update a  product.
* **URL**

  /api/v1/products/{id}

* **Method:**
  
  `PUT`

*  **URL Params**

   <_If URL params exist, specify them in accordance with name mentioned in URL section. Separate into optional and required. Document data constraints._> 

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

**Delete a product**
----
  Calling this api url, you will delete a  product.
* **URL**

  /api/v1/delete/{id}

* **Method:**
  
  `Delete`

*  **URL Params**

   <_If URL params exist, specify them in accordance with name mentioned in URL section. Separate into optional and required. Document data constraints._> 

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
