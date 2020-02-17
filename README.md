# Objetos3D
## Autor

Héctor Henríquez Cabrera

Correo: [hector.henriquez101@alu.ulpgc.es](mailto:hector.henriquez101@alu.ulpgc.es)

Asignatura: Creando Interfaces de Usuario (CIU)

## Introducción

En esta segunda práctica se ha compuesto una aplicación mediante **processing3** un creador de objetos 3D. Consiste  en generar un objeto 3D mediante la creación de una superficie 2D y revolucionar la misma. Se puede añadir todos los puntos que se quieran con el ratón, aunque se añaden el primer y último punto para generar siempre un volumen completo y no una superficie. Una vez creada se verá una figura la cual rotará sobre si misma para ver el resultado, esta rotación se puede controlar con las teclas "+" y "-". Además se puede visualizar una descomposición de la figura si se presiona "s" la cual quitará caras de las generadas, para volver a añadir dichas caras se deberá presionar "w". Por último se  volverá a la primera vista de creación si se pulsa "ENTER".

## Demo

![](.\CreaObjetos\demo.gif)

En la demo se puede apreciar el menú de creación y la visualización de dicho objeto. En dicha visualización se puede observar la figura rotar sobre si misma y las funcionalidades añadidas.

## Implementación

### Librerías

Para la implementación de esta aplicación no se usado ninguna librería,pero se ha usado una aplicación externa para capturar el gif llamada **ScreenToGif**, para que en la inclusión de la imagen se viese cuando se hacía clic y además ver la posición del ratón. Pero esto no es necesario para su reproducción en otro sistema ya que solo se uso para  la inclusión del gif, que serviría de demo, pero a  la hora de probar la aplicación no es necesario tenerlo instalado debido a que no ejecuta nada actualmente (en caso de querer generar un gif  nuevo descomentar las líneas de esta librería) .

### Diseño

Para el diseño de esta aplicación se ha optado por dejar la interfaz lo más clara posible, dado la simplicidad del problema. Aunque se han añadido elementos que ocupan gran parte de la pantalla para dejar claro el manejo de la aplicación. Por lo que se añadió en la vista principal:

* Instrucciones del manejo de la aplicación.
* figura resultante antes de ser revolucionada.
* Puntos escogidos.

Hecho esto se hizo la segunda vista la cual debía mostrar la figura revolucionada, por lo que se añadió a su vista:

* Objeto revolucionado.
* Rotación.
* Ocultación de caras. 

Se ha usado un color de relleno naranja para las cara debido a que es bastante llamativo y destaca sobre el fondo negro. Además de poner las aristas del volumen en blanco para diferenciar entre caras y ver que la creación del objeto es mediante triángulos.

### Funcionalidades

Funcionalidades principales:

* Mostrar los puntos marcados para generar la figura 3D
* Visualización de figura 3D

Una vez hecho eso se procedió a añadir nuevas funcionalidades tales como: 

* Rotar la figura
* Añadir y quitar caras de la figura

## Controles

Todas las interrupciones manejadas en este programa han sido mediante  teclado y ratón, por lo que se han manejado las interrupciones generadas  mediante la función **keyPressed**, la función **keyReleased** y la función **mouseClicked **. Las teclas y acciones consecuentes que las activan son:

|   Tecla   |                      Uso                       |
| :-------: | :--------------------------------------------: |
|   ENTER   |    Teniendo los puntos crear el objetos 3D     |
|   ENTER   | Teniendo el objeto 3D volver a crear uno nuevo |
|     W     |                  Mostrar cara                  |
|     S     |                Ocultar una cara                |
|     +     |                 Aumentar giro                  |
|     -     |                 Disminuir giro                 |
| CLICK IZQ |   Añadir puntos si se esta creando la figura   |



### Bibliografía

- [Guion de prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/22/CIU_Pr_cticas.pdf)
- [processing.org](https://processing.org/)