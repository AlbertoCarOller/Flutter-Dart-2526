import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(PalabraSiguiente());
}

class PalabraSiguiente extends StatelessWidget {
  const PalabraSiguiente({super.key});

  @override
  Widget build(BuildContext context) {
    /* ChangeNotifierProvider es una clase de provider que principalmente notifica
    * a todos los widgets de un cambio de variable, debemos de tener una clase
    * estado que esta es la clase que va a almacenar la información de las variables
    * que van a cambiar, van a guardar el estado */
    return ChangeNotifierProvider(
      create: (context) => PalabraSiguienteState(),
      child: MaterialApp(
        title: "PalabraSiguiente",
        // Esta clase define el tema principal de los widgets de MaterialDesing
        theme: ThemeData(
          useMaterial3: true /* useMaterial3: true, indicamos que
         queremos utilizar la última versión de MaterialDesig, la 3 */,
          /* Con esta propiedad le indicamos que utilice una paleta de 30 colores
           para MaterialDesing que se base en el color semilla pasado, en este
            caso el 'orangeAccent' */
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        ),
        home: Siguiente(),
      ),
    );
  }
}

/* Clase estado, guarda el estado de las variables necesarias y puede notificar
 de sus cambios a otros widgets */
class PalabraSiguienteState extends ChangeNotifier {
  /* Con esta clase y función WordPair.random() generamos pares de palabras en
   inglés de forma aleatoria */
  var palabraActual = WordPair.random();

  /**
   * Esta función va a cambiar la palabra y va a notificar a los
   * widgets del cambio
   */
  void changeWord() {
    // Cambiamos la palabra
    palabraActual = WordPair.random();
    // Notificamos a los widgets del cambio
    notifyListeners();
  }
}

class Siguiente extends StatelessWidget {
  const Siguiente({super.key});

  /* IMPORTANTE: El ChangeNotifierProvider SE ENCARGA DE LOS CAMBIOS DE FORMA
   GLOBAL POR LO QUE TENER UN WIDGET QUE CAMBIA DE ESTADO DE FORMA LOCAL ES REDUNDANTE */

  @override
  Widget build(BuildContext context) {
    /* context.watch<PalabraSiguienteState> -> Le dice al widget que debe de
    * escuchar o mirar los cambios realizados para la clase de tipo PalabraSiguienteState
    * (la que contiene los valores), WATCH: REDIBUJA cuando los datos cambian. */
    var appState = context.watch<PalabraSiguienteState>();
    return Scaffold(
      body: Column(
        children: [
          Text("A random AWESOME idea:"),
          Text(appState.palabraActual.asLowerCase),
          ElevatedButton(
            onPressed: () {
              // Cambiamos la palabra al pulsar
              appState.changeWord();
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
