#ISAAK JOBS: Prueba_Intercam
App Swift, RapidAPI, Búsqueda de Airports by Coordenadas

DESCARGAR PROYECTO

1: descargar el proyecto
2: abrir la carpeta del proyecto y ejecutar o abrir el archivo "Airport.xcodeproj"

Ejecutar la app con un simulador, el diseño deberia mostrarse mejor en un simulador del iphone 11 en la version ios 15.5, ya que fue en el que se baso el diseño de UI, sin embargo puede ejecturarte desde ios 14.0 en adelante tanto en simulador como en dispositivo fisico.

AL CORRER LA APP

Una ves corrida la app en el simulador, la app consta de 3 vistas

1 Interface: ViewController, compuesta por 3 elementos graficos, un textlabel donde muestra el radio en KM, un slider para seleccionar el radio, y un button, para activar la comunicacion con RapidAPI y dar paso al navigationCotroller para cambiar entre las dos siguientes vistas (puntosmapa,listaairports).

2 Interface: PuntosMapController, consta de un mapView el cual muestra los puntos en el mapa basado en el numero de estas obtenidas del RapidAPI y de acuerdo al radio indicado en la interface: 1.

3 Interface: ListaViewController, compuesta de una tabla a la cual se le remplaza su celda original con una personalizada que contendra tanto, el nombre, latitud y longitud de cada airport de acuerdo al radio indicado en la interface: 1.

COMO MANIPULAR LA APLICACION

1: Al haberse instalado al app, ya sea por medio del simulador o en un dispositivo fisico, y al abrirla de inmediato nos solicitara los permisos para poder acceder a nuestra ubicacion en tiempo real, podriamos permitir este acceso una sola vez y cada que se cierre la app y se vuelva a abrir nos pedira otra vez estos permisos. 

Tambien podemos optar por conceder estos permisos mienstras usamos la aplicacion, sea cual sea el tipo de permiso el resultado en el funcionamiento de la aplicacion no se limita ni perjudica.

2: Una vez dados los permisos, la primer vista nos dejara seleccionar el radio en kilometros a partir de nuestra ubicacion actual y podremos visualizarla en pantalla, donde "0" inidica un radio de cero kilometros a partir de nuestra ubicacion en el mapa, o un maximo de "100" cien kilometros de radio.

Al terminar de seleccionar el radio, se debe activar el boton, llamado: "Buscar", de esta manera pasaremos a la siguiente vista.

3: En la vista PuntosMap (seccion Radio), veremos el mapa con dos indicadores, un punto azul: indica nuestra ubicacion en tiempo real, un globo rojo: inidica los puntos donde se encontro un Airport dentro del radio seleccionado., entre mas aplicamos zoom al mapa se podra apreciar como van apareciendo todos los globos rojos en el mapa.

En la vista ListaAirport (seccion Airports), se muestra un listado de todos los airports encontrados dentro del radio seleccionado, mostrando la informacion de estos.

4: Si se desea cambiar el radio en kilometros, bastara con activar el boton en forma de circulo, en la parte superior izquierda de nuestra interface., asi una vez activado podremos nuevamente seleccionar un nuevo radio y mostrar otros resultados.


MY TEST

Ejecute la aplicacion en el simulador indicado, posteriormente seleccione un rango de radio de 0 a 10, mostrando un solo airport encontrado en el mapa y en la lista, y al activar el boton de regresar, cambiando el radio de 0 a 20-22 (entre), obtuve mas de 9 airports encontrados en el mapa y lista. Y regresando una vez mas de 0 a 20-22 (entre), por 0 a 10 km de radio, mostrando nuevamente el primer unico airport en ese rango de radio.


