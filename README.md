# README

# Hito 3 - Proyecto Twitter

# Descripción

En este proyecto crearemos un Twitter que cumpla con una serie de características. Para ello,deberás leer y desarrollar cada historia que se describe en los hitos.

# Historia 1

Crear la página /api/news que permita obtener un json con los últimos 50 tweets. La estructura debe ser la siguiente:
{
    id: 1,    
    content: 'este es mi primer tweet',    
    user_id 3,    
    like_count: 10,    
    retweets_count: 20,    
    rewtitted_from: 2

}

Tip: Para lograr esto deberás traer desde la db todos los tweets necesarios; los iterarás para crear, por cada uno, un hash con la info solicitada. Los hashes los almacenarás en una variable del tipo array que será el elemento a transformar posteriormente en la respuesta json.

# Historia 2

Crear la página /api/:fecha1/:fecha2 que entregue un json con todos los tweets entre ambas fechas.

# Historia 3

Se debe poder crear un tweet a través de la API.Para la creación del tweet el usuario deberá utilizar autenticación, sea mediante Devise o Basic Authentication.

Things you may want to cover:

* Ruby version 2.6.6p146 

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
