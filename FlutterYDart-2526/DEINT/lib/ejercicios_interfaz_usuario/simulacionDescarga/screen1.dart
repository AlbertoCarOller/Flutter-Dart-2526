import 'dart:async';

import 'package:flutter/material.dart';

class ScreenDowload extends StatefulWidget {
  const ScreenDowload({super.key});

  @override
  State<ScreenDowload> createState() => _ScreenDowloadState();
}

class _ScreenDowloadState extends State<ScreenDowload> {
  // Creamos una variable que almacene por donde va el progress
  int numProgress = 0;

  // Creamos el StreamController, que es el controlador de la tubería
  final StreamController<int> streamController = StreamController<int>();

  // Se declara pero aún no se puede crear es necesario crearla con el controller
  StreamSubscription<int>? streamSubscription;

  // Creamos el flujo
  Stream<int>? flujo;

  @override
  void initState() {
    super.initState();
    // El suscripction se crea a partir del controller y la función de stream, listen, que hace que escuche
    streamSubscription = streamController.stream.listen((dato) {
      // En caso de que termine en 0 se actualiza el número del progressBar
      if (dato % 10 == 0) {
        setState(() {
          numProgress = dato;
        });
      }
    });
  }

  @override
  void dispose() {
    // Cerramos los recursos
    streamController.close();
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Descarga"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Le añadimos al controlador el stream con la función .addStream()
                streamController.sink.addStream(generarEspera(100));
              },
              child: Text("START"),
            ),
            // El LinearProgressIndicator va de 0 a 1, por eso dividimos entre 100
            LinearProgressIndicator(value: numProgress / 100),
            Text("$numProgress"),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/screen2");
              },
              icon: Icon(Icons.arrow_forward_ios_sharp),
            ),
          ],
        ),
      ),
    );
  }

  /// Esta función es async*, por lo que es asíncrona,
  /// pero utiliza flujos, es decir son muchos los datos que
  /// va a ir devolviendo poco a poco (introducinedo en el flujo)
  Stream<int> generarEspera(int espera) async* {
    // Recorremos hasta el tiempo de espera que se haya pasado por parámetros
    for (int i = 1; i <= espera; i++) {
      // Esperamos 1 segundo por cada iteración del for
      await Future.delayed(Duration(seconds: 1));
      // Devolvemos (es como un return) el valor al Stream
      yield i;
    }
  }
}
