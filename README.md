# README

Hito 2 (se encuentra en branch hito2)

Historia 1 Modificar la página principal para que, si el usuario ha iniciado sesión, se muestrenúnicamente los tweets de las personas que sigue.Tip: Para conseguir esto se deberá crear un modelo Friend donde agregaremos cadausuario que el current_user siga. Además en este modelo agregaremos la columnafriend_id para relacionar el id de los amigos del current_user con el user_id de cadatweet (para mayor referencia, revisar imagen adjunta). Crear el scope tweets_for_me que recibirá una lista de ids de amigos del current_user yentregará todos los tweets relacionados a sus amigos Se debe mantener la paginación de tweet en 50 por página.

Historia 2 Parte importante del curso implica aprender a revisar y estudiar la documentación de gemas, esuna tarea que uno como profesional nunca deberá dejar de lado ni menospreciar. Por lo mismoes que durante el curso hemos estado haciendo algunos ejercicios relacionados y ahora serequiere que lo pongamos en práctica. Se deberá crear un panel de control utilizando ActiveAdmin que liste todos los usuarios ypueda editarlos, cada usuario aparecerá junto al número de cuentas que sigue, cantidad detweets realizados, cantidad de likes dados y la cantidad de retweets. Además deberánaparecer las acciones de borrar y editar, donde borrar un usuario implica borrar en cascadatodos sus tweets, likes y retweets.Nota: Solo el admin podrá realizar estas tareas.Tip: Podrás acceder a la documentación de la gema ActiveAdmin mediante este link (https://activeadmin.info/documentation.html)

Historia 3Implementar un buscador que pueda buscar tweets, para esto se debe hacer una búsquedaparcial ya que el contenido puede ser solo parte de un tweet.Historia 4Debe permitirse la incorporación de hashtags en los contenidos (#estos #son #ejemplos),cada hashtag debe ser un link a una búsqueda.Nota: La forma más sencilla de crear los hashtags es: 1) Convertir el contenido del tweet enun array, donde el espacio entre palabra y palabra puede ser el elemento de separación. 2)Iterar el array del contenido y revisar si en cada palabra existe un #; si existe se crea el linkcon su correspondiente URL y texto, luego el link se retorna al mismo array; en el caso deque no exista el numeral (#) se retorna al array la palabra completa. 3) Una vez que hemosrevisado el array e insertado los links se vuelve a unir el array para convertirlo en un string.4) Ese string se lo retornamos nuevamente al contenido del tweet.tip: Recuerda que si modificaste la estructura de la base de datos y quieres publicar tu sitio enHeroku, deberás hacer un heroku run rails db:migrate

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
