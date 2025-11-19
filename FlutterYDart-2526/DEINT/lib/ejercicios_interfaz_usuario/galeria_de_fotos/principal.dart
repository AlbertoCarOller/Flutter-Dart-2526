import 'package:deint/ejercicios_interfaz_usuario/galeria_de_fotos/galeria.dart';
import 'package:deint/ejercicios_interfaz_usuario/galeria_de_fotos/login.dart';
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
      routes: {"/": (context) => Login(), "/galeria": (context) => Galeria()},
    );
  }
}
