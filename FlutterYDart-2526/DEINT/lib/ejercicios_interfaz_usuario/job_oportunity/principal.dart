import 'package:flutter/material.dart';
import 'package:deint/ejercicios_interfaz_usuario/job_oportunity/launcher.dart';
import 'package:deint/ejercicios_interfaz_usuario/job_oportunity/central.dart';
import 'package:deint/ejercicios_interfaz_usuario/job_oportunity/end.dart';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Principal",
      initialRoute: "/", // Ruta inicial
      routes: {
        // Rutas de la aplicación
        "/": (context) => Launcher(),
        "/central": (context) => Central(),
        "/end": (context) => End(),
      },
    );
  }
}
