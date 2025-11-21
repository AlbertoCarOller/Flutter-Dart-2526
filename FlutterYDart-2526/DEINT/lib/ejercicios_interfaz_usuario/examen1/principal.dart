import 'package:deint/ejercicios_interfaz_usuario/examen1/elegir_color.dart';
import 'package:deint/ejercicios_interfaz_usuario/examen1/mapa.dart';
import 'package:deint/ejercicios_interfaz_usuario/examen1/sizeC.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Principal",
      initialRoute: "/",
      routes: {
        "/": (context) => SizeC(),
        "/elegirColor": (context) => ElegirColor(),
        "/mapa": (context) => Mapa()
      },
    );
  }
}
