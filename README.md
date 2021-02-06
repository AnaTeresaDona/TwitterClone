# README

## link de Heroku de la app: https://polar-beyond-88065.herokuapp.com/

#Specs del proyecto
#Primera Parte:
Una visita debe poder registrarse utilizando el link de registro en la barra de navegación.
Al registrarse debe ingresar nombre usuario, foto de perfil (url), email y password.
El modelo debe llamarse user.
Si una visita ya tiene usuario deberá utilizar el link de ingreso y llenará los campos: email y password antes de hacer click en ingresar.
Al registrarse o ingresar se le debe redirigir a la página de inicio y mostrar una alerta con el mensaje de "bienvenido".

Una visita debe poder entrar a la página de inicio y ver los últimos 50 tweets.
Cada tweet debe mostrar el contenido, la foto del autor (url a la foto), la cantidad de likes y la cantidad de retweets.
Los modelos debe llamarse tweet y like.
Estos tweets deben estar paginados y debe haber un link llamado "mostrar más tweets". Al presionarlo nos llevará a los siguientes 50 tweets.

Al principio de la página debe haber una formulario que nos permita ingresar un nuevo tweet, al crear un tweet el usuario será redirigido a la página de inicio.
El formulario solo debe mostrarse a los usuarios y no a las visitas.
Se debe validar que el tweet tenga contenido.

Un usuario puede hacer like en un tweet, al hacerlo será redirigido a la página de inicio.
Se debe mostrar un icono distinto para cuando un usuario ha hecho like.
Un usuario no puede hacer dos likes sobre el mismo tweet. Por lo tanto, se le debe quitar el like en el caso de que vuelva a hacer click en el botón.

Un usuario puede hacer un retweet haciendo click en la acción rt (retweet) de un tweet, esto hará que ingrese un nuevo tweet con el mismo contenido, referenciando altweet original.

Haciendo click en la fecha del tweet se debe ir al detalle del tweet y dentro del detalle debe aparecer la foto de todas las personas que han dado like al tweet.
La fecha del tweet debe aparecer como tiempo en minutos desde la fecha de creación, unhoras si es mayor de 60 minutos.

Nota: El proyecto se debe publicar en heroku.


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
