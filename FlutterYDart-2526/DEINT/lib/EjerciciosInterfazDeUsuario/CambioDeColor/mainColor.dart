import 'package:flutter/material.dart';

void main() {
  // runApp es el punto de entrada, ejecuta la aplicación
  runApp(CambiaColor());
}

/**
 * Este widget es el principal, define nuestra aplicación,
 * es una buena práctica que este sea inmodificable, este va a
 * contener o va a llamar al widget que realiza la acción cambiante
 * de cambiar el color en este caso
 */
class CambiaColor extends StatelessWidget {
  // Este es el constructor
  const CambiaColor({super.key});

  // Esta es la función clave para el dibujado del widget
  @override
  Widget build(BuildContext context) {
    /* Crea y devuelve un Widget, aplica los estilos de Google (MaterialApp),
     'home' es lo que se verá en la pantalla principal, el 'title' es el campo
      que utiliza el SO para identificar la aplicación, es la identidad de la
      aplicación*/
    return MaterialApp(title: "Cambia Color", home: CambiaColorPantalla());
  }
}

/* IMPORTANTE: LOS WIDGETS MUTABLES CONSTAN DE DOS ESTRUCTURAS, 'StatefulWidget',
* SU ÚNICA FUNCIÓN ES CREAR LA OTRA ESTRUCTURA (CLASE), EL STATE, ESTE ES EL
* CEREBRO MUTABLE, CONTIENE LA VARIBALE Y LA FUNCIÓN QUE LA CAMBIA (setState) */

/**
 * Aquí definimos el widget cambiante, la pantalla donde vamos a interactuar para
 * que el fondo cambia de naranja a verde y viceversa.
 */
class CambiaColorPantalla extends StatefulWidget {
  // El constructor
  const CambiaColorPantalla({super.key});

  /* Función de los 'StatefulWidget' que su única función es crear y devolver
  * el objeto que contendrá el estado (la variable que cambia), le indicamos
  * que debe de devolver State y que está vinculado al widget 'CambiaColorPantalla' */
  @override
  State<CambiaColorPantalla> createState() => _CambiaColorPantallaState();
}

// La clase realmente importante, esta cambia el estado y contiene la variable
class _CambiaColorPantallaState extends State<CambiaColorPantalla> {
  // La variable color, esta será la que irá cambiando, se declara en verde
  Color _color = Colors.green;

  // Función para dibujar en el widget como ya hemos visto
  @override
  Widget build(BuildContext context) {
    /* Scaffold widget básico de una pantalla de este tipo para crear barra
     superior, fondo, botón flotante, etc. */
    return Scaffold(
      // Color de fondo, va a ser el color verde
      backgroundColor: _color,
      // Creamos un bar con el título pasado y de color gris
      appBar: AppBar(title: Text("COLOR"), backgroundColor: Colors.grey),
      // Creamos un botón flotante, al presionarlo cambia el estado del color
      floatingActionButton: FloatingActionButton(
        // Al presionarlo, este es una función anónima
        onPressed: () {
          // Se modifica el estado del color, este es una función anónima
          setState(() {
            // Dependiendo del color que sea cambiará de un color a otro
            if (_color == Colors.green) {
              _color = Colors.amber;
            } else {
              _color = Colors.green;
            }
            // imprimimos el color en consola al pulsar
            print(_color);
          });
        },
        // Elegimos el icono del botón mediante el widget 'child' dentro del botón
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
