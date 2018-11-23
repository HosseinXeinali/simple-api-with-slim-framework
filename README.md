**Requirements**
----
* PHP 5.6 or higher
* MySQL 
* cURL
* Ability to write htaccess file for apache mod_rewrite

**Deployment**
----
* upload "simple api with slim framework" to the directory of your choice
* go to the directory of the project and run: composer install 
* go to the root directory of the project insert the db.sql file to your database
* go to the src/settings directory of the project and do config of database and your time zone
* go to the directory of the project and run: composer start
* open the browser http://localhost:8080

**Documentation**
----
* [api documentation](./documentation/api-v1.md)

**Sql Description**
----
* [sql schema description](./documentation/sql-description.md)


