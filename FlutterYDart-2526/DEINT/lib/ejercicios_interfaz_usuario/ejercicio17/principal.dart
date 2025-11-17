import 'package:deint/ejercicios_interfaz_usuario/ejercicio17/color_1.dart';
import 'package:deint/ejercicios_interfaz_usuario/ejercicio17/color_2.dart';
import 'package:deint/ejercicios_interfaz_usuario/ejercicio17/final.dart';
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
        "/": (context) => Color1(),
        "/color2": (context) => Color2(),
        "/final": (context) => Final()
      },
    );
  }
}
