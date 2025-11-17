import 'package:deint/bestiario_mistico/bestiario.dart';
import 'package:deint/bestiario_mistico/crear_bestia.dart';
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
        "/": (context) => Bestiario(),
        "/crear": (context) => CrearBestia()
      },
    );
  }
}
