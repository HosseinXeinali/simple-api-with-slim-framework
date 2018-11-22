***[products](#products)***

***[operations](#operations)***

***[clients](#clients)***

***[chen-diagram](#chen-diagram)***


# <a name="products"></a> **products**
products(#id, name, price)

| field        | type           | extra description  |
| ------------- |:-------------:| -----:|
| id      | int(11) | primary key |
| name      | varchar(100)   |    |
| price | decimal(11, 2)      |     |

![products](./images/products.png "products")

# <a name="operations"></a> **operations**
operations(#id, products_id, type, time)

| field        | type           | extra description  |
| ------------- |:-------------:| -----:|
| id      | int(11) | primary key |
| product_id      | int(11)   |  foreign key   |
| type | varchar(20)      |     |
| time | bigint(20)      |     |

![operations](./images/operations.png "operations")

# <a name="clients"></a> **clients**
clients(#id, username, password)

| field        | type           | extra description  |
| ------------- |:-------------:| -----:|
| id      | int(11) | primary key |
| username      | varchar(255)   |  |
| password | varchar(255)      |     |

![clients](./images/clients.png "clients")


# <a name="chen-diagram"></a> **chen-diagram**

![chen diagram](./images/chen-diagram.png "chen diagram")



