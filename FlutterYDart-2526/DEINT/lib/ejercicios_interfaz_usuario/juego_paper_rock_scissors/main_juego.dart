import 'package:flutter/material.dart';
import "package:deint/ejercicios_interfaz_usuario/juego_paper_rock_scissors/juego.dart";
import 'package:deint/ejercicios_interfaz_usuario/juego_paper_rock_scissors/resultado.dart';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Principal",
      // Creamos la ruta principal, esta es la que se inicia primero, no va el home por lo tanto
      initialRoute: "/",
      // Creamos las rutas dándole valores
      routes: {
        // Ruta principal que lleva al Juego principal
        "/": (context) => Juego(),
        // Ruta que lleva al resultado
        "/resultado": (context) => Resultado(),
      },
    );
  }
}
