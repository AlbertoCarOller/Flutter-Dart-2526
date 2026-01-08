import 'package:flutter/material.dart';

class ScreenDowload2 extends StatefulWidget {
  const ScreenDowload2({super.key});

  @override
  State<ScreenDowload2> createState() => _ScreenDowload2State();
}

class _ScreenDowload2State extends State<ScreenDowload2> {
  // Creamos una variable que va a almacenar por donde va el progress bar
  int numProgress = 0;

  // Creamos la variable donde vamos a almacenar el flujo que se va a ir creando
  Stream<int>? flujo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Descarga 2"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  // Hacemos un setState ya que el StreamBuilder no sabe enterarse del cambio de la variable
                  flujo = generarTiempo(100);
                });
              },
              child: Text("START"),
            ),
            /* StreamBuilder -> Una vez que se tiene un Stream se le pasa a este,
            * en mi caso le paso uno que al principio es null, no se entera de que
            * no es null si no le hago el setState(), a partir de ahí se entera de
            * todos los cambios del Stream, es decir los datos que circulan, si pasa
            * un 1 y después un 2, pues en esa transición al 2 hará un setState() solo */
            StreamBuilder(
              stream: flujo,
              builder: (context, snapshot) {
                // En caso de que no haya empezado el flujo, nono es que es null el flujo
                if (snapshot.connectionState == ConnectionState.none) {
                  return Text(
                    "Esperando a que pulses 'START'",
                    style: TextStyle(fontSize: 30),
                  );
                  // En caso de que haya terminado el flujo
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    "Se ha acabado la carga",
                    style: TextStyle(fontSize: 30),
                  );
                  // El progress bar
                } else {
                  return LinearProgressIndicator(
                    // En caso de que sea null el int, es decir que aún no haya pasado nada le ponemos 0
                    value: snapshot.data != null ? snapshot.data! / 100 : 0,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Esta función va a ir creando el Stream de enteros,
  /// de 1 a 100 con duración de 1 segundo por cada uno
  Stream<int> generarTiempo(int num) async* {
    for (int i = 1; i <= num; i++) {
      await Future.delayed(Duration(seconds: 1));
      // En caso de que el número sea múltiplo de 10
      if (i % 10 == 0) {
        yield i;
      }
    }
  }
}
