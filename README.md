## Flutter XTREAM MOVIES

Esta es una aplicación de peliculas muy al estilo de [https://www.imdb.com](https://www.imdb.com) que contendra un gran catálogo de peliculas y series de tv, información de actores y buscador, siguiendo el cursor de Fernando Herrera [https://www.udemy.com/course/flutter-ios-android-fernando-herrera/.](https://www.udemy.com/course/flutter-ios-android-fernando-herrera/.) El proposito final es aprender a desarrollar aplicaciones móviles con Flutter y poder desplegarlas en sus respectivas tiendas. 

---

## Levantar el proyecto

Puede levantar el proyecto con visual studio code ejecutando comand + shift + P. Luego "Select Device".

<img src="https://github.com/eivanphils/flutter-app-counter/blob/master/assets/select_device.png" width="500">     

Luego abre el archivo main.dart y presiona F5 o fn + F5 app. 


**Nota**: es importante tener instalado todas las configuraciones necesarias para flutter

[https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)

## Descripción

Esta app contiene una gran variedad de Widgets los cuales son:
- Home de usuarios.
- Home de películas.
  - Carrusel de posters
  - Carrusel infinito de películas populares. 
- Detalle de película seleccionada.
  - Datos de la película.
  - Carrusel del cast.
  - Carrusel de trailers.
  - Detalle del actor seleccionado
- Buscador de peliculas
  - Listado de sugerencias segun la busqueda realizada.

## Paquetes de terceros

En el proyecto se han utilizado algunos paquetes de terceros que fueron de mucha ayuda para la construcción final.

A continuación encontrará la información sobre estos paquetes.

| Paquete    | Explicación |
| ------------- |:-------------:|
| cupertino_icons  | Iconos de cupertino |
| card_swiper | Usado para mostrar un tipo de carrusel |
| http     | Usado para peticiones http |
| provider     | Para impletementar la lógica de escuchar las respuestas de las peticiones http |
| intl     | Usado para formatear las fechas |
| youtube_player_flutter | Usado para incrustar video de youtube |

## Estructura de directorio

| Directorio    | Explicación |
| ------------- |:-------------:|
| assets  | Contiene todas las imagenes png, svg o gif |
| android, ios, web | Contiene todas las configuraciones de la plataforma que genera flutter automáticamente |
| lib     | Contiene toda la lógica de la aplicación |

Luego el directorio lib

| Directorio    | Explicación |
| ------------- |:-------------:|
| helpers   | Contiene configuraciones de funciones de uso común |
| models    | Contiene todas las clases que representan el modelo de un objeto como películas, actor, respuestas de peticiones |
| providers | Contiene todas los providers donde se realizan las peticiones http |
| router    | Contiene todas las configuraciones de las rutas de la aplicación |
| screens   | Contiene todas las clases de cada pantalla de la app |
| theme     | Contiene todas las configuraciones del tema de la app |
| widgets   | Contiene todos los  widgets personalizados que se reutilizan en distintas secciones de la app |


## Capturas de pantalla

<img src="https://github.com/eivanphils/flutter-xtream-movies/blob/master/assets/screenshoots/1.png" width="200">     
<img src="https://github.com/eivanphils/flutter-xtream-movies/blob/master/assets/screenshoots/2.png" width="200">     
<img src="https://github.com/eivanphils/flutter-xtream-movies/blob/master/assets/screenshoots/3.png" width="200">     
<img src="https://github.com/eivanphils/flutter-xtream-movies/blob/master/assets/screenshoots/4.png" width="200">     
<img src="https://github.com/eivanphils/flutter-xtream-movies/blob/master/assets/screenshoots/5.png" width="200">     
<img src="https://github.com/eivanphils/flutter-xtream-movies/blob/master/assets/screenshoots/6.png" width="200">     
<img src="https://github.com/eivanphils/flutter-xtream-movies/blob/master/assets/screenshoots/7.png" width="200">     
<img src="https://github.com/eivanphils/flutter-xtream-movies/blob/master/assets/screenshoots/8.png" width="200">     

https://user-images.githubusercontent.com/1909869/173445991-ea5f8e87-4141-4612-b05e-d0cedeb8f8b7.mp4



https://user-images.githubusercontent.com/1909869/173445940-8f59c009-9d05-4817-8588-cc5bfc868adf.mp4



https://user-images.githubusercontent.com/1909869/173445772-d3a80ace-f31c-4ca7-aa2f-c90082cf98ea.mp4



https://user-images.githubusercontent.com/1909869/173445798-c6365cd8-3930-4939-8914-ba4e31edbc28.mp4



https://user-images.githubusercontent.com/1909869/173445631-2a9f6117-6f22-45ab-a3af-927fc9de07cf.mp4



https://user-images.githubusercontent.com/1909869/173445597-6b9855ed-aa61-4e26-a037-77471fc1ac28.mp4



https://user-images.githubusercontent.com/1909869/173445483-60e27f46-3532-42b5-9ef1-de864bdec504.mp4

