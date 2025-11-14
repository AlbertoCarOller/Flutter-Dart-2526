import 'package:deint/ejercicios_interfaz_usuario/Tarea16/Pantalla1.dart';
import 'package:deint/ejercicios_interfaz_usuario/Tarea16/Pantalla2.dart';
import 'package:deint/ejercicios_interfaz_usuario/Tarea16/Pantalla3.dart';
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
        "/": (context) => Pantalla1(),
        "/pantalla2": (context) => Pantalla2(),
        "/pantalla3" : (context) => Pantalla3()
      },
    );
  }
}
