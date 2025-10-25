import 'package:flutter/material.dart';

void main() {
  runApp(Practica4v2());
}

class Practica4v2 extends StatelessWidget {
  const Practica4v2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Practiva4V2", home: Dado());
  }
}

class Dado extends StatelessWidget {
  const Dado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estructura principal
      body: Column(
        children: [
          // Fila de arriba
          Expanded(
            child: Row(
              children: [
                // Columna en la que se dive el primer cuadro
                Expanded(
                  child: Column(
                    children: [
                      // Primer cuadro azul
                      Expanded(
                        child: Container(
                          color: Colors.blueAccent,
                        ),
                      ),
                      // Segundo cuadro verde
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                  ),
                )
              ],
            ),
          ),
          // Cuadro rojo de abajo
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
